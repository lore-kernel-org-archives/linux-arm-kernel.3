Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD81D43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htRupkb/BQvGISs6PORgMd6i3akReof1AyeeJ73CU4o=; b=CkCYAUT/ufZ7CCiXTdV7BNjwk7
	5qIMJMQSldruoVSFT6eSNQDqtZgcMzb519AUajoVyDp3zMA8CIsUk7l74Jif5R5gH6hnVX0Dzgavv
	Bm4fc947TSUSGXlw+lKmRfQtk8g+4g7iPQPQ7ijd+GOKuP0TwRONiZvKhgjTwfLyT31UUQXGbl/CG
	906g7z1Wp0UyaZwDwf8BjQtYhhgvLEiZ5FR/GadCLqDsb0v8xlwcEvVpayXI07thhHqK96laU9Q2q
	WkeXeiILz2hYe0HJoxWb6rn23guOwlLqgVaR/hnhf0N/Op+WsaD27rHVWn0yHtGzdRF+rTrwBdWhu
	UZ6ei7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91SM-00000006thb-13PS;
	Thu, 07 Nov 2024 12:17:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Ih-00000006s5J-3qBs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:07:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE94497;
	Thu,  7 Nov 2024 04:08:15 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74513F66E;
	Thu,  7 Nov 2024 04:07:43 -0800 (PST)
Date: Thu, 7 Nov 2024 12:07:40 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: VHE: Initialize PMSCR_EL1
Message-ID: <ZyytjB-Hlqw909sq@raptor>
References: <20241106122654.38234-1-alexandru.elisei@arm.com>
 <868qtw1ne0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qtw1ne0.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_040748_068512_FC2F1E64 
X-CRM114-Status: GOOD (  45.88  )
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

Hi Marc,

On Wed, Nov 06, 2024 at 01:51:19PM +0000, Marc Zyngier wrote:
> On Wed, 06 Nov 2024 12:26:54 +0000,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > According to the pseudocode for StatisticalProfilingEnabled() from Arm
> > DDI0487K.a, PMSCR_EL1 controls profiling at EL1 and EL0:
> > 
> > - PMSCR_EL1.E1SPE controls profiling at EL1.
> > - PMSCR_EL1.E0SPE controls profiling at EL0 if HCR_EL2.TGE=0. KVM always
> >   clears HCR_EL2.TGE when running a VM.
> > 
> > When profiling is enabled in the host, and the host is running in nVHE mode
> > (HCR_EL2.E2H=0), KVM clears PMSCR_EL1.{E1SPE,E0SPE} before jumping into the
> > guest.
> > 
> > When profiling is enabled in the host, and the host is running at EL2
> > (HCR_EL2.E2H=1), KVM will not touch PMSCR_EL1.{E1SPE,E0SPE} before jumping
> > into the guest. PMSCR_EL1.{E1SPE,E0SPE} reset to an architecturally UNKNOWN
> > value, which means it might be possible that KVM unintentionally profiles
> > the guest when is running in VHE mode.
> > 
> > Clear PMSCR_EL1.{E1SPE,E0SPE} when setting up VHE mode to keep the
> > behaviour consistent and predictable.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> > 
> > Tested on the model, by setting the PMSCR_EL1.E1SPE and E0SPE bits in
> > __init_el2_debug to simulate a system where they reset to 1. Without the
> > patch, when the host is running at EL2, and the user is profiling the
> > kvmtool process, I can see records taken at EL1:
> > 
> > # perf record -e arm_spe// -- ./lkvm-static run -c2 -m512 -k Image -d disk -p earlycon
> > 
> > With this patch, those records disappear; and the size of perf.data has
> > been more than halved.
> > 
> >  arch/arm64/kernel/hyp-stub.S | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> > index 65f76064c86b..df63f329d400 100644
> > --- a/arch/arm64/kernel/hyp-stub.S
> > +++ b/arch/arm64/kernel/hyp-stub.S
> > @@ -117,6 +117,8 @@ SYM_CODE_START_LOCAL(__finalise_el2)
> >  	bic	x0, x0, #(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT)
> >  	bic	x0, x0, #(MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT)
> >  	msr	mdcr_el2, x0
> > +	// Disable profiling when running a virtual machine
> > +	msr_s	SYS_PMSCR_EL12, xzr
> 
> ... resulting in an early crash on anything that doesn't have SPE.
> That's indeed "consistent and predictable" :-).

Yes, that's a double fail on my part: I just assumed that __finalise_el2
checks for FEAT_SPE before fiddling with MDCR_EL2.E2PB, like init_el2_state
does; and I didn't test with FEAT_SPE not present.

> 
> >  
> >  	// Transfer the MM state from EL1 to EL2
> >  	mrs_s	x0, SYS_TCR_EL12
> 
> I find it pretty odd to hide something that is squarely guest state in
> the hyp stubs, and I'd rather see something like this (untested):

Sure.

> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 48cafb65d6acf..806f25a8753ed 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2139,8 +2139,12 @@ static void cpu_hyp_init_features(void)
>  	cpu_set_hyp_vector();
>  	kvm_arm_init_debug();
>  
> -	if (is_kernel_in_hyp_mode())
> +	if (is_kernel_in_hyp_mode()) {
> +		if (SYS_FIELD_GET(ID_AA64DFR0_EL1, PMSVer,
> +				  read_sysreg(id_aa64dfr0_el1)))
> +			write_sysreg_el1(0, SYS_PMSCR);
>  		kvm_timer_init_vhe();
> +	}

Do you think this is an improvement (looks like a pretty big diff, but it's
mostly refactoring, the actual change is in kvm_arm_init_debug()):

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index ce8886122ed3..21b260b02216 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -65,12 +65,30 @@ static void restore_guest_debug_regs(struct kvm_vcpu *vcpu)
                *vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
 }
 
+static bool cpu_has_spe(void)
+{
+       return cpuid_feature_extract_unsigned_field(read_sysreg(id_aa64dfr0_el1),
+                                                   ID_AA64DFR0_EL1_PMSVer);
+}
+
+static bool cpu_has_trbe(void)
+{
+       return cpuid_feature_extract_unsigned_field(read_sysreg(id_aa64dfr0_el1),
+                                                   ID_AA64DFR0_EL1_TraceBuffer);
+}
+
 /**
  * kvm_arm_init_debug - grab what we need for debug
  *
- * Currently the sole task of this function is to retrieve the initial
- * value of mdcr_el2 so we can preserve MDCR_EL2.HPMN which has
- * presumably been set-up by some knowledgeable bootcode.
+ * This function does two things:
+ *
+ * 1. Retrieve the initial value of mdcr_el2 so we can preserve
+ * MDCR_EL2.HPMN which has presumably been set-up by some knowledgeable
+ * bootcode.
+ *
+ * 2. Clear PMSCR_EL1.E1SPE and E0SPE when the host is running at EL2. The
+ * bits reset to an unknown value, and clearing them prevents the host from
+ * accidently profiling a virtual machine.
  *
  * It is called once per-cpu during CPU hyp initialisation.
  */
@@ -78,6 +96,9 @@ static void restore_guest_debug_regs(struct kvm_vcpu *vcpu)
 void kvm_arm_init_debug(void)
 {
        __this_cpu_write(mdcr_el2, kvm_call_hyp_ret(__kvm_get_mdcr_el2));
+
+       if (is_kernel_in_hyp_mode() && cpu_has_spe())
+               write_sysreg_el1(0, SYS_PMSCR);
 }
 
 /**
@@ -317,23 +338,20 @@ void kvm_arm_clear_debug(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu)
 {
-       u64 dfr0;
-
        /* For VHE, there is nothing to do */
        if (has_vhe())
                return;
 
-       dfr0 = read_sysreg(id_aa64dfr0_el1);
        /*
         * If SPE is present on this CPU and is available at current EL,
         * we may need to check if the host state needs to be saved.
         */
-       if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
+       if (cpu_has_spe() &&
            !(read_sysreg_s(SYS_PMBIDR_EL1) & BIT(PMBIDR_EL1_P_SHIFT)))
                vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_SPE);
 
        /* Check if we have TRBE implemented and available at the host */
-       if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
+       if (cpu_has_trbe() &&
            !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
                vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
 }


Two questions:

1. As far as I can tell, KVM uses at least two functions for extracting a
field from an ID register: the ones above, which take a _SHIFT argument for
the field position, and the SYS_FIELD_GET ones, which take a mask argument.
Are they equivalent, is one is preferred over the other, or they have
different use cases?

2. has_vhe() vs is_kernel_in_hyp_mode(). I couldn't find any documentation
when to use one over the other. Looks to me like has_vhe() is faster
because uses cpu caps.

And one interesting find: when booting v6.12-rc6 (no patches on top) with
kvm-arm.mode=protected, and when profiling the kvmtool process, I see
unexpected buffer faults:

[    0.762373] kvm [1]: Protected hVHE mode initialized successfully
..
[   84.716647] arm_spe_pmu: Unexpected buffer fault on CPU 3 [PMBSR=0x0000000094020007, PMBPTR=0xffff800088804738, PMBLIMITR=0xffff800088a03001]

Same messages with the patches applied.

I'll try to investigate further, but I don't have the time until the end of
next week.

Thanks,
Alex

