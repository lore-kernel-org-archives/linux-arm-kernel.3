Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225CDFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faACGMNZpizyjWFztosPz21RGF5jipmknDkqw00NaiU=; b=PjopFk48aUyLpDzz+pQzuJrDUj
	GIEV7Qea59xNMYKKNy61mKxarqpS5pzehag/8wHIU7Yce08mSkZidZIpNj5zMxac6CS6yoPgietM2
	dUUpZT2mPGdKhi/XVZfe+2A9u/yjdx3fTw0SbyRm27CvKs9Xd7efoHzxpj97VeZuy8f3acWE8N6Zp
	3C8/g1aDUJqwLQtqjfq1vTWnMGwFaEL2/sHZlAC4Kj84yVPQ+gy5zAbfUHlncnZND60V7HKM18V6B
	VZw+DwQVQtPHvKZsskWdR6gjFs1vZyODDY9UAXes9SDFTnizt2l4KhvcQCi3Bumedz8zyiAFMgmuy
	vu+LXrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdCL-00000000oEY-3Uhw;
	Tue, 28 Apr 2026 07:49:38 +0000
Received: from mail-westeuropeazon11013026.outbound.protection.outlook.com ([52.101.72.26] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdCF-00000000oCR-2acM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdusWNHsFg8PlXD1NrNTXy4Vm5XISrP+Vlt5qO/4oRRiHRgxxOxl/HvT/kmt7yAgT6hTZ/FOjDuFAfYXbdZcU8wTL4V/Ztd5CvixphTSfDLuq7lhmJjbBIEifr7AWfVXrXCxxzpeMFaI3+NflYnf9ofjnfGtQvtexOVg2u5/obRR/kCIg1HnDhs5oe5SvGeLPcwo5K3ZdMjMjfIjOfJfS29SIMJ03uP0mzI6tQLiKztF+AD0U4BDRfT+43QfYt63hrfWDXncndEhw2sh6NxVMHzKdpeXALCdkQa79CDkNMNitqHYfjmKlPF7hFxbb/ZflBYcskaq1Q9rIsEfe61/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faACGMNZpizyjWFztosPz21RGF5jipmknDkqw00NaiU=;
 b=wzPR6PxOypIyAvk8s2xGvyTiHv7Yvw7ZhEhiTiXDDY6krocUzDV1JnGsA/ffDKNQnEIAk9ScFH50ogNH8rGtsOiOT+xjpwNdbODujxaHkRTnqbkpkai7IKmdH8NKk84XWU+GdrNJ0B9v0prL8QTvjkMc/wyH3Oa2r5oP/V4y3mFAN41nIJVDtkOrh83RckGJla7bSA2ncKKm1FjvtSC7lQ8sY11sW9842MY54q1ENHB7FRWHp4dNmH4abxgL7EKebQCi6GRYvAOGqnNmwPRM+qdYqB237PLn5olKr+ST/HMzt0R5islrBKPOZqxjnQwwWWpmznHBLKKLlj82lG+M3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faACGMNZpizyjWFztosPz21RGF5jipmknDkqw00NaiU=;
 b=T53qDN0ZQCQjK6CzIkR8tAMShzA2FUWcWkr7mqTHugve8oZV0RpfzJXzx6N0JNsJ/eLM5wiIJ3x9UEb5kMu8Cqd9Qc7E1yz+qeo3DkpxbuEz5jQAuR1wR3scOOwNBP4d4RNFYiVD5DR9BdRQIi7+H/PEuasATytrUfAHkodMppfepA5w5T66TY49THJQ6AiW2J2TZ+kTJnthuptKsoHIrfyMCjg3D9bOOWTtr6aHRwZrDrHNF2DaLNjArpiANlu++CPKhVkAMe/xpA8MuWNnHPu3LM8i6x5OccKHGfzCQ19qkFYkMK4kPfXdd3etpuhaQPiXL2QAvAQ+bjyOwjS7MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by AMBPR04MB11720.eurprd04.prod.outlook.com (2603:10a6:20b:6f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 07:49:26 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 07:49:26 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and pme interrupts
Date: Tue, 28 Apr 2026 15:50:28 +0800
Message-Id: <20260428075030.1626440-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260428075030.1626440-1-hongxing.zhu@nxp.com>
References: <20260428075030.1626440-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AM0PR04MB5220.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5220:EE_|AMBPR04MB11720:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c1c08-093b-498e-ab3a-08dea4faab76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: SzuDBhoqp3tmwLpokyMj62ZvTetNtdyAvSW8bMePrk/gLKb3K7UYUYjmG9gAGToL12dli3S7fWpOqcu7ZLHmn0LiNj2vxLut2nWtz+QHQMDdoTXMHIC/ACDjOBtSUxSxZLVP/K8pqQxRY97tDpW2utxYjnQ87ID1uVscjBCmB8cLPOpzrq1+NT7NGd6MdsfAFDu7cRj1rhMlRngS8sFJxt3qWAFD2ampnKUNlM3TjDm//4IP+qczceHeXAfCZV+NYniEq4PZsKkPqVSkZu9vKFhw6crvEIxbJq0GBPfsKmAunIbl80M8BV7c0YUYZK9JP+Fk+NxM4WcMPXau5ReGQABASksOYGQJp0AJiFV8tN5I/yNu7I1rYI6mwKgJ6Dho2IoNNqV99meri6M3b/fHGyteEtyK3oNaA7TebYmd7Ch82vpKzXyQ4If4BiZSmVH2VmQjg+m38zyYcG8Woo23hpfvTTkAVLP+a2HzJIJduoLx4ehb1GOCkyuttzk0LA52jmv0EuxjjIdPuluDyq7FcohTiu4jKD3N7MucGX6wcQym6DFJRTm6OAfNmkYhcwGE0/XvSqMYPIgncX5qhypbsRt/W82d/1rcQ6vfF9aeOLUH+RcEHNDKdkwvJ22UyELR9tNC2RCreM1moYFq/lELaJIQ0vvzhbUJsaeknCCp8nZzJlyYLDq2FuK/swECUoxRxsOOl4I/pEPKaoRNJv0JIaaAi9iB0mWUaEL7MsgDnvYh2qvCGiqb31lvRMHexawBL7KoeeCKot8GpfEvQquBDPCmOIcJvlI1gIuiDVkKS0X9zCy5XfKGvc9cBQbIPSGm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IvxDUajqH7TwY3sa0B5iehgEMTKvnuxvOR8hekk6DGq/02JumU5c/qaO2E/1?=
 =?us-ascii?Q?+toEwFJ4K1HZsUt68/S3ZUsGP4/GAqhmIp1UD73o1bzPSCrhkvZtxBPp2LX8?=
 =?us-ascii?Q?8ITJVWY2xVnHFJUyGsCZGNfPl5h85loniLMsDDSEGMz8qJsyz9KGysLS1MQE?=
 =?us-ascii?Q?brz1KVDVLkTjXemr9BncQynmz0ou41zOlT69xWMfgqwTfZhVBo5i0GtMhlR5?=
 =?us-ascii?Q?0pIevTOQnXe+9D0xFOU9JzmWZfVbNZpMTev4V59nFoFwHsnQhOmrxMSMa1bH?=
 =?us-ascii?Q?MBXBYYkFYg0aGG+eC0dM7g9KMoMmU8hQkyodW4tzjj11WHmgHPtbARPSRFP2?=
 =?us-ascii?Q?wTK5bB5Ly5jxICaxeSZKuaEtGXpzxfx2Shqm873Pzm47c8ei6WbmzTO4RMNI?=
 =?us-ascii?Q?ZimESox4/zwkpLMpP9+VufYmI+T6oBarFx/sew6JQJH0zU3u0pWNk7xfEKhN?=
 =?us-ascii?Q?ICY48Y8L92qqaUpHKmzRA9b7hQh08+C3C3bblNO0oE2D2XmtHjZMoqolLlKj?=
 =?us-ascii?Q?/G8VCqck2LmcKlFlFyqW5Jw2hgp2KgDgo95ETzpYmpg3IiFzo/XMWbfY2LGR?=
 =?us-ascii?Q?BLcPAKZSa6Qc2R479T0if8ENTpdDHSiM0Patc/ZytUYF3cWqRGOuFow0gYIW?=
 =?us-ascii?Q?YjHMlUkS8i9fmwvqp6mnKitrFNKZ2DYUbKUBHkm60bYyNRJtF+0U09nMJejo?=
 =?us-ascii?Q?/iPpkK69ES+0oY96gUBjEKhQHAkf2TKcmmni1D6Vl12dx146EPDsYl/DmX7j?=
 =?us-ascii?Q?Ks/7ViGSweUX1CZ2YYosCP70Q3WYOfMGNS8IaHwLgGU2ZgQ8vPbQvwXXgR4t?=
 =?us-ascii?Q?OXd0jvuzF0MMHmplZZFWIGXbVnPS/WEJesVponxWUZyZuTpMZGC8A2n2parx?=
 =?us-ascii?Q?ve3DCuscCzTyB8H+cUQvLNfnLuiQQBaZLpi2lox3w1RhsaL6gVgl7+GAxX7e?=
 =?us-ascii?Q?fFBWTHDu9kTYJVBNMpfVG7O0c9g0Zu8KpycGTPD4ijwlMHUMUzMEj7qlFaBd?=
 =?us-ascii?Q?gL8B5LQez+/nBiA3OUliafekHiNgyROFv+EKaV1OaJcJewQNN/aNUgaavNOx?=
 =?us-ascii?Q?U4xFOV4MHBdQgE++PotKP2lVeAW5/GnwEdXI7n1PhhL+iwmiH16jbdyCNmgg?=
 =?us-ascii?Q?eXXvME2ORZ3OcJtBUevArfLlifcCfN2q5Y8loOmlg17tx+TRNWFi1FJdjuWN?=
 =?us-ascii?Q?koNS6n115/bNdu5Ys62hfaBqThNlMjwwFeAAKv6NvAN0maKKoFrv93jIUFA6?=
 =?us-ascii?Q?gnYydG2dCBrgLREV7BCoU9SJtp4dwpMh5rxj8FXKj+enkQDCA5hmbzlFh/87?=
 =?us-ascii?Q?XmmmRqmK9CwHQSfsbaU1P3Zif98S2NopWdRN4RHGHLACqFJgXsv9hh/TL6Wv?=
 =?us-ascii?Q?p12y7W0beVwjWxY9XAZREaB2oW0Fpi4drBGiN53kayDKHWI8641gSfOBis2S?=
 =?us-ascii?Q?LTZYXMS8BBTwWtp5rq8HWEeX56lsUQ9wKnSCG4DmoFn/WDHk+ytYni9RDtUn?=
 =?us-ascii?Q?D+u2K5c4+lE1ojoKkK5wYHuNXyvTvPVh/tG/dBxtf1/os6iARj+wguw64ipo?=
 =?us-ascii?Q?RmarzLTSy3kEHeh75rtXy+KTl7JwFzRDtH7kbW2neebGtlpmvoKQW7mNkI/u?=
 =?us-ascii?Q?hvR+xEGJmX7hcKSRZDlJMvMaSeupl/U93VL2iLLM7F0+CpzvZQ30Jw0v0A2W?=
 =?us-ascii?Q?+eNI08Ujcs7e8v+v+Mi/2hxJCfHj2TcKjpZQY1m1daJFgoX/Qr+aRNFdiVEf?=
 =?us-ascii?Q?J0mPYFZDhQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c1c08-093b-498e-ab3a-08dea4faab76
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:49:26.0469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Fi8mM1knlBpdTQk9ik2qkshr2Ozxlzd+/YU378o0/xxEh7btssBh9zayL2CG2HulqZrmL1Q6BlUHb/uN8YaAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_004931_655220_76DB10BF 
X-CRM114-Status: UNSURE (   9.33  )
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

Add 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q PCIe
binding to support PCIe event-based interrupts for general controller
events, Advanced Error Reporting, and Power Management Events
respectively.

These interrupts are optional for most variants but required for
fsl,imx95-pcie, which must specify all 5 interrupts (msi, dma, intr,
aer, pme).

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 .../bindings/pci/fsl,imx6q-pcie.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 9d1349855b422..0913c3312ed26 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -58,12 +58,18 @@ properties:
     items:
       - description: builtin MSI controller.
       - description: builtin DMA controller.
+      - description: PCIe event interrupt.
+      - description: builtin AER SPI standalone interrupter line.
+      - description: builtin PME SPI standalone interrupter line.
 
   interrupt-names:
     minItems: 1
     items:
       - const: msi
       - const: dma
+      - const: intr
+      - const: aer
+      - const: pme
 
   reset-gpio:
     description: Should specify the GPIO for controlling the PCI bus device
@@ -231,6 +237,21 @@ allOf:
             - const: ref
             - const: extref  # Optional
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-pcie
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+        interrupt-names:
+          minItems: 5
+          maxItems: 5
+
 unevaluatedProperties: false
 
 examples:
-- 
2.37.1


