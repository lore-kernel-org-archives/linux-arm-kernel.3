Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F800C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lGaCGBJh5xg9bSOqbxQ1JgHMnR9nw466amDZpPIy5f4=; b=QRP7I/jvQDVwc3RegvHEc3qls6
	3njOVgej82qLmn3jWz9GNKPXt/xbNr0MIQ05ekbdT2ft6mxs7MnoqasEcSg/pTg1VGkcqF4ul+16T
	/XV4R9IG6riz9ssFT5sXdW/Wbts9wA93Jb0ENPD65Ycn1C7oPKqRoFmUafQtByfwrhhapol28CuNV
	beQoDv35c4iOILowuczXI2pRrU1mZlxBVhWdzUv/XhCU1na+sI7IFBmbO/h16MZB+BxBAaE7+K275
	2JJ9WyCCHplazboSs6yq7VWgBycxWdqi2ZY0qrEvA6s7bPCUarfLcpvEadjDrLrGdrn+h0LRkPAcn
	tq6POzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzE5o-00000000JbQ-3OdO;
	Mon, 31 Mar 2025 12:18:16 +0000
Received: from mail-m21473.qiye.163.com ([117.135.214.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzE3V-00000000JJw-1iEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:15:55 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 102faff97;
	Mon, 31 Mar 2025 20:15:43 +0800 (GMT+08:00)
From: HongBo Yao <andy.xu@hj-micro.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH v2] perf: arm-ni: Fix list_add() corruption in arm_ni_probe()
Date: Mon, 31 Mar 2025 20:15:36 +0800
Message-ID: <20250331121536.2626552-1-andy.xu@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkNIVh1LTUwdTEMdHh8ZQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a95ec210c3303afkunm102faff97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6URw*GDJRDxY8EBITEBU8
	ThVPFBNVSlVKTE9IT0lISE9PT0xPVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VKT0xVSk5DWVdZCAFZQU9OQ0k3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_051553_720519_7EEB9446 
X-CRM114-Status: GOOD (  14.04  )
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

From: Hongbo Yao <andy.xu@hj-micro.com>

When a resource allocation fails in one clock domain of an NI device,
we need to properly roll back all previously registered perf PMUs in
other clock domains of the same device.

Otherwise, it can lead to kernel panics.

Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
list_add corruption: next->prev should be prev (fffffd01e9698a18),
but was 0000000000000000. (next=ffff10001a0decc8).
pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : list_add_valid_or_report+0x7c/0xb8
lr : list_add_valid_or_report+0x7c/0xb8
Call trace:
 __list_add_valid_or_report+0x7c/0xb8
 perf_pmu_register+0x22c/0x3a0
 arm_ni_probe+0x554/0x70c [arm_ni]
 platform_probe+0x70/0xe8
 really_probe+0xc6/0x4d8
 driver_probe_device+0x48/0x170
 __driver_attach+0x8e/0x1c0
 bus_for_each_dev+0x64/0xf0
 driver_add+0x138/0x260
 bus_add_driver+0x68/0x138
 __platform_driver_register+0x2c/0x40
 arm_ni_init+0x14/0x2a [arm_ni]
 do_init_module+0x36/0x298
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops - BUG: Fatal exception
SMP: stopping secondary CPUs

Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
---
 drivers/perf/arm-ni.c | 44 +++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index fd7a5e60e963..ee85577e86b9 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -102,6 +102,7 @@ struct arm_ni_unit {
 struct arm_ni_cd {
 	void __iomem *pmu_base;
 	u16 id;
+	bool pmu_registered;
 	int num_units;
 	int irq;
 	int cpu;
@@ -571,10 +572,31 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	err = perf_pmu_register(&cd->pmu, name, -1);
 	if (err)
 		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
+	else
+		cd->pmu_registered = true;
 
 	return err;
 }
 
+static void arm_ni_remove_cds(struct arm_ni *ni)
+{
+	for (int i = 0; i < ni->num_cds; i++) {
+		struct arm_ni_cd *cd = ni->cds + i;
+
+		if (!cd->pmu_base)
+			continue;
+
+		if (!cd->pmu_registered)
+			continue;
+
+		writel_relaxed(0, cd->pmu_base + NI_PMCR);
+		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
+		perf_pmu_unregister(&cd->pmu);
+		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
+	}
+}
+
+
 static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
 {
 	u32 reg = readl_relaxed(base + NI_NODE_TYPE);
@@ -593,6 +615,7 @@ static int arm_ni_probe(struct platform_device *pdev)
 	void __iomem *base;
 	static atomic_t id;
 	int num_cds;
+	int ret;
 	u32 reg, part;
 
 	/*
@@ -651,35 +674,28 @@ static int arm_ni_probe(struct platform_device *pdev)
 			reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
 			arm_ni_probe_domain(base + reg, &pd);
 			for (int c = 0; c < pd.num_components; c++) {
-				int ret;
-
 				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
 				arm_ni_probe_domain(base + reg, &cd);
 				ret = arm_ni_init_cd(ni, &cd, res->start);
 				if (ret)
-					return ret;
+					goto init_cd_cleanup;
 			}
 		}
 	}
 
 	return 0;
+
+init_cd_cleanup:
+	arm_ni_remove_cds(ni);
+
+	return ret;
 }
 
 static void arm_ni_remove(struct platform_device *pdev)
 {
 	struct arm_ni *ni = platform_get_drvdata(pdev);
 
-	for (int i = 0; i < ni->num_cds; i++) {
-		struct arm_ni_cd *cd = ni->cds + i;
-
-		if (!cd->pmu_base)
-			continue;
-
-		writel_relaxed(0, cd->pmu_base + NI_PMCR);
-		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
-		perf_pmu_unregister(&cd->pmu);
-		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
-	}
+	arm_ni_remove_cds(ni);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0


