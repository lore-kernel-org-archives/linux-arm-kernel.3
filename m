Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66565C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+KkYD/Ox92eRJfShRIC9MfL8k5aX+CWhvwDQxXAzKQ=; b=izxhX47bOh33NryimWDKcU5621
	Z6iJ+wvTZivjzTZ4C8jWe1uQwnd/L+PrmJ8xW1xxyotJZqEIMBq7K1buk100dyzMGA9vHDiPrVy4o
	/7JWWdf1qhy5SdhPMfyQUe3dhcy5brJbjPjMQdchkMN8rJn/xQppsPk+cwckHj6FXPYfh+40yziHH
	+dnPTdYwC/4gJu3cfuZjornj97i1AWKOjk5iRTpU5/ok513r/D+bn4RftXXBaDANT+AGtog6tyURQ
	8i7sz3LEfjipi4wxduH8eA4rx34tA82oeMG5GMLgmP67h+zHihPRKKttwI0OyDr3fet/JN/5Wn8rr
	gDsfWS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXug-000000016WJ-006x;
	Thu, 13 Aug 2026 16:04:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXuc-000000016VL-2Nt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:04:12 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowABnPfH26n1qtTJ7BQ--.24293S2;
	Fri, 14 Aug 2026 00:04:06 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Joerg Roedel <jroedel@suse.de>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 1/2] ACPI: IORT: validate table and node extents before traversal
Date: Fri, 14 Aug 2026 00:04:06 +0800
Message-ID: <20260813160406.71911-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813160118.69153-1-pengpeng@iscas.ac.cn>
References: <20260813160118.69153-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnPfH26n1qtTJ7BQ--.24293S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrW8Gw13Kry8Wr13CFy5CFg_yoW7Xw13pr
	4DGFWYqrZ3JFsrW3yxtrZ5Cw45Aw4Ikr4UJr4rGayakwn5C345CFW2kr9I9F1rGF4kWw48
	ZF1Y9FyjkFWDAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUoq2MUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_090411_034655_7FD0F519 
X-CRM114-Status: GOOD (  14.96  )
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

IORT walkers construct the first node from firmware node_offset and then
read node fields after checking only whether the current pointer reached
the table end.  A bad root offset, truncated node header, or zero or
oversized node length can therefore escape the table or prevent progress.

Validate the root table and minimum node area before constructing the first
pointer.  Reuse a remaining-length check in each generic IORT node walk so
every advertised node is contained before its fields are consumed.

Fixes: 88ef16d888a0 ("ACPI: I/O Remapping Table (IORT) initial support")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/arm64/iort.c | 64 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index af7a9b2fd5bc..101d54eec544 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -148,6 +148,48 @@ typedef acpi_status (*iort_find_node_callback)
 /* Root pointer to the mapped IORT table */
 static struct acpi_table_header *iort_table;
 
+static bool iort_table_valid(struct acpi_table_iort *iort)
+{
+	size_t node_bytes;
+
+	if (!iort || iort->header.length < sizeof(*iort))
+		return false;
+
+	if (!iort->node_count)
+		return true;
+
+	if (iort->node_offset < sizeof(*iort) ||
+	    iort->node_offset > iort->header.length -
+				      sizeof(struct acpi_iort_node))
+		return false;
+
+	node_bytes = iort->header.length - iort->node_offset;
+	return iort->node_count <=
+		node_bytes / sizeof(struct acpi_iort_node);
+}
+
+static bool iort_node_valid(struct acpi_iort_node *node,
+			    struct acpi_iort_node *end)
+{
+	size_t remaining;
+
+	if (WARN_TAINT(node >= end, TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node pointer overflows, bad table!\n"))
+		return false;
+
+	remaining = (u8 *)end - (u8 *)node;
+	if (WARN_TAINT(remaining < sizeof(*node), TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node header is truncated, bad table!\n"))
+		return false;
+
+	if (WARN_TAINT(node->length < sizeof(*node) ||
+		       node->length > remaining, TAINT_FIRMWARE_WORKAROUND,
+		       "IORT node length overflows, bad table!\n"))
+		return false;
+
+	return true;
+}
+
 static LIST_HEAD(iort_msi_chip_list);
 static DEFINE_SPINLOCK(iort_msi_chip_lock);
 
@@ -237,14 +279,16 @@ static struct acpi_iort_node *iort_scan_node(enum acpi_iort_node_type type,
 
 	/* Get the first IORT node */
 	iort = (struct acpi_table_iort *)iort_table;
+	if (!iort_table_valid(iort) || !iort->node_count)
+		return NULL;
+
 	iort_node = ACPI_ADD_PTR(struct acpi_iort_node, iort,
 				 iort->node_offset);
 	iort_end = ACPI_ADD_PTR(struct acpi_iort_node, iort_table,
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
-			       "IORT node pointer overflows, bad table!\n"))
+		if (!iort_node_valid(iort_node, iort_end))
 			return NULL;
 
 		if (iort_node->type == type &&
@@ -1168,6 +1212,8 @@ static void iort_find_rmrs(struct acpi_iort_node *iommu, struct device *dev,
 		return;
 
 	iort = (struct acpi_table_iort *)iort_table;
+	if (!iort_table_valid(iort) || !iort->node_count)
+		return;
 
 	iort_node = ACPI_ADD_PTR(struct acpi_iort_node, iort,
 				 iort->node_offset);
@@ -1175,8 +1221,7 @@ static void iort_find_rmrs(struct acpi_iort_node *iommu, struct device *dev,
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (WARN_TAINT(iort_node >= iort_end, TAINT_FIRMWARE_WORKAROUND,
-			       "IORT node pointer overflows, bad table!\n"))
+		if (!iort_node_valid(iort_node, iort_end))
 			return;
 
 		if (iort_node->type == ACPI_IORT_NODE_RMR)
@@ -2054,6 +2099,8 @@ static void __init iort_init_platform_devices(void)
 	 * have different struct types
 	 */
 	iort = (struct acpi_table_iort *)iort_table;
+	if (!iort_table_valid(iort) || !iort->node_count)
+		return;
 
 	/* Get the first IORT node */
 	iort_node = ACPI_ADD_PTR(struct acpi_iort_node, iort,
@@ -2062,10 +2109,8 @@ static void __init iort_init_platform_devices(void)
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (iort_node >= iort_end) {
-			pr_err("iort node pointer overflows, bad table\n");
+		if (!iort_node_valid(iort_node, iort_end))
 			return;
-		}
 
 		iort_enable_acs(iort_node);
 
@@ -2132,12 +2177,14 @@ phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
 				(struct acpi_table_header **)&iort);
 	if (ACPI_FAILURE(status))
 		return limit;
+	if (!iort_table_valid(iort) || !iort->node_count)
+		goto out;
 
 	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
 	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
 
 	for (i = 0; i < iort->node_count; i++) {
-		if (node >= end)
+		if (!iort_node_valid(node, end))
 			break;
 
 		switch (node->type) {
@@ -2162,6 +2209,7 @@ phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
 		}
 		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
 	}
+out:
 	acpi_put_table(&iort->header);
 	return limit;
 }
-- 
2.50.1 (Apple Git-155)


