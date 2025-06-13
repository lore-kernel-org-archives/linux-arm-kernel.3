Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02BFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DlYsp6UIBFOvfA2oPMijZlYucoULosd88iJAmPGMPs=; b=TZ5jOqU3KDmHiOavz5a8LnQwVL
	q5vXxSyvHwgcKioRGPueCKM22Adks+2mXuIQDu/gKQJ3V86WaoEkbQO6bdwPfydh0vztuIG1CeqxR
	KT9Hj+vFxjetYvHXY0jLS9Ww7xXhVnsQ3vi9OX4wBDcWGqx5SyRYAXCcN3dmnwr6d9snYqu7OQVPX
	iE9jFjLaL+tipdxbh2HD81IDT9DpsVvyqAwUbB4MtZuPnwgx/zbOOTbssCzbE4Kcm8xWMNqrNDZXa
	wvd785dWoCVkG7UmXCbvjqhZG3QAos/YKCN4zYZPx6w6ob1KjrU0v3ugaWiJplRte1leINy9XNdFZ
	ne1nkLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4G4-0000000GTDG-28Ux;
	Fri, 13 Jun 2025 13:15:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ44w-0000000GRvx-2qXj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:04:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93551C0A;
	Fri, 13 Jun 2025 06:03:57 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 260943F59E;
	Fri, 13 Jun 2025 06:04:17 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id from a device_node
Date: Fri, 13 Jun 2025 13:03:55 +0000
Message-Id: <20250613130356.8080-5-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060418_760431_F9BCC9B8 
X-CRM114-Status: GOOD (  13.95  )
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

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until the corresponding CPU comes online.

Expose the code that generates the cache-id. This allows the MPAM
driver to determine the properties of the caches without waiting
for all CPUs to come online.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/base/cacheinfo.c  | 15 +++++++++++----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index d8e5b4c7156c..6316d80abab8 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+unsigned long cache_of_get_id(struct device_node *np)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0UL;
 		}
 		while (1) {
 			if (!cache_node)
@@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		}
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+{
+	unsigned long id = cache_of_get_id(np);
+
+	if (id != ~0UL) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index c8f4f0a0b874..9c959caf8af8 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+unsigned long cache_of_get_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at
-- 
2.39.5


