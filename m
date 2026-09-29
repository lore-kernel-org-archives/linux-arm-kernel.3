Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5669BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kaL8yN3QljuQSjvdkWYP0iZEH5AUWpebqZtTfgcbUk=; b=04UTsrslTGwUIsrvAdQy6DYvUp
	uqGOAoTAJKvxezK8EU0n5njrqZuGAuR1Y6Zvk5mcKDXBkP16mdYum6c7mqNIm5rWpxMf7QgQm6NlZ
	qm6zj9NGCH4Z1WNK89J2EnkQ+kg/RHJEsG3ZEWvr4ZWBJROTtB93AkTVoUtpJtzLQS/uxWmEsc2Wc
	Fei+J61lqcJuSVZRGQlhmpQ0DzvgKTpRa1gkScRwUk/KwsvfEptILqTGxELS5veNUTBlJRZjcLkgC
	4lUORHGrbnOYTrK4qqyFmUAA7NcieJ2/OtCvj8Or5im4GkFIBRGuHQ1NHwZfxHYtHrcnOjDrr2cJo
	nmMQyAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTRB-00000002pbd-2aHc;
	Tue, 29 Sep 2026 08:43:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTRA-00000002pbX-1KvE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:43:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDD6B60A5A;
	Tue, 29 Sep 2026 08:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585C51F00893;
	Tue, 29 Sep 2026 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671423;
	bh=/kaL8yN3QljuQSjvdkWYP0iZEH5AUWpebqZtTfgcbUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bzlXAIlq46fGXbmD+F4bJWYZ3lFZKM4eDA4r2hRZSE4rs0lKPVBsJkbq/tcnkG5A/
	 iW74M5k3IsLMB1L/Wq+5oy2mKaFXjgeHnl/fcJ/EaQx00BmmQlP2KQi4PenT/npHrp
	 aS2AycOTRRjvtq2ovyxu5B00KWem0qNvE54FGOodZBWrEppQLaLUs330Q1qpkfHgfv
	 r6U7bAdE7z8r8iMlIbXqxCbz1ZfIEh3pgvRRjYSQkshkl/ZgaJagDRb1FekZPVYotH
	 x994/INRNVw6Imhqj9sfkEFiiuwbaNV5WNExL+WAL4QN2CKD2P4cqelf+vFqM0p4Q/
	 SaQbUHKrIaepw==
Date: Tue, 29 Sep 2026 10:43:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 10/11] iommu/arm-smmu-v3: Add IRQ mapping
 -EPROBE_DEFER handling
Message-ID: <art6OOFPXggDIet9@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
 <arrtFFtK7KgQfr0z@hu-ashoraj-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arrtFFtK7KgQfr0z@hu-ashoraj-lv.qualcomm.com>
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

On Mon, Sep 28, 2026 at 03:41:24PM -0700, Ashok Raj wrote:
> On Fri, Sep 25, 2026 at 09:48:09AM +0200, Lorenzo Pieralisi wrote:
> > With the advent of GICv5, IRQs mapping can fail if the interrupt
> > controller the wired SMMU interrupts are routed to has not probed
> > yet when the SMMU driver probes.
> > 
> > Handle -EPROBE_DEFER gracefully for IRQ mappings failures.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 5732f3ba0122..1832389916a4 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -5562,18 +5562,26 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >  	/* Interrupt lines */
> >  
> >  	irq = platform_get_irq_byname_optional(pdev, "combined");
> > +	if (irq == -EPROBE_DEFER)
> > +		return dev_err_probe(dev, irq, "failed to get combined IRQ\n");
> >  	if (irq > 0)
> >  		smmu->combined_irq = irq;
> >  	else {
> >  		irq = platform_get_irq_byname_optional(pdev, "eventq");
> > +		if (irq == -EPROBE_DEFER)
> > +			return dev_err_probe(dev, irq, "failed to get eventq IRQ\n");
> >  		if (irq > 0)
> >  			smmu->evtq.q.irq = irq;
> >  
> >  		irq = platform_get_irq_byname_optional(pdev, "priq");
> > +		if (irq == -EPROBE_DEFER)
> > +			return dev_err_probe(dev, irq, "failed to get priq IRQ\n");
> >  		if (irq > 0)
> >  			smmu->priq.q.irq = irq;
> >  
> >  		irq = platform_get_irq_byname_optional(pdev, "gerror");
> > +		if (irq == -EPROBE_DEFER)
> > +			return dev_err_probe(dev, irq, "failed to get gerror IRQ\n");
> >  		if (irq > 0)
> >  			smmu->gerr_irq = irq;
> >  	}
> 
> minor: 
> 
> Maybe consolidate the multiple if (irq == -EPROBE_DEFER) parts and
> consolidate the return to one place?

Yes that can be done, not even sure the different log strings are worth having
in the first place.

Again, the whole series aim is an RFC to understand what's best to implement
the deferral mechanism, I patched the consumer drivers just for completeness.

Thanks,
Lorenzo

