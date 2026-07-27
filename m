Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA83C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ba+XUfHk5sTBHTvrJqU/mJvlFZUAaiNKTUr3mPtMRJQ=; b=qLvzIoOewyHbSV/m+zdIGXtNjG
	EvEfMPpkmN5B60GnMwBq/Ywjnx5L8l4IgaYqwZJbvzsbjoOuYCNr2gDMJoWrE6f9az8WCKbRClm48
	NuHWMc73YFVqe67ZUPFJRpxIdji52t+tHr4N0NFQsNVU5Bd+lhnn3Cnp+LlXOoY0PEijudshSGGz2
	18uJYrYsA54vlNJ7hoTAUPBhUPvUh5MU76UIaKiDYK4aypaERh/EU2cKStZs5uWwrLR1qcSa3iL58
	Brs1Ynuwyt0+p7du0jfk2nAmwge6ZMlYeg9ezIu8HOlQH5Facadd3oAXM1FPWKEnuqqGljnmoFX3Q
	R4Td+paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRKw-00000003mbn-3jxt;
	Mon, 27 Jul 2026 19:50:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRKv-00000003mbh-0L6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:50:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72F1760008;
	Mon, 27 Jul 2026 19:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256F21F000E9;
	Mon, 27 Jul 2026 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785181804;
	bh=ba+XUfHk5sTBHTvrJqU/mJvlFZUAaiNKTUr3mPtMRJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnBe1dViytCFVEUrnW+7nwx7XMOEmJ0Vb74Bp6lZaodHqE4JGO0+z465c6w1mxU9a
	 ppATO/iHChrg9RpT3MHIFPGG2QFGoUGIRIFLSQVaEqFiJTH5lKdJW1sSPKyW/+zgpn
	 pOsdFHnx4BAfvbXqCoJWRJfAF2qd4X8sNnsSERL1ij8Nn8gdTVwV0v3BEdTC0VFgQ+
	 rgeoi9juEBRHOhpV4IsQ/xFBi37U+ZtvR/iJHX1Bs6ukEdLc1OAipRIG74Ee/JWvlJ
	 D2N+tf5jXyxkOsKJ9jBmlXj0ONPdwFpmNAQYlcaBd+g7ru+dksxrQsFW5S8rqM+26l
	 hwDzQbVT40apw==
Date: Mon, 27 Jul 2026 20:49:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] firmware: arm_scpi: reject DVFS OPP count above
 MAX_DVFS_OPPS
Message-ID: <20260727-practical-chachalaca-of-perfection-7bcf42@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
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

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
> any larger value from the SCP firmware. The shared-memory reply only holds
> MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
> and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).
> 
> Reject zero and out-of-range counts in one check and return -EINVAL.
> 

This fails to apply, you need to rebase to the latest.

-- 
Regards,
Sudeep

