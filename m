Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TSLZIPS/LUzGRMD/7aMOZP6xNZJpcFWeX5yA1vqUiI=; b=fJuRxNLvyAvpxGu8YemGx32grW
	TlE9apb/9xNmIm6xrZ1/TXaeW5/20rHdPUtPCZKQ0baneEMIMRRLDWkEE7cvay2nBFhSN7BZwVrQI
	S8ZXh/NvqgHnt2ThewXxhs7jVXmJMUrP8SORPsgMXDuLQ4HMbBJBRF4YxrJxQ/Dr8YkL7j40XTV2P
	pCcmmxrNCK2jY71STLnXpEGuj8pJj4N2DSXqTPeiB1fCPuzFWDJKK6srXBs+dNoWV3GnZrLEX4Ezc
	9Zq/CTh6k+YBqqzChI9tcv+UsDsxG6iiduxmXmEZDPnUXvBg+kgis5AxSRkdmUUUmMmll/qzmRBTC
	0dRLJ5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBIA-00000007QPT-0n6V;
	Wed, 29 Jan 2025 16:51:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBFu-00000007Pzh-2b87
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:49:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yjp5N4m01z6K976;
	Thu, 30 Jan 2025 00:48:56 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 10F5B1404FC;
	Thu, 30 Jan 2025 00:49:33 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.69.217) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 17:49:32 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@Huawei.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: [RFC PATCH v2 1/1] base/of/cacheinfo: support l1 entry in dt
Date: Wed, 29 Jan 2025 16:48:55 +0000
Message-ID: <20250129164855.676-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129164855.676-1-alireza.sanaee@huawei.com>
References: <20250129164855.676-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.69.217]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_084934_944484_281F90E3 
X-CRM114-Status: GOOD (  16.99  )
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

Existing device tree bindings do not properly describe caches shared
between SMT (Simultaneous Multithreading) threads.

For example, in a system with two CPU cores, each supporting two SMT
threads, current bindings treat each thread as an independent logical
CPU with its own L1 cache. However, in reality, these threads share
resources within a physical CPU, including caches. There are two ways to
do this, first using multiple reg entries (PowerPC) which all share the
same CPU core resources [1], which was turn down based on
discussions with Mark Rutland [2], because every node in the cpu-map should
point to a CPU node in the device tree. Second, to go with the proposed
method.

Allow CPU node entries to reference a shared L1 cache node. Some CPU
nodes may omit explicit cache descriptions and instead use a
next-level-cache property to point to the corresponding L1 cache node.

Link: https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com/ # [1]
Link: https://lore.kernel.org/linux-arm-kernel/Z4FYHvbVhMHrGQI4@J2N7QTR9R3/ # [2]

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/cacheinfo.c | 50 ++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index cf0d455209d7..71d92157591e 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -83,7 +83,27 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
 
 #ifdef CONFIG_OF
 
-static bool of_check_cache_nodes(struct device_node *np);
+static bool of_check_cache_node(struct device_node *np) {
+	if (of_property_present(np, "cache-size")   ||
+	    of_property_present(np, "i-cache-size") ||
+	    of_property_present(np, "d-cache-size") ||
+	    of_property_present(np, "cache-unified"))
+		return true;
+	return false;
+}
+
+static bool of_check_cache_nodes(struct device_node *np)
+{
+	if (of_check_cache_node(np))
+		return true;
+
+	struct device_node *next __free(device_node) = of_find_next_cache_node(np);
+	if (next)
+		return true;
+
+	return false;
+}
+
 
 /* OF properties to query for a given cache type */
 struct cache_type_info {
@@ -218,11 +238,23 @@ static int cache_setup_of_node(unsigned int cpu)
 	while (index < cache_leaves(cpu)) {
 		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
 		if (this_leaf->level != 1) {
+			/* Always go one level down for level > 1 */
 			struct device_node *prev __free(device_node) = np;
 			np = of_find_next_cache_node(np);
 			if (!np)
 				break;
+		} else {
+			/* For level 1, check compatibility */
+			if (!of_device_is_compatible(np, "cache") &&
+			    !of_check_cache_node(np)) {
+				struct device_node *prev __free(device_node) = np;
+				np = of_find_next_cache_node(np);
+				if (!np)
+					break;
+				continue; /* Skip to next index without processing */
+			}
 		}
+
 		cache_of_set_props(this_leaf, np);
 		this_leaf->fw_token = np;
 		index++;
@@ -234,22 +266,6 @@ static int cache_setup_of_node(unsigned int cpu)
 	return 0;
 }
 
-static bool of_check_cache_nodes(struct device_node *np)
-{
-	if (of_property_present(np, "cache-size")   ||
-	    of_property_present(np, "i-cache-size") ||
-	    of_property_present(np, "d-cache-size") ||
-	    of_property_present(np, "cache-unified"))
-		return true;
-
-	struct device_node *next __free(device_node) = of_find_next_cache_node(np);
-	if (next) {
-		return true;
-	}
-
-	return false;
-}
-
 static int of_count_cache_leaves(struct device_node *np)
 {
 	unsigned int leaves = 0;
-- 
2.34.1


