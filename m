Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB6DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eFyAw6m9f9PvVVqeeS/RVIwLWLfQD10a5pZhwLxoFc=; b=1NWm5popAjB4NpOJcGWY26qil7
	SRihcZvXTXyfmMtq1HA5tQjpNBbOpV4AtAOhPw39lCSveGnNaw3p0Vqi0+rz5CS2WrIuC4njsehKQ
	ftBfA3QBoc1ZdQIzRkok4QBdy0HsJ3RBIvKFw2QkbhT+0nTqlk/2RsHSM16XJnz+Fl81OGqalt8pz
	zIH1E+7r609Se3PINXkwWWXvKxL+GvdHRh58J18zk3iC2zpSqak8wI5pwSPHjentdxJieeY1tqFe3
	awLxKpBgzzVkuG2PRCbJgwTVNyWuP/jJQWTIa62cfrr/wnTM/S0f/5dJxGl107g76lBLrCkpxruAx
	qI0eMdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5jK-0000000GbGN-3bmd;
	Thu, 04 Jun 2026 10:55:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5jK-0000000GbGD-0Raq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:55:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E939404FA;
	Thu,  4 Jun 2026 10:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E551F00898;
	Thu,  4 Jun 2026 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780570517;
	bh=8eFyAw6m9f9PvVVqeeS/RVIwLWLfQD10a5pZhwLxoFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lRCIYU2T90rNMwE16bWPy8n8JWkytl2Zmp2BcfU6W7csH7KyuLYtc4g1w9YLg99dg
	 zv9UCWUpjFI7P7/2RvnkeSqq5n2+2E+V5i6jzxy4hf75txftDt3Za1nuaYYSrxTmtu
	 R3MHl6pXE5YmCBA2pldAksWspgMaEAie7DrX8pIwY8sodBQoKGNMS7KOAoVw/uo3Vm
	 hLVS7S7JZj0Uu7hfgW7xGl+GpMxeRPYd1+8n493U7RVD5PvGnE7Nu92F+hB9UeIroP
	 RjLlsYW9jBXQojSmlBqoLQCr8F7PnV274pYY1kwRr56rPLZtakXJjJcqiZUg57PEkn
	 f7cnfP/6l/5Sw==
Date: Thu, 4 Jun 2026 11:55:12 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260604-expert-iguana-of-reverence-b7cda6@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <bee6166c-f63e-4692-a874-b80b7a6f6dc4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee6166c-f63e-4692-a874-b80b7a6f6dc4@arm.com>
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

On Thu, Jun 04, 2026 at 11:24:05AM +0100, Suzuki K Poulose wrote:
> On 04/06/2026 10:21, Sudeep Holla wrote:
> > On Wed, May 27, 2026 at 03:32:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> > > platform device. Like arm-smccc-trng, this device is not an independent
> > > platform resource; it is a software representation of the RSI firmware
> > > service discovered through SMCCC.
> > > 
> > > Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> > > is SMC and the RSI ABI version check succeeds, create an arm-rsi-dev SMCCC
> > > device. Convert the Arm CCA guest TSM provider to an SMCCC driver so it
> > > binds to that discovered RSI service and keeps module autoloading through
> > > the SMCCC device id table.
> > > 
> > > Keep the old arm-cca-dev platform-device registration for now. Userspace
> > > has used that device as a Realm-guest indicator, so removing it is left to
> > > a follow-up patch that adds a replacement sysfs ABI.
> > > 
> > > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > > ---
> > >   arch/arm64/include/asm/rsi.h                  |  2 +-
> > >   arch/arm64/kernel/rsi.c                       |  2 +-
> > >   drivers/firmware/smccc/Makefile               |  4 ++
> > >   drivers/firmware/smccc/rmm.c                  | 25 ++++++++
> > >   drivers/firmware/smccc/rmm.h                  | 17 ++++++
> > >   drivers/firmware/smccc/smccc.c                |  8 +++
> > >   drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
> > >   drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
> > >   .../{arm-cca-guest.c => arm-cca.c}            | 60 +++++++++----------
> > >   9 files changed, 89 insertions(+), 32 deletions(-)
> > >   create mode 100644 drivers/firmware/smccc/rmm.c
> > >   create mode 100644 drivers/firmware/smccc/rmm.h
> > >   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
> > > 
> > > diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> > > index 88b50d660e85..2d2d363aaaee 100644
> > > --- a/arch/arm64/include/asm/rsi.h
> > > +++ b/arch/arm64/include/asm/rsi.h
> > > @@ -10,7 +10,7 @@
> > >   #include <linux/jump_label.h>
> > >   #include <asm/rsi_cmds.h>
> > > -#define RSI_PDEV_NAME "arm-cca-dev"
> > > +#define RSI_DEV_NAME "arm-rsi-dev"
> > >   DECLARE_STATIC_KEY_FALSE(rsi_present);
> > > diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> > > index 92160f2e57ff..da440f71bb64 100644
> > > --- a/arch/arm64/kernel/rsi.c
> > > +++ b/arch/arm64/kernel/rsi.c
> > > @@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
> > >   }
> > >   static struct platform_device rsi_dev = {
> > > -	.name = RSI_PDEV_NAME,
> > > +	.name = "arm-cca-dev",
> > >   	.id = PLATFORM_DEVID_NONE
> > >   };
> > > diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> > > index 40d19144a860..33c850aaff4d 100644
> > > --- a/drivers/firmware/smccc/Makefile
> > > +++ b/drivers/firmware/smccc/Makefile
> > > @@ -2,3 +2,7 @@
> > >   #
> > >   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
> > >   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> > > +
> > > +ifeq ($(CONFIG_HAVE_ARM_SMCCC_DISCOVERY),y)
> > > +obj-$(CONFIG_ARM64) += rmm.o
> > > +endif
> > > diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
> > > new file mode 100644
> > > index 000000000000..d572f47e955c
> > > --- /dev/null
> > > +++ b/drivers/firmware/smccc/rmm.c
> > > @@ -0,0 +1,25 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2026 Arm Limited
> > > + */
> > > +
> > > +#include <linux/arm-smccc-bus.h>
> > > +#include <linux/err.h>
> > > +#include <linux/printk.h>
> > > +
> > > +#include "rmm.h"
> > > +
> > > +void __init register_rsi_device(void)
> > > +{
> > > +	unsigned long ret;
> > > +
> > > +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> > > +		return;
> > > +
> > > +	ret = rsi_request_version(RSI_ABI_VERSION, NULL, NULL);
> > > +	if (ret != RSI_SUCCESS)
> > > +		return;
> > > +
> > > +	if (IS_ERR(arm_smccc_device_register(RSI_DEV_NAME)))
> > > +		pr_err("%s: could not register device\n", RSI_DEV_NAME);
> > > +}
> > 
> > OK, I had something else in my mind when I started looking at 1/4. I didn't
> > expect each device added on this bus comes up with it's own way to enumerate
> > it. IMO, it defeats the purpose of building the smccc bus. We may find the
> > specs for each feature deviated a bit but we can have a generic probe
> > IMO, let's try that before exploring per feature probe function.
> 
> I guess this is ideal, but see below.
> 
> > 
> > I have a brief sketch of what I think we should aim for(uncompiled/untested)
> > below. Let me know if that makes sense. I just based it on your bus code.
> > 
> > Regards,
> > Sudeep
> > 
> > -->8
> > 
> > diff --git c/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> > index 695c920a8087..450605ddfab6 100644
> > --- c/drivers/firmware/smccc/smccc.c
> > +++ w/drivers/firmware/smccc/smccc.c
> > @@ -9,21 +9,58 @@
> >   #include <linux/init.h>
> >   #include <linux/arm-smccc.h>
> >   #include <linux/kernel.h>
> > -#include <linux/platform_device.h>
> >   #include <linux/arm-smccc-bus.h>
> >   #include <linux/idr.h>
> >   #include <linux/slab.h>
> > 
> > -#include <asm/archrandom.h>
> > -
> >   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
> >   static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
> >   static DEFINE_IDA(arm_smccc_bus_id);
> > 
> > -bool __ro_after_init smccc_trng_available = false;
> > +struct smccc_device_info {
> > +       u32 func_id;
> > +       bool requires_smc;

I wanted to ask this but just forgot.

RSI uses SMC because the Realm is calling the RMM, not the host hypervisor.
Using HVC would make RSI look like a hypervisor ABI and would blur the trust
boundary, is that right assumption ?

I assume the conduit derived from PSCI node for the realms will always be
SMC and it shouldn't be a problem. I mean there won't be a case where you
would need HVC as conduit within the realm VM kernel ?

> > +       unsigned long min_return;
> 
> Is this viable for all ? There may be additional restrictions around
> the return values and further SMC calls ?

Fair enough, but do you have examples currently ?

> Which brings us to call backs and we kind of have a variant of that here.
> 

I am fine with callback but need to keep the scope of it as minimum as
possible IMO. For me it's simple if that main FID for that feature is
implemented we create SMCCC device and probe can deal with all the extra
details, why won't that work ? Just trying to understand why the core
SMCCC bus need to know more or must provide a callback.

-- 
Regards,
Sudeep

