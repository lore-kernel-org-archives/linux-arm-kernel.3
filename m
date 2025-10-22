Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B22CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM2lTYzLW/GkUVn27cris7elo+2lNEukKI+VCyXcIFc=; b=QB/3FwUkIyKquq7KtQnpVYM/Ps
	XZCAv4h7ReL3z/iTKKI6NGoecajYuiVNRiLslQC7bxAowfznjLw8t7ZPtSNqym7WcKgYl/wGOnhU8
	yOZyo/+n4jiU8ekspxqVlrtRKK9Q7gDmGlkz8a/kRnCSdb4EVAbAPdfMWHCtP4NaBStjSEdsM9o5E
	FH2pisNJ7sTApSDlXVZdOlWpgdZjgAF7D1gCOPBVujhFupWN3CttkPfi6tmRFHiM/3kE/XNF/Re0f
	nepz0nj2AMUt6zhU78/zxoeAddgeHdjqqc6ZCtrTyFkqjN08UZJ8uZp8gbtRhenoJqS76xfouMwMX
	fJ8hN8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTZM-00000001w6S-34Rk;
	Wed, 22 Oct 2025 07:47:40 +0000
Received: from mail-koreacentralazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c40f::2] helo=SE2P216CU007.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTZF-00000001vzC-47VK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THO+4FUT3lipYF4eX1Lv2Jq+1KHcXlX8WrUAqA1d9PeGBHg1yUkIiyqZgzT6Jq6hX+cFvyem+Eh68Hlc2ZQHzmMFWgrHHJxP9a0XSleVkdQRCSHwF70VExKgUbwzDzssmJdSInKQ+Ia/0uJ+MyBcgQbxkW+xdnuPQWkqWdL77GoMzYEcwMFFt7PxTMqULPDzgWhwL8+1nQfT/wYQ26jDe5J4UdPOdX+OxZDQRsLlS0YRlluSfExKg8bR8EoXSdhtGidf0IIDxCFIr3//fAEnwu4GzGlDzzEDlDdKfmXIOqz4mDjq0f8kdHrtPix6O1j/HOGML19gRr3aOOIoGwe97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM2lTYzLW/GkUVn27cris7elo+2lNEukKI+VCyXcIFc=;
 b=LKV4VyvpQb6bVN5jUaALMPLIfUj0PmuCRD8+sSuAPsUiaGulAv9dA9ph+G8fMLQ4/MY4jZd/+/yR7AZH9ggR4ii412oqwKTCTiyE7kEu23sdp1vzaUz34H+rVVQzmmOpHQPo3VuGhHaZO35xYSGGbfyzsAZiM08s0ztdbbQ9HlD2fFHXEmlVvc4hBow/gWMXf0/tz7ZVgqP/liPtHIGItX+WEsWXRrGEmDST2wB4aKoM4fJDjeXsVzN5BZ30G/8MjaebQpBgvRTiS1x9ZyxNDO3MXvMrOxi4R81n6tJX23n0T1zeBv9Ai9kh9CQFGkR4caJ1H2RK8pMLntyy3Tfv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM2lTYzLW/GkUVn27cris7elo+2lNEukKI+VCyXcIFc=;
 b=KHxGBLTNpQc4gvFjxxpJvTdOU9/lVKalCMlCb7UWpQYNEMgdZ9LcTYmn8zOFfWyhvTojxNfWiAGO2jGdNKCtGZ0Gipd7VKXKup0ouow3EwbBck7lBD420z+d3bOZJaUtW3Q1HFHkIc1jKsE39YiSEWd4oyaP5ZPtsbay6pMHDk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB3135.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 07:47:24 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:24 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Wed, 22 Oct 2025 16:47:03 +0900
Message-Id: <20251022074710.575-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB3135:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea6a9dc-c04c-4969-19d5-08de113f3d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UIvSh6+dea5hU0lrEwad442UAdlDstDdEjaICmogpjFGaMk99JtfMEoP1yAs?=
 =?us-ascii?Q?j365GPuXptCyvVBue1KnHj25QEV5W4MPKoDmmUiK47qHplonmbWqclVM63bj?=
 =?us-ascii?Q?w+kCaFzKmp0cgOT+9eSDdFhodntJrbwzzkdcMZHwPfqHtzt785jMd4Yx+V64?=
 =?us-ascii?Q?30kg+EUdHhuPT7DfIpmwiShtWWKSyPlXaxrKJSBztmalXHdPP5M9SAsGQwzi?=
 =?us-ascii?Q?A87oTtOM9tSIO2twSGJoENfeUGyRBuURk4Wg0HFW4dchc5Ku1hLUCdnohaNG?=
 =?us-ascii?Q?lOOUpM1o8zuGiGmwZ8Wo9cgvhGPA8qERZadxYkNm6swum1HKfyX6LjHwWfQ/?=
 =?us-ascii?Q?Ra5IHIK79mLEvon+at+Gsj/U2eFkoPOYULy3hWbFCjMRPAt3Dicvhme/aRfY?=
 =?us-ascii?Q?TLem6UxmoBDUZsdV50fQcZlsVPDMYHEEE8zGEComCV/lttVeCFl4l2xiUCa3?=
 =?us-ascii?Q?kEQfKoqH6PShBXs0P2AwdO+RhBB58WJsZavsYOfW6vMg9RB8piW2dWkgaw07?=
 =?us-ascii?Q?DEw3hr48Gry242g97LZyxqJbGMVxp0kMMrCnkX+sTIABZamtHRsX333ehZ1v?=
 =?us-ascii?Q?DfVCLEFP8x7YEIwixd/tdRK7lOMXf1i/B9/Klzb/rwjOe3hvu1Fjmchv/Llp?=
 =?us-ascii?Q?z13w0zZWkD07LDi3HGcteIZaqjeSEz2wGhm7rPsQrk7W3sxc00OYCuQyw2hA?=
 =?us-ascii?Q?mtSudBkaCRSMjs0e8N6W1NSrgJnU+aDgos9531jFmNDCMoQtEDu35FFUfdfD?=
 =?us-ascii?Q?a8DeWfmlU66M/jfpBRDx71I4FQb5zc0bjW2Xpt/z6aZN6PYhoPLdmt31kEMF?=
 =?us-ascii?Q?DcmpQHhVcFeFnCENDWO4WK+L4sxP3qXxpugsQrJry7BAEvEiK19OYokNlBYG?=
 =?us-ascii?Q?i6lxMotk3HhrimSoAnYJ8nwcZmmIAYHRBmXgWZjoxrWFrOseXp0aqijyAC3y?=
 =?us-ascii?Q?ZeeEfh1BoFPbTVWL4E/BzYDaBbMR3C/JkvMRpjmU/OHr9MNMP988OgPIbMHH?=
 =?us-ascii?Q?6Px2HAeeq49ZKWFqatxaHeu5tdnaUbU16dJjQz0eHtA2xcqVrmkSXsWTo8DI?=
 =?us-ascii?Q?ufv3d+/QnWqJ8x0hj8BiJogQoVGxIHUVSREudmE+o6JATsXCV7lA5xZ7It46?=
 =?us-ascii?Q?W26xH42sIxBMPEURDdiIjT0aNpWKt4sLu2V61H7yX7o0f0nIxCFNbO4zCYy6?=
 =?us-ascii?Q?U62y2YZXBfUSabvH5dK9s2UsD+5RltKi8BBt9WBph4DNYG7tBrvTMtuh/v+F?=
 =?us-ascii?Q?16/bgF1ZmlQqSBy+6DQ7xoD7NfoxRMi06h48wxjWqch5uIZ2m2/05b3RaeXS?=
 =?us-ascii?Q?1nQyHDJePvfkGUY3XwytAgLBiosiw6FU6tDqxdgqFM4eiiUB+W0OAFg9zT93?=
 =?us-ascii?Q?M2bYyFmPj9a1/vJHQe2cTm/5MjXdvCwgeccNzfmAmDVOeCFlrr6ucfPiu+yD?=
 =?us-ascii?Q?MFpwAvPpIjBIcsaH4dyYZRtIA3DBloFG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tj5SahybgWtKvO9IiXg+Mu5GKnDxMqDfjY76DB1IveaoJuWDjCqw+UMTXOEP?=
 =?us-ascii?Q?4iO0JSM3v2RXFyeEn54BXwNgxcRPM/ibjjUCR+x9GG1nYDJXPABjw0nAlC9l?=
 =?us-ascii?Q?dDthqgBY75xgVwHrHp+ScODgCd19uUEHlUhxsEdit/G4KrvOJZX+BHvntKa+?=
 =?us-ascii?Q?JYX4mWyaeOJavy58rhS5Au8sd53iic/VQXoz1RNc3XnqwylmkvQiTrundLq3?=
 =?us-ascii?Q?7c84yttBqAb3Q5fVYsPoTvJysjiGISdKPbLSx0DLh/23VzTUgPb7oLXZhsaC?=
 =?us-ascii?Q?XiKJNXwW9G7HETMPew3D7wLuLRhHs6TEkyj8ULCkNEUiyKf+Bhdo9gRKKI6s?=
 =?us-ascii?Q?fNfF6d22Y70ygANreXYBwNP6WGax5Hdi7rt5JbUI693lg66c5M+23t/4MKjz?=
 =?us-ascii?Q?diXUV2XfnAzxJrbhDHw0fhEIAPr3++qvGaZ+oj141D+b7+Ui3NTAVs2YxXOF?=
 =?us-ascii?Q?4wwI5TF6UwLp00Id/I90NYwLfEKth5x+IiceDiQvdlDiJPBDqdpY6Gqrnolc?=
 =?us-ascii?Q?qDvve8zN3qa3Aluw4s7w+St43T6mrsBe6UAUJ+FfTmIDQJU1sh7xKIqZGzUW?=
 =?us-ascii?Q?yetYpB+1oWuGmhoHcYpd34amy2S0SafrMunaXxZSwUQQL44u1UYC2tqW6l48?=
 =?us-ascii?Q?7zYs3CEk9RuAYaqv10yKQ+MDNxsBN8XgBnZT29HEVJbPs4P9YQxJYuGWF8HV?=
 =?us-ascii?Q?U4NrPkhzZd+E0RK0pLobLMdbvuZRC5nPCIsLKT8t8A3Btm1n0B/28DmYxqqq?=
 =?us-ascii?Q?UL3+c1w/OFJT0XGw5x6UAahcoMtjj08t9o4rLILrKMQ0ro1b3IbzDN5U3HVI?=
 =?us-ascii?Q?yxG/IpJBmL+RgAPbB9s2+sRlgzSZ/JezQsS6iKwu1TAVYYWDwyKD1HPpx+HB?=
 =?us-ascii?Q?ZXdKkol3c2BsiDdGP7GKaeiwtyY4s28LrkSP9VgdtqkDDbFPWS/AlGP1dRV5?=
 =?us-ascii?Q?uBt/aXih2nEAu0dsDQNPVOwv/6dJTkoLYMKO+dDxbmqCIwepYU8PeQiITAEB?=
 =?us-ascii?Q?JYwB42Vsc8T4HqWYxgYakWwbDM+45e7cS5PPbIzpXgTK/y+OMfb/lcbKXeXf?=
 =?us-ascii?Q?0VUJzRGPgTH/61cGi6RBIMEjMJB4yMbNohVFapJSX3JzYd2fz/337VeRZ4Gd?=
 =?us-ascii?Q?qh9w94DiogUKlbZ8U52ZPuqkCexnGyYZCyoeG18wXWNEolOcqafwbx70Hdc6?=
 =?us-ascii?Q?ZAfKmxNLQsXqS4Ij76A+W97are9No/mwDYfd/0C6ui/O5m/0TJ81zQ2K5cRN?=
 =?us-ascii?Q?U/DdRPsWjibSS4ioO7crwCwquE1RXYq2NyBL65zMXFFWqA/kbeVJs8mWI903?=
 =?us-ascii?Q?IQ/jzlz1uZNCFBpruLk2xK8CxkP7JPbeElc/+rTTt7Q40MzeVx1co2qwPTba?=
 =?us-ascii?Q?gdOYGNugjxHethkIvXRxmlTNRNDwdh4Lva7Yahdzj1yELwmRbu4pxcqa7j7j?=
 =?us-ascii?Q?DoXGx3QS0aID2pnkcFIpSvwE4eSbe3DqPgS8bn/F2lhCf8NmsSbMhMCiQ47E?=
 =?us-ascii?Q?GngNCvlaxD+UxjSoUTbRkZRvPVy3An3YaVn5CbOzuLUBzd7xAYmROC+Jo71l?=
 =?us-ascii?Q?oi7NHj3IpTuuFOOWToE7LLlgq6825F1citTOYZFQfLPZheNO4WM4tmvG5BL5?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea6a9dc-c04c-4969-19d5-08de113f3d8f
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:24.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPCeYhvqLcDXecHb/Ox4YzIIq5lLAlFRo13Vx6C5S7sEwH7G1TxJ2KxHGe0ER8dLSuRTA9ahLXR0AAqPwqVI8Wzl+c8wZqADDJdKqynztrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_004734_063370_AA83AD5B 
X-CRM114-Status: GOOD (  15.94  )
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

Add documentation for the Chips&Media Wave6 video codec on
NXP i.MX SoCs.

The Wave6 video codec functionality is split between a VPU
control region and VPU core regions.
The VPU control region is represented as the parent node and
manages shared resources such as firmware memory. Each VPU
core region is represented as a child node and provides the
actual encoding and decoding capabilities.

Both the control and core regions may be assigned IOMMU
stream IDs for DMA isolation.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
new file mode 100644
index 000000000000..2ee8d22ba468
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, Wave6 codec IP functionality is split between
+  the VPU control region and the VPU core region.
+  The VPU control region manages shared resources such as firmware memory,
+  while the VPU core region provides encoding and decoding
+  capabilities. The VPU core cannot operate independently without
+  the VPU control region.
+  Both the VPU control and core regions may be assigned IOMMU stream IDs for
+  DMA isolation.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-vpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the SRAM memory region node.
+
+  "#cooling-cells":
+    const: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^video-core@[0-9a-f]+$":
+    type: object
+    description:
+      A VPU core region within the Chips&Media Wave6 codec IP.
+      Each core provides encoding and decoding capabilities and operates
+      under the control of the VPU control region.
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - nxp,imx95-vpu-core
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - power-domains
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      video-codec@4c4c0000 {
+        compatible = "nxp,imx95-vpu";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        power-domains = <&scmi_perf 10>;
+        iommus = <&smmu 0x32>;
+        memory-region = <&vpu_boot>;
+        sram = <&sram1>;
+        #cooling-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        video-core@4c480000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          iommus = <&smmu 0x33>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        video-core@4c490000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          iommus = <&smmu 0x34>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        video-core@4c4a0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          iommus = <&smmu 0x35>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        video-core@4c4b0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          iommus = <&smmu 0x36>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f7351fced572..a57fee506d57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27558,6 +27558,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1


