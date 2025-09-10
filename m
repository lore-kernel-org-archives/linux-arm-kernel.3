Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7fT80WRRyUCWU3KT5ZP+dGisvztI07Fq/bHWrleRTI=; b=EAP5txmU+SEWdYfyEJzGU3z7VF
	h6C7Fw5X6t+i7S2EO1y8oXU9S452F+Ha63x2L4ImSRNAQBv9AJMXMfZV/9uXHxwjeQAsRq0r1vvGq
	J+Xc1P2Cv0SPlMm9F37vM6k9gt9108limd1r9UOHYdPucqu3b7fR95nfe1JHSkkBOcWAIh/xGQ3WI
	7DasGfhSI3LWmKkAPTOIg3znh7VaaaoIhIZvxsAnfcVcHdRw4gr+9M1f3pYHC+RDHM7Jf53Rmo77k
	D1DuIDCsRtca8uqAucbCT5n+g6miVkftHzYdP/CtUCHsr78TbrxjWCbH6gcQ00s5kJYqX9jqn4VI5
	b8rDCDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwE9w-0000000CGQx-3xKl;
	Wed, 10 Sep 2025 06:18:24 +0000
Received: from mail-db8eur05on20710.outbound.protection.outlook.com ([2a01:111:f403:2614::710] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwE9t-0000000CGQc-25zr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srkU5H2HwMXRI4itoLU2yNCqP3kaRTvdOBEjmuSMFNrMgRGgL2FtzsRR++859c/aknyCgqaNDtweJGsoN+67wq9XJmniYVQtL4+2/fNnc59gqBUxvYtMezBxTPLStg8Dea7Fe6DHa8Yd1sY28CE2Qb0itSzbpuFBCu2q70KI8begWQOSdyZ4pKzHPYaiOG+iLN/aXCyV49cmlWBeYTU3ZGmIFm64KOAgtE/7DiBCzrT9NkjmJ1lV1dSgNmWM9eigRVznnV5Vd7zTeDucnmB1NZzIvv6S4fPydMV5snbryQaaZfbfjne5ASzLOP6Slrk998lzMCP5YR1c9AWLLvSfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7fT80WRRyUCWU3KT5ZP+dGisvztI07Fq/bHWrleRTI=;
 b=tn/faZn/Tz87PIMZSW44iHA2FbOhGIka1RFiLw8Sy79bfCEySlNRm6OJOfE22xcy55NOPbu++UHg9b63I3WQ8ngmnazUqc45AXQXD2iThmGteWQQGfePLxTEhKtswKmBSH8QUU/flaTmreJ+JA/tU/i5UuG5jk8DyXUyWjGT/DDCuybHnCFxMqvk9wKzHf05+L2jnvMP4COW+KlxPZaWfjhR9N2JePI1xtWI8kFgoF/tnU1uZ97JMNI9VutfJ3U9s6q70EmSjhvHgs/zIk+JCsY3mEtjhPdk7s1/3Cel1F1OS+a4FteqW098ujSjOT4HAZpieUpcHARwdDX32KsWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7fT80WRRyUCWU3KT5ZP+dGisvztI07Fq/bHWrleRTI=;
 b=IRAzQN3naskZc5bXXD6pnHABxYpumb030zwQnLwcz/5PqV8m0XN24XApERaREDr2CfzNJu7fiPyt7vuGwRGJ7vc//LfnulGqp4DzgtHePXrvOf6eLL0G0tTEExJsIQviUnF7dScVJ3UYSPzSBHowKn5T0YheSXHBtrAB2lWuZNypwTvsHnaFMgEd9id/VAzbXL7G4Mhqb3G84J2pNtZpIQL6yMFhl/TqmzEGVxB3QsDfaDm3WGbbgLAFwTydBVmwIFgZIQO7pypWP2WvhimQrCdNRJCp1pmkSIcMAh7kUJyaUt8d0ohusPkKTcZzAFM+a67jBF1+aC+KDyDRnJynFw==
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by PR3P195MB0491.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:31::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 06:18:15 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::84) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 06:18:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 06:18:14 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 08:18:14 +0200
Received: from llp-jremmet.phytec.de (172.25.39.81) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 08:18:13 +0200
From: Jan Remmet <j.remmet@phytec.de>
To: <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mm-phycore-som: optimize drive strengh
Date: Wed, 10 Sep 2025 08:17:39 +0200
Message-ID: <20250910061739.9800-1-j.remmet@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|PR3P195MB0491:EE_
X-MS-Office365-Filtering-Correlation-Id: fb13ecc8-f434-4199-646b-08ddf031d371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2MftIIeZCoBwcFl1C3gUilpFS5fJjXjLwJvzU+h8dc8tIJxC3FbKw2gzRQ5R?=
 =?us-ascii?Q?3bI41EJ0Kbnd4H+GXrg5yFvY7tBay/DxNtJCmG3nPpXdm/s+2oENxIKh4keP?=
 =?us-ascii?Q?q/hzIm2762eZpwBXu/X4tJ9oXV5zQscxlj3hqWFfSW9EcDgfaoJr7b3cGqAH?=
 =?us-ascii?Q?E99ish5wKd3CXPiJks5VdE/KKHZhyBGvGWpNWoaeC5r+fc3cKhTCHSUFZeVj?=
 =?us-ascii?Q?WhZ0Dp+0hEw6/BnvrO+hH6VAmF7i0IuxEmhAGsjSXmFowPQc+E8AEnzqcybm?=
 =?us-ascii?Q?IIi5HhvBDSlP4RSVOM/Z5ZAoDjyHyTMskXi5nRhyvvOkL2Qqf8QsyytiPb4K?=
 =?us-ascii?Q?RVOGJT4y9xXZ9BwU0iJnI9V3IU/E6O9DY0Inxn0fUXXjG27W5ZcUgLCcjC6X?=
 =?us-ascii?Q?K0w5HtQ3HmsoK2PAofSpBR6/Q7UjV1TMdofWGJ7upgNqBNY9A45I3XoMF8Ge?=
 =?us-ascii?Q?KP5ve09WizmdnqvDql3zKsf3AIMW8hU/r7amo8+IzlD+rfbk7CozlcdoXnHt?=
 =?us-ascii?Q?UZIYrU+H1KDfbBt0nnHiho4LGQ3qB//CB3bbL+mXlIU55BDAYusWPFuhCi/6?=
 =?us-ascii?Q?sIFtKhfzd1v0TM30ldGeLl04dsHsm35FTukAlwqsdeVf/EFaUpYCM64TcU8/?=
 =?us-ascii?Q?Y5p31SxU5H/f9AzVZPlVdmEpUV1ckZA1RFiFhJbZf83RhusgoKRRtToIWTZn?=
 =?us-ascii?Q?I2vlZoeaO84EwBzYeuCmPQRlJdTQY5iyt+lBtBoxVa/Al6uWaW3ZAHy43OHe?=
 =?us-ascii?Q?/gqMaugBymCOXJ2bcNJQ79b+e7SUrGFOCMJgyYJ2Z9cixKLEto/U6ODt8OiS?=
 =?us-ascii?Q?DCLBhF1WTGRecEl7CDxIRVqRi+HaxrXFEDN5EnN242QmJaeq+VOinTF1jPAC?=
 =?us-ascii?Q?W+j+pZHH2hYmwrJONCxJyfFcMA7PIDlXsTUTIay1s/wIvnsBEa0PQ0DZes/n?=
 =?us-ascii?Q?BdzDZDhkJgD7AUdbVFJE4OWwm4imLnnPTWwMXVkVIpqCPM81EYPAnH9iDS5w?=
 =?us-ascii?Q?6JVhroy8+ukrfA7wKfFYXJ8aV2mKOE3UOoppJfFFO8kkpQCwjeGCkT/P55b7?=
 =?us-ascii?Q?qP7mTsXYZ/9G2mb8KotlCfMqg6yzE9M1pOm4o981XoHalaM/EHL9mZ+ipIdN?=
 =?us-ascii?Q?oux2Q88v1/Gv0DLdLroTmWD0ZW86EdAPhSRx3abRSHPgV0M7i6jc6e699No/?=
 =?us-ascii?Q?nO7b8sr5POP78m2ccMd2edkAxjAeq2soZH6vZxS2/WMkjmtUmxjIQ+2lZ6bS?=
 =?us-ascii?Q?i9Qh9TnQBitAB4AE24RxkBsEKkULEKhaZND4b2q0sAXR7ip0gqLzwB2legSt?=
 =?us-ascii?Q?f0/wKRcq2kbKQKpkYsf62zYbenoIQa/p4sjucNJlTcZNmRsAhX+zaPy9AiOz?=
 =?us-ascii?Q?XxS/gV4xhorsDHnze/CFSAMEc25DuqeneLxG/RU1Av9wXZoTi2xQLyg5luyt?=
 =?us-ascii?Q?7rb9RUIZ7ER0wXDRer80C+kou8qVuvKc1cqPgK4AQS/C065e7RwjuZAv9wo4?=
 =?us-ascii?Q?m2j9dQGa4dinLSPKGHSWOCCZekcLMGDTzf1y?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 06:18:14.7272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb13ecc8-f434-4199-646b-08ddf031d371
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_231821_852897_FEF194B9 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Reduce ENET pin drive strength from X6 to X4 to optimize signal
quality and reduce potential signal integrity issues.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 672baba4c8d0..921a7f58fd41 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -340,10 +340,10 @@ MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
 			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x16
 			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x16
-			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x16
-			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x16
-			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x16
-			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x16
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x12
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x12
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x12
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x12
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x10
 		>;
 	};
-- 
2.43.0


