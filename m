Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24103C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcihiQmex/U1JPCJ48hvx3ZiYeIXF1MRCpJ0DSZDo4k=; b=UwNufBUPQtCcVUsCRybRd0Be7s
	Rp2mXB2eH8rHtgWG/XwExZnMp1V2bLVi24YBm8X0gJllS4ahbYakGy3NzPZYIgLpMawTkUoHgdmV3
	Xes1aJukA7BXSHDAiDc0t+Dwu1+udAnHAbSMW/6tutYRHRHfBARL58VnOizLB0JhT0OmqsvBfCYBg
	2dSBrymz9pj2lP4eKgh49qsEEoz+wsy9RrNqtYOQpAciNJr1wSqr4mJpq2/yiDvS1yXigtKMpzyBx
	XPmu6WVyMXo++UYeiPpxMFXEGCcOqdb5Ky+yUJjhcEMzral5PsD0Bu0G2cbppbpcaP3drErSzImX1
	R6+dhx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIZ-00000006lcO-1LTv;
	Thu, 22 Jan 2026 09:48:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIW-00000006lZH-0Lmr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QcihiQmex/U1JPCJ48hvx3ZiYeIXF1MRCpJ0DSZDo4k=; b=igE4BESrTrYykG5j3LPp8ASsEm
	jUZ/yPFNf+W7BO9bCB6VqZuHR1uX2ZEHwt5tOGCNvL7rnF/MWcSAZ8kzBVnE21bDv3KBrLwFdpMUb
	j5kNtPNG9cqbp1KN4DrH9I0g6yQWZvpyKmIHDMaWTHyYd/1o+egQckEs8nAc8JGWeG+KFKn2SQzDk
	jGpjQk8SpWL7H+e4w29NNHrKjTLGRnnKAmWMD9UXq4NL2aEEgTCo6wsf1ePe5ZdOkSYYnwmL0Aeqg
	hgEoHuUEBNyMQuSCcSqPoOQJfeCB4x+cRYvweF698d5Lh1MhdFScxHYkGnVUKNkKwjF+7esY+q/qQ
	GtypXCOg==;
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIS-0000000088b-0SOp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075278; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=QcihiQmex/U1JPCJ48hvx3ZiYeIXF1MRCpJ0DSZDo4k=;
	b=SnIzE3ZR7UHsIPOcR718TgiuQYaTNKqFDI3Wkp7952GN5hAf35LuBSGeuNdkzA8CBiFGwF/gufC1s/amL04lX9yRSqKcJ38o1qDW5cnNXJs2Jz1OsqanvHSNM4Q8+wjoe/tZHrtUxB2aOKFenUe54UI8vUWlR93OMeCt4a8yYi0=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WxbtZlR_1769075272 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:47:57 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 07/16] ras: AEST: Support CE threshold of error record
Date: Thu, 22 Jan 2026 17:46:47 +0800
Message-Id: <20260122094656.73399-8-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_094812_395027_302B5107 
X-CRM114-Status: GOOD (  13.44  )
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

The CE threshold defines the number of Correctable Errors (CE) that
must occur in a record before triggering an interrupt. Error records
support multiple threshold configurations, including 8B, 16B, and 32B.
This patch detects the supported threshold settings for error records
and sets the default threshold to 1, ensuring an interrupt is generated
for every CE occurrence.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/ras.h | 41 ++++++++++++++++++++
 drivers/ras/aest/aest-core.c | 74 ++++++++++++++++++++++++++++++++++++
 drivers/ras/aest/aest.h      | 17 +++++++++
 include/linux/acpi_aest.h    |  3 ++
 4 files changed, 135 insertions(+)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index da7c441252fe..6c51d27520c0 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -4,9 +4,50 @@
 
 #include <linux/types.h>
 
+/* ERR<n>FR */
+#define ERR_FR_CE GENMASK_ULL(54, 53)
+#define ERR_FR_RP BIT(15)
+#define ERR_FR_CEC GENMASK_ULL(14, 12)
+
+#define ERR_FR_RP_SINGLE_COUNTER 0
+#define ERR_FR_RP_DOUBLE_COUNTER 1
+
+#define ERR_FR_CEC_0B_COUNTER 0
+#define ERR_FR_CEC_8B_COUNTER BIT(1)
+#define ERR_FR_CEC_16B_COUNTER BIT(2)
+
+/* ERR<n>MISC0 */
+
+/* ERR<n>FR.CEC == 0b010, ERR<n>FR.RP == 0  */
+#define ERR_MISC0_8B_OF BIT(39)
+#define ERR_MISC0_8B_CEC GENMASK_ULL(38, 32)
+
+/* ERR<n>FR.CEC == 0b100, ERR<n>FR.RP == 0  */
+#define ERR_MISC0_16B_OF BIT(47)
+#define ERR_MISC0_16B_CEC GENMASK_ULL(46, 32)
+
+#define ERR_MISC0_CEC_SHIFT 31
+
+#define ERR_8B_CEC_MAX (ERR_MISC0_8B_CEC >> ERR_MISC0_CEC_SHIFT)
+#define ERR_16B_CEC_MAX (ERR_MISC0_16B_CEC >> ERR_MISC0_CEC_SHIFT)
+
+/* ERR<n>FR.CEC == 0b100, ERR<n>FR.RP == 1  */
+#define ERR_MISC0_16B_OFO BIT(63)
+#define ERR_MISC0_16B_CECO GENMASK_ULL(62, 48)
+#define ERR_MISC0_16B_OFR BIT(47)
+#define ERR_MISC0_16B_CECR GENMASK_ULL(46, 32)
+
 /* ERRDEVARCH */
 #define ERRDEVARCH_REV GENMASK(19, 16)
 
+enum ras_ce_threshold {
+	RAS_CE_THRESHOLD_0B,
+	RAS_CE_THRESHOLD_8B,
+	RAS_CE_THRESHOLD_16B,
+	RAS_CE_THRESHOLD_32B,
+	UNKNOWN,
+};
+
 struct ras_ext_regs {
 	u64 err_fr;
 	u64 err_ctlr;
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 1218ae51079c..5cfe91a6d72a 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -16,6 +16,79 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+static enum ras_ce_threshold aest_get_ce_threshold(struct aest_record *record)
+{
+	u64 err_fr, err_fr_cec, err_fr_rp = -1;
+
+	err_fr = record_read(record, ERXFR);
+	err_fr_cec = FIELD_GET(ERR_FR_CEC, err_fr);
+	err_fr_rp = FIELD_GET(ERR_FR_RP, err_fr);
+
+	if (err_fr_cec == ERR_FR_CEC_0B_COUNTER)
+		return RAS_CE_THRESHOLD_0B;
+	else if (err_fr_rp == ERR_FR_RP_DOUBLE_COUNTER)
+		return RAS_CE_THRESHOLD_32B;
+	else if (err_fr_cec == ERR_FR_CEC_8B_COUNTER)
+		return RAS_CE_THRESHOLD_8B;
+	else if (err_fr_cec == ERR_FR_CEC_16B_COUNTER)
+		return RAS_CE_THRESHOLD_16B;
+	else
+		return UNKNOWN;
+}
+
+static const struct ce_threshold_info ce_info[] = {
+	[RAS_CE_THRESHOLD_0B] = { 0 },
+	[RAS_CE_THRESHOLD_8B] = {
+		.max_count = ERR_8B_CEC_MAX,
+		.mask = ERR_MISC0_8B_CEC,
+		.shift = ERR_MISC0_CEC_SHIFT,
+	},
+	[RAS_CE_THRESHOLD_16B] = {
+		.max_count = ERR_16B_CEC_MAX,
+		.mask = ERR_MISC0_16B_CEC,
+		.shift = ERR_MISC0_CEC_SHIFT,
+	},
+};
+
+static void aest_set_ce_threshold(struct aest_record *record)
+{
+	u64 err_misc0;
+	struct ce_threshold *ce = &record->ce;
+	const struct ce_threshold_info *info;
+
+	record->threshold_type = aest_get_ce_threshold(record);
+
+	switch (record->threshold_type) {
+	case RAS_CE_THRESHOLD_0B:
+		aest_record_dbg(record, "do not support CE threshold!\n");
+		return;
+	case RAS_CE_THRESHOLD_8B:
+		aest_record_dbg(record, "support 8 bit CE threshold!\n");
+		break;
+	case RAS_CE_THRESHOLD_16B:
+		aest_record_dbg(record, "support 16 bit CE threshold!\n");
+		break;
+	case RAS_CE_THRESHOLD_32B:
+		aest_record_dbg(record, "not support 32 bit CE threshold!\n");
+		break;
+	default:
+		aest_record_dbg(record, "Unknown misc0 ce threshold!\n");
+	}
+
+	err_misc0 = record_read(record, ERXMISC0);
+	info = &ce_info[record->threshold_type];
+	ce->info = info;
+
+	// Default CE threshold is 1.
+	ce->count = info->max_count;
+	ce->threshold = DEFAULT_CE_THRESHOLD;
+	ce->reg_val = err_misc0 | info->mask;
+
+	record_write(record, ERXMISC0, ce->reg_val);
+	aest_record_dbg(record, "CE threshold is %llx, controlled by Kernel",
+			ce->threshold);
+}
+
 static int get_aest_node_ver(struct aest_node *node)
 {
 	u64 reg;
@@ -54,6 +127,7 @@ static int aest_init_record(struct aest_record *record, int i,
 	record->addressing_mode = test_bit(i, node->info->addressing_mode);
 	record->index = i;
 	record->node = node;
+	aest_set_ce_threshold(record);
 
 	aest_record_dbg(record, "base: %p, index: %d, address mode: %x\n",
 			record->regs_base, record->index,
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 505ecd9635bc..85eeed79bcbe 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -9,6 +9,7 @@
 #include <asm/ras.h>
 
 #define MAX_GSI_PER_NODE 2
+#define DEFAULT_CE_THRESHOLD 1
 
 #define record_read(record, offset) \
 	record->access->read(record->regs_base, offset)
@@ -71,6 +72,19 @@ struct aest_access {
 	void (*write)(void *base, u32 offset, u64 val);
 };
 
+struct ce_threshold_info {
+	const u64 max_count;
+	const u64 mask;
+	const u64 shift;
+};
+
+struct ce_threshold {
+	const struct ce_threshold_info *info;
+	u64 count;
+	u64 threshold;
+	u64 reg_val;
+};
+
 struct aest_record {
 	char *name;
 	int index;
@@ -88,6 +102,9 @@ struct aest_record {
 	int addressing_mode;
 	struct aest_node *node;
 	const struct aest_access *access;
+
+	struct ce_threshold ce;
+	enum ras_ce_threshold threshold_type;
 };
 
 struct aest_group {
diff --git a/include/linux/acpi_aest.h b/include/linux/acpi_aest.h
index 77187ce43d44..a7898c643896 100644
--- a/include/linux/acpi_aest.h
+++ b/include/linux/acpi_aest.h
@@ -13,6 +13,9 @@
 /* AEST interrupt */
 #define AEST_INTERRUPT_MODE BIT(0)
 
+#define AEST_INTERRUPT_FHI_UE_SUPPORT		BIT(0)
+#define AEST_INTERRUPT_FHI_UE_NO_SUPPORT		BIT(1)
+
 #define AEST_MAX_INTERRUPT_PER_NODE 2
 
 /* AEST interface */
-- 
2.51.2.612.gdc70283dfc


