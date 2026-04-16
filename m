Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE88AF8A15F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uoiw3sjWXeOmMJgQfdgaf/09qfwRfHPL8YTaTLkfliA=; b=Gl3NMMheRxXFJ2g0jTsZ3OVPc8
	4dPJlErnmvffgtwxeNv+U+yEVDkHa7gp8CvgcyX86hj/TrMFNBn7Msai9mgvZ8j9FhxjA+XFhOmPr
	RIRIJrVO2w9bFQLpKoYf5gNydbwHztHANiG2+u7Ac987B7/NXM7nhRN4GY5cMFongBejyp0LvBcMF
	yBvQBy2Iaq1NB7EBBtAr6PCfd/K7VS6aeJR7fGpar5QZ52cP0MjJAmFXO5aoAYMiKBFktBolvAM3E
	o4OgwF+YksH+2mpxDHGyABXe1ON/8ZycPgU45Q91g82H/eaTJCgFhA+MdRVeueEvmx3CMVV2fJXxC
	NX1ymULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKeY-00000002Llm-14xe;
	Thu, 16 Apr 2026 11:12:58 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKeV-00000002LlJ-1vZA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 11:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtK+5FBpxwxn6lETILfPfzIyYuKgtX43xkG9MJs1ATP7PaESZKTSMO7Cx/d8jITJVrBNeXRT7R86NsfJG/3u40JM4DIc9Sm15KDAgL4dbtDrnyzZG42lKX/+QEOvYcXuqQptQE1Df/BM0zj/jazVM+cMVbzbQ9AkLa7PiqONlYdzygqcppvs3jx/jLAGRs//H0KGUHY0m9cngIaGUm+iUXpjRk9tkk3KT2MXzuMAUuGfdKgh92ZS4UtE4wOmzYXSfTpP6FTs6xA/ycHZKUTNYLUyWUDHtltL4zQr/KpfFahgANV3wZ1FdswJF2yPHE3fEg+tdW+/uJ1R21h0wjlSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uoiw3sjWXeOmMJgQfdgaf/09qfwRfHPL8YTaTLkfliA=;
 b=t7vo8hhu7GXw+iGL6oSwV/Oy1E4ngSBuOCV8GmJEzD94mETbz7PuJpxTSVWTSDvomdsynpFG3w0KRYTeF8p+yywiSPJU7Gq/oIzcFzZoJpVRxLbX68vXToGUGPv8NgQDGM61WoMiPdgKp87ywRqZkD+SrkNEJhHo3mDEr7ZtTHVPRukBwQHoYRwydDoek2bSslC61tEchdVpzmc3F54GH5++sXY7g7uetR2eLxr90FOezsqzcaz0CXaQWzY6HZ2MEtu//XezgrTFfkq765/ulqpF0BG2WbYLcTrxCoeuys30QgLpvEbnwbJEah6vbXK9ZJb4P1WATmx5HWmpey3YOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uoiw3sjWXeOmMJgQfdgaf/09qfwRfHPL8YTaTLkfliA=;
 b=XxSNGMG75XI20PEeuwWXTegmg7KAXpPhBfrnao9ju+AKlp+MSkgUuuo9tNHC/Ck4ImDnM4qzCfDcFufrEMp1WDJBknzdYMWYVMkmx55Znxxn4vjlthrOD7EXkf7Fiwa5oqckbiZWhLAAvUHVmxpiFIR+2inilrdwTlXEUHJL9/8tkXg5L0wCTA/FXTvJ/uHZwavrQAZ+OBf8m1Kl5tXKZN4OBIti4pq60STQ+0F7C2aSfJ9fmfufWzhKQm+2Em6bcUHlL2smePgPREi+cSNsmp1PFt/YkhhIpAXPa1rKaCLmtRiYcWQFeEzKMtNYwN1661iCRZ8G1vFkNV6lryjrOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8804.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 11:12:51 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 11:12:51 +0000
From: Sherry Sun <sherry.sun@nxp.com>
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
	linux-kernel@vger.kernel.org
Subject: [PATCH V13 01/12] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
Date: Thu, 16 Apr 2026 19:14:11 +0800
Message-Id: <20260416111422.183860-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260416111422.183860-1-sherry.sun@nxp.com>
References: <20260416111422.183860-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: c510ec10-b3ef-4da2-8609-08de9ba91991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|19092799006|18002099003|56012099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: hrgFJUhQ8sHqz253QEn1kA9qIICa4YL1YIijJ6y41G6jOfy5y9WNMblHZ+cbYC9Zg+bxEHEakvziXWDvCM4njRmIfE2ziNpRGll0j767AeY3NEhDNG/agxLBafC3nlc6VvJoHfEr+RXhR+SLcaQ2lUyHBL0pIYT4OPeIOaDxJ8NX+Iwra0hRqV13RKrc/H09nkTWVKkEQQ/TQ+W97Bwd3wARvCiIZPD1QS5AikCABJkjnPiyR88B4mSqy+hedd2K1/GdwWAcemHWWkONlb8UNUgvTHZWLW1IRVowe87Mlp+Oc34+C40fX2vmr7RikWSQLNFm3GppNxOA+buqgtlppbLPTZoKzHmUBSi3f9cv81f6FqkC0eITylhHr1l4u7r1/USNzV9aRpr/PWyDw52zNzwGXt4Cf2EooYZ8tsoIMRJ2Ane+yMIFNGV/nLrraKjoVvAB4Wll1S2DwWXpy40VSsAo0PG9yrkzf3SOtJIWAnmypVIjHS1jUsCzhdtG8WTBfYHMpK8aDUK7drG0jYHY/A1szptzH6hG6Rgf5VchLR8A5C087d76m46oPrdDYAgtuvO0Wd52kxRUSAqrgGuXSiNJnaPBu5n9laAsTmMjXog8hNuEEludCGnQhM3IqiFuw4VqgYPfuXh6fb+I6hmeb7Kt2PGEcAclGikThYtUsvdR+iNkUv99jyOYQbkBMTL1uUdeO5774gTk0KCMtY4vaMtOmLMBGxcIJ5O9MIcgFk5lqZ4bpF9+62lG6IlVXlRECk8kKwvTaXLh+sL+noDUcyFz8ZVmMCIm+CvIWd01fywjkQpnW5K46qciogGwqvLK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qr7pnzD27/NLjmL+oLTdomiL595K5qegamv787WbQSsBvbfU7UXF6JC8x6oR?=
 =?us-ascii?Q?Qi5cJ6+o+wr4oUbSymbIzwGpZND6nkXjgIvQP9kksEGKjr1nXG4LHlEOW0gj?=
 =?us-ascii?Q?idOW52aQIq0BPEewNnvkPPIX7eAOpNXFhpUDvuHw94E6WUmyhOuAT+bb8P5B?=
 =?us-ascii?Q?mu8024KqBD2IxirRvSWWS5Xj1iCQMiwg7dj2pVTffRCDHIQcrKPHB4tjA3q+?=
 =?us-ascii?Q?wCu5Kc0tmurAaj2Jyhj1lZ+c4Dtzn+KBST5/2pn5LOFvgxe7en5xHsCU5AwK?=
 =?us-ascii?Q?dU3VuOckG7lJ6m2sTQSQb2MQsKC4pT9TkND8OdM2oG8EY2RHp+NiLzyC7IrV?=
 =?us-ascii?Q?3jFxQgzg8xrICJkujWUj9VmviSTspy04TO9OHh1H66BxBEWnpQnfZc3bLFjA?=
 =?us-ascii?Q?j88TrzT+xscuBsFqrNNVGzoJCnKz5TO0ZGu+klnoO/LeMJVpa1/rwk0rhESD?=
 =?us-ascii?Q?bmeVlnjO+JSGLzieD3q+7qUI29IkcoghpOuM52eH0Tj2uJNh1eu9yXVkdFVn?=
 =?us-ascii?Q?Lmad48pDEVE1iBQUnWCX4E94s7YYinlQLuVDNKXzIvDcLJk23rZEoi0udnIQ?=
 =?us-ascii?Q?lIpVmW1o+RdTVyEaXZE0P6j+hlqprcbLV37QQX1QycmREnC0NaXOeLROiykG?=
 =?us-ascii?Q?2c5E7hTlL+nqV0MzQ1w+YyzGyi+kupwYh9SEMMoQ++IUwpTN/synnxeuxNOV?=
 =?us-ascii?Q?+QmdijquddU/4DP7m3JWeJZTIrmcidQxeNNeaRVzBrCsrysGZXMTAiq2F/MZ?=
 =?us-ascii?Q?2okm+hkaIXX1eTQlUKA5lObl8Bj4r88gikdeSMrY9q6JtMHyq4NzTEo+ENlW?=
 =?us-ascii?Q?QC70En8+d+H79iSxu6ZK2I6AZs2haS1fKmJIUzxsbNR7fxJ59zJWvjj/sBh1?=
 =?us-ascii?Q?1Bz5BYvrFatNFF7Ea10jmxRwF2X6XiQEFPGROsUu6iDb01xXANX7pX6qmQRV?=
 =?us-ascii?Q?vZO6Fte5IZHqBNILK4plSu2qcU7faKWOfTJc7kTAcQLjJIY9RnMX4s5Ze5ur?=
 =?us-ascii?Q?9juLvgjzqK2Z1PhLWFmG9xEL4/Y0t2nf1acMxjenB19w2vvAxLkUesGnnFoj?=
 =?us-ascii?Q?+nrsi4f+8KkPTDesABJee+LFHurgAw8wXm9JxIAlrCyJlwRyz/tSQoSmN+r+?=
 =?us-ascii?Q?EMcqQIujNwIz/+EqFeMiiCW+1NUqL4wN2xtsX5QHFNIvrHoKQVh2hM111c2a?=
 =?us-ascii?Q?eK9cLjxeEoHdE0w6A2MtqLElVNSmGIazhqFqpC1adPX1wNWt78UDr78djfa2?=
 =?us-ascii?Q?6BNiYQY2rOh1j2MHJlzLFQwkZrvEKAzGDPRDALUKU0jhbxZ6NDti8B5HN9Mf?=
 =?us-ascii?Q?uIR2L60m06Yjm0qWLIULW+3TVrecirfOqSMqcG3fVLJnnZ4XWpeg3pmQRjUe?=
 =?us-ascii?Q?psAFKRGbrDeQ9JACyggTN3fJkCyHqf2Xj3cwiXktZOmoelUBMqJZ5M2vC6cz?=
 =?us-ascii?Q?hZRHaU4KdD+vn3oKWkDt6MRaAuUK6p3HCDYL1LP86MF4aaTjZU4T+i8Xd5sZ?=
 =?us-ascii?Q?ySr/ZugnMWeLQ389WyF9NZeR3wzCVm+jq2yulBvuOIAwGUzfhngqQd4aaC5a?=
 =?us-ascii?Q?tk+AYkL0RO3KTRTGGpb6p9FCPLSKVpgzpgisJIFQRETFt7QfbUJSN4vh2XU5?=
 =?us-ascii?Q?uiIj/1NQrwbRaOP6Q5g8o4jaMXHZY6ixsJ78eUDWz6Ug3w0s+yJDs14rxRyo?=
 =?us-ascii?Q?eoPmp2WrGtQ/Sn8cqcWEiDjPM+/EjSuSJbOs7LWAZ+zKHRGjpHYqalCNiJoD?=
 =?us-ascii?Q?pc8v0TwhCg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c510ec10-b3ef-4da2-8609-08de9ba91991
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 11:12:51.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bop4xeM6mJJQccJlvB0rDu0yCdxVjJrgOFrQy3BynUA5gOF+3nuJ2Lb5dWszJVG1w39OFxSNFSSZ0amIkSK7VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_041255_501882_E105BBB9 
X-CRM114-Status: GOOD (  11.77  )
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

Update fsl,imx6q-pcie.yaml to include the standard reset-gpios property
for the Root Port node.

The reset-gpios property is already defined in pci-bus-common.yaml for
PERST#, so use it instead of the local reset-gpio property. Keep the
existing reset-gpio property in the bridge node for backward
compatibility, but mark it as deprecated.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/fsl,imx6q-pcie.yaml          | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 9d1349855b42..e8b8131f5f23 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -66,16 +66,34 @@ properties:
       - const: dma
 
   reset-gpio:
+    deprecated: true
     description: Should specify the GPIO for controlling the PCI bus device
       reset signal. It's not polarity aware and defaults to active-low reset
       sequence (L=reset state, H=operation state) (optional required).
+      This property is deprecated, instead of referencing this property from the
+      host bridge node, use the reset-gpios property from the root port node.
 
   reset-gpio-active-high:
+    deprecated: true
     description: If present then the reset sequence using the GPIO
       specified in the "reset-gpio" property is reversed (H=reset state,
       L=operation state) (optional required).
+      This property is deprecated along with the reset-gpio property above, use
+      the reset-gpios property from the root port node.
     type: boolean
 
+  pcie@0:
+    description:
+      Describe the i.MX6 PCIe Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -236,6 +254,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     pcie: pcie@1ffc000 {
@@ -262,5 +281,18 @@ examples:
                 <&clks IMX6QDL_CLK_LVDS1_GATE>,
                 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
         clock-names = "pcie", "pcie_bus", "pcie_phy";
+
+        pcie_port0: pcie@0 {
+            compatible = "pciclass,0604";
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+        };
     };
 ...
-- 
2.37.1


