Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10175CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wkg7zePrkjLP7+kbmK0jAUbfScXCvDraNXIRyL6x9wI=; b=vFuunD6kzznye+s/j1L1O0lZUB
	Mjnrn3Xk7v1FIcp8/rzzPbYGMhxRHIW/1k5zcGq/zKoB3qgD62wDDQ86DDHnY15bjkE49HxI/mT5b
	lThUKKhSeuvL0CxxBD3jJwY4yjH3T/Qf87PPN/bltkCs2nlaeoPwpkf5XbfTY2CZI2S7jjS0tZ/yw
	t2zMUnZZ5tt6YWi6R3Jth++l85d45mwqyuZdCZ9Hy1NB6XS93YFx3qiLnH7RHzieHaJtrdfDICp2J
	VyUnWdpSGoz5DDkYavFVdX4HpeHQwjQpS5eH35qX3mvxBYJDDh/G1IFEs/X+txPAmcp58hBn+Ssg/
	G6cDJrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMS-0000000CRKD-39mV;
	Tue, 02 Jun 2026 07:16:28 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMF-0000000CQyz-2o6V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384560; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Wkg7zePrkjLP7+kbmK0jAUbfScXCvDraNXIRyL6x9wI=;
	b=eU8DchtDhx3n7n+CZS2O6OoNh/HPhDF5p1mH7Mw2MLeZ6/PorACrM5w6rYEd5TAz3IBFDt1CjtzrgToiMGeiGaasfwGpNW4QuKh6+kscpCrjWU4HLdemqm8dG+GS2+grP1WCOeIoDRcnhOogEgyn4DcRRGPpWt2TE7AghRqlSi0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2aa_1780384553;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2aa_1780384553 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:15:58 +0800
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
Subject: [PATCH v7 03/16] arm64: ras: Unify the read/write interface for system and MMIO registers
Date: Tue,  2 Jun 2026 15:15:26 +0800
Message-ID: <20260602071540.3711528-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001616_169581_FF5374AC 
X-CRM114-Status: GOOD (  17.74  )
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

ARM RAS error records are reachable either through system registers
(PE-affine sources) or through memory-mapped windows (off-core
sources), depending on the AEST interface type. Hard-coding the
choice at every call site would scatter that knowledge across the
driver and double every future change.

Introduce a ras_access ops table that hides the transport behind a
single read/write contract, so all later error handling, masking and
injection code is access-method-agnostic and can be reasoned about as
plain register operations.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/acpi/arm64/aest.c    |  3 +-
 drivers/ras/arm64/ras-core.c |  5 +-
 drivers/ras/arm64/ras.h      | 94 ++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/aest.c b/drivers/acpi/arm64/aest.c
index 8cf24467d0c2..3a813fe7047c 100644
--- a/drivers/acpi/arm64/aest.c
+++ b/drivers/acpi/arm64/aest.c
@@ -93,6 +93,7 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 	}
 
 	props[(*p)++] = PROPERTY_ENTRY_U8("arm,node-type", hdr->type);
+	props[(*p)++] = PROPERTY_ENTRY_U8("arm,interface-type", interface->type);
 	props[(*p)++] = PROPERTY_ENTRY_U8("arm,group-format",
 					  interface->group_format);
 	props[(*p)++] = PROPERTY_ENTRY_U32("arm,error-records-count",
@@ -121,7 +122,7 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 static int __init
 aest_create_node_fwnode(struct acpi_aest_hdr *hdr, struct platform_device *pdev)
 {
-	struct property_entry props[10] = { };
+	struct property_entry props[11] = { };
 	int p = 0;
 	int ret;
 
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index b5448f4a841f..47ab78cc88d7 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -51,6 +51,7 @@ static int ras_init_record(struct ras_record *record, int i, struct ras_node *no
 	if (node->base)
 		record->regs_base = node->base + sizeof(struct ras_ext_regs) * i;
 
+	record->access = &ras_access[node->access_type];
 	record->index = i;
 	record->node = node;
 
@@ -152,6 +153,7 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 	node->dev = &pdev->dev;
 
 	ret = ret ?: device_property_read_u8(dev, "arm,node-type", &node->type);
+	ret = ret ?: device_property_read_u8(dev, "arm,interface-type", &node->access_type);
 	ret = ret ?: device_property_read_u8(dev, "arm,group-format", &node->group_format);
 	ret = ret ?: device_property_read_u32(dev, "arm,interface-flags", &node->flags);
 	ret = ret ?: device_property_read_u32(dev, "arm,error-records-count", &node->record_count);
@@ -219,7 +221,8 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 		if (ret)
 			return ERR_PTR(ret);
 	}
-	ras_node_dbg(node, "base: %llx\n", node->addr);
+	ras_node_dbg(node, "base: %llx, access_type: %s\n",
+		     node->addr, node->access_type ? "MMIO" : "Register");
 	return node;
 }
 
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index 3d83f8b26da7..94ffeb83b251 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -11,6 +11,11 @@
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
 
+#define record_read(record, offset) \
+	((record)->access->read((record)->regs_base, (offset)))
+#define record_write(record, offset, val) \
+	((record)->access->write((record)->regs_base, (offset), (val)))
+
 #define ras_node_err(__node, format, ...)                          \
 	dev_err((__node)->dev, "%s: " format, (__node)->name, \
 		##__VA_ARGS__)
@@ -41,10 +46,25 @@
 #define ERXGROUP_16K_ERRGSR_NUM		4
 #define ERXGROUP_64K_ERRGSR_NUM		14
 
+#define ERXFR			0x0
+#define ERXCTLR			0x8
+#define ERXSTATUS		0x10
+#define ERXADDR			0x18
+#define ERXMISC0		0x20
+#define ERXMISC1		0x28
+#define ERXMISC2		0x30
+#define ERXMISC3		0x38
+
+struct ras_access {
+	u64 (*read)(void __iomem *base, u32 offset);
+	void (*write)(void __iomem *base, u32 offset, u64 val);
+};
+
 struct ras_record {
 	char *name;
 	void __iomem *regs_base;
 	struct ras_node *node;
+	const struct ras_access *access;
 
 	int index;
 };
@@ -98,7 +118,81 @@ struct ras_node {
 	u32 flags;
 
 	u8 type;
+	u8 access_type;
 	u8 group_format;
 };
 
+#define CASE_READ(res, x)                           \
+	case (x): {                                 \
+		res = read_sysreg_s(SYS_##x##_EL1); \
+		break;                              \
+	}
+
+#define CASE_WRITE(val, x)                            \
+	case (x): {                                   \
+		write_sysreg_s((val), SYS_##x##_EL1); \
+		break;                                \
+	}
+
+static inline u64 ras_sysreg_read(void __iomem *base __always_unused, u32 offset)
+{
+	u64 res;
+
+	switch (offset) {
+	CASE_READ(res, ERXFR)
+	CASE_READ(res, ERXCTLR)
+	CASE_READ(res, ERXSTATUS)
+	CASE_READ(res, ERXADDR)
+	CASE_READ(res, ERXMISC0)
+	CASE_READ(res, ERXMISC1)
+	CASE_READ(res, ERXMISC2)
+	CASE_READ(res, ERXMISC3)
+	default:
+		res = 0;
+	}
+	return res;
+}
+
+static inline void ras_sysreg_write(void __iomem *base __always_unused, u32 offset, u64 val)
+{
+	switch (offset) {
+	CASE_WRITE(val, ERXFR)
+	CASE_WRITE(val, ERXCTLR)
+	CASE_WRITE(val, ERXSTATUS)
+	CASE_WRITE(val, ERXADDR)
+	CASE_WRITE(val, ERXMISC0)
+	CASE_WRITE(val, ERXMISC1)
+	CASE_WRITE(val, ERXMISC2)
+	CASE_WRITE(val, ERXMISC3)
+	default:
+		return;
+	}
+}
+
+static inline u64 ras_iomem_read(void __iomem *base, u32 offset)
+{
+	return readq_relaxed(base + offset);
+}
+
+static inline void ras_iomem_write(void __iomem *base, u32 offset, u64 val)
+{
+	writeq_relaxed(val, base + offset);
+}
+
+/* access type is decided by AEST interface type. */
+static const struct ras_access ras_access[] = {
+	[ACPI_AEST_NODE_SYSTEM_REGISTER] = {
+		.read = ras_sysreg_read,
+		.write = ras_sysreg_write,
+	},
+	[ACPI_AEST_NODE_MEMORY_MAPPED] = {
+		.read = ras_iomem_read,
+		.write = ras_iomem_write,
+	},
+	[ACPI_AEST_NODE_SINGLE_RECORD_MEMORY_MAPPED] = {
+		.read = ras_iomem_read,
+		.write = ras_iomem_write,
+	},
+};
+
 #endif /* _DRIVERS_RAS_ARM64_RAS_H_ */
-- 
2.51.2.612.gdc70283dfc


