Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg6PLEz+5Arp2ZELrll4JGMVpEDGQDluE5LIoH1ioW4=; b=rht53EuwE3uYa1jjPIR0yPBbU/
	YHl8/QdewWOT8sltyhOaX96xP8cihTrEdebzYV1PQMe6V+uqghLpNXLm2fYe4I2LCZ5hEi/BfOFMt
	mNBT3ayZGhKqIo9JcZTJap4WuvqXA3QUR5H+nqpYbzWhMTFP5CEICrieNFjV3YWT/tZs89Khv9L4p
	Q/pIVp5Y6rZYWWbU2wKF06gw+cVhFwkRqkL9or9O8gpE0DWjGqkXGbWDYEEPH3gtvkhZRjaR4jkmE
	WiIXsT/v94PlocCroXPS2ocJ3THsOMQt9pO/q1Zdk1JjEjdHqVe3H81RgyesUFK3KXWRHbZ3l0qmW
	UEyPO/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJGX-0000000Fcqu-1AhN;
	Fri, 11 Jul 2025 19:18:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaId4-0000000FXEG-3mH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CEFD16F8;
	Fri, 11 Jul 2025 11:37:39 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE0033F694;
	Fri, 11 Jul 2025 11:37:46 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 14/36] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Fri, 11 Jul 2025 18:36:26 +0000
Message-Id: <20250711183648.30766-15-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113751_027856_A75813A3 
X-CRM114-Status: GOOD (  15.19  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

The device-tree binding has two examples for MSC associated with
memory controllers. Add the support to discover the component_id
from the device-tree and create 'memory' RIS.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c | 67 +++++++++++++++-------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 5b886ba54ba8..f5abd5f0d41a 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -60,41 +60,63 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u32 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	unsigned long cache_id;
-	struct device_node *cache;
+	u32 class_id = 0, component_id = 0;
+	struct device_node *cache = NULL, *memory = NULL;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 
 	do {
+		/* What kind of MSC is this? */
 		if (of_device_is_compatible(np, "arm,mpam-cache")) {
 			cache = of_parse_phandle(np, "arm,mpam-device", 0);
 			if (!cache) {
 				pr_err("Failed to read phandle\n");
 				break;
 			}
+			type = MPAM_CLASS_CACHE;
 		} else if (of_device_is_compatible(np->parent, "cache")) {
 			cache = of_node_get(np->parent);
+			type = MPAM_CLASS_CACHE;
+		} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+			memory = of_parse_phandle(np, "arm,mpam-device", 0);
+			if (!memory) {
+				pr_err("Failed to read phandle\n");
+				break;
+			}
+			type = MPAM_CLASS_MEMORY;
+		} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+			memory = of_node_get(np->parent);
+			type = MPAM_CLASS_MEMORY;
 		} else {
-			/* For now, only caches are supported */
-			cache = NULL;
+			/*
+			 * For now, only caches and memory controllers are
+			 * supported.
+			 */
 			break;
 		}
 
-		err = of_property_read_u32(cache, "cache-level", &level);
-		if (err) {
-			pr_err("Failed to read cache-level\n");
-			break;
-		}
-
-		cache_id = cache_of_calculate_id(cache);
-		if (cache_id == ~0UL) {
-			err = -ENOENT;
-			break;
+		/* Determine the class and component ids, based on type. */
+		if (type == MPAM_CLASS_CACHE) {
+			err = of_property_read_u32(cache, "cache-level", &class_id);
+			if (err) {
+				pr_err("Failed to read cache-level\n");
+				break;
+			}
+			component_id = cache_of_calculate_id(cache);
+			if (component_id == ~0UL) {
+				err = -ENOENT;
+				break;
+			}
+		} else if (type == MPAM_CLASS_MEMORY) {
+			err = of_node_to_nid(np);
+			component_id = (err == NUMA_NO_NODE) ? 0 : err;
+			class_id = 255;
 		}
 
-		err = mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level,
-				      cache_id);
+		err = mpam_ris_create(msc, ris_idx, type, class_id,
+				      component_id);
 	} while (0);
 	of_node_put(cache);
+	of_node_put(memory);
 
 	return err;
 }
@@ -157,9 +179,14 @@ static int update_msc_accessibility(struct mpam_msc *msc)
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		err = 0;
 	} else {
-		err = -EINVAL;
-		pr_err("Cannot determine accessibility of MSC: %s\n",
-		       dev_name(&msc->pdev->dev));
+		if (of_device_is_compatible(parent, "memory")) {
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+			err = 0;
+		} else {
+			err = -EINVAL;
+			pr_err("Cannot determine accessibility of MSC: %s\n",
+			       dev_name(&msc->pdev->dev));
+		}
 	}
 	of_node_put(parent);
 
-- 
2.39.5


