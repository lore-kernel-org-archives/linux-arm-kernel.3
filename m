Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FADCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pouyu0md0pOQ7mltBS1BqlrweoASWl9Mh5ief8QXEAw=; b=3TItPlffkX4deP4GXAPwcxewGc
	6eOSdigYj+K11FtoFZQeUH4I25M6+5J4/ZnO3v/ToyaQEuujaDuBGShqug5Nlh3+wgRKDM/1GAO/h
	HS3Vx42T2veBfKqUNpqHVBaucrkwaKp/K4GccQ4IRohogbLh+rXe7JrMvtssM6M573aSZQ+cGvkwh
	WEuhVgrNBHIKqUJYoQe3UGO0ClpkCoXUMQQu04dytqKhHpbublNVceV2V+jcMht6VUs+eVGNM1EVB
	H317zu3j3+0t7ys4LKka4NHNCpk2c/TAlm7842GJZs4a0FubjEjmaP7+ql9IBhMTtyWPDzkIlInX6
	pO6bgGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtgY-0000000D6KJ-45Qb;
	Sat, 03 Oct 2026 06:57:30 +0000
Received: from out-238.mta1.migadu.com ([2001:41d0:203:375::ee] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtgO-0000000D6Ie-2c2K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 06:57:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qAjh3bfwDAvjQn/H8WWXm9R9SMLHj6n2zlRKEO0SzGo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791010634; v=1; x=1791615434;
 b=s+c0TbYx8ANQL7IKl00ojtA4/6jHRoxaEMUg37BO5RRxZ7Re4qSw+K49OncJg56qVq/8skvv
 w475h4DcGt83aP/cuKfiY/xrp6gLdzEOhmbditnmWZtvo/rz3s8teoROTz/Ges/aNN/tnZrJgL+
 tMWUo00nfCUeTxNOvwM92bsY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1a5d39d0f43f4466;
	Sat, 03 Oct 2026 06:57:14 +0000
X-Mizu-Trace-ID: 1a5d39d0f43f4466
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 00/18] KVM: arm64: Confine protected VM vCPU state to EL2
Date: Sat,  3 Oct 2026 07:57:13 +0100
Message-Id: <20261003065713.3872839-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <179095643711.351883.2924159912626438826.b4-ty@b4>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev> <179095643711.351883.2924159912626438826.b4-ty@b4>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_235720_870640_8AF269DE 
X-CRM114-Status: GOOD (  14.23  )
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

On Fri, 02 Oct 2026 16:55:26 +0100, Marc Zyngier <maz@kernel.org> wrote:

[...]

> Given how busy this merge window is, there were plenty of conflicts, most
> of them with your own patches. Please have a look at the way I resolved
> them and let me know if anything is on the bogus side of wrong...

Thanks for taking these, and for sorting out the conflicts. Most of the
resolution matches mine, but two things in the pkvm-state merge are off:

- In __kvm_vcpu_run(), the !host_vcpu and SVCR bail-outs still return
  -EINVAL. Patch 10 changed them to ARM_EXCEPTION_IL, since the host
  reads bit 31 of -EINVAL as a pending SError.

- In __kvm_adjust_pc(), the pin path uses kern_hyp_va() on the __kern
  pointer, which sparse flags. It needs kern_hyp_va_host().

The diff below fixes both. It also drops the set_bit()s in
pkvm_init_features_from_host() that kvm_pkvm_vcpu_allowed_features()
already does, and realigns the esr_dabt_is_cm() line. Could you fold it
into the merge resolution?

With it applied on next, I booted protected and non-protected guests,
ran CPU hotplug in both, and ran the pKVM selftest (from my tree), all
passing.

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index c709a6ff7448b..1018c36ec39d1 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -244,7 +244,7 @@ static void handle_pvm_entry_dabt(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	/* Handle PC increment on MMIO, or on a CMO the host skipped */
 	pc_update = vcpu_get_flag(host_vcpu, INCREMENT_PC) &&
-		(vcpu->mmio_needed || esr_dabt_is_cm(kvm_vcpu_get_esr(vcpu)));
+		    (vcpu->mmio_needed || esr_dabt_is_cm(kvm_vcpu_get_esr(vcpu)));
 	if (pc_update) {
 		vcpu_clear_flag(vcpu, PC_UPDATE_REQ);
 		kvm_incr_pc(vcpu);
@@ -914,7 +914,7 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
 
 	host_vcpu = __get_host_hyp_vcpus(kern_hyp_va_host(vcpu), &hyp_vcpu);
 	if (!host_vcpu)
-		return -EINVAL;
+		return ret;
 
 	if (unlikely(hyp_vcpu)) {
 		/*
@@ -924,7 +924,7 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
 		 * is misbehaving.
 		 */
 		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR)))
-			return -EINVAL;
+			return ret;
 
 		/*
 		 * ON has a single writer, pkvm_reset_vcpu() on this CPU, so
@@ -1122,7 +1122,7 @@ DEFINE_KVM_HOST_HCALL(void, __kvm_adjust_pc,
 	 * for memory the host isn't sharing, a bad pointer, so the request
 	 * is dropped.
 	 */
-	host_vcpu = kern_hyp_va(vcpu);
+	host_vcpu = kern_hyp_va_host(vcpu);
 	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
 		return;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 03dbe1bf9fa90..f88ad9dc91191 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -413,20 +413,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	kvm_pkvm_vcpu_allowed_features(kvm, allowed_features);
 
-	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PMU_V3))
-		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE))
-		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
-
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 out:

Cheers,
/fuad

