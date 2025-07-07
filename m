Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F86C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYnmLFJ0dPYgo7CWlbWVJR3xfTh4NwZ9WMzBh8HO/Zk=; b=u3wD5IT+exLk5pqTiNN8lf1as9
	0mH4S+6dVifGORCFkZNRZq7F6xX+WdlAQxR+B9YLtIROe+ZYDH9WEj7mtjN/74+j9Gapn9pA0Lvue
	ltwd8F7ECI0yxNlC9OL2e9UxYxhlkpDVI8Npik+zkWh9D1FUiyj20S6V9ec8ZnvTzPNsf6EqJc7rq
	8b4y8+HQyEx1Z3KIe9K0HjKF9/HU3055PEp25UG+uG89USwReCrmFklu2C/c0UT9rgQyR2tL6e0mt
	eb+r20UZ5TB9kmdX9wb6Cm1w68/VkQE1V6p/JHt3PpJJ8yUWGwLzOoLFEFwvtGqOXEN0vFHBjjf8c
	BcFLZRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYngq-00000002qNE-1Ocj;
	Mon, 07 Jul 2025 15:23:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnQu-00000002oIP-2gOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:07:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbSHX6MYYz6G93x;
	Mon,  7 Jul 2025 23:06:16 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 57F551402EE;
	Mon,  7 Jul 2025 23:06:59 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.45.147.207) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Jul 2025 17:06:57 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <mark.rutland@arm.com>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH 5/5] perf/arm-dsu: refactor cpu id retrieval via new API of_cpu_phandle_to_id
Date: Mon, 7 Jul 2025 16:04:14 +0100
Message-ID: <20250707150414.620-6-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250707_080704_816488_76DF4AD8 
X-CRM114-Status: GOOD (  10.29  )
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

Update arm-dsu to use the new API, where both "cpus" and "cpu"
properties are supported.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/perf/arm_dsu_pmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index cb4fb59fe04b..7ef204d39173 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -596,11 +596,9 @@ static int dsu_pmu_dt_get_cpus(struct device *dev, cpumask_t *mask)
 	n = of_count_phandle_with_args(dev->of_node, "cpus", NULL);
 	if (n <= 0)
 		return -ENODEV;
+
 	for (; i < n; i++) {
-		cpu_node = of_parse_phandle(dev->of_node, "cpus", i);
-		if (!cpu_node)
-			break;
-		cpu = of_cpu_node_to_id(cpu_node);
+		cpu = of_cpu_phandle_to_id(dev->of_node, &cpu_node, i);
 		of_node_put(cpu_node);
 		/*
 		 * We have to ignore the failures here and continue scanning
-- 
2.43.0


