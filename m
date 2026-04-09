Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1861EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7DcekGq9Tl/ZcJ1o1l3FnmKZsVeIpiOD8VTA+UCuAg=; b=L+7VBz1UsL5r6sf6d7vYOVZ4+q
	D7XwnGevfLefqMv6bGGCl2bsTdFpOpqgsfvCux2xRErm1sdmRqDQZUVA8pgMUkSWAxg6jzO0zg8ju
	fkMZMYrzEtvravCh08bSqqAvdVzHpLoeWSrXaxIpXYdlHmb3VUsE8KmiA5taaGMiyOPZkBdR3S52W
	hQwHEacugGlZ5s1QuaxzrxSBDr+g+7HW0KrtJNNvLU4r9c3aLJvDJzDrowTqc/wJFCqiJDoah+CWx
	lYYNv5ibv02EkVEGeN1Ag8XXPd0LS+CSmQnY7Eym/7RXQtYY0s5cHmGHaAdL+j0LoOm7V9ByR2Fwq
	XV0bDs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo2D-0000000AKYK-1xbW;
	Thu, 09 Apr 2026 11:58:57 +0000
Received: from mail-swedencentralazon11013066.outbound.protection.outlook.com ([52.101.83.66] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo29-0000000AKUj-0nyL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:58:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pp7GmG7cmir7ygHL2o5CvFwliP85ITyvZo2YLbWGud1eMBL0IpuFIOiYi9XegR8kWilpGF8aFoDIofoaDEmAAFaWpOV3BYgZgeHLyCjdrhqLbO3HGX7FckP2Dxw3wEu02E4yi8IcI30/qMAzPEIrYMEsobKQS6u8gPuyQ9/9YtTx/C/UwTChCkd7Z3tme9qzIiQ0fqHDum6fHYp9ZmIOeQCMObaZTgx6rZQNRqUWGPNzgK/mq1U0nd+gbpMXJhHAIJiCqT14BhtGUcMNTUQ4mhnuxajXT3Dnz9jKcduEac5dImNYEC1OdLVtCNI8CntvK7KulRGcmYwNo1Z1J/VLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7DcekGq9Tl/ZcJ1o1l3FnmKZsVeIpiOD8VTA+UCuAg=;
 b=osjfvQK6SU5rePVG5asuBS/u0BICA7WurRjx+5Z7Azxnu04+ZP1D82BzeQf1HrsjX0IDGPLEzMj6PMGTba0mItp3KthCelpscQRMbw4+Lga5tUAux4IEAEz9NtyC6GHeXzP+FaalBKdBTBFsTbI/OlfCrCusFL8b/9KEXEAXj2MzoyMmtvKW7k7h8c37qOk3rVx9dves2NGDIyJoJ9PmD5KvLdknrgnNN477uHIvlhUHXSSE28di3mnwoZoL7Jqn2WpQNQMxau3ll+9lB0HF0gnW3GdVaWf8hJxsdDDKRhwlTARwJzY1o0Dqm6WOZZfKIt7o/FdOaeRybTqrHjZOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7DcekGq9Tl/ZcJ1o1l3FnmKZsVeIpiOD8VTA+UCuAg=;
 b=rASWHcoQ2dhvmVNOUtnhjWAadByYn10F5OROQisdUMGVoWF2VWgcMVKXF2qoyF/D0MLnvN39dcVpVlScyVlHyert+UEpw0caV36E8W/yVQ6TQ56nwYbfE8/hYWck9Vt909ALiDPQsDnjXtAbzOH3GYgzN8SPZ0yTnPGhh8+Clp6y6VNS5QcdbFP5WKT8GOtmzANACF6N3cBM3nrLzLFRtbSicE7D44Th9u4pTbmVtsAUAfmJIBC4FLUlhafGWErqWZxRRdufYJHzk7XDSnJrIKfMH0WXnzvNRaIdHDzOyNNei23D1uKkMntPdgtq4wv3EMBdvoeFcLJ31NdEYd9XwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:58:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 11:58:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 09 Apr 2026 20:00:03 +0800
Subject: [PATCH 3/3] arm64: dts: imx95: Add iommus property and enable SMMU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-imx95-s-dts-v1-3-858e83ae1a37@nxp.com>
References: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
In-Reply-To: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bc9205-d84a-441a-318f-08de962f56c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: UGD493XsglYz9i+JuiJMK4CqItq34FOOdn5KdNWwwYcNVqUOiEQD8sZJ79mkF2So6GvC2EcsUzBoqfJ9RyNG87sG9Pd6IWIlP/KBp2RjJmdN1L8DGI9THW1/PzvBBmq3onLFH7Lq6vfNge8RXWhkJUlclRHTfNHAbfoJPZOU5k/CGIPiGowfIUNC7kPVth2sTK6EwfSbjTBzdH53OqcQ2x/MXWh8KDAHiyHr8n5DYZbS6DXeoUJR42V9jkahlJmO4GryrGWCJDIQtRkzrJhitkE3HbzRmafCehyO3a6T7UdEcK7RHaKebwT/62xpgXC7fCv8wa8SPxrWW22JwCJMlonyllRi9ex+PwM49nGon8oBIyae8YjnOl6qvDYqXVeg62/Ljaj3r3UWA0w87oSsIZMZmU67DroPpe0S+H680K6B1kyAxV4R3WqnFJOKuG2lEoOBYzLAPJqQgVxBFP01sdjCJ7sCuKqBJHCeBurOSD5MIM+u7he96h2oaTyTCv9aG7LjUX/z56/GvYqr2EISpPl9bxnNxTMPx/4jUzuNFClVY+SceMrhcvLKIyfeNCpYwhVRWY604wFQbHd9lgsAo6+dl2/ThcwAqbB71Nd1SRlSqlHPbpqhYXzEIOpD8BYXxw4qWqSgF/RDXkQDs497PEhKSCDz2Nw0AzD3U0YQoVLNmqEwQMY8d8QtGcmKJl/3HInXS3y7F4gF5S9qebyn122FE7XgZ9mz7h2Lhmghvwi6gobVGPQA6vGMjp1Vjia4AnTzxqjfUB7UIwFU7KjdUy3tShDtsXQMFnhWEMg1tk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjY2aHc1bldxdnAwWW5OQ2U4dWZmRFF0TkdKbHFqcmIyWFRBWlBkUk1kTEN6?=
 =?utf-8?B?aXN3QVlSUUpnNnRnVTllMWRuNHRvWnM4RXZ6Q2dQL0RNSU8yWmZxT3NjWVVa?=
 =?utf-8?B?dEpuNUtvZUNmYm04OE5MWTA1T2xiR2o5a3h3TG9LbWJGZ3N6cCtndEpBMk1v?=
 =?utf-8?B?aUdyYlFmMmtMb1l1NXpBWDFFT1AvU3lFd2NnTm5XRkRzOVJ2VXlzR2xwdGZO?=
 =?utf-8?B?MFJnUU5kK1AvNERwNElLbmcvM2tJY0hMS1NNNktiMmVodStsRTJpTEIwN3JK?=
 =?utf-8?B?QUwwdHB6QWtoRVNaOFRUakgrMWdNa1lrck5ENkVsT3gxWTh3QWJ0V2tGYjZp?=
 =?utf-8?B?OWRxRmZralM3bXJCRmh1Ti91V0RFZ084dG9rTlIwRTBQcHVvOTRJSnQrSmRD?=
 =?utf-8?B?ZlhvZ3A0K1Z5cHBpV0N3SisrdGdMTG9MVWNTTjN2V2ZNT01USFZHSmVrZWg3?=
 =?utf-8?B?QkIwdGhZMDM3SFFKSEJpN1J0YXNsblJTS2lEY1RjbUQ5Y2dJUTY1Y3pzUFR0?=
 =?utf-8?B?S2p1bGZpRXhOM0lMV28xVkY2SXRVMVRId2cyTWlGK3Q0MzNMSzlRWUlRQXc1?=
 =?utf-8?B?cHYzZlVuMDBDbjluQUdRNXF5ejZTTUVPMjE1eXc3YnJqeVB0N05FVnA0YVJo?=
 =?utf-8?B?MnA1dmV5UTdHRzE3QTRnajhKSGJRb1NLM3lKRDJmNjBRVjA0dDllVzlqZjFH?=
 =?utf-8?B?dE56NEZZTXRyQitIYURGUThmcDZvQVc1N3ZRVlpqbTA3d1UrWDBUa2RXYnly?=
 =?utf-8?B?TytMN0RjS2Mvb0s3VXZZZ1pBOTU1M0hlcjNRbXpaNVZFNWkva1RYRWJNNzNx?=
 =?utf-8?B?dUZCUU1mNmExaEZlbEFua0NOcWEveHNpeFI4WjhwOG5SZVhSL29IK0hYbld3?=
 =?utf-8?B?MityT3A5TjAxQjF1MFRRZ0Ftd0RaWWtTdWZZcE5nNCtoKzdrRWRtcjdyVTk3?=
 =?utf-8?B?RU9FNnVxYk5mSlR0bjFiSUo5bUc0dkxkbG1ZUi9QQzVqTWk5RDQ0dUl5c0t4?=
 =?utf-8?B?SE1NKzdzNmhLZ2VZcTBwMW5waWlrU04yZlppTFJveEljQUxGOGZFSTVENlZT?=
 =?utf-8?B?MExCWEx3MSsrdFFHclRtN0hUeWxNcGhwSjVkQlJ3SGFyOWRMOXNEUmNCaWND?=
 =?utf-8?B?R2M5QnhUTWErcUtmcDd2dW8zNWVqZUFkMVIrUjFnU2FscTljV210dmc3OFE2?=
 =?utf-8?B?eUdJNFhVWS84Nk9GL09EK3d1clN6T3dVQ0xtdGZOS0M4Nm5hUElEcGw1R1Ry?=
 =?utf-8?B?VUhjdHFyd2xCUktSVTdmY3BsY0c5R1pWTFUxdm5aMDhCZDBMNHB0djNNYjZL?=
 =?utf-8?B?cngxWjNwZldBWlVoMm1kT0F1V2NKNEZkNEYxMi9WWlp1UnVqWUtOYlMxbWhp?=
 =?utf-8?B?RzgvTzJsdzIwYzgvSGhsdWJIeHd4Y21NNnZ3aC9ob2ViODJ3c2RncUFWM0lo?=
 =?utf-8?B?V0dLaE1Nb0V1QW0rZGlwQk1kc2dPOXJmcjRud01jQUxvcndIdmw2MDBualEv?=
 =?utf-8?B?blF6QjhGNFladjhadTNSUGpubUlkKzBxR2dod3pyTkkvZ2ovTlpsK2p0VkNi?=
 =?utf-8?B?L2ZzKzN2ZjEveUZoUEFwZUhwMHpXcnRWc3BUVmRIK2w0Q1pWYXFpOUl5cEFo?=
 =?utf-8?B?ZEVQSG9zVHoreFF3Q0p2NGpFRlgwMEp5WFg3djFuOE5vMmIyd0RjRlo5Y21E?=
 =?utf-8?B?REQweUl5Yk5sRUdsL1JyUGRyanM5dytrMFdpMDRTTXJTOEtEVW53cXB0TVRU?=
 =?utf-8?B?L0dOaTNESTAzTXZuemxoV0hCR3BUc09SaHpwUFhIQUlTVUM3dkszYjYxRFh0?=
 =?utf-8?B?TEVYZkQvbll1bitZdGxjZjViczd0WjRIb0lMUlZvaFc2MGgzUXBXZjdPTFRa?=
 =?utf-8?B?Rit5N3dqbFR5ZzVXNXpHVXM1Mm5yNk5RVU9PdHJqUldYTUtIUXovOC9oa0k4?=
 =?utf-8?B?c0RSNUxGZHJTcE5UTndWOXlZVVZkSlhKUkhBSE42YTJZTFJBaStMWTQ4SElD?=
 =?utf-8?B?Q1VuUUNTemZrS05xL1liRk5oS2Iyc0hla1NFNmdwcXJLTkplUE12OEJlemdr?=
 =?utf-8?B?c2EwNzNqT1F0NGpLc2FSQWFKczZ2UldnQ2pOcjdUUEdnUDk0L082Z29jalFw?=
 =?utf-8?B?enhLbE1jUXVhODBxWE5pRjhlMjZ3SUZTN1dsbWx2QW5OL1pwOVNabHVSQnQw?=
 =?utf-8?B?TzBZckJ1VFdGbEQyWWZBK3pOd0M0VGdrb3lQUGgvZTlxdGFYNlFTWUUvS1lG?=
 =?utf-8?B?bFR2VmF4RG5vbEFNdXU2cFovbU9yMzBnU0lvZnlITldsSVhtT2VuNnFVT3N3?=
 =?utf-8?B?S3MzYllVTFBoOGt6T2pUK2JDZzBJbkZTeXZZd3phU2RvSk1LamV2Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bc9205-d84a-441a-318f-08de962f56c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:58:39.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbragDyfqLTd0l2RPI8oAgGWasERmxGcNX8hDn3bLPqLgArnr/fhtm5Ewb+JdQBbTDP5A6ACJZTzrV0OkeXMcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_045853_237688_EA1C924D 
X-CRM114-Status: GOOD (  10.74  )
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

From: Peng Fan <peng.fan@nxp.com>

Add iommus property for SDHC and EDMA
Enable SMMU by default.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3e35c956a4d7af88310b3dfaef7e3d064f530e07..adcc0e1d3696b93250ab97fcac7c181b187d3d10 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -777,6 +777,7 @@ edma3: dma-controller@42210000 {
 					     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 				clock-names = "dma";
+				iommus = <&smmu 0x0>;
 			};
 
 			mu7: mailbox@42430000 {
@@ -1242,6 +1243,7 @@ usdhc1: mmc@42850000 {
 				bus-width = <8>;
 				fsl,tuning-start-tap = <1>;
 				fsl,tuning-step = <2>;
+				iommus = <&smmu 0x1>;
 				status = "disabled";
 			};
 
@@ -1259,6 +1261,7 @@ usdhc2: mmc@42860000 {
 				bus-width = <4>;
 				fsl,tuning-start-tap = <1>;
 				fsl,tuning-step = <2>;
+				iommus = <&smmu 0x2>;
 				status = "disabled";
 			};
 
@@ -1276,6 +1279,7 @@ usdhc3: mmc@428b0000 {
 				bus-width = <4>;
 				fsl,tuning-start-tap = <1>;
 				fsl,tuning-step = <2>;
+				iommus = <&smmu 0x3>;
 				status = "disabled";
 			};
 		};
@@ -1768,7 +1772,6 @@ smmu: iommu@490d0000 {
 					     <GIC_SPI 326 IRQ_TYPE_EDGE_RISING>;
 				interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 				#iommu-cells = <1>;
-				status = "disabled";
 			};
 
 			pmu@490d2000 {

-- 
2.37.1


