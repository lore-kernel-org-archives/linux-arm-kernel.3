Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D81D2F7CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5irMxA//VwrJHPW2Ve9zDXt+JIpPlBgmWWaTbStYTQ=; b=wXN0LTtcqSIRnvDef2T59V+qFI
	Qth1TR/txnrxsvmTop21xqJG/gMhPqT/MVCf4Q6mJJ83ah0P6kV8qxRUHzbVRFCBoMfx27syXgbLI
	oJ0h58da/OOgXdbGpFq9GG4M21hWmnTdgXEXcw0vixWrD7yp37jGOjyYOffXMkCnZ1gZ7wvm1onIF
	cL0Hc2mxaQajDr3Ix52xO1LvwzNSCTDxu2NrwaZQ/IaBzD1WKIMGQxIxI8Gxp6ujdQcVNX/YFBuop
	AFAkOM/fspvC4X0wIUjTFREzPs1QJHRVC4lOLuBkO8mVSaEa2bvsrNCC4/tQvFGl9km/KGKK5P0aO
	QSbjprDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCf-00000009Igx-04kw;
	Fri, 05 Dec 2025 09:34:17 +0000
Received: from mail-westeuropeazon11021075.outbound.protection.outlook.com ([52.101.70.75] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCZ-00000009Icx-1SmJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVTyO/J21srTkjK0HuBCrh/s5NdbVPAbt6Hng7hbWhim0LBsZKAqX2kOW12pE2J4+75Tv75OLAduBHXYYY8HqXHMFrq6QXZMt4eFvFpm6rJ5VDf2H5g3DXBX3PwQHrWRxgEmhnQJ83bZz8JbwPt8xe6IbC+ARSk9WDtC8kKdRHX1TpWgKKJm7iim6+PzGgMXyS61F7yo8dnLJvqPqEWrWB5u8MOvTriwqIgUxi1sBZAfHahN8g10E0uNok9CNurQpMiJBCl2GosYY2EjxYZELtYE0F7vPcTDCzNsPslxKVgmBUZY+eGWvg0g89GD+NjWZS0Hkl27pdrAJ5kk2vVA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5irMxA//VwrJHPW2Ve9zDXt+JIpPlBgmWWaTbStYTQ=;
 b=CEWlPjRoyLHbuMNG4cs4KiLKgS/GCvNZrwMGA0Z3xCowIEAQtX5OZqO/b68PFDTwFzDEgksXprcOndnQP55MDdny3eriwVkMS7XcpX9j6NZk5SFT6tfl2BrNq2MkXkCFqC1fgvhsqE27aTCmFXirv9vMMMWlg/tOovhSVJtzawwLd1kRy9P0LyD5w4j12igUeWJ56XhJOOUk4zrJ+2/N9OhYW10EPkB1lSBRnsXsUKMthTlT8q5TQK+lmVK58h9UDBS5FD2FfAM4ctiOJXg2NjUBVhmP96wLokyuNtjWuDCofsTaNIuXApdPQEyPVjx6son5Ko1boYFZU5uT3EyU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5irMxA//VwrJHPW2Ve9zDXt+JIpPlBgmWWaTbStYTQ=;
 b=bFRDnndeNLqUqZsy4mTiXVjc9Wh67QaOH5qhcN2w7E832+nhgO2LPgXn9T728t+X6wxNq4z45jI0SVeXBEJruCDDwL5D+5AlpRJq1MFhC7W+Dg+14+wOaXriCI8TnwVqdiwkq6FSjJpaVWBSdj7+iTorTwXlxeZod9Jb7Qg8dngEOpjU9h20zLg/jkL6ZB++5QH1CmfBE0mlF74W+96rGJ6ScEIUr21KgzKez093ZO018QkOCODWqnOKStdFbq6ylzB/yCufK8212j1wxqSVO+JO6g6xmK9iS4rN0pG0XTXQs0UD5lDSEspyR+q7XwgDK+1vietecMGq5CxY9m+TeA==
Received: from DU7P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::24)
 by DB8P195MB0629.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:150::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:34:02 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::6) by DU7P191CA0029.outlook.office365.com
 (2603:10a6:10:54e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 09:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:34:02 +0000
Received: from llp-moog.phytec.de (172.25.32.61) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 5 Dec
 2025 10:34:01 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 5 Dec 2025 10:33:27 +0100
Subject: [PATCH v2 3/4] arm64: dts: imx8mp-phyboard-pollux: Enable i2c3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-imx8mp-dts-additions-v2-3-d4db54fbadd0@phytec.de>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Stefan Riedmueller <s.riedmueller@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>, Frank Li <Frank.Li@nxp.com>, Yannic Moog
	<y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764927240; l=1736;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=ON0oIBMcyf4uUEZXn9aOIIWB7GqjVVkxuFw6ufYwh2c=;
 b=99HrMQK2SCb3bd3ukA/iHC/bdnKKasTQ5DIpxFb9+1ZlIu9IwMjN4427FWUxASUzl//JjiAs9
 PQi9Y/4AXHgDRHy6e0WaXAg02Nl2L7PAWDf1jhJWTuGP+eqli+ffBMt
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.61]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DB8P195MB0629:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3fb681-49c4-45bc-f7ff-08de33e16d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVJ4SGJtOFkvem5SbXBidzQ1MnVyWkh4S1hJUjRINk1acmlBejkxcHRPUlVx?=
 =?utf-8?B?RDZ2cDVKK3BoNDhna2lnRFlzTXB4SWdQc0dvVFcyRFFPaFVPMXdOcWg1cVlN?=
 =?utf-8?B?MnRVNWo0dUlZNzA0Q01yZUtYMHZxeDZEOTNOV0dZR0FSRDV6TjFpUDRGaGEx?=
 =?utf-8?B?V1VkZkJrZ3BLU3ZjQU16clFkbmFNaXdlL01qNDdWTklDajI4K3NWeDNzL2Ny?=
 =?utf-8?B?QkVPV2xNRHl2WHlvKzJQWEU4WVN5RnEvSitpOGl5b2dGQ0tqeFo0Rk5zRFFs?=
 =?utf-8?B?dVo5eG1sc3ByVmJETzNaVDZGYmFGbjd3amdHN1hJQVdyWWJrcjJnNzA3N2FC?=
 =?utf-8?B?ZU54SlJFTjJEN3ZxdUtzY08wS0JsN1Z5eU8yVmRSUy9BRGVPSkNuMjl6QXp6?=
 =?utf-8?B?Y250ZkpvVXAwVitpdzhxQXNrMkRZUFBxbVBxaUlXcnFJemxkNElzTVVuR0lR?=
 =?utf-8?B?c0ttVXZmSndYNVQrTXNlaExCcWgwWFhyWHczbERYSUVNbUVXNTZQeVV2VGdF?=
 =?utf-8?B?M2ppWnJNSEoyM053Y2JTaUQyOHA3bEo0QnFhUWYxajJVelExYjNWaFk2WXBI?=
 =?utf-8?B?ZjQwRy9zVmU2OTViYzhDMmpZKzJaK1F6VlZlakF1L2ZVNFFwTWNvTnV6V2tj?=
 =?utf-8?B?NDRqWWZzdndQc2UzNlJrZHdmMEpLbDJzTHFZOVRiTjNmVlBTMzc2VTk2ZURK?=
 =?utf-8?B?eU1QN1owSnBJNzY3bThhK0x5MXpVMFJRUHNuR0cyQkJZa1BSaDFTMmVqc0Nq?=
 =?utf-8?B?NXRIT0NBQk43VGUxZ1JEbDBVaFdPMTdpeDBxbld0WDZwRHdpdmp4MWdqNlNp?=
 =?utf-8?B?RHNDZlJ4OCtZbGY4Q2h6bnk0N2dQN1hPSHk5L0VOWm54SmZlZ1pQZ3FaMGVk?=
 =?utf-8?B?clBHTTMwdElXTzFsbzlKTHZkMDVHT3l0eGhUaHRQV2VieUFMdFUvOWNnb25W?=
 =?utf-8?B?Rk4rU2JMemVMOWNyR3BIOGVNSVhuSXk3bmhNSC9UakJ0ekZYWUFDeG5PU05m?=
 =?utf-8?B?OTZoVG9Od1RsbGhwc011cnlQY0hHWUJPRWtiNFVCeGU4NDhheml4cGttQm4x?=
 =?utf-8?B?QkI1dFo4amVQa29DbU5sRXJnOEhNRWxWWG90ZGI1eEhRS1Y5TDQ0eFVJWVo5?=
 =?utf-8?B?eHo5NThORUorOE56dWVVdjdKMGhtbXVrUFVSUS9sbFlZZm9TY2dNNmc5OXpF?=
 =?utf-8?B?NGhhdzUvY0x2aHk3bHdYOGVBRlp5QklBSWdBSkp6N05OQ0o0UWJEWnVUL1hu?=
 =?utf-8?B?NlNFT2s3czF2S2Z4blRESXdEMVFxeGluRFEwWVlweVJMVVlYR25BQ0tsdkhG?=
 =?utf-8?B?b0JXMm14Wm1hemFUckhKUDJjOEtObkVVZ0hkNnBvZHV0M2NWRXlLc3QxK2pm?=
 =?utf-8?B?NTdqWExCNkxja21PN2ZKalNxeHFQM1dneDRJUytiTkRMM1BSNUR4dmRzKzRG?=
 =?utf-8?B?M2JJd0srOG5kME55Y216T3RYL2xvWkU3UmJXMnd3bWZDaGw2bjBWUTRBTU5z?=
 =?utf-8?B?MG9IK1U4SzIxbWFmbUxjcldmSnBOVEJ0azV5SzRhUzZjeDhPZE9raVZiMGhn?=
 =?utf-8?B?Sk1OVGV5V3p2clkyWm5WcmE0UFBjSzVjMkszQk5YK2krenlYRzU0LzBNRGJ0?=
 =?utf-8?B?d21nWWJyY0RtWjc5bFlpQmw5bXhQUFZuanpUZmg0Y0ViMmdLWm84NC9aK01K?=
 =?utf-8?B?c1UrZXJobElCNG1rOWNFcjF0TDBVS1o1N2M4bHp4aTZvRUw4SGlxa0N6TlBm?=
 =?utf-8?B?b3ZoM1FGZ1lrQXFRN0pGZXo4OHVuU0Y5ekl0Q0lJVmxzbFFLeEkwenZqT1Fu?=
 =?utf-8?B?dHpXcHlrMkk4di9wNUxkZVZiTzdUZXRyWkNwT1RrVVRPU1NqRHE2MGRXeDR3?=
 =?utf-8?B?bFV1R2t3cHZxNnlBRjFkSEd3ZytYTVBoeC8zblJkNGFKSmhzeVZCdDBMejBB?=
 =?utf-8?B?bmxmdHBVYVpsNnZUcHZjUTRxckJNRURFWDZpbTNKeE5qRldXWG5MNTJqckNW?=
 =?utf-8?B?Z3Z6RG1pK2VvWUQzSVFobnczTVJkeXVHb2wwR0ZNbXc1Q2w2VXJrQlRQemkx?=
 =?utf-8?B?VUZpZ1doVGptTVBOcW5PUnMyc3Q5Z3lxSHhqeHUzVFk2ekJEUGRWV3dBZVR0?=
 =?utf-8?Q?A8y8=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:34:02.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3fb681-49c4-45bc-f7ff-08de33e16d61
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_013411_569263_240E4E63 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Stefan Riedmueller <s.riedmueller@phytec.de>

The i2c3 of the phyBOARD-Pollux is used on the CSI1 interface to connect
to imaging sensors. Thus define it so it can be easily enabled if
required.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 6203e39bc01be476f16f5ac80b6365bce150ae37..7d34b820e3213a3832c5be47444d4e9c636a6202 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -228,6 +228,15 @@ led-3 {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	sda-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
 &ldb_lvds_ch1 {
 	remote-endpoint = <&panel1_in>;
 };
@@ -442,6 +451,20 @@ MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1e2
 		>;
 	};
 
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1e2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1e2
+		>;
+	};
+
 	pinctrl_lvds1: lvds1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20		0x12

-- 
2.43.0


