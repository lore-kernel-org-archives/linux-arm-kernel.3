Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B97C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1/4QFqdV698fTwsjnx4Knwlcb+sMgn8eD0jO+RRChk=; b=yLVAwAmAJbex3bez8ZdGylrcDs
	ITOScveZl+w4u7aj26uotHbNGZuWf0s/D9G8U5c7EIMJh9/v3qOe7z1RKSlkn/QlG7srtDZAsx0xb
	PDz7F330yYsmDhkjXlfyE5meHdYR4Hj7o4SCEWa9mPG6jLNNmgjRxk7Gbe/3cFTbM5cnfT3lMbhhL
	iM4+ZCPWkPQtedoaumNYziwXXt41f8ZOwdy5bGcsY7lpTTpErPQAoKthx8MRXp9lBjwofYSeIbykm
	wY/dtTmjgQ6ajok09HQX19IFfh5L6KRQFyFr8JnqoRZGdqtFsP5rUamAx0TLtXm9g7d8Qfs//87GK
	2mpa0TUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRHN-0000000C4gf-0NmG;
	Mon, 10 Aug 2026 14:47:05 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRHL-0000000C4fv-0hY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786373227; x=1817909227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=99XkH2IMF7D6nyHbHISy+8bb2LKxW8tAVwIQzhTqFok=;
  b=GuPSJ7lhZN8WfwZkLoqY2buGEDZh1I1dnLs5aSmH9YI0Lj3v5+VNVnFA
   kAzsuIsMMSMnnvR2CYTNY+AyG4KE3sd2UJ7ki9NRZdETbsRWfxOjIOZXn
   X2/MyCqdtVlpJpHmUQznBDx7SacFb7auveQhcquGzmCuMTWZFsUrLVHA7
   8b05OPtoxcvN1TO0toEfd22nWS/BkefayRoD5FOgKMJt6cLP766HV3Hrr
   ea+6GRGU0UGwMrMG0tIpDYNXHYOXc9DgsWLbY91gAqQMYsgdek45Xsoze
   qXL4do2lPRfdxH/jJEmVTI2h/oyKi23RhN8B/tctt3u/H78sUctXVpPEA
   A==;
X-CSE-ConnectionGUID: NgOdpG8KQwq9u9i1CfgLqA==
X-CSE-MsgGUID: ePCuH5v0QhWymeA+gzD6DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="250455916"
X-IronPort-AV: E=Sophos;i="6.25,215,1779116400"; 
   d="scan'208";a="250455916"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 23:47:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3E2A31C000AB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:47:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E96AA1025E81
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:46:59 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.24.243])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id 503D314000B0;
	Mon, 10 Aug 2026 14:46:52 +0000 (UTC)
Date: Mon, 10 Aug 2026 23:46:50 +0900
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
Subject: Re: [PATCH v16 30/45] KVM: arm64: CCA: Handle realm vCPU load
Message-ID: <annfY97FFA8ZuoHE@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-31-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803134403.80630-31-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074703_510791_EA40BEFF 
X-CRM114-Status: GOOD (  23.93  )
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

On 08/03 14:43, Steven Price wrote:
> When loading a realm VCPU much of the work is handled by the RMM so only
> some of the actions are required. Rearrange kvm_arch_vcpu_load()
> slightly so we can bail out early for a realm guest.

Hi Steven,

I found that Realm guests can execute WFI/WFE instructions without
causing a REC exit, ignoring KVM's WFx trap policy.

I'd suggest translating HCR_EL2.TWE/TWI into the corresponding
run->enter.flags to honor the policy. Below is the patch I tested.

----
From 8637cd6f818a3c56d8b898a72874e9485eb94e59 Mon Sep 17 00:00:00 2001
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Mon, 10 Aug 2026 22:54:27 +0900
Subject: [PATCH] KVM: arm64: CCA: Honor WFx trap policy for Realm vCPUs

Propagate KVM's WFx trap policy to the RMM by translating
HCR_EL2.TWE/TWI into REC_ENTER TRAP_WFE/WFI flags before entering a REC.

Without this, guests can execute WFE/WFI instructions without causing a
REC exit, ignoring KVM's common trap policy. Configure the REC_ENTER
flags to honor the policy.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 arch/arm64/include/asm/kvm_rmi.h |  2 ++
 arch/arm64/kvm/arm.c             |  3 +++
 arch/arm64/kvm/rmi.c             | 14 ++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 2789879b6701..b858c6b4db6a 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -109,6 +109,8 @@ void kvm_destroy_realm(struct kvm *kvm);
 int kvm_realm_teardown_stage2(struct kvm *kvm);
 void kvm_destroy_rec(struct kvm_vcpu *vcpu);
 
+void kvm_rec_set_wfx_traps(struct kvm_vcpu *vcpu);
+
 int kvm_rec_enter(struct kvm_vcpu *vcpu);
 int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
 int kvm_rec_handle_request(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7edc572dd8ab..0cba333b4fd2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -770,6 +770,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TWI;
 
+	if (vcpu_is_rec(vcpu))
+		kvm_rec_set_wfx_traps(vcpu);
+
 	vcpu_set_pauth_traps(vcpu);
 
 	if (is_protected_kvm_enabled()) {
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index c242dfc2c7a6..c472f3d03234 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1302,6 +1302,20 @@ static void noinstr load_realm_timer_state(struct kvm_vcpu *vcpu)
 	write_sysreg_el0(rec_exit->cntp_ctl, SYS_CNTP_CTL);
 }
 
+void kvm_rec_set_wfx_traps(struct kvm_vcpu *vcpu)
+{
+	struct realm_rec *rec = &vcpu->arch.rec;
+
+	rec->run->enter.flags &=
+		~(REC_ENTER_FLAG_TRAP_WFE | REC_ENTER_FLAG_TRAP_WFI);
+
+	if (vcpu->arch.hcr_el2 & HCR_TWE)
+		rec->run->enter.flags |= REC_ENTER_FLAG_TRAP_WFE;
+
+	if (vcpu->arch.hcr_el2 & HCR_TWI)
+		rec->run->enter.flags |= REC_ENTER_FLAG_TRAP_WFI;
+}
+
 int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
-- 
2.43.0

> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/kvm/arm.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f1b26b263bf0..96e536d2dda8 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -707,7 +707,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	struct kvm_s2_mmu *mmu;
>  	int *last_ran;
>  
> -	if (is_protected_kvm_enabled())
> +	if (is_protected_kvm_enabled() || kvm_is_realm(vcpu->kvm))
>  		goto nommu;
>  
>  	if (vcpu_has_nv(vcpu))
> @@ -751,12 +751,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	kvm_vgic_load(vcpu);
>  	kvm_vcpu_load_debug(vcpu);
>  	kvm_vcpu_load_fgt(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_load_vhe(vcpu);
> -	kvm_arch_vcpu_load_fp(vcpu);
> -	kvm_vcpu_pmu_restore_guest(vcpu);
> -	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> -		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>  
>  	if (kvm_vcpu_should_clear_twe(vcpu))
>  		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> @@ -778,6 +772,17 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  			     &vcpu->arch.vgic_cpu.vgic_v3);
>  	}
>  
> +	/* No additional state needs to be loaded on Realmed VMs */
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +
> +	if (has_vhe())
> +		kvm_vcpu_load_vhe(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +
>  	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>  		vcpu_set_on_unsupported_cpu(vcpu);
>  
> -- 
> 2.43.0
> 

