Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7649CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwAT1GlPC025aJX3JRgnyjWSq0Dw8mTIVGtru0FtHvA=; b=sDG9PxwQgspeoXFddLafYSsm4Z
	8MT57teCzIN5qOFsiw6nVVALJPc5hu4tlgKMsLDk/hxYQl+1XT2sfYwd1KGZTYlp+G86MBT5KtZOd
	xKEZOAEqYK5Gcu3DaPnALPlxL7KxR6d85c0bdWZe06bQR6yKS5rrM1Nd3/f9vbfkXHAm6JcKNpjN2
	TNJsiDs6zEu+GH2F2D+5t4KdNaixF1npLZzIO8/rn+sznZdbdgDq7C+PmIpUiyYzq5AQYLb7xTeDF
	o9t8E58eu7Cge7ESrDa/r5RkUw/k2eyu4UNMj7aFxyZlqMmaWeJqh7iatI3ZnHzTUWyfFs5ppxOGK
	bPhh5xAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rpN-00000006M2Z-2h7S;
	Thu, 09 Oct 2025 14:41:09 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rpH-00000006M0U-26sa;
	Thu, 09 Oct 2025 14:41:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hop7u3PDQJW229jfsrOssVHEFVLCNvlkj8eEe2TBVZluOf8I+z4pXkFya7vEKQrBYBEEG2o3C+/QnyfFsn5AwIsAqKNJqmQHeUKFOq4Jg37AooTM4OBNWqTsETs0cgDg4O1kfx8t5ABS0SNQZQEnzrAMws/dd1nd+3K97p3ifa/cB1Gxsi3H/Y+Dbc5u/A+rAFtmjCWmG0B26ZnfUjEHOFf3ud2YHyntG/TqFu5bQLklP5mGDA5U4EA1mR8gKDbjBhHNEVGmIyc/HYjTJ4V6uYszWanx7RIAlzDl8N8tgwFp/Cpybhxmw5L+7BCNIgAE+CAwwuG8dOC6UUEcB6OuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwAT1GlPC025aJX3JRgnyjWSq0Dw8mTIVGtru0FtHvA=;
 b=xX9/DEL9O0BuGuSt/7Z4k8NVVH7HwSrvVInd/MOYrskc2Yk/PpbqwRCdPpTDaUQSGJzJRA0FZmc5bov0uZDXK85ylHZlaeS5ikRNd0ywQQYjOYhYS/GWcW+MwFdZyT6XCJbIrJsLUWX+lZD+o7JQjGCQMCU8H8VBTrj+1HJ4mBVdkW7tx8uI5/UQ/ovn7W8nvpdqvOoT+iiaRiVb+vmAp7UziupEo6exzoQl73YQL4Dub5ZgiUw3PPXxWMlmxW6UdYa5jiSZPvN37jwHTnF9SVuoHZfwQFTeY1LLQo/agWwBPBvzI6qHzq9VnWZb3xHQNLyUDdHDh4B7hmYkoIYULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwAT1GlPC025aJX3JRgnyjWSq0Dw8mTIVGtru0FtHvA=;
 b=PTfL9D7kuF6yVazrp1e/FJfwdw23E9TAN+gWW8Qc/nbTB6k+LHvn+pE4S5mVawEJFvXc8yaD6ENOI8ZMSEjzw0nxThH9Id1zbDcCDFKVM9jkWaAVizDh4ZtVdImkvR3ARx1oha87uLvTdg5oXmQLwfElXFe8MagGUJMuhlZ5oabr0VdbK9dqarBHhvuNFZG5QU8Izy7ypYczf9qU3XAA81wsim7UJlDr+2Rik+nFVZ7UkcQ5BzD0WCZIm567htYjzfz7/VuZb0XcoWLZFtgP/BEX5eIwwoTlY8ojaT1efDmE/greDUgwuA0Ap6yMo6wHN7SK7J/Cp5GKikIbKGWEIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:40:53 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:40:53 +0000
Date: Thu, 9 Oct 2025 10:40:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: Don't copy frame flags for
 frame-based devices
Message-ID: <aOfJaHubuCfhcmuy@lizhi-Precision-Tower-5810>
References: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 944ce10c-58dc-4abb-e6d3-08de0741d8f5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vFP9xxfRhrZ4sUTEfdo/vUPX3d7OgKugtLqno4tN0nTFPPIuB+XWbyD4A9e?=
 =?us-ascii?Q?VG/p2pRoIHK6iLwjy1Hh1nxthXrWLN8zBmDTPbxHlIBn0YMaimbAfyColH9W?=
 =?us-ascii?Q?VaHjvycIKvJ64bWECeudSpPL1qU5xgYb+pDp5y1AoDAR4E9bXE+LDevYA1A1?=
 =?us-ascii?Q?JYUWG9u4wjaIwP/DMJrbcIJom+hWi8cIBhF0yUYHoOTy6pjDhoOZYQppyJNT?=
 =?us-ascii?Q?nhLM5LMzQqPhNLWc/KkdZ/Ok6Gubm8g+UwxcgiITgJS6kqT9vNOCgjQCJ0N0?=
 =?us-ascii?Q?v7q22aGLlaR42v2/T7ussBg5dxOvqp85O8qautYLbwwyGcOTzJPf2yxcazAZ?=
 =?us-ascii?Q?anBZO8hgkaP5SoMFiYUz6Gubc8s6rk6IsEQFLFyCQPcoyJSm1P07sdBeknUy?=
 =?us-ascii?Q?yuThxI3xkDpmUntNqnweQstpK/beGJ3+3Hh2mSJ2JleOWmwC8dDeRyrvPHHD?=
 =?us-ascii?Q?QQMR4LdyryuIb8ekB3bJCUu9ZuqO72KOo/07u8SbJohRhMa+kgHIoj3w2937?=
 =?us-ascii?Q?mwZ6IvraIQupqFg5W9gssU1fbQv6mO1lrxurILtO/RQdgRvky//t4PGYzKjG?=
 =?us-ascii?Q?cME+xWcFU0W7PT2DhfUc05k31UshaxNStL+iE01yyHf5tfVT/SmG3bIEDH25?=
 =?us-ascii?Q?vebJbx7gxIOzIVS1khw6CqZjfL2AmWFCQzxmv8c83SSHmwNY1kczIHGOXXsd?=
 =?us-ascii?Q?s4cGTOFMHRzOalrh5khCP+yrg6pKP4kk5Bis4sVBbbvZrtNTtVHmDGZwf39T?=
 =?us-ascii?Q?KY576r1oHCPGdb3+3B2NHv47WADDXLitFZ5SfEi6I7i71YbKpWBEyyJQpuRz?=
 =?us-ascii?Q?uYzq12iy9KdeccSAdF0gmyJgK08QzqzjoZllp1LY1VYj6vk/q41+7rdnLrPF?=
 =?us-ascii?Q?DzU6/udrVM6VyqAmS2IJCo9kzlpWPwm1GwN3GiaO5Tefw7GzdYD9qNn59hmt?=
 =?us-ascii?Q?kggzOau77fUlr0pnhxJaGdrNZpOKDV1ADPGFPYUH0jaaZyD1+kWn8NG0WUZV?=
 =?us-ascii?Q?yscppUlf4rB54r6oVuEKWpvqB0DOu4aaTwSMRhK1czYWlr7n45QE4IPr2y5/?=
 =?us-ascii?Q?HGuqWKMJJWgFuLPEmm5/czNnjZZXmnDByfY21tHiXKtRheYVdgJF2gsSdJU2?=
 =?us-ascii?Q?f+EWukWHA4fBP+A81V353p8J++rpZ0Sg3ghVW6DJbATA9UhF1uUyGjA4CBk3?=
 =?us-ascii?Q?l7sWT9GMcuoZbwCaprxT9NfLxwrCgyOOzSAEzdSMwcSf6KrlPxUNEuw1x3xb?=
 =?us-ascii?Q?XiXOPNr4iRCw3pjqrN1aAtTiFqc1+rY9JlTyZtXd9tDc4EbQo8PeGodBtBlg?=
 =?us-ascii?Q?3WnwPR1Cu2QLVhvsUCQjWhcMBU83pzvpcaew/i3jxPQMh2hoIxKzN8g+oXC/?=
 =?us-ascii?Q?xqOaO/qRtgE6cWJhdEPbfBIALCnmhhN3jijQsDVbyMrxKbLswkdWtB+xGCol?=
 =?us-ascii?Q?kaCNt42qIBb81adycBuUWpJewqPr0oGgZ5FjgkBAh5jcKQAgKDnXYNYiCETE?=
 =?us-ascii?Q?gxyIG/BZPhEZ8JCVKWxHk2n22SSjS8nu7SPA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o4CInVUAvT82REEuB7RFhU3uDVfOiuhn4BjfJ3FqoXhst8fmgAw+HfRC1cWN?=
 =?us-ascii?Q?x8/SLMUE2iqdRyympO5Xi6XhCVJWRhUn/LIgcSZbQLo3c5jWFNT/eyJ+3CnN?=
 =?us-ascii?Q?yc5DlQIMC2xS7tOWi8v2UXW+cpuTyVHJQVfIYMdk8x897sDCvcNMfpWEVRki?=
 =?us-ascii?Q?jKVWfBRHsUv2trGyNFbA1fAbI41bfgc+QU3M70VOxcO8QmvgoGgSTmvg+v44?=
 =?us-ascii?Q?YDQLn2Xha3lrQrJsUc+9M8jiYKiE0UB5AeZiRFzKW8YiuFLUohminOTcuQ5t?=
 =?us-ascii?Q?UwkORrbTOGn/yWTZbquKqIqONvh8zrbogcW2POiU5PNvYqPGBWLtp143sckG?=
 =?us-ascii?Q?zPIiUO1w+GgktyE/deJZ1B7hikRbaortROXjUj8CP8w/yduUxaBmUuQsCJpJ?=
 =?us-ascii?Q?m/7anz4/pQoD5JsfutdtLu0KRQl+T0+TxBJKfBuXSgBb4r775EAGqWNmvbMc?=
 =?us-ascii?Q?arLEGG7Xhjsh4R4Hi3mRA0aeg3wDa13Rh2ZCVCLdMEgiXo8DWD1pJfbZVLWO?=
 =?us-ascii?Q?9YElonx+JsU00z1ifo8OKrRAcbJPZMT+8pbFSF9OHavsbQY0Zs8lg1hC9wD6?=
 =?us-ascii?Q?tKPTG3rIAsi9CzuOOTsnAjFiFEcGLVFTfX5w5iYLKQ7lQiqMrgagO/Kninqc?=
 =?us-ascii?Q?KIUT43BMDw84wePO+IMW/51qx7a7F1EaSVWsGLjscGvc+tehfQ5I53AIhMPn?=
 =?us-ascii?Q?Ptrss8rfNvb0j62hAA1oCD7uCgDZVp1N+shwgbKVCAcdZJ05ufQuBpea5opT?=
 =?us-ascii?Q?uP3jtLKGeXtixvjhZQLQZVDlaA05YqYCxvn2WImbiIgCRdt31X6QYHZ2JNi8?=
 =?us-ascii?Q?PA0ZbvP8hr3cU+sSwaRSHyaxVsUc8nT/4ThoLMDPdfP/vTQhgTHoaR4Oka5m?=
 =?us-ascii?Q?1T+k4GjSrCoU8ytuNBUFWttmyaOwthbrT/XT4VxE7QzXMVx6e3hmo3lEMybo?=
 =?us-ascii?Q?RnR7BTQ+SpsuIYYL+F9to/ofiWURL2lvVhqiQZ6hnvLN5jFwNUxsGGf0awBY?=
 =?us-ascii?Q?PHNXOJSA7M3pWZHUCnEscjt+sJqSbJpjqUve5nBuXA6OVIrf4ju8rZRJwONe?=
 =?us-ascii?Q?j3incHGq4D71CKHXy1UW7Gs1BDiYM3WluptX8K/afrJKRHDT//WOXD5CrniS?=
 =?us-ascii?Q?zCl6r9S8OjFk2cPZxNAptOTYBy54/XOzMhbXKUY2EtYztSMi09qJ5yodpajg?=
 =?us-ascii?Q?1hSwW1nOtTKqmUNqEw2rAa6BYqds1XsiEXpAr777uEmloN7/ZECfbwNfs0wf?=
 =?us-ascii?Q?8gRLtqi2MEnSt28C2YrAJSbpzIlZS9qewke1DDDZj1HAVH5Y8GQSjKLaGjHx?=
 =?us-ascii?Q?wJnOjaVzJ57QPp0tizMIOx1n3XoRdq/kDoKJmzmjsZr3oNrkApDbpV4P7xHo?=
 =?us-ascii?Q?e0uAJa0qA16OvRknGkAbgOKDWqNdfRNiNu2gMLPFzhWusduVUmjtbbzY7yfr?=
 =?us-ascii?Q?kL/9x9saIBmdduApxuFHTRGtDwMomlZNBmL9LSEqpk5HYV6D8WTJIDl3Nty+?=
 =?us-ascii?Q?IbGEZZj5DqNndhQkHGpZUOwvEbuf5hKtBZwayohsmkvuYIkNQo6RGl/pyv2y?=
 =?us-ascii?Q?CB/1gfVXALgHItsKY8o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944ce10c-58dc-4abb-e6d3-08de0741d8f5
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:40:53.0905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0c8RmLdShxbUuVDytDUs/Sh8/Ucx7fJ3c8RGwGl2WUgN7V4KaPd/yfEP3q1fjOwr7TPlufkRHM2pdBbUDIRJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_074104_184563_96E6E323 
X-CRM114-Status: GOOD (  18.12  )
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

On Thu, Oct 09, 2025 at 02:11:43PM +0300, Laurent Pinchart wrote:
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
>
> Many frame-based M2M drivers (e.g. for JPEG encoders, scalers,
> dewarpers, 2D blenders, ...) set the argument to true, while the frame
> flags are not applicable to those drivers as they have no concept of
> key, B or P frames. Set the argument to false to avoid further
> cargo-cult mistakes.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c     | 4 ++--
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c   | 4 ++--
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c   | 4 ++--
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c      | 2 +-
>  drivers/media/platform/nxp/dw100/dw100.c                 | 2 +-
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c           | 2 +-
>  drivers/media/platform/rockchip/rga/rga.c                | 2 +-
>  drivers/media/platform/st/stm32/dma2d/dma2d.c            | 2 +-
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c         | 2 +-
>  drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
>  drivers/media/test-drivers/vim2m.c                       | 2 +-
>  drivers/staging/media/imx/imx-media-csc-scaler.c         | 2 +-
>  12 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 35c70ec3ad2c..6bd5036430dc 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1619,7 +1619,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
>  	if (!dst_buf)
>  		goto getbuf_fail;
>
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
>  	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> @@ -1715,7 +1715,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>  	if (!dst_buf)
>  		goto getbuf_fail;
>
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
>  	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
>
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index e78e1d11093c..556865100872 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -530,7 +530,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>
>  	src_buf = cjpeg->hw_param.src_buffer;
>  	dst_buf = cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	mtk_jpeg_dec_reset(cjpeg->reg_base);
>  	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> @@ -560,7 +560,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>  	ctx = jpeg->hw_param.curr_ctx;
>  	src_buf = jpeg->hw_param.src_buffer;
>  	dst_buf = jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
>  	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 9ab27aee302a..4c8427b3c384 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -261,7 +261,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
>
>  	src_buf = cjpeg->hw_param.src_buffer;
>  	dst_buf = cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	mtk_jpeg_enc_reset(cjpeg->reg_base);
>  	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> @@ -289,7 +289,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>  	ctx = jpeg->hw_param.curr_ctx;
>  	src_buf = jpeg->hw_param.src_buffer;
>  	dst_buf = jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
>  		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> index 59ce5cce0698..dba46a69c6be 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -51,7 +51,7 @@ static void mdp_m2m_process_done(void *priv, int vb_state)
>  	ctx->curr_param.frame_no = ctx->frame_count[MDP_M2M_SRC];
>  	src_vbuf->sequence = ctx->frame_count[MDP_M2M_SRC]++;
>  	dst_vbuf->sequence = ctx->frame_count[MDP_M2M_DST]++;
> -	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
>
>  	v4l2_m2m_buf_done(src_vbuf, vb_state);
>  	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 7a0ee44d9e1f..b73302d54635 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1483,7 +1483,7 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
>  		in_vb->sequence, out_vb->sequence);
>
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
>
>  	/* Now, let's deal with hardware ... */
>  	dw100_hw_master_bus_disable(dw_dev);
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 37e0670f98c5..e1dda1e834e4 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1537,7 +1537,7 @@ static void mxc_jpeg_device_run(void *priv)
>  	src_buf->sequence = q_data_out->sequence++;
>  	dst_buf->sequence = q_data_cap->sequence++;
>
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
>  	if (q_data_cap->fmt->mem_planes != dst_buf->vb2_buf.num_planes) {
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 48b88da59da0..075b684fb178 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -75,7 +75,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  		WARN_ON(!src);
>  		WARN_ON(!dst);
>
> -		v4l2_m2m_buf_copy_metadata(src, dst, true);
> +		v4l2_m2m_buf_copy_metadata(src, dst, false);
>
>  		dst->sequence = ctx->csequence++;
>
> diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> index 643913adc1f3..4184bdb96e6d 100644
> --- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
> +++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> @@ -483,7 +483,7 @@ static void device_run(void *prv)
>
>  	src->sequence = frm_out->sequence++;
>  	dst->sequence = frm_cap->sequence++;
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
>
>  	if (clk_enable(dev->gate))
>  		goto end;
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> index 3e7f2df70408..11a6c7f5212e 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -71,7 +71,7 @@ static void deinterlace_device_run(void *priv)
>  	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
>
>  	deinterlace_write(dev, DEINTERLACE_MOD_ENABLE,
>  			  DEINTERLACE_MOD_ENABLE_EN);
> diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> index abd10b218aa1..f6e2f11a20dd 100644
> --- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> +++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> @@ -70,7 +70,7 @@ static void rotate_device_run(void *priv)
>  	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
>
>  	val = ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
>  	if (ctx->hflip)
> diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
> index dc82830a35a5..3e8476165721 100644
> --- a/drivers/media/test-drivers/vim2m.c
> +++ b/drivers/media/test-drivers/vim2m.c
> @@ -482,7 +482,7 @@ static int device_process(struct vim2m_ctx *ctx,
>
>  	out_vb->sequence = q_data_out->sequence++;
>  	in_vb->sequence = q_data_in->sequence++;
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
>
>  	if (ctx->mode & MEM2MEM_VFLIP) {
>  		start = height - 1;
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index 19fd31cb9bb0..770ba3fbaba2 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -96,7 +96,7 @@ static void ipu_ic_pp_complete(struct ipu_image_convert_run *run, void *_ctx)
>  	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>
>  	src_buf->sequence = ctx->sequence++;
>  	dst_buf->sequence = src_buf->sequence;
>
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> --
> Regards,
>
> Laurent Pinchart
>

