Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3848BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTHnXaTZ3WZ95ezN//nntkK94rOKRQfH92kroTmCcjA=; b=jE7pt5rb/D4gpBvVstt6WD/VTx
	EM9Y0FN/vvFOhuklC9tjOchPUphul/JzuZSqI6YarussVmaDAXTZ0LN4nCLCsOiz9QC9pRDI9ziI1
	eQBCYGTPp9EbybaNUdMGf7jLdOJeOS7jBV1AVTxP/w6LC5QwCG5zhh+RRWRuBQrobJvC9swjnZVDw
	ssBD9sSmKCORpGGtDpCoYWiZ5vm3p2xDRAvPdvwv4N4MQ9aQXNqFHi4FNuhbbXXk4wu0O6/8U/HvZ
	xPKTqR23S1WRwELH1CCBY5cN86ETVYUbetV+QcNkKm+UbvbML002tpVJrdkB9WtSm4hZKWEt6yt8a
	eiFwIFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn16B-0000000F7ze-1jLB;
	Thu, 23 Jul 2026 21:36:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn169-0000000F7zG-2GLg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 21:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6tB2eWobM64xFyAAkYYwnrrxdKf3KqKk6Cc1GxQZmKrpRUXip04CRHrcWxhw660PAmTEmT8EHfA7HPlZyK44CVLZ48SLpx4mBUEIY+B0MgaStM+M2FqEa8AU8+o4AZ3gvfuDMrtD2I+1abwqD4iqgZDPx5I57F7yRtrhGMDzeHXXMWuHbL1qHqezMdH7+J8ReZs/bZ2E9BraOd/4uTmQVbuouG0bV0LPmVcprCeSWBoEWt/4sNB1hmxBGhk2zDR9C1usgVzjDq2Rysy6IwvIVFT/QuQ1HD27BLzYYs20FqgAVlc/pWm1r6yJx5082Xzh4UPUtRccN0Xxs6U7vdrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTHnXaTZ3WZ95ezN//nntkK94rOKRQfH92kroTmCcjA=;
 b=brFRskEBW/XE6MV/eScvhbaSy/mYOwqqeDKWzdobTgta5Knh6w4Km1alW16yzmbqcL2dTZT1W4w/XH09eSKI9GXFMLHATXRtY4CV+qdATXMAEh3x3NE+q92aDTeG/QGx3u4c8SGoGI4WTE4Xeeqzp4O3Y1XT4pBu/WDCU3pkSRXjsWVTF6OLbjlr0WzeBptY1Xp3cgTfeUfji2HAXYXb7CFMmkN7kYv5C13wlvB4IYTWUMrE6gCtNG0Rg/nLFbdviAqJlGHXpGtiXeT7BZskGaEMfDZqrKE4f0psMM3y6kzRERJ6M6hN2mfWrpQHo3fZGWVqApolctN1AYYmzn5jDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTHnXaTZ3WZ95ezN//nntkK94rOKRQfH92kroTmCcjA=;
 b=rdO7xSvqtCSbN7d1XyENsfBFMAx8Ml3ptC0a1x1kD6Ky5mvRXdE7zCwccFAtuDfQO8RmLqVk6OJqi6rqVBMj7gu4KuaXVFoOgDc11mo6keV1jL/9xUyxTBgYEy7lksARI+JF7m+cFtgrBMvYBgce5roRj4Ivx4XUnwsR1Xzv0wU8miSbG0Jwv22m9SgOlBj/vzjQH0Q/LcB/VG+T7GkaJ9WA77+UKZ1qURAKmO3ZuXPZp5uOxds+DROLwbT8+StOK/CcLsSyrkRIJt4uYZNaQ3hh687GC5daA1sG/yupfeQbF6BhllOnFQCluptbYtsiQy5PsKKH6hFLsNl7iRCrGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 21:36:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 21:36:52 +0000
Date: Thu, 23 Jul 2026 16:36:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Message-ID: <amKJZ4CZJbeBw6L6@SMW015318>
References: <20260715-dxl_lcdif-v2-0-da797562636e@nxp.com>
 <20260715-dxl_lcdif-v2-3-da797562636e@nxp.com>
 <alnCL7ylMyvGD-ui@raspi>
 <amAJL9TIcDAK7kbh@SMW015318>
 <amA8iVS4c0exg6pT@raspi>
 <amA_lUpWkbOFal1y@raspi>
 <amFAXwoM4j2sIENj@SMW015318>
 <amF60o7yUcqAE24N@raspi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amF60o7yUcqAE24N@raspi>
X-ClientProxiedBy: PH0PR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:510:f::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ae3b07-ec63-4b74-7628-08dee902823a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6i0QggykS0wWnCpNntBnFGmm11+pMVAMTtiZLfEQ0PwvzTxoj7AilvQQLMbUsl+VAws7Ovs+MPVJL536wgp6tusVJy95sDE9AJS8RTW0c40zv+eaGx+6AhV2R/XCBolS47Aoae084Xkuf1RhhFKgbfwJG4VcJ0G6LOa7T8GcL6UxljXfhprguPQaDkBjfnWJuraiA+SfIyFqilFeKhJr9jYnzTQahM2HBe+chP4CGuG6wcNe6ZlYx3xFHHetsdaE66x4QGAjNieQYVu4rzyqJkUX4O3+ux8CPbxlAGjGwhhX9JEcNOUmiDQwlftUAiJ53lHPANirGSZ+siB2ANy1esruQ6VSE4iei9C5LSkfI7vKP9zxokUg2vOV0lYGXA68SxAUkTKxUieS1eMkXXPblJtg6aJfhfB4CfVEW/0G32ctOmYVbbfr7hevOqG5j7gxs6Bgpa25wTZ/itkv5s7mkPXksR3p3ylHoamjzsW1J7vGQ2PO6+jbxK9rXcSA8K01EwK8i0muus5I71tG6ddsAc4TQjQUqgZS0jPJIiUo0Ra2mH2oIvk4nSNDKeMNL9C+5m6R/vG5vm9klgn03xDjXwUkmFGKGXgU31U0zusgqopUYtYVoQDwzAfqIsXVznP6aFtAU2uR0ImlJWCO6uv/lfvLvRgye13dRXRlRAtxnKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2pZvx8a5zrM3HvHHOsqka9E2klw1gA+BngDXYjjih3GC3qQ5gmsc/W7UPq2p?=
 =?us-ascii?Q?IFoEdj0NTc88PXmnone/DSQNFwBR+B1lKp2hXTGmNk1uqtGF6Jeoysx58xIa?=
 =?us-ascii?Q?WBAtTHivGtpa5OjkZam3iueXcvn2unB5DoJP0FqJ2Kow9d7IgSPm5VZxSQLm?=
 =?us-ascii?Q?LQ4lGp2y7QcKXUSPHwxYuE2HIZMFZ28c2kGMPcA7yxRA++PC2/lsfGnWPt0f?=
 =?us-ascii?Q?Mr17KwZVYfAFmpVZMFpj3PyFpLotUGiXCzedNSoaUnWYvNlifffd/GhpYFdf?=
 =?us-ascii?Q?WUZOVkPNZzgcd12z+tkMYELr5N/K64WF6HsJ9CZuwPuEPuqlgXKz3desLjAh?=
 =?us-ascii?Q?4r1sookL4q/MJNn/M5jFEg2OmaSIwZZxErGbO7+5X0EpKEdbpvZXE2VB8omP?=
 =?us-ascii?Q?Yc7nrinZ3dslpO4HQVyWjIl/aZEWLS6kRmWscskoKuzfnI16z5pkTxZBXG5v?=
 =?us-ascii?Q?YkrRsWPYk5brtd7lUh1AOx7dV/lBlL/1kzN6LFl3E5rLbbmSOj68x02KD90R?=
 =?us-ascii?Q?28/w4xfsZ86AkY8eDdjKr4l5DOalmeezkCkNFQ+CE58k2UEYgRuFigZuMPT+?=
 =?us-ascii?Q?LWUJ8rqvqG9hsCQecX60E22zlNJAfFMTws0fZ2shhbVJAlAhD/4Nw5QdFGnL?=
 =?us-ascii?Q?iZedvkVGwJ50R4MT1AGerzcOaMQxD+mRJoGxw8ZBbVdWoRHqdkZEMWBRfKCm?=
 =?us-ascii?Q?gsQ7u1ejecJyKP/qg8qtiizbmmZnS4IR8DXZNyVXYJwqwM1ORI8hVusKloIA?=
 =?us-ascii?Q?a/y9pa33MKW4dN+mf+EmNE3/4ek8zJOs5/Cp5/NghgST6Fgz+VX6YbyZFgmA?=
 =?us-ascii?Q?6nzed69rttPHPz8j/JHXFAt5Zshi1BE6vJdnx+pWSp422AhZgW03265SSTEZ?=
 =?us-ascii?Q?2R62uZXuKzZw2J5RfBUKeyLkFMTiUByVSBfoO0WxiG6Nzyz2kfiD7L17mBbo?=
 =?us-ascii?Q?PEUB2npOsTGQnOkadzgXUUMOXKpcwEfWxgQ25/3goqk5s/9MyRGyv5HzWKx8?=
 =?us-ascii?Q?qR33tlvepV1WiQmgb55dEW85IknaZEkwAfgKOyPu3mm2glLjUZCzGjKcfylt?=
 =?us-ascii?Q?aPytYPDhaKIKawUTUEyFltRjTqvtmwCx1JWTc4KZaoSn4TEv+KCar5j7+eO8?=
 =?us-ascii?Q?M7FuMZfW0ceG3yQxPcA832GU8K7mpUdZM/Xv9r7tWbgOXWgue9DaSitwvSUV?=
 =?us-ascii?Q?iael9OsaTTubovwmSnFXTq+rbCDmbOGiLp/YHIhocrP0yBwlqI7yx4u9oSZs?=
 =?us-ascii?Q?Rd78MaTj4QCIUab8DgKj5Fu2VC1HzaosOj8YrA6kV9chMx3pHjEPJ0dEJbPN?=
 =?us-ascii?Q?Q64R6MKclVzR8lOoOQn3v7U61zbZIdngnIiF4oR/j97ZwaKroEGMIkIb5PS3?=
 =?us-ascii?Q?qC+53ScuEpzxMLZqMZBEzUhX34G37/R9I+zGXhxC9clMu+DSPZKGCYKBufg2?=
 =?us-ascii?Q?UlHZQJovBARRdZ8vkjWbPM9ElfjoBYm9d/AbuSot04e3j3m3CqJCx2JBAQl1?=
 =?us-ascii?Q?bCHjAJpmz6eVOVDUTr73yMYyI8D/NF4AJLMrTKeNcmM+RcfqTFlQxRreaPGN?=
 =?us-ascii?Q?jdZB+mGsLVlM85JKJvAiuNAUAsuJ+U0VLICPojkU6xg7PGW2Skb/8A1zcCzD?=
 =?us-ascii?Q?DI6WbQubU8KgK/jSqVJSTVXVBPCetqwEp9CJYSoWIECjuwMAKjQaeS/DNcGN?=
 =?us-ascii?Q?u9u0MYCMXrLb3GlpCQSnToCidzPDzE4GzeK1HXeC28Y5kORRQ6RnLymFQkS3?=
 =?us-ascii?Q?/kLh80xn8zq783UfdEJBF2+Dpzt9oAAPqbH/KVoL3VPWTqahfK5d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ae3b07-ec63-4b74-7628-08dee902823a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 21:36:52.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XHUrMusmzthYnAJwlDJl9N87PL/Dz/qIbbXFYFqzL/hqTgjf7fmcgI751h8ITSd07MjKLwqNhddn+knjWEAN/gC94FmhFJuzqvKBf13qeiKAbBC+NRvf13iwxJa79QY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_143657_586829_31CF6DF8 
X-CRM114-Status: GOOD (  34.83  )
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

On Thu, Jul 23, 2026 at 10:22:10AM +0800, Liu Ying wrote:
> On Wed, Jul 22, 2026 at 05:12:47PM -0500, Frank Li wrote:
> > On Wed, Jul 22, 2026 at 11:57:09AM +0800, Liu Ying wrote:
> > > On Wed, Jul 22, 2026 at 11:44:09AM +0800, Liu Ying wrote:
> > > > On Tue, Jul 21, 2026 at 07:05:03PM -0500, Frank Li wrote:
> > > > > On Fri, Jul 17, 2026 at 01:48:31PM +0800, Liu Ying wrote:
> > > > > > On Wed, Jul 15, 2026 at 02:34:48PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > > > From: Frank Li <Frank.Li@nxp.com>
> > > > > > >
> > > > > > > Add support for WKS101WX001-WCT panel, which is an industrial-grade
> > > > > > > 10.1-inch IPS TFT LCD capacitive touch screen display module.
> > > > > > >
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > > change in v2
> > > > > > > - update height to 135 from 136 (sashiko)
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 31 insertions(+)
> > > >
> > > > [...]
> > > >
> > > > > > > +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> > > > > >
> > > > > > Seems that the panel also supports LVDS input according to the specification,
> > > > > > since it mentions 'RGB or LVDS Interface'?
> > > > >
> > > > > Need hardware rework to use LVDS. Need remove banch of resistors. Should it
> > > > > be treat as difference panel by different compatible string? hardware
> > > > > actually changed.
> > > >
> > > > Not sure how to handle that.
> > >
> > > Wait, you probably may drop this patch, just document the compatible
> > > string in panel-simple.yaml and panel-lvds.yaml and use add a fallback

panel-simple.yaml don't allow fallback to panel-dpi. Need seperated yaml
for it.

> > > compatible string "panel-dpi" or "panel-lvds" in device tree plus a
> > > panel-timing node.

previous dt-binding discuss, don't allow failback to two compatible string
sorry, I can't remember exactly thread.

like
items:
  - const: ws101w001-wct
  - enum:
       - panel-dpi
       - panel-lvds

> >
> > Look like recently prefer add panel-timing informaiton into c code instead
> > of put it into dts file. But I am not sure about it. Just check recent's
> > log history.
>
> If display timing is specified in panel-simple.c, then you have to specify
> the connector_type there too, right?  The problem here is that you don't
> know the connector_type, as it could be either LVDS or DPI, and I'd assume
> that we don't want two compatible strings - one for LVDS and the other for
> DPI.

If supported both type, generally need customer property and new panel
driver to switch between dpi / lvds

or use
	ports {

		port@0: //connect dpi
		port@1: //connect lvds
	};


I think we can defer this lvds work until it is actually used because
- need a big hardware rework to support lvds, most likely it will not be
appeared at real productions. If it mass production, vendor most likely use
difference module number for it.
- it may be end of life if there are not much users.

Frank

> Although display timing in panel-simple.c avoids duplicated panel-timing
> nodes across various potential DT files, I think you have the "good" reason
> here to use the panel-timing node + fallback compatible string with one single
> panel specific compatible string.
>
> >
> > Add Neil Armstrong for comments.
> >
> > Frank
> >
> > >
> > > --
> > > Regards,
> > > Liu Ying
>
> --
> Regards,
> Liu Ying

