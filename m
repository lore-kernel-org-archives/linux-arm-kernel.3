Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D8FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lqu8yDZOIB2XPsq12shZu88OGfY+ewFjRdnTWU6jZyU=; b=CU0+IJKPP3bLE2y4fAvsZpquKh
	vJRCbytSPyCETqsr2ms6EJFowAKz8IcJ/ZUJ9nNYWQzr0Su9bJ0//+yMlLFhugc+moHSeFgZIu/0g
	vm+q5XWtUagzJC5xo28YdX4AVJpmunxL3+a29odTDQzu/nUGm8eGJEcO7uLZXUGXwDYaU3Z1fPpMh
	e7yAni5OsWh/ybH06cmpvKlXgh4+cMvKpyGaFzZQ45b59Mt11buuYAC8owUOBcEQuPqMgrEBWggmq
	K1riQLKdnv3pqNU9wCfWPRQqhETtJ35T/0/KggRZxZpct2svcE7hbXOnBrb+H0oHfHkAggx4aKdVi
	aR1n0SRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkx5-00000001pyM-1PwL;
	Tue, 28 Apr 2026 16:06:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwr-00000001peJ-0t9o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 16:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Lqu8yDZOIB2XPsq12shZu88OGfY+ewFjRdnTWU6jZyU=; b=rhp1DzgphEKL7hM6+uzV0HAyN8
	NhiFnnXw9u4a1DbsBBGwFkNm13dbbn7KdezXTI3gOXQpWh7FcMgtdgeTdD5jwqu4DkQri8+gERAQe
	i2BZUCTLlZvI+70tN4zKZcM/kI6tLv6qvkI1Qo+0CnVm+KVw3XVSQUoCJDGoOD/0RlYHoShXlDT9Y
	Rk0AW4PIIlxV0cDgd7Owy3zZnhcwsu/5/wZnU6iYaKfJOK8PS8j1HPR1wq3zC1uJY6RenX1+Lh3BM
	Lhl17bAxOQn4eJr1x4MbfvKrax6ykdkke8YmeFsv00TBB+VHNxHaFPMcQ/keKviDYexf5R1A5Mue0
	7f+MIhUw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwj-00000003Xh9-1XQ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:06:06 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hRis4169201;
	Tue, 28 Apr 2026 16:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Lqu8yDZOIB2XPsq12
	shZu88OGfY+ewFjRdnTWU6jZyU=; b=JiNa1JHqaFQsrdIIWxL3LZZoehs5iiTPq
	PJAxYlOcqTr0uGEBh8XqXnB8pZHnsNApYSHi8dvxOPHH5IajNkqL6YrXMu9xV89K
	bPpSAoarOiNdaS42hzCH6K8tqG+4nm7J/mTdIjFcxaUicbYT85ZS/r91Jbk5e09H
	gf9KMEEGZZgms9KbNF3KZH7RE3BaXJskTqt15XHIfS+5mfTLGk8mdpJFm77dk8uA
	y8wNUEEayLbRk1pJpGtQOHoTr7I2muNvjNjKV15aaiyXshDQW56DbrHyHcwjzEy7
	/gwwY/Or1EUZYkLmuRjEhbEeoJu4Dy2ySd3fzEppix3eCMbQWycdQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drm1dw95p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63SFrohh015569;
	Tue, 28 Apr 2026 16:05:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ds8avthcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63SG5aX131785626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2026 16:05:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6774D20040;
	Tue, 28 Apr 2026 16:05:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16F2E2004B;
	Tue, 28 Apr 2026 16:05:36 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Apr 2026 16:05:36 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH v2 24/28] KVM: s390: Add basic arm64 kvm module
Date: Tue, 28 Apr 2026 18:05:21 +0200
Message-ID: <20260428160527.1378085-25-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428160527.1378085-1-seiden@linux.ibm.com>
References: <20260428160527.1378085-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JnMIc26_ktD33_xKIzInM1qK87BMxWpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1MSBTYWx0ZWRfXzwE9pTFZUrRv
 OVa6KsmIGwMH9hBxemyB4sDT5xXQ7aNxUIzDsv5547Xvq/Uled2c79ENLJy+N0DEmmA0rYFN8Bp
 8GD3hOj3kimF6a1NZaSSw9QgyNVra1S05f3cyvVZVvnIY5RN7OHt6JhoN33oKLN3Yf1xivBsUJT
 qOOH6BVWwz622jQlqO2KepLK6h27KsK74JV6dr0g0LV6E6ia/eMjkrNPnhO3hSVMQ6pfWy31t6v
 hZwZtBPGZsc+WBorPiRy/G0hRYAQ7AByVG1rFieh/L4uBxaSMIGTPE7jR2OQlvvC8rbhV8xg2j+
 otApGDI779xCVh8mc7y6op94kDVDvonjisrY3r5GLISlX962lgEsfTyMjXj50EKopy9lSri73Fz
 KBEWHp2qgrf95x0/kEEVft5zgE0cwIJ8LHO90Dql4Q4A5JZYH7j5gQ/VmdqBLVKWxumHPeZKFeQ
 saX9YhCs37z5GHBBbGg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=69f0dad5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=36xwF7fJQ_K8JzKkrRgA:9
X-Proofpoint-GUID: JnMIc26_ktD33_xKIzInM1qK87BMxWpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_170601_626336_78D2F99F 
X-CRM114-Status: GOOD (  19.66  )
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

Add basic code for the new arm64 on s390 KVM implementation.
Add kernel module boilerplate code and trivial functions.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/arm.c   | 182 ++++++++++++++++++++++++++++++++++++
 arch/s390/kvm/arm64/arm.h   |   7 ++
 arch/s390/kvm/arm64/guest.c |  95 +++++++++++++++++++
 arch/s390/kvm/arm64/guest.h |  10 ++
 4 files changed, 294 insertions(+)
 create mode 100644 arch/s390/kvm/arm64/arm.c
 create mode 100644 arch/s390/kvm/arm64/arm.h
 create mode 100644 arch/s390/kvm/arm64/guest.c
 create mode 100644 arch/s390/kvm/arm64/guest.h

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
new file mode 100644
index 000000000000..8f94eb8fe288
--- /dev/null
+++ b/arch/s390/kvm/arm64/arm.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define KMSG_COMPONENT "kvm-s390-arm64"
+#define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
+
+#include <linux/miscdevice.h>
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
+#include <linux/kvm_host.h>
+
+#include "arm.h"
+
+int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
+{
+	int ret;
+
+	switch (ext) {
+	case KVM_CAP_NR_VCPUS:
+	case KVM_CAP_MAX_VCPUS:
+	case KVM_CAP_MAX_VCPU_ID:
+		ret = KVM_MAX_VCPUS;
+		break;
+	case KVM_CAP_ARM_VM_IPA_SIZE:
+		ret = get_kvm_ipa_limit();
+		break;
+	default:
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static u64 kvm_max_guest_address(void)
+{
+	u64 max_addr;
+
+	if (sclp.hamax == U64_MAX)
+		max_addr = TASK_SIZE_MAX;
+	else
+		max_addr = min_t(u64, TASK_SIZE_MAX, sclp.hamax);
+	return ALIGN_DOWN(max_addr + 1, 1 << 30) - 1;
+}
+
+vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
+{
+	return VM_FAULT_SIGBUS;
+}
+
+long kvm_arch_dev_ioctl(struct file *filp,
+			unsigned int ioctl, unsigned long arg)
+{
+	return -EINVAL;
+}
+
+u32 get_kvm_ipa_limit(void)
+{
+	return fls64(kvm_max_guest_address() + 1) - 1;
+}
+
+int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
+{
+	return 0;
+}
+
+void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
+{
+}
+
+void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
+{
+}
+
+void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
+{
+}
+
+int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
+				    struct kvm_mp_state *mp_state)
+{
+	*mp_state = READ_ONCE(vcpu->arch.mp_state);
+	return 0;
+}
+
+int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
+				    struct kvm_mp_state *mp_state)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
+{
+	return 0;
+}
+
+unsigned long system_supported_vcpu_features(void)
+{
+	return KVM_VCPU_VALID_FEATURES;
+}
+
+int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
+			  bool line_status)
+{
+	return 0;
+}
+
+void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
+					     struct kvm_memory_slot *slot,
+					     gfn_t gfn_offset,
+					     unsigned long mask)
+{
+}
+
+bool kvm_arch_irqchip_in_kernel(struct kvm *kvm)
+{
+	return false;
+}
+
+void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
+{
+}
+
+void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
+{
+}
+
+int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
+		struct kvm *kvm, int irq_source_id,
+		int level, bool line_status)
+{
+	return -EINVAL;
+}
+
+int kvm_set_routing_entry(struct kvm *kvm,
+			  struct kvm_kernel_irq_routing_entry *e,
+			  const struct kvm_irq_routing_entry *ue)
+{
+	return -EINVAL;
+}
+
+void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
+				   struct kvm_memory_slot *slot)
+{
+}
+
+void kvm_arch_flush_shadow_all(struct kvm *kvm)
+{
+}
+
+int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+#ifdef CONFIG_HAVE_KVM_NO_POLL
+__weak bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+#endif
+
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
+{
+	return -ENOIOCTLCMD;
+}
+
+static __init int kvm_s390_arm64_init(void)
+{
+	if (!sclp.has_aef)
+		return -ENXIO;
+
+	return kvm_init_with_dev(sizeof(struct kvm_vcpu), 0, THIS_MODULE,
+				 KVM_DEV_NAME, MISC_DYNAMIC_MINOR);
+}
+
+static __exit void kvm_s390_arm64_exit(void)
+{
+	kvm_exit();
+}
+
+module_init(kvm_s390_arm64_init);
+module_exit(kvm_s390_arm64_exit);
diff --git a/arch/s390/kvm/arm64/arm.h b/arch/s390/kvm/arm64/arm.h
new file mode 100644
index 000000000000..a3db254462c0
--- /dev/null
+++ b/arch/s390/kvm/arm64/arm.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_S390_KVM_ARM64_H
+#define ARCH_S390_KVM_ARM64_H
+
+#define KVM_DEV_NAME "kvm-arm64"
+
+#endif /* ARCH_S390_KVM_ARM64_H */
diff --git a/arch/s390/kvm/arm64/guest.c b/arch/s390/kvm/arm64/guest.c
new file mode 100644
index 000000000000..00886755accf
--- /dev/null
+++ b/arch/s390/kvm/arm64/guest.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kvm_host.h>
+#include <linux/kvm.h>
+
+#include "guest.h"
+
+const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
+	KVM_GENERIC_VM_STATS()
+};
+
+const struct kvm_stats_header kvm_vm_stats_header = {
+	.name_size = KVM_STATS_NAME_SIZE,
+	.num_desc = ARRAY_SIZE(kvm_vm_stats_desc),
+	.id_offset =  sizeof(struct kvm_stats_header),
+	.desc_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE,
+	.data_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE +
+		       sizeof(kvm_vm_stats_desc),
+};
+
+const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
+	KVM_GENERIC_VCPU_STATS(),
+	/* ARM64 stats */
+	STATS_DESC_COUNTER(VCPU, hvc_exit_stat),
+	STATS_DESC_COUNTER(VCPU, wfe_exit_stat),
+	STATS_DESC_COUNTER(VCPU, wfi_exit_stat),
+	STATS_DESC_COUNTER(VCPU, mmio_exit_user),
+	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
+	STATS_DESC_COUNTER(VCPU, signal_exits),
+	STATS_DESC_COUNTER(VCPU, exits),
+	/* GMAP stats */
+	STATS_DESC_COUNTER(VCPU, pfault_sync),
+};
+
+const struct kvm_stats_header kvm_vcpu_stats_header = {
+	.name_size = KVM_STATS_NAME_SIZE,
+	.num_desc = ARRAY_SIZE(kvm_vcpu_stats_desc),
+	.id_offset = sizeof(struct kvm_stats_header),
+	.desc_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE,
+	.data_offset = sizeof(struct kvm_stats_header) + KVM_STATS_NAME_SIZE +
+		       sizeof(kvm_vcpu_stats_desc),
+};
+
+int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	return copy_core_reg_indices(vcpu, uindices);
+}
+
+unsigned long kvm_arm_num_regs(struct kvm_vcpu *vcpu)
+{
+	return num_core_regs(vcpu);
+}
+
+int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs *sregs)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu,
+				  struct kvm_sregs *sregs)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
+				  struct kvm_translation *tr)
+{
+	return -EINVAL;
+}
+
+int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
+					struct kvm_guest_debug *dbg)
+{
+	return -EINVAL;
+}
diff --git a/arch/s390/kvm/arm64/guest.h b/arch/s390/kvm/arm64/guest.h
new file mode 100644
index 000000000000..db635d513c2c
--- /dev/null
+++ b/arch/s390/kvm/arm64/guest.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef KVM_ARM_GUEST_H
+#define KVM_ARM_GUEST_H
+
+#include <linux/kvm_host.h>
+#include <kvm/arm64/guest.h>
+
+unsigned long kvm_arm_num_regs(struct kvm_vcpu *vcpu);
+
+#endif /* KVM_ARM_GUEST_H */
-- 
2.51.0


