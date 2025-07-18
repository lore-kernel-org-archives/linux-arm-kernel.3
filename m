Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E555C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCiI2VNm8zcp/2UWClkLFGaVIRXX2iXWfHR18cgaj/M=; b=AREyxIqUxuVTo+pB/jZ4WfHbr7
	NwIlppEUequN32MHrsDrz1UbBdos3XjhGWf61NcKDUHnOuMv0bOHygXUyxM1XsTor5YdjaZ4h/Zen
	bA4dKigwSL7ZVkV6L0Lej26RvQCFOfdfSSBIBAnspdSpNSzli+ptG3M3rcYp+3UtgyI7GXhq0JzDB
	bi0kAtxNHOe/bcK491XIN0ptsVL07hL5AQ/XaxMAPE00QM5OxAKByF2sfiF0bvplv88tYXDCoghjb
	0zy3/mBVIavPPgEsVz209X1EDMwuN9p92272iZInG59imYV7CxVvFzyeJ8QwsiqigixrUuJGNZa5h
	63xkrsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uci6u-0000000CHHj-2aEw;
	Fri, 18 Jul 2025 10:14:36 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchl2-0000000CEne-1aZh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:52:01 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk4mL0VbBz6H6pQ;
	Fri, 18 Jul 2025 17:50:42 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id EC67F14027A;
	Fri, 18 Jul 2025 17:51:58 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Jul 2025 11:51:57 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <coresight@lists.linaro.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH v3 6/6] perf/arm-dsu: refactor cpu id retrieval via new API of_cpu_phandle_to_id
Date: Fri, 18 Jul 2025 10:48:48 +0100
Message-ID: <20250718094848.587-7-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250718_025200_556276_93737D67 
X-CRM114-Status: GOOD (  10.64  )
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

Update arm-dsu to use the new API (of_cpu_phandle_to_id).

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/perf/arm_dsu_pmu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index cb4fb59fe04b..8f76bd94349c 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -591,17 +591,12 @@ static struct dsu_pmu *dsu_pmu_alloc(struct platform_device *pdev)
 static int dsu_pmu_dt_get_cpus(struct device *dev, cpumask_t *mask)
 {
 	int i = 0, n, cpu;
-	struct device_node *cpu_node;
 
 	n = of_count_phandle_with_args(dev->of_node, "cpus", NULL);
 	if (n <= 0)
 		return -ENODEV;
 	for (; i < n; i++) {
-		cpu_node = of_parse_phandle(dev->of_node, "cpus", i);
-		if (!cpu_node)
-			break;
-		cpu = of_cpu_node_to_id(cpu_node);
-		of_node_put(cpu_node);
+		cpu = of_cpu_phandle_to_id(dev->of_node, NULL, i);
 		/*
 		 * We have to ignore the failures here and continue scanning
 		 * the list to handle cases where the nr_cpus could be capped
-- 
2.43.0


