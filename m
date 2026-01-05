Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DB8C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+Lruo04PuPwfICXQSEIW9e+KHJzM9jTQu0k/k9KhTQ=; b=U2oQdPXv61fxjHdr+Yuax3PDuX
	vnBwCkOLMdBbS2/Eqxr9yYKVDszfR+bbKp6/VArnM1uTUP42hT7phyZ7y0wtB8/rRvS5ND25yS+xW
	N0qJOj4hqCL3lvCcM4QDNsdIgjUYOiUHLYNMkPfyYxGUWfOxjp33y51xy3tHw5h9Xdz72QVSxNXuq
	guYe1ITFKs5VCyZRPGtNfhv/pezyKdVJNZagv9k4D/DUptuBdY2rddcmuRCFB9aGY/BJIJI+8jm0E
	THPo+DTUcsl9SZk7M2JrstRBAEvjihUUkMCDq0n9C34S7hwgzbwHB0EJiwMNpCId4HVc3CU6rPr31
	V1KYGJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrC-0000000BeQS-3Zqq;
	Mon, 05 Jan 2026 15:50:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrA-0000000BeNR-1JbT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1F3B6011E;
	Mon,  5 Jan 2026 15:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A96C19422;
	Mon,  5 Jan 2026 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628255;
	bh=EpzLnQBXn8mrjL7opGuG4rLr8XkES6NfQqysWJd4Q5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IWyh+2WxW1HOlaOPWsrAdZGs3Y5DmMID9N5Xo12zgMxhdKsk4NtOePnDVVWkwHXBR
	 T7A8Teq0oMDx8qsLw/hLMNkESZeko20oppSb6leBjQp9RssAZBJ4Jm+1DXkZ0TbLv8
	 v2EhXkJZbMNyXiOggHtcxHGPzTtzwiSg4kVGEoYtU2CvAEywyGquPdA4dgP5DxXLfw
	 z+/j61fxuyjuyq2ISYrtg3HuXcT8enb6uFyzicM5i24sW7KCdT70w8Jg28/oyVqT7W
	 20+8SZQDnGBgbwY36bYxcL0pCsOLIH+BH+LNchq6WE4itAW9YQizBF2aHQUC8QYUOT
	 YTHTxaXyL24KQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 21/30] KVM: arm64: Reclaim faulting page from pKVM in spurious fault handler
Date: Mon,  5 Jan 2026 15:49:29 +0000
Message-ID: <20260105154939.11041-22-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Host kernel accesses to pages that are inaccessible at stage-2 result in
the injection of a translation fault, which is fatal unless an exception
table fixup is registered for the faulting PC (e.g. for user access
routines). This is undesirable, since a get_user_pages() call could be
used to obtain a reference to a donated page and then a subsequent
access via a kernel mapping would lead to a panic().

Rework the spurious fault handler so that stage-2 faults injected back
into the host result in the target page being forcefully reclaimed when
no exception table fixup handler is registered.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/virt.h |  6 ++++++
 arch/arm64/kvm/pkvm.c         |  7 +++++++
 arch/arm64/mm/fault.c         | 15 +++++++++------
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index b51ab6840f9c..e80addc923a4 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -94,6 +94,12 @@ static inline bool is_pkvm_initialized(void)
 	       static_branch_likely(&kvm_protected_mode_initialized);
 }
 
+#ifdef CONFIG_KVM
+bool pkvm_reclaim_guest_page(phys_addr_t phys);
+#else
+static inline bool pkvm_reclaim_guest_page(phys_addr_t phys) { return false; }
+#endif
+
 /* Reports the availability of HYP mode */
 static inline bool is_hyp_mode_available(void)
 {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8be91051699e..d1926cb08c76 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -563,3 +563,10 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	WARN_ON_ONCE(1);
 	return -EINVAL;
 }
+
+bool pkvm_reclaim_guest_page(phys_addr_t phys)
+{
+	int ret = kvm_call_hyp_nvhe(__pkvm_force_reclaim_guest_page, phys);
+
+	return !ret || ret == -EAGAIN;
+}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 2294f2061866..5d62abee5262 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -289,9 +289,6 @@ static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
 	if (!is_el1_data_abort(esr) || !esr_fsc_is_translation_fault(esr))
 		return false;
 
-	if (is_pkvm_stage2_abort(esr))
-		return false;
-
 	local_irq_save(flags);
 	asm volatile("at s1e1r, %0" :: "r" (addr));
 	isb();
@@ -302,8 +299,12 @@ static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
 	 * If we now have a valid translation, treat the translation fault as
 	 * spurious.
 	 */
-	if (!(par & SYS_PAR_EL1_F))
+	if (!(par & SYS_PAR_EL1_F)) {
+		if (is_pkvm_stage2_abort(esr))
+			return pkvm_reclaim_guest_page(par & SYS_PAR_EL1_PA);
+
 		return true;
+	}
 
 	/*
 	 * If we got a different type of fault from the AT instruction,
@@ -389,9 +390,11 @@ static void __do_kernel_fault(unsigned long addr, unsigned long esr,
 	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
 		return;
 
-	if (WARN_RATELIMIT(is_spurious_el1_translation_fault(addr, esr, regs),
-	    "Ignoring spurious kernel translation fault at virtual address %016lx\n", addr))
+	if (is_spurious_el1_translation_fault(addr, esr, regs)) {
+		WARN_RATELIMIT(!is_pkvm_stage2_abort(esr),
+			"Ignoring spurious kernel translation fault at virtual address %016lx\n", addr);
 		return;
+	}
 
 	if (is_el1_mte_sync_tag_check_fault(esr)) {
 		do_tag_recovery(addr, esr, regs);
-- 
2.52.0.351.gbe84eed79e-goog


