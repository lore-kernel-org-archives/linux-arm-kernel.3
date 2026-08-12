Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08383C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U18O0gCKgALa+XbZC+EvXju0IjuEjqVEq5R1cGYDB6c=; b=Y0AdN7Z7GY9OYutE6zp4pVoBlN
	IjavPHSqRUD4mmXcNTpicgLMKigO5SKv4/mg8ZCkv1hNDI4fo1UGeAbCYk0+ZjE8SZeQnGpJrwMv5
	tl6kkrVh3vB+BbNboXU95fIAKI4ylqAeL2nhl5yPXivtYO76q6ngjYHsHNFeoO9ow+QhT5yS7kqXw
	VOFnhHcZ0pHrWzFe55ji0inqMWAl4CU+CiiaZvTTbH+khB7nOjEvfECK3jfjkbNji8ASrDAZNWj+G
	x6F2IGmdekO6NGlWMj6JK/WVoXXlc4xTrDlVeERoZJlEhcuHq8dWjx3KE8x50qj5ZrXxkvpp+2Dlv
	1merz//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB18-0000000GURS-0ce8;
	Wed, 12 Aug 2026 15:37:22 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0g-0000000GTtL-13x4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:36:59 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE1tDl3594435;
	Wed, 12 Aug 2026 15:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=U18O0gCKgALa+XbZC
	+EvXju0IjuEjqVEq5R1cGYDB6c=; b=Zi1WvFFf93bV0tBRYnzILg+u46RE5Zf7z
	OEx24FKzT9EIIUl9NynuUi0poCwfU+CNDzFoIfQislUvfZBOl1FELWGu3+mM+lsB
	hLosVWUm+bOF6sKFaR5H6Y6jXyucqi0zKbMcMW4pmkR3huM8FQO5sbLPquyZeGau
	PvCpUQpnJ36F+UxAJMJFaakYYS6UfQ92VsD0u2HNjpWZmgZpPdEbFLVJTd4t+NzJ
	RyYwpe3lihRzE7XxYT490yqwxGsG+w0jRbVu0qmXQEYVKMhpdnymna6nV1/yESxO
	FKqQgp26RJmbXxaA+WkvRSRJrcdnGW3acRFwkhcVb8go7uriPgpJA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp32e1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFQIpB021717;
	Wed, 12 Aug 2026 15:36:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxhfy6g3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFaZ7u38404606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADD472004B;
	Wed, 12 Aug 2026 15:36:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 670472004F;
	Wed, 12 Aug 2026 15:36:35 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 15:36:35 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v6 09/33] arm64: Prepare sharing arm64 headers with s390
Date: Wed, 12 Aug 2026 17:36:05 +0200
Message-ID: <20260812153631.3376090-10-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7c9308 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=CvB7ObVER1VTR8-vp5wA:9
X-Proofpoint-GUID: sV3KgM9W7HkqCkJES1T2_u9se0kqIrJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX1Zeji/METrWj
 EgY35Q9j3h6xHElOkND5TQU6w/3VQRXg3ltQyn5GL5cSgd6qlKhlc1UUkkL/skr9ejNbQD5Migl
 g23SILHVk2fonR4WARvF9a2Rw1uyX4vI9u7v0v3cgldkvWL4Qx27RhOTOLZLAYl4zsiQqBYiWb1
 6GDDvtLuOF1bCYDt9Qlxwh9EF1YCG5/VkgOvgvJf20IfrSFxBD1oIy4IMHCRflhWBuPyGr7Qdy9
 234vwCTM39qMbHXEbcrT4JsmTQfrcorhcjd2Y+ijxYx9HI480yHADH9vv2EtTzSz3E72naiJBJT
 oy/YhkQb2itDwLIG5bgTsW5mWThCmzehmcBb7ciAt2X0apvd++JOt0uI6mIz8qT3C3FRerEytQt
 gZm4sgYmTmGed+OeDv/C1AtKdJj2xyOz1xUcNE590tzjVDvzW7xuzWoCKRq2BwyU6BAVXTjaR+z
 Y98heJU6lM/yvxnc59A==
X-Proofpoint-ORIG-GUID: hQ3rD-W-G9yHiPNUPcCiy-wWKmBtIlgw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfXynTp/phZlpTJ
 jlliUKTgVyWVbaC5YpTy50es4aEPYEuqyxOtkq4G8hQig9Z+7rKIFcrs5X7/ntiM7s6B35Ca25m
 Y9dF8L9oJC8X+5vx/FvJ7qePOWMGu1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083654_434819_C4601406 
X-CRM114-Status: GOOD (  20.48  )
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

Prepare the sharing of arm64 headers with s390 by moving a few
definitions inside headers to reduce the number of shared markers.
Clean up some includes to further streamline the sharing of headers.

No functional change.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/esr.h         |  4 +-
 arch/arm64/include/asm/kvm_arm.h     |  5 ++-
 arch/arm64/include/asm/kvm_emulate.h |  5 ++-
 arch/arm64/include/asm/kvm_host.h    | 59 ++++++++++++++--------------
 arch/arm64/include/asm/sysreg.h      |  2 +-
 5 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index f816f5d77f1a..da085c83b57e 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_ESR_H
 #define __ASM_ESR_H
 
-#include <asm/memory.h>
+#include <asm/brk-imm.h>
 #include <asm/sysreg.h>
 
 #define ESR_ELx_EC_UNKNOWN	UL(0x00)
@@ -435,7 +435,7 @@
 #define ESR_ELx_IT_GCSPOPX		7
 
 #ifndef __ASSEMBLER__
-#include <asm/types.h>
+#include <linux/types.h>
 
 static inline unsigned long esr_brk_comment(unsigned long esr)
 {
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 4bfbd827c5aa..57edd8437200 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -7,10 +7,11 @@
 #ifndef __ARM64_KVM_ARM_H__
 #define __ARM64_KVM_ARM_H__
 
+#include <linux/const.h>
+#include <linux/bits.h>
+#include <linux/types.h>
 #include <asm/esr.h>
-#include <asm/memory.h>
 #include <asm/sysreg.h>
-#include <asm/types.h>
 
 /*
  * Because I'm terribly lazy and that repainting the whole of the KVM
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b31d50bdf59e..a34a9417ff4d 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -44,11 +44,12 @@ enum exception_type {
 bool kvm_condition_valid32(const struct kvm_vcpu *vcpu);
 void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 
+int kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr);
+int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
+
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
 void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
-int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
-int kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr);
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
 
 static inline int kvm_inject_sea_dabt(struct kvm_vcpu *vcpu, u64 addr)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 46c8d7928b3f..22770c1132cb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -56,6 +56,36 @@
 #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
 #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
 
+/*
+ * If we encounter a data abort without valid instruction syndrome
+ * information, report this to user space.  User space can (and
+ * should) opt in to this feature if KVM_CAP_ARM_NISV_TO_USER is
+ * supported.
+ */
+#define KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER	0
+/* Memory Tagging Extension enabled for the guest */
+#define KVM_ARCH_FLAG_MTE_ENABLED			1
+/* At least one vCPU has ran in the VM */
+#define KVM_ARCH_FLAG_HAS_RAN_ONCE			2
+/* The vCPU feature set for the VM is configured */
+#define KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED		3
+/* PSCI SYSTEM_SUSPEND enabled for the guest */
+#define KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED		4
+/* VM counter offset */
+#define KVM_ARCH_FLAG_VM_COUNTER_OFFSET			5
+/* Timer PPIs made immutable */
+#define KVM_ARCH_FLAG_TIMER_PPIS_IMMUTABLE		6
+/* Initial ID reg values loaded */
+#define KVM_ARCH_FLAG_ID_REGS_INITIALIZED		7
+/* Fine-Grained UNDEF initialised */
+#define KVM_ARCH_FLAG_FGU_INITIALIZED			8
+/* SVE exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
+/* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace */
+#define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
+/* Unhandled SEAs are taken to userspace */
+#define KVM_ARCH_FLAG_EXIT_SEA				11
+
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
 
@@ -338,35 +368,6 @@ struct kvm_arch {
 	/* Protects VM-scoped configuration data */
 	struct mutex config_lock;
 
-	/*
-	 * If we encounter a data abort without valid instruction syndrome
-	 * information, report this to user space.  User space can (and
-	 * should) opt in to this feature if KVM_CAP_ARM_NISV_TO_USER is
-	 * supported.
-	 */
-#define KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER	0
-	/* Memory Tagging Extension enabled for the guest */
-#define KVM_ARCH_FLAG_MTE_ENABLED			1
-	/* At least one vCPU has ran in the VM */
-#define KVM_ARCH_FLAG_HAS_RAN_ONCE			2
-	/* The vCPU feature set for the VM is configured */
-#define KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED		3
-	/* PSCI SYSTEM_SUSPEND enabled for the guest */
-#define KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED		4
-	/* VM counter offset */
-#define KVM_ARCH_FLAG_VM_COUNTER_OFFSET			5
-	/* Timer PPIs made immutable */
-#define KVM_ARCH_FLAG_TIMER_PPIS_IMMUTABLE		6
-	/* Initial ID reg values loaded */
-#define KVM_ARCH_FLAG_ID_REGS_INITIALIZED		7
-	/* Fine-Grained UNDEF initialised */
-#define KVM_ARCH_FLAG_FGU_INITIALIZED			8
-	/* SVE exposed to guest */
-#define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
-	/* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace */
-#define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
-	/* Unhandled SEAs are taken to userspace */
-#define KVM_ARCH_FLAG_EXIT_SEA				11
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 1aa601c95188..ab205f9db94a 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1263,6 +1263,6 @@
 		 FIELD_PREP(reg##_##field##_MASK,	\
 			    SYS_FIELD_VALUE(reg, field, val))
 
-#endif
+#endif /* __ASSEMBLER__ */
 
 #endif	/* __ASM_SYSREG_H */
-- 
2.53.0


