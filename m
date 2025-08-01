Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F74C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XViwbJWgbIu86zN3sUfdgksnysWSo6dBDfzdxEIlhi0=; b=FWYt3l7elGhQUa9mSZg5/NXOOj
	MIjq7R8ZCPNXJ6uQ/fpLwrg7Y8X5O7GTQXLJ6R+BP/LWQhyokW5/Wrg9bqMcYkFYPEK5drd8QMg1M
	/B6Kgs4TqN0plaI9kRgu3QKTCgSvwR25wKpDpmbERJvRTYxs62s3f8AUTHvkJ9muA3pdLEO8Y73tY
	BW3JB46T6nJpozGY5zxh+wKwfQjQ943QRRMJgkDKctpyi/ER8+GidQOG/L/4g8qiskKCeQSUAl5xJ
	YqeQU8znanRZCTVEqN5DETQ/QEVpvKs5iuaKcTmGAuOJ/U5X/VsQPajgR1hhfXtBPexHtKOfn1bhx
	tYJ9fRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqNU-00000006Ay0-2BEU;
	Fri, 01 Aug 2025 14:04:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqJv-00000006ARr-0Npd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64EAD61139;
	Fri,  1 Aug 2025 14:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8757CC4CEF8;
	Fri,  1 Aug 2025 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754056874;
	bh=1A0vKq6aLyn928rq+rEroQrfD5FWW0QJIKoi9NpxWDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNi39Z27XOtOYfhgN5Ub2eAx5kpsGAuTxmwMUBwfEjqfBW3BFQbcRxy0Eh1l0Je8l
	 SjJdF/jNlwn2UzmIyeb5YAzy3KgaB/AyiS1sY6WYM8x29ZmoggBWZ3SvfrS1K2+Nhd
	 UT3dtwVpBvI7OkNLTlBNgPfFlfLBh+VsDwnMUhF9GAfJK4Mkp5t6Zkriwvo6Gyuh4A
	 Jq/6/lqJcPLki7/VM6q0GXje61SfXII/sMxoYTPdxUzKoXOeFEj76yQP63wqQ2M8uf
	 AhmBNb4pZ4jtFZg8jjRGUGzrzKL0klu74psO2SzsvQoM+SYKlvGPwWjLIFBy/r5k/3
	 4e5WAuxMAPgqw==
Date: Fri, 1 Aug 2025 16:01:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/gic-v5: Remove IRQD_RESEND_WHEN_IN_PROGRESS
 for ITS IRQs
Message-ID: <aIzIpbQOcxmWOwvs@lpieralisi>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
 <20250801-gic-v5-fixes-6-17-v1-3-4fcedaccf9e6@kernel.org>
 <86seib6x7b.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86seib6x7b.wl-maz@kernel.org>
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

On Fri, Aug 01, 2025 at 01:30:32PM +0100, Marc Zyngier wrote:
> On Fri, 01 Aug 2025 08:58:20 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > GICv5 LPI interrupts have an active state hence they cannot retrigger
> > while the IRQ is being handled.
> > 
> > Therefore setting IRQD_RESEND_WHEN_IN_PROGRESS for GICv5 ITS
> > interrupts provides no benefit and it is useless (and confusing),
> > it solves an issue that cannot happen.
> 
> This doesn't read very well. How about:
> 
> "Therefore, setting the IRQD_RESEND_WHEN_IN_PROGRESS flag on LPIs
>  is pointless, as the situation this flag caters for cannot happen".

Yes it is clearer, I can respin a v2 unless Thomas can update the log
please while applying it ? Just let me know.

Thanks,
Lorenzo

> > Remove it.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/irq-gic-v5-its.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > index 340640fdbdf6..9290ac741949 100644
> > --- a/drivers/irqchip/irq-gic-v5-its.c
> > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > @@ -973,7 +973,6 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
> >  		irqd = irq_get_irq_data(virq + i);
> >  		irqd_set_single_target(irqd);
> >  		irqd_set_affinity_on_activate(irqd);
> > -		irqd_set_resend_when_in_progress(irqd);
> >  	}
> >  
> >  	return 0;
> > 
> 
> With that,
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

