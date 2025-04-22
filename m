Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D916AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vrhh9i6TYlwoM2+z5kGPQTRrFZI3TZQ+4bajebYfySA=; b=QMJ42jFYqOiokDdRfY6bKiB9Ms
	tVvOLk1hdc30Ih2HuOYNNYOPsmvWSvOsfCxgOS0QU2THjLSbu21bVYGl28OUpWzT5mWofcUQcagd7
	QGWCa/o4kUr+96qfUQTFcdgejDAViZ13X1YB6mziUNCIwX1SgRj+a8WRd3SvR4b2s57KRaF39NiNW
	K54P8ytkbSoJ+0uOSkHaEh69R7jqbZD38BU6leV+8sNPUzFpeN6MB1IgC9HNvzVlojkvR+VfB/crE
	XsxDg8XkAGLBD/KETRgpVuglal2/eCIA+qTfXU7iUstR9Nge3YDbrvuyd88zMybCuNDSjkScbAQZw
	b66ySpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ALh-00000006eS3-1pmK;
	Tue, 22 Apr 2025 09:55:29 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Fq-00000006PIO-14Zb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:45:23 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbLK0RzYz6M4gc;
	Tue, 22 Apr 2025 16:41:13 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id AABD11402F3;
	Tue, 22 Apr 2025 16:45:20 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:45:20 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 3/5] driver/base/arch_topology: update CPU map to use the new API.
Date: Tue, 22 Apr 2025 09:43:38 +0100
Message-ID: <20250422084340.457-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422084340.457-1-alireza.sanaee@huawei.com>
References: <20250422084340.457-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.65.221]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014522_454324_F200F6A3 
X-CRM114-Status: GOOD (  11.28  )
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
 drivers/base/arch_topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 3ebe77566788..653a56625477 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -518,23 +518,23 @@ core_initcall(free_raw_capacity);
  */
 static int __init get_cpu_for_node(struct device_node *node)
 {
+	struct device_node *cpu_node = NULL;
 	int cpu;
-	struct device_node *cpu_node __free(device_node) =
-		of_parse_phandle(node, "cpu", 0);
 
-	if (!cpu_node)
-		return -1;
+	cpu = of_cpu_phandle_to_id(node, cpu_node, "cpu");
 
-	cpu = of_cpu_node_to_id(cpu_node);
 	if (cpu >= 0)
 		topology_parse_cpu_capacity(cpu_node, cpu);
-	else
+	else if (cpu == -ENODEV)
 		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
 			cpu_node, cpumask_pr_args(cpu_possible_mask));
+	else
+		return -1;
 
 	return cpu;
 }
 
+
 static int __init parse_core(struct device_node *core, int package_id,
 			     int cluster_id, int core_id)
 {
-- 
2.43.0


