Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F96C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imWw8z3pHSVdVZSrfir7i7a3cdyccz4AaxxnEyMBQPM=; b=vEz31u4yO2qQaHcHmoLm2sMTes
	TSXUurItYE9Wc9yR25MQhCis6WiiDVTMT5qKPj6JfXsJ5tBtFbm9KFGVoNBCXijTBPafKDQDVoWGx
	7a1LrQS7VjXWK6w1WM9eDE5zER6vHfS+kptI7TsKTf6dcsEup/xRJR+d/GoiPEitnCd2DKmiL5O5h
	b9rPLMAg+RX+QX9VLoZGyBxx9Tgo4ksYLZVjXm0ljFXajloJnBg7sDF5jwPUBYxlPg+IH5MZRxz1E
	e1VicZFoPDo1NNYsP5f1sUt2QZOF3TR5u4i42WlOCCz9ClqhkxX81YvE0vleUkTXw03Io60FYeAm+
	ZWZi8HDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOKT-00000008iT7-03VR;
	Mon, 12 May 2025 08:16:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEODX-00000008hPN-1eBx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:08:56 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZwsZR13dnz6M4hn;
	Mon, 12 May 2025 16:04:15 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id B7CD614050C;
	Mon, 12 May 2025 16:08:53 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.30.10) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 May 2025 10:08:52 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
Subject: [PATCH v3 3/7] coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
Date: Mon, 12 May 2025 09:07:11 +0100
Message-ID: <20250512080715.82-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512080715.82-1-alireza.sanaee@huawei.com>
References: <20250512080715.82-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.30.10]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_010855_570548_D4854C57 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: mark.rutland@arm.com, robh@kernel.org, dianders@chromium.org, gshan@redhat.com, saravanak@google.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, james.clark@linaro.org, linuxarm@huawei.com, shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ruanjinjie@huawei.com, krzk@kernel.org, jonathan.cameron@huawei.com, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
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
2.34.1


