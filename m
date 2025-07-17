Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC58FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjftrVTiWvP1wxeKI6MFeYswHLpkghPYM3PuSgIzQWc=; b=0i79BcYWTxazV6jmdgf3WcNFea
	HEZW8r+EA4JV8klQ0ezNBkSPAgJmiqaeOAaNRAs11/QZx03XYdXlRVMPvslG6aaPt1tpYisfU6ZHW
	val8IvxqyGR5Z5h8YfTwfzdsDI2wNEpOJm1LKS2EGBxUo9mt7SeNdE5wiSr/NSkUzHxPzkn2DA+gL
	XE0ur1uk6ArpISlMYdeF7K0H3o5Lun/FtPcqymVXgKDQxEuT7jbH78OJgSboHc0p/Fk35KPCihraT
	Ac3M9Rl0qRy7C9puej8MwCNbcWEiPVhdNhxJRgQTp4t1Cs+FZFl1An3RyGuOLi377v0NvWhQDzfsP
	jdiZnjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIyz-00000009Qpv-3X3e;
	Thu, 17 Jul 2025 07:24:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIhr-00000009Nc9-0WQ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4435E601DF;
	Thu, 17 Jul 2025 07:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DDAC4CEEB;
	Thu, 17 Jul 2025 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752736022;
	bh=j9t7kSWuSxq5WnXpDlCMrUBxIWgTFqJjoe9S/Cz/rRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hiE6zT+5kGBFyM2dVDyrhEEwBmlPhG+WnaYKzHoeTGT1QZ+VAo47aBx5Lk8hxHFCp
	 PNqNOK9PpnPytalEhpc5cyTMTSi5zhczpJzRNPxD51fjtoGd2xY3TGUCxCwo4dz0ta
	 YidAlY4GXENk8MboR7mVmmN6qugsHFhm0CVRxmOhJ0KGOTDf8PjeL2fDcLFS+joxl0
	 AwQQYcgOxXXsCWM3i84I3ldi05snpJZtuMT5uPS1WNHvykFGwG2uYYvFYkC4ISkffy
	 IxRyFOBBzMKeINOvNJtjwa4Gs17NWTCQqVs3U0rQ3dTIvLz3JIja5tUYDu23H0sfD7
	 ps8kp9QFijQVg==
Date: Thu, 17 Jul 2025 09:06:57 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v5: Fix some static checker issues
Message-ID: <aHihEUNIPd3AVL96@lpieralisi>
References: <7feeb4d2-1033-47ba-8730-150993491ec2@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7feeb4d2-1033-47ba-8730-150993491ec2@sabinyo.mountain>
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

On Wed, Jul 16, 2025 at 02:37:16PM -0500, Dan Carpenter wrote:
> These are few things that Smatch complained about.  I have not tested
> these patches.  Patch 3 in particular probably needs to be reviewed
> more carefully.

Thanks a lot Dan for reporting (and fixing) them. I had a look
at the patches, [1-2] are obviously correct, patch 3 seems correct
too albeit it could be split in two and I need to test the error
handling loop.

I don't know at this stage what's best wrt applying them (where and
how).

Thanks again,
Lorenzo

> 
> Dan Carpenter (3):
>   irqchip/gic-v5: Delete a stray tab
>   irqchip/gic-v5: Fix forever loop in gicv5_its_create_itt_two_level()
>     error handling
>   irqchip/gic-v5: Fix error handling in gicv5_its_irq_domain_alloc()
> 
>  drivers/irqchip/irq-gic-v5-irs.c |  2 +-
>  drivers/irqchip/irq-gic-v5-its.c | 18 +++++++++++++-----
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> -- 
> 2.47.2
> 

