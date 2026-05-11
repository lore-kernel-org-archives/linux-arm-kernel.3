Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005CCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cG35ACqT/FVNtqcO7uTsy9EdWEZOE5AWOCoQmz6mPM8=; b=I0PJuY2ZTzRV4uM6USl7XwqJJf
	lNI/y6VFd+3+JPauaIE4TWb14DCW0wCZ2wDNgOFoWGTmrBV0X9+jh9XWYpa8gQC3Zh5xc6UQPKtJK
	2w5riL9/szwYHugN3M0RvIZ5+aRktq2F9CnBlyItxVeOAg/jpoQ5kJZINF+WN98Mimb8aWNVmyP0x
	+MUN/dxR5FCX2J1OPc3+GK3iP4cQs8Yjvcxv7gdoiDHHvUmrGN3vNRYR13fjGzBGZhFoWwE57B/ME
	15UVCJPfs1NlC61MJTi9IB18n0LRBW54vljl1rIrPrq4rYzwicmLqImN7IZK2kSgQExXUiXvLmc8B
	35+9Hk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBs-0000000E9iI-0fJk;
	Mon, 11 May 2026 16:09:08 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBl-0000000E9ew-3f02
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtIaTvMKhS6R4tsqzI2g528i6zQJK7irSqWXrY7f9N11FotOv7RAvMSkqIGFYaeeACwdQ9/mIrWbbpkEJFGgHYgKFEKxFhhwWkFWRDfiL7+hP/tPErnWR+/LO1N6qf9PzYTrckSNgr0lg7KRrX8kz5mjnFctUjrL7HZ0zWhg79vqLGWVIscr4xy83PdF5fz1g7vST1vb10k+jk7GfJJkh+DD6E7pm3LxEBioSTSFIKo9kntVVO9M3FY4LtPCiCeQ3b7OcIev4fQmpsifBtb1u02IgUxwwe2mWrCU+dG94JxWCPkQ74tBpKpOPIKcOOfsK0TUK+3J1MGLCOWI5OIyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG35ACqT/FVNtqcO7uTsy9EdWEZOE5AWOCoQmz6mPM8=;
 b=ZFpn8YcdPT2VAfK+X6l62y9Qhppg4/U5aZeYuG4hp8ht0r36TT+JT6uF7g7evXRQtPrcZRZaZLcRWiBFV38KkL+zK823HI+rSqp51RoZ49g2LmEuQqiI6maYNk7DwmN7Ir25h5ttyok9XUuSiYoiICCDvnT2+q0OV1Z+jVoxugcHP61/FGPTuJPRCTZWUSjcEZO8+9SA1bxrEle/lmfAIUKzuZZ7uMGlcvwrDKin4a3WCXzQ98xx3q7mwcjJoMR90H5yoy0x1DTD2TsAVQVRQjHlwhEANXRdFJsev6Zq7lN09BXA9lDANjVmEjh/u3si2tC8rXkWG2ThoHZHJbv/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG35ACqT/FVNtqcO7uTsy9EdWEZOE5AWOCoQmz6mPM8=;
 b=ri5SD8pfJBWNIyMWGqpYPHlISWFofqOCCx4hbXZ9FvEd1rIkGtPuoXq1LUeNdO5dahM94/yduToVY8il4+S1LkgZ9TSjJiyPlB3V2fZh3OixpakAOqCg1FqP7mnbyCB6Pv6l5VpXRjftDmaRjS5Rcru75nqBkjxtIRnricdUV54=
Received: from BN9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::28)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 11 May
 2026 16:08:54 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::21) by BN9P221CA0005.outlook.office365.com
 (2603:10b6:408:10a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Mon, 11 May 2026 16:08:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:08:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 09:08:46 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:44 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 3/3] usb: dwc3: xilinx: fix error handling in zynqmp init error paths
Date: Mon, 11 May 2026 21:38:14 +0530
Message-ID: <20260511160814.2904882-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: bd34c352-25e0-4a8c-c825-08deaf7797a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 58Ja7m4y3fq4HuxufNK0tOOqLyk0w1n1jbszYLb2BPVWnJb3PM8i92Vzqjm7pSRIBJ1h1F9f6tf17FhvqW9ee/1BaKPB+6l3mDfO0g2+bStoJgGH/G0GOsVfOV8DSCmIhPWH88FYA54mRyBOkyXmDupHKafENxRiv/iIbto20m3gH9t86YdcEhN/ubffu9p/A6M5rLX/8MIpgByI4Vu9DKDYSXaE4PHnt1RhB3R4CJZ6fMiP1P4cNGEpgAUcfTZzDOLmJCLDoWfZm7AiWB+ooti5bRtkaKQjaF/zjursgRrfdcbc8MubgeVFmXbLb+/cFiTnWfuozw2xYUS3zCTO1K4+YwaX2Bn9iBnXCdRiKQqa7seOLLkFvLCES9/Vm2cRM8yGtb3fLH8iYK+ApxY3433OZSlqdmCI0X7RIqLpaB5VzGYlbnijdE1MZeSHLFTolCeAWchD5czM87M+VUnZnfwxyHVI+QLfWMsV4iNTL1HNdPtHkkbbKISxrZW3oEBzxfgpJpcoXIA7m7lS5cpYV291Xxq3CvqJkXZ/5+gMiMXToxHdEmh4m/+cky82QD98lZi7d5Exuj6Gc7fTs62pZwQMiInRl5UoZ8C3NRZlgXSq4JbDk5KLkY42U8I7GKHeM+7zATyp5wP4GWGPfXJKSvdHNUMRMbZQFEFTRaMthK01pCmkF/n6An1e9MC8xMvIq1IQWMh9pGYUbL3w/3FeFtqt/57T6/kMnDFc35jlIzk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kk2KipnSM441Jp4SkLTMjHOVZ99z5RXRXH6rnbGyYYiN8WExQAKzKKJhJ5sQDQpo0yyo6TkQpowHNvd8HGVaDBcC7rYMOJHXo6rTEiL3d+ouD9Pw1q80QmxZhdQupuFELzqTMcUSwJqBds1ikftxhQbBy+oC4sdu8pbbMFSh9JYsu7LhOaG4JxlC9qC6He06Cxw+4Q6Z6XsvMQb0Y2xb53NJ9jm+fNC7SMYjfSNbvJMyEqrcRzDAhXiJaqLEAFb90IrymTZfXWcrbnssmBiXY1n9Zgs8tvKlqrloBqbPjHbtcP1kQ88+GrwpwnaSMLx/rULrYFpk3pgPWQTlbY8ia1dOACnnaAAcok7iQtHxVNX+VyZtJABRFioaM/GD6HjT0ruU3TPlPb3Kl32DTqUu1yeafMzJLZY1yZBCnk5K1aaZSw/za+4cN+1YHkXw9gdS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:51.2629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd34c352-25e0-4a8c-c825-08deaf7797a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090901_918786_E1A0F8D9 
X-CRM114-Status: GOOD (  13.41  )
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

Fix error handling and resource cleanup i.e remove invalid
phy_exit() after failed phy_init(), route failures through
proper cleanup paths and return 0 explicitly on success.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 94458b3da1a0..b832505e1b04 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -176,15 +176,13 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 	ret = phy_init(priv_data->usb3_phy);
-	if (ret < 0) {
-		phy_exit(priv_data->usb3_phy);
+	if (ret < 0)
 		goto err;
-	}
 
 	ret = reset_control_deassert(apbrst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release APB reset\n");
-		goto err;
+		goto err_phy_exit;
 	}
 
 	if (priv_data->usb3_phy) {
@@ -200,26 +198,24 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release core reset\n");
-		goto err;
+		goto err_phy_exit;
 	}
 
 	ret = reset_control_deassert(hibrst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release hibernation reset\n");
-		goto err;
+		goto err_phy_exit;
 	}
 
 	ret = phy_power_on(priv_data->usb3_phy);
-	if (ret < 0) {
-		phy_exit(priv_data->usb3_phy);
-		goto err;
-	}
+	if (ret < 0)
+		goto err_phy_exit;
 
 	/* ulpi reset via gpio-modepin or gpio-framework driver */
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio)) {
-		return dev_err_probe(dev, PTR_ERR(reset_gpio),
-				     "Failed to request reset GPIO\n");
+		ret = PTR_ERR(reset_gpio);
+		goto err_phy_power_off;
 	}
 
 	if (reset_gpio) {
@@ -229,6 +225,13 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 	dwc3_xlnx_set_coherency(priv_data, XLNX_USB_TRAFFIC_ROUTE_CONFIG);
+
+	return 0;
+
+err_phy_power_off:
+	phy_power_off(priv_data->usb3_phy);
+err_phy_exit:
+	phy_exit(priv_data->usb3_phy);
 err:
 	return ret;
 }
-- 
2.44.4


