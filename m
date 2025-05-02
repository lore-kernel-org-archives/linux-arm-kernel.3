Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FEAC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3lcx27EUtho6SHAm8Ug+DvNsPNGSthwQy0BCXXIfac=; b=vGVs0q8nq+82SJQBn4s88r2vYE
	HvHN5cnp4TK4cTFYMV8KBgnTad5ZtUgSyOjzDooLOczdexXlxgOihse9HWKlFasXlxNrmtRWMhHGy
	gZy80426ncfwIeXMQFt2sqDRhbxXkOaVLM59f1b3fcScLw+3lw2zxse9l6aGtvyva8+B8SRf4azWW
	XqJe+KWe014LaJsC1ygNDTvcnPw/t5KGUkNMNA/7GE2kUOA/lUuHTw8/gRMLeeALhl2/3ucJ0JPvf
	d2T4fSeiG2j2uPO2SNbpBZg82c3CrdSxN4KiwYwah+r+qyrE783Uw/058jQ6madXWhFsXXLxoEp/N
	ecgWSDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt6Z-00000002UDD-449W;
	Fri, 02 May 2025 16:19:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt1k-00000002T6Q-3MZq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:14:18 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwsp6l0bz67J7D;
	Sat,  3 May 2025 00:11:58 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DDCC1402F7;
	Sat,  3 May 2025 00:14:11 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:14:10 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 2/6] arch_topology: update CPU map to use the new API
Date: Fri, 2 May 2025 17:12:56 +0100
Message-ID: <20250502161300.1411-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502161300.1411-1-alireza.sanaee@huawei.com>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.77.180]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091416_979112_DD70C3D1 
X-CRM114-Status: GOOD (  11.13  )
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
index 3ebe77566788..533ddf69b43c 100644
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
+	cpu = of_cpu_phandle_to_id(node, &cpu_node);
 
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
2.34.1


