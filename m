Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C972C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1rw5GBUBkzSIzZPHHtIy1mOR8NctFkTES6RYONb95M=; b=qV2RbnJoZL1sFvjvHbSfHtTw4R
	si72rpIfqLWGYbBO2RkshCB1lnNBcSbBsYSosSZWAb/tAPVGD215lZq2rMD3cTyi2iL6SFMvRlyBd
	xEZxlO7hS13Knma8Z6bL41yPj7QZqjnXnfOlABbdZt3hp4uprkM3oZgnBZgWWX5Eumzd6FT0PhynN
	8MCRh/dLW3Liv8oyYpkC4r8BjbaOHMojzS6/sizd0r7tnVTS1ZmnP/k15OrS9CCygsY5hWIOjnBxr
	Bf3qw+ij7VR/XKFnKTOW0pMPLSLsd2fgzq+Iu9c1tP8jr5G14OMT8RusZSzcI1dE4suiQa19axYEV
	V5hAPfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLbJ-0000000Ez8W-3ixB;
	Fri, 24 Jan 2025 15:28:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLUF-0000000ExQT-2Kmm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:20:48 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YfhMS2KNSz6K9BR;
	Fri, 24 Jan 2025 23:20:20 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 28F9B140D1D;
	Fri, 24 Jan 2025 23:20:42 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.195.34.97) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 16:20:41 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@Huawei.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: [RFC PATCH v1 1/1] base/of/cacheinfo: support l1 entry in dt
Date: Fri, 24 Jan 2025 15:20:08 +0000
Message-ID: <20250124152008.313-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124152008.313-1-alireza.sanaee@huawei.com>
References: <20250124152008.313-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.34.97]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_072047_898640_341510FF 
X-CRM114-Status: GOOD (  14.17  )
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

This commit simply assumes that CPU node entries may point to a cache
node that basically act as a l1-cache and there are some CPU nodes
without describing any caches but a next-level-cache property that
points to l1-cache.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/cacheinfo.c | 54 +++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index cf0d455209d7..d119228fc392 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -83,7 +83,31 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
 
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
+	if (of_property_present(np, "cache-size")   ||
+	    of_property_present(np, "i-cache-size") ||
+	    of_property_present(np, "d-cache-size") ||
+	    of_property_present(np, "cache-unified"))
+		return true;
+
+	struct device_node *next __free(device_node) = of_find_next_cache_node(np);
+	if (next) {
+		return true;
+	}
+
+	return false;
+}
+
 
 /* OF properties to query for a given cache type */
 struct cache_type_info {
@@ -218,11 +242,23 @@ static int cache_setup_of_node(unsigned int cpu)
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
@@ -234,22 +270,6 @@ static int cache_setup_of_node(unsigned int cpu)
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


