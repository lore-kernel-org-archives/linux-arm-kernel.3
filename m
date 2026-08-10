Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5719C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XuOFmpSxIUqcg85hLaC6GxN0W6+YOQdgeADTCLYqZY=; b=g+YZzSTaQHi73+5Mb4Cv4gYtvT
	vyEp2aqNW5WE8cFKki3l6HDJsBIMPPeMX1O9O3lmcvtWG/P6/7EJaxpzt3hSDmslq/RY0FAHdEwyD
	z83/kj+RckXKwFYmL5BhEilupYkDZuDDg4Lc18EJwVuYs7/7jwJvI5Kr1I/lQl2jXI+N+TamGvW7n
	CnOWYiVQSGXlwSPRlCGBh2VMK5gDto5yd67qxYKuw3Y65/g+JTFoS+Wt94anm/dp/h2NfmiDxHqvX
	daD08Jm6t4uxPD3/OyU7DEdHBE5oypQE7kprT8eih53mN0d8OBj2OUX6C6i/oLIId8WbzuzlSi/Bw
	hvTMMFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6e-0000000CYoB-1bsa;
	Mon, 10 Aug 2026 17:48:12 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtU6Z-0000000CYl3-38TG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6zFr5ECCwBSjUFahqdMi7AVEWnORS5c3AJNBSgy410SlzaFYtl9J5WyQeSsQRaBhAmzK1+Qaq/jVhm0NWiMf0/RliPff4J2cq5b1StfEIIXHcrzy98nS2KdmQUesaiF8zBREWMC3ab2kHsb+CL1wmIE81AYhlmbsiWzYx4BjGl7PQNLfWmFVHI7a0DjOL9aj0DM5kFVV1Ub23KRprvIFj2acZeP+9bVnvO0dEGKegV97iLqNM2nqtAyg0lKH2PgGaspZ6H+kYggGAE4k57S6nDACUeR0wkz7XBuaCcpkj/0Ky6LDKQLmegaSQHes1+nWBrMrp0k1KcnEzYuBhagDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XuOFmpSxIUqcg85hLaC6GxN0W6+YOQdgeADTCLYqZY=;
 b=ppGBu3/xH73Oobi8F9NhibpQA/Ehih91AvXCHGXDst6lKoX6Y75FiZ8aYJu6DahP5N2HJ95t72waDo8KufAWlsfa49WkvOkHxd5wvDFtrwR4LBG55Hg6ake+4C1wn02R3onQUfGaX00z2/LTH4uK7xKmsGzcVvufN3fke0+HW2YVQ8sRC+yYUq/B8mX1vsW6S/aQdzWA8DdVYt+JWs1+6wuddB+nTobi/cSZIr/7LmGoI6gLzhv6xYag/igjMJr7QAXnlBti6zTG2YGQbw8oUoH9Y7OyqyKyYnQnicOyfzXwHbmezJjywqQPWU1+IeaiL0M49THXFT4AFz/6SZYcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XuOFmpSxIUqcg85hLaC6GxN0W6+YOQdgeADTCLYqZY=;
 b=hKt9VS46GWHqrWEzRYGDc9+XFA79/WbUSJCpd3MZo0kvw1nvdiXIE0tuzhMAbNRCpUVIrV5VbYezHxe8SqR8Vpeg5KFaI78xZFt1dMFO8AUFoCkZG7pK6itKoU3M91zrQ1guJI4p/2evn26lfJX/aiLbpTmCSCU6nnn8ApFQXwk=
Received: from MW4PR04CA0274.namprd04.prod.outlook.com (2603:10b6:303:89::9)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:54 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::95) by MW4PR04CA0274.outlook.office365.com
 (2603:10b6:303:89::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:52 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:50 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/5] usb: dwc3: xilinx: add platform data struct with init callback
Date: Mon, 10 Aug 2026 23:17:10 +0530
Message-ID: <20260810174713.2325292-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4019ad-d268-4b68-664c-08def707818f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: OHyapW8r0NglwyYN6L04f23VAO/WmBU0z9vxmYkBV5DKFEPzBNMVyq59gymOPFJOqL5pO8FfbYa2hUGcnNgDLXMiiDg5a5BqJKDp0Qg2De8KWbxpxtrAKEk9HwVNgCRfZho0ElW6BQ/ypghrSu2szFWuje1qbOHsOdWHE3CEcrh1DqgBxPlWfmo7pwl1wlHTGZKOZtVdj1fd+vLeIZIY28Qi7vpN9jzqJMGAjDuAlG74ZNRP7BuFy+Il+14MvQozEXGSpJ4EQ4fM2fLuyW6oH4fdCfRCu1P4hQ10+YzWAy2Z93bleMOg8ZxTN61Cqx319ghEahITOnqcGbl+ULmTB2HoUPM22GPzl0tYgORC9eNQmvrEiPWN0Ya3YD02cs4GFPkNP3wfHc/7q2rOdkD/GkSfRteSMAw1mKZozpi/DXVQ4b7zLLeiLRPGRgn6jFDLFmVG4qD3EdMUB9UbHlGIS9VFsUlyfhfOiktq+dVwpVB1Fuvteef30z5KBZdfPCtdAfK/ZKQCjh4jaJn6ThOoWHXQAscjyeKR1PWzVAPE1lcTT5NlrPBwf+npxZKkBN64JflcxCS0lk3qWsBqmUMpIt8LZmGPFXUCDlKdTUjiGa2f1U6Hv12U3ZrG7k/vhw2SwvcNNk31x3PtNVOwHgW5TvapU5Q+b3jnUuh5DAwfuumoJlFsLA6uAOVG1IXIdQwnNduHC0UoBRseBPm53Ehd0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nygLdrUAqWQlXjvpzdNllWrxg+0Ur4yGuD23mRHoZ7WMAS5TFiqKsnsuzjefGSNkZJyNX3SEkKGuLr7Gk71nt5c+Wgcq6KTEVgJPCX65tX0JTv5K0XBSLe6c2RwIV18cNndrBPRtsmwQrRw7KKrKtWD8BREDk8hvg8eSxsmSXEbg6juQh4p1dWkPX51psEW4fXtaJp/LCSQAedXrKGTia40ZnzDrau0UqCF5FnwchW54ObUiPI+hWWYddt0IP+AyY7du/Tmo9+MS6A6s63XYFTXKHiSncc1ubwFSkZSoPSXlxhpFdp2SAllLMI4irUvAjZ411RC36TdYnbPm9NazarGBMA6LSOsUatAye3iQBpUny9hiTfBYADDkF0pU6YgoDU8bhLfaCY7r0JuSN0wmrfouDcbiO/OpDsCvSiFvS8iaKJDAF4S1tFdsHHvxeWl4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:54.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4019ad-d268-4b68-664c-08def707818f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_104807_806144_A38CF07F 
X-CRM114-Status: GOOD (  13.16  )
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

Introduce struct dwc3_xlnx_platdata and switch the OF match table to
platform data for ZynqMP and Versal. Probe calls plat->init() for
platform-specific setup.

The struct also reserves an exit callback; wiring for that follows in
subsequent patch in this series.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 1a8619854d6d..4a04d158f872 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -42,12 +42,19 @@
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
 
+struct dwc3_xlnx;
+
+struct dwc3_xlnx_platdata {
+	int (*init)(struct dwc3_xlnx *priv_data);
+	void (*exit)(struct dwc3_xlnx *priv_data);
+};
+
 struct dwc3_xlnx {
 	int				num_clocks;
 	struct clk_bulk_data		*clks;
 	struct device			*dev;
 	void __iomem			*regs;
-	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	const struct dwc3_xlnx_platdata	*plat;
 	struct phy			*usb3_phy;
 };
 
@@ -237,14 +244,22 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	return ret;
 }
 
+static const struct dwc3_xlnx_platdata zynqmp_platdata = {
+	.init = dwc3_xlnx_init_zynqmp,
+};
+
+static const struct dwc3_xlnx_platdata versal_platdata = {
+	.init = dwc3_xlnx_init_versal,
+};
+
 static const struct of_device_id dwc3_xlnx_of_match[] = {
 	{
 		.compatible = "xlnx,zynqmp-dwc3",
-		.data = &dwc3_xlnx_init_zynqmp,
+		.data = &zynqmp_platdata,
 	},
 	{
 		.compatible = "xlnx,versal-dwc3",
-		.data = &dwc3_xlnx_init_versal,
+		.data = &versal_platdata,
 	},
 	{ /* Sentinel */ }
 };
@@ -291,8 +306,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	priv_data->pltfm_init = device_get_match_data(dev);
-	if (!priv_data->pltfm_init)
+	priv_data->plat = device_get_match_data(dev);
+	if (!priv_data->plat)
+		return dev_err_probe(dev, -ENODEV, "missing platform match data\n");
+
+	if (!priv_data->plat->init)
 		return dev_err_probe(dev, -ENODEV,
 				     "missing platform init handler\n");
 
@@ -311,7 +329,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = priv_data->pltfm_init(priv_data);
+	ret = priv_data->plat->init(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.43.0


