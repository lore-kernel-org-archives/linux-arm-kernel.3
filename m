Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5280CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn3Ar2RstWmCt7LTcZYq3bGkhJyXxPWAwFLAA6UOZgU=; b=vz69Lb47NBWvVrqREXPdb0x3EJ
	zvM5wNdqufFYpdI68iA0w1o6tWeT7aUvO+tHyM3WKm8QmwZ1xP96xwzfRevu307HdkstDZdhuyBK3
	Qn0kiDyQoc0S7RsDFaRmA2pO5IL1qGidAfGtsf+XyrIzK9YBvoadonq7Vk8CYbk3UTZUpNzvif6jd
	yvOuUJ7Rrs72IwWftnWFowy6EsRj+eNRtbgAh+TL2eoWsK6yEVAOhCdeDtG2XiJSRywZK5C2PRHTS
	6SBKZ9CyqeNeGqDCnESNKBjKUKzm3d2NGgsSEeYTICAz4sk1nnaYUY0pF0FUHjySHxS2+eoJSsre1
	ps1cmWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMK-0000000CRBy-0oW2;
	Tue, 02 Jun 2026 07:16:20 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJME-0000000CR2e-0JD7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384564; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=hn3Ar2RstWmCt7LTcZYq3bGkhJyXxPWAwFLAA6UOZgU=;
	b=f4AhXKET18op9sCF4NYbq5E1cwYvChHPCw4ld+I/8RukMC60lWJlsAY33v08RAr1uB4tsD4o78iaLws9hFWGn7smfFs0uSVdYE1qj4uNy718RsLWjGH8d8AF2zTzf+5869mvMhNXY43IjhcIIIloUPFValT2Ndl9vEbCcHnUAMA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2c-_1780384558;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2c-_1780384558 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:00 +0800
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
Subject: [PATCH v7 04/16] arm64: ras: Support RAS Common Fault Injection Model Extension
Date: Tue,  2 Jun 2026 15:15:27 +0800
Message-ID: <20260602071540.3711528-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001614_348007_EA5AF384 
X-CRM114-Status: GOOD (  15.05  )
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

Add inject register descripted in Common Fault Injection Model
Extension.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/acpi/arm64/aest.c    |  4 +++-
 drivers/ras/arm64/ras-core.c | 27 +++++++++++++++++++++++++--
 drivers/ras/arm64/ras.h      | 10 ++++++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/arm64/aest.c b/drivers/acpi/arm64/aest.c
index 3a813fe7047c..868013498abb 100644
--- a/drivers/acpi/arm64/aest.c
+++ b/drivers/acpi/arm64/aest.c
@@ -110,6 +110,8 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 						     group_len);
 	props[(*p)++] = PROPERTY_ENTRY_U64("arm,error-group-base",
 					   common->error_group_register_base);
+	props[(*p)++] = PROPERTY_ENTRY_U64("arm,fault-inject-base",
+					   common->fault_inject_register_base);
 
 	len = hdr->node_interface_offset - hdr->node_specific_offset;
 	props[(*p)++] =
@@ -122,7 +124,7 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 static int __init
 aest_create_node_fwnode(struct acpi_aest_hdr *hdr, struct platform_device *pdev)
 {
-	struct property_entry props[11] = { };
+	struct property_entry props[12] = { };
 	int p = 0;
 	int ret;
 
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 47ab78cc88d7..1dd471376449 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -139,6 +139,23 @@ static int ras_node_set_errgsr(struct ras_node *node, phys_addr_t base)
 	return 0;
 }
 
+static int ras_node_set_inj_base(struct ras_node *node, phys_addr_t base)
+{
+	phys_addr_t inj_base = 0;
+	int ret = 0;
+
+	if (!(node->flags & AEST_XFACE_FLAG_FAULT_INJECT))
+		return 0;
+
+	ret = device_property_read_u64(node->dev, "arm,fault-inject-base",
+				       &inj_base);
+	if (ret || !inj_base)
+		return -EINVAL;
+
+	node->inj = inj_base - base + node->base;
+	return 0;
+}
+
 static struct ras_node *ras_init_node(struct platform_device *pdev)
 {
 	int i, ret = 0;
@@ -204,6 +221,11 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 		ret = ras_node_set_errgsr(node, mem->start);
 		if (ret)
 			return ERR_PTR(ret);
+		ret = ras_node_set_inj_base(node, mem->start);
+		if (ret)
+			return ERR_PTR(ret);
+	} else if (node->access_type == ACPI_AEST_NODE_MEMORY_MAPPED) {
+		return ERR_PTR(-EINVAL);
 	}
 
 	node->name = alloc_ras_node_name(node);
@@ -221,8 +243,9 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 		if (ret)
 			return ERR_PTR(ret);
 	}
-	ras_node_dbg(node, "base: %llx, access_type: %s\n",
-		     node->addr, node->access_type ? "MMIO" : "Register");
+	ras_node_dbg(node, "base: %llx, access_type: %s, %s inject\n",
+		     node->addr, node->access_type ? "MMIO" : "Register",
+		     node->flags & AEST_XFACE_FLAG_FAULT_INJECT ? "with" : "without");
 	return node;
 }
 
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index 94ffeb83b251..da03593e5f7f 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -54,6 +54,9 @@
 #define ERXMISC1		0x28
 #define ERXMISC2		0x30
 #define ERXMISC3		0x38
+#define ERXPFGF			0x800
+#define ERXPFGCTL		0x808
+#define ERXPFGCDN		0x810
 
 struct ras_access {
 	u64 (*read)(void __iomem *base, u32 offset);
@@ -85,6 +88,7 @@ struct ras_node {
 
 	void __iomem *base;
 	void __iomem *errgsr;
+	void __iomem *inj;
 	phys_addr_t addr;
 
 	u8 *specific_data;
@@ -147,6 +151,9 @@ static inline u64 ras_sysreg_read(void __iomem *base __always_unused, u32 offset
 	CASE_READ(res, ERXMISC1)
 	CASE_READ(res, ERXMISC2)
 	CASE_READ(res, ERXMISC3)
+	CASE_READ(res, ERXPFGF)
+	CASE_READ(res, ERXPFGCTL)
+	CASE_READ(res, ERXPFGCDN)
 	default:
 		res = 0;
 	}
@@ -164,6 +171,9 @@ static inline void ras_sysreg_write(void __iomem *base __always_unused, u32 offs
 	CASE_WRITE(val, ERXMISC1)
 	CASE_WRITE(val, ERXMISC2)
 	CASE_WRITE(val, ERXMISC3)
+	CASE_WRITE(val, ERXPFGF)
+	CASE_WRITE(val, ERXPFGCTL)
+	CASE_WRITE(val, ERXPFGCDN)
 	default:
 		return;
 	}
-- 
2.51.2.612.gdc70283dfc


