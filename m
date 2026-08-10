Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE6CC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 04:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4rkLu3dJ5G4MjI7dmEjEcwCxzyicLKYP/8XGZR3+xk=; b=0+o5oFUHwoG9oJrLApVgeey2Hr
	vpGFd/2tsPg67TC2ChpcJ3YWu8Z+sKn4KNRbKq4uQ4Z/iwRCY6F2kESRqXr5UV2m3nbQ32Z1gwH8N
	qrEUPyMNNLN8Sn0SJolX4hKAnkKm2JVmfL8eHGPLqFCakmX6oyP2EozbipPCHFCO09mpb2/XLezQI
	3ccbwRm7JuCUJLlyW/9FVBJ92m2oivjSAE5w5/OEwgRnD+xhNprRuynSNihCxcfDGak9XiLD3AV7a
	R8Pjb1IAdX1eOv0lu+AiqdWpRO8bQH7u+efhZxpWLfnZCF0d9GSoIaNrmO5q+iaGi0Bc7Ees9nrRN
	2eW1Nh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI5p-0000000B1CI-0kUW;
	Mon, 10 Aug 2026 04:58:33 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI5l-0000000B1Bw-2wTR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 04:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786337913; x=1817873913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jCOlaum+43iVbWTgaD98C2MyzA+ilU9ycpxmRKx6wBI=;
  b=GLiOdgy7/b0dpVZWbp2sQ9x1ebowInOmYVrVUWonVVLl7m+F80P5rBVX
   gkcil9lfrd7jEyYWY9+3KYAUsb7bZPitzgzkHbWHNC5bLQe9XY+PhxYl7
   8XnRoPvChD7tzWn3rIFmJw5B3XQAfA1QvdxKbkBCfuWsTDLiH2K4u3iME
   6NnLSPgUViuK8NOtokOWQG0QjXwLwENBvaayf85dM5eidKp1q2Naci1wg
   f2Rru0LUFv3wDEdDFGuw6IFBxbk3IpgvOKLR1Bqb0hUb9ml8r752vWI+j
   DuOSi0Ed3v59wDD7zCDeJJbZMEV330n3/J3GOr8/JNfIJlrg1q74/XgGY
   w==;
X-CSE-ConnectionGUID: F1NR6tM1QZiwlkctNODpWA==
X-CSE-MsgGUID: gMxJAwVFT7eUEG6SKZr2gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="253989909"
X-IronPort-AV: E=Sophos;i="6.25,215,1779116400"; 
   d="scan'208";a="253989909"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:58:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 783355531
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 04:58:25 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 310E1C02E5F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 04:58:25 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.69.80])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 7CA0A2000210;
	Mon, 10 Aug 2026 04:58:17 +0000 (UTC)
Date: Mon, 10 Aug 2026 13:58:10 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 44/45] KVM: arm64: CCA: Require ICH_HCR_EL2.TDIR for
 realms
Message-ID: <anlZCIauOq4Lvv0I@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-45-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803134403.80630-45-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215830_471254_16AB7B2D 
X-CRM114-Status: GOOD (  47.87  )
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

On 08/03 14:44, Steven Price wrote:
> KVM advertises realm support when the RMM is available, and allows
> userspace to create a VM with KVM_VM_TYPE_ARM_REALM on that basis.
> 
> On CPUs that lack ICH_HCR_EL2.TDIR, KVM uses ICH_HCR_EL2.TC for
> normal guests so that ICC_DIR_EL1 is still trapped via the common GICv3
> CPU interface trap. Realms cannot rely on the normal hyp-side trap
> handling for that fallback, so advertising RMI support on such systems
> lets userspace create a realm that cannot safely run.
> 
> Require the finalized ARM64_HAS_ICH_HCR_EL2_TDIR capability when
> reporting KVM_CAP_ARM_RMI and when accepting KVM_VM_TYPE_ARM_REALM.
> This leaves normal VM creation unchanged on systems that need the TC
> workaround.

Hi Steven,

Thanks for your work on upstreaming CCA.

In the v15 discussion [0], you asked whether the system I was testing was a
"hacked up test system" or closer to "production hardware", and I said I would
share more when the time came. I can now say that this is not a hacked-up test
system. At Fujitsu, we have real hardware (FUJITSU-MONAKA) which implements CCA
(FEAT_RME) but does not implement FEAT_GICv3_TDIR. The hardware details are as
follows:

  - GICv4.2 compliant implementation
  - Supports FEAT_GICv3, FEAT_GICv3p1, FEAT_GICv4, FEAT_GICv4p1, and FEAT_GICv3_NMI
  - Does not support FEAT_GICv3_LEGACY (deprecated)
  - Does not support FEAT_GICv3_TDIR (ICH_VTR_EL2.TDS == 0)

For reference, compared with Arm Neoverse V3, the virtual GIC configuration is
largely equivalent. The only missing non-deprecated architectural feature is
FEAT_GICv3_TDIR.

The issue I see is that the CCA KVM code currently does not support a
configuration (non-TDIR/common-trap) that normal KVM already supports. For
normal guests, KVM handles systems without TDIR by using ICH_HCR_EL2.TC and the
existing GICv3 CPU interface emulation path. However, Realm guests currently
fail because the CCA path bypasses that existing emulation path, as Marc also
pointed out in [1].

Also, this is not limited to systems that actually lack TDIR. The same failure
can be reproduced on a TDIR-capable system by booting with:
  kvm-arm.vgic_v3_common_trap=1

So it seems that the current CCA KVM implementation does not yet cover a
configuration that normal KVM already supports today, rather than this being a
limitation of the RMM specification or the underlying hardware.

I've included a patch below which reuses the existing GICv3 early emulation
path for Realm sysreg exits. This patch does not add any new vGIC emulation
code, and leaves the existing vGIC emulation code unchanged. So I believe this
is in line with Marc's request in [1]. With this patch, Realm guests can run
when the common CPU interface trap path is enabled.

I tested the exact patch both on our real silicon and on QEMU, and
confirmed that all Realm-related tests in kvm-unit-tests-cca passed.

I'm not attached to this exact implementation, and I'm happy if the solution is
reworked to better fit into the next revision. 

Given that this configuration can be supported by reusing the existing KVM
emulation infrastructure, I think it would be reasonable for CCA to support the
non-TDIR/common-trap configuration rather than requiring ICH_HCR_EL2.TDIR
unconditionally for Realm support. 

Supporting this configuration would also allow us to validate the upstream CCA
KVM implementation on real silicon using upstream code paths, and contribute
additional real-hardware testing coverage as the implementation
evolves.

I'd be very interested in hearing your thoughts.

Thanks,
Kohei

[0] https://lore.kernel.org/all/1cd3327c-1eab-4022-9ab1-625ca8641e81@arm.com/
[1] https://lore.kernel.org/all/86cxwfe5m8.wl-maz@kernel.org/

Below is the patch I tested, and it should be applied on top of this series.

----8<----
From 11ce6b7e5ee2f21a71f657e9f45f58871d011286 Mon Sep 17 00:00:00 2001
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Tue, 4 Aug 2026 11:45:53 +0900
Subject: [PATCH] KVM: arm64: CCA: Reuse early vGIC sysreg emulation for Realm
 exits

Realm vGIC CPU interface sysreg exits currently bypass KVM's early vGIC
emulation and reach the generic sysreg descriptors. This breaks Realm
guests when common-trap trapping is enabled, including on systems
without ICH_HCR_EL2.TDIR.

Prepare REC exits in the state expected by the existing vGIC dispatcher
and invoke it before KVM synchronizes the vGIC hardware state. Complete
handled accesses through the REC run structure and re-enter the REC.

This reuses the existing vGIC emulation unchanged and allows Realm
guests to run with the non-TDIR/common-trap configuration.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 arch/arm64/kvm/rmi-exit.c |  21 +------
 arch/arm64/kvm/rmi.c      | 122 ++++++++++++++++++++++++++++++++++----
 2 files changed, 112 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
index 7cde820bb77b..0580433eb335 100644
--- a/arch/arm64/kvm/rmi-exit.c
+++ b/arch/arm64/kvm/rmi-exit.c
@@ -22,21 +22,14 @@ static int rec_exit_fatal(struct kvm_vcpu *vcpu, const char *reason,
 static void rec_exit_sync(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
-	u64 esr = rec->run->exit.esr;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
 	u8 ec = ESR_ELx_EC(esr);
 
 	switch (ec) {
-	case ESR_ELx_EC_SYS64: {
-		int rt = ESR_ELx_SYS64_ISS_RT(esr);
-		bool is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) ==
-				ESR_ELx_SYS64_ISS_DIR_WRITE;
-
-		if (is_write && rt < REC_RUN_GPRS)
-			vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
-		else if (!is_write)
+	case ESR_ELx_EC_SYS64:
+		if ((esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_READ)
 			kvm_make_request(KVM_REQ_RMI, vcpu);
 		break;
-	}
 	case ESR_ELx_EC_DABT_LOW:
 		/*
 		 * The RMM reports the value of an MMIO write in gprs[0],
@@ -141,14 +134,6 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
 		return rec_exit_fatal(vcpu, "Unexpected REC_ENTER status",
 				      rec_run_ret);
 
-	vcpu->arch.fault.esr_el2 = rec->run->exit.esr;
-	vcpu->arch.fault.far_el2 = rec->run->exit.far;
-	/* HPFAR_EL2 is only valid for RMI_EXIT_SYNC */
-	vcpu->arch.fault.hpfar_el2 = 0;
-
-	/* Reset the emulation flags for the next run of the REC */
-	rec->run->enter.flags = 0;
-
 	switch (rec->run->exit.exit_reason) {
 	case RMI_EXIT_SYNC:
 		/*
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index c242dfc2c7a6..756281b0054a 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1251,23 +1251,28 @@ static int kvm_rec_complete_psci(struct kvm_vcpu *vcpu)
 	return r ?: 1;
 }
 
+static void noinstr kvm_rec_complete_sysreg_access(struct kvm_vcpu *vcpu)
+{
+	struct realm_rec *rec = &vcpu->arch.rec;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+	int rt;
+
+	if (ESR_ELx_EC(esr) != ESR_ELx_EC_SYS64 ||
+	    (esr & ESR_ELx_SYS64_ISS_DIR_MASK) != ESR_ELx_SYS64_ISS_DIR_READ)
+		return;
+
+	rt = kvm_vcpu_sys_get_rt(vcpu);
+	if (rt < REC_RUN_GPRS)
+		rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
+}
+
 int kvm_rec_handle_request(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
-	u64 esr;
 
 	switch (rec->run->exit.exit_reason) {
 	case RMI_EXIT_SYNC:
-		esr = rec->run->exit.esr;
-		if (ESR_ELx_EC(esr) == ESR_ELx_EC_SYS64 &&
-		    (esr & ESR_ELx_SYS64_ISS_DIR_MASK) ==
-				ESR_ELx_SYS64_ISS_DIR_READ) {
-			int rt = ESR_ELx_SYS64_ISS_RT(esr);
-
-			if (rt < REC_RUN_GPRS)
-				rec->run->enter.gprs[rt] =
-					vcpu_get_reg(vcpu, rt);
-		}
+		kvm_rec_complete_sysreg_access(vcpu);
 		break;
 	case RMI_EXIT_PSCI:
 		return kvm_rec_complete_psci(vcpu);
@@ -1302,14 +1307,105 @@ static void noinstr load_realm_timer_state(struct kvm_vcpu *vcpu)
 	write_sysreg_el0(rec_exit->cntp_ctl, SYS_CNTP_CTL);
 }
 
+static void noinstr rec_prepare_exit_state(struct kvm_vcpu *vcpu)
+{
+	struct realm_rec *rec = &vcpu->arch.rec;
+	u64 esr = rec->run->exit.esr;
+	bool is_write;
+	int rt;
+
+	vcpu->arch.fault.esr_el2 = esr;
+	vcpu->arch.fault.far_el2 = rec->run->exit.far;
+	/* HPFAR_EL2 is only valid for RMI_EXIT_SYNC */
+	vcpu->arch.fault.hpfar_el2 = 0;
+
+	/* Reset the emulation flags for the next run of the REC */
+	rec->run->enter.flags = 0;
+
+	is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) ==
+		   ESR_ELx_SYS64_ISS_DIR_WRITE;
+	if (rec->run->exit.exit_reason != RMI_EXIT_SYNC ||
+	    ESR_ELx_EC(esr) != ESR_ELx_EC_SYS64 || !is_write)
+		return;
+
+	rt = kvm_vcpu_sys_get_rt(vcpu);
+	if (rt < REC_RUN_GPRS)
+		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
+}
+
+static int noinstr rec_perform_vgic_cpuif_access(struct kvm_vcpu *vcpu)
+{
+	unsigned long elr, spsr, pc, pstate;
+	int handled;
+
+	elr = read_sysreg_el2(SYS_ELR);
+	spsr = read_sysreg_el2(SYS_SPSR);
+	pc = *vcpu_pc(vcpu);
+	pstate = *vcpu_cpsr(vcpu);
+
+	/*
+	 * RMM has already completed the trapped Realm instruction.
+	 * Install disposable AArch64 exception-return state for
+	 * the PC adjustment made by the existing early VGIC
+	 * dispatcher, and restore both views before returning to
+	 * the Realm plumbing.
+	 */
+	*vcpu_cpsr(vcpu) = PSR_MODE_EL1h;
+	write_sysreg_el2(0, SYS_ELR);
+	write_sysreg_el2(PSR_MODE_EL1h, SYS_SPSR);
+
+	handled = __vgic_v3_perform_cpuif_access(vcpu);
+
+	write_sysreg_el2(elr, SYS_ELR);
+	write_sysreg_el2(spsr, SYS_SPSR);
+	*vcpu_pc(vcpu) = pc;
+	*vcpu_cpsr(vcpu) = pstate;
+
+	return handled;
+}
+
+static bool noinstr rec_handle_vgic_cpuif_exit(struct kvm_vcpu *vcpu)
+{
+	struct realm_rec *rec = &vcpu->arch.rec;
+	u64 esr;
+
+	if (!static_branch_unlikely(&vgic_v3_cpuif_trap))
+		return false;
+
+	esr = kvm_vcpu_get_esr(vcpu);
+	if (rec->run->exit.exit_reason != RMI_EXIT_SYNC ||
+	    ESR_ELx_EC(esr) != ESR_ELx_EC_SYS64)
+		return false;
+
+	if (rec_perform_vgic_cpuif_access(vcpu) != 1)
+		return false;
+
+	kvm_rec_complete_sysreg_access(vcpu);
+
+	/*
+	 * The emulation may have updated ICH_HCR_EL2.EOIcount.
+	 * Synchronize that update before reading ICH_HCR_EL2
+	 * again to enable the CPU interface.
+	 */
+	isb();
+	sysreg_clear_set_s(SYS_ICH_HCR_EL2, 0, ICH_HCR_EL2_En);
+
+	return true;
+}
+
 int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
 	int ret;
 
-	ret = rmi_rec_enter(rec->rec_phys, rec->run_phys);
-	if (!ret)
+	do {
+		ret = rmi_rec_enter(rec->rec_phys, rec->run_phys);
+		if (ret)
+			break;
+
 		load_realm_timer_state(vcpu);
+		rec_prepare_exit_state(vcpu);
+	} while (rec_handle_vgic_cpuif_exit(vcpu));
 
 	return ret;
 }
-- 
2.43.0

> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v16
> ---
>  arch/arm64/kvm/arm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index fd4e13ff17cf..7edc572dd8ab 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -125,6 +125,12 @@ static bool vgic_present, kvm_arm_initialised;
>  
>  static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
>  
> +static bool kvm_arm_rmi_supported(void)
> +{
> +	return static_key_enabled(&kvm_rmi_is_available) &&
> +	       cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR);
> +}
> +
>  bool is_kvm_arm_initialised(void)
>  {
>  	return kvm_arm_initialised;
> @@ -256,7 +262,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  		return -EINVAL;
>  
>  	if (type & KVM_VM_TYPE_ARM_REALM) {
> -		if (!static_branch_unlikely(&kvm_rmi_is_available))
> +		if (!kvm_arm_rmi_supported())
>  			return -EINVAL;
>  		kvm_set_realm_state(kvm, REALM_STATE_NONE);
>  		kvm->arch.is_realm = true;
> @@ -537,7 +543,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  			r = kvm_supports_cacheable_pfnmap();
>  		break;
>  	case KVM_CAP_ARM_RMI:
> -		r = static_key_enabled(&kvm_rmi_is_available);
> +		r = kvm_arm_rmi_supported();
>  		break;
>  
>  	default:
> -- 
> 2.43.0
> 

