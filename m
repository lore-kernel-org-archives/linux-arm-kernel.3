Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D4CCF2FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPeulVaTWBvdV+2+hiK7hOuTnk4qDUqdcbS8gOrslVw=; b=I3GK3pk8wSPxTo7sB+wlA5R3kw
	J8PXwE96OLxzRFK+tTlWzdJH1euoYe44l99mZMLBOlRIdu+GZ12AlgfWGkYYS/jddrGG5lQc3oPKy
	8QUf7VcB6XudFRgSybDBNn6uyQMX799s3eO9sQnNIeRobeKg969TrBL/Ck0imM2tyRC+J2j0Rfb58
	kbyhAobwLJMWqCAM7oGR1EyGReYbJtZa3+Z9xVMpzgVzRR/qS1S7G0oZ5cDriyRYNSEvlckv09H6V
	0DMwQy3+Xdlaq8ivgDkhuDkBg10iaOpzwWOzIzXtZIMDkUZaP/F66SnpSR2eeCTGmqoVPR2Shw0dz
	d9ySpCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoge-000000024Oy-0mWo;
	Mon, 19 Jan 2026 12:48:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofy-000000023pR-2hZC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C337442BE;
	Mon, 19 Jan 2026 12:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CBEC116C6;
	Mon, 19 Jan 2026 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826890;
	bh=eBPe3irIgFQzZeiJ/hcXb69SVpuZxRIfYJxRGW/nywE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WI+yY+XKe231b3ZUriObbCV72KfvpmRkVu7FGB0+OKlHgNL58w7cp4IMZGKgy5Tcd
	 77LRIsKY+1aF4hBr46luHPKX9S4+/rdlXst7unOEdfJCbETtNedoEDMzsKceIDzEpQ
	 rqHsXDiylvJpWHopYXJEEB/fpIrYZT0gc5epw1h40+VXogwxoKSCwM5hC+7bIof3gI
	 n3gQSiGh3WTILvBEX+YFWJn6sm3LDah2gxqP9wD9u8kdHi1O9pyDoAgm3EL8N8xMgI
	 J4EGtZlhuroe6OgDesRixV3Rs8tPF52JNcZCF7XIhB4jhA99HYa/Pg3g1yTiDYjiJH
	 j2dlt3Z65bEWw==
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
Subject: [PATCH v2 25/35] KVM: arm64: Reclaim faulting page from pKVM in spurious fault handler
Date: Mon, 19 Jan 2026 12:46:18 +0000
Message-ID: <20260119124629.2563-26-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044811_793005_81D0F02D 
X-CRM114-Status: GOOD (  15.59  )
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
2.52.0.457.g6b5491de43-goog


