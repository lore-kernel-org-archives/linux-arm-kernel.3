Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B677C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s150Our7Yn9np2BDR52XqekLRLuAOFnzMu6cJX33Peo=; b=AhGl3vbhGcEbC6aMc/kZaPOQEh
	jSqvo0LHkGS/HTfBzzxDDunHpXUluWXgRHTvFDRP++xEVyqicJYNvp65/iOqAJDZQguWcHuYe6Qg2
	JDONVV8sfwdpC/7GWFRuOXc0BC78Jnxrg1HS8l8ukpPL4kCq5Wo8k+1ABl5KN2ES12meoI5U2W/TU
	NwpCZcaTAn6aQlDgM5In379OGqY2w+I0+fDWXFeG9ePSk9PHvWdAMCqbDdfxz45bLn7FxSKnBIw5R
	Th+c4zBxp0W+lHWjQy4PWuzQwJ03UaSNKuAAANxT49/rh2hUIcG78WSFoPRlUWaYSpzZi9htpeDJc
	thyG38tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesXF-00000001MIg-3X5J;
	Wed, 01 Jul 2026 10:51:17 +0000
Received: from mail-northeuropeazon11012064.outbound.protection.outlook.com ([52.101.66.64] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesXD-00000001MGj-2Lq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msrXmZ1bJ7HcdODgUr5T741mGBChVc7mpvXQ13IMHRNQBtQFzwldJJ/Ctk50lXsBumZbNo+gPazcRaisnhoqbLhSHuVP4HdwbBUxXSAY+e3g8rQA1mp9JMws9Ho9mMgVhN5lmNCkTMyd7z30vNfZXKsUFwtL1hegP3ZTBNVr6LPjERDI/2HcyhuzOZAMfojh1Io39p15WvYKcdpvG80v+n8FeQckgnQjYuy3Znxu933iSO/QoWJDl0mKZnHqm5MTmW+5dCN8EY9HRpGxW2SE3DaxpPwhRgT0nN5DbCQCo/dR2Ai6yHh49VQnenlyJNYzv0QD5xB5dyA1B8Mxp8kd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s150Our7Yn9np2BDR52XqekLRLuAOFnzMu6cJX33Peo=;
 b=afrDiHLxbdDc134whSCSHmiSpcxrdml1/MQBd0XNJrtUzvydmxRaGn1B8qGKUCltTLwhhxLrecZ2jVUFtmBb6rR241k3FZJF3TpsB0j+U979Eq0gYfM8oZ1C9MfxbjVtBTOspLaC469WdMXgzlIr2hBhqxqso1AcgucAUQlZpPfN8CP5RsMhkREbI1cxEO5MVsTIj3BE2XAmHNoUnaimEvGbzZVC4kRBngOK1UWrYdxYAj3s4KiRuikQxuVSrsu7ctmeAgAQZDYLVSFyrc3TgOrNiXaKacAg+UZurYc9Ipo7exNGiee51ERsEJ/JOBCXbaVQRkOOLHM0nPELQ0LlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s150Our7Yn9np2BDR52XqekLRLuAOFnzMu6cJX33Peo=;
 b=uGU3APPFRoKRGkMF6i847BeyEuy0JVDXb0xGpOdA3N9KbK6GxkMZPp9TPl5AOyhFdbL+uY9yrNuwgG59PqWy3KK3lymLLUSMVvVnpjHs5dvKSwEvQyEqZmzOZxGClf7O+vNLBFCNrByabxB2g20yBrftSQg4NHr3+EHZHyURgrcYFNIrGe1ze70zJRyQiq4U4dKdop3cKzpnUNdBVGo3X4rtLfnpzcwLY0j23F7S7cvtCizOaTEytZtV5m7UifJtQgknR2piFzatg/R+WWrqNYn/ASfs/AQwmy4/HmQobFJfOH6RpT6Y5CyK+n3LJVEzdzBhaQjL4rgKZawgJP5MxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by DU6PR04MB11229.eurprd04.prod.outlook.com (2603:10a6:10:5c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:51:10 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:51:10 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V5 5/7] arm64: dts: imx8mq-evk: Add power supply properties to Root Port node
Date: Wed,  1 Jul 2026 18:52:32 +0800
Message-ID: <20260701105234.198987-6-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
References: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|DU6PR04MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: c270f0fb-f39a-4290-f000-08ded75ea94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|921020|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ZJBQk4VT3MQOYgkARbDlWnpbJWvnIrkm+cykqi1WRS7rQgAQagOKTl/V0nUPTSXkjmuMh9I4ouwpiuSSSoRcC8QvDLvusu5JUyj7pEMCM8KRcKqd+m2ivxS17+6zUuz7S9FL1qnxUO9UrCZ2wNNpWSy7c5TaEOo/AmelxRX7QEYJsomYpRGEFeynsY/28Rj43i6HVBHdCAD56YUO0u7GtEayjJIX0/wtuSUc1ef2vyh/ulwnuG8WbLX1rNcUjFP8WPnd9V+O/E3XQuPnXNvFUKRWFQwrkgqSQMoBpQF69oZvKI7aL4NQxbD/6VDlrA4sz/KiiKhUEthuDgeovkAHKe6P64xK7CnKiXrvPILx1+IGTi+fSZeIccOD3MeK0TLY416uMPQv/7EdPA7ZUcu3VzB5YMo4KRGQlyvb4ofoRRENqgnGWhH+dEmpXmPs89f2EGydavDT4GRB/g8ziuwEpEtY0Lzb9KMsrXUZ1qeibQbls2p3I3ZWDaYTtf6oWb073rJ/Na4salwrLgrx8mgg9h3qH7cMUySU6D0cMvob1hDOtPdPF6QVGDGj2wq1mkpgkmrPaQpfWc2NcNVO8e7Q/OgSWrVs8/ZXGRhcBCnFJWaDSP1O200kYpP5NNYihdnXdyMRxoKjF9U5562KlagxbMab4qI1cSDVjh6OP6tN9Qk2N+OTMIoDyN7c6UbUG0vTETkSImxIxgcbYxF/oeiELg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(921020)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Am+UoQxnVkaLx+o2H9munjRcHkFQ2eGcDJMy4hLwKNy1Bz4t+xh30YbSGV3X?=
 =?us-ascii?Q?Sn7JNDrLdmFvGj9H7UCT0DCKR9xEH7kX1pA1iAtNCB+SkFB99nRtMtp5pw3O?=
 =?us-ascii?Q?Q8mEWQ910ZoaM9s7niovAmiY+eGyELfpLuS8U2POAL0vTnVVoIqGLHFtzDqA?=
 =?us-ascii?Q?sBM/J/CB6rd+2NI2tohbe5FCnejBpH/NVJ9t463BooO/CdPamuhI4UU66Fn+?=
 =?us-ascii?Q?cqN78y0l3dKQZaSWkgVg9jg8pNcrsHzkZSj5WEKJ+X3cB0tQgFzffLCOIl4T?=
 =?us-ascii?Q?SQ+SH4Jdhx+IisBI+ExOrdk8WFPAxVxdyIz8U+rxdnV8TFGRwNWre6rueguI?=
 =?us-ascii?Q?oenSmpkCwi9iw67JfQXgFpUzlTSYaE6e0sKI1OBOM/uAwbS/gw5zEq1mzW/F?=
 =?us-ascii?Q?C9xI1Fi6g6YgtwY3PgZTIBYiOMVMMwiqNuMfqGhLBa/qujAkmeTPwYwRnfyj?=
 =?us-ascii?Q?FXnvZJ69agfwcq7fZbnc8amhyuXolJ4Gqe9W8SifEevTYoH2K9Vu4EygtKoN?=
 =?us-ascii?Q?UzOakU5WekO5WLrqMpFAy74fxGJrNVrwng60yKfDlzyEusLkho+Nr2wF3JtM?=
 =?us-ascii?Q?TGDI+jz//LTWDz2ql10xl0jL05fWEMfffr+KO7Qid+ugA9nfZx/JsZNQDm1W?=
 =?us-ascii?Q?S2OptB0ZF2M69dxR6YdpRfiAvbPVsxwvuYl2jZSuhoz0v51tZEm3+GGe/tYn?=
 =?us-ascii?Q?nHkG3G7IqJBh/wIAIBenxJ4T+4wX7nySRqCCtIJskWb4vLa2al+3RAz2FJuo?=
 =?us-ascii?Q?Ay6JEbzFGBbrvipMRd/nGb2NAUP5v5+h8w1fxeyau45qezyc8YODffVaUSz0?=
 =?us-ascii?Q?WMIuloeya1NMM/cfieRbpIcKwPNZZi7h4WSHJ08JfA++wNyAdd6wOf7Y7Ubg?=
 =?us-ascii?Q?h+d0WDT4VbBDuv4ZEj8kMH+HOSY7QhPixcj9otZN7VpWsiuv3fcjN98q6O4t?=
 =?us-ascii?Q?Wv36gkef97HfQ4LF9SEEU2BkcOtVFvFW8C9wzSm5sZ7YkLHmVBJwnX6EK/Tr?=
 =?us-ascii?Q?mNpZ3sUyCt26JPNwz5ZL1NQ1wNBD0F57qGZD5sn//OsI3RKV6rqPEkryOsde?=
 =?us-ascii?Q?98qJOq1OhsTYLznsrRaNwt4P0vdkCdDCxh3EDq2c7gjWlwsJ1MllA5ovuiX5?=
 =?us-ascii?Q?e7TQRpHGnQe0hIwrags/OPVb/0j5/2fbiR8XX7+yCQgNsT4ElLGGn1igcoJK?=
 =?us-ascii?Q?iWwx7Fu7i1ZGG4tvLHBbDRXZnkHzP0nrXUyudG22Wx1P/XDNrxg5JHyksttj?=
 =?us-ascii?Q?dRQNYGu6wwQkGdlC+b78qaucChH/a/nlWiI2rZaIgIt3pOYvMpF+ffsAmKHv?=
 =?us-ascii?Q?io4xGioIFPEpU78U9ungggbKIhGKX7I3KB7WDjtWjsLMzEPFX2tuawgGmlwI?=
 =?us-ascii?Q?2GYZDtubiNXfOIrQ3LBFAtQKyuTbcxmd3THOA2Wi67s4E7ErP8LahY1TZvog?=
 =?us-ascii?Q?eiWA27lrqkffiL/ePTO5nb7LSdPs0wHR16YG5Q4o5wg7ybv9dQFe8qdESzT9?=
 =?us-ascii?Q?D48u5Y6PgM3r53/fYXndaMhMBVv4wQ6qzw2mS6HAfNbJ0ThTkGTtoNqZy/Os?=
 =?us-ascii?Q?xY+wCTTeH4tnNQmahwGcZ1y5BZm0HYnNtwM9xJsB23Uy/5R/BKbMyVsVts5x?=
 =?us-ascii?Q?prsjvy1c20uDA3u+DtaHf8HNetEyzG9Yw6mTeVTfNfSftf1MXzdVDcD1cmPu?=
 =?us-ascii?Q?JaOZWZFGPGdn/hhoGX+9UgkLE8wre+EhvQKbBlOruJIx5kC5o7CEw9tvco4M?=
 =?us-ascii?Q?MpdklOcQy4asiRsQa+cp3XDOO6lz9MEp6qLQqefrQZallrKJYfZt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c270f0fb-f39a-4290-f000-08ded75ea94c
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:51:10.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfRBxhVAQ7kMfjNV4kp2vlEqLLAekWO+l1y2lb0ZyN7mbeP4oWJhQ/XEKkCp7FUsGIXi58DazXfsBMj1TGMXIelpwSeURvNoLt6kVgM7MFLMoRpuRFuoTJgksOrR8eI3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_035115_756517_8B8843E4 
X-CRM114-Status: GOOD (  10.00  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Add the power supply properties to the Root Port child nodes to support
the new PCI pwrctrl framework.

Legacy power supply properties are retained for backward compatibility
with existing kernels. New device trees should specify power supplies at
the Root Port level to utilize the pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index b9b03416aa39..1f07f1089026 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -403,6 +403,7 @@ &pcie1 {
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
 		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
+	/* This property is deprecated, use power supply from the Root Port node. */
 	vpcie-supply = <&reg_pcie1>;
 	vpcie3v3aux-supply = <&reg_pcie1>;
 	vph-supply = <&vgen5_reg>;
@@ -422,6 +423,8 @@ &pcie1_ep {
 
 &pcie1_port0 {
 	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_pcie1>;
+	vpcie3v3aux-supply = <&reg_pcie1>;
 };
 
 &pgc_gpu {
-- 
2.50.1


