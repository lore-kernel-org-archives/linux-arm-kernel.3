Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F520F513F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HttHfmPLfKw/PRzSj1cxNeP4kAvyYdZVvCLalDid7Do=; b=hVUZsSnf6M1pwN1NlVFNXw5NFy
	AujP/ZFLa6QFuJ+vetLAi2speS2yd5SaGT0lAtbEsuwZqjpSJFT71nI2UQBRVT42PwoYEfmlCjBtT
	idUfH076b5CKFZHX6kdsbBftxaI4vkayzLpic2W8TuTerWKGqXK7CLWcI2p1ehem3X+97aKF/Th+W
	pknQLqC3zos6m8phAb1SBXEPo531WqB0ZtJHZ8TKiuAHZ0L94MA79p82b6ApwWKoDPZA+uQsKLsen
	t7AR77t3VAfOn9ZntzYgQJWhPK/I9004aLv9hDaHZDyAUmxxcwCec1rq6TVUZvmxVa1FFzie2bG68
	/tuE2kWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDfz-00000006293-0QRB;
	Sun, 08 Mar 2026 12:56:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDfy-0000000628x-2nuG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 12:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEA5060054;
	Sun,  8 Mar 2026 12:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A229C19423;
	Sun,  8 Mar 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974565;
	bh=zheaREXa3/SztyapPG2qTsQZeAzWrb9Y+f1J2mfH5R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wv+JoF12V4+ZpX4kaj9qRE3tnJzmO4cGX9WRCSC22GF8W9dm92C6Xsgk/5XDx99q+
	 Ya8DQpg24UcdrUVCAtY7gyBWmpEDA2fDMqd4la0QcJRzozACorIP4HqaeVPQw4woJG
	 25Fdwzmvk+9gmbffeODZwMV8iRCBNZvW5x1CGx56VTzF6Xq+P9KKJlqJQH2eYVrfLp
	 vclU7ijfwwFnsBXut4sVOqPxhPY8q33AqE1OejEAmJDBDSbjp4fC26jpWHym8rBotu
	 UxBlIcjDt3jHQEcQoDcK7qh8K6oNiefwftUAPXZIizgCTssuE0MS/CAHw50ThzO8WN
	 vxfRu6WmteKfA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error path
Date: Sun,  8 Mar 2026 12:55:59 +0000
Message-ID: <177297451748.1087321.15158816110689424363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305131011.541444-1-cristian.marussi@arm.com>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 05 Mar 2026 13:10:11 +0000, Cristian Marussi wrote:
> Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> registration for unsupported events") the call chains leading to the helper
> __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> get an handler for the requested event key, while the current helper can
> still return a NULL when no handler could be found or created.
> 
> Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Fix NULL dereference on notify error path
      https://git.kernel.org/sudeep.holla/c/555317d61001
--
Regards,
Sudeep


