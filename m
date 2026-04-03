Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBF4D730B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y79Xba0DqXA6vXNhm2rspAKjsSdAAv2usfw0YtD2EdQ=; b=vN5X+99QQD8KDblFzxWDwHZLjX
	5vfAVdDDCNPLdkIVFqaFqcwpCSaCo5CruLOapO2EfJ3xNaGs1eFzEkr+5TJwg5eGVC4VxMuSxYSEI
	CQkfB8E+YkfuF1oG/vVxW01Gvr/X0s1vnaJV3dv6vXs2rzzK2WqiKFT6vUvJFAlpjxv19dVg53Nlt
	ZIhnI5iL+0UlCMJ0sFBzF+MNpI2Wo4DVJ6Qz728Ssb/+zQuduPVwWx/LR5CAkCLEXZ8FUuoXHlWpf
	3cmqKCKxnx0AX53XQ++09oNdYFDGFup3Y1p04+xvOSfg6hvHx5fFqpgbSVBguFqybYDbEEftx79r7
	97Oq3Wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZFP-00000001ell-3Pyk;
	Fri, 03 Apr 2026 07:47:19 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZFN-00000001el9-1w0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbAcNtwwBV+K351L0a7n2WqwD8OZZb9RjS5CqhtVZfHfj+Roe1GcStaIIop8yPEE8+W+XgP1axDSy5NgO50V2fVLktA9LgusXTRW3KNu7cltKUY6bddN7JDY4eY+R3o8CmvCJ1NtlEZHSlzUqLjSQXmg4O8jvzK1AsSI0BBD40Gjnb92Vov2hEnGJM/s+mzVNnMIg3c+5FSiBsYjnpVIHNJI7kVnpIhT1ijx74LxCPcLLA4DmBJFkZ5FQBtCQzc2k0POTADFrJCmtsB4y4aufnilCSMO3/YEFA9F7H6PfzieM/n38eqPCSLfnvWQk7p4h4+xkXNIQb3NVjN7Vr8+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y79Xba0DqXA6vXNhm2rspAKjsSdAAv2usfw0YtD2EdQ=;
 b=x9SDPzOqw3q2AjrEblhYMJVfOrJsIskCB2GP5DuYrnWvwmzA3CLoKIgJ5HLqchJDhxfpq5eBQp0SX7T5COLhhkzRVp2h979PE1FE2sszhq9Mxa9qNE9k7jIaPfjAlNPkhutwKrY+bIAxMzOX6SLOVe+7kA/TTvlAmLFjxokNj/Zql/JMsDk5qGHb/W1GX7Mc5dqEggddX84SoMHwCQmNnoGHCee79ZTQhaWFWjWm+JW1aMfPAwG27aDtXs8+tRZ7Zs9H71Ln5I+GcOO9btOycRWlGip5RjK1NE/ExF4u4OShNAlIXAoKdWAa5eeRi0PfwDc9e2SEbHD+842Na/kbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y79Xba0DqXA6vXNhm2rspAKjsSdAAv2usfw0YtD2EdQ=;
 b=AxwVtuVycXlKBQ1veS+EFiHPZK8kNbMG19KyBaKdiQbgZFg+rPqd0il9nGhlXwyOrywZc1D0prQQ8KD7l+T3YHvBNenHdcm51jd4/q0+LnqPGgxbN2Wbhg7hQWrf7/XDY9m2A8OZLca0vsmZyqErRZ1HX2//OQczwzbQJ4B+mt92waAgnSI4qAoMLfqhIY91BjWkrBvsXz0HjPVUoMtSgN+Ee7GfxNANODhbAUI0rcros0ewXcTKXKmoO/lnQOAbvU98I2CjsbbyGqEUYrecGEzTmJylZRs2kyjdRexlSb+1kFEhAxcVK6nxrxPO7tGs1Llg86LxVbUq2HevsT9L9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 07:47:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 07:47:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	miquel.raynal@bootlin.com
Subject: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for nand-controller@bb000000
Date: Fri,  3 Apr 2026 03:46:30 -0400
Message-ID: <20260403074634.774234-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:806:120::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dae9a3-43bc-4f00-392a-08de91553780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|366016|7416014|1800799024|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: rcT+GtvqPKoXhgmB2swJmbD+DVTuqA6kjz7FGnOXiCBaDAihYs2SgVufrFdTbdH7Kt+nhf+X9f7+ElNnUHR2Iit1vhFG4+kKR754JPMDNUJIUOePdGQNwK5NREbj0/EfG956zm/IHAup+fx0gRRFCiZmoO2HIG/e9mfobG3qrjA6OQr+ySAkp1LzjMyJDyyb9031jZiTOkdgmzlkVlyfsXDIfcFrBfQ/nCilwSn636x/PA6IZjVkR0qpdojBuKdb6g6Ajeuvy/l2IUTXa85FOzLLEsl4oTdE7xCQ3vqERpEu85xTDI+Yd7KGNXBx7NrSijPziHB2eBxMyCZtQQlc4aT0O4w7kjHLBJh9FZCQiquC0XAScXcxvriVVwbj5DSToWgO1be7PX1mgZ1+3nspAoX61LJT8GM1JQB52oubJPkS4o9ZLSX3ZGB3fvM4oSqQQ/wJyuoQdfRY1IvFo7v8Js0Kf6FRTrrhWCHVArIiqV3RYSWAKjzmAhWNAJH9y684fvB510X/CZ5+e0+BFogM2T2Gb285UibfnS9vaFhJLC9xBxD4Szl3pB5KE97qAqnc+LqxT1ylp09yKRDthaUVjYwehDe3z44Ex0DWxQm3R3l2CNRmTz6D/8KCNHXJRSv+7UVKLHmCtNfR0TM0dAOm4TpCfHE1LpJ1qzOGMrDDgis+S3DaMTvJsvjLL/+ODnS+Xv578JP7p38IaIDsV/q+S7VYMy+cDeINqMB3QO0ILKhLaYwuigCBPpgxwgZ92yquL9lOYgzQU6c2E8kM/Ne40A4mJGmA3DgWAQYycDKkPc1l+4G6WPCPT+5PlqkHLCk8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(7416014)(1800799024)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQGMBzhrboDm44uLt6nNT1tTUvJs9mYgTynRNa3y8inzSo5U1pK2jOBiDYdM?=
 =?us-ascii?Q?2MghsMh9g/sFsskVUl3pF8YpwCgTKQoLPiBMwhBekKJXVJX7USGaeghJint7?=
 =?us-ascii?Q?DB2rXc9v0BRSeilKYQZQQM2JVCCJx9xH8XqQSzlFuR4NNgLPus5Tc73XXnXZ?=
 =?us-ascii?Q?Ntjtm3Nnp8HAwoelf6RXX7poJXVrrcLqBz4aHaaN1e3vSqVMZ4x0HGU84e1o?=
 =?us-ascii?Q?iN6Ff6rZz13+1PawJYNIRmcQ8O4MOoL5ZP9PPUlSRRaPixisyDMn5yX7ekz2?=
 =?us-ascii?Q?eNhiuvpaKJgfL2ABXpmwhB53yaBhlT6PzkgGO2fAcE1hKSJHgKYVu6uSAKBU?=
 =?us-ascii?Q?ZphrFI8uMiDB81HgUhn+59iPQ2Wn37EGV8dMCMZZne9hvw2iTIE4RdIXaMMS?=
 =?us-ascii?Q?NpN7DeyTCaNsJyVsZqrpbJCnCQf9ez8lkCWrluRD8eDGwHXFUZsi1CBmYOeK?=
 =?us-ascii?Q?4EuqHI/BsHLw+PD49s71xQwH02ZULyugdJAdndKpLBjghyah/3tmIfTn1wGf?=
 =?us-ascii?Q?gyMJWAObnMMouLIok+eN7xFHyOLouduX1/PVFopJoDrXL/gRGSzIjJW62P0J?=
 =?us-ascii?Q?p0rbacItiNonztPOsKz5oUlT1vgVaYUEZF8bLU8xqDLeFabWP7euvBwsXov2?=
 =?us-ascii?Q?4r/VkLbopIOFQw81jOP7CBJh+rtsOhlt/v/0/UdpiwUmURN8ojnpcGErpT2Y?=
 =?us-ascii?Q?I7iCkfBp0yWSXbgQ5pR6GUBkSQB4PXMEjwSFyJuuQg2x9SlBIFONms3LAqZp?=
 =?us-ascii?Q?/PwkBbVl+a9higEkusDqZ2eEMH3QZm/0zEdQjbyfNxu97Pa43csc4X+J8Pbw?=
 =?us-ascii?Q?puTLFNoKTyiLpE76s3QqUPvAQJlYMQaghlCFZYYPyei+0AwyYdFn+u1GRDIj?=
 =?us-ascii?Q?7sTbdOkfhluA/wzon4PrU7FVBeQLon5UoEvS3WtM90GC+JCIWDLNvY4nFNcT?=
 =?us-ascii?Q?K07+lzTP09Wsv0rtlUK2cWBF2Rz8CcrkKuiIBTXNERi1MhwwQCcbLt84jj3v?=
 =?us-ascii?Q?ZBlaGw0uI+s7h0QFqsDyZft7WqiXBiKepaRDld/axQCnpLFRDhlDDtKNrSBL?=
 =?us-ascii?Q?0djVQt0P5o3t6ye+zKGn1DUmgpbpHJwDjc4zj4C5lpSLzrxeBNURX0nvH4rZ?=
 =?us-ascii?Q?lHnO4+t5yHM997OL8ea5ybmA9iOaUgVxJS4+7enq3/c1abmG8dsfnYQoEQKP?=
 =?us-ascii?Q?ub4k3WHmms2rZaJBwq5hdr5up5zBYp9F+7G83OLjiUFUE/OevaH52yJcGAQJ?=
 =?us-ascii?Q?xe8uaG3TjVxqXI/mNsCFM43shIiRISiu42hX/Ii6CBUjjB+bnysJsHI85PA8?=
 =?us-ascii?Q?d3TGMiqhu2cgOw0QvBiYW4wVS6uhnW44KESQjNFP7CDBMBG8ZB+giPv61Zy8?=
 =?us-ascii?Q?B16e13nxIzn0kTd7gi5JSVNsnV693J7e4HLq5LOE4C7NuG4FqcBLXgptTKY7?=
 =?us-ascii?Q?69qpVZgU3ZQL92hOy9Yd43VvrShclhdaFNGX5htzMoxICOCW5XwBAi7jH5UT?=
 =?us-ascii?Q?tau8IhWZYWYNM/0/BgGB15dzw0TZ7N/P9n8s7xF+XnWjwkgAS+pwj+uS3Ceg?=
 =?us-ascii?Q?kLLM85a9K9pAVUcnq1ucEf+C0Bi878adUTeouve37MQA6EuDAqzIh51ZEUuI?=
 =?us-ascii?Q?SmM4258UvDU2V+I4qdtsZZvi7/zlR6H/QbAvtfFJ4kIYRDrUkpwkvPq8fRb9?=
 =?us-ascii?Q?f4OiRdWabVeSmkd12ghLnpsPIoawuT9nkfS0ArXeUkKVuO5F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dae9a3-43bc-4f00-392a-08de91553780
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:47:12.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrShL0pXXiG/qi1JqfESx1Xk2tAMQ3iUNlFjLS3l35zLhA1o9yyZgzR04di86Upa4orRhDISViOqdxG7DvaYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_004717_533413_DAE56AD8 
X-CRM114-Status: GOOD (  10.08  )
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

clock-names is empty in nand-controller@bb000000, which is wrong.

Remove it to fix below CHECK_DTBS warings:
  arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index ab7b646399894..314c4f4845288 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -369,7 +369,6 @@ nfc: nand-controller@bb000000 {
 				compatible = "fsl,imx35-nand", "fsl,imx25-nand";
 				reg = <0xbb000000 0x2000>;
 				clocks = <&clks 29>;
-				clock-names = "";
 				interrupts = <33>;
 				status = "disabled";
 			};
-- 
2.43.0


