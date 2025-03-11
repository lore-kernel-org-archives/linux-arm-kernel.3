Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCB2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+COLpOlrYmlOn5Vn5Tg5eDfp5+DMxV1g4MdOkNVEcE=; b=iuAcSWOC4WWqdX5NG5f3TG1zQ1
	y5JbHbqLTJ/cwM5SeNiOX1vEm/kzmdc4O2xe+qn/+gtfqeCJDnfTIALUoIWJKcylfDH8Mj24F6+C3
	vSB3jdZmMXrC90LV0eLaGhYYCj+7ksz8ZKNTnfOWWq84q098JQxtiOhzGbubEgqT/+Q6O0i9jqbM2
	SArPWMZIGkgzXzLiU5fE/daOZ3ye7qQw9pqW116pJkO7U2k3lZ4NGYtWT8u4bG4ACbg+aohrblebb
	fBrFBmN8OmC863bId/D2PfVPWDa7ZVAmEvQWL8RgAl7z3YEFbZLjoGMFfwnouInEZSfEpY/DfZBNh
	M9MPKVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqzz-00000004aIa-33pm;
	Tue, 11 Mar 2025 04:13:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trqqH-00000004YVI-1k29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:03:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZBg9N59TJz1cyWs;
	Tue, 11 Mar 2025 12:03:36 +0800 (CST)
Received: from kwepemj500003.china.huawei.com (unknown [7.202.194.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BFB01800CD;
	Tue, 11 Mar 2025 12:03:39 +0800 (CST)
Received: from DESKTOP-KKJBAGG.huawei.com (10.174.178.32) by
 kwepemj500003.china.huawei.com (7.202.194.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Mar 2025 12:03:38 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
To: <maz@kernel.org>, <yuzenghui@huawei.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <joey.gouly@arm.com>
CC: <linux-kernel@vger.kernel.org>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <wangzhou1@hisilicon.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
Subject: [PATCH v1 4/5] arm64/kvm: support to handle the HDBSSF event
Date: Tue, 11 Mar 2025 12:03:20 +0800
Message-ID: <20250311040321.1460-5-yezhenyu2@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20250311040321.1460-1-yezhenyu2@huawei.com>
References: <20250311040321.1460-1-yezhenyu2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemj500003.china.huawei.com (7.202.194.33)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_210345_763417_AA0419E6 
X-CRM114-Status: GOOD (  15.71  )
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

From: eillon <yezhenyu2@huawei.com>

Updating the dirty bitmap based on the HDBSS buffer. Similar
to the implementation of the x86 pml feature, KVM flushes the
buffers on all VM-Exits, thus we only need to kick running
vCPUs to force a VM-Exit.

Signed-off-by: eillon <yezhenyu2@huawei.com>
---
 arch/arm64/kvm/arm.c         | 10 ++++++++
 arch/arm64/kvm/handle_exit.c | 47 ++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/mmu.c         |  7 ++++++
 3 files changed, 64 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 825cfef3b1c2..fceceeead011 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1845,7 +1845,17 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
+	/*
+	 * Flush all CPUs' dirty log buffers to the dirty_bitmap.  Called
+	 * before reporting dirty_bitmap to userspace.  KVM flushes the buffers
+	 * on all VM-Exits, thus we only need to kick running vCPUs to force a
+	 * VM-Exit.
+	 */
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
 
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		kvm_vcpu_kick(vcpu);
 }
 
 static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 512d152233ff..db9d7e1f72bf 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -330,6 +330,50 @@ static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
 	return arm_exit_handlers[esr_ec];
 }
 
+#define HDBSS_ENTRY_VALID_SHIFT 0
+#define HDBSS_ENTRY_VALID_MASK (1UL << HDBSS_ENTRY_VALID_SHIFT)
+#define HDBSS_ENTRY_IPA_SHIFT 12
+#define HDBSS_ENTRY_IPA_MASK GENMASK_ULL(55, HDBSS_ENTRY_IPA_SHIFT)
+
+static void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
+{
+	int idx, curr_idx;
+	u64 *hdbss_buf;
+
+	if (!vcpu->kvm->enable_hdbss)
+		return;
+
+	dsb(sy);
+	isb();
+	curr_idx = HDBSSPROD_IDX(read_sysreg_s(SYS_HDBSSPROD_EL2));
+
+	/* Do nothing if HDBSS buffer is empty or br_el2 is NULL */
+	if (curr_idx == 0 || vcpu->arch.hdbss.br_el2 == 0)
+		return;
+
+	hdbss_buf = page_address(phys_to_page(HDBSSBR_BADDR(vcpu->arch.hdbss.br_el2)));
+	if (!hdbss_buf) {
+		kvm_err("Enter flush hdbss buffer with buffer == NULL!");
+		return;
+	}
+
+	for (idx = 0; idx < curr_idx; idx++) {
+		u64 gpa;
+
+		gpa = hdbss_buf[idx];
+		if (!(gpa & HDBSS_ENTRY_VALID_MASK))
+			continue;
+
+		gpa = gpa & HDBSS_ENTRY_IPA_MASK;
+		kvm_vcpu_mark_page_dirty(vcpu, gpa >> PAGE_SHIFT);
+	}
+
+	/* reset HDBSS index */
+	write_sysreg_s(0, SYS_HDBSSPROD_EL2);
+	dsb(sy);
+	isb();
+}
+
 /*
  * We may be single-stepping an emulated instruction. If the emulation
  * has been completed in the kernel, we can return to userspace with a
@@ -365,6 +409,9 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
 {
 	struct kvm_run *run = vcpu->run;
 
+	if (vcpu->kvm->enable_hdbss)
+		kvm_flush_hdbss_buffer(vcpu);
+
 	if (ARM_SERROR_PENDING(exception_index)) {
 		/*
 		 * The SError is handled by handle_exit_early(). If the guest
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9c11e2292b1e..3e0781ae0ae1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1790,6 +1790,13 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
 
+	/*
+	 * HDBSS buffer already flushed when enter handle_trap_exceptions().
+	 * Nothing to do here.
+	 */
+	if (ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF)
+		return 1;
+
 	if (esr_fsc_is_translation_fault(esr)) {
 		/* Beyond sanitised PARange (which is the IPA limit) */
 		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
-- 
2.39.3


