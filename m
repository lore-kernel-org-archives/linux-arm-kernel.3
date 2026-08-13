Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20690C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CcnZ2KFgh7hkbDfH6sn+2MKaA4mEkDbq8zL1Hsfs7M=; b=VAS5pyVLT4ItxwAxbExJDAu+MQ
	OBBg5ILcXZ7Hut0k6PApwbKrZJ0ofkszmVL9hNkceCzjSSeOQ7m3WDGt0ifnJhK+lZL3OBEA/0hEF
	pDCqyLoU/rbz25QSaXkTiEHqqq/GYWjjcrQiElWnCf1WKz6rIl1zoRoQ5AN7YVWrk9/gzGkPA3HlI
	sLrb3MLVcxncFAKLiVZtwnIkgPWF/US3VcLiAF+enVZOp4hZulNeSOh2mjGCtjP1WhgOU/bLdyW8A
	35ww1UbyuRsiW65bZiC/pzAu/CQsKFXbY6efnVjkiZ6Rb1A9sKTSxylgHYpxkbM8flly1NnvKyx5E
	KNdtXgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXwB-000000016mw-1wgi;
	Thu, 13 Aug 2026 16:05:47 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXw8-000000016lc-4BPt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:05:46 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAX7O9V631qIEh7BQ--.56475S2;
	Fri, 14 Aug 2026 00:05:41 +0800 (CST)
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
Subject: [PATCH v2 2/2] ACPI: IORT: validate RMR node array extents
Date: Fri, 14 Aug 2026 00:05:40 +0800
Message-ID: <20260813160540.72395-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813160118.69153-1-pengpeng@iscas.ac.cn>
References: <20260813160118.69153-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAX7O9V631qIEh7BQ--.56475S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UGF15uFWkZF4xGrW7urg_yoW5CFykpF
	4DGry5Aws5JF12grWSv3Z5AFWYqw1kGrWakrZa93yqyFn0yrnIya109FyY9F15JFW8ua1x
	Krs8tFW7CF1DZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_090545_407456_DBA20F3C 
X-CRM114-Status: GOOD (  11.87  )
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

IORT RMR nodes carry offsets and counts for reserved-memory descriptors and
ID mappings.  iort_node_get_rmr_info() trusts both arrays and later loops
over the firmware counts without proving that either array fits in the
containing node.

Require the fixed RMR payload, then validate each non-empty array with
checked multiplication and subtraction-based bounds before constructing
an element pointer.  Keep the helpers under CONFIG_IOMMU_API with their
users.

Fixes: 491cf4a6735a ("ACPI/IORT: Add support to retrieve IORT RMR reserved regions")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/acpi/arm64/iort.c | 53 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 101d54eec544..17d904f4c1ee 100644
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
@@ -962,6 +963,48 @@ void acpi_configure_pmsi_domain(struct device *dev)
 }
 
 #ifdef CONFIG_IOMMU_API
+static bool iort_node_array_valid(struct acpi_iort_node *node, u32 offset,
+				  u32 count, size_t elem_size,
+				  size_t min_offset, const char *name)
+{
+	size_t bytes;
+
+	/* An empty array has no elements to access, regardless of its offset. */
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
 static void iort_rmr_free(struct device *dev,
 			  struct iommu_resv_region *region)
 {
@@ -1152,12 +1195,22 @@ static void iort_node_get_rmr_info(struct acpi_iort_node *node,
 	u32 num_sids = 0;
 	int i;
 
+	if (!iort_rmr_node_valid(node))
+		return;
+
 	if (!node->mapping_offset || !node->mapping_count) {
 		pr_err(FW_BUG "Invalid ID mapping, skipping RMR node %p\n",
 		       node);
 		return;
 	}
 
+	if (!iort_node_array_valid(node, node->mapping_offset,
+				   node->mapping_count,
+				   sizeof(struct acpi_iort_id_mapping),
+				   sizeof(*node) + sizeof(*rmr),
+				   "ID mapping"))
+		return;
+
 	rmr = (struct acpi_iort_rmr *)node->node_data;
 	if (!rmr->rmr_offset || !rmr->rmr_count)
 		return;
-- 
2.50.1 (Apple Git-155)


