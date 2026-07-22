Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AEC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjfrUzOSwzQovcU11iasIbcbUTZt+aatoyMyKeP1//Q=; b=j20l/wB3R/9ddODvutXYpalY8J
	EmLGegkjxTIUiptFH9DyyBuv37fiibrKMHsjxrZlMK6GZ9VL3m++kiyuLLW9tpiAqyCnQAYyOJwm/
	T3jAe1VJyMQkxJUcM6pDEpuXNx86QoAN34qofwgPjpsRbY6YNAVlddt7tsi9GcOsY60pfzyij5NrN
	XrNETEGVUOzI/1jYWyyA+jX+LetNmABuCKlA/TUi+J+ygDZJYnBVvnKxxX6uzjfJLwbR68wN/pREX
	q/mQ3iViWGBgiMmDUHlCTZyoUuPaU+qVXahdT/Nbh9VcJvBpeOAs045TQfVImEO+WGPPVbCyCi3lO
	r+aiioVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNr9-0000000Aq1J-1jHK;
	Wed, 22 Jul 2026 03:42:51 +0000
Received: from mail-westeuropeazon11011062.outbound.protection.outlook.com ([52.101.70.62] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNr7-0000000Aq0Z-1hfS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 03:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMHyn+YfLncMrE7m09lg59qWT57SKeZS4GNGDpbrPUJ9m3+O3aiCdyLkC3O31J78WZkcVXYl9hRY21IgeoDofk9Unt4A/TPzkfCxiD9eTfmObOoAPS0doo2sLXjwOxELlojIwgODAVpjULkRSBfzKJnEEqyQWt3N1D9HGQqCvwsAVgIXa59OBiqf8ufrZQ1txpWOLOwtjbwRNd7EpBHMunYv10fD478EH9XYtj5jC60yCKcPq0vP7qHdRwzTv3IP7zIcWrfC4A96sJg/7IZUfyqDmT2Z2PGm4Ab/fFJijlGmuZQ1YoZBrgcvAyfCV46JQYunNFGsk0oOFg6XjY29Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjfrUzOSwzQovcU11iasIbcbUTZt+aatoyMyKeP1//Q=;
 b=Jt3kR6D/6nSgyODAnGPQj5MV1RQNhV6upSnOGisfv/aNuxkWlvw1r/TaKO0EU+qs+iQ+2St5fG/6q6RmJ3XSYnafkMMJ9dwaijKRPxyoYVbYwK+8Nq6O7VNmR28eAN7uyuZx1TsgGe4z4PjDOMW4ZXBW3auWQ+/Nca7WcXZAvB8FUy23bmscdAiGQ3bmUmKJ6NdAqXO/wXGcHBWYg+pG8Lu3F1py8GPvQGnWsP55QyFLkcVFnxTLWSkA8k0+Q5/uJuWUiwsAnEuLlilKiK4Op8NwS2nThH9d2Bm3QIAQxXqee2LP0E8Xnx4FM5mKTcxDdIw5qmURksMhati7uKD3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjfrUzOSwzQovcU11iasIbcbUTZt+aatoyMyKeP1//Q=;
 b=BzFWSp/dXbjS/KFJyDZg0XI56VsQeDszw5KK/URolzELRofG3seE/U276nQ7F0OjBxK7b0akVUmD9FImvGMWja5Vw9yCtnS49Hs6nq3aPpywGfUW9u85kWW9D8+dumyyluGCcpAKemmsGIjeCR+kzyDg3Qne8ibuSFCR9NcnyHchFAU14ZxWE8CxQviXnc8Iev4FJqPtn9U90bT7i1/HKFsT/Hmut0l5sivjjUgaF46m70CISUNPevwyVNRZYBHHD8da0uO5q8C8pxkjrUFp/Qs4bS/eIAoxjqYBxoAczFUvwb0xEnx905DIeDxz2b8A1UKUmiyOneh3cxgvhSnV+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by PR3PR04MB7450.eurprd04.prod.outlook.com (2603:10a6:102:8a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 03:42:43 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0223.008; Wed, 22 Jul 2026
 03:42:43 +0000
Date: Wed, 22 Jul 2026 11:44:09 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 3/7] drm/panel: simple: Add waiken WKS101WX001-WCT
 support
Message-ID: <amA8iVS4c0exg6pT@raspi>
References: <20260715-dxl_lcdif-v2-0-da797562636e@nxp.com>
 <20260715-dxl_lcdif-v2-3-da797562636e@nxp.com>
 <alnCL7ylMyvGD-ui@raspi>
 <amAJL9TIcDAK7kbh@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amAJL9TIcDAK7kbh@SMW015318>
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|PR3PR04MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b7f6bc-271f-4c8c-c258-08dee7a349c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|376014|7416014|1800799024|366016|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QgMghmGOJFpM2/k5p3PK8j5Ktl+TiRAp0sz11ZyFOTtmIH7zNG2u02YXDII03FCQWckno/cPcSh3SaFboyy2a7YFTE8gafb8mJIsEek7KCDSnd79LCfJXu9xjOwsJJGA7m6LpIW1Q7ypGVQlvgjc/nz9b0/xuWzIp2h0D+Ye50l0cOIR0eNEZ7J+Er5Ts1QhhfkqY2SD8V4zb10wXivkmus8UVYe5JsLLgthkIuw/XdMuGsekL6XzwHc1M+eJCTjDbZYzy8Ts4pz8/99PdpuaHrd4xi0WCAtfGDiSYpFNW4OcZaFMimx/wtswpMTz/iz6mSbNrWhVUItpeLeIPrEjWuggMD4na0sguWS9kFGNp/vVyfw1RerXgP0NRVl/7y0SuoXqeKcvg554rnaxwHOUBQ8MjnDkg/FETkoUeVGULtj7vMcQJvLrv+5t+EvFvT+NjCVgzbfYAVp2sHRHLuTBllykTKi+JoMgHUTvj2i8iI5O63Vjy1xOvvfTOtdwgj6SeyzKfpCNh/rv9WE70Dfzu+DG01tsjN2gTvwSrmgbAtkwzHne/YWU2+R/6ztTt3N7YXSiu6GMgLozsa1USdNK4UIuDXfLu62W9XbvpFa/rwOr0lB48xoUKf7KBIsGM1kjfZxTkT0wXumSHplRD6o00RmkYAPWvsu7J7onkuyggE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(7416014)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ocdHPE/L3fwc5BRThmNKj2WxVRNK6ZaGL2E5TxHy9T4VRIlkvrJm+TwD3hn?=
 =?us-ascii?Q?83mOoYwhGC4bcRey2LUfiLKOsosu71vg478bfJf+SxWQWLxderxADOzpQHIc?=
 =?us-ascii?Q?iJPTFnM0O90OBlEIUwnqjEcKSP9/DIDoVQnFi7TCfAzoNaf2KC2hdCa21yCM?=
 =?us-ascii?Q?Neh1G4kZj1OSAob+kYKzJA2U8wo8L/5UKzKzPZjcbfdRULI4EdnlcyVU2UHw?=
 =?us-ascii?Q?VO4Yq8e9SJ98by+kNKcsoEdHFq1y18OG0KdOu2i6Y1dqxfcmFvdGHoisjoBk?=
 =?us-ascii?Q?YlpU/NOCJrg1KxvgI5T44eAdvC1FI777H+PGnaslK3NRkOdjS357zdf1/z02?=
 =?us-ascii?Q?6Mr3QUrDraVEJZnPpecRsl37TjGxiyKE8S1FCztPiJCX6c85kSjfyuIfrqdF?=
 =?us-ascii?Q?L1RR8WRLV2gDbblxU88K69HUkG7PdcIQ0mMOJrfnh7K0rAjZriPk7ZKb51oC?=
 =?us-ascii?Q?5LtZfXt8MToFWSuwvgjJcUvWT3oPs9gnR7u5Plr0BYvm39V2PO9Ld+Rrk08U?=
 =?us-ascii?Q?HZPopQwPOfWIsR4Np3ffdKXWa6joaUsKrD79oTTGs51j+0Bf7wnhEBVM2P1I?=
 =?us-ascii?Q?it6mJiTCpw9BZLdArgFc/aL5a3BED5SiMCfu+511/A6cq+zrel5v2ebpVh+s?=
 =?us-ascii?Q?k7gm/eZU4K2gRqO0FquSZ3s1b0gsFiRNgTPE3gML6lOqympeuInk3/qtXfSO?=
 =?us-ascii?Q?EUcjT94RaDa8qFVnTbOQ06AJvTExclTlqyL98UxSckf2x0FFDf56nNyRxUJH?=
 =?us-ascii?Q?lJ4Yu4NeiuP2gOGoLAs4yAXACZKn6VuAGu0xA/4PreFHSuX+JZSc3tAYXV3q?=
 =?us-ascii?Q?dZ2gRFElHtRZnTrGJrHfjLnEa5j+tDS8NgBWPuaigwJhZq5iO2Y87xRWg7Y3?=
 =?us-ascii?Q?SlG20Htq7pINhqrS/g3XOOPH5NhNkTdWqQ4QZQ2CL/rV8vX86Um6V22Q3jI/?=
 =?us-ascii?Q?57t3xRE4iDBg2yp0WilkPEwa1HmgoHDSrfEo8aZGUFnCbTMFUSmzdhtPmT66?=
 =?us-ascii?Q?NiReYOfMm04eK5OoS+sJJN0UI7AZW2GKJvYekb4ujWCI1IwmW1jWdo34Baw7?=
 =?us-ascii?Q?BK6w+FYdBnc3TWYbKux3Xlznqq+4ZETE3XVApMzgH3IyL5VPaGOylzmPq5d+?=
 =?us-ascii?Q?OFPrP821XUgYDZTO/tRwelKvrZDyUduSDURB/e/ZY4I/XQin0mi+h9bczfRe?=
 =?us-ascii?Q?0FQPgYjP1xDoz2tCiqo2BONFnQFfaWWIRf2PA4h3D2KWFg8nN6k7jqMbH5OV?=
 =?us-ascii?Q?1SNGmHM9l9wyL95MCJAaJTMuFzeapmnO4Xq0nCRVQlR2KGQV8rX/TyYQZLJg?=
 =?us-ascii?Q?EKJoG3a2CE2XKg9nzos0bUWN1wiF0tv71ukWWJeR2ufNgeMfT+Mi2PKc+/Hi?=
 =?us-ascii?Q?5qEV0UkzE3LHTtpVV61+cWBaNIbMvyec955BghnC/Jv3wOmNX56lFRHwzPMk?=
 =?us-ascii?Q?8M5g6t4IswNMIQ2Eq6+VQ9smXu3XlMvSwx+ae5/VtLIeBhCHTwgOqubdASwL?=
 =?us-ascii?Q?1leZ3Xe0l6SBwrd5OFiOiirP0+4uwdgy/8tj7SZHqsFBNrDiLn7/NTBacr5D?=
 =?us-ascii?Q?zn1NqP0rBUPQLPmJ1Qsrc1uUg9wvWba3WM7ss0Ny9Qz6Wwadjl/HiuBpsrdB?=
 =?us-ascii?Q?E+YI+dwY1DRzwufuMLxoAkVq21isagx15hdCwJku1S/GpG8kOssFarsg8ra9?=
 =?us-ascii?Q?XI8fZ041fjqtPpbEGJP5CWLW2N4VrhO1kBCZhaxsxpS8yKfvrjMKJcVWs1Oz?=
 =?us-ascii?Q?0c6mgFCysw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b7f6bc-271f-4c8c-c258-08dee7a349c5
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 03:42:43.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URtPFno8S3G3+uB1ALBJvnMgwuVgbCWN9cwdg0eL2tiPDrezr4QHxxEPimjuVOw8QIINEmvlpFae5KKeTla5ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_204249_500879_2295AD41 
X-CRM114-Status: GOOD (  19.89  )
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

On Tue, Jul 21, 2026 at 07:05:03PM -0500, Frank Li wrote:
> On Fri, Jul 17, 2026 at 01:48:31PM +0800, Liu Ying wrote:
> > On Wed, Jul 15, 2026 at 02:34:48PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Add support for WKS101WX001-WCT panel, which is an industrial-grade
> > > 10.1-inch IPS TFT LCD capacitive touch screen display module.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v2
> > > - update height to 135 from 136 (sashiko)
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)

[...]

> > > +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> >
> > Seems that the panel also supports LVDS input according to the specification,
> > since it mentions 'RGB or LVDS Interface'?
> 
> Need hardware rework to use LVDS. Need remove banch of resistors. Should it
> be treat as difference panel by different compatible string? hardware
> actually changed.

Not sure how to handle that.

-- 
Regards,
Liu Ying

