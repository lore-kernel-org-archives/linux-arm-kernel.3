Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFpJUe6aYf+ug62zRFmWCOf55qsRIyRpcD7oLsdnsWw=; b=PZY/o07cTikUdMdVL/aCiR8Wic
	xsKmQVsAG+hJbFP6aNW50E3opDgTvcHwBNSaUS7EGPUL8f29pMXFGs+jFNPKxDsxYOpYZBaIirtRM
	Z3WTh5Tz2DphrRrvaI1noC5/SZ4YteLC/QybdBJbV2UWk3hu49BJGplNlcszJ9vjankuqK9HRiwPN
	oCPjH8W1YNV12sedLio6ymddZA0QRLezdwV8bSJgO3yQMX/fugxwu6HRaZDDka7kLvCEBhbB/8fP0
	lNa7M5Wf8uqaQgT2lxYM2Ap6Z8maUxDXmOdz8VbFgxQ8zZTJwEm85Yet5Kzsg3Ugzm+YcBLZ+3p4y
	76MU0VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2o2-0000000BsOz-2T2y;
	Wed, 15 Jan 2025 12:47:34 +0000
Received: from mail-mw2nam10on2062c.outbound.protection.outlook.com ([2a01:111:f403:2412::62c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1hj-0000000Bi0N-2FjR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE7vDzOLc7Nx0/QpPOBIZ/yhl1L7gufjMmLPkjgJfW06cKmRJ+S4LZa+VPd+9qD42d+WdBsJp06t4kG2bjafezyadktSSAK5P4bVz/wSyDFueeXs1YoooX63CnyGG71UYPapIeh4+sx8w0v2i4BXPh1jNf73ByvroU5F0tXGAM/StTbW7DBtvnN6gWY1Q3ySqmm9iqL3JEPh6wMATXqLjOeNdocbc3j8Aiv5xZ9AWpxpL5WP8otNyuyxQHWox2SHSY/9I9dkMKI85Q8v0qyHNvaznMZ/6UHP/x2LpXaije18c/7Cvgv6gTuYKIlurOv7V1TFqVXye+5qL7UdOO8Fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFpJUe6aYf+ug62zRFmWCOf55qsRIyRpcD7oLsdnsWw=;
 b=QndfcO/82jas3ArYPrBtJghg11xiInFxnmXl7OJCxhOhujBTgYrQHYDA9rcAmOIpGAU/uZRSufvoGW9NFgy11VZsyxAyv2EREimke0bisVlbHliWBGdHPBRfx6cQnhZN2u2QKsSHxv0DM9ftjJHJ5+Ol9h5uhC6nUK8xfZCmZ7rJG2eDmH1zqiQ76A36C7QlhK5h1GV0zOcGnLw9sPXfg5gJuXih+z117qBL7czvD+qtWgfAnaC8LlIa2Bnuhx0gAepUwX48LMDMd/Vjfna+e9O8G88ijYkS8FjXS/pxRgZVss4iUBra8h9F7nRvLOc9aZEBpVJPgenSN0+HP1CxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFpJUe6aYf+ug62zRFmWCOf55qsRIyRpcD7oLsdnsWw=;
 b=QP/jtPgUGEU/JRoG6yjptDrF4wL92r2u2Km0D9lkJiVZPzSSKkdiwPLiWpkpG91rDEfpaFckuADnpE4/PSEYJbHXoZ97E1v4aYhQZtF4hyxZixWVBfb6/77V62omuVQau2hCqXscsIKTReqsXi6pMf5tEasvc98gsBqFaRVdTpQ=
Received: from CH0PR03CA0419.namprd03.prod.outlook.com (2603:10b6:610:11b::8)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 11:36:54 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::ef) by CH0PR03CA0419.outlook.office365.com
 (2603:10b6:610:11b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 11:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 11:36:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:52 -0600
Received: from xhdmubinusm40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 05:36:49 -0600
From: Mubin Sayyed <mubin.sayyed@amd.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <daniel.lezcano@linaro.org>,
	<tglx@linutronix.de>, <michal.simek@amd.com>, <ukleinek@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <git@amd.com>, Mubin Sayyed
	<mubin.sayyed@amd.com>
Subject: [PATCH v4 2/3] clocksource: timer-cadence-ttc: Support TTC device configured as PWM
Date: Wed, 15 Jan 2025 17:05:55 +0530
Message-ID: <20250115113556.2832282-3-mubin.sayyed@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115113556.2832282-1-mubin.sayyed@amd.com>
References: <20250115113556.2832282-1-mubin.sayyed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a444fb-62df-443a-66b4-08dd3558e91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9KNkeH4W2VhIHXubCz0MSvgd2HBCG9rKU2KuSTHylnpu8YLW1KyCWqYtNdKO?=
 =?us-ascii?Q?XeTJCCBflH/EpK3slaUya7g/6bA7QKJi528S/H5uXyPM3f7aKVdbINvHUZXc?=
 =?us-ascii?Q?QmOs9w/C3hdm9VWytyWKOV7Bp+mBSkgwaxblAV8v7eiRj9BJiPHkaQwI23Jt?=
 =?us-ascii?Q?pQRAR5ezb88b5MliM1iDQo0F4KYsW1jAs9zNYQghXkWmAF5a0kOuHypTKT1k?=
 =?us-ascii?Q?mwJW42CnuKcByOKZHcdKi3AyRHUzhpqmGPUpw+CcDQAOmlLSngqzVAM8NAWu?=
 =?us-ascii?Q?VyLaKEB01gdfrgxk++pjX8L1l78T4wnpE3Cs0jTCq9ueW2cHVxiH49xF6LHb?=
 =?us-ascii?Q?uG9/Um/8JjDqYSCvu1ZwVBkuE2ohJIgIURmnWxwbAJG8sngCTh0vbVy1D23h?=
 =?us-ascii?Q?O17zpZIh0PVlsFDWNDNv6mK/sgdlPuAjBqtluA6wY6onioPFidDuSlkQYCIJ?=
 =?us-ascii?Q?tFoSOK7XWtHQ3mYzggig1P/k9uYgAb+4wn2xah/CjhPlpRW/EBQv8wKvwplN?=
 =?us-ascii?Q?LHpjBhQklb6TXobIJhP9DMXTFaQsNgSi/r5q2KZfCT+TxRi+tZXuz56+gFJz?=
 =?us-ascii?Q?DOxzSwHWDnlXHsWeXZdFF8Ojw7IGFeY4c9NG4Em2dGlLBGvts9QrvSkufXtc?=
 =?us-ascii?Q?S7xEJlS2/2wxg+kcSs1BA09TLpk8M2FMvLiEwwa5epZFoVYDWuMoV/kv5A3t?=
 =?us-ascii?Q?dOezGVYyzj8KZvgI+NmOJHoEhhIocMX4xpduG0GBokmoiJjHW/g4yOoQ9OWp?=
 =?us-ascii?Q?GLARetqGTLy5zR4G0pBKhIsRtlC1k2B3ofrTvt2OPeWzuqlzBiy0azbxjEVj?=
 =?us-ascii?Q?P0FkLGYJYoETd7SYkMfkYuuWpYa+KS1HAM8N+Qh+ztArP58NEjvrHpjq5KIi?=
 =?us-ascii?Q?I3plaFiykQ9k4R1i7RpPMaPgcePQk4HAHu8w4rRI9yN9TENkSw9PbOmu+gaf?=
 =?us-ascii?Q?D0+FkmMopyEBfvsS7C8JN20fdBsg9kGCbsFGlXie80pVN4zNpbJ1X3+VuQxj?=
 =?us-ascii?Q?lZMpD4MryAKYWPlV+jdl/yRWDFxSa53555D1Y/FIsT0cPtMe+459564Uz8XZ?=
 =?us-ascii?Q?ySD+JCq2uf1hZ2jxQpfY2sWaWaFVktL1kD5umNJBOSX+rqVclrgmZ0zR1ZRd?=
 =?us-ascii?Q?xxo1uspbJsfPq+K7MPBZVUU3KO7LV0N8UxB6XFQmu+zBW1zUg1U/bmRuPYAF?=
 =?us-ascii?Q?d84Y4VGUcxA87OlOsegnLiKp8dbPhQhk/mehGTrbW2vbo98bLa9emIyhSCRD?=
 =?us-ascii?Q?Jan9y9KALUafBGnikPJ/9ylue/+Y9xKGWUTuxNGJdQFsOxkMIKM0cbCYZMDR?=
 =?us-ascii?Q?ZIgkvvfvjoOfioPB9M2KHkSBs2zgW/pN9PjvEzFta/c7qAbIliBLwZK7Wypx?=
 =?us-ascii?Q?Rg/dI5MeM7nfS01AE3z1la4YAU/hm0ulLT9IADHqYzu5tby5sT8eafI5nOKL?=
 =?us-ascii?Q?f0D0dsEDG0AQAxoXG3XIs03uEc+RA8VgSDsLCUbrcG1Je2Zr4xXO0XXqvGvI?=
 =?us-ascii?Q?ljWip5slczX1BIQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:36:54.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a444fb-62df-443a-66b4-08dd3558e91e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033659_573660_8BF571A8 
X-CRM114-Status: GOOD (  18.10  )
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

TTC device can act either as clocksource/clockevent or PWM generator,
it would be decided by pwm-cells property. If pwm-cells property is
present in TTC node, it would be treated as PWM device, and clocksource
driver just calls probe function for PWM functionality, so that TTC
device would be registered with PWM framework.

Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
---
Changes for v4:
    - In case of pwm-cells property call probe function for PWM
      feature instead of returning error.
Changes for v3:
    - None
Changes for v2:
    - Added comment regarding pwm-cells property
---
 drivers/clocksource/timer-cadence-ttc.c | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clocksource/timer-cadence-ttc.c b/drivers/clocksource/timer-cadence-ttc.c
index 2f33d4c40153..c5ecad9332c9 100644
--- a/drivers/clocksource/timer-cadence-ttc.c
+++ b/drivers/clocksource/timer-cadence-ttc.c
@@ -35,6 +35,10 @@
  * obtained from device tree. The pre-scaler of 32 is used.
  */
 
+struct ttc_timer_config {
+	bool is_pwm_mode;
+};
+
 /**
  * struct ttc_timer - This definition defines local timer structure
  *
@@ -453,6 +457,7 @@ static int __init ttc_setup_clockevent(struct clk *clk,
 
 static int __init ttc_timer_probe(struct platform_device *pdev)
 {
+	struct ttc_timer_config *ttc_config;
 	unsigned int irq;
 	void __iomem *timer_baseaddr;
 	struct clk *clk_cs, *clk_ce;
@@ -461,6 +466,24 @@ static int __init ttc_timer_probe(struct platform_device *pdev)
 	u32 timer_width = 16;
 	struct device_node *timer = pdev->dev.of_node;
 
+	ttc_config = devm_kzalloc(&pdev->dev, sizeof(*ttc_config), GFP_KERNEL);
+	if (!ttc_config)
+		return -ENOMEM;
+
+	/*
+	 * If pwm-cells property is present in TTC node,
+	 * it would be treated as PWM device.
+	 */
+	if (of_property_read_bool(timer, "#pwm-cells")) {
+		#if defined(CONFIG_PWM_CADENCE)
+		ttc_config->is_pwm_mode = true;
+			return ttc_pwm_probe(pdev);
+		#else
+			return -ENODEV;
+		#endif
+	}
+	dev_set_drvdata(&pdev->dev, ttc_config);
+
 	if (initialized)
 		return 0;
 
@@ -521,6 +544,16 @@ static int __init ttc_timer_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void ttc_timer_remove(struct platform_device *pdev)
+{
+	#if defined(CONFIG_PWM_CADENCE)
+	struct ttc_timer_config *ttc_config = dev_get_drvdata(&pdev->dev);
+
+	if (ttc_config->is_pwm_mode)
+		ttc_pwm_remove(pdev);
+	#endif
+}
+
 static const struct of_device_id ttc_timer_of_match[] = {
 	{.compatible = "cdns,ttc"},
 	{},
@@ -529,6 +562,7 @@ static const struct of_device_id ttc_timer_of_match[] = {
 MODULE_DEVICE_TABLE(of, ttc_timer_of_match);
 
 static struct platform_driver ttc_timer_driver = {
+	.remove = ttc_timer_remove,
 	.driver = {
 		.name	= "cdns_ttc_timer",
 		.of_match_table = ttc_timer_of_match,
-- 
2.25.1


