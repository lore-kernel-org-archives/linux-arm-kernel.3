Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81079CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QFRtDSUIJeN26FkCjHT0Hs3G1HOTOdExXdLDoEsG2Y=; b=F0K37KgeT8cZ/RqQPfXLgwd5FD
	JcXccnilTOlb0v2n8dYZiE93+nDHcfJCa7dqX0n4alkUaBiyHWrv/kVW6tXdv2/DKEa9Cyr5kqqdf
	wvhcWIwpwiuFjWUZN6GDDG4FNs8hpZDDmviNPdT4Ypp/YApfYpr1crx1KcjPDLf+9MFhUP+u9wdPr
	6ibzzu7lKwgarVBarSIHsojK7hQdmckIFB/x+EYaO/WLmCo1Bkt13C8RydOsAOtLgAW41R7gdk8cK
	t6ba+g4gp6/M9i8iInqiqBpWIDBrrq9AVTLP5cg9KHrAiLjoi6OaYq+LgdUyu+AuI0vWE5fmggRMs
	lwaqiSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMG-0000000CR6I-3egk;
	Tue, 02 Jun 2026 07:16:16 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMA-0000000CR0Q-0CA1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384567; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6QFRtDSUIJeN26FkCjHT0Hs3G1HOTOdExXdLDoEsG2Y=;
	b=oQLOtk7+nBlx8j+elPXGLTXhzHaJz6bKv7OXFvsXIiBqcz+Zzp+/xm4dl6770/+PnruM6YJKT1G+GLH3oMTUqEIP9oQ2J/guY5Wa40gmsIgyQgmTpUMN4aIqbqt799TCbwc8GQTQYh3BvVVN1YdH1gF+xFpi4KuYJ+2XlnmRyjU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2dH_1780384563;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2dH_1780384563 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:04 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v7 07/16] arm64: ras: Add error record processing and interrupt handling
Date: Tue,  2 Jun 2026 15:15:30 +0800
Message-ID: <20260602071540.3711528-8-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001610_434331_CFD3A1DC 
X-CRM114-Status: GOOD (  21.46  )
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

Wire the IRQs registered by the front-end into a record-processing
routine, so that interrupts raised by an error source actually
translate into observable error events.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/ras.h |  26 +++++
 drivers/ras/arm64/ras-core.c | 213 +++++++++++++++++++++++++++++++++++
 include/linux/acpi_aest.h    |   4 +
 3 files changed, 243 insertions(+)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index a992610d7755..42900e1e9a19 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -5,6 +5,32 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 
+/* ERR<n>STATUS */
+#define ERR_STATUS_AV			BIT(31)
+#define ERR_STATUS_V			BIT(30)
+#define ERR_STATUS_UE			BIT(29)
+#define ERR_STATUS_ER			BIT(28)
+#define ERR_STATUS_OF			BIT(27)
+#define ERR_STATUS_MV			BIT(26)
+#define ERR_STATUS_CE			GENMASK(25, 24)
+#define ERR_STATUS_DE			BIT(23)
+#define ERR_STATUS_PN			BIT(22)
+#define ERR_STATUS_UET			GENMASK(21, 20)
+#define ERR_STATUS_CI			BIT(19)
+#define ERR_STATUS_IERR			GENMASK_ULL(15, 8)
+#define ERR_STATUS_SERR			GENMASK_ULL(7, 0)
+
+/* These bits are write-one-to-clear */
+#define ERR_STATUS_W1TC                                                  \
+	(ERR_STATUS_AV | ERR_STATUS_V | ERR_STATUS_UE | ERR_STATUS_ER |  \
+	 ERR_STATUS_OF | ERR_STATUS_MV | ERR_STATUS_CE | ERR_STATUS_DE | \
+	 ERR_STATUS_PN | ERR_STATUS_UET | ERR_STATUS_CI)
+
+#define ERR_STATUS_UET_UC		0
+#define ERR_STATUS_UET_UEU		1
+#define ERR_STATUS_UET_UEO		2
+#define ERR_STATUS_UET_UER		3
+
 /* ERR<n>CTLR */
 #define ERR_CTLR_CFI			BIT(8)
 #define ERR_CTLR_FI			BIT(3)
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 98f274b9731d..8c6d202882ed 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/panic.h>
 #include <linux/platform_device.h>
 #include <linux/ras.h>
 
@@ -16,6 +17,12 @@
 #undef pr_fmt
 #define pr_fmt(fmt) "arm64_ras: " fmt
 
+static bool panic_on_ue;
+module_param(panic_on_ue, bool, 0600);
+MODULE_PARM_DESC(aest_panic_on_ue,
+		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
+
+
 static DEFINE_PER_CPU(struct ras_node, percpu_ras_node);
 
 static const char *const ras_node_name[] = {
@@ -46,6 +53,145 @@ const struct ras_group ras_group_config[] = {
 	},
 };
 
+#define AEST_LOG_PREFIX_BUFFER 64
+
+static void ras_print(struct ras_record *record, struct ras_ext_regs *regs)
+{
+	static atomic_t seqno = { 0 };
+	struct ras_node *node = record->node;
+	u8 *data = node->specific_data;
+	unsigned int curr_seqno;
+	char pfx_seq[AEST_LOG_PREFIX_BUFFER];
+	int index = record->index;
+
+	curr_seqno = atomic_inc_return(&seqno);
+	snprintf(pfx_seq, sizeof(pfx_seq), "{%u}" HW_ERR, curr_seqno);
+	pr_info("%sHardware error from AEST %s\n", pfx_seq, node->name);
+
+	switch (node->type) {
+	case ACPI_AEST_PROCESSOR_ERROR_NODE: {
+		struct acpi_aest_processor *proc = (struct acpi_aest_processor *)data;
+
+		if (proc->flags &
+		    (ACPI_AEST_PROC_FLAG_SHARED | ACPI_AEST_PROC_FLAG_GLOBAL))
+			pr_err("%s Error from shared processor resource (interrupt handled on CPU%d)\n",
+			       pfx_seq, smp_processor_id());
+		else
+			pr_err("%s Error from CPU%d\n", pfx_seq, smp_processor_id());
+		break;
+	}
+	case ACPI_AEST_MEMORY_ERROR_NODE:
+		pr_err("%s Error from memory at SRAT proximity domain %#x\n",
+		       pfx_seq,
+		       ((struct acpi_aest_memory *)data)->srat_proximity_domain);
+		break;
+	case ACPI_AEST_SMMU_ERROR_NODE:
+		pr_err("%s Error from SMMU IORT node %#x subcomponent %#x\n",
+		       pfx_seq,
+		       ((struct acpi_aest_smmu *)data)->iort_node_reference,
+		       ((struct acpi_aest_smmu *)data)->subcomponent_reference);
+		break;
+	case ACPI_AEST_VENDOR_ERROR_NODE:
+		pr_err("%s Error from vendor hid %8.8s uid %#x\n", pfx_seq,
+		       ((struct acpi_aest_vendor_v2 *)data)->acpi_hid,
+		       ((struct acpi_aest_vendor_v2 *)data)->acpi_uid);
+		break;
+	case ACPI_AEST_GIC_ERROR_NODE:
+		pr_err("%s Error from GIC type %#x instance %#x\n", pfx_seq,
+		       ((struct acpi_aest_gic *)data)->interface_type,
+		       ((struct acpi_aest_gic *)data)->instance_id);
+		break;
+	default:
+		pr_err("%s Unknown AEST node type\n", pfx_seq);
+		return;
+	}
+
+	pr_err("%s  ERR%dFR: 0x%llx\n", pfx_seq, index, regs->err_fr);
+	pr_err("%s  ERR%dCTRL: 0x%llx\n", pfx_seq, index, regs->err_ctlr);
+	pr_err("%s  ERR%dSTATUS: 0x%llx\n", pfx_seq, index, regs->err_status);
+	if (regs->err_status & ERR_STATUS_AV)
+		pr_err("%s  ERR%dADDR: 0x%llx\n", pfx_seq, index,
+		       regs->err_addr);
+
+	if (regs->err_status & ERR_STATUS_MV) {
+		pr_err("%s  ERR%dMISC0: 0x%llx\n", pfx_seq, index,
+		       regs->err_misc[0]);
+		pr_err("%s  ERR%dMISC1: 0x%llx\n", pfx_seq, index,
+		       regs->err_misc[1]);
+		pr_err("%s  ERR%dMISC2: 0x%llx\n", pfx_seq, index,
+		       regs->err_misc[2]);
+		pr_err("%s  ERR%dMISC3: 0x%llx\n", pfx_seq, index,
+		       regs->err_misc[3]);
+	}
+}
+
+static void ras_do_proc(struct ras_record *record, struct ras_ext_regs *regs)
+{
+	ras_print(record, regs);
+}
+
+static void ras_panic(struct ras_record *record, struct ras_ext_regs *regs,
+		       char *msg)
+{
+	ras_print(record, regs);
+
+	panic(msg);
+}
+
+static void ras_proc_record(struct ras_record *record, void *data)
+{
+	struct ras_ext_regs regs = { 0 };
+	int *count = data;
+	u64 ue;
+
+	regs.err_status = record_read(record, ERXSTATUS);
+	if (!(regs.err_status & ERR_STATUS_V))
+		return;
+
+	(*count)++;
+
+	if (regs.err_status & ERR_STATUS_AV)
+		regs.err_addr = record_read(record, ERXADDR);
+
+	regs.err_fr = record_read(record, ERXFR);
+	regs.err_ctlr = record_read(record, ERXCTLR);
+
+	if (regs.err_status & ERR_STATUS_MV) {
+		regs.err_misc[0] = record_read(record, ERXMISC0);
+		regs.err_misc[1] = record_read(record, ERXMISC1);
+		if (record->node->flags & AEST_XFACE_FLAG_CLEAR_MISC) {
+			record_write(record, ERXMISC0, 0);
+			record_write(record, ERXMISC1, 0);
+		}
+	}
+
+	/* panic if unrecoverable and uncontainable error encountered */
+	ue = FIELD_GET(ERR_STATUS_UET, regs.err_status);
+	if ((regs.err_status & ERR_STATUS_UE) &&
+	    (ue == ERR_STATUS_UET_UC || ue == ERR_STATUS_UET_UEU)) {
+		if (!panic_on_ue)
+			ras_record_err(record, "UE detected, panic suppressed\n");
+		else
+			ras_panic(record, &regs,
+				  "AEST: unrecoverable error encountered");
+	}
+
+	ras_do_proc(record, &regs);
+
+	/* Write-one-to-clear the bits we've seen */
+	regs.err_status &= ERR_STATUS_W1TC;
+
+	/* Multi bit filed need to write all-ones to clear. */
+	if (regs.err_status & ERR_STATUS_CE)
+		regs.err_status |= ERR_STATUS_CE;
+
+	/* Multi bit filed need to write all-ones to clear. */
+	if (regs.err_status & ERR_STATUS_UET)
+		regs.err_status |= ERR_STATUS_UET;
+
+	record_write(record, ERXSTATUS, regs.err_status);
+}
+
 static void ras_node_foreach_record(void (*func)(struct ras_record *, void *),
 				    struct ras_node *node, void *data,
 				    unsigned long *bitmap)
@@ -59,12 +205,72 @@ static void ras_node_foreach_record(void (*func)(struct ras_record *, void *),
 
 		ras_sync(node);
 	}
+}
+
+static void ras_node_foreach_poll_record(void (*func)(struct ras_record *, void *),
+					 struct ras_node *node, void *data)
+{
+	int i;
+	/*
+	 * Per AEST spec:
+	 *  - record_implemented: bitmap of records that are actually
+	 *    implemented (valid records on this node).
+	 *  - status_reporting: bitmap of records whose error status is
+	 *    reported through ERRGSR; these will be discovered via the
+	 *    ERRGSR scan path below and do not need polling.
+	 *
+	 * The remaining records (implemented but not reported via ERRGSR)
+	 * must be polled one by one to detect errors. Compute that set as:
+	 *     poll_bitmap = record_implemented & ~status_reporting
+	 */
+	for_each_clear_bit(i, node->record_implemented, node->record_count) {
+		if (!test_bit(i, node->status_reporting))
+			continue;
+
+		ras_select_record(node, i);
+
+		func(&node->records[i], data);
+
+		ras_sync(node);
+	}
+}
+
+static int ras_proc(struct ras_node *node)
+{
+	int count = 0, i, j, size = node->record_count;
+	u64 err_group = 0;
+
+	ras_node_foreach_poll_record(ras_proc_record, node, &count);
+
+	if (!node->errgsr)
+		return count;
+
+	ras_node_dbg(node, "Report bitmap %*pb\n", size, node->status_reporting);
+	for (i = 0; i < BITS_TO_U64(size); i++) {
+		err_group = readq_relaxed((void *)node->errgsr + i * 8);
+		ras_node_dbg(node, "errgsr[%d]: 0x%llx\n", i, err_group);
+
+		for_each_set_bit(j, (unsigned long *)&err_group, BITS_PER_LONG) {
+			/*
+			 * Error group base is only valid in Memory Map node,
+			 * so driver do not need to write select register and
+			 * sync.
+			 */
+			if (test_bit(i * BITS_PER_LONG + j, node->status_reporting))
+				continue;
+			ras_proc_record(&node->records[j], &count);
+		}
 	}
 
+	return count;
+}
+
 static irqreturn_t ras_irq_func(int irq, void *input)
 {
 	struct ras_node *node = input;
 
+	ras_proc(node);
+
 	return IRQ_HANDLED;
 }
 
@@ -165,9 +371,16 @@ static void ras_online_record(struct ras_record *record, void *data)
 
 static void ras_online_node(struct ras_node *node)
 {
+	int count = 0;
+
 	if (!node->name)
 		return;
 
+	ras_node_foreach_record(ras_proc_record, node, &count,
+				node->record_implemented);
+
+	ras_node_dbg(node, "%d errors found before enabled\n", count);
+
 	ras_config_irq(node);
 
 	ras_node_foreach_record(ras_online_record, node, NULL,
diff --git a/include/linux/acpi_aest.h b/include/linux/acpi_aest.h
index a462895a7b5a..9cb0fcb52c39 100644
--- a/include/linux/acpi_aest.h
+++ b/include/linux/acpi_aest.h
@@ -9,6 +9,10 @@
 #define AEST_FHI_NAME "AEST:FHI"
 #define AEST_ERI_NAME "AEST:ERI"
 
+/* AEST component */
+#define ACPI_AEST_PROC_FLAG_GLOBAL	BIT(0)
+#define ACPI_AEST_PROC_FLAG_SHARED	BIT(1)
+
 /* AEST interrupt */
 #define AEST_INTERRUPT_MODE BIT(0)
 
-- 
2.51.2.612.gdc70283dfc


