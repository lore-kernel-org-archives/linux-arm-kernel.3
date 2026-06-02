Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B1DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNKFUAbkpoYroboLULokfYwli0lIltgQwkqHon85TEw=; b=KQ+q8teSNz6WMSLqMB0DrdhkmP
	Ecl/XBPPUDj5IL7taMBwtSFClsAb9y7Hs1jjmHOMxsgfKpPg/qsIdAOMOqwLlDdh9u8Mv5Xgqt7ek
	78E7tKTrHOoRNCmrkk2NmakUbK3XzFmnQdCm2WoTTogDC6AwzoJbChwh0Op/c+/3mi78kju1GiOdO
	dk5rsNtvp+EfiVv8GG2cMUN/naal+ctCYS1q1768LoI2OCpEvsCPgcNf2+SEB7O2NFQJ6ZXq1wz3O
	0xe9WNPn03uhalD3xLKuO8yVo3/k7tia4xZemrkRxrSB8pI/qTEIEOg3EC60iIW0sLp2wHrGzAavk
	kI2hQUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMI-0000000CR8X-1XqD;
	Tue, 02 Jun 2026 07:16:18 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMD-0000000CR2B-1RSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384571; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WNKFUAbkpoYroboLULokfYwli0lIltgQwkqHon85TEw=;
	b=NKjZjc6lt05eD4Phx7Y4LsrrKeu+xacNaD7Bnd85HYU6ke8eObaOEpDP4Jemq/YEpuRHr3ygSkHrJ6Xle8UBmGck1/DysY2D5tkyFTzXuPJULdUSpSAGpgvLzEQXnusuxC/naPgiFWGnTv40D6XiU66aYiJsJ91OTnrs7NHnY+8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2et_1780384568;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2et_1780384568 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:09 +0800
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
Subject: [PATCH v7 10/16] arm64: ras: Support CE threshold of error record
Date: Tue,  2 Jun 2026 15:15:33 +0800
Message-ID: <20260602071540.3711528-11-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001613_800867_970EC60B 
X-CRM114-Status: GOOD (  18.56  )
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
 arch/arm64/include/asm/ras.h | 41 +++++++++++++++++
 drivers/ras/arm64/ras-core.c | 85 +++++++++++++++++++++++++++++++++++-
 drivers/ras/arm64/ras.h      | 18 ++++++++
 3 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index 5b938ff03e74..ae67cfcc214e 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -5,6 +5,39 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 
+/* ERR<n>FR */
+#define ERR_FR_CE			GENMASK_ULL(54, 53)
+#define ERR_FR_RP			BIT(15)
+#define ERR_FR_CEC			GENMASK_ULL(14, 12)
+
+#define ERR_FR_RP_SINGLE_COUNTER	0
+#define ERR_FR_RP_DOUBLE_COUNTER	1
+
+#define ERR_FR_CEC_0B_COUNTER		0
+#define ERR_FR_CEC_8B_COUNTER		BIT(1)
+#define ERR_FR_CEC_16B_COUNTER		BIT(2)
+
+/* ERR<n>MISC0 */
+
+/* ERR<n>FR.CEC == 0b010, ERR<n>FR.RP == 0  */
+#define ERR_MISC0_8B_OF			BIT(39)
+#define ERR_MISC0_8B_CEC		GENMASK_ULL(38, 32)
+
+/* ERR<n>FR.CEC == 0b100, ERR<n>FR.RP == 0  */
+#define ERR_MISC0_16B_OF		BIT(47)
+#define ERR_MISC0_16B_CEC		GENMASK_ULL(46, 32)
+
+#define ERR_MISC0_CEC_SHIFT		32
+
+#define ERR_8B_CEC_MAX			(ERR_MISC0_8B_CEC >> ERR_MISC0_CEC_SHIFT)
+#define ERR_16B_CEC_MAX			(ERR_MISC0_16B_CEC >> ERR_MISC0_CEC_SHIFT)
+
+/* ERR<n>FR.CEC == 0b100, ERR<n>FR.RP == 1  */
+#define ERR_MISC0_16B_OFO		BIT(63)
+#define ERR_MISC0_16B_CECO		GENMASK_ULL(62, 48)
+#define ERR_MISC0_16B_OFR		BIT(47)
+#define ERR_MISC0_16B_CECR		GENMASK_ULL(46, 32)
+
 /* ERR<n>STATUS */
 #define ERR_STATUS_AV			BIT(31)
 #define ERR_STATUS_V			BIT(30)
@@ -47,6 +80,14 @@
 /* ERRDEVARCH */
 #define ERRDEVARCH_REV			GENMASK(19, 16)
 
+enum ras_ce_threshold {
+	RAS_CE_THRESHOLD_0B,
+	RAS_CE_THRESHOLD_8B,
+	RAS_CE_THRESHOLD_16B,
+	RAS_CE_THRESHOLD_32B,
+	RAS_CE_THRESHOLD_UNKNOWN,
+};
+
 struct ras_ext_regs {
 	u64 err_fr;
 	u64 err_ctlr;
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 9fbc98e89f15..94514a5bb973 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -53,6 +53,20 @@ const struct ras_group ras_group_config[] = {
 	},
 };
 
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
 #define AEST_LOG_PREFIX_BUFFER 64
 
 static void ras_print(struct ras_record *record, struct ras_ext_regs *regs)
@@ -174,8 +188,8 @@ static void ras_proc_record(struct ras_record *record, void *data)
 			regs.err_misc[3] = record_read(record, ERXMISC3);
 		}
 
+		record_write(record, ERXMISC0, record->ce.reg_val);
 		if (record->node->flags & AEST_XFACE_FLAG_CLEAR_MISC) {
-			record_write(record, ERXMISC0, 0);
 			record_write(record, ERXMISC1, 0);
 			if (record->node->version >= ID_AA64PFR0_EL1_RAS_V1P1) {
 				record_write(record, ERXMISC2, 0);
@@ -367,6 +381,73 @@ static void ras_enable_irq(struct ras_record *record)
 	record_write(record, ERXCTLR, err_ctlr);
 }
 
+static int ras_get_ce_threshold(struct ras_record *record)
+{
+	u64 err_fr, err_fr_cec, err_fr_rp;
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
+
+	return RAS_CE_THRESHOLD_UNKNOWN;
+}
+
+static void ras_set_ce_threshold(struct ras_record *record)
+{
+	u64 err_misc0;
+	struct ce_threshold *ce = &record->ce;
+	const struct ce_threshold_info *info;
+
+	record->threshold_type = ras_get_ce_threshold(record);
+
+	switch (record->threshold_type) {
+	case RAS_CE_THRESHOLD_0B:
+		ras_record_dbg(record, "do not support CE threshold!\n");
+		return;
+	case RAS_CE_THRESHOLD_8B:
+		ras_record_dbg(record, "support 8 bit CE threshold!\n");
+		break;
+	case RAS_CE_THRESHOLD_16B:
+		ras_record_dbg(record, "support 16 bit CE threshold!\n");
+		break;
+	case RAS_CE_THRESHOLD_32B:
+		ras_record_dbg(record, "not support 32 bit CE threshold!\n");
+		return;
+	default:
+		ras_record_dbg(record, "Unknown misc0 ce threshold!\n");
+		return;
+	}
+
+	err_misc0 = record_read(record, ERXMISC0);
+	info = &ce_info[record->threshold_type];
+	ce->info = info;
+
+	/* Default CE threshold is 1 */
+	ce->threshold = DEFAULT_CE_THRESHOLD;
+	/*
+	 * The CEC field in ERXMISC0 is a saturating up-counter; the
+	 * overflow flag (ERXSTATUS.OF) is asserted only when CEC
+	 * saturates at max_count. To make "threshold" mean "trigger OF
+	 * after `threshold` more CEs", preset CEC to max_count - threshold.
+	 */
+	ce->count = info->max_count - ce->threshold + 1;
+	ce->reg_val = (err_misc0 & ~info->mask) |
+		      (ce->count << info->shift);
+
+	record_write(record, ERXMISC0, ce->reg_val);
+	ras_record_dbg(record, "CE threshold is %llu, controlled by Kernel",
+		       ce->threshold);
+}
+
 static int get_ras_node_ver(struct ras_node *node)
 {
 	u32 reg;
@@ -382,6 +463,7 @@ static int get_ras_node_ver(struct ras_node *node)
 	return FIELD_GET(ID_AA64PFR0_EL1_RAS_MASK, read_cpuid(ID_AA64PFR0_EL1));
 }
 
+
 static int ras_init_record(struct ras_record *record, int i, struct ras_node *node)
 {
 	record->name = devm_kasprintf(node->dev, GFP_KERNEL, "record%d", i);
@@ -403,6 +485,7 @@ static int ras_init_record(struct ras_record *record, int i, struct ras_node *no
 
 static void ras_online_record(struct ras_record *record, void *data)
 {
+	ras_set_ce_threshold(record);
 	ras_enable_irq(record);
 }
 
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index 03d1b498acc4..ac3876912495 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -11,6 +11,8 @@
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
 
+#define DEFAULT_CE_THRESHOLD 1
+
 #define record_read(record, offset) \
 	((record)->access->read((record)->regs_base, (offset)))
 #define record_write(record, offset, val) \
@@ -65,12 +67,28 @@ struct ras_access {
 	void (*write)(void __iomem *base, u32 offset, u64 val);
 };
 
+struct ce_threshold_info {
+	u64 max_count;
+	u64 mask;
+	u64 shift;
+};
+
+struct ce_threshold {
+	const struct ce_threshold_info *info;
+	u64 count;
+	u64 threshold;
+	u64 reg_val;
+};
+
 struct ras_record {
 	char *name;
 	void __iomem *regs_base;
 	struct ras_node *node;
 	const struct ras_access *access;
 
+	struct ce_threshold ce;
+	enum ras_ce_threshold threshold_type;
+
 	int index;
 	/*
 	 * This bit specifies the addressing mode to populate the ERR_ADDR
-- 
2.51.2.612.gdc70283dfc


