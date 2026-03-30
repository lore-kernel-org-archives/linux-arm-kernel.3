Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E933F1061B1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfjt+/Nac1Cypu0qPqtp3MMvLDOEJvWIzqEKaR++luk=; b=ifEY8Fu9YBbE4jblczOL4P3U7J
	im+JN3101+Y5KCmkcp1MO9Io9nfWpkSeiSsHOjGFMj2+64uSFnjrXSugfn57Aq5yXJydfunUaE/lP
	xxP12dzkgD8gP/lD+1GRz7yZhfUcUdy5Pd4GKgCb8vnIbrLWhi6XIeVsSvSqp/LDEF5Q2tIJ+e+aO
	w3xlYpNg+Clmm/FLcvbfAzYAuG7WmctnPgqSXvTkLQahtd4HXA9SUDw9oOYEUof/6Nd8OqdDszoDY
	AZpwUlFcwpbsHt4LqqB5XdMEk9jZmlpooTRUs0kSkLGutFx4vfMOLQfOsDZlCDLw4FrdAJ1/mUg6c
	WJPERA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hu3-0000000BlUn-38Bs;
	Mon, 30 Mar 2026 19:03:59 +0000
Received: from mail-eastusazon11012044.outbound.protection.outlook.com ([52.101.53.44] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Htu-0000000BlQT-3B8w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 19:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqghGuoQMO9MNi/LPXp42Geh3TWrF8hld5Wm8TSmv73Rm1epIgFMW3xXdp8kLWpSLLh2EZfuP8Z6t3Zswzn8nRhDCOMS2hwO687+PptUIkXuZ9Ety2NgYmJqYq2pFaFb4f7C1g2Otev2ATAmZ9rRLbU8PA92lHkWtkKIzA2LAXRwL7+Omx4T2U4NRVl7/Xbg1SQDp+Y69CrZ1VztMv7cWy8x95lpLG0rWSweTH5dbTErAJWm6XgfH9E07MrI2Af+5aY2UoEEMLIJdCZMjSIEk/bdrz2qzOZ5+p4l1/HJk0uHQh3RBNA4zRrNFr7g2hFqGksV4mbN2xNvJNJ04loNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rfjt+/Nac1Cypu0qPqtp3MMvLDOEJvWIzqEKaR++luk=;
 b=sQgZwrqBuWN8A0uoUgePITnlBDNMhC3LgMDl4upqQgydXjJWghm0RhB/ccihkBjZI9TPrdCCrqIkLwn8a16vjsnM9waeB11r/B1viD0ew4qOQIjY5ejCuZcBETXXm0Dr4SFNmSAGCkAqNjvqNT6O+75jwxSq/EDO6cfVL0reZ+NgF8cdEOolsBZouq3R6UjAE+lXRIAOsGGtGQcXZIHmwtPOGYqFtK6jX5AjkQ407K0smDvhHxGvmIyXyv/bfSHeVY1pFaCa8/JIKJf8IcC6iHUTsd2Rfl7WK1t8W/GAGR8XJT9hwKpXm4Uu/s5Qll47ybs9LD0tB78KvFy5JdQhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfjt+/Nac1Cypu0qPqtp3MMvLDOEJvWIzqEKaR++luk=;
 b=Q11s4+KlSOkNwLhD7lAeD1RMNUI4IGPtTBXQqj3F/KEyJ2+E0r8HU/i+3lOUcyVx7T4QKK/N7vj7TsPo4RKYTuR7m8t20kPR2vj7qREN9Qcxa58pdyu9Hi131KUzKVJ5O3lIr46/WTE7VSR9VpI83zpOrzcWeifHw2w/1Rsl4V4=
Received: from SJ0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:a03:39c::6)
 by CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:29 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6e) by SJ0PR03CA0331.outlook.office365.com
 (2603:10b6:a03:39c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:26 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:23 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Tue, 31 Mar 2026 00:33:03 +0530
Message-ID: <20260330190304.1841593-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH8PR12MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 187c7c3b-97fe-49d3-918e-08de8e8f073d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Cb5bvisdnrmPQW6xqER0k3LVD2CtTZhPMe8HVk/oT+v7NYq5uwH5NyYUbDim4u2BI+OhCFDTlewkmLPJ8MjQm1hYrDZ2FMjkAI1t4aMyP4OykEpYDfido1z/AmZtdv85cRka2mH6MAVA+p7zY36BQ/kWbEF3xScVbzzz34k6V41r1NXnLZ9+s6T6THWRqUSU+ouU8bEkPhxEa8wM3DrsO9SJRYnG5EifAMbaywqLEzxFhFSQBJzmGiP90fVRwpY+19axv3/RtVJ/1X+Q4R0pSbDNHUm3zwt2F0oHXudkm4+YzIPSjo0Hp48++GMkMrn6cxfzorgVmKeLVloeWTZv10QBl8adbog0LN/WK5iUIWDnM7vMv+HieU3caw/9WAu2MpCut1mBIvaj0ICw8i8Tp95SXdI40TF7cIqInEpA4A4oNnOQAwgB4boDpCcXp0fb6nEXRSNG+I5kuQ5t4gFUly7DFr06wXdwyRNHMr5kXJo8opjsICS5EozIN+C4VC0dgzmLIxAH1LhzOIXhvfB/tIDY4lXXcwvpiWLBBHIVBC6oxS4QLaZddCh6T3EkRzX0MIUFwXPwm6ttoQu7vEJ3ycujjZQxVNhPEvuwcC/o97KuA8VuGdeZVSJuWQsaiPAh2X5FjITrrUvqDDs6DLLXTSsUGBxNFs+ckOYwFFVtComnEH5vBQnA/lCbETmCxWRqSabwGRkf2yOOJOClCe39EyFuzJAGxSix3fhJSX0JYlF306Im/aPcmeUfli+KqYdSM0fcbnBi4IA2Yi8Yfzbe4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: spjZCYU+pffOZzLQdTGa0wLMfnCAnd5i0WBkq0VxxqLkX2YIAcX9EgvYWvjoMUOf2rkeZh2+Q4O9nAe1cSfjson2I46DZmoJFXHrzGS0DXoROoXJ2rgS6Bg1M9dOhnsmec6Pk6z/Nu+Av3V+jkTOxZV/N/vGpFVAuf0DE3pVFqPBhD1Og0N4JLb+JCGSM4Yx4Qfh+zP7DzkNf4Zzy9PYPr5t4S00B4Tf9WyjEv3mN1cr6VxGNvJdkW8mhsKjfDLjOu8Bw7hQONqCoHUfj5aqRchr8kp5fOekzlzc1jDQkCKKNWsnmKt2V2i/Th58i4/NXzdUYqOBd9GUhzy5TXWFU5NsokooQZOJezrRzyv087Ep1mCLtTUpDkbfCvuX1jK+72/nkdJJBIOHPW0FC/fry0USa5xEjUhkE1RVcpsgWVMFYnGYLZw04LSpQHvMKhmy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:28.5017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c7c3b-97fe-49d3-918e-08de8e8f073d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_120350_798352_D32E573A 
X-CRM114-Status: GOOD (  19.63  )
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

Multi-media integrated (MMI) USB3.2 DRD IP is usb3.1 gen2 controller
which support following speed SSP (10-Gbps), SuperSpeed(5-Gbps),
high-speed(480-Mbps), full-speed(12-Mbps), and low-speed(1.5-Mbps)
operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. The MMI USB controller does not have a dedicated wrapper
register space, so ioremap is skipped via the map_resource config flag.

The driver handles clock and reset initialization. In this initial
version typec reversibility is not implemented and it is assumed that
USB3 PHY TCA mux programming is done by MMI configuration data object
(CDOs) and TI PD controller is configured using external tiva programmer
on VEK385 evaluation board.

Tested host mode with mass storage device.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
- Introduce xlnx,usb-syscon phandle to access UDH address space
  which is wrapper subsystem IP for USB, DP and HDCP.
- Split config struct refactoring into separate patch (2/4).
- Remove unused regmap/syscon fields and parsing code; defer to
  patch that first consumes them.
- Fix error message capitalization to lowercase ("reset", "deassert").
---
 drivers/usb/dwc3/dwc3-xilinx.c | 50 ++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index bb59b56726e7..f2dee28bdc65 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -46,6 +46,7 @@ struct dwc3_xlnx;
 
 struct dwc3_xlnx_config {
 	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	bool				map_resource;
 };
 
 struct dwc3_xlnx {
@@ -93,6 +94,29 @@ static void dwc3_xlnx_set_coherency(struct dwc3_xlnx *priv_data, u32 coherency_o
 	}
 }
 
+static int dwc3_xlnx_init_versal2(struct dwc3_xlnx *priv_data)
+{
+	struct device		*dev = priv_data->dev;
+	struct reset_control	*crst;
+	int			ret;
+
+	crst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(crst))
+		return dev_err_probe(dev, PTR_ERR(crst),
+				     "failed to get reset signal\n");
+
+	/* assert and deassert reset */
+	ret = reset_control_assert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	ret = reset_control_deassert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to deassert reset\n");
+
+	return 0;
+}
+
 static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
@@ -250,10 +274,16 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 
 static const struct dwc3_xlnx_config zynqmp_config = {
 	.pltfm_init = dwc3_xlnx_init_zynqmp,
+	.map_resource = true,
 };
 
 static const struct dwc3_xlnx_config versal_config = {
 	.pltfm_init = dwc3_xlnx_init_versal,
+	.map_resource = true,
+};
+
+static const struct dwc3_xlnx_config versal2_config = {
+	.pltfm_init = dwc3_xlnx_init_versal2,
 };
 
 static const struct of_device_id dwc3_xlnx_of_match[] = {
@@ -265,6 +295,10 @@ static const struct of_device_id dwc3_xlnx_of_match[] = {
 		.compatible = "xlnx,versal-dwc3",
 		.data = &versal_config,
 	},
+	{
+		.compatible = "xlnx,versal2-mmi-dwc3",
+		.data = &versal2_config,
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
@@ -299,19 +333,23 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	void __iomem			*regs;
 	int				ret;
 
 	priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
 	if (!priv_data)
 		return -ENOMEM;
 
-	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
-		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
-
 	priv_data->dwc3_config = device_get_match_data(dev);
-	priv_data->regs = regs;
+
+	if (priv_data->dwc3_config->map_resource) {
+		void __iomem *regs;
+
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return dev_err_probe(dev, PTR_ERR(regs),
+					     "failed to map registers\n");
+		priv_data->regs = regs;
+	}
 	priv_data->dev = dev;
 
 	platform_set_drvdata(pdev, priv_data);
-- 
2.43.0


