Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97579CA5FB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhCl5i1QqeG6DsLGoEVhwhQZILgarOVG0u5bGP7j+qo=; b=dJOue+QiYGVJV5T6qd/6GwfQzj
	nkvVljGvsXFWrSe/QHWK/OLFhcQc5ZmxDFgilYsWf+Ky8OhyGEt/Cam6LDDKzpATPFwJQ9xnU6+Og
	ovgL+DvvMvPu7N/t7B88zvvf6DOGzL3ZYHt7Qy+LhFjYh478ub38sm77XHfv15C9IVBUJaHTisNZs
	TfwdK/CWHOTgAvqs456rbGSucofnRmXFEj7tnf7Ex5/T6iK499X6hqHntAR584sca/jIl4//Wf7jc
	O/RDJLuAn2gfJD05ITkQy7aRONu6j6Uczl4Ts68+FU5p9iGyvQzMf+k6iNYQKzU7sWe3vSUljgXIh
	w5sXHkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDn-00000003H4L-3yU6;
	Tue, 29 Sep 2026 10:38:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDF-00000003GmU-2r0F
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UhCl5i1QqeG6DsLGoEVhwhQZILgarOVG0u5bGP7j+qo=; b=B3Vl7SPk8w4U3Lm87jLWp+BXXc
	PSHBzaWu+mwJBi2HEmurxM486nvEB5VAout1L68xT1QVlr1nrZ8FsAvEW4ODzbErmgo632UAAnk/p
	J5fl9ufM0qQJ7M5UXLJvojrO9ZanjTo+S24ucEz94TfLSgw/4blte1iwyGq7rsn+4vySRGv890BIp
	NhSmhQ2hYKO3QFFOzolmZO2jSBksXeKmnUHNf0R4pdHNRk6tP7ZsoSkhtH2v3ad/ZuFV/3JxrOlmN
	cLCZCPSBIar4nhIP3UOAQPDbrAsi/y/5fJ7Z60RqkJUR95C5/L6Dz55KVA7oD5Par0S9o65kP0jjd
	v5u5/MJA==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVCz-00000002VF6-1Mcr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UhCl5i1QqeG6DsLGoEVhwhQZILgarOVG0u5bGP7j+qo=;
	b=gD4gRAxfs4SbgG+kI4hny6tT0fFtf6zYwuRXd+A1rHopu/M32i+ZYP0i2JRO2/OpYIT6FslfL
	1ROClicrUEOgjqdQ49NYH7Uy3alwpWNcfktQyCVzkFtybvL3MuPk6rUUpaSmdw6qdZRxzzbAQe2
	Pks7TeWi8tA5K0TNNNsmNGo=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hvDnc0xypz1prLc;
	Tue, 29 Sep 2026 18:24:52 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id E1A5E203C8;
	Tue, 29 Sep 2026 18:37:02 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:01 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 08/15] KVM: arm64: Flush the HDBSS buffer on VM exit
Date: Tue, 29 Sep 2026 18:36:48 +0800
Message-ID: <20260929103655.85107-9-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113714_127806_E0328ED4 
X-CRM114-Status: GOOD (  21.07  )
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

From: Eillon <yezhenyu2@huawei.com>

HDBSS entries accumulate in the per-vCPU buffer while the guest runs,
and must be drained into the dirty bitmap or dirty ring before
userspace can observe them.

Drain the buffer at a single point: kvm_arch_vcpu_ioctl_run() flushes
it on every VM exit, before the exit reason is handled. Flushing
inside the run loop keeps the dirty-ring feedback timely: when a flush
pushes the ring past its soft limit, kvm_dirty_ring_push() raises
KVM_REQ_DIRTY_RING_SOFT_FULL, which check_vcpu_requests() observes at
the top of the next loop iteration, so the vCPU exits to userspace for
the harvest before re-entering the guest.

kvm_arch_sync_dirty_log() relies on the exit path to flush: it kicks
vCPUs out of guest mode, and the GET/CLEAR protocol tolerates
concurrent bitmap writes, so the snapshot is complete without extra
synchronization.

Signed-off-by: Eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/kvm_dirty_bit.h | 15 +++++++++
 arch/arm64/kvm/arm.c                   | 20 ++++++++++++
 arch/arm64/kvm/dirty_bit.c             | 45 ++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
index fe703f02626b..d828e6b43fe9 100644
--- a/arch/arm64/include/asm/kvm_dirty_bit.h
+++ b/arch/arm64/include/asm/kvm_dirty_bit.h
@@ -13,6 +13,9 @@
 #include <asm/sysreg.h>
 #include <linux/sizes.h>

+#define HDBSS_ENTRY_VALID	BIT(0)
+#define HDBSS_ENTRY_IPA	GENMASK_ULL(55, 12)
+
 #define KVM_ARM_HDBSS_DEFAULT_SIZE  PAGE_SIZE
 #define KVM_ARM_HDBSS_MAX_SIZE      SZ_2M

@@ -22,7 +25,19 @@ static inline u32 kvm_hdbss_buffer_size(struct kvm *kvm)
 	return kvm->arch.hdbss_buffer_size ?: KVM_ARM_HDBSS_DEFAULT_SIZE;
 }

+static inline bool kvm_hdbss_enabled(struct kvm *kvm)
+{
+	return kvm->arch.mmu.vtcr & VTCR_EL2_HDBSS;
+}
+
+static inline bool vcpu_hdbss_enabled(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.hw_mmu &&
+		(vcpu->arch.hw_mmu->vtcr & VTCR_EL2_HDBSS);
+}
+
 int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
+void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu);

 #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5ea4ac26995e..9d7bdece149a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1430,6 +1430,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)

 		trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu), *vcpu_pc(vcpu));

+		/*
+		 * Drain the HDBSS buffer before the exit is handled, so
+		 * entries pushed to the dirty ring are accounted for by
+		 * dirty_ring_check_request() on the next iteration.
+		 */
+		if (vcpu_hdbss_enabled(vcpu))
+			kvm_flush_hdbss_buffer(vcpu);
+
 		/* Exit types that need handling before we can be preempted */
 		handle_exit_early(vcpu, ret);

@@ -2017,7 +2025,19 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
+	unsigned long i;
+	struct kvm_vcpu *vcpu;

+	if (!kvm_hdbss_enabled(kvm))
+		return;
+
+	/*
+	 * The buffer is drained on every VM exit, so kicking running
+	 * vCPUs is enough to flush them; the dirty-log GET/CLEAR
+	 * protocol tolerates bits set concurrently with the snapshot.
+	 */
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_vcpu_kick(vcpu);
 }

 static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index f9aeb9f34ad0..be0d12555c84 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -13,6 +13,7 @@
 #include <linux/kconfig.h>
 #include <linux/log2.h>
 #include <linux/mm.h>
+#include <linux/srcu.h>

 int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu)
 {
@@ -53,3 +54,47 @@ void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
 	vcpu->arch.hdbss.hdbss_pg = NULL;
 	vcpu->arch.hdbss.hdbssbr_el2 = 0;
 }
+
+void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
+{
+	int idx, curr_idx;
+	u64 prod;
+	u32 entries;
+	u64 *hdbss_buf;
+	struct kvm *kvm = vcpu->kvm;
+	int srcu_idx;
+
+	if (!vcpu_hdbss_enabled(vcpu))
+		return;
+
+	prod = read_sysreg_s(SYS_HDBSSPROD_EL2);
+	curr_idx = HDBSSPROD_IDX(prod);
+
+	if (curr_idx == 0 || !vcpu->arch.hdbss.hdbss_pg)
+		return;
+
+	hdbss_buf = page_address(vcpu->arch.hdbss.hdbss_pg);
+	if (!hdbss_buf)
+		return;
+
+	entries = kvm_hdbss_buffer_size(kvm) / sizeof(u64);
+
+	/* kvm_vcpu_mark_page_dirty() resolves the memslot under SRCU. */
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	for (idx = 0; idx < min_t(u32, curr_idx, entries); idx++) {
+		u64 gpa;
+
+		gpa = hdbss_buf[idx];
+		if (!(gpa & HDBSS_ENTRY_VALID))
+			continue;
+
+		gpa &= HDBSS_ENTRY_IPA;
+		kvm_vcpu_mark_page_dirty(vcpu, gpa >> PAGE_SHIFT);
+	}
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+
+	prod &= ~HDBSSPROD_EL2_INDEX_MASK;
+	write_sysreg_s(prod, SYS_HDBSSPROD_EL2);
+	vcpu->arch.hdbss.hdbssprod_el2 = prod;
+	isb();
+}
--
2.43.0


