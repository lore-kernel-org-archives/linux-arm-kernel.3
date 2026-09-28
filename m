Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD77C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2BWagMlJqfAnZVtyLhu5DZce63V3CohG05Si//7v8FI=; b=diUvWMSvKnUSu1oS0J52S4bPWd
	2RlvpTgyv0rOfvVwX23kNhoyYHk9bB2IWCBG+94yJ7YlOROW3/qwE3ZElC82h0PpIYxd2lZ5hFbJy
	rTMReG3CnhtzlIBN6hVcx/wup89CRS2Oh0tKKqHXGM7uEYIv43feyorMZIEHT3QPbqfBE/peuoZqp
	AB9C1aRnIg6SsiEzP0931qdz46mE9O9omFJDlAWObp/C1kS8BxJJ6IR8SwZgBg/KRUZN4TAmsPxn/
	jDaFQLcBWoWRHnPKG2RnjWku8Y2T5JEH+sOW0zCPBQX43x0dVkFSSX0LTHYz2LVPMOncRfuUNNyVC
	Xtky0kvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBcu-00000000gWX-4Bxp;
	Mon, 28 Sep 2026 13:42:41 +0000
Received: from mail-westus3azon11010034.outbound.protection.outlook.com ([52.101.201.34] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBco-00000000gUJ-2D3j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs/0lka33XPmCTAyQuO7GIS+ya8hG4nvyY51P8XyqZu8YO3cYSRNI0CZv5Fo6wFgJXO7wLKFQcaho1ivs9hgxzubXpU1RjA8CGyVXjoG2aK8ek3ylFT1IX1AoiAVZQFzx9HCNukzKwHTIfk7IvD9dA2weqbZEwu9/KnUJKHTQUvrYE8wQnKxe4Wl/wu7bBn8DsE0t3CIv5ObEJYDK8dBuu6ZFR4LqIet3yWdBy0o3H2XvXHqnOuGHRLBfYWCbiHGDnt0hTWMXWIa/z19908rZQJXaY93Ye8UGceDod3P9qQM1Tf+bzq4+KYwapu66Mj9y7a+jG34hTg3foSpqfUYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BWagMlJqfAnZVtyLhu5DZce63V3CohG05Si//7v8FI=;
 b=sFzERzRDwdpJjuBFxYExEBoe0bJGGw3rjzy+eLpDKox664g1z4pmuenMu9WKXUmP9B1CdGxgrZ7hHc/xkyGrAbZ/6idVanePa5jT2GoBtX3846aL4OlyzGi39wuQIhW2/8TGqNXXkyEKALcTHCKIHW2l/moy0w/ceEkLomMKEZxNiwrfaC47NK+Iz/wyZSQPnHGXBXenaNEsbgYdJ2p5oGOvN7J/h4yofWQ+Ti9q9t37INyzdM7yN4U9WrjVEnM3X6BCBCXK9We7bnLTr9e9SbdBtaz0zMP5m7tQ2B5UO4wM9iTmXPy52AwfvygXEpuuxE4lmLLoD+zGbaOk1m/hAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BWagMlJqfAnZVtyLhu5DZce63V3CohG05Si//7v8FI=;
 b=Bb7PooCEiR9XgHWIoX+A+lF6gCSjkX7ewJVHjafoSD7bSVk+nOt2STjJuLoOv3p2HGHBe5P00wMLbHuSuoIXCb0NFzwWiJtYJvDq2T/l8qXARrjI1IlxO3DLpucPOjIrQR4wDdzducUd7sEtwW13ZscfU+/wXsU9JPAVua9S8LM=
Received: from BL1PR13CA0251.namprd13.prod.outlook.com (2603:10b6:208:2ba::16)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:42:25 +0000
Received: from LV8PEPF00000059.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::25) by BL1PR13CA0251.outlook.office365.com
 (2603:10b6:208:2ba::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 13:42:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000059.mail.protection.outlook.com (10.167.245.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:42:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 08:42:21 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 08:42:19 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Mon, 28 Sep 2026 19:12:15 +0530
Message-ID: <20260928134215.3194328-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000059:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fed5be6-c083-4342-54a7-08df1d6653e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|6133799003|10067099003|260925021911599003|260925021311599003|260925022911599003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: lezRrZijoLPr7BbR/IGmxfnLDMO7OMUV5aFdmFYwiD6Da1lAQtrfagTDLS4OnxeVf89mbaSCxk6M4KhFhMQsRwArXjzwjUq1N8nxZ1qv/ykGrhmvvAWU/aLksad8hepvBWP8pyb5BtT0QhKcI21Ff7sCXAgGs0jumGMlV28OrdhsbzZnGcNfkGrduLTvcZQpZGsg6Zlit69ICXbUSyfp9DOaAobfYUuxjIzBCJZvFVQ0i3bx7P1k/nbfW2bECHEpdAcYD6P2UoxK/j/cREEywDZDJ3Bn0i2/EKwiC4DlL9PqtEr59kby+B6bMcPVbs4uCIURcVmybIj8DVHKOE9330Acb1QHTACt0DIjLE7M6KYhGwL2HLJn34FL+Zsrk2Z0GWlvhwmbhYpTyudTC227TEbpeLEVmlmxofAk1scgwAjNTH86Mt4dLj8sxI+PQHc8uAxmtGwPJUieabc8qv3ohDH9mRdR6bVTkOekFCHczXURL6IG9mcLfyvinhdMWZcStdnENXD1NhU9XoEi0R+3vr5v51GQOssT9zjNy4aJOaqYCzoibGsTd8/a1ebT+dSA1Phb+xWe8RX0O1gQyz+lTZ1s0/V15TRsWS+6tQEoiHG3M8czOhGVUFQDHiWbGXqeqss6ZCgyGpZuiLYBNUe9c2pz8FkSkokh8TQLpz/fdEyBD78tbXIT4qQjy/gbAkIpmSM0ejur+A8XAGGFlP2i1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z3jRkGktL0+svlqap0ickRx3rP4tmULg7FLpbYETo0uwvOJYQwOwgP35t9XukAUnIM+uPP4lV/nOV2ZNviy7MS5A8EPzNcGIvWWRqeiIW5Ibgw06MyTgpVWQVijGuhETA8PFp7HQk69QVC8UgthZYx7ms/I+vGhWuMlBePUzcE0qVyC+wv41FcSOj1TADwzt/lzTninwGYGNfiRHMMZMy88O9WNw5MdsqmRoeZgrw6YNr/fqAT6UqtwXmz/hGhm9HcZjj5v3D+5dr3GfZK4df6qZubaYqztlqYhhhbHyZjusw9V4uyR7FVYZMom4Hc5Ci8JSyRXJ1dK4vww+pXWKK4rRkQz0bw0ZlpGeOWmTkZTLAdt0vhBWv2P/1ICqQybN8hsa+AaU/je36gnANywxUdka6zjq3w8MnbIkb1LYOr3/aGIhQzlulk+4cMUNU1eL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:42:24.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fed5be6-c083-4342-54a7-08df1d6653e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000059.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064234_580075_BA4B4B4D 
X-CRM114-Status: GOOD (  13.10  )
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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
Split as feature patch for usb-next from "[PATCH 0/5] usb: dwc3:
xilinx: error handling and teardown fixes" series.

Link to v1:
https://lore.kernel.org/all/20260810174713.2325292-1-radhey.shyam.pandey@amd.com
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
 

base-commit: d58dffe9ee2c8883193959ff4ef995ec07932874
-- 
2.44.4


