Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49C0CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgdWVBKCOL7VAzvN+6N7kj6quWt2OaVA6CC5QLmsvTI=; b=f5Q+931Zp1IeP3S3qblvcZA0aD
	TbkI/43j7HPavIyd1aNqPOzpgvZS6Ld5y7KZvglYSWZycJFKStC5Qm6ylJooUoUNUkNQE2+BMCRyR
	Qp+7rxMY0Rc9OC3i2iEddBGNa4TrDdzOyZctrqXAXXlzmHKrUsJWDPncvFWCO0h+X4LaS27ZF/ogo
	4wFfSPaJsaNITUQWnakdUYpn2rvOTJ5yJJ8T1C+YPV3bpGgjZU+ku8mlV7KFarRwUQxiVj/brRB2l
	PAgKkBbUqVrHRh2hmmqtWZKOi9lxuOMusxbga2zsXqY0Eu3E+cyRq/D+uOdv7IbkggB+Mzmd8no1d
	W4DThbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPN2-00000005LLg-0Ih3;
	Thu, 30 Apr 2026 11:15:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMz-00000005LIz-0Cmj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:15:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9EEF354E;
	Thu, 30 Apr 2026 04:15:41 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2D6D3F763;
	Thu, 30 Apr 2026 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777547747; bh=wZ+B2i5T+YTs9KjTiOk5jbT7BSpcv7bgMbQ7JYPWchg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jjmBGAm/d8papjvaMBr0lo1UQvwyvDA/gKC4gwQknxiPPsQn2EBUvTJPXBWAI32bM
	 XtnLw5KnXMhUvswEeFrI9/QT4uAVUsh+3jiUnpbhE9VQnwpNs4JG6GBaGbKQmbozQx
	 M77mFI3b1VeX3w2ftIGOnqnDj+1UnWQrtgz5Tl5A=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 06/12] KVM: arm64: dirty_bit: Add base FEAT_HACDBS cleaning routine
Date: Thu, 30 Apr 2026 12:14:10 +0100
Message-ID: <20260430111424.3479613-8-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430111424.3479613-2-leo.bras@arm.com>
References: <20260430111424.3479613-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041549_175854_DAE30DE0 
X-CRM114-Status: GOOD (  20.50  )
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

Introduce the basic cleaning routine that is going to be used for both
dirty-bitmap and dirty-ring routines.

It sets the required registers with the input buffer, and wait for
HACDBSIRQ to happen, which means either the task is done, or there was some
error during processing.

It is ran with preemption disabled, as a task being scheduled in could
change the translation registers used by HACDBS and end up corrupting the
current dirty-bit tracking and the sched-in task's S2 pagetables.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/dirty_bit.c | 86 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index 765ef609ff70..22e3ed07256a 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -1,17 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2026 ARM Ltd.
  * Author: Leonardo Bras <leo.bras@arm.com>
  */
 
 #include <asm/kvm_dirty_bit.h>
+#include <asm/kvm_mmu.h>
 #include <linux/kconfig.h>
 #include <linux/acpi.h>
 
 DEFINE_PER_CPU(struct hacdbs, hacdbs_pcp) = {
 	.status = HACDBS_OFF,
 	.size = 0,
 };
 
 /* HDBSS entry field definitions */
 #define HDBSS_ENTRY_VALID BIT(0)
@@ -24,20 +25,105 @@ DEFINE_PER_CPU(struct hacdbs, hacdbs_pcp) = {
 
 inline u64 hdbss_get_ttwl(u64 chunk_size)
 {
 	u64 hw_lvl = ARM64_HW_PGTABLE_LEVELS(ilog2(chunk_size));
 
 	return HDBSS_ENTRY_TTWL(3 - hw_lvl);
 }
 
 static __ro_after_init int hacdbsirq = -1;
 
+static void hacdbs_start(u64 *hw_entries, int size)
+{
+	u64 br;
+	/* Each entry is 8 bytes */
+	int size_b = size * sizeof(hw_entries[0]);
+	int size_p2 = max(roundup_pow_of_two(size_b), PAGE_SIZE);
+
+	/* If not using the full size of the array, put a stop entry at the end */
+	if (size_b < size_p2)
+		hw_entries[size] = HDBSS_ENTRY_VALID | HDBSS_ENTRY_TTWL_RESV;
+
+	sysreg_clear_set_s(SYS_HACDBSCONS_EL2,
+			   HACDBSCONS_EL2_ERR_REASON | HACDBSCONS_EL2_INDEX, 0);
+
+	br = (virt_to_phys(hw_entries) & HACDBSBR_EL2_BADDR_MASK) |
+	     FIELD_PREP(HACDBSBR_EL2_SZ, ilog2(size_p2) - 12) |
+	     FIELD_PREP(HACDBSBR_EL2_EN, 1);
+
+	this_cpu_write(hacdbs_pcp.status, HACDBS_RUNNING);
+	this_cpu_write(hacdbs_pcp.size, size);
+	write_sysreg_s(br, SYS_HACDBSBR_EL2);
+	isb();
+}
+
+static int hacdbs_stop(void)
+{
+	write_sysreg_s(0, SYS_HACDBSBR_EL2);
+	isb();
+
+	if (this_cpu_read(hacdbs_pcp.status) == HACDBS_ERROR) {
+		/* In case of error, HACDBSCONS_EL2.INDEX should point the faulty entry */
+		u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
+		int idx = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
+
+		trace_printk("HACDBS found error %lu in index %d / %d\n",
+			     FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons), idx,
+			     this_cpu_read(hacdbs_pcp.size));
+
+		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
+
+		return idx;
+	}
+
+	return this_cpu_read(hacdbs_pcp.size);
+}
+
+/*
+ * Clears dirty-bits for an array of pages (hw_entries) using HACDBS
+ * Returns the number of items cleaned from the array. If returns value < size,
+ *	there was an error in the processing.
+ */
+static int dirty_bit_clear(struct kvm *kvm, u64 *hw_entries, int size)
+{
+	enum hacdbs_status st;
+	u64 hcr_el2;
+	int ret;
+
+	preempt_disable();
+
+	hcr_el2 = read_sysreg(HCR_EL2);
+	write_sysreg(hcr_el2 | HCR_EL2_VM, HCR_EL2);
+	__load_stage2(&kvm->arch.mmu, kvm->arch.mmu.arch);
+
+	hacdbs_start(hw_entries, size);
+
+	do {
+		wfi();
+	} while ((st = this_cpu_read(hacdbs_pcp.status)) == HACDBS_RUNNING);
+
+	ret = hacdbs_stop();
+
+	write_sysreg(hcr_el2, HCR_EL2);
+	isb();
+
+	/*
+	 * No DSB is needed here, as kvm_flush_remote_tlbs_memslot() that happens
+	 * later in generic dirty-cleaning code already performs a DSB before
+	 * doing the TLBI.
+	 */
+
+	preempt_enable();
+
+	return ret;
+}
+
 static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
 {
 	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
 	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
 
 	switch (err) {
 	case HACDBSCONS_EL2_ERR_REASON_NOF:
 		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
 		break;
 	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
-- 
2.54.0


