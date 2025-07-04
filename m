Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797F9C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2CLIE62cvvuI4cjtYfhjCQW40Z+m8ASICO/a9oG6Dg=; b=u0xA4tlc2qnz41vK6K1pu/gPjo
	bwtIm8oSONSCJtY/yCwmB+Sxsuu6vpU956gCv6sDIgAw9GtKb7QFx8RsF/ov3U8hMQKpbrBZLSk8J
	FHBTz/p5muhi7y9qsxAh58hA55OVxgjs64aXQ1DjgxwFqgtxABx/2o29odDBa5wa9d50FeCYxEoeG
	Im/7oePsFDVqR+mhjfIfiVjhdeGqIhNJRV6vJEfWqYMMAW1WqguFQDGzlMWTOyhHJWlI9AlXff/Ap
	mgH2G7YnLzCSsFabrIoVossx6slKwhyXjUTqeHZ1NNJrcJd9wAYU5bx8Gu03n+X/DsdXcvPwdAMlU
	p2GmFNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSS-0000000F88V-1bt7;
	Fri, 04 Jul 2025 17:44:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkNA-0000000F76q-151p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:38:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D83652A31;
	Fri,  4 Jul 2025 10:38:37 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0A23F66E;
	Fri,  4 Jul 2025 10:38:50 -0700 (PDT)
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
	WillDeaconwill@kernel.org,
	James Morse <james.morse@arm.com>
Subject: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Date: Fri,  4 Jul 2025 17:38:24 +0000
Message-Id: <20250704173826.13025-2-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250704173826.13025-1-james.morse@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103852_426081_4F182BD9 
X-CRM114-Status: GOOD (  20.01  )
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

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
[ ben: converted to use the __free cleanup idiom ]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
[ morse: Add checks to give up if a value larger than 32 bits is seen. ]
Signed-off-by: James Morse <james.morse@arm.com>
---
Use as a 32bit value has also been seen in DPDK patches here:
http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/

Changes since v1:
 * Remove the second loop in favour of a helper.
 
An open question from v1 is whether it would be preferable to use an
index into the DT of the CPU nodes instead of the hardware id. This would
save an arch specific swizzle - but the numbers would change if the DT
were changed. This scheme isn't sensitive to the order of DT nodes.

---
 drivers/base/cacheinfo.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index cf0d455209d7..df593da0d5f7 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cacheinfo.h>
 #include <linux/compiler.h>
@@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+static bool match_cache_node(struct device_node *cpu,
+			     const struct device_node *cache_node)
+{
+	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);
+	     cache != NULL; cache = of_find_next_cache_node(cache)) {
+		if (cache == cache_node)
+			return true;
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
@@ -198,6 +235,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
+	cache_of_set_id(this_leaf, np);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
-- 
2.39.5


