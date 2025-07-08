Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A088C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yL/P+SnjleIg2rtUwqE5FNxxXNW/euUWb45ZK0PqaE=; b=utz9FfJkOF2vrNBUUQxkbXZkrA
	R6Ki5hYpcu81Dfg75OM3yLRlUThc7YUWVyWKaE6w9zqOls5d9GcfjRS1K6pa49wFsC93JIbuScKcY
	BNy2hj+PIKdm+DdXhPeFZCqFCitoJOxVbYhSqDvp2XBNOl7/mbVGWxQqBFfnQsCKK0QkOANTLtHok
	+dUjBkwcTC6fjNFjmhgEZ9l2nEbQ3R1uWA9fkiINUNBQt6tylQm7dEAZ3uysCRXGsJ8N9Lb/4KCmj
	YJkgoZynsx2DTaGiPJeXeGVL4hVNAoYVKYp+0jA8UwrqLOK5Jr52zBucruEgMkA2b6G1jZ/+ZRMc6
	nS4wKX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA9P-00000005md1-2G4L;
	Tue, 08 Jul 2025 15:22:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA3J-00000005kcR-0nDi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:16:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bc4Np0DFNz6D8gp;
	Tue,  8 Jul 2025 23:12:58 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id DA5381402A5;
	Tue,  8 Jul 2025 23:16:07 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Jul 2025 17:16:07 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <krzk@kernel.org>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 2/5] arch_topology: update CPU map to use the new API
Date: Tue, 8 Jul 2025 16:14:59 +0100
Message-ID: <20250708151502.561-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708151502.561-1-alireza.sanaee@huawei.com>
References: <20250708151502.561-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_081613_367005_0F0559B3 
X-CRM114-Status: GOOD (  12.90  )
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

Cleans up the cpu-map generation using the created API.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/arch_topology.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1037169abb45..ccc73bfae90d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -473,19 +473,19 @@ static unsigned int max_smt_thread_num = 1;
  */
 static int __init get_cpu_for_node(struct device_node *node)
 {
+	struct device_node *cpu_node;
 	int cpu;
-	struct device_node *cpu_node __free(device_node) =
-		of_parse_phandle(node, "cpu", 0);
 
-	if (!cpu_node)
-		return -1;
-
-	cpu = of_cpu_node_to_id(cpu_node);
-	if (cpu >= 0)
+	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
+	if (cpu >= 0) {
 		topology_parse_cpu_capacity(cpu_node, cpu);
-	else
+		of_node_put(cpu_node);
+	} else if (cpu == -ENODEV) {
 		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
 			cpu_node, cpumask_pr_args(cpu_possible_mask));
+		of_node_put(cpu_node);
+	} else
+		return -1;
 
 	return cpu;
 }
-- 
2.43.0


