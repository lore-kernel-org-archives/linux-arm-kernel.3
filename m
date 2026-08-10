Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB03C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0KiVVjsGzi9B9l+SyCnrGtTYo6w/3jGTx7xX3VYJU8=; b=byxVZ75WXn1dULOSiQIUw2IRuR
	UaCg+3BEdFYPkGr7896FyQCm5e/WDHhzbS/zLb3Bk2We+QEGFpTJtls6e5X9pzS3GSZvuVxvARvyE
	ugsFb3E+v0W8F5OD26vz9OKVtqDGkfH7xt6/VxrPxHxek8ugBE58c8iIXYi0SFCvnf5/rxv5FG8vZ
	BDupicOP2kvmYCLquqhLA2a01lrUg1FwHkzgGs8OqwP4DTa4Wjjc28lwmPQnAQLeH39Bqaio5U2bJ
	3VcfB9fDyXEGS2ix0eQrIheGo/h1cohb1lk1FJ4+CjWeshYs3pTtTRzb1uVryf2UlwgVJaS3Is3bn
	RcCJssJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6a-0000000CYmD-0KjK;
	Mon, 10 Aug 2026 17:48:08 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6V-0000000CYjx-15mt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5SFC+AyfOOPodP5EB5kxk6RrTaKo5XCQ+0PS9PIspjuegm2UFDXuZHN/n0RvBTKS8A2STFUCB6kJfiV1qBjg7kjz52CejKvTC3de0m42UgxrxslGwVRZATu+ujYGn2EGUtBjE0Vt910djKpd3jnVA+V/N8x9UlXve/15M5pyGQB+/x+2I2SrICW1rt10+9VOfLQzk+3ZXExOiFdoyF1IPJoLhKTRthfEfQKakdQZ8bCpy0BIfqrPqrL3jfnQM7XZ8JDxnssK647Ub9WR8YWtuPFKR8YL3k3lK4EuNf08fvlDWeV3mrrAByEBa5Qm7rSuLfD0Bd/OH/JM0CxvvrU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0KiVVjsGzi9B9l+SyCnrGtTYo6w/3jGTx7xX3VYJU8=;
 b=ezyDwrjj/zygXfCtKEN+d2IkoxBh+pt9Itu0SejzEk/+A2c2ue4IeMkga9JqbjhU/hqX/9j0HGQdOlQyuCX4fgxYuUTREgxy0OUAOGpDLbtySMtQHO/p+lD0bPeKJ4o6soMvBzpO5JVd3GkDFmShs4aGwIDMP2qa9+oUCDDTSIgQewB+POEuoLevncWkktgdLRjKl/8EXQr7N5Mj5Pzm+dtocMl0buXoblxiSZuxeei7UWd3dexe/SaddpSLPUQCmQv8ps4c+dRm+446iTLczp4yfBadWeD1NBZSEPZlugf/XqtvMIh0b4fAmXELejmxhoKbSOVEGSRI4V4gx6aEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0KiVVjsGzi9B9l+SyCnrGtTYo6w/3jGTx7xX3VYJU8=;
 b=IHMWHMArkA3/6EfP7hrCR1MRhn0YmrY1Viy/KF/TGRcdJTD8BENf5EK4W6BTgXDtMKwKlAcA8e6aAsvd9mZ872xkhuk40HOFoF65d7o84zJnrTCmg33A5Xw9fEs+NPj4eeGaTrgLEuBbUyuqUl1Mfv4peVafwQX734v2yE3FVdk=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:51 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::ab) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:50 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:47 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/5] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Mon, 10 Aug 2026 23:17:09 +0530
Message-ID: <20260810174713.2325292-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f86093f-ff79-44a5-f374-08def7077feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UOHQ8S/1GeIYIARqbx1kEhziYoN7NjgNfAx7Gj7eSFm7yBaK9T0qxu3gHFbvzRu6q5D+Sb2MGjgXn7gHg5Ckybio5sgBMC1vxIjtUskVxXJuTaxKgDGVCEvmunqpI+F1CvFl5T5CNmYxsSBv2EhhI5BAPNC2n2PJBLGpYcH6CaUBEevDaclivu381kZvhfVEDR2KYhvKwE8h9tblg+mycsbdvaCoF3TS7an1sNfoddv4HoQLMMuoekw6QoejNsHEupDhUF9jppfF60IcCFJY1CGfMIZoB7SNEr2m0jqChyegnaXQwjxRphkA3yIYgQ8ax0Clu4zhu4GfeRX2bFxb06RkMm+2oN4QvNMf+voZWaSuvJQBLP0jz2mrwQN/qVxmNHpmFev2OvOJlpXZFSF4tVCN7F5K0NvC+AyAZKaz/P/QociNpz4N065ne/knhX/n6t8DJ+86w9LmZvhxqsrioSCs1pjZhn+HZ+GUOOooOIuy4IH8306P6ivOjoSLQHLJuPLYZmy/zrsgu+QhuVlJLqw57bq+sJlqaC/1ocOuRnXwElR2UHSnxAKl39FN/NkktWcctL8jrSRRbKBdrcpLFBAAh3yKVBf3J6Fksoj4PjBbtiWnG3rPqD9eRjXyUiDdYh5NOLSk4ldb+dgWW7sHZXOPMKuEp5YUMEDo43NIYj7GqTPPtsZu5ecKy6O44hc8GLPjkkpSLDLaBMv4OebvRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jKaP3KPDfKuEHo4zjHJBZxxtZru6VSgM1fdfiWD6fHGkI9ubbf/sJUZ7pJMhKUHAzByAe0hSYWXO7VW/dH8WA9Ee91+kQWlHbB4oBEkBYxj+QsOFaQNMvjHACrYoGNSviwQqGTJJQ3gJIkneJe6s1j8KemBRY0dX9HNlcIGNm+j4zv4ED32850RGNjVHVmHv8kMRBLTz03wK6lCFacJJsxKh0BIxqjkfzDwuF2IwN0Om0i2gNH5qxZ+X6kHE9eNr4gJf63UXA0xk2hlaq0rQfJsy+GSwtyya2K0T7t/3luYC9QnitEeLTxRFgfGBlLoM8HDTVZkgYoOVEKStQPXmVsBpHfOrxh3VuIvXRubO8RiH/Yf2xNxVfpqfTkh1uYcrao+sYWcDj/aX19wyKmhMPnuvg0WRLxVd3j8Vqf3UIkKrRROnXFPZfT8cky0M9d96
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:51.4846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f86093f-ff79-44a5-f374-08def7077feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_104803_302078_312ACDA5 
X-CRM114-Status: GOOD (  12.91  )
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

Use device_get_match_data() to obtain the platform init callback from
the OF match table instead of calling of_match_node() and dereferencing
match->data directly.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index b832505e1b04..1a8619854d6d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
@@ -279,7 +280,6 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	const struct of_device_id	*match;
 	void __iomem			*regs;
 	int				ret;
 
@@ -291,9 +291,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
+	priv_data->pltfm_init = device_get_match_data(dev);
+	if (!priv_data->pltfm_init)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform init handler\n");
 
-	priv_data->pltfm_init = match->data;
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
-- 
2.43.0


