Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08263EF5866
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frkemgU9lOuWrlvJZcJGE4IUo5AVpuBfTur1mWHNZ/s=; b=42IcdxDGDf12rcwksKUzZ7EtNE
	9cOGbmKA9IV34nctYVYQ5WJslD07VwlBu3lmd0rEPJdCnP4WHRnFcQlLfaMxw2e0FHn9lDoqvwHpd
	IsY8asYxp8SPCU7aMnzIRUWqZqgeQNqvTGIvvXmgZoqGhdzS42MU+CRQntMH7KopK77Sqqw9xiQA8
	Njpej03kW7SxBG7lL8LUIUQN1FnGthx3a9qBFzhbGDSJ2oAIcm2RDNhbSq6q08B3lgw896AGqOVPe
	gWt/VjvVYMCL8KBm6FptPfG5UeCar5fzRazqcifZ5UZHwaI6r8PwZva5SbAnSTLK2cg4D8XDukPM0
	NXpHBABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDTa-000000061hl-2Y2m;
	Sun, 08 Mar 2026 12:43:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDTZ-000000061he-1e5m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 12:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62F7060054;
	Sun,  8 Mar 2026 12:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F0CC116C6;
	Sun,  8 Mar 2026 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772973796;
	bh=rijJq2R9AvF8Q0orBIE2wu/c9resUGk6A92zGBn4nLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qNJ48+bHxfI3DHheMBt6ekTvT4N1f3S6jR88kLkyNyWVvWlPjGMkbSNAsHgbPaBW7
	 lVMhFpVdhd9YXeiPAUyTT76PRCVNmGToDZZ3kvuM4Ev5N1RSskXVJQ4vn4uhRDITES
	 FExNXNyya4J+shOTmKpb3Rjsm9MzYfZGED/88twwYfREZQRuNf5Uq2vnR86nExuqPx
	 wZmsrKB5OPtqaotHSPY+Pxr+c+6VBPLSECgSQI7uE/zxxmUGhScf2LfVyr6M/ExxUB
	 kBF5WumY8+H+cetjY/G3sowSz/CLHkPrusRU9DIYqVneszQfxUQy0uXU1j97szZNDu
	 wSXv0Yc5c73cQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: remove vm_id argument in ffa_rxtx_unmap()
Date: Sun,  8 Mar 2026 12:41:10 +0000
Message-ID: <177297346232.1083246.15337951377438309305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304120953.847671-1-yeoreum.yun@arm.com>
References: <20260304120953.847671-1-yeoreum.yun@arm.com>
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

On Wed, 04 Mar 2026 12:09:53 +0000, Yeoreum Yun wrote:
> According to the FF-A specification [0], section 13.7 (FFA_RXTX_UNMAP),
> w1 must be zero when called from a guest:
> 
>   - w1: ID of the VM that allocated the RX/TX buffer. Only valid
>         in the Non-secure physical FF-A instance. MBZ otherwise.
> 
> The w1 field is only meaningful when FFA_RXTX_UNMAP is invoked
> from the hypervisor.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!
(wih some rewording of commit message)

[1/1] firmware: arm_ffa: remove vm_id argument in ffa_rxtx_unmap()
      https://git.kernel.org/sudeep.holla/c/a4e8473b7751

--
Regards,
Sudeep


