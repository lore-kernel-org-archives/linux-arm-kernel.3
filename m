Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n+qMn7mM;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JEGBT4X8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j3o4Hr1tImNLf1ZatEPhpw+q0Mj2sL9CPD7ffrsuWjI=; b=n+qMn7mMg5DBN6IxPNHbkU4hl4
	6lJMXOScdD3qRXOSx+q9jPpaJcIr49TEPfm7jl/vi9Fgajzq7olxF0BMn+RwEnzQOhFAqIHHrEHyP
	crujsaXPMz8ceVuIyri/6niEN+BngtAozU0gXt3dbHwrEuAxr/jsUyoh6ciyrO9xOdRofpx7lmYEV
	tGA8RU8TkNjo5HoJfgofrXdgQFH1N+zZBN/PxqLUdtURVILUh4OFL7UzswXR5cY/T4G4d7hkUR0q2
	pFNHooL8xDAITlUtr/9siFg8u7AYHg0FQeheoUYY3CwT2b6B+wyAVPuvacvhecwBEd/AP4aC7lCvj
	av0AFnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXY-0000000Awwv-2QvR;
	Fri, 30 Oct 2026 06:56:40 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgXU-0000000AwrG-2Eld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:56:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j3o4Hr1tImNLf1ZatEPhpw+q0Mj2sL9CPD7ffrsuWjI=;
	b=JEGBT4X8yV888GI99lgi2m3H0Y541wkKwjqRq3YKadT94vflq6LzOdYnbgjuHferKblDfx3wj
	YEQ73qEWgmtkNFqti798dOdhy9TlRNBhEdetNvLAsfSbaFNK1t4jhdW92EjVTfSDR31tgpAPP4O
	1iq34tsO10T6uUWxxcb5Ao4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jGBhY00Ytz1cynJ;
	Fri, 30 Oct 2026 14:56:12 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id E76374055B;
	Fri, 30 Oct 2026 14:56:20 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 14:56:20 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-doc@vger.kernel.org>
CC: <maz@kernel.org>, <oupton@kernel.org>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<kristina.martsenko@arm.com>, <pbonzini@redhat.com>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <prime.zeng@hisilicon.com>
Subject: [RFC 5/6] KVM: arm64: Conditionally expose ID_AA64MMFR4_EL1.TLBID to guest
Date: Fri, 30 Oct 2026 14:56:16 +0800
Message-ID: <20261030065617.4090073-6-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261030065617.4090073-1-yangjinqian1@huawei.com>
References: <20261030065617.4090073-1-yangjinqian1@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_235636_881677_7D470556 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TLBID feature bit in ID_AA64MMFR4_EL1 is only advertised to the
guest after userspace configures vDomains via KVM_ARM_VCPU_SET_VDOMAIN,
which sets the guest_tlbid_enabled flag. Until then the bit is masked
to prevent the guest from enabling TLBID without a valid vDomain
affinity.

Exposing the feature would otherwise let the guest read the physical
TLBIDIDR_EL1 directly, so keep that register trapped in the guest
FGT context and served by the emulation added earlier. The host's
own register is never affected.

Expose KVM_REG_ARM_ID_AA64MMFR4_EL1 in the arm64 UAPI header so
userspace can read the sanitised value via KVM_GET_ONE_REG.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/uapi/asm/kvm.h |  2 ++
 arch/arm64/kvm/arm.c              |  2 ++
 arch/arm64/kvm/config.c           | 11 +++++++
 arch/arm64/kvm/sys_regs.c         | 49 +++++++++++++++++++++++++++++--
 arch/arm64/kvm/sys_regs.h         |  6 ++++
 5 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 019e5e3d892e..e54129ed431d 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -255,6 +255,8 @@ struct kvm_arm_counter_offset {
 
 #define ARM64_SYS_REG(...) (__ARM64_SYS_REG(__VA_ARGS__) | KVM_REG_SIZE_U64)
 
+#define KVM_REG_ARM_ID_AA64MMFR4_EL1 ARM64_SYS_REG(3, 0, 0, 7, 4)
+
 /* Physical Timer EL0 Registers */
 #define KVM_REG_ARM_PTIMER_CTL		ARM64_SYS_REG(3, 3, 14, 2, 1)
 #define KVM_REG_ARM_PTIMER_CVAL		ARM64_SYS_REG(3, 3, 14, 2, 2)
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ddf7c25f9ed9..b5ab89db1c07 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2313,6 +2313,8 @@ static int kvm_arm_vcpu_set_vdomain(struct kvm_vcpu *vcpu,
 
 	kvm_info("vCPU%d: vDomain bitmap: 0x%x\n", vcpu->vcpu_idx, vdomain_bitmap);
 
+	kvm_update_aa64mmfr4_tlbid(vcpu->kvm);
+
 	return 0;
 }
 #else
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 6c116aa1864a..d0402151a752 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1536,6 +1536,17 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 	case HFGRTR2_GROUP:
 		val |= compute_fgu_bits(kvm, &hfgrtr2_desc);
 		val |= compute_fgu_bits(kvm, &hfgwtr2_desc);
+#ifdef CONFIG_KVM_ARM_VTLBID
+		/*
+		 * TLBIDIDR_EL1 must stay trapped even when TLBID is
+		 * exposed to the guest, so it can be emulated with the
+		 * synthesized virtual domain counts. This only affects
+		 * the guest FGT context; the host's own HFGRTR2_EL2 is
+		 * never modified.
+		 */
+		if (kvm->arch.tlbidomain.kvm_tlbid_enabled)
+			val |= HFGRTR2_EL2_nTLBIDIDR_EL1;
+#endif
 		break;
 	case HFGITR2_GROUP:
 		val |= compute_fgu_bits(kvm, &hfgitr2_desc);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index cf9804e54ff1..a1ca7309406e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2012,9 +2012,17 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!system_supports_poe())
 			val &= ~ID_AA64MMFR3_EL1_S1POE;
 		break;
-	case SYS_ID_AA64MMFR4_EL1:
+	case SYS_ID_AA64MMFR4_EL1: {
+#ifdef CONFIG_KVM_ARM_VTLBID
+		struct tlbidomain *vdomain = &vcpu->kvm->arch.tlbidomain;
+
+		if (!vdomain->guest_tlbid_enabled)
+			val &= ~ID_AA64MMFR4_EL1_TLBID;
+#else
 		val &= ~ID_AA64MMFR4_EL1_TLBID;
+#endif
 		break;
+	}
 	case SYS_ID_MMFR4_EL1:
 		val &= ~ID_MMFR4_EL1_CCIDX;
 		break;
@@ -3494,7 +3502,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64MMFR3_EL1_SCTLRX	|
 				       ID_AA64MMFR3_EL1_S1PIE   |
 				       ID_AA64MMFR3_EL1_S1POE)),
-	ID_WRITABLE(ID_AA64MMFR4_EL1, ID_AA64MMFR4_EL1_NV_frac),
+	ID_WRITABLE(ID_AA64MMFR4_EL1, ID_AA64MMFR4_EL1_NV_frac |
+				    ID_AA64MMFR4_EL1_TLBID_MASK),
 	ID_UNALLOCATED(7,5),
 	ID_UNALLOCATED(7,6),
 	ID_UNALLOCATED(7,7),
@@ -5495,6 +5504,42 @@ static bool index_to_params(u64 id, struct sys_reg_params *params)
 	}
 }
 
+/*
+ * Update the VM's stored value for an ID register.
+ */
+#ifdef CONFIG_KVM_ARM_VTLBID
+void kvm_update_aa64mmfr4_tlbid(struct kvm *kvm)
+{
+	struct tlbidomain *vdomain = &kvm->arch.tlbidomain;
+	u64 val, tlbid_val;
+
+	mutex_lock(&kvm->arch.config_lock);
+
+	if (kvm_vm_has_ran_once(kvm)) {
+		/*
+		 * ID_AA64MMFR4 is a VM-level register already set during
+		 * the first vCPU init. Skip the write to avoid triggering
+		 * KVM_BUG_ON in kvm_set_vm_id_reg(). The per-vCPU
+		 * vdomain_bitmap is still updated by the caller.
+		 */
+		mutex_unlock(&kvm->arch.config_lock);
+		return;
+	}
+
+	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR4_EL1);
+	tlbid_val = read_sanitised_ftr_reg(SYS_ID_AA64MMFR4_EL1);
+	tlbid_val &= ID_AA64MMFR4_EL1_TLBID_MASK;
+
+	val &= ~ID_AA64MMFR4_EL1_TLBID_MASK;
+	if (vdomain->guest_tlbid_enabled)
+		val |= tlbid_val;
+
+	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR4_EL1, val);
+
+	mutex_unlock(&kvm->arch.config_lock);
+}
+#endif
+
 const struct sys_reg_desc *get_reg_by_id(u64 id,
 					 const struct sys_reg_desc table[],
 					 unsigned int num)
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index bd56a45abbf9..0b5487947790 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -252,6 +252,12 @@ int kvm_sys_reg_get_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 			 const struct sys_reg_desc table[], unsigned int num);
 
+#ifdef CONFIG_KVM_ARM_VTLBID
+void kvm_update_aa64mmfr4_tlbid(struct kvm *kvm);
+#else
+static inline void kvm_update_aa64mmfr4_tlbid(struct kvm *kvm) { }
+#endif
+
 bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index);
 
 int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu);
-- 
2.33.0


