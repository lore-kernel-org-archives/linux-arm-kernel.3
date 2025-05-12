Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D76C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqVIaBbsTDNl5HoWxqg9uCVxIH0A8/djW9HPYMI1S00=; b=Tn5g3Hin+IusJxXZjDXj6IVG1u
	qMetUA12Mzn1JfR3EUVwSbxUFjr253LTadSMLZCinJkFNQO7R4y1U59iZb7XaO/AIFhAIwucvJ7vB
	437eIAdPE9+5w9UEKZuW3yCvf5J9iacxGcV0lh408DqSuLkMkCXEVB05rQrIcBhNNmdpUKbjZJ/dV
	XWKrWr0x4YlvA75KFPbV36RzfjrR/Mqcsd47br5UhUsqahIZKxwPLxC6UFkifZqGJoMBM4MV5QV0B
	VwC/cPsKLrewtE82dxzNo+ST2jdEDeo2/w41KJesT5PaU9Mj+GhLCyQQo2AfJ1o+uHEPsK6iXb9DP
	s/La/Bjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOOb-00000008j6Y-2U80;
	Mon, 12 May 2025 08:20:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOEa-00000008hZy-1dss
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:10:01 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zwsbf6JXNz6M4jB;
	Mon, 12 May 2025 16:05:18 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 6469C1402F4;
	Mon, 12 May 2025 16:09:57 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.30.10) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 May 2025 10:09:56 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
Subject: [PATCH v3 5/7] perf/arm-dsu: refactor cpu id retrieval via new API of_cpu_phandle_to_id
Date: Mon, 12 May 2025 09:07:13 +0100
Message-ID: <20250512080715.82-6-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250512_011000_570408_EB344A3D 
X-CRM114-Status: GOOD (  10.23  )
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
2.34.1


