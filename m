Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB8C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q22An07Dm/cfkOmUAJDd/V0Kbs9QV2rJTs/dXgsgrD4=; b=zupC09pKapJx3kR8x6fjaKUX07
	IFecMEPZt4Wbonmq5aKKGJuA67kkHVigIECXqSnrFOnJoUo1osJikPugPXETKK0RKzMGZEi2wHvjV
	A7DDlDloLVqPcR94bNvF3WvY7qEPAbz11/oYjZyXeg1JUZAUD0pAbVhNtb0Mr9gTGvX4ZVgAV4PuO
	XUYwWRkkLc//H63mEd9lL8/uT803c8l/kvmziTg4SIferh4C977KZmSocpHO3giuYynEkNPhZ5hhK
	aGxHE2i9hp3dGoid5BAsQuRhvGDUg3UFaM8j1fSJNqe8soJrUpLpOeGUulovosVABgKUTjZ39/QMF
	Xie22YZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEv3-0000000GMKi-31h6;
	Fri, 24 Jul 2026 12:22:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEv2-0000000GMKU-1jDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:22:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D94D41B3F;
	Fri, 24 Jul 2026 12:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414A61F000E9;
	Fri, 24 Jul 2026 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784895744;
	bh=q22An07Dm/cfkOmUAJDd/V0Kbs9QV2rJTs/dXgsgrD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eaElYRVRKvcE01aMdYlx2g6qcIVZYUTDefnaZvLwcm1WlHqVTr545YIBuhFncM3mX
	 tNL4/beM1KYRFlNwc4aqsbD+ro+Dupvf+b9NtnYMXxy3efT0f0YTPW2nxKrNHD+XCs
	 TavZDPX9PfIn26zWk0lgWrCGUXfMvy+zWDOJDwqaMcZrVOrnFKINybGLq3mh31w1bk
	 h+CXBPo2BNUIptjSqfkPXfQG7gW0UBV+nntMMq1pRKdhCIEvLx05QL7MpeONt57nTc
	 sTR51c9o3EoC9pKa1Hc44T0CSphnjBMMmqz4ZjQyjLadp3myiytTzYCzLZClCRjwDD
	 STmhTnXKHSwLA==
Date: Fri, 24 Jul 2026 13:22:18 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
Message-ID: <20260724-romantic-stoic-hippo-3f897b@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-9-andre.przywara@arm.com>
 <20260724-imposing-lurking-toucanet-cfe22c@sudeepholla>
 <9d5fd63a-5e9d-4e44-8f63-864764caf20d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d5fd63a-5e9d-4e44-8f63-864764caf20d@arm.com>
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

On Fri, Jul 24, 2026 at 01:17:41PM +0200, Andre Przywara wrote:
> Hi Sudeep,
> 
> many thanks for having a look!
> 
> On 7/24/26 11:55, Sudeep Holla wrote:
> > On Thu, Jul 23, 2026 at 05:54:52PM +0200, Andre Przywara wrote:
> > > The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> > > alternative way of accessing the "Memory System Components" (MSC) in an
> > > MPAM enabled system.
> > > 
> > > Normally the MSCs are MMIO mapped, but in some implementations this
> > > might not be possible (MSC located outside of the local socket, MSC
> > > mapped secure-only) or desirable (direct MMIO access too slow or needs
> > > to be mediated through a control processor). MPAM-fb standardises a
> > > protocol to abstract MSC accesses, building on the SCMI protocol.
> > > 
> > > Add functions that do an MSC read or write access by redirecting the
> > > request through a firmware interface. For now this done via an ACPI
> > > PCC shared memory and mailbox combination.
> > > 
> > > Since the protocol used is only a small subset of the full SCMI spec,
> > > and the SCMI protocol has no full ACPI support anyway, open-code the
> > > (simple) SCMI message generation, for just the fields we need.
> > > 
> > > [1] https://developer.arm.com/documentation/den0144/latest
> > > 
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >   drivers/resctrl/Makefile        |   2 +-
> > >   drivers/resctrl/mpam_devices.c  |  27 ++++-
> > >   drivers/resctrl/mpam_fb.c       | 197 ++++++++++++++++++++++++++++++++
> > >   drivers/resctrl/mpam_internal.h |  20 ++++
> > >   include/linux/arm_mpam.h        |   2 +-
> > >   5 files changed, 240 insertions(+), 8 deletions(-)
> > >   create mode 100644 drivers/resctrl/mpam_fb.c
> > > 
> > > diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> > > index 4f6d0e81f9b8..097c036724e9 100644
> > > --- a/drivers/resctrl/Makefile
> > > +++ b/drivers/resctrl/Makefile
> > > @@ -1,5 +1,5 @@
> > >   obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
> > > -mpam-y						+= mpam_devices.o
> > > +mpam-y						+= mpam_devices.o mpam_fb.o
> > >   mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
> > >   ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> > > diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> > > index e2cb884eacf4..b8108ed4b32c 100644
> > > --- a/drivers/resctrl/mpam_devices.c
> > > +++ b/drivers/resctrl/mpam_devices.c
> > > @@ -181,6 +181,9 @@ static int __mpam_read_reg(struct mpam_msc *msc, u16 reg, u32 *res)
> > >   {
> > >   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> > > 
> > 
> > The above doesn't make any sense for PCC accesses, perhaps need to be pushed
> > down ?
> 
> Well, the idea was that the mask would always encompass all CPUs when using
> MPAM-Fb, but to consider this an implementation detail of MPAM-Fb.
> We can of course move this out of the way for MPAM-Fb.
> 

I prefer that.

> > 
> > > +	if (msc->iface == MPAM_IFACE_PCC)
> > > +		return mpam_fb_send_read_request(msc, reg, res);
> > > +
> > >   	*res = readl_relaxed(msc->mapped_hwpage + reg);
> > >   	return 0;
> > > @@ -197,9 +200,12 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
> > >   static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
> > >   {
> > > -	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
> > >   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> > 
> 
> And by the way: I think the hwpage_sz check should belong to the probe
> function, not be done on every access. Or are there optional registers that
> might not be part of the mapping on devices that don't support them?
> 

No, I was just referring the cpumask and not hwpage_sz check.

-- 
Regards,
Sudeep

