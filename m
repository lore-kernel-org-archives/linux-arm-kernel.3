Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC9CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nmOgtlHl2qqijAqSqbai/SXTXwsIXl8TfYi58MUnrU=; b=3qhAfSIjRzvC7hpa/ss4DGBlAN
	YCx2jlHOe7GzGKVkzJ1fkUwMFEBoZDVeb8bdMrPnc5FDiULBGiSDQShjHND7Nyf/Xg2euURCMVx1Y
	JJdKN8WEZvH5gt19h++6cY83+48xXE3XuMcx7Mqx2U7yEuTzMcxKS3GiuiuTutuYg3mssHHyAiTtP
	OuSz2fZIJDYDKEFRXLagYZvbIZKeSPHpmvvmv2wUf+JX3um/rpt//yvICKBcMKzCKdv4Ssmen6PoS
	ShYBNMCBPdXjpwB8DPzrSp77H2XOWEQ6kB6/0rM/P/ul1WLDITbPbS2bKCH9LCFtTXU7tWikqBHoI
	mzqLr5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByDL-00000006rT3-3C4S;
	Wed, 30 Sep 2026 17:35:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD3-00000006r1P-1zx9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9nmOgtlHl2qqijAqSqbai/SXTXwsIXl8TfYi58MUnrU=; b=cYUDYc21EC9gbyRATk0tIy/L7N
	exP0wNUdqmZ7nBAR0GFyvmyCQ8eowRfTcuDaqDzRrEzYDBMBRiYX6mOZqG0ozCoV06ApdxZ7tKVE5
	fZEIgluHfVfGWJ8iFuVuv2CS97gspkRS/YwrNjY2JVDWg9QpAVeTwmfIWwgj6BROa2kszgTY/CCQl
	uCsMJCddXtW6LaqLNA6i7NZwee1ozqYYXGSOLl3zu7QzSnPguVlqTyoHOwAuKMRhoJYpRox4pIxX7
	kfdots23dN0flofzog3mXZQvu5+Cy5yqoowT/22B+CCtL5/1IXLjJHGhZg/yM1wVSiUYAh1SAxj3t
	4TnsFPWw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByCz-000000049C4-24Hi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:35:12 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE5NLW3170675;
	Wed, 30 Sep 2026 17:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9nmOgtlHl2qqijAqS
	qbai/SXTXwsIXl8TfYi58MUnrU=; b=TuU877siA1A/HtEKZrUFliNxT6A9mxtb8
	TV7d5FKsPPoIQfYjJ5/4Deo+tO9U0ZS67dipq4h1SxNpn5Sp83e2S8InZ/x5hKf1
	tv/ocCrUZdQdnfeLdHJ21r3aDSolvdqstQNjjDf3sltSTVDItkb2yXYeko2hPO1Z
	u8OqYYBo1IBBLN7hia0EG5dg9WjiCtTaFA7MBWX13mq1d2pcbNCGHbz+uNyVOm4M
	JGUCZuP9TeownY2zBbEZWkAgz9abGILtr6qlQjRkcog7n5rEOzmqW9L+rl8YX0g5
	9wlO/EVtxx4w1E55aPtNpqXrGcE66d8q50BTK2ZE51PFquGkU2+1A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5s5eh11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE383v2287805;
	Wed, 30 Sep 2026 17:34:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pbmkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYnMi50921748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E75C620063;
	Wed, 30 Sep 2026 17:34:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90D6F2004E;
	Wed, 30 Sep 2026 17:34:48 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:48 +0000 (GMT)
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
Subject: [PATCH v9 19/24] KVM: s390: Add basic arm64 kvm module
Date: Wed, 30 Sep 2026 19:34:34 +0200
Message-ID: <20260930173441.66762-20-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXykb/U5Jos3W9
 lTgZTulNwLc4QclEqW3yEIDGrYg39IkAuaSubduLc7QPnVO2G9dpjxHbFN1ddQtzOmXYA+CoXHa
 YSOE9I6ZvjV3KmI0M1+19w0cJldydLU=
X-Authority-Analysis: v=2.4 cv=HJ5WhYtv c=1 sm=1 tr=0 ts=6abd483f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=6xXtIqcO9OUr-lOO6cQA:9
X-Proofpoint-GUID: a5vFtnFtrpgIs-S8Uo-nQxzjredeSxFA
X-Proofpoint-ORIG-GUID: UnI5B3xaR8yT5Vz0uFhA3VlTrwKiBL1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXyyaNqwufFj4c
 HRUfG4xsaWvTvtwYQM/CiaEIycNxYcmljWyVyH8AKbIkp0ei980OseO/bPNRWX7rtJlH/HwRstp
 WGpsCkxdlGdnkqn33QzLumNasQFzGKkMMLOP+UvltQ1wCq1HVs0JU4UBmGX6HPBdT4rhd7/DWw/
 znP7tTZQVqKYVOhtP3Yq5Rx9HSESUbU/U5YMyJ4nUxhVyaKsqYJ1CnP4tolq7hZj1o1+zR3fEja
 MzMnpaUJ3y9qZUPsgYlntWA0CrZtPiJmpSkzkxf3mCT72LiJBpMLAUYNggd6Gc3E9Jt702lMedT
 C1VxVxYY/rUOJZAeswfSwfiOaBi0TRMBv1OJS4OrdM22zaFyMG8fkbOcdMl0yOQwojHAn4cVY9u
 /zLRt0mJ0RxR5DI9X5E9cM3F1x2/zzbKTxbVA9PA3j0AcQc3lOFFnzg6etzDiWqXZM9AwLReigM
 PtkENm6GL/G/3f3TspA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183509_933939_EEBD8C83 
X-CRM114-Status: GOOD (  21.78  )
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
Add tracing scaffolding.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/arm.c   | 147 ++++++++++++++++++++++++++++++++++++
 arch/s390/kvm/arm64/arm.h   |  44 +++++++++++
 arch/s390/kvm/arm64/guest.c |  90 ++++++++++++++++++++++
 arch/s390/kvm/arm64/trace.h |  18 +++++
 4 files changed, 299 insertions(+)
 create mode 100644 arch/s390/kvm/arm64/arm.c
 create mode 100644 arch/s390/kvm/arm64/arm.h
 create mode 100644 arch/s390/kvm/arm64/guest.c
 create mode 100644 arch/s390/kvm/arm64/trace.h

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
new file mode 100644
index 000000000000..acd46059b75e
--- /dev/null
+++ b/arch/s390/kvm/arm64/arm.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/miscdevice.h>
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
+#include <linux/kvm_host.h>
+
+#include "arm.h"
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
+static unsigned long system_supported_vcpu_features(void);
+
+#define __INCL_GEN_ARM_FILE
+#include "generated/arm.inc"
+#undef __INCL_GEN_ARM_FILE
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
+	case KVM_CAP_IOEVENTFD:
+	case KVM_CAP_PRE_FAULT_MEMORY:
+		ret = 1;
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
+	max_addr = min_t(u64, TASK_SIZE_MAX, sclp.hamax);
+	max_addr = max_t(u64, max_addr, SZ_1G - 1);
+	return ALIGN_DOWN(max_addr + 1, SZ_1G) - 1;
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
+int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static unsigned long system_supported_vcpu_features(void)
+{
+	unsigned long features = KVM_S390_ARM64_IMPL_FEATURES;
+
+	return features;
+}
+
+bool kvm_arch_irqchip_in_kernel(struct kvm *kvm)
+{
+	return false;
+}
+
+int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+		int irq_source_id, int level, bool line_status)
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
+int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
+{
+	return -ENOIOCTLCMD;
+}
+
+static int __init kvm_s390_arm64_init(void)
+{
+	if (!sclp.has_aef)
+		return -ENODEV;
+
+	return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
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
index 000000000000..9d903916c896
--- /dev/null
+++ b/arch/s390/kvm/arm64/arm.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_S390_KVM_ARM64_H
+#define ARCH_S390_KVM_ARM64_H
+
+static __always_inline int kvm_is_ucontrol(struct kvm *kvm)
+{
+	return 0;
+}
+
+static __always_inline int __kvm_s390_pv_destroy_page(struct page *page)
+{
+	return 0;
+}
+
+static __always_inline void kvm_s390_vsie_gmap_notifier(struct gmap *gmap, gpa_t start, gpa_t end)
+{
+}
+
+static __always_inline int kvm_s390_pv_get_handle(struct kvm *kvm)
+{
+	return 0;
+}
+
+static __always_inline int kvm_s390_is_migration_mode(struct kvm *kvm)
+{
+	return false;
+}
+
+static __always_inline bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static __always_inline void kvm_s390_update_cmma_dirty(struct kvm *kvm, const struct kvm_memory_slot *old)
+{
+}
+
+/* should never be called */
+static __always_inline int kvm_s390_vm_stop_migration(struct kvm *kvm)
+{
+	return -EINVAL;
+}
+
+#endif /* ARCH_S390_KVM_ARM64_H */
diff --git a/arch/s390/kvm/arm64/guest.c b/arch/s390/kvm/arm64/guest.c
new file mode 100644
index 000000000000..1bf546bded81
--- /dev/null
+++ b/arch/s390/kvm/arm64/guest.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kvm_host.h>
+#include <linux/kvm.h>
+
+#include <arm64/kvm_emulate.h>
+#include <arm64/kvm_nested.h>
+
+#define __INCL_GEN_ARM_FILE
+#include "generated/guest.inc"
+#undef __INCL_GEN_ARM_FILE
+
+const struct kvm_stats_desc kvm_vm_stats_desc[] = {
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
+const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
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
diff --git a/arch/s390/kvm/arm64/trace.h b/arch/s390/kvm/arm64/trace.h
new file mode 100644
index 000000000000..3a5dcd039c13
--- /dev/null
+++ b/arch/s390/kvm/arm64/trace.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(KVM_ARM64_TRACE_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define KVM_ARM64_TRACE_KVM_H
+
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM kvm
+
+#endif /* KVM_ARM64_TRACE_KVM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.53.0


