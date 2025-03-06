Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF9EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQBL6h0Nf7C9uSvsifhTMuoLWgwAhMmLAl3VExQW6uk=; b=UqixoGYBrbiY4YF/NO21WxflzX
	V3is/IlmvrCgVPyQJy7f0ifMjp2WIMqkbvz4YxUYfhxV6PY4iMhD80jBeVphL4gXfTCRSde269/XZ
	wW0LrFBmaTVY2UxynC3sKHCLZqK2hU96y3uD6sJqWAeJGkhAMlnv1ucIYZntYPiATQKVjl1XhKP2U
	FxainINIEfUzA+TkcUfXjuufS1CuohXrwh+41QLGRFiFttwMNfggDVOrfinPT9Kl1XtKx9R/aYhDq
	KKyfj+aEM3eDyUTHSSOurb02Gnq8EwI7lYcS8tH15a+VS7QwmEu1sAvUF4vF6FhmPibyypSkMJPi9
	8ntVV25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqG2i-0000000Bsaf-2dC1;
	Thu, 06 Mar 2025 18:34:00 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEjK-0000000BdTm-3OZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:09:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNkHLYi81O3OPp4kfiNsZXdyNj5d64bbxl1W/YBoQ5gpkmLXt2q4whjCG/VIpiwvZbCVgWHeH2JDVJ77nkb0HTpnCmrmYa6/4xe1tyfWl+67s3zHREUXpeeD05+2MT5OtPHoBb5sHx+QiwVt5gZr9+2DI4+yqPXmvmIiXxbJw6tfUET/IkAM6yQNmKz9M0C9lOTQLF2D1L04e2MnZ5tcXAet/edAC03pwi6WZoX4nNZ1DUpWS1emVX3WZJRy9fpzFN5DYUUeC0k4XSiuoiADE9atBy6HKatJS73xZ40HLwmm04iyl0ddxoz4GR1HsOE2WeqzhIk9A8x7mFb4FYoy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQBL6h0Nf7C9uSvsifhTMuoLWgwAhMmLAl3VExQW6uk=;
 b=jhCSL+O2/TrHkU43ycbfLy2yASYtImeH2xPcLOggUzY+ujkvogjvfb2Y2cUcG2Erai48v+s8aR5zHk5Y4RE70LpeD7MOZiTZNyBYE1SlAo7H3+f8p7Nby2Yl/PL5CKszs++PlY1QfI8XqtaRcTIgrNgKGMPHB/RMaFFVNMOSSdR4vVVPspNfeP5ev6eJz9Ssi1Wp+AYAH1n/l9KN6+R4l9Pat0Zsa6XC9u/V9u+0jNrKw9/h5ckaXSccaOc/0nOlsRAcp8qCVClCpX+rPXS+T6nZkrGjLaBpI621XrN8yBE1i2mtxf5IrWto5+1egdgCsKcbS0mU4BCFtzD1orV1bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQBL6h0Nf7C9uSvsifhTMuoLWgwAhMmLAl3VExQW6uk=;
 b=ZnKAQ9UDx/1eL8x8q/6y6qbuVYsGY9DXlE/s6lyqQ0yqjne+4XWNlF9+0B5tEw99C0awK0m3uwPQyOn9B+s9kIkbnepqEg6/4NViceXbhy5ofslpPPdFkp9h6aqTbsAYot4q69xw7qk9+SzAw7GMzVBhl1cUocjF99fJwuxv8KibNtNRzMhfxiJMI/SAQzLJTN8sn0/yYg42f6X4I/QjZtwDM53Se0i8zM8MViEkGlEkHBHpGuv2plitJ9jTyjiVYNpJk78BfyLz5nGcZJAxi5v8DLHtCZ/jGcGrJLAFtQpk2LTddC9lACpn2t7h9KRwSC8XRWQjUTSx9KarhWJKmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 17:09:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 17:09:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH] dt-bindings: mmc: fsl-imx-esdhc: Add i.MX94 support
Date: Thu,  6 Mar 2025 12:09:37 -0500
Message-Id: <20250306170937.242183-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba3a3bf-a091-4a0b-9c2a-08dd5cd1b4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tmVuXjNSyh8IUHfibbFWm0ivMwwV7ZQwVpiIhiaQQNNol4bUzaVmLtg7YP2O?=
 =?us-ascii?Q?Bn2LTQ6dY0+fZo9lGH0dZgotP7fcfTN9MOfk47UJlavB/bbvKMw5kFDAPDjp?=
 =?us-ascii?Q?n5pVYvMVt2OgB3zOdY+n/NvN5XLL9Ur2wNeyddOktWnrd8Xxo5xO9oW6kuR0?=
 =?us-ascii?Q?zki9KRIuFZcthWfiyapDJRH95VR8VvWwuxhW/BNNlV7YAGl1PMJfwAT7fKPY?=
 =?us-ascii?Q?ekdFTSEbjJvRfN5HIvYMlEom0FmZGcliUz61jPJxMevkBejJaRMNQutmdmB/?=
 =?us-ascii?Q?4EGNVG+3Ej4Zeh/nwb74pGNAJRfWXLdI27PJvg9pHrPOfnfPArWO2qZ1e6fY?=
 =?us-ascii?Q?6Qm+26I7FBkSIr8FPcTSNiI4AzX175ntJhRglEVfnStKHd/05sGmoB54B0nR?=
 =?us-ascii?Q?xWStg3tk9DZObeU8DVS1mSZESo9hY7PqyKTw4tC4zkQ4LCne1hypW3ppAPew?=
 =?us-ascii?Q?2lIaEOZR2gjTkxX5nBEzkO/Gf0390/RYETgiOUI9VthuBbX63CX6hyD9tnPM?=
 =?us-ascii?Q?QmiJ9xT1zkb9iYxFUNot+DlBLdjAuUdja9a1HhSmWqKXC1k5PkHvdAuJDavr?=
 =?us-ascii?Q?TiZ8bP5qcknZTiFkrk9cQ0UkN6wEuYLoAgKxpOqLU2c22OHhtO8+LV1uVQz+?=
 =?us-ascii?Q?WQZUPMAbs+pUnvNh1HBoriBWz6SY65bnPbXat5Wg1wBUqn+jCItakhPVHoFf?=
 =?us-ascii?Q?HKjXON36YqJtiko9XCgZIMoO+sLfY/ScgX9UQ/VPWXZ681bcdTzFsjJ1yqAt?=
 =?us-ascii?Q?Ym6/9odgZlH1zRgIZSVQQF8AszrKT6VBRTu1CIFr89bfGJ1aKLvXOp9hl/69?=
 =?us-ascii?Q?nrw2j9WRUEj7DbBdGxZ/WFbh1S2E4Wb07f19Q6UOoLCn3/QGuC5thGCpCgnH?=
 =?us-ascii?Q?82aW30CpHLJYES7Gy/VYWJETUm/1ouZ6xyTezFcztzPzao9CZRVcpoKv3X9u?=
 =?us-ascii?Q?kqPlBbaL0g1dU5B1VswezVH8uvg6OOBq1GDWq/pD7bhlrfRNVJoGJThFDlf7?=
 =?us-ascii?Q?qk9YnCaXgLKXgD+ERM3/JYOzldlPp3eN/AdXjz+S4Rww+gyABVysoxkXOr0K?=
 =?us-ascii?Q?L0Pshft6AUapGXnLnTe0zZDSmNFqEIRHChTBeybauezNZf6ANS2YqaO/0jyW?=
 =?us-ascii?Q?2lUXARdts77hKv+rsdTJk9dcaMvzTn+vLbZl0oHS8kLFoWT3xlhqy7jDoHU/?=
 =?us-ascii?Q?XYpu0MHVEAiJ/+pWu/gGQYiuMB70IeoZWmi2gRmwGmaU3ScYmVubvp0EvafT?=
 =?us-ascii?Q?c6Gv11NSBF622y6nT7myaFfoeYpMTI7KBoF47SXHDuxA22eV8rmfbXH1ImBq?=
 =?us-ascii?Q?UHcnbyx6/7u9Xb/+U8qnwkRVrN8Do5dVXIL4obZRdZfcodAFaqBhRUnGGpYl?=
 =?us-ascii?Q?+w7b6oHQJ/RtXCHcnC8r5f0J3ZD6a71741E1a+R1zX4HvITRmwpepoJn+EfB?=
 =?us-ascii?Q?xja38+t7Stn7PwCZM+6gZ9cFbuc7xMkDQYOWg0vg1K8cNroIP4nThA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VmuhpkUztGeMU7plnUxj2g1lR5DV6/UpRuyOaXrsxrhjtOeKBTd+8UsNuHjD?=
 =?us-ascii?Q?hgeaVh2RfLyCE0pdGM/KZIeVNqUKf7jueTxvHX7deW1+wmFN/4yPm6pc347s?=
 =?us-ascii?Q?BBSDuODF+IpV6FyAWvlq5IciqOTF/k0dKwqpTKaArzSgPw9GK+879VIBDFQN?=
 =?us-ascii?Q?oaduOjXqVBLEgB4eC1w18ClKTltGlJdrco1GSIeZQVzwZ1GFEJZrDDqjPdqd?=
 =?us-ascii?Q?R+ZTQX+xwcYnf5F62TEZrvhWcwLFLqHtifh60O0jdI5ZEBjfsa3bJ7f6Mo9I?=
 =?us-ascii?Q?RFz6Inpi/6AitsEj44fAp9bxwdrTg6OJV3eRt6v13ybJxoHvdT2Je5WHC5Op?=
 =?us-ascii?Q?2Oe4WhfVx/DgdqswimIODoIQ8rhy4gete0rWV/NuaelruFur+gOySfF2Ttjc?=
 =?us-ascii?Q?0eSpIq1kBX+Fv4ChP3NNjMG6aSgkK0IoAkvMgTUbyKVdDO9bSoMlyJ1lRJ9T?=
 =?us-ascii?Q?9rrLKmihQKUJ6LvyuoH8UiQRz/R2qf+gxo2+0Ysi4e00pEDFOy0PY7yc1OhM?=
 =?us-ascii?Q?Fl69qSJ8a2UgOvEhdfziTBP94t1yrD0He/0gp5pEabFLkVENKKFXLrFxAKVI?=
 =?us-ascii?Q?QpD5fdGL9mxF/4/92hdRCmmlFJUPGMRIqdyAzXklUwPhISGiDSjLv1LGqqqu?=
 =?us-ascii?Q?BloVvgP3KuLB5hx3XRR1Vgk5oK+zgw2N17ldCnLzRKYFHYFW8440n7SW7pmy?=
 =?us-ascii?Q?EQS4ftd5A3sUrQkhZohbKmBnKPopvIH4JWTGpUiD6XA2dzZ0Z/hJXutpErIx?=
 =?us-ascii?Q?qtIfvyPHEMSpPZuHjPaQBA0PdpKfGYT1VwSQ6YK698Fi04+U0wKHMrvXz9Ub?=
 =?us-ascii?Q?Be0nTSfjeL8vJWYr+xLKWjzA0T/Urb9nDXSYpL4bwNzn0NujQghpJBq02Ngw?=
 =?us-ascii?Q?9mDJaVE8kZPNO8JyTnF7E2+knhtA8rRUnkJqNVImF883lvgWy18Fyy6zx8R3?=
 =?us-ascii?Q?Mi8vfz6tW4QWbzVcN+fLHnGfvW0IGaLC+vmYO2hAq00cxzq+/24Nm7ox5VlO?=
 =?us-ascii?Q?rneLBah6QyNed9k8UMNYqCxLxLuSEbe6QI2cANe5X/nBiLvN4Cv6VxNH+ijL?=
 =?us-ascii?Q?42tBnrI/GVojvNtrKvGU61MvOyObOsgjaVI5CrCfRzoQyK72E2V4Mw3f8cvI?=
 =?us-ascii?Q?8FFplufVsCwtCFVg1cWRAxAMshOGqlWpIu97Fra7UoEf75ewXF3AypIBQfQt?=
 =?us-ascii?Q?6GnrrsW6BTXbu2kKILmJ7IpT2c6WyNpc1OWRINvXert+MQq67wtzYpvHHmHg?=
 =?us-ascii?Q?waPTQP+Q35dvZ5CXVkrMoR7xzGr4apV/L3RzO/YLS1j4Pn8iqxUVQnymhejc?=
 =?us-ascii?Q?xg6ki7q3NtPUGLGObvfWaqonV6iJMZtZVKXRvj3F6cmlozfrlq/dp2QTNsjV?=
 =?us-ascii?Q?AHG4pWbZJoeQTkqzJ2QURdmV4fK3FXS0HrWP/XUWdereDN5lbbgtPpqN3/3o?=
 =?us-ascii?Q?ZaMq9bdmbYaOtY9b1m89pbZbw629FLp+LQ31LiHan65xElYgTQz+pZ4NPBZX?=
 =?us-ascii?Q?GsXxX7dRYI3oDAO6KtKlsQSCUt2kwXUnD2OKMs9PvAOAljhm8TBjv+sxD/8c?=
 =?us-ascii?Q?Wr7fmTh3kyGM23p2WviZzfSuXaOfyJVSPgvOv6ms?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba3a3bf-a091-4a0b-9c2a-08dd5cd1b4af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:09:50.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7QUMG8edmT/mVg9tfAezg+iBRhCgnW/Y6w+J27sgDSp3Uc9fA+80zXRn0JZKRd5ioaBnlMNXfbDrafKaNsg6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_090954_850371_D74B2307 
X-CRM114-Status: UNSURE (   9.48  )
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

Add compatible string "fsl,imx94-usdhc" for the i.MX94 chip, which is
backward compatible with i.MX8mm. Set it to fall back to
"fsl,imx8mm-usdhc".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index b9b9995705290..b98a84f932772 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -57,6 +57,7 @@ properties:
               - fsl,imx8mp-usdhc
               - fsl,imx8ulp-usdhc
               - fsl,imx93-usdhc
+              - fsl,imx94-usdhc
               - fsl,imx95-usdhc
           - const: fsl,imx8mm-usdhc
       - items:
-- 
2.34.1


