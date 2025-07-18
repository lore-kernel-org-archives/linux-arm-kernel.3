Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A8AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inz5aFpYVxGjtVSoz9NLqW/XD0UHr4eJHFDILPXhJTw=; b=KG6By+v7gBYob8dRcTUnnO+D//
	f5tJecdcDUj8sC49/aPH9m+uvOzsRD0LZzTT9FHQmh75gxw/Dx31tvXWdQGWPeraEyztJ5FtVL2bD
	rkyCr/BRQ8B6CDVsAAYr0KFBVFivB6EgOtXjXb2MnB/7IfiYrjczT59kR4RCRtvO7XANOQUsKFPks
	lwr8GEh9Kgeo6dcyGrunFnDfOy4q4a3oNSfaPu9LUDMCATucvV8SuwzXkqx9moNFuPQLu3b5SYbW5
	mKQPZvhBHLsz3Y7FXP82LweViohFsOc4xwCF29bMEDvXdOeV4GKUE/Xn+XJ7fAcoKyTjWbEwZyVRo
	4Ac3b1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchza-0000000CGWJ-45Xn;
	Fri, 18 Jul 2025 10:07:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchk5-0000000CEaf-0dLK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:51:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk4l66Bmxz6H6m1;
	Fri, 18 Jul 2025 17:49:38 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id BA691140142;
	Fri, 18 Jul 2025 17:50:55 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Jul 2025 11:50:54 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <coresight@lists.linaro.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH v3 4/6] coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
Date: Fri, 18 Jul 2025 10:48:46 +0100
Message-ID: <20250718094848.587-5-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718094848.587-1-alireza.sanaee@huawei.com>
References: <20250718094848.587-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025101_331089_B3EA1428 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Use the newly created API (of_cpu_phandle_to_id) to grab CPU ID.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 .../hwtracing/coresight/coresight-cti-platform.c    | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..2629962dbe3e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -41,18 +41,7 @@
  */
 static int of_cti_get_cpu_at_node(const struct device_node *node)
 {
-	int cpu;
-	struct device_node *dn;
-
-	if (node == NULL)
-		return -1;
-
-	dn = of_parse_phandle(node, "cpu", 0);
-	/* CTI affinity defaults to no cpu */
-	if (!dn)
-		return -1;
-	cpu = of_cpu_node_to_id(dn);
-	of_node_put(dn);
+	int cpu = of_cpu_phandle_to_id(node, NULL, 0);
 
 	/* No Affinity  if no cpu nodes are found */
 	return (cpu < 0) ? -1 : cpu;
-- 
2.43.0


