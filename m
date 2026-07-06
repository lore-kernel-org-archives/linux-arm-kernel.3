Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C82BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9BMFtupvfCQHpnL86oL9zmNO1vpbemYm9AI6vRF35Y=; b=fCgaHbuTBEAyiwt6/uzuZAG42i
	pAFqPZ+KgtplHIH4VjtVgTZwCaFdEHPEGtDJC8beZ+vzHdb0oFEVRZdyiMKsJFpn+8zPFpE9KX6XY
	7A6qy0ADPrJwUU+p/tN3bHu2Xmo/itAMAdrhiOsDfSC1ekywueKFZPuCWj0JtOKLIsTVxWYqTZYXI
	ffl5hXG3/q9vmy47dK2hZLUEOB2hXicpNWWdU+Q5SRtl4lytl1hNMekDih6YF9MwNumzyE2rClVio
	VSaYoOLO2klT1XfJo0IVKj+hKzVV2EyDEGFCFoW7Ml9rGz55BN4tHqbSmIWEJpdgg1/+qYekFlhVS
	z0TKUR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfr1-0000000C5hi-3eQM;
	Mon, 06 Jul 2026 09:43:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfqz-0000000C5go-2w5X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:43:07 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowACHK9SmeEtq3sfxBA--.35165S2;
	Mon, 06 Jul 2026 17:43:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: IORT: validate RMR node array bounds
Date: Mon,  6 Jul 2026 17:43:00 +0800
Message-ID: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHK9SmeEtq3sfxBA--.35165S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF48tFWDtrW5GFy5ur1xKrg_yoWrZrWUpr
	4DGFW5ZrZ3JF17Gr1IyFZ5Aa13Zw48GrW7WrWF9a9YyFsYkr9xAF4j9r9I9F1rJFykuw48
	CF1YvFyUCFWDZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_024306_104192_EAECE863 
X-CRM114-Status: GOOD (  13.62  )
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

IORT RMR nodes describe reserved-memory ranges through firmware
offset and count fields inside the current IORT node.

Validate the generic IORT node length before dispatching it, and
check both the RMR descriptor array and the ID mapping array before
walking them.  This binds each array walk to the current node length
instead of only trusting the firmware-provided count.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/arm64/iort.c | 83 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index af7a9b2fd5bc..55373246bdd4 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -15,6 +15,7 @@
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -148,6 +149,69 @@ typedef acpi_status (*iort_find_node_callback)
 /* Root pointer to the mapped IORT table */
 static struct acpi_table_header *iort_table;
 
+static bool iort_node_valid(struct acpi_iort_node *node,
+			    struct acpi_iort_node *end)
+{
+	size_t remaining;
+
+	if (WARN_TAINT(node >= end, TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node pointer overflows, bad table!\n"))
+		return false;
+
+	remaining = (char *)end - (char *)node;
+	if (WARN_TAINT(remaining < sizeof(*node), TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node header is truncated, bad table!\n"))
+		return false;
+
+	if (WARN_TAINT(node->length < sizeof(*node) || node->length > remaining,
+		       TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node length overflows, bad table!\n"))
+		return false;
+
+	return true;
+}
+
+static bool iort_node_array_valid(struct acpi_iort_node *node, u32 offset,
+				  u32 count, size_t elem_size,
+				  size_t min_offset, const char *name)
+{
+	size_t bytes;
+
+	if (!count)
+		return true;
+
+	if (!offset || offset < min_offset || offset > node->length) {
+		pr_err(FW_BUG "Invalid %s offset in IORT node %p\n", name,
+		       node);
+		return false;
+	}
+
+	if (check_mul_overflow(count, elem_size, &bytes) ||
+	    bytes > node->length - offset) {
+		pr_err(FW_BUG "Invalid %s array in IORT node %p\n", name,
+		       node);
+		return false;
+	}
+
+	return true;
+}
+
+static bool iort_rmr_node_valid(struct acpi_iort_node *node)
+{
+	struct acpi_iort_rmr *rmr;
+
+	if (node->length < sizeof(*node) + sizeof(*rmr)) {
+		pr_err(FW_BUG "Truncated RMR node in IORT table\n");
+		return false;
+	}
+
+	rmr = (struct acpi_iort_rmr *)node->node_data;
+	return iort_node_array_valid(node, rmr->rmr_offset, rmr->rmr_count,
+				     sizeof(struct acpi_iort_rmr_desc),
+				     sizeof(*node) + sizeof(*rmr),
+				     "RMR descriptor");
+}
+
 static LIST_HEAD(iort_msi_chip_list);
 static DEFINE_SPINLOCK(iort_msi_chip_lock);
 
@@ -243,8 +307,7 @@ static struct acpi_iort_node *iort_scan_node(enum acpi_iort_node_type type,
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
-			       "IORT node pointer overflows, bad table!\n"))
+		if (!iort_node_valid(iort_node, iort_end))
 			return NULL;
 
 		if (iort_node->type == type &&
@@ -1014,6 +1077,9 @@ static void iort_get_rmrs(struct acpi_iort_node *node,
 	struct acpi_iort_rmr_desc *rmr_desc;
 	int i;
 
+	if (!iort_rmr_node_valid(node))
+		return;
+
 	rmr_desc = ACPI_ADD_PTR(struct acpi_iort_rmr_desc, node,
 				rmr->rmr_offset);
 
@@ -1114,6 +1180,16 @@ static void iort_node_get_rmr_info(struct acpi_iort_node *node,
 		return;
 	}
 
+	if (!iort_node_array_valid(node, node->mapping_offset,
+				   node->mapping_count,
+				   sizeof(struct acpi_iort_id_mapping),
+				   sizeof(*node),
+				   "ID mapping"))
+		return;
+
+	if (!iort_rmr_node_valid(node))
+		return;
+
 	rmr = (struct acpi_iort_rmr *)node->node_data;
 	if (!rmr->rmr_offset || !rmr->rmr_count)
 		return;
@@ -1175,8 +1251,7 @@ static void iort_find_rmrs(struct acpi_iort_node *iommu, struct device *dev,
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
-			       "IORT node pointer overflows, bad table!\n"))
+		if (!iort_node_valid(iort_node, iort_end))
 			return;
 
 		if (iort_node->type == ACPI_IORT_NODE_RMR)
-- 
2.43.0


