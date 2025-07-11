Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED52C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RggpFjZcK0iSnEkBOLQk6M0bGUJF8RIrVvdd0TZfH+U=; b=eq52HSWeCmw+4xro9uTLxcFszC
	DQRr8uH3RvDfE5hx3sLWv8ur3FcsASNyVbFdNZSoSgSE278CfrS5ybdLANKM1IZVAyyf8BvUvQQnk
	KxO1hR1WrY86l7cihcHyOsKY7giWWL6kZeKB8uRbiwJuaRmGJcS9SjheYHp8DPWjAIWocMVCSKhH2
	nk+eu7KZDOPF2JTQTaae4sZIu2KZpeygUgeLt35HPrTde67G5HLV3n/k61aTUF0pDiScmkd61yK4h
	YPK40wIM8oVxNMTyuh0B3743zm4NWFanm0JNZuQyeOVO6/qPXKEB3ED13PlUDovbUsBxXC1eE9t4J
	D/ZKE1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIYR-0000000FWD6-1aPv;
	Fri, 11 Jul 2025 18:33:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaITZ-0000000FVSE-2wrY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:28:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D65942247;
	Fri, 11 Jul 2025 11:27:50 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF1C3F694;
	Fri, 11 Jul 2025 11:27:59 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 1/3] cacheinfo: Set cache 'id' based on DT data
Date: Fri, 11 Jul 2025 18:27:41 +0000
Message-Id: <20250711182743.30141-2-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711182743.30141-1-james.morse@arm.com>
References: <20250711182743.30141-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_112801_878814_9F8E171A 
X-CRM114-Status: GOOD (  17.59  )
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

From: Rob Herring <robh@kernel.org>

Use the minimum CPU h/w id of the CPUs associated with the cache for the
cache 'id'. This will provide a stable id value for a given system. As
we need to check all possible CPUs, we can't use the shared_cpu_map
which is just online CPUs. As there's not a cache to CPUs mapping in DT,
we have to walk all CPU nodes and then walk cache levels.

The cache_id exposed to user-space has historically been 32 bits, and
is too late to change. This value is parsed into a u32 by user-space
libraries such as libvirt:
https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588

Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
is found.

match_cache_node() does not make use of the __free() cleanup helpers
because of_find_next_cache_node(prev) does not drop a reference to prev,
and its too easy to accidentally drop the reference on cpu, which belongs
to for_each_of_cpu_node().

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
[ ben: converted to use the __free cleanup idiom ]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
[ morse: Add checks to give up if a value larger than 32 bits is seen. ]
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Use as a 32bit value has also been seen in DPDK patches here:
http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/

Changes since v2:
 * Removed broken use of cleanup in the match helper

Changes since v1:
 * Remove the second loop in favour of a helper.
---
 drivers/base/cacheinfo.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index cf0d455209d7..4e2f60c85e74 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cacheinfo.h>
 #include <linux/compiler.h>
@@ -183,6 +184,49 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+static bool match_cache_node(struct device_node *cpu,
+			     const struct device_node *cache_node)
+{
+	struct device_node *prev, *cache = of_find_next_cache_node(cpu);
+
+	while (cache) {
+		if (cache == cache_node) {
+			of_node_put(cache);
+			return true;
+		}
+
+		prev = cache;
+		cache = of_find_next_cache_node(cache);
+		of_node_put(prev);
+	}
+
+	return false;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	struct device_node *cpu;
+	u32 min_id = ~0;
+
+	for_each_of_cpu_node(cpu) {
+		u64 id = of_get_cpu_hwid(cpu, 0);
+
+		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
+			of_node_put(cpu);
+			return;
+		}
+
+		if (match_cache_node(cpu, cache_node))
+			min_id = min(min_id, id);
+	}
+
+	if (min_id != ~0) {
+		this_leaf->id = min_id;
+		this_leaf->attributes |= CACHE_ID;
+	}
+}
+
 static void cache_of_set_props(struct cacheinfo *this_leaf,
 			       struct device_node *np)
 {
@@ -198,6 +242,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
+	cache_of_set_id(this_leaf, np);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
-- 
2.39.5


