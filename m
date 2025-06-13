Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4996C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2InSy95NP72BR1BMnDLk60nRe1EGntAhO7WHIo8dBM=; b=1BKk16iF19SyO/7eekJaxv/y9A
	Kdz5pqpTOi8Uq2YG9FCslVRrNEsG3HW5aJd8lJyZwXPwHBc+Y2IU/cTnFuIm375hgyamjsEkPK78P
	RUOAwS3NbvoIMgqrkk41LvI8EsA9/HgyenO1BA5TE+UekSZdGtnESj6diYaALBm+aPixy2G+ue8tl
	SysmP18F7lKa6jo7FYzD2TiaFUJhOjOWe88igTPL4reIMc/Bcv4uln5+tyzM+i3iyksMzn9XIgc/r
	VXyzGCWrhV1zF+3KqaU/7f2q27bXxjAocdxRRLkRDBVKM4SnKDChL/s7jCIUCDvtfbT4fBSSl6jyU
	mwjM/hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4Ba-0000000GSkT-3qgT;
	Fri, 13 Jun 2025 13:11:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ44t-0000000GRux-2G14
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:04:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3181C0A;
	Fri, 13 Jun 2025 06:03:54 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BA293F59E;
	Fri, 13 Jun 2025 06:04:13 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for cache-id
Date: Fri, 13 Jun 2025 13:03:53 +0000
Message-Id: <20250613130356.8080-3-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060415_619435_14049301 
X-CRM114-Status: GOOD (  13.73  )
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

Filesystems like resctrl use the cache-id exposed via sysfs to identify
groups of CPUs. The value is also used for PCIe cache steering tags. On
DT platforms cache-id is not something that is described in the
device-tree, but instead generated from the smallest CPU h/w id of the
CPUs associated with that cache.

CPU h/w ids may be larger than 32 bits.

Add a hook to allow architectures to compress the value from the devicetree
into 32 bits. Returning the same value is always safe as cache_of_set_id()
will stop if a value larger than 32 bits is seen.

For example, on arm64 the value is the MPIDR affinity register, which only
has 32 bits of affinity data, but spread across the 64 bit field. An
arch-specific bit swizzle gives a 32 bit value.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/base/cacheinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9888d87840a2..d8e5b4c7156c 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -184,6 +184,10 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+#ifndef arch_compact_of_hwid
+#define arch_compact_of_hwid(_x)	(_x)
+#endif
+
 static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 {
 	struct device_node *cpu;
@@ -193,6 +197,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
 		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
 		u64 id = of_get_cpu_hwid(cpu, 0);
 
+		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
 			return;
-- 
2.39.5


