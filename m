Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99EACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCGNp3oCGQTWX8zCVzIOo1/h4ulNcAsAVh2n86910Bc=; b=y3Gr+qWs4c2DNqBOaZOZFtd/Pj
	LkD54S7LwDETdO8Px6Dbr0Y5nX0G4UHQwTbIqbEEwO0V98/Ng1g61AQO2A6xRGY/JHfddaaCEaR/2
	pIXrgqT3VCyj6GvxvfQgZGNNgsJxDc/ecK2v/xBtUzIcak6p6xqmIvoibBB5zPud0/024vooqR2Lu
	D9qNxuOje8SQCoNDR+l5C2izNxyZiODWSCXcwZtI9XAkwaJ4FTwNTIJbtcZjmgK32bbuDTOI/6Ucn
	kHrVqj9P5j6qRcn9j1ULSYy4uS/v65q2O6CnSqN4QJ76LqA+CmNANIRaAEPVbTLMQNUmXrkMAhJcu
	M84hwnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI92e-00000003zYT-3Djq;
	Wed, 29 Apr 2026 17:49:44 +0000
Received: from mail-northcentralusazon11012061.outbound.protection.outlook.com ([40.107.200.61] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI92Z-00000003zXB-1LQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+z4wyVK8+fGkZJ1DV0AHwM/ZxQq/7ncmy0ntY/SOM0ElMI4EPClMAzZvbM4yEBMWAteJq+Y4dE60jxFYeUVxVvxAa4hYMJ9m1Re+rhCUGOI2752h5Q7xaPsYExlzVREytCnvXaN2+RyxzQCDyPlPaaE1TovM5nciwYeB/ErzrTafo3tEYzKf9anzeN+JIGi/FAcPDOMGiRHFiRLkuxPObjuq0HAvi7yXVhJzHqKutsl9dFNa6jpagpRro0EA/MI1TWMsEVsNoIjEN6KxnwcnIn6po03e/Q+2rOhuygzD4YtcgT6drpzoV2gINIwNVV6zxPXQHGsTHZYQIujoAQ1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCGNp3oCGQTWX8zCVzIOo1/h4ulNcAsAVh2n86910Bc=;
 b=rNWB6juC6Olwn+rtOwHm+j3DmpIMka9TPyS9kBw0DnLV56lKm2FFQJ7zop7nDsHOLj6OopKQ8C1b/jSKQto32kx0cWgNCN+tUKTVc8MHECmYDzi7NkLt/yq7PdFQU/DjVrOuiJujFEHwHxYsYxdqYgjkKya/RBQKhaF7bkm+n/P7hcbC1mMsaQ2K4d5fzZzZwKImDeHdrkYRbMeP9OTSHkHi5sBavrv4o/UvCN9lgeFSnpHVZ7Ic281Q4BC0PW9izA1Dr0Mv3zSVGwid9hsTg53AjqJtyYhWLV7C2Arn/YDJNulID9loHVjAvlShBfz2Sv1uVlgfsHlbTEJY6TDMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCGNp3oCGQTWX8zCVzIOo1/h4ulNcAsAVh2n86910Bc=;
 b=IDtqpDnE22UYS/BBg0AFrbt7YiJPn9KvIUmDgWPcESdXo8qDtxb5TatHVO5Q1wz3IvKpP302Lxhf8olfxRnnKPEiR6z3gwCZdt4MgpWCT0JKib7dhdAuY3ounoVDXUgmGrhn/u8dPuvSSBxENsqKVIBO+sFyGVjed6XHrWEmnUM=
Received: from BN9PR03CA0265.namprd03.prod.outlook.com (2603:10b6:408:ff::30)
 by CO1PR10MB4660.namprd10.prod.outlook.com (2603:10b6:303:6d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 17:49:34 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::f2) by BN9PR03CA0265.outlook.office365.com
 (2603:10b6:408:ff::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 17:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:49:30 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:49:23 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:49:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 12:49:23 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [172.24.233.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63THnDDH3822334;
	Wed, 29 Apr 2026 12:49:20 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <Frank.Li@kernel.org>,
	<nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <tglx@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] irqchip: ti-sci-inta: add runtime PM and system sleep support
Date: Wed, 29 Apr 2026 23:19:04 +0530
Message-ID: <20260429174904.4049243-3-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429174904.4049243-1-r-sharma3@ti.com>
References: <20260429174904.4049243-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CO1PR10MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bb2fa6-6515-4ef4-2ccf-08dea617aa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pJ7y8pohsOSZpOTY3vmfwLmsCCa6J3wlkEEZLphaYoyab3fJabhOvfApofgX4ludI+qA12jvnIJpkO+5v0XYBSuZycHD82XGUr8kIMXDJf+cN7uxQyK8sWcBx+ewd7fnqM4/w1lWBIy6q4w3GZRQRG+0LLtnoPBCL3oiL2jVcWu6Lvg0fBe8O5+nvNhtcEKbiajV8ZhnKPm9UszEFjmtiy+0bG96MpR2kHkfzfTdDhCSz933BAo/P7eRbVRvJthNOGpXO3+BjnKWjJ9w3krLBsbaWvQT/0QskYpWS2OAx+odi02KO3GhhuVjCh2q9Whn/7GNCkfN1EE4y9uzgpQx+pqYB1xfrU0pQu/V6cRrr1no5nC6Ajd30WWh3ih8gF6JfLRtZ5ut8UzqAi0MVrPTO65vtJWWMu48q7W5gZTsGXAkS0SabbmrLAI0Wtr7Qf3o1ZCXIZ8wXQObjlxMDpu3lvygeysAa4S2vrcliBLB14VQYIn9Q9auQ24eZIBh47k1qg814yd+f9mTJ97NN3h5TmgRZvbZqOkH3uz28G9zo4V2515Vc2/Vy+DajX0lcYqPaQqj1mPi7Nj0BvQSnHMfpm0h/X06zEFZJ+w6vqni6TepGZKQ+g5OfylFlHNU4Q8G0sn91kFN9UfF1/yd/L5QZ7CU4+EZAEqXWmTfb0WICm0W7Xctg/0fImPJ2NMRkTSk2t8Ccj+smru5Qb65mT064ENT36AmhroiDiMivffHODja0t0JJaPODFr4lI5Mhm84rZ0n1EMeYHf7KygvACMzhA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /CYmajG2w7M7ZH1/DxOXNaJEQ8C7Blkv/Bh0BeQbuc9BxW+Erld/Ek3XHPyLeZsX5Z2MI1ZcEVr5jYPHLQALTxaSeRfEj9iKPj6izTMIhOePARyEWlHFKG8bJTXJMg8vxsMIb9ncq5J3vLvU32VNUVVDKDy7tywVsGAv2sjctHkJWEv07WqxUclk+E/XnLb4sZmgzxDPU9O3Y+Jp3H+S14/lEquL7F1VOs9KnvlWjefbBa8aRiSNejTHqNS6kMZfD2E7UYXTszX+NEU5Bz0Kwly49SF4raqlJ9Mt0citBtkYCbSSSXJuUCfjhLwha9CEwVBgRG85/39HWehz0BSFx/n4ppuz3Tj2pivrdsu2ppd5jatunHdNjKAo6lo551cWZj59tQZ1TLpbmmminNc+PuYo5Ms6tmhBDj0wzP62dkCb8bsVIcySp56YzCXrSmWo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:49:30.7280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bb2fa6-6515-4ef4-2ccf-08dea617aa85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_104939_364232_8C4326EB 
X-CRM114-Status: GOOD (  15.94  )
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

Register runtime PM callbacks and enable runtime PM via
devm_pm_runtime_enable() in probe.

runtime_suspend is a no-op; IRQ routing context is preserved by TI SCI
firmware across power-gate cycles.

runtime_resume restores VINT_ENABLE_SET for each active event bit,
skipping IRQs with irqd_irq_masked set to avoid re-enabling
intentionally disabled interrupts.

System sleep reuses these callbacks via pm_runtime_force_suspend/resume
as late/early sleep ops. This ensures MMIO writes in runtime_resume
happen after genpd restores the power domain (dpm_resume_noirq),
avoiding writes to a powered-off device.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 drivers/irqchip/irq-ti-sci-inta.c | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index f1eb2f92f0ca..0d4451b208c1 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
@@ -720,11 +721,58 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&inta->vint_list);
 	mutex_init(&inta->vint_mutex);
 
+	dev_set_drvdata(dev, inta);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "Interrupt Aggregator domain %d created\n", inta->ti_sci_id);
 
 	return 0;
 }
 
+static int ti_sci_inta_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int ti_sci_inta_runtime_resume(struct device *dev)
+{
+	struct ti_sci_inta_irq_domain *inta = dev_get_drvdata(dev);
+	struct ti_sci_inta_vint_desc *vint_desc;
+	int bit;
+
+	mutex_lock(&inta->vint_mutex);
+	list_for_each_entry(vint_desc, &inta->vint_list, list) {
+		for_each_set_bit(bit, vint_desc->event_map, MAX_EVENTS_PER_VINT) {
+			unsigned int virq;
+			struct irq_data *data;
+
+			virq = irq_find_mapping(vint_desc->domain,
+						vint_desc->events[bit].hwirq);
+			if (!virq)
+				continue;
+			data = irq_get_irq_data(virq);
+			if (!data || irqd_irq_masked(data))
+				continue;
+			writeq_relaxed(BIT(bit), inta->base +
+				       vint_desc->vint_id * 0x1000 +
+				       VINT_ENABLE_SET_OFFSET);
+		}
+	}
+	mutex_unlock(&inta->vint_mutex);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ti_sci_inta_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(ti_sci_inta_runtime_suspend,
+			   ti_sci_inta_runtime_resume, NULL)
+};
+
 static const struct of_device_id ti_sci_inta_irq_domain_of_match[] = {
 	{ .compatible = "ti,sci-inta", },
 	{ /* sentinel */ },
@@ -736,6 +784,7 @@ static struct platform_driver ti_sci_inta_irq_domain_driver = {
 	.driver = {
 		.name = "ti-sci-inta",
 		.of_match_table = ti_sci_inta_irq_domain_of_match,
+		.pm = pm_ptr(&ti_sci_inta_pm_ops),
 	},
 };
 module_platform_driver(ti_sci_inta_irq_domain_driver);
-- 
2.34.1


