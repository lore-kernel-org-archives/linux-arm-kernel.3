Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5989DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMxlQL/1/PXyzLDissWsOzlCFYTqAbCJy0kV35be+cw=; b=dCn8tYJAZZ2lN3yn7y+zUigeX7
	jixhmTmGvX90M+pFjZ5/YByxu+xdh1YpoUa6oI1e72aq3MSbmkSk4dQJUsrqDNtIpcQRamm/HCZig
	FJ+l8S/RQlvTsmFr6zOw3Cq0s9CFAYmaszgDRPSN2cDIl8q009ybOAAapBXaLcrmQril3f5AHzqqb
	xcjvpVXffTEeoBZitfCiJr15r0oF6TkXv74HX06/Fz0wXHcGyQsh7Phd6bcCtypzS7xOKA+14RYd5
	fWfkiVdTXYVTiZF4CrrIUxYrGs22m0hmpDTExu1CaAUqARrUczIKrHOjKZPd5ZrXzZGs1CK8qK2Et
	VZHFyyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA15-0000000EPof-3XZV;
	Mon, 29 Jun 2026 11:19:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0w-0000000EPgt-3O15
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9262A68;
	Mon, 29 Jun 2026 04:18:53 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A2D3F905;
	Mon, 29 Jun 2026 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731938; bh=sC012YILyluDviNMIwbaVelweY/bvL1TeJhAjROEie8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oa4ZH6stNCFojbCmOyUfLdZwpW8klEDrgYVYvcZltj3w3W04Ipsv07oXQexfS4xmz
	 AEdjLjQJ+phnQGeGClGJ6vjgRaFvaIympEZUTQBel7DLFc9+6Wl2HSmYqpDvQIDrbe
	 7KSFzZsFxWD49j8Wz0KnHFCrx5zEwHS9Np4Wi7/M=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 06/13] KVM: arm64: dirty_bit: Add base FEAT_HACDBS cleaning routine
Date: Mon, 29 Jun 2026 12:17:54 +0100
Message-ID: <20260629111820.1873540-7-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136; i=leo.bras@arm.com; h=from:subject; bh=sC012YILyluDviNMIwbaVelweY/bvL1TeJhAjROEie8=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhLU1hx8mrZ7ifb6wik68ncuvdKa+GbP74QQ1fyS7 dkzTxTs6ShlYRDjYpAVU2SRfTR/Fc/3KRlHrvxYADOHlQlkCAMXpwBMJGsDI0NrRXniTdOqdMYT PF7Ca1/ELcuvu3r90pr38d/tKrYYtYUzMiwR2HIqu8k1ZZmfUXqNX5a3+/e8XXs0JjMvj/D9vbF 6MRsA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041858_932211_D898055D 
X-CRM114-Status: GOOD (  20.64  )
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
 arch/arm64/kvm/dirty_bit.c | 81 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index 789da8712b1b..e4283828b780 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -1,36 +1,117 @@
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
 #define HDBSS_ENTRY_TTWL_SHIFT (1)
 #define HDBSS_ENTRY_TTWL_MASK (GENMASK(3, 1))
 #define HDBSS_ENTRY_TTWL(x) \
 	(((x) << HDBSS_ENTRY_TTWL_SHIFT) & HDBSS_ENTRY_TTWL_MASK)
 #define HDBSS_ENTRY_TTWL_RESV HDBSS_ENTRY_TTWL(-4)
 #define HDBSS_ENTRY_IPA GENMASK_ULL(55, 12)
 
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
+	u64 hcr_el2;
+	int ret;
+
+	preempt_disable();
+
+	hcr_el2 = read_sysreg(HCR_EL2);
+	write_sysreg(hcr_el2 | HCR_EL2_VM, HCR_EL2);
+	__load_stage2(&kvm->arch.mmu);
+
+	hacdbs_start(hw_entries, size);
+
+	do {
+		wfi();
+	} while (this_cpu_read(hacdbs_pcp.status) == HACDBS_RUNNING);
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


