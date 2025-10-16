Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33ECCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 04:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnCc25tN6psPAmyVZpIEw4gC7QXx+kicslubpRnL/rQ=; b=tDJkmV3BsT7uC4s+NuRJf732fa
	EKKfnJoquQe8cvI1IqqPxsFklF/aYfJE736NNtJg6HfJyayNb9H/m//saXKvuAL9zQ+gIejqQuWv0
	xvuA0VAcexIIECTk5Va6a/jvtvq2Gs1qdiRf/mD324OP7BWrHBRsWr47jCpo9ZQzzYaL4zpvZ8hTW
	cmRrHs8/pKronTf0Hcx+I9KcwjLQ81GFVLLg075Yl1jQQpzsb7yT/zvBhuHn6gF5kIvwACuc2pMHT
	rQcT4YCdrgcSnuIuVxH0NpbwdE+vfjeNYvyUqEU01aNfKEMqc+I1zziEbp2SaCV17sLuoqJUHUx5U
	QWCaZj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Fhk-00000003QlG-3JfB;
	Thu, 16 Oct 2025 04:35:08 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Fhi-00000003Qkn-0HfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 04:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pntnpWEeH1D7YAfe6ZcGXn2jCuvJonZAbyEsZRjSuHYQA1rgoCNIK/eAfVW4prKbyJrIsLgEoWwqkLz//fXdg5auSz/UXQ0BKVly6n1dKvVuXE9Y/6hrf/Nms/zGkSkRf+FYfMxt3Pv79isAIMxCkwhfT3R8YqUz44aNPoSlobGPnsi+xdj18PJxwczVWUpEzWy5mkiSl/z4fLKyLEZy07RbP4Fw1tPMApeBRFfUk1c46FPBESuSxY1yyZT4GEzZHsZpkUoT0UqY6ld342FA9ZR6X+JwJ1wviFz2zMmaarFja4k/q3BqldlCtBgwy+dhM0q07yayHAZiBYwWJayt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnCc25tN6psPAmyVZpIEw4gC7QXx+kicslubpRnL/rQ=;
 b=p60FXK/D7znTsC1etDESBLC4np6YNr7M8NbTZopN/uxFwV5TSQ5utNsqd4ovfLOEjk/FKFL6o2epAJIs5+YN1MDRSP02+8FBtMUWhR4qp8w3tPRTK5BE3ZPzqrJBhDAMEhKK9vGbayDYqAibE5TdwuZpvblAvoAa9YYbuWDddSvJzQsnPgFCXBif3TOX72QMzMAg+zgDmfbLQh31+mjVMnT5nPa4mjhEjcSQqI3+Z2hNGpPHkwHXAoDUmtT5VxghyOigphRGskDuYJXkI9O5x73g/6PolbmrYfEmmQ4HyeYpA3tOhMQlX/XatL+qT1fM+Df7F2n2OPjjG+1UZbw8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnCc25tN6psPAmyVZpIEw4gC7QXx+kicslubpRnL/rQ=;
 b=MevrCJXh6yKlR6MI1TkvH2Ic6e/a85BqSOQWtGDzdhNVZ9Yvc4JFKH1nWblgT3TWi0aXf9SPKocs+RAA6s7gYEerVzs64+WtiFG8ykYfMdUDJ4k27KtfqJTSk5rKTgaw1wroxaWHQOaSQTohhs6cuDH8XL2omyNWFSnyP8Y2jK+vCg4IefCCR00naDYKUW1hs9wj90G2RvvIB7uh9ySrsjC5FOmZJpDEBdKO1+99NTYzLQjTdWZfOnQJG/2S8REUwtT7+4Y9/4dDcTmO/zEzpKRv5migewJnDp+MoN2rRDXRu9PQqHU/ejte3s6Qi2K6Z2oJkUOo5nxKmF2vw82Agw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 04:34:57 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 04:34:57 +0000
Date: Thu, 16 Oct 2025 00:34:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Message-ID: <aPB16VqrMZrMNDSq@lizhi-Precision-Tower-5810>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: d21bf78f-d075-499a-9df7-08de0c6d5c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ARfRXKFapERYWsQVs442kHGTbBKq2VjZTu7TsGwcb++cnnEch+hPRrP84HeO?=
 =?us-ascii?Q?hoTegevaFLxswTTzLF3L+VoFmFabV1XZ0kFJY73k5lqInSa0SEbVlbshryPE?=
 =?us-ascii?Q?TJwxKjZDdQFhzVDfbKMG7KmojQHLWiOQYd/bd88DorIwl9XmVim0tr/wO/he?=
 =?us-ascii?Q?UlMywLTamXWVJXK4ed1tufeziwp/7+80lonFBcU5rafsHd88Ab9eM/xjgdSz?=
 =?us-ascii?Q?nrV7zYeuDCM6E0XISzm4Qpkhcal2NjZO7tlV8umfjnqG965BpALz2paE7xT6?=
 =?us-ascii?Q?cRXNNaFTYSeidvs6DbuRefTXLEbT1WmD54vMZORd3GhbcubEq1zd91Ws4+cK?=
 =?us-ascii?Q?JEIJTkkn74LJhr3M3hHNPgtAVaHK+kCLY4MvBXEbf3xJK5ljQVWm9E+igB/W?=
 =?us-ascii?Q?Wm9C+GtOtk1XHmT8x83bWuGV0nG9j7hZbgAVhdj/np8ei7LVo/jEWG5Nd/oq?=
 =?us-ascii?Q?burmyrS3PjvUXzk5UG/KWPUlsogQonkQB/dkN2B7IN+EunAv/wl8UOLBNxhh?=
 =?us-ascii?Q?s9fOm0xN4EL8PYgXanZxVj7/2USILv7dbcnbByI4NQ+UFJ56ZmvMrhmqit9j?=
 =?us-ascii?Q?DAVDdDXxoh/uhKqBW43aPooPDhGY3Rhi5LTp0Lf0xNYHBcPf65laeLH6CIIv?=
 =?us-ascii?Q?qd4u67RC/pnP1kh2sGcKAJdKYEcoaEPb1Wgbh9YwSwI/7X9wgp+5lcCdqvcm?=
 =?us-ascii?Q?zv4UJKDkE3fsrV92B03gddUnydPR/FsgXbnvrmAc4EP32ccGzmDt97q0rJsS?=
 =?us-ascii?Q?RHd1UmDZcqjdvYOH0L4Qae/fUtDp616QcPKwOzxb7ej/hKlsAMhM6hbLlrtH?=
 =?us-ascii?Q?HDt/tT3PngfQdFo5Pm5ZlqnUnhKHuOv7G3tQNFgM+jey42uovm6WAV3aQtQA?=
 =?us-ascii?Q?M6/JiXul8AAJ1gzwJg9403v4OszvJ3yo0z6tfYeqtn1QSCmoqonwG+w3npN0?=
 =?us-ascii?Q?xLjOdKUBLN9d+8UiTsf9XPmGjcpms7j9zhqPZHwIXHHvGkX8++fZTXa0q4Lx?=
 =?us-ascii?Q?Lau084z5jXr7+8bEU1D2P8EHpsrFvZu5QpkDCbPvOB/kRbHY2WqfcgL2kt0l?=
 =?us-ascii?Q?sGEvlcSWNrIydHG8tBw+BKEPwjZSskZl1vUB1SyNtrjc/o2B0vfi57RpfLIQ?=
 =?us-ascii?Q?ie1O3LGf7x2/bL06xbW/NRQbeMCVIOqNpobphDNs2WAyh1byGM6TAENu4MTA?=
 =?us-ascii?Q?7IsVtJTAZJn50ic6YjpefTCalft/p4ACcaa2yf94uUkm+Zb940J0vWsJrQiy?=
 =?us-ascii?Q?rWP34Jyxo4Tbn1plUHEwXYw0b4TJOXOyRZD7Fbhw94Y22uKNlvEXSqwTv5d2?=
 =?us-ascii?Q?Gj8Ev8Wn18nldxb/mX1yEGw+vyGb9BupSnlI5iKFy5LGlxG0bMtaVIYdwlqL?=
 =?us-ascii?Q?Yyqc3mhu8j/xlbqJY3mH031YXX10M4RYkMW01tUB7BPGvaW4S2LFSqzOJovD?=
 =?us-ascii?Q?GbAGknhJegRtJTjhhy2oJLZAmW/uokKW/AL2yMfp0yVMmcNb3tM1Ug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2H7ScZbaA7z/oujtLi808g2oxaxSA1Ur3WSvSZJtUjUF6Fa6B8kge9wf5nDT?=
 =?us-ascii?Q?Y92q8N8fSnRNAQLUZH59tFwvrwdyr9YXBPApEGJGEeJ/9QjrJ6Kgio/qDs+I?=
 =?us-ascii?Q?xgySYqSGNMaQnlkGPSmIvfhMaOkxKCRbYATdrUhTGqH2TYYL1uqmV/xnz4zS?=
 =?us-ascii?Q?NPAXT1rvoORfhMH8fIetrKDpNLKLUyNTXGL5MhuIW5n4PPva1HVVQL2p2jK1?=
 =?us-ascii?Q?/Mod76mrjHYSZWxVUo1tMgu6GEWW6YeaL4wqCGw60YnMuA8C+172u2LAfMSh?=
 =?us-ascii?Q?X05x+9Y6p1Sxj0oUC9OgQ6Cx/74ChgMpOzDOsYytwV7seFYCS6U9hoLlr7rb?=
 =?us-ascii?Q?GnyZMb7bbB2IAo96KHcPtkiyIjso5/qLJdqtfUbJoFnc0ceedM2ueHf7GWK4?=
 =?us-ascii?Q?++wbpnnAKWFpafwNTpbz2AV7LwtSnQiseKZ6PYqBC7AEZXk6CkZsfoSGtstU?=
 =?us-ascii?Q?U/wxN5e4FGYTB+K2QPevRZ5lywfxwJbx+2my8n2ZacS+fdx8ph4V8EIDT2FO?=
 =?us-ascii?Q?+PX6zJsTVkkvBbGjzPff/FFrQjbXyuuBlC5/lEXd5FlWRZZdGl1WPxuY6RqM?=
 =?us-ascii?Q?7bu39f+pp9sR+v+QOyHD6MirMyuiimN/TZSw8fXhD6ahCBr3VGO6miY3rPLF?=
 =?us-ascii?Q?37XeuAUDCWOP8EsyEQmjmLb1Blnv0JbN8OcvFBNUarkymcGAIJ8+Nz98FciO?=
 =?us-ascii?Q?D8kHrJ7fT0KgU7bWWaqNr9LDF7vorE2AUAvZkwmQ0/PCdXjAT0pPIEr+Xran?=
 =?us-ascii?Q?i7zUR93qtB6jWccC/JTWOJqALAlF7OWmiN9YFFztK28r1NmexZefbHrUjTA5?=
 =?us-ascii?Q?PFqJCAAU+kZK7eVVsmTPI2iASYf9vyk7pcJbNxDA4NTfXoppB1lRMxQ9ZzOf?=
 =?us-ascii?Q?mAo9pOF+BQQ06my80zs6Jy2J9Xqlsy/X7elxs344g1mF74KrKtQNuDOG+kH9?=
 =?us-ascii?Q?lwBYTg1uojhxGiF4QibtuE/+YlsRtweowpqHVbNNdbGq45a8Da/jDPkbRDHE?=
 =?us-ascii?Q?/lQ9bQ1nlnPHsRhvwjhF+oETnaH/Qsy9GsbMP13tc80r6kWHcWYO+u5frZir?=
 =?us-ascii?Q?/fy462sw8jseLlnB/Zyl6W82wY4BSKZ5CUedM2xIBQGJXR4CiqZjJXMmECxG?=
 =?us-ascii?Q?ycKK/JE5E80Y+nUXekKS4d2/Y3x4drYdkyvur86V0dcFg7kQ8jVvEeIQeiO+?=
 =?us-ascii?Q?Kyf0g8LQZHL+6XeJnUNPk78+h63zClihc5n9n13nzyLEmIuj7x4dn9J5Zb2c?=
 =?us-ascii?Q?6wY4YFdAbVB9G9cHO5N5Lh5as3ifTFFkiXrN1SGyyvM7HsVxLNZFtZzfWCPp?=
 =?us-ascii?Q?VKyckBfwVbD6ivjYvJyE5C9Q7lLZlf3cQ2bQQgRD6Yq7Jv127EKQ7id/JQq8?=
 =?us-ascii?Q?pdJbMjZKHAR4TmZEl1fB5cgDHz8yk4OV6XjyYwX4q9tVGiKlbp3m3XEiYTGh?=
 =?us-ascii?Q?Sjyl3lJz/4rmNLxwmWLZGdQf+ijq+9h+eBm+FUPdcwla44ygm3BxUN9ZjH+/?=
 =?us-ascii?Q?QR21LCzOxaBqPLJxga7a1puA4eFDNkhudzfwWsR0tTGF9OvtjDhHGamnlEIb?=
 =?us-ascii?Q?WNNsMDvs44R3/A6frwHUJ28znz/u1a1IgOzP7X4M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bf78f-d075-499a-9df7-08de0c6d5c13
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 04:34:57.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GOg0i71B6gSaGJmYUNUqde4ZAwGKsS+/6eJoQ/bkFFHF2PPxilz/ZnLmh2wXAEzqfOyq7R5KDS7kpWWYP8ZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_213506_143570_3FC653B2 
X-CRM114-Status: GOOD (  21.84  )
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

On Thu, Oct 16, 2025 at 11:24:38AM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
>
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v12:
> - Newly add bindings for CSI2RX driver
>
> Changelog v13:
> - add entries to MAINTAINERS file.
> - update email address of Nobuhiro Iwamatsu in /maintainers
> - add Yuji Ishikawa to /maintainers
> - change /properties/compatible: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
> - change bindings file name: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
> - change node name in sample DTS: csi2rx -> csi
> - remove "|-" from /description
> - update /description
> - add definitions of clock and reset
> - update /properties/ports/properties/port@0/description for better comment
> - update /properties/ports/properties/port@0/$ref to specify full pathname
> - remove /properties/ports/properties/port@0/properties/endpoint/properties/data-lanes/description because the default text provides enough information.
> - update sample dts
> ---
>  .../bindings/media/toshiba,visconti5-csi2.yaml     | 125 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 132 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
> new file mode 100644
> index 000000000000..21fb46de5b6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> +  - Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> +
> +description:
> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
> +  stream. The obtained video stream is used as input for the Visconti5 VIIF.
> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-csi2
> +

...

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/toshiba,tmpv770x.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi0: csi@1c008000 {

Needn't label csi0

> +            compatible = "toshiba,visconti5-csi2";
> +            reg = <0 0x1c008000 0 0x400>;
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&pismu TMPV770X_CLK_VIIFBS0_CFG>,
> +                     <&pismu TMPV770X_CLK_VIIFBS0_APB>;
> +            clock-names = "cfg", "apb";
> +            resets = <&pismu TMPV770X_RESET_VIIFBS0_APB>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;

need empty line here.
> +                port@0 {
> +                    reg = <0>;

empty line here

> +                    csi0_in: endpoint {
> +                        data-lanes = <1 2>;
> +                        remote-endpoint = <&imx219_out>;
> +                    };
> +                };

empty line here

Frank
> +                port@1 {
> +                    reg = <1>;
> +                    csi0_out: endpoint {
> +                        remote-endpoint = <&video0_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..e4634a0aad74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25979,6 +25979,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>
> +TOSHIBA VISCONTI VIIF DRIVER
> +M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> +M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>
> --
> 2.34.1
>
>

