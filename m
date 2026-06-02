Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7F7CD6E65
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZozZHcNNhfj5S1VhtyeRB12PjLLzujmaREsy9720OSQ=; b=X1cUUZr5hdKevojxZRilOoTcpo
	fLYt2W9Vvhurn/omY43PuensJ/6t5ZtSNoWngZrwz/unaaFIlIgfOpBfWDrLqdSFRkYrdy+MNv8+Q
	bPuH9+IWkTErxJRLyP2PDWxU7WE3mAJ3r0Q0uaUkST183TgCGZQyWEsD6RjUBRFzp4eHj0ZDZQYv8
	tjKqSfD+3Ep1WsJU0/7zWH16xTjCcSJUC/favx1xknRirjqmNuIjetdAEHuIIMup0hJt8ZLafqR6a
	hddduVBVvtk6IcdfJnHkaETmEGSuF58sXkiNF4N5N4sx0uBTtuLEHSRmE9kNoY0I+tIg7Ad/XvwVB
	hCAOMEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMH-0000000CR6y-0n3V;
	Tue, 02 Jun 2026 07:16:17 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMD-0000000CR20-2AOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384570; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZozZHcNNhfj5S1VhtyeRB12PjLLzujmaREsy9720OSQ=;
	b=jFChcQj7RLlr69lNxrDdOSxPGFk6deLk1rGZUICka1kK1DZpip2pZ0wjEJBKJUYdd6DsCRxC+BbKpH/b6zDsAYZY+ZodLQBexIvCXK5Sinf8iVC9ksNTcnc3Uv5WUFxZPRNCXUxQggAiURZ5ItzK657h/ZDLwlb5uJSpHZ2zHPk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2e1_1780384566;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2e1_1780384566 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:07 +0800
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
Subject: [PATCH v7 09/16] arm64: ras: Probe RAS architecture version
Date: Tue,  2 Jun 2026 15:15:32 +0800
Message-ID: <20260602071540.3711528-10-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001613_772696_F7A48A50 
X-CRM114-Status: GOOD (  13.56  )
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

The RAS version of a component can be probed via its ERRDEVARCH register.

In cases where a component (e.g., SMMU) does not implement an ERRDEVARCH
register, the driver falls back to using the RAS version of the Processing
Element (PE).

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/ras.h |  3 +++
 drivers/ras/arm64/ras-core.c | 25 +++++++++++++++++++++++++
 drivers/ras/arm64/ras.h      |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index 7bef631a395c..5b938ff03e74 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -44,6 +44,9 @@
 #define ERRFHICR0_OFFSET		0x0
 #define ERRERICR0_OFFSET		0x10
 
+/* ERRDEVARCH */
+#define ERRDEVARCH_REV			GENMASK(19, 16)
+
 struct ras_ext_regs {
 	u64 err_fr;
 	u64 err_ctlr;
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index babb390b795f..9fbc98e89f15 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -169,9 +169,18 @@ static void ras_proc_record(struct ras_record *record, void *data)
 	if (regs.err_status & ERR_STATUS_MV) {
 		regs.err_misc[0] = record_read(record, ERXMISC0);
 		regs.err_misc[1] = record_read(record, ERXMISC1);
+		if (record->node->version >= ID_AA64PFR0_EL1_RAS_V1P1) {
+			regs.err_misc[2] = record_read(record, ERXMISC2);
+			regs.err_misc[3] = record_read(record, ERXMISC3);
+		}
+
 		if (record->node->flags & AEST_XFACE_FLAG_CLEAR_MISC) {
 			record_write(record, ERXMISC0, 0);
 			record_write(record, ERXMISC1, 0);
+			if (record->node->version >= ID_AA64PFR0_EL1_RAS_V1P1) {
+				record_write(record, ERXMISC2, 0);
+				record_write(record, ERXMISC3, 0);
+			}
 		}
 	}
 
@@ -358,6 +367,21 @@ static void ras_enable_irq(struct ras_record *record)
 	record_write(record, ERXCTLR, err_ctlr);
 }
 
+static int get_ras_node_ver(struct ras_node *node)
+{
+	u32 reg;
+
+	if (node->type == ACPI_AEST_GIC_ERROR_NODE) {
+		if (!node->base)
+			return 0;
+
+		reg = readl_relaxed(node->base + GIC_ERRDEVARCH);
+		return FIELD_GET(ERRDEVARCH_REV, reg);
+	}
+
+	return FIELD_GET(ID_AA64PFR0_EL1_RAS_MASK, read_cpuid(ID_AA64PFR0_EL1));
+}
+
 static int ras_init_record(struct ras_record *record, int i, struct ras_node *node)
 {
 	record->name = devm_kasprintf(node->dev, GFP_KERNEL, "record%d", i);
@@ -665,6 +689,7 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 	if (!node->name)
 		return ERR_PTR(-ENOMEM);
 
+	node->version = get_ras_node_ver(node);
 	node->records = devm_kcalloc(node->dev, node->record_count,
 				     sizeof(struct ras_record), GFP_KERNEL);
 	if (!node->records)
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index 11c6def1e4bf..03d1b498acc4 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -58,6 +58,8 @@
 #define ERXPFGCTL		0x808
 #define ERXPFGCDN		0x810
 
+#define GIC_ERRDEVARCH		0xFFBC
+
 struct ras_access {
 	u64 (*read)(void __iomem *base, u32 offset);
 	void (*write)(void __iomem *base, u32 offset, u64 val);
@@ -148,6 +150,7 @@ struct ras_node {
 	u32 record_count;
 	u32 record_index;
 	u32 flags;
+	int version;
 
 	u8 type;
 	u8 access_type;
-- 
2.51.2.612.gdc70283dfc


