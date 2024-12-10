Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDC3E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFAHBZy4ZfeGfcdj4lEW7OAjAGzm+SGI5yjjwYwdE0A=; b=tWGkywbdtunIYGAQkEZiACLka9
	erUjFsdzFHrpNB+c0+NARd0LafR862wGW7i5Emy5mDfbntdpfL91n2c4DB2NLV1HOqJOylyOdQ0RC
	9P4y51r0TbOQn/I180tt7wuiAdNTSsCVlSV9/w0etJtGN5qQyde8Ii+wJ8qTWXdSk+yIJsVmFv0gq
	Q6zgwUBcuM+519VxewphjC4WX83qzXOhSdeWMj30iUaKqnRWcP5sSwQ8qWYmMv07gCmZLsAhdvh2r
	gQ8cUBTFm3a3jp31JLs97KCH9YGdtB5jtiGAs1KMZEvGcOCCVjzzJcaQB69+POmDWx1UCYNF2m7Sh
	QR6i9z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzpw-0000000BVNG-15Yp;
	Tue, 10 Dec 2024 12:59:36 +0000
Received: from mail-dbaeur03on20607.outbound.protection.outlook.com ([2a01:111:f403:260d::607] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzkt-0000000BUAo-1I7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6I4sOhXWNhQXojVf//0qfd95hG+O5bGZqiA/EZmagxO1zA/QIfN3zLST7mK2QKTh2trhKiDUUAxyXdCqdHSMVx6tZ54wZ295A5tREgENQoMhSDRpLziAYUFtdWdxiywahElXOMqz1TqTYaeyhHp90vt/2fo2J4AW382y+o51hBAvhhbESntmSuvbL9OfspYiOrkIsiTROU+cFqfqEnhvZgyp3381t4a9eIZgBOpXkkAT5V5xXiugwcR87eZsHcun+HzyCVho7diXQQOdtSTwbkfZENHWmJnFnfJB/hBSIHiS7dujfZ4cUv5Sgkv1X3Fwa1+xGRg/n5cfoUtZ08x5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFAHBZy4ZfeGfcdj4lEW7OAjAGzm+SGI5yjjwYwdE0A=;
 b=W8KlATZQi+OpxzRPSxBIlISp2TqinDx9JzdiGGRwCb4bMuX6z89CsTqtXNXRcDMjQgS25Oja6Rv/5K5rrNBKYEBRLWANjddLabBjkmnvvQL5hlzAGEpac4IvJBPZUacuRzvUzDnmPLIetYM/OPKl/tJv0x8x4D+9LZR0dWFgCmU/6XIT0VCe65HRHYhp2t8zP8XqVw8jmxTSzokyu1G+lghCuDMzV4Dh6kZU4U+KXmYUFOzhukguCSqnahhkSfQN/oPwTRLdrdoA1FoYE2qrWu3A+hP7E4+wijGhuCWFnoG2fnjtUfbo0a0IhkkuWnm8YANoNMkWjWssR5knKueRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFAHBZy4ZfeGfcdj4lEW7OAjAGzm+SGI5yjjwYwdE0A=;
 b=Xc5zV2usJA9BzGPAZ3u7rnjdEQkFJLQa9XTNvHV6UTwZvmrdSt+fGwQQxVQCPQ7QqxFPsd/czVpFpzKgOw2GiA76V2elaYLQUet7JbU20y88p0ubFkJrRYAhPN1gv/UilY/6GvonXO7cvoryaA+1brXZ2gFmwXwWqOp1kpxNqSUkfQ013S4KffDHFn9tqLcvbO2uOqKO7jFwkuhgNyR/yh8sXN7Qq+Mi9Sn4AbqH/LYPsFWGH78fNhaX17/F39R6fLpjAlIR/lXWCYZMbuVb7vFKbkOiNAmcHiv8uD6BmmN0FFc0JbdEgmQ9E1bYiVJgokLbwWKykhddxhcBQPU1kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 12:54:16 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:54:16 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
Date: Tue, 10 Dec 2024 14:53:36 +0200
Message-Id: <20241210125338.104959-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210125338.104959-1-daniel.baluta@nxp.com>
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e45f8b6-f6fb-48bc-97e5-08dd1919c141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gk8EBcp14OT2yB6NDz8/4D7s32Hf32/fSfsIL0LYEcTENmoq1nHm/yeRsin0?=
 =?us-ascii?Q?N4LtrrYj0wZlXueUZCYKHpQfp2DwXmHsz8e23dVFiZ1gk9WfKgq5cIoztz0K?=
 =?us-ascii?Q?7AbvMVjA8KreogAuSLcMlv/Gwsz/9dfVLM8A/sdR01Ivc2YtErB7Tc25Ndd7?=
 =?us-ascii?Q?wBvlxQ7e1UIXxkSKpDcrHJfe7U8ghMZJl8ejerBJRatqyVp+E1w80nozsQds?=
 =?us-ascii?Q?usoXsukRfanL1dxelSMpIGsFmybbOKNmRoXv8TmKwPwSpqeaLhoC4pBWB7F1?=
 =?us-ascii?Q?czKUEugig1fcfExbR6B8ftQt5D/JNlzd+SKP5Dno4ZtTt1QS/Rsj+D9AdIlj?=
 =?us-ascii?Q?c1U3bDyDFxoBy7SIrRjECdbtxu86M3DW/NN0Q4mL3mlKFhE8XuQ7RqoN/Krq?=
 =?us-ascii?Q?iSgxJ4iW4+9gTi/2psXIDfnN3B93PsJykvbWux/IQtjIvtilRvE7BimCiuoD?=
 =?us-ascii?Q?vwNutqfzcMDrmBf7xO5pbL4cuDJGysOSuSNoJYaGmkMZrjb2loQS8kmwAl/K?=
 =?us-ascii?Q?qDES1nDsrKvpKxDu+jQPF0/fM1U471RyYI9hVdduxMQUPAO+Z96CltAxYRhT?=
 =?us-ascii?Q?ud11DVwzrRqi9IeLVk6amZcuznwP12tgf/HCeJodcJExdK9VNogDLDme+aaP?=
 =?us-ascii?Q?YrgUuO38eNQj0swPCZyc9IffrbhrGGcDAiL1Fk5bmVaKiKH6LNkzFZVsUUeU?=
 =?us-ascii?Q?NXsqiJKoRqf5SNDPGkCTsAj+Nn/rp6B5B1l+AyWL1KBV/XlFmIi+5pyRwbhJ?=
 =?us-ascii?Q?8uTON+NveIhJgKxf6twcNP6/5cOAKGK/bIF7PqR3wCeajYcSW+h+sncNbbpj?=
 =?us-ascii?Q?PLmTetwKHd236CNJvPfhjzcbgeMPEMsbcDnynG3w0lQgMQ8F/eA7SxVz+vMk?=
 =?us-ascii?Q?bo1dgv4lSxrZWXV7bnPbTE/wvy67u5kj8c1c7Msc4eaGyNOnIehJHm1fIxSj?=
 =?us-ascii?Q?W2nD1O+UcVlncfwU/iApvup4Kg4EEwgpgBZxqTeIO3U5pmNmFyM9XeVIWsTK?=
 =?us-ascii?Q?vwpw4dT26IKlE7MZk1Anz1dfFJbIFIu+g8EPPLl6VaVdBv90KZ2JVj06BJrq?=
 =?us-ascii?Q?+2iuQhTUH1OGYy73xtBBAXXnXLdlz9P/BlkAvNtjTas4IkFMITiTSA4TmLF5?=
 =?us-ascii?Q?UfhHfM3SRsJssYBZfssY2XwoYL1uicz5aj7CbyJu2J6C1UlM7B4ByvVS70K+?=
 =?us-ascii?Q?s/I28D++dW5WTUmGsJZhg8g8uX3nzr9h8u2feyK+Jo96+JIYVZnVZVGX+kNw?=
 =?us-ascii?Q?C5cCQpQml0iMZh4HapDU5F8j8m945gTkD6sLzGjfgi75FmppMBrPsKQD9ViM?=
 =?us-ascii?Q?Usdqutnl7b9WvYjtV24HWxJOxRphpNLqdHlkfOJlqx0vjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJ1qcU8wD6WuTEQTnHP4FHaGFaniQhraI3/MF94ZcCGaXrDMhF2Y0KsHZKKJ?=
 =?us-ascii?Q?x10ups5q7rbDfuhc5C5ee73HZOU2xDw9jQKG3aFd/n6AoXoyUjqnZ8Ru6Mkf?=
 =?us-ascii?Q?wlOQH/SuQUaI3G3klDFYDYnEjl0ML7hvF0OylfEvIf6fQwkbZJFeA2r93aii?=
 =?us-ascii?Q?qSXzWjPJjw/Fc9JM4vDtV7ahZumQ/g3tadctS1mCGhEH6eDxY4j1xk50ACqC?=
 =?us-ascii?Q?mAT57CnqQQ1uiA/sqO8THZltbR49kQD6gjuk2x+WgWSuFhsshDsosIEL8vYv?=
 =?us-ascii?Q?NAxDd2cw+f79chw0TgmNqPooyt27Ac3nLLMFK1cYBBiTupslsfc+TVl0bt4a?=
 =?us-ascii?Q?oU4vC/Ob2ulEIyOOulkSX3gx/18QgzbRYGQReH+XytD6USTEkotRSNS6ULPl?=
 =?us-ascii?Q?imt0NfvHYjl2VL80EfDuJRBnb6U/iSjbHSjqiqJtJOG1Q/Y18W3H5f5YKlnU?=
 =?us-ascii?Q?2KOIiq/zCRzZAQMd6ezaUL/w5svkADzi8VEYnU2DGU04SU3oJ2bwBcrbUc5s?=
 =?us-ascii?Q?B0W7UGa1ekLa3F7qJsaSJpI6upOoc4bXhypKKScwEoD4dwnD6lD8C7w7moyW?=
 =?us-ascii?Q?1A0fS8PEW4sKicHauwCfAk8mzSnXtpSHLUy/43WigeerbChQvSc0eC4xl5LE?=
 =?us-ascii?Q?v334TRNNq0iB8vMfw7vyMNcJjkr/UGFBa8miSRSlCfDoFd/ya4xtFJLSjK7e?=
 =?us-ascii?Q?ILPeEGY1O7T83rm/A0/4oqbZ0wxEmQ3PD9c9IvfiQl2hB5bBW+yATUY+g9Ke?=
 =?us-ascii?Q?p4YVRWfdqPbPYv1WdKxznY0WRhC2uyVH7WAgCsLUWNm+AJfcXkjC866IEvBF?=
 =?us-ascii?Q?xp/3YsQlOFQZv+tiPyCQR+7hkHRiRtwJYDcHmjMdIgx0IdiEY/euRoZdahxA?=
 =?us-ascii?Q?dvrDyWl3ODE5ui6LwHBZ9rxo7+6kJg8CSjJG/mTgDsPws/ZxF17PdNb+nOqF?=
 =?us-ascii?Q?tgpEfhk6chySn2k7yMtZExmMi18WpzjwWCUWkgTxFOrjbTyVIjAy4xE/RvMF?=
 =?us-ascii?Q?HkwM054IuFZ8BPuT4DK2AUBVWXgOeWUu5zCOz3ZSWD2L4j375gMzDQ/A+F34?=
 =?us-ascii?Q?MOfM4W0XkXvr38hbNa89EhBxaQvuMQo5/jGkg0klIHB2KB0X9WhSeFF3A5H9?=
 =?us-ascii?Q?cTmIWkGDKubcU/d02pMVMOSzilV0alDHNEET5sXSC9FY9VNJF9Oa8H2aD7Pz?=
 =?us-ascii?Q?17TFkMwxcJzgY4Rjlpw0kEq2FIUXuP99cPOg1nvYi5FqtdC5ZK66+CBogJHw?=
 =?us-ascii?Q?PdWKlDY01or/h/7HCgfICgyhg+n9WIuAKs5S2SzrYcfiHeVYzQvvy7qeq/wY?=
 =?us-ascii?Q?rms5ODbE7zglCXAyBZ1TMbb2QxSyY7+hNox18DgZlLga6demcnwimfk+N80Z?=
 =?us-ascii?Q?HWisnH1t/L0VEANy6akOCcCOrwugXFdK6eW0iQ57id7/L/sBYjQlTI8J1XvU?=
 =?us-ascii?Q?xL3CxNtSwprhXtZnPGjL2icdI4q4Vg4xq0BoBiUuqkMGFDCTyko04HdzGARz?=
 =?us-ascii?Q?9xnJjaR/b9ljtJfVIuTTgcbLnKNWnBENG8qIBUaLJ9Qu10MRpSRvgVdNKZNg?=
 =?us-ascii?Q?bzFog6IRAyjrjgkIMk3qW0tWpC/Cy2zE+ik8fo2uN1GHwngxcanZ3nXBjggg?=
 =?us-ascii?Q?yC2Ym1Wi4m3bjeexW/MFIKFXYOOrnV4OHNXBj5oeL4xZMPWq//pMd+FnLbBF?=
 =?us-ascii?Q?zEsD1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e45f8b6-f6fb-48bc-97e5-08dd1919c141
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 12:54:16.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30sV8oOcqIcaN4ymW5UKcdLHkt5XZL/tv50MDo7D8qMFDctoFaSI1yDc2DN68KtPa/gdUn6T3D4bNIeIqu7lZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_045423_351234_D773B017 
X-CRM114-Status: GOOD (  10.38  )
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

imx8mp audiomix contains a set of registers used to control
the DSP.

The dsp will use this to acquire o reference to audiomix registers
and handle the registers to control the dsp.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 6588a17a7d9a..0f870aaadba2 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8mp-audio-blk-ctrl
+    items:
+      - const: fsl,imx8mp-audio-blk-ctrl
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -63,7 +65,7 @@ examples:
     #include <dt-bindings/clock/imx8mp-clock.h>
 
     clock-controller@30e20000 {
-        compatible = "fsl,imx8mp-audio-blk-ctrl";
+        compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
         reg = <0x30e20000 0x10000>;
         #clock-cells = <1>;
         clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
-- 
2.25.1


