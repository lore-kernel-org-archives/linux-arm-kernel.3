Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034E4CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU/vb1qvwFL5t+VtplJoGD5jYVUIc10GXK5hF8FrPto=; b=eZad29VagO4U01q8oRuhE1I8y4
	qadboTZq/0WSDUd0QGJ8b7DMB1k4nRTYGHrpN0wSz6VxFzWR522JOOBwGBBRWaGATTeG+DYpLB4rx
	XioOPJw1hA6ZrH54tgXJa1rbsfp2W5mKqb6ChCDDDCduEWwFxk89+Hhlc4zGfmanDEZgJyD+2zMhR
	/TOxmkUaTvjauh558FtF4Y1eaG77nIrpmz4gmxkADdC3+k+oOlnYrFSlo9SS4V8OsMFL9uzV2dG4a
	S2JrQOPv5DSqnIFvrgmGNwHP3AsiZ4nLP8zxkId6hMmVqDuFignKSJJ15vANxDrZO0PyzihPcFPek
	M4i0cWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucGQ-00000004D9c-2fYJ;
	Fri, 05 Sep 2025 19:38:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAj-000000033xw-22uN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:22 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJM0j1rRgz6L5FV;
	Sat,  6 Sep 2025 00:16:21 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id EEE7F14037D;
	Sat,  6 Sep 2025 00:20:15 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.202.66.105) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Sep 2025 18:20:13 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v4 3/6] arch_topology: update CPU map to use of_cpu_phandle_to_id
Date: Fri, 5 Sep 2025 17:18:26 +0100
Message-ID: <20250905161830.37-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905161830.37-1-alireza.sanaee@huawei.com>
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.202.66.105]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092021_667431_F9759235 
X-CRM114-Status: GOOD (  11.73  )
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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


