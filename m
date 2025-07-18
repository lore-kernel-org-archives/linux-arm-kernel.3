Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB31C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJIhxhybZ7o1h+9yiKftP/k/3VymzLlFq8GK8RHGLJs=; b=bZoK4aqxhefcQDnvYP6/KR1Eqt
	cwfX4+/xEauaBops0UMDoBuCBdvDiiWJF7HHVucxbG+2hoWCl4oEb6AEksYWy1TsrjZxYPsW82Pwr
	ad4nTh8ZwrfLKFJROTqV53NXH5Kk0Gbuw2s5mDnjQHWce5OgKpzm7vGE5h4d/JuBdKKBwRyyQ1mxP
	/W/LBzEhyC68rq9+w587vICoEllkmyBGqmwrU7y1Qau0sX1+o/d/L11vEebQ8zUPg2cwhK+hE8gvj
	aNcTk9OtXGLBs7vCO2XTDpLHJCl6pYo448Wy3gKpNloYI9zWUbIbwZyqhuFu8Ogq7eLABkA4zPRak
	Aqwgs7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchum-0000000CG3R-29IT;
	Fri, 18 Jul 2025 10:02:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchj0-0000000CEN1-2DqL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:49:55 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk4jt6Wr5z6M4c3;
	Fri, 18 Jul 2025 17:48:34 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 24AA01402F6;
	Fri, 18 Jul 2025 17:49:53 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Jul 2025 11:49:52 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <coresight@lists.linaro.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH v3 2/6] arch_topology: drop the use of cpu_node in the pr_info
Date: Fri, 18 Jul 2025 10:48:44 +0100
Message-ID: <20250718094848.587-3-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250718_024954_708132_DC2F3F49 
X-CRM114-Status: GOOD (  11.75  )
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

Remove the use of cpu_node in the pr_info. When of_cpu_node_to_id fails,
it may set a pointer, cpu_node, and the get_cpu_for_node function uses that
pointer to log further in the fail scenario.

Also, change the structure to exit early in fail scenarios which will
help enabling code unification that follows in this series.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/arch_topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1037169abb45..6fafd86f608a 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -481,12 +481,13 @@ static int __init get_cpu_for_node(struct device_node *node)
 		return -1;
 
 	cpu = of_cpu_node_to_id(cpu_node);
-	if (cpu >= 0)
-		topology_parse_cpu_capacity(cpu_node, cpu);
-	else
-		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
-			cpu_node, cpumask_pr_args(cpu_possible_mask));
+	if (cpu < 0) {
+		pr_info("CPU node exist but the possible cpu range is :%*pbl\n",
+			cpumask_pr_args(cpu_possible_mask));
+		return cpu;
+	}
 
+	topology_parse_cpu_capacity(cpu_node, cpu);
 	return cpu;
 }
 
-- 
2.43.0


