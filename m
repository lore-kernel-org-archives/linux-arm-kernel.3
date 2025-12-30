Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16BEE9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7zA4bj99mmbnOBt+U5nrkhsyiAdLRtWdPVGunDE38o=; b=1UCrFflrRfy8wm407m1QYqp6Cl
	cD9XgcyTbXbsU5jNo0O3kXOD1BYFXvoWE3KrwuPbuvKJbvDHF1GPQLIizZ3vrQzD/2L3XkRmdh8r2
	36IQ8ZdkNyrTlyTGDgZnrCfHFZkVrPJ0573xCSzvAz6R1FhdBVBe/9F/J2b+DiT2zY43zeSH1BEac
	fEa/r2aF4vRImEy9+dBZY0vv0T2XcejpBIHSNIioEPSTGAMtGMMUlK+iKH5P7UBWKlwywQiRjjab0
	ROulgE5tvRDwxOc/XsOKuJe68flDzyTzlxThFTNAbqQk0Dp+waQThylorDbTGc5zqjBJJgLZgX7Bf
	X6tCcjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVk2-00000004dBo-27w6;
	Tue, 30 Dec 2025 09:10:10 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVjs-00000004d7g-3vgY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767085799; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=j7zA4bj99mmbnOBt+U5nrkhsyiAdLRtWdPVGunDE38o=;
	b=BeLrZX0HLZ/GHh1A6ewfLE1/lr7VZ9A9paNb0k5FpIf56tiTSnMLLkVILYffjyCKiw2dsfbOiwHNSUca5TC7Xf0ZYdzX1XkZgSSdz5+dcmB/Yq2O3aDnhLavz8CXx9HZ2cvrumg55PXFO1EV4xQqXo21lBOyOlGXK2Lp+b8PBxA=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzV9WB_1767085797 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:09:58 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v5 03/17] ras: AEST: support different group format
Date: Tue, 30 Dec 2025 17:09:31 +0800
Message-Id: <20251230090945.43969-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011001_274207_4323A8EB 
X-CRM114-Status: GOOD (  10.27  )
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

Support for various AEST group formats allows for flexible configuration of
AEST node address space sizes and maximum record counts per group.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/aest/aest-core.c |  6 ++++--
 drivers/ras/aest/aest.h      | 39 +++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index c7ef6c13fd44..acebb293ac75 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -84,7 +84,7 @@ static int aest_node_set_errgsr(struct aest_device *adev,
 		return 0;
 
 	if (!(anode->interface_hdr->flags & AEST_XFACE_FLAG_ERROR_GROUP)) {
-		node->errgsr = node->base + ERXGROUP;
+		node->errgsr = node->base + node->group->errgsr_offset;
 		return 0;
 	}
 
@@ -112,10 +112,12 @@ static int aest_init_node(struct aest_device *adev, struct aest_node *node,
 		return -ENOMEM;
 	node->record_implemented = anode->record_implemented;
 	node->status_reporting = anode->status_reporting;
+	node->group = &aest_group_config[anode->interface_hdr->group_format];
 
 	address = anode->interface_hdr->address;
 	if (address) {
-		node->base = devm_ioremap(adev->dev, address, PAGE_SIZE);
+		node->base =
+			devm_ioremap(adev->dev, address, node->group->size);
 		if (!node->base)
 			return -ENOMEM;
 	}
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index d918240c3f57..3250675e99b7 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -37,7 +37,15 @@
 	dev_dbg((__record)->node->adev->dev, "%s: %s: " format, \
 		(__record)->node->name, (__record)->name, ##__VA_ARGS__)
 
-#define ERXGROUP 0xE00
+#define ERXGROUP_4K_OFFSET 0xE00
+#define ERXGROUP_16K_OFFSET 0x3800
+#define ERXGROUP_64K_OFFSET 0xE000
+#define ERXGROUP_4K_SIZE (4 * KB)
+#define ERXGROUP_16K_SIZE (16 * KB)
+#define ERXGROUP_64K_SIZE (64 * KB)
+#define ERXGROUP_4K_ERRGSR_NUM 1
+#define ERXGROUP_16K_ERRGSR_NUM 4
+#define ERXGROUP_64K_ERRGSR_NUM 14
 
 struct aest_record {
 	char *name;
@@ -57,6 +65,34 @@ struct aest_record {
 	struct aest_node *node;
 };
 
+struct aest_group {
+	int type;
+	int errgsr_num;
+	size_t size;
+	u64 errgsr_offset;
+};
+
+static const struct aest_group aest_group_config[] = {
+	[ACPI_AEST_NODE_GROUP_FORMAT_4K] = {
+		.type = ACPI_AEST_NODE_GROUP_FORMAT_4K,
+		.errgsr_num = ERXGROUP_4K_ERRGSR_NUM,
+		.size = ERXGROUP_4K_SIZE,
+		.errgsr_offset = ERXGROUP_4K_OFFSET,
+	},
+	[ACPI_AEST_NODE_GROUP_FORMAT_16K] = {
+		.type = ACPI_AEST_NODE_GROUP_FORMAT_16K,
+		.errgsr_num = ERXGROUP_16K_ERRGSR_NUM,
+		.size = ERXGROUP_16K_SIZE,
+		.errgsr_offset = ERXGROUP_16K_OFFSET,
+	},
+	[ACPI_AEST_NODE_GROUP_FORMAT_64K] = {
+		.type = ACPI_AEST_NODE_GROUP_FORMAT_64K,
+		.errgsr_num = ERXGROUP_64K_ERRGSR_NUM,
+		.size = ERXGROUP_64K_SIZE,
+		.errgsr_offset = ERXGROUP_64K_OFFSET,
+	},
+};
+
 struct aest_node {
 	char *name;
 	u8 type;
@@ -86,6 +122,7 @@ struct aest_node {
 	 */
 	unsigned long *status_reporting;
 
+	const struct aest_group *group;
 	struct aest_device *adev;
 	struct acpi_aest_node *info;
 
-- 
2.47.3


