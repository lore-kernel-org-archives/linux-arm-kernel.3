Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79677C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tAZQ0spVVEZZIHmVQBC+dOaNCyVxTOIQXkIyXzUO5k=; b=SGwaR4Hf+UQ17JDbOiMujXkvKE
	V4A571lLbhZRhB44GOzfo8GaOUPa8D/CC9fJlb+QqunLvo9b9X+X+gGCJA4HX6wIuSbYwBa7oK0Wm
	j+C/ENmrHB0bIrfCFtRuPcrMPiZ4+T7gjTUysrMmUyGDqCM7U46kTGaC2YYOOyjlm/Ql0d0BaVgci
	XZ2nn3emEPx60QBDIgoyCLaBHmUDP3S3zHfD6IajCAFdYY6ydWbkC3Km0ipL9tC5pZzz9T6FujYQr
	EVgSFHOsd0YDOKzKLt5ITX3MiKB982WL4PqGnGGo+LunDEbyMcVALa/usvzuz+34lzhk+6iiRWNqI
	p5V4hwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSl4E-0000000GoPZ-1DoX;
	Fri, 20 Jun 2025 23:22:42 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSklC-0000000GmKD-3eMb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 23:03:04 +0000
Date: Fri, 20 Jun 2025 16:02:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750460578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5tAZQ0spVVEZZIHmVQBC+dOaNCyVxTOIQXkIyXzUO5k=;
	b=cBDZqcN5mHkTBb2IiWeX4Taf2j8l+UDr1mn+oTK+j21w/qkbzBLq/ddDQiIC1Y2SpIDFIK
	h/4mxwtGV8jZX4pZyLpJHcY3/dARAsFd3pgXrbwYwsBxhc6g4m1d0okpnBlbRPqdRhW8LT
	Co/XYkCK6dhGd4zgDHcMmcKGGsR7xo0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 4/5] KVM: arm64: gic-v5: Support GICv3 compat
Message-ID: <aFXomXKBk1V9iYSa@linux.dev>
References: <20250620160741.3513940-1-sascha.bischoff@arm.com>
 <20250620160741.3513940-5-sascha.bischoff@arm.com>
 <aFXClKQRG3KNAD2y@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFXClKQRG3KNAD2y@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_160303_654290_68FBF306 
X-CRM114-Status: GOOD (  49.50  )
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

On Fri, Jun 20, 2025 at 01:20:36PM -0700, Oliver Upton wrote:
> Hi Sascha,
> 
> Thank you for posting this. Very excited to see the GICv5 enablement get
> started.
> 
> On Fri, Jun 20, 2025 at 04:07:51PM +0000, Sascha Bischoff wrote:
> > Add support for GICv3 compat mode (FEAT_GCIE_LEGACY) which allows a
> > GICv5 host to run GICv3-based VMs. This change enables the
> > VHE/nVHE/hVHE/protected modes, but does not support nested
> > virtualization.
> 
> Can't we just load the shadow state into the compat VGICv3? I'm worried
> this has sharp edges on the UAPI side as well as users wanting to
> migrate VMs to new hardware.
> 
> The guest hypervisor should only see GICv3-only or GICv5-only, we can
> pretend FEAT_GCIE_LEGACY never existed :)
> 
> > Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   |  2 ++
> >  arch/arm64/include/asm/kvm_hyp.h   |  2 ++
> >  arch/arm64/kvm/Makefile            |  3 +-
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 +++++++
> >  arch/arm64/kvm/hyp/vgic-v3-sr.c    | 51 +++++++++++++++++++++++++-----
> >  arch/arm64/kvm/sys_regs.c          | 10 +++++-
> >  arch/arm64/kvm/vgic/vgic-init.c    |  6 ++--
> >  arch/arm64/kvm/vgic/vgic-v3.c      |  6 ++++
> >  arch/arm64/kvm/vgic/vgic-v5.c      | 14 ++++++++
> >  arch/arm64/kvm/vgic/vgic.h         |  2 ++
> >  include/kvm/arm_vgic.h             |  9 +++++-
> >  11 files changed, 104 insertions(+), 13 deletions(-)
> >  create mode 100644 arch/arm64/kvm/vgic/vgic-v5.c
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index bec227f9500a..ad1ef0460fd6 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -81,6 +81,8 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_vmcr_aprs,
> >  	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> > +	__KVM_HOST_SMCCC_FUNC___vgic_v3_compat_mode_enable,
> > +	__KVM_HOST_SMCCC_FUNC___vgic_v3_compat_mode_disable,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
> > diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> > index e6be1f5d0967..9c8adc5186ec 100644
> > --- a/arch/arm64/include/asm/kvm_hyp.h
> > +++ b/arch/arm64/include/asm/kvm_hyp.h
> > @@ -85,6 +85,8 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if);
> >  void __vgic_v3_save_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
> >  void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
> >  int __vgic_v3_perform_cpuif_access(struct kvm_vcpu *vcpu);
> > +void __vgic_v3_compat_mode_enable(void);
> > +void __vgic_v3_compat_mode_disable(void);
> >  
> >  #ifdef __KVM_NVHE_HYPERVISOR__
> >  void __timer_enable_traps(struct kvm_vcpu *vcpu);
> > diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> > index 7c329e01c557..3ebc0570345c 100644
> > --- a/arch/arm64/kvm/Makefile
> > +++ b/arch/arm64/kvm/Makefile
> > @@ -23,7 +23,8 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
> >  	 vgic/vgic-v3.o vgic/vgic-v4.o \
> >  	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
> >  	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
> > -	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
> > +	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
> > +	 vgic/vgic-v5.o
> >  
> >  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
> >  kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index e9198e56e784..61af55df60a9 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -475,6 +475,16 @@ static void handle___vgic_v3_restore_vmcr_aprs(struct kvm_cpu_context *host_ctxt
> >  	__vgic_v3_restore_vmcr_aprs(kern_hyp_va(cpu_if));
> >  }
> >  
> > +static void handle___vgic_v3_compat_mode_enable(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	__vgic_v3_compat_mode_enable();
> > +}
> > +
> > +static void handle___vgic_v3_compat_mode_disable(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	__vgic_v3_compat_mode_disable();
> > +}
> > +
> >  static void handle___pkvm_init(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	DECLARE_REG(phys_addr_t, phys, host_ctxt, 1);
> > @@ -603,6 +613,8 @@ static const hcall_t host_hcall[] = {
> >  	HANDLE_FUNC(__kvm_timer_set_cntvoff),
> >  	HANDLE_FUNC(__vgic_v3_save_vmcr_aprs),
> >  	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> > +	HANDLE_FUNC(__vgic_v3_compat_mode_enable),
> > +	HANDLE_FUNC(__vgic_v3_compat_mode_disable),
> >  	HANDLE_FUNC(__pkvm_init_vm),
> >  	HANDLE_FUNC(__pkvm_init_vcpu),
> >  	HANDLE_FUNC(__pkvm_teardown_vm),
> > diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > index f162b0df5cae..b03b5f012226 100644
> > --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > @@ -257,6 +257,18 @@ void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
> >  	}
> >  }
> >  
> > +void __vgic_v3_compat_mode_enable(void)
> > +{
> > +	sysreg_clear_set_s(SYS_ICH_VCTLR_EL2, 0, ICH_VCTLR_EL2_V3);
> > +	isb();
> > +}
> > +
> > +void __vgic_v3_compat_mode_disable(void)
> > +{
> > +	sysreg_clear_set_s(SYS_ICH_VCTLR_EL2, ICH_VCTLR_EL2_V3, 0);
> > +	isb();
> > +}
> > +
> 
> It isn't clear to me what these ISBs are synchonizing against. AFAICT,
> the whole compat thing is always visible and we can restore the rest of
> the VGICv3 context before guaranteeing the enable bit has been observed.
> 
> Can we consolidate this into a single hyp call along with
> __vgic_v3_*_vmcr_aprs()?
> 
> Last bit as an FYI, kvm_call_hyp() has an implied context synchronization upon
> return, either because of ERET in nVHE or an explicit ISB on VHE.

Ah, reading the spec was a useful exercise. ICH_VMCR_EL2 is a modal
register... I hear implementation folks *love* those :)

Please do the aforementioned consolidation, at which point the purpose
of the ISB should be apparent.

> >  void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if)
> >  {
> >  	/*
> > @@ -296,12 +308,19 @@ void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if)
> >  	}
> >  
> >  	/*
> > -	 * Prevent the guest from touching the ICC_SRE_EL1 system
> > -	 * register. Note that this may not have any effect, as
> > -	 * ICC_SRE_EL2.Enable being RAO/WI is a valid implementation.
> > +	 * GICv5 BET0 FEAT_GCIE_LEGACY doesn't include ICC_SRE_EL2. This is due
> > +	 * to be relaxed in a future spec release, likely BET1, at which point
> > +	 * this in condition can be dropped again.
> >  	 */
> > -	write_gicreg(read_gicreg(ICC_SRE_EL2) & ~ICC_SRE_EL2_ENABLE,
> > -		     ICC_SRE_EL2);
> > +	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif)) {
> > +		/*
> > +		 * Prevent the guest from touching the ICC_SRE_EL1 system
> > +		 * register. Note that this may not have any effect, as
> > +		 * ICC_SRE_EL2.Enable being RAO/WI is a valid implementation.
> > +		 */
> > +		write_gicreg(read_gicreg(ICC_SRE_EL2) & ~ICC_SRE_EL2_ENABLE,
> > +			     ICC_SRE_EL2);
> > +	}
> >  
> >  	/*
> >  	 * If we need to trap system registers, we must write
> > @@ -322,8 +341,14 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
> >  		cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
> >  	}
> >  
> > -	val = read_gicreg(ICC_SRE_EL2);
> > -	write_gicreg(val | ICC_SRE_EL2_ENABLE, ICC_SRE_EL2);
> > +	/*
> > +	 * Can be dropped in the future when GICv5 BET1 is released. See
> > +	 * comment above.
> > +	 */
> > +	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif)) {
> 
> Can we use the GCIE cpucap instead, possibly via a shared helper with
> the driver?
> 
> > -	if (kvm_vgic_global_state.type == VGIC_V3) {
> > +	if (kvm_vgic_global_state.type == VGIC_V3 || kvm_vgic_in_v3_compat_mode()) {
> 
> Can we do a helper for this too?
> 
> >  		val &= ~ID_AA64PFR0_EL1_GIC_MASK;
> >  		val |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
> >  	}
> > @@ -1953,6 +1953,14 @@ static int set_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
> >  	    (vcpu_has_nv(vcpu) && !FIELD_GET(ID_AA64PFR0_EL1_EL2, user_val)))
> >  		return -EINVAL;
> >  
> > +	/*
> > +	 * If we are running on a GICv5 host and support FEAT_GCIE_LEGACY, then
> > +	 * we support GICv3. Fail attempts to do anything but set that to IMP.
> > +	 */
> > +	if (kvm_vgic_in_v3_compat_mode() &&
> > +	    FIELD_GET(ID_AA64PFR0_EL1_GIC_MASK, user_val) != ID_AA64PFR0_EL1_GIC_IMP)
> > +		return -EINVAL;
> > +
> 
> 
> 
> >  	return set_id_reg(vcpu, rd, user_val);
> >  }
> >  
> > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > index eb1205654ac8..5f6506e297c1 100644
> > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > @@ -674,10 +674,12 @@ void kvm_vgic_init_cpu_hardware(void)
> >  	 * We want to make sure the list registers start out clear so that we
> >  	 * only have the program the used registers.
> >  	 */
> > -	if (kvm_vgic_global_state.type == VGIC_V2)
> > +	if (kvm_vgic_global_state.type == VGIC_V2) {
> >  		vgic_v2_init_lrs();
> > -	else
> > +	} else if (kvm_vgic_global_state.type == VGIC_V3 ||
> > +		   kvm_vgic_in_v3_compat_mode()) {
> >  		kvm_call_hyp(__vgic_v3_init_lrs);
> > +	}
> >  }
> >  
> >  /**
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> > index b9ad7c42c5b0..b5df4d36821d 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> > @@ -734,6 +734,9 @@ void vgic_v3_load(struct kvm_vcpu *vcpu)
> >  {
> >  	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
> >  
> > +	if (static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif))
> > +		kvm_call_hyp(__vgic_v3_compat_mode_enable);
> > +
> >  	/* If the vgic is nested, perform the full state loading */
> >  	if (vgic_state_is_nested(vcpu)) {
> >  		vgic_v3_load_nested(vcpu);
> > @@ -764,4 +767,7 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
> >  
> >  	if (has_vhe())
> >  		__vgic_v3_deactivate_traps(cpu_if);
> > +
> > +	if (static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif))
> > +		kvm_call_hyp(__vgic_v3_compat_mode_disable);

Do we need to eagerly disable compat mode or can we just configure the
VGIC correctly for the intended vCPU at load()?

> >  }
> > diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> > new file mode 100644
> > index 000000000000..57199449ca0f
> > --- /dev/null
> > +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <kvm/arm_vgic.h>
> > +
> > +#include "vgic.h"
> > +
> > +inline bool kvm_vgic_in_v3_compat_mode(void)a
> 
> nit: we're generally trusting of the compiler to 'do the right thing'
> and avoid explicit inline specifiers unless necessary.
> 
> > +{
> > +	if (static_branch_unlikely(&kvm_vgic_global_state.gicv5_cpuif) &&
> > +	    kvm_vgic_global_state.has_gcie_v3_compat)
> > +		return true;
> > +
> > +	return false;
> > +}
> 
> This should be a per-VM thing once KVM support for GICv5 lands. Can you
> get ahead of that and take a KVM pointer that goes unused. Maybe rename
> it:
> 
> bool vgic_is_v3_compat(struct kvm *kvm)
> 
> Or something similar.
> 
> Thanks,
> Oliver
> 

