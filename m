Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E0CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4LP+ZuzdN+MoIKSVl/cWVVJdadts6yo+cmT5nvYGPQ=; b=x2E7XGw2VadgMj6Nw0MM+16M78
	BTlk6g6Qf8XnID63/5nC8vDZChYi/Du/MlfcIswTf010wZ2vG+sAnTA7xfUqyFy1lRZv2ukX6X5B3
	n+jQnYVLX+1KZK1RZRE96QGXXFX9F9c77lkBBh/fFpzVM8tTtBPldc/k56kL2KHy5CIYPcGtZv1/m
	OuFDSYng4ReN6UUWAchl0/273WIjGf9Q03uqXhi3pRcmacD9exgwcnBsdKQo5n408nXw/LhkE9YBs
	CvDnQ+nIJbA2/IopoF0a/ud4qRkmiJFSukri7TIFnusHQh8ViGKscdOszz8R0hS7lmKi7XKYR2YZH
	qEwoK+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMH-0000000CR6U-04SC;
	Tue, 02 Jun 2026 07:16:17 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMC-0000000CR0o-02tQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384568; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=H4LP+ZuzdN+MoIKSVl/cWVVJdadts6yo+cmT5nvYGPQ=;
	b=OvM1IUWncySTNVCWe1p1OHS/lbPzFzQEgB1j5Ft44S6PxW3XtfjcXijIGjStjklmO1iXaTAZ6nMDxAnAGoKFoqMhW/nOWeZy4q0bTbMFD427JxYRIQuJfhno4OagheqTdYKm24agLfkguP+gIlObAfCWiDRaoRn92W4GogYQox0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2dj_1780384565;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2dj_1780384565 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:06 +0800
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
Subject: [PATCH v7 08/16] arm64: ras: Handle memory failure for uncorrectable errors
Date: Tue,  2 Jun 2026 15:15:31 +0800
Message-ID: <20260602071540.3711528-9-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001613_495814_601E452E 
X-CRM114-Status: GOOD (  18.34  )
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

When an uncorrectable error (UE/DE) is detected and the error record
reports a System Physical Address (SPA), invoke memory_failure() to
offline the affected page. This prevents further consumption of
corrupted data.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/ras.h |  4 ++++
 drivers/acpi/arm64/aest.c    |  5 ++++-
 drivers/ras/arm64/ras-core.c | 21 +++++++++++++++++++++
 drivers/ras/arm64/ras.h      | 26 ++++++++++++++++++++++++++
 include/linux/acpi_aest.h    |  3 +++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index 42900e1e9a19..7bef631a395c 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -31,6 +31,10 @@
 #define ERR_STATUS_UET_UEO		2
 #define ERR_STATUS_UET_UER		3
 
+/* ERR<n>ADDR */
+#define ERR_ADDR_AI			BIT(61)
+#define ERR_ADDR_PADDR			GENMASK_ULL(55, 0)
+
 /* ERR<n>CTLR */
 #define ERR_CTLR_CFI			BIT(8)
 #define ERR_CTLR_FI			BIT(3)
diff --git a/drivers/acpi/arm64/aest.c b/drivers/acpi/arm64/aest.c
index 5733c91c8e0d..1b020ab7eccd 100644
--- a/drivers/acpi/arm64/aest.c
+++ b/drivers/acpi/arm64/aest.c
@@ -153,6 +153,9 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 	props[(*p)++] = PROPERTY_ENTRY_U64_ARRAY_LEN("arm,status-reporting",
 						     status_reporting,
 						     group_len);
+	props[(*p)++] = PROPERTY_ENTRY_U64_ARRAY_LEN("arm,addressing-mode",
+						     addressing_mode,
+						     group_len);
 	props[(*p)++] = PROPERTY_ENTRY_U64("arm,error-group-base",
 					   common->error_group_register_base);
 	props[(*p)++] = PROPERTY_ENTRY_U64("arm,fault-inject-base",
@@ -173,7 +176,7 @@ aest_init_node_props(struct acpi_aest_hdr *hdr, struct property_entry *props,
 static int __init
 aest_create_node_fwnode(struct acpi_aest_hdr *hdr, struct platform_device *pdev)
 {
-	struct property_entry props[15] = { };
+	struct property_entry props[16] = { };
 	int p = 0;
 	int ret;
 
diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 8c6d202882ed..babb390b795f 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -127,7 +127,17 @@ static void ras_print(struct ras_record *record, struct ras_ext_regs *regs)
 
 static void ras_do_proc(struct ras_record *record, struct ras_ext_regs *regs)
 {
+	u64 status = regs->err_status, addr = regs->err_addr;
+
 	ras_print(record, regs);
+
+	if (status & ERR_STATUS_CE)
+		return;
+
+	if (record->addressing_mode == AEST_ADDRESS_LA || (addr & ERR_ADDR_AI))
+		return;
+
+	memory_failure_queue(addr & PHYS_MASK, 0);
 }
 
 static void ras_panic(struct ras_record *record, struct ras_ext_regs *regs,
@@ -360,7 +370,10 @@ static int ras_init_record(struct ras_record *record, int i, struct ras_node *no
 	record->access = &ras_access[node->access_type];
 	record->index = i;
 	record->node = node;
+	record->addressing_mode = test_bit(i, node->addressing_mode);
 
+	ras_record_dbg(record, "record initialized, addressing mode: %s\n",
+		       record->addressing_mode ? "LA" : "SPA");
 	return 0;
 }
 
@@ -598,6 +611,11 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 					GFP_KERNEL);
 	if (!node->status_reporting)
 		return ERR_PTR(-ENOMEM);
+	node->addressing_mode = devm_bitmap_zalloc(dev,
+					node->group->errgsr_num * BITS_PER_TYPE(u64),
+					GFP_KERNEL);
+	if (!node->addressing_mode)
+		return ERR_PTR(-ENOMEM);
 
 	ret = device_property_read_u64_array(dev, "arm,record-implemented",
 					     (u64 *)node->record_implemented,
@@ -605,6 +623,9 @@ static struct ras_node *ras_init_node(struct platform_device *pdev)
 	ret = ret ?: device_property_read_u64_array(dev, "arm,status-reporting",
 						    (u64 *)node->status_reporting,
 						    node->group->errgsr_num);
+	ret = ret ?: device_property_read_u64_array(dev, "arm,addressing-mode",
+						    (u64 *)node->addressing_mode,
+						    node->group->errgsr_num);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/ras/arm64/ras.h b/drivers/ras/arm64/ras.h
index c26a0aae26c5..11c6def1e4bf 100644
--- a/drivers/ras/arm64/ras.h
+++ b/drivers/ras/arm64/ras.h
@@ -70,6 +70,16 @@ struct ras_record {
 	const struct ras_access *access;
 
 	int index;
+	/*
+	 * This bit specifies the addressing mode to populate the ERR_ADDR
+	 * register:
+	 *   0b: Error record reports System Physical Addresses (SPA) in
+	 *       the ERR_ADDR register.
+	 *   1b: Error record reports error node-specific Logical Addresses (LA)
+	 *       in the ERR_ADDR register. OS must use other means to translate
+	 *       the reported LA into SPA.
+	 */
+	int addressing_mode;
 };
 
 struct ras_group {
@@ -116,6 +126,22 @@ struct ras_node {
 	 *              error events.
 	 */
 	unsigned long *status_reporting;
+	/*
+	 * This bitmap specifies the addressing mode used by each
+	 * error record within this error node to populate the
+	 * ERR<n>_ADDR register.
+	 * Bit[n] of this field pertains to error record corresponding
+	 * to index n in the error group.
+	 * Bit[n] = 0b: Error record at index n reports System
+	 *		Physical Addresses (SPA) in the ERR<n>_ADDR
+	 *		register.
+	 * Bit[n] = 1b: Error record at index n reports error
+	 *		node-specific Logical Addresses (LA) in the
+	 *		ERR<n>_ADDR register.
+	 * OS must use other means to translate the reported LA
+	 * into SPA
+	 */
+	unsigned long *addressing_mode;
 	struct ras_record *records;
 
 	u32 specific_data_size;
diff --git a/include/linux/acpi_aest.h b/include/linux/acpi_aest.h
index 9cb0fcb52c39..9a8aa234d9e5 100644
--- a/include/linux/acpi_aest.h
+++ b/include/linux/acpi_aest.h
@@ -13,6 +13,9 @@
 #define ACPI_AEST_PROC_FLAG_GLOBAL	BIT(0)
 #define ACPI_AEST_PROC_FLAG_SHARED	BIT(1)
 
+#define AEST_ADDRESS_SPA	0
+#define AEST_ADDRESS_LA		1
+
 /* AEST interrupt */
 #define AEST_INTERRUPT_MODE BIT(0)
 
-- 
2.51.2.612.gdc70283dfc


