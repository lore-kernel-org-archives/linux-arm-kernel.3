Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27EEC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spuN2kHWMdhytNXoAnD9+S7VpKu0mwbypmNM2NFBsHU=; b=jrvfQ8SFQSt2EO1N2JSqH5KJC7
	iiYDb6GMcY6xgU6bzWFx3uIPpBH0DA69LBc68uLDxzW6NAOqWJYAbTks7YGG6cMIV60Ehg55NI6KL
	YHFaeSLpuumJJdcm8w1cKFmytSS81zoBe506WaWGTUjb20hlw6k6heAUkgFpy4buk3MvZum4i9P0j
	EcrCzlN9995A3acPPnzLklJbr9eAametiLoPEoot+/Ca12qkotOO6Lx5vQ0azWj5qqA+aW3Gzz+y6
	ClDCLzn6emyUVuFzEpI7nslBd8FtAcysgrGlRRH9LQrbcGvRwOA/wHEAcT1itSlg5TBmy4qFOx2yF
	/0iW3T/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnZx-00000002pVh-3cPt;
	Mon, 07 Jul 2025 15:16:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnPn-00000002o4J-499L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:05:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbSCW3kptz6L5PT;
	Mon,  7 Jul 2025 23:02:47 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 815AB1402EB;
	Mon,  7 Jul 2025 23:05:54 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.45.147.207) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Jul 2025 17:05:53 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <mark.rutland@arm.com>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH 3/5] coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
Date: Mon, 7 Jul 2025 16:04:12 +0100
Message-ID: <20250707150414.620-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707150414.620-1-alireza.sanaee@huawei.com>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.45.147.207]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_080556_164402_3D0446F2 
X-CRM114-Status: GOOD (  10.61  )
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

Use the newly created API to grab CPU id.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 .../hwtracing/coresight/coresight-cti-platform.c  | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..cd821e926792 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -41,21 +41,12 @@
  */
 static int of_cti_get_cpu_at_node(const struct device_node *node)
 {
+	struct device_node *dn = NULL;
 	int cpu;
-	struct device_node *dn;
 
-	if (node == NULL)
-		return -1;
-
-	dn = of_parse_phandle(node, "cpu", 0);
-	/* CTI affinity defaults to no cpu */
-	if (!dn)
-		return -1;
-	cpu = of_cpu_node_to_id(dn);
+	cpu = of_cpu_phandle_to_id(node, &dn, 0);
 	of_node_put(dn);
-
-	/* No Affinity  if no cpu nodes are found */
-	return (cpu < 0) ? -1 : cpu;
+	return cpu;
 }
 
 #else
-- 
2.43.0


