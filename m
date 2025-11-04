Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC71CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBdmFbAtZ4x0EBEmNprMJUgxsa3W4T6k8icJajXOb60=; b=XE6eE0a3TxGctn7pIXgxMK50Gm
	aPEMy1xShtLoWJRKf1ptfSgoYUb8GxVt/7j6wGMs4X1z3RLqbPEAR8hOdkeVl63AhOuoWfhrQFCWY
	Ue7ZCm9f6zLqtLSmTf+0w3PwIlSJXlK8YCQ/4u1TR80S24/cOxr+NWRV7S7Qv7tHeR41JKM22YXPL
	zWYm2vsbcCm1Jspl5k0ZPTKQeKstz+vPk7tQb8Vyg8QXrivl7BWDqeyZEhTJncZEWemtnKsCxJoA0
	26e9+FX3SfHT6rRa5aroakkZ65QduESRk+SRAq9nwNNLyADW5OVhkkb0ShblF4A5ehTpLNCkRIRMV
	rjH0sl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDXA-0000000BY9P-3b07;
	Tue, 04 Nov 2025 09:41:00 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDX6-0000000BY8y-29xU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762249253; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=rBdmFbAtZ4x0EBEmNprMJUgxsa3W4T6k8icJajXOb60=;
	b=Q/prudZTyzCkiiWbtHb66bVAt4egqfkpDrRAlMxZYlLOATGmoTUoU4I/BvVwY/DMpnbAclTiAJKy7wPcVKtqTgzx1pv3eRzedj/ACe2JM+gByIdvVKoyPRjV6RVrbdqjkU6E9ylRW5HSbDoKAulZa+oT8r1lpXJf3GaAXi9CCns=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0WrgkE3J_1762249251 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 04 Nov 2025 17:40:52 +0800
Date: Tue, 4 Nov 2025 17:40:51 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 05/33] KVM: arm64: GICv3: Detect and work around the lack
 of ICV_DIR_EL1 trapping
Message-ID: <fprfzs2qtlhxv7no4zmpjfrgs76shbcm7gs4lh5o55n6qxozso@4uoe6tuadnx3>
References: <20251103165517.2960148-1-maz@kernel.org>
 <20251103165517.2960148-6-maz@kernel.org>
 <eossoxorxj5knjyx2xglsrzhrbi6rry3rcr2xryfmft3q7up4b@tr5yrg6lljzq>
 <86ikfquq28.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikfquq28.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_014057_344414_E6D2D069 
X-CRM114-Status: GOOD (  28.57  )
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

On Tue, Nov 04, 2025 at 09:04:15AM +0800, Marc Zyngier wrote:
> On Tue, 04 Nov 2025 08:50:26 +0000,
> Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
> >
> > On Mon, Nov 03, 2025 at 04:54:49PM +0800, Marc Zyngier wrote:
> > > A long time ago, an unsuspecting architect forgot to add a trap
> > > bit for ICV_DIR_EL1 in ICH_HCR_EL2. Which was unfortunate, but
> > > what's a bit of spec between friends? Thankfully, this was fixed
> > > in a later revision, and ARM "deprecates" the lack of trapping
> > > ability.
> > >
> > > Unfortuantely, a few (billion) CPUs went out with that defect,
> > > anything ARMv8.0 from ARM, give or take. And on these CPUs,
> > > you can't trap DIR on its own, full stop.
> > >
> > > As the next best thing, we can trap everything in the common group,
> > > which is a tad expensive, but hey ho, that's what you get. You can
> > > otherwise recycle the HW in the neaby bin.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/virt.h  |  7 ++++++-
> > >  arch/arm64/kernel/cpufeature.c | 34 ++++++++++++++++++++++++++++++++++
> > >  arch/arm64/kernel/hyp-stub.S   |  5 +++++
> > >  arch/arm64/kvm/vgic/vgic-v3.c  |  3 +++
> > >  arch/arm64/tools/cpucaps       |  1 +
> > >  5 files changed, 49 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> > > index aa280f356b96a..8eb63d3294974 100644
> > > --- a/arch/arm64/include/asm/virt.h
> > > +++ b/arch/arm64/include/asm/virt.h
> > > @@ -40,8 +40,13 @@
> > >   */
> > >  #define HVC_FINALISE_EL2	3
> > >
> > > +/*
> > > + * HVC_GET_ICH_VTR_EL2 - Retrieve the ICH_VTR_EL2 value
> > > + */
> > > +#define HVC_GET_ICH_VTR_EL2	4
> > > +
> > >  /* Max number of HYP stub hypercalls */
> > > -#define HVC_STUB_HCALL_NR 4
> > > +#define HVC_STUB_HCALL_NR 5
> > >
> > >  /* Error returned when an invalid stub number is passed into x0 */
> > >  #define HVC_STUB_ERR	0xbadca11
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index 5ed401ff79e3e..44103ad98805d 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -2303,6 +2303,31 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
> > >  }
> > >  #endif
> > >
> > > +static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
> > > +				 int scope)
> > > +{
> > > +	struct arm_smccc_res res = {};
> > > +
> > > +	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV3_CPUIF);
> > > +	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV5_LEGACY);
> > > +	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) ||
> > > +	    !cpus_have_cap(ARM64_HAS_GICV3_CPUIF))
> >
> > Duplicated checking ?
>
> Yup, cut'n'paste, and lack of GICv5 testing... This should really look

Thanks for the quick reply!

Oh, not awared that checking GICv5 is necessary here.
I looked v3/v4 spec before but stop before v5. Ok it's time to
have a look on v5.

> like the hack below, since GICv5 legacy feature is guaranteed to have
> TDIR:
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 44103ad98805d..3f2d4b033966d 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2310,13 +2310,15 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
>
>  	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV3_CPUIF);
>  	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDS <= ARM64_HAS_GICV5_LEGACY);
> -	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) ||
> -	    !cpus_have_cap(ARM64_HAS_GICV3_CPUIF))
> +	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF))
>  		return false;
>
>  	if (!is_hyp_mode_available())
>  		return false;
>
> +	if (cpus_have_cap(ARM64_HAS_GICV5_LEGACY))
> +		return true;
> +
>  	if (is_kernel_in_hyp_mode())
>  		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
>  	else
>
>
> Thanks for the heads-up!
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

