Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20722C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whRgp3wvSKBBEUJMGeOWLZtsJTJPIULmsdHD9fX4zZM=; b=Ll3PYKfM+kIADV30vSa70ZEHlK
	WKsETs5rwXrI3S4ILnGdRmkGWiRBu9K0LDVVGhe6TNBh3CWoaMcQPFPCpSD/W2H0xxjhB5M5l2m4e
	OblMjjOBmACD7dE+tL1+xO6RI26w/mm6BIE4HwKNzBds4EZ+7zOqVh0r+qR3fddz4T2BTj3SD3qIZ
	zObMjiMqyzLKt991Oke0emhIPwsu9p7GPy5jyGFOkEwF11I6au9C9ex4TZLVXWF1XT3a7aaFEgr8O
	K9FqGyBGaHJDzFSAGK+R4RNcYrl7HyxmUUUy3cVDMXCvyrAggFU2PMC3VTCc9bN7t1sGMRmOY0/AV
	YDj/RqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7ZX-0000000D0oC-0tPL;
	Wed, 30 Apr 2025 13:33:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7TH-0000000CzzN-0RCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93F48A4AACD;
	Wed, 30 Apr 2025 13:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDFCC4CEE9;
	Wed, 30 Apr 2025 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746019650;
	bh=Yn79ILWkMhejVZU/NmRTknuHJiU3am0yYKmjKtjhyMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjM9kVLc1KgEXTTKxa4ljsBfos0w3g7vvcQ0tSiDuZuK2s4/oLdusZuYCRieTQ+3N
	 A+FRHX8M0lf1TFd7TzvX8J1CAkM5tUev2yoWChU3sGPjDICFWAh2/fkJ8yFVigUZxj
	 NYBoLiXWJZf0zw/me2ZSp+kMgoH3O1Fjb1ozQ4LXU4Eqh4QiUICwiP71rgYjxtdrdY
	 5cWJsSyuJ9NwHZu2QtI3+PB4EInJth0oP3x4GNlIthd5VOPRBQMNNYRdkjMpS7C8LD
	 KjeapLDglBb2g81eW8rxdOvN15bqWsjISlgQaUjMZ7bcJd5G6yydNPGctWGQ6rGucD
	 /fiiBvqav0Eyw==
Date: Wed, 30 Apr 2025 15:27:22 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBIlOrqLtbB5e7B/@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c31j20i.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_062731_282003_F04603C5 
X-CRM114-Status: GOOD (  39.05  )
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

On Wed, Apr 30, 2025 at 12:57:01PM +0100, Marc Zyngier wrote:
> On Thu, 24 Apr 2025 11:25:32 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
> > order to support wired interrupts that cannot be connected directly
> > to an IRS and instead uses the ITS to translate a wire event into
> > an IRQ signal.
> > 
> > An IWB is a special ITS device with its own deviceID; upon probe,
> > an IWB calls into the ITS driver to allocate DT/ITT tables for its
> > events (ie wires).
> > 
> > An IWB is always associated with a single ITS in the system.
> > 
> > An IWB is connected to an ITS and it has its own deviceID for all
> > interrupt wires that it manages; the IWB input wire number is
> > exposed to the ITS as an eventID. This eventID is not programmable
> > and therefore requires special handling in the ITS driver.
> > 
> > Add an IWB driver in order to:
> > 
> > - Probe IWBs in the system and allocate ITS tables
> > - Manage IWB IRQ domains
> > - Handle IWB input wires state (enable/disable)
> > - Add the required IWB IRQchip representation
> > - Handle firmware representation to Linux IRQ translation
> > 
> > Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/Makefile         |   2 +-
> >  drivers/irqchip/irq-gic-v5-its.c |  68 ++++++--
> >  drivers/irqchip/irq-gic-v5-iwb.c | 356 +++++++++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-gic-v5.c     |   2 +
> >  drivers/irqchip/irq-gic-v5.h     |  28 +++
> >  5 files changed, 437 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 4280395e3bdff7858102f0b4eaaea1121cace52f..7bfb2369fbe494a64b72308d95ae33de93c6b8c6 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -37,7 +37,7 @@ obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
> >  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
> >  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> >  obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
> > -obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o
> > +obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o irq-gic-v5-iwb.o
> >  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
> >  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
> >  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > index da349b4709cc5ec8978859237838f039389ca4a1..b5eb4dbfe2296dc6620889eb9291b542cae4aeb6 100644
> > --- a/drivers/irqchip/irq-gic-v5-its.c
> > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > @@ -786,9 +786,8 @@ static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *i
> >  	return dev ? dev : ERR_PTR(-ENODEV);
> >  }
> >  
> > -static struct gicv5_its_dev *gicv5_its_alloc_device(
> > -				struct gicv5_its_chip_data *its, int nvec,
> > -				u32 dev_id)
> > +struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
> > +					     int nvec, u32 dev_id, bool is_iwb)
> >  {
> >  	struct gicv5_its_dev *its_dev;
> >  	int ret;
> > @@ -815,6 +814,7 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  	its_dev->device_id = dev_id;
> >  	its_dev->num_events = nvec;
> >  	its_dev->num_mapped_events = 0;
> > +	its_dev->is_iwb = is_iwb;
> >  
> >  	ret = gicv5_its_device_register(its, its_dev);
> >  	if (ret) {
> > @@ -827,9 +827,11 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  
> >  	/*
> >  	 * This is the first time we have seen this device. Hence, it is not
> > -	 * shared.
> > +	 * shared, unless it is an IWB that is a shared ITS device by
> > +	 * definition, its eventids are hardcoded and never change - we allocate
> > +	 * it once for all and never free it.
> 
> I'm not convinced the IWB should be treated differently from any other
> device. Its lifetime is not tied to its inputs, so all that's needed
> is to probe it, get a bunch of interrupts, and that's about it.

I need to check again how this works for devices requesting wires
from an IWB if we don't allow ITS device sharing.

> The other thing is that the IWB really is a standalone thing. It
> shouldn't have its fingers in the ITS code, and should only rely on
> the core infrastructure to get its interrupts.
> 
> As much as I dislike it, the MBIGEN actually provides a decent example
> of how this could be structured.

We wrote that code already, I should have posted it. An MBIgen can
programme the eventids it sents to the ITS, an IWB can't. So yes,
I can make an IWB MBIgen like but the ITS code has to know it is
allocating an IRQ for an IWB - one way or another, the eventids
are not programmable.

I will try to post a v3 with the code in it so that I can get flamed
and find a solution to this niggle.

Thanks,
Lorenzo

