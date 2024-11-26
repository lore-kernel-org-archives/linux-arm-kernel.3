Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D2BD5A6F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpOhGQcAawMozKbRyjDWd0TWIGF9Mne0xxsU7xd3RJs=; b=MqK+82x83T/1bdUcvBKBFc8Xf2
	XrikMhewPmS5BtN1qcpPUjF1NhDvBaVI/jnNSGyOwFmY9WJ8Mi5tm3S4rA7WasWQdwD27S7bzHSZB
	Ud91s0Pl5HSNcIBQimNMIM6DEY00aL0naRKbOnVGO0gBMMcvmC9LrWn0b7sdSJujb1W4cMSaji76P
	ZvCM01EB2UXi2J2dwxduLv3BVIQiNP7IkwM9aSach324we8FTTm1DIyfmkCbXYIO6faQKpo77qL7M
	ec1ndm4TkmGrHkyN7PpJ0o2BhSTlAatcp9nguI4V18AjRc7RmdbRO73zLfVMK6YxDsr8UL6fZ4b1L
	0fTSxYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqbN-00000009vX0-35pn;
	Tue, 26 Nov 2024 08:07:17 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqTA-00000009tnV-3nJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 07:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO4viJuz00Z3pKfMlbw/yF7WujeTbNE4VzMLB3PsWz7lN3xsm5d5yFyAlYoOt8Y51YqELYgKlUE7YH8c+FxaI4A1+f1NNVj0abydhtewjlKnG1O+w93lWnwx/VYwfEF93kXtHpCKTPPvKi0yjnaHo5oXQxGQZjILOXH15ND32n9XCrTevbQTeei9XKjXy8rrX+TU7/fawWUzMK2MwCq9LuqYll/Bu+pnsTR92FhnVDmIgqyboRhE2jbT8uotzlKh4OCTNZxrmgcRJo5QfBQl5goyLlKpLJ3/GTwnqnT/3E2xv7eQicSXg4eG3jOrxkAcb89OddRRD8ZMWUi/82P5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpOhGQcAawMozKbRyjDWd0TWIGF9Mne0xxsU7xd3RJs=;
 b=aRX9VvT/F+pmheAS9qoDu9TbNQMLgReRi7PLVeYjqcadWOmCH5CvOUoAJ1GkY9+ni26kTm9IBmgfRh9RKhsC3pPyFwDNmnqeTwHHImXDzNNkKdg9q2jq46cd8TMx/g992m2XpY6WgYLOS/pDU+MipHDbOg1Z02HxDGummr4NXhjZNOHsu4PnxIVRQ/pvBP22k9hsFYGQf9f0dXO+vcJvvEaKDzEX2AksdRTozcSWszWtSz7CVkFEPQADfp+ymb9R+iL7OgQnMMPO1iAlnfGgT8UqYdCczpKJ9LLsJIXvSXgXLVdNY+bd/Zm5ACBYNciPv892s1xVlkhV+rPUOenULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpOhGQcAawMozKbRyjDWd0TWIGF9Mne0xxsU7xd3RJs=;
 b=lLj46h3eOy8RNiDviRDY9W/PYWh+C/tW1EoOpV/HDYm8v9aE4o15JXtUTOJ4i6YsQLU54zSv+mzuZzT1Gh5ULklrX8tqqRjdLqgFWvVps9hKfTA4rtqs+tTOy0Vp4ggwY0CrXL0Zv8duOngF9HUbb1V1Fo5o9fi/NhCzVBQeAjz1QPWA4SzG+7YByfe54Ls3pcQ+oAGln07sqLMTO/5QcsRWMwk/+8W+krZI+9TPbl7iarrf5c9j1R9ShAKmNAIh/0xum32IacqgM8aJv97gEXWb7RwpI146yMos0b4vnhma/0+cVvEVsg+mFokrez4U/yhH8upQBL9EQ92lUK0+fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 07:58:46 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 07:58:46 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 09/10] PCI: imx6: Add i.MX8MQ i.MX8Q and i.MX95 PM support
Date: Tue, 26 Nov 2024 15:57:01 +0800
Message-Id: <20241126075702.4099164-10-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf81fa9-812c-4412-9f40-08dd0df02742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?55qdYDCGMOLNjS80w2i3Jpx/B99ar0VUVP9xF0kIwjHcKAT2PTwbAdvqFlHy?=
 =?us-ascii?Q?M7H7u1nSwY3Av1rVev/zOjpjOo0liBpliw7uK4ZXP0d0ClOummWU2BMKI+7/?=
 =?us-ascii?Q?FmxHT8pdR4vJMR/OM2LXHvMadzi46GRJdtah4TOF4lucdvTfqhUmA4UAa7n1?=
 =?us-ascii?Q?hd09wmfm4nV2A8Xa2EWT53Qy5snsospG8hyPteB09GX4qC5wwlbq3OZ3sFTy?=
 =?us-ascii?Q?q9VffVNO9zLPYQjwb46DDfRy3p4N97M0ALnIyOVHcR1hamKiNMYKxYg9sJiz?=
 =?us-ascii?Q?YswhPtIARkbSUhFds16yUmCPaXwAzj8BUTKrKyBaTuU8CpxO4MjIu3+oHbdx?=
 =?us-ascii?Q?SUd5V6CmaqBSxfTjH0oV2mO626LJ/pem5qeb3DvJLKDXw9SbJGb1zBFAhmDZ?=
 =?us-ascii?Q?2B4nM5OYBIXV6KlXrMo1rbD1tnLdIwoXbq7BPMi7gISNqL5sOQHWXA29t9T3?=
 =?us-ascii?Q?keDfxfgyfRKpNjeT/NcUPyPSwLqVW2zy+Cq0sDjNWBW6lanK64kP55njRPaw?=
 =?us-ascii?Q?rm6VIC3V25o3lSm50yDOLCRQoKrh1TLriSFz51/SMzYa8QuP9CsKSONHWspt?=
 =?us-ascii?Q?gRyXqQXZ27fAVTU3fy5HEZtdsaFxyuQKZaqma4Ek8cDpJX+wjFt6hRI1Yn09?=
 =?us-ascii?Q?6Vz3i3bBSSeoQaMHsxEm7uPi/i93n9iepdJP7at66QvvTV7+SAN6QGuWFhUx?=
 =?us-ascii?Q?6yQuz7VscRhslOZN4XrUrRzfjpj8sAUbyQ3G8SIeUnBOIhBBDv8IQP/UjIMG?=
 =?us-ascii?Q?pTO3ys1wvyxbD+1e51GJWj5kDTcgcHdGGSiRocRI9WDjjN8cWdeUcGUjcABt?=
 =?us-ascii?Q?2QqoiuW7YmVdeUu9QKGlq1mPSxSnO0UD5frxCdWhTyJsJcboMGFTV30XNBYc?=
 =?us-ascii?Q?Blg5FWJT88yyuRVW+koRgxLJIaxC86TGt3MphRvYPXBoJihMY4XliqtoAsn3?=
 =?us-ascii?Q?dNyxfLP2x6JxQ0MpUV6tozfUhk+EO1ZPqFkWynUEo04xPyJXt79PICosTlkn?=
 =?us-ascii?Q?DwJW0QdqGN0jqo9xBw6QBISRFI8xK2QFEWiAmIBarE2+id9J8PDFWcEs066D?=
 =?us-ascii?Q?JW4n6UFdwvrYYOMYIHo2690nNWpm+OrKK/NbvugGCb8pxNHXU19RRYrC7wiC?=
 =?us-ascii?Q?XQjkrax2ie5+fbR+xhAL56uzTVAdbdbvA6M7cBVvehK3QIS1fNUUmkhHgSO1?=
 =?us-ascii?Q?Mo7DTmaKNx9XhQEsebyHuROwKBzYGSu3eCBnOUHFapkIRTwo1Oe6fS8WQj4+?=
 =?us-ascii?Q?2uIRGf6tgSgfrzrlH2g0DkaijCS/UjpNUzzCKoG9ZyR4+zb0QhNLbiO2rGCQ?=
 =?us-ascii?Q?eku4HF0aBPwpzHGplKGwQ8bNJ+tEJKW9e5ZNmQfsuo6NWmZACogqLqI2fS4H?=
 =?us-ascii?Q?AWypoGIPZg4z9FDFqL4DRkZs+ttlraJfbS+zEAFNzdJFE00WHKYFC+ZYm9i2?=
 =?us-ascii?Q?joBpKfS3Tac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZeSyj6kLIS2zQ7qz2gaA8vMQNJC1x5axyOK6A2G+vw423iwj98SRWOHloja?=
 =?us-ascii?Q?J9z47kvfYyHmOZxkHqDNKjd5RzPG2s52rnM6tDva0/8R9+MfPbk7ZBc2+COo?=
 =?us-ascii?Q?JLLemttTTYvDf6p198REScIT7GynJNkufZFcZMhbaPXxSZ7T6v/CMtw6agFk?=
 =?us-ascii?Q?Jz3jDZZHA2o6o+zxF7DPI/ocPA9lqwkfPQy3x+NTRiLZkdbB2cQSTRVs26Es?=
 =?us-ascii?Q?RAs53LGb7s+jLICF7UwmfwhoCWNZMVRi32UAkM15GaFohZ8sEfo2YBCZQy7A?=
 =?us-ascii?Q?BDc+KlslEyX2gNTV3B8yo0qGk9vMWY/f3sspuaBFbfo+lVwj3Dkkr6YY1OE3?=
 =?us-ascii?Q?HP3qfXzM84p8oKfiR4UAPH9xhBm6J+Q38sNacIc2sn8uKhF6A9qNHHzHNuMF?=
 =?us-ascii?Q?ZZbV+lB7MFfjmhEbk/zWnm4vBokOaRDJMBYdWAjxMV8vbsahToJWpnjzo/86?=
 =?us-ascii?Q?8GB+xHG/wyGG58NT0xVlLzc77ObKBBOB7T6tr7mp+zx12YP7u3D8IpfUu/SF?=
 =?us-ascii?Q?W1Rg/NKBmn+5RI6DBX3NofyasLhjE9QEl9KP3W0lkB5q9iifUhAi5kqpKlRa?=
 =?us-ascii?Q?2SkyPvToFxCeElgTSNjvmKfN4e/pToCm10CjZL3fon9Me/eFjsTq0Jb6vkYJ?=
 =?us-ascii?Q?kz+3hSH0+CKsvkXTqxa1WFU19PyC/98y9w/+Zj2qCziFf9juzQ0ftnR22VRK?=
 =?us-ascii?Q?J5HDYU3Q7ILwns4uXxvcKkoar7mvDHxCx/+HOo/h50WbHcPgi00vBV8F4sVn?=
 =?us-ascii?Q?To6Sm14WPiI17YrzZwoeDo4SpQnDjCU4/TT9iOoJk6rAYd6GCrLMTFm+fWEl?=
 =?us-ascii?Q?FVq7bsmv1EDgkNOYVG3qI4Au19hCF155uPAyAC765jcsjLghvUWn+sk/8AlZ?=
 =?us-ascii?Q?fFVAP14pGligC22m+Y8+jTesuRqQpC1KcPV59ulLhSejS4ld/PGS9SElolQl?=
 =?us-ascii?Q?K2MJRBjLei+NkgoLNMwLQvG5SF7rOcynLtWPQDQpUkdOjlirdDXYyw6Zcc/1?=
 =?us-ascii?Q?xqvCpdd8gMw6Vsdl9toVgEb9gKYPWZO0a50f5PQx/ZuYvUBI7lbAu+VHCQ66?=
 =?us-ascii?Q?gS8QVxNWmywIJGkzpute7ZuDwtXhgRKGFOwzeCJ5jGiWX+J1ngroQQ9AicQ4?=
 =?us-ascii?Q?zFxuw0KsDMPnck1dXobWFB1cl+KCs1scMu+bPCH74mTVSjNBlL6fLXNlPZD+?=
 =?us-ascii?Q?3nok0fdqllZjL9DGrCCR3lNurGv9zehEizWCFLtEWVPK68Soc3WY2hvdlsbH?=
 =?us-ascii?Q?VaLRjF5hpkH6CZkI8KFlhDfGTc66buyw92lpOm3QWORKnz/RkVsWECno1WDC?=
 =?us-ascii?Q?Co2WoYhJujLtRZ5ohlgMw0fpOB4akXnHVOpUcW4ouuDH6+BIA9xtvCV5Trk3?=
 =?us-ascii?Q?gs6AH32giAeQ5Xk/O8NkI46Av+VluVVV6qNYMgLiDNWkTzAhyDxEywDoZCJD?=
 =?us-ascii?Q?p6ROI3MgGFeCVnFq3db0/F4NvLy6f8jY6Ir41Ag7F9qxdCNncHtDd1oK7wdp?=
 =?us-ascii?Q?g7aMBo3B+4CytEcG+pZpnmtLhP5Cy804LHk4Eb2nE4NM7GbEibItUWjksaRk?=
 =?us-ascii?Q?s4nIkqN07lf6HJDa2FcgLPbHaoo0WUOv7iYc2Siy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf81fa9-812c-4412-9f40-08dd0df02742
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 07:58:46.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv+19qh0eJM9VzPquUc7UNZ62jaa23xG6aBqM9h6UZ5l6n5EMQl1/Da4ZsciRuHN1ecLuk/rAN4MTP5TD9GLaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_235848_944506_287D6D6E 
X-CRM114-Status: GOOD (  10.88  )
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

Add iMX8MQ i.MX8Q and i.MX95 PCIe suspend/resume support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 87dac4ac9d10..852b34572bb8 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1527,7 +1527,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
 		.flags = IMX_PCIE_FLAG_HAS_APP_RESET |
-			 IMX_PCIE_FLAG_HAS_PHY_RESET,
+			 IMX_PCIE_FLAG_HAS_PHY_RESET |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.gpr = "fsl,imx8mq-iomuxc-gpr",
 		.clk_names = imx8mq_clks,
 		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
@@ -1564,13 +1565,15 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	},
 	[IMX8Q] = {
 		.variant = IMX8Q,
-		.flags = IMX_PCIE_FLAG_HAS_PHYDRV,
+		.flags = IMX_PCIE_FLAG_HAS_PHYDRV |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.clk_names = imx8q_clks,
 		.clks_cnt = ARRAY_SIZE(imx8q_clks),
 	},
 	[IMX95] = {
 		.variant = IMX95,
-		.flags = IMX_PCIE_FLAG_HAS_SERDES,
+		.flags = IMX_PCIE_FLAG_HAS_SERDES |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.clk_names = imx95_clks,
 		.clks_cnt = ARRAY_SIZE(imx95_clks),
 		.clks_optional_cnt = 1,
-- 
2.37.1


