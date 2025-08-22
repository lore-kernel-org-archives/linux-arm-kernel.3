Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78DACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdjTMqimK4Jl6dDWiSdRAg+ZQbWNUxLc5x7ipzLpOKA=; b=QV0YFK/chtE1OVJMEuF81CUvjx
	OOC5yrnkRB6rNekcxpum0NSavxGIrjFdUvvYk+vF4JKcBr6swIwPAAIxeelr4hzl0rNr6Ic2tCLdO
	UP/ZLEnsuhX3pVkmrUIiswN3fndvVTIKHg6GEUDRMzI7hVHPSfpIZ2Zsts9CQrJmxO/D9KFp8EdPX
	CUgzG62iXLsFktbeBvttWzJ8lttdH1oZxKAVyxPQqZkSdzgXaMwd65UMuW5jnJnDnB/7s9LQaN/rX
	+8Zy0GfYiQlW1kVgh6mOKjHW/lRlfs8JddpjEYwAoE40eJrk74djbYAvQYjQu+kun+skb70lgsLBO
	uayp1GrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphss-000000048pN-2H2U;
	Sat, 23 Aug 2025 06:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnZ-000000033n0-14NK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tdjTMqimK4Jl6dDWiSdRAg+ZQbWNUxLc5x7ipzLpOKA=; b=Mj8GJ5Q22il/FegLl0accgt1vZ
	SBEuKNlLY5Wz5v3GP69izsKyki121nWDRA5el5NXqsJEH6orBQ36w7aStD4UxQKP03qlG61BCRZ99
	fXQnPnfzUqdIvAbeB7dtSqZP7g54yGueFdlwzVgmJfNhKQ2DnN98k8am1rRF8Vh0/AqLItBQ00jTN
	JdX7ODHT/OuUuLvN217C2HhET6SJoItNr2Doj9tN74JjKtODZ9wqj7CilkTII1tEosX1wuThy8iHV
	tmUFARf7scsAGRdRb0tKPZ6Fxp8GkIPdGiST5Jk66Bp4cxTIXh3WsKqHwD41wEuLRgt+ICQMn3JNB
	xIvpc4Ag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnV-00000000yrS-1tD0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:35:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E582880;
	Fri, 22 Aug 2025 08:35:12 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C52F63F63F;
	Fri, 22 Aug 2025 08:35:14 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
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
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 11/33] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Fri, 22 Aug 2025 15:30:26 +0000
Message-Id: <20250822153048.2287-46-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163521_987152_7EC56BB2 
X-CRM114-Status: GOOD (  16.03  )
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
 drivers/resctrl/mpam_devices.c | 67 ++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a0d9a699a6e7..71a1fb1a9c75 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -62,41 +62,63 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
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
2.20.1


