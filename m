Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA375C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z09XoJvjpQ9+6XoZ8e8xojIrmTCtu5eN0Ac9j3WZXFk=; b=QM/56IPX1bqO5dJ8KXTUIetbjc
	BuYkN8ho0Npw+S17tr/6wGXs4c3w9wPz61n1BbZ5uc8HOXmkBVGYVl9nrYrSbffSNS5/A10PHqGIh
	yznKgTxLeKAkNB/USu6FI2P7X18yRV7N8JIJ/S9NH2iSNDw8EvneSb59Gjx0/h9KQNCMdbH0KOtPx
	MfKd+bG+tAFHLIAAk8Q4IAp9W9XnNfqkyOnfWWYIgblzl7ZISGXYJG8IMyTjbuXapHyBetyBmmi1m
	etwQo2v9aKPjY8t4aMi5BB9DQsuEJhEWCYOvjlUqVN26QTQ13PLfeQXBsYz60kZuarX2kgt07IFhh
	/sT6lC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchxB-0000000CGKG-0sr1;
	Fri, 18 Jul 2025 10:04:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchjV-0000000CEU1-45wz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:50:27 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk4kV1VZcz6M4j6;
	Fri, 18 Jul 2025 17:49:06 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 69BF314027A;
	Fri, 18 Jul 2025 17:50:24 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Jul 2025 11:50:23 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <coresight@lists.linaro.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH v3 3/6] arch_topology: update CPU map to use of_cpu_phandle_to_id
Date: Fri, 18 Jul 2025 10:48:45 +0100
Message-ID: <20250718094848.587-4-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250718_025026_153176_729244AA 
X-CRM114-Status: GOOD (  11.92  )
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

Refactor get_cpu_for_node to use of_cpu_phandle_to_id instead of
of_cpu_node_to_id.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/arch_topology.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 6fafd86f608a..72bf23cdf469 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -474,20 +474,19 @@ static unsigned int max_smt_thread_num = 1;
 static int __init get_cpu_for_node(struct device_node *node)
 {
 	int cpu;
-	struct device_node *cpu_node __free(device_node) =
-		of_parse_phandle(node, "cpu", 0);
+	struct device_node *cpu_node = NULL;
 
-	if (!cpu_node)
-		return -1;
-
-	cpu = of_cpu_node_to_id(cpu_node);
-	if (cpu < 0) {
+	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
+	if (cpu == -ENODEV) {
 		pr_info("CPU node exist but the possible cpu range is :%*pbl\n",
 			cpumask_pr_args(cpu_possible_mask));
 		return cpu;
+	} else if (cpu < 0) {
+		return -1;
 	}
 
 	topology_parse_cpu_capacity(cpu_node, cpu);
+	of_node_put(cpu_node);
 	return cpu;
 }
 
-- 
2.43.0


