Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C08CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQZCSWIkq0q2ReGwxmhVuhlEhZmcR8EJEbCIIBVg9Jw=; b=FmOEhTVtmu+3ONVKyAKkmSVw0z
	32IMdBuoO3SMMWeXIUGP+XdaS7ALpPvWlfWRfBxqQnU2UGV3z+bNAA+xrax4zZ2gMoZF645IYNhXD
	vel/gEj2iayU636EVUoQizbhKflW9bZ2P2AboQY1xPca89u5WmU2s7KZ8Dke/DeqBptftV0fSuxim
	lslB/miUci/YLgGCZ04rAOGLh6HlaZs52dzNEqbY/xqfoPjgd0aJe8rfww0yn0dTzsP+l/63Bz4q4
	bBWyHpybMAtkr9rxPvNlDtwHQBQS6ouKWa9xowBr7VMU9UhvLWmYG0KOqPz1JffPv+VZczV17CZAN
	Qm8WpOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE8T-0000000COke-1zFg;
	Tue, 05 Aug 2025 09:39:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDzs-0000000CMBw-3q9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B75E5C3FEF;
	Tue,  5 Aug 2025 09:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A532C4CEF0;
	Tue,  5 Aug 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754386216;
	bh=5UL00lu4xZn/SVf3QC30fPZtl2/7wiyTldeA5ZwXXoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UisXez2SMuX7vliFgFd7tUEQG80nciTOaO7y238OZvizTdN0nOEfxJjHul/rCwGZ2
	 9WvAOO5qiyikZs5itcJisc41sR067BEFLsvtfQdDNSVCsMqYSnpAEwb9DO/GLuCzzC
	 OZSSLh4Q6w2ieMGyDcuOVd+uoAbONiyMx4QdmmrtBsVi7uDLAy0L2FI9PTOXtV266a
	 z1khto4C0dRIOWYVo0EH4NjXL7xZYRYPDU13TW75av+o/Juzm1LeIp29r8xx0WGX+8
	 V3tohp9cziypxtyXUOJSn2IdDzPwPdwK1Pc71EyniohDq6CiolXQeE847ym1qkr8eV
	 /SwevBaw52jhQ==
Date: Tue, 5 Aug 2025 11:30:11 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v5: Minor clean-ups/fixes
Message-ID: <aJHPI8xRtleEx+3r@lpieralisi>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_023016_996238_829107BB 
X-CRM114-Status: GOOD (  18.84  )
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

On Fri, Aug 01, 2025 at 09:58:17AM +0200, Lorenzo Pieralisi wrote:
> A trivial fix for a kbot reported issue and two clean-ups
> discovered after the initial series was queued for v6.17;
> now that the driver code is merged I am sharing them.
> 
> Only patch (1) is a fix, the two others are cleaning the code up
> and removing useless constructs.
> 
> The series apply cleanly on top of this three-patch series [1] fixing
> some exit path issues with the gic-v5 driver that should also
> be considered for merging please (I reviewed it and tested it [2]):

Hi Thomas, Marc,

thank you for reviewing and pulling these fixes, please also consider
fixes in [1] below that are still current, Dan sent them before the
series was queued for -next and I reviewed/tested them (in particular
patch (3) - others are obvious).

Thanks,
Lorenzo

> 
> [1] https://lore.kernel.org/lkml/670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain/
> [2] https://lore.kernel.org/lkml/aHoU8sKPuyzEFRIn@lpieralisi/
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> ---
> Lorenzo Pieralisi (3):
>       irqchip/gic-v5: iwb: Fix iounmap probe failure path
>       irqchip/gic-v5: iwb: Remove module boilerplate
>       irqchip/gic-v5: Remove IRQD_RESEND_WHEN_IN_PROGRESS for ITS IRQs
> 
>  drivers/irqchip/irq-gic-v5-its.c |  1 -
>  drivers/irqchip/irq-gic-v5-iwb.c | 14 +++-----------
>  2 files changed, 3 insertions(+), 12 deletions(-)
> ---
> base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
> change-id: 20250731-gic-v5-fixes-6-17-949eae3c5594
> 
> Best regards,
> -- 
> Lorenzo Pieralisi <lpieralisi@kernel.org>
> 

