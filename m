Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4182AC43638
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkETcbZ8IzxcvZBIRynOzs9IyUtgXuu/C1mLS2H1VI0=; b=xRROjbh+6lTsbnDd6YAK4Omz+3
	5dsSq4AfeaM62g7MgmVd3j5WdwUpxOwH0ggBaQBv+sTDMPbeWOuvielD6/pvVN/5xlMKS/q9fQx8B
	aXsURq3uI42PP5fI8fvswJMa4qVy8WCW9zVkGO8iI+qD2SGtBqLCj6vJ8YKcgJTC2+iLZpEghFtIZ
	PVld+jXCJ4vNtM+QpZlnDb40dg6KXCt3p9zeQMB2cjU+3SVcCODIkRLMK4CQKeA83/sIbKkUFfzaF
	BVgaWRxW92Wcah1ZGY+pxTmo5GF1lCwsg37xh1FE6vsHR87Vlx9AOHL9ik5+tD22Xh+97JdKptdtr
	ih/mQ+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9iM-0000000BeTQ-2SdO;
	Fri, 26 Jun 2026 16:47:38 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9iK-0000000BeT1-0wLO;
	Fri, 26 Jun 2026 16:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bztLHWZgeUj5Ga08edLrDe30k9wXmMBkqYhO2OqPQGuqP0A0wRHwQDbUuSzY86DQTFTmA3d/fo690vQ2CUnb3HFvZxtyV1MannVLXKcjV+h0FOKQV4EhBv4WVl5opWrWLGMz1v4JJeNDw/HRwA8luLv3oKyNbUBFXbW3G6B29l/hd1JYH/tL7HXG2jA7bWPGXjQZMKSKpQ70DmXThFfQhSJYfqNmAqAhOQSnLmw3BkSzIs0UreW4mVfT+nhED3IyasHwcENZNbhn01vZig4AfRPNrWtr0vtjOhLj+ARsZxBV9xwWwLH57RdTmghwpx3ELPr0HkbEeqGfS0vBiobPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkETcbZ8IzxcvZBIRynOzs9IyUtgXuu/C1mLS2H1VI0=;
 b=gLpON4ttNiDdud5o/ikuMNDKksAz+r5xZ79dWzya7MdOGrQJZW4NoC9w4jnEbubH07COPjQUCzeXxjjWfqufS1i1YNPqi50zUV06dQohgqBCoP5j+iJDfDL7riqjTAbnDEW6gkPGBaNbJhy3mCXZrDc4UlRqotXdn7CHG0dgCASHSvKh8bkmyoqcv9bccnl4el6CXn402zlsurH1nw/+MIcWwnNxIa7pVFkMO1k9kr+z15j1nWxzlW/c8yeVl8zd9Af2hEmHlfvD5Ofji/sInAu1iTLH7RI2b/lPa4JRq9DcWNBfQ2mXoXcCNr6640YneBobf8ViErYEJfdsanzMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkETcbZ8IzxcvZBIRynOzs9IyUtgXuu/C1mLS2H1VI0=;
 b=qst8xzfQ/S1YXEYFRoUlQJqfSdSHEsyiaomgVXEqlRJ0429OZLY/rGUondQqfjPRCyeplv5ftT1f8dfUR2ZgtJE5zzAQVMqKJeBDiwrLiLGsK7I7qyN21bgO2QFx5niLG21nA5OG5NOCAhXJFcSQw09lguKQwv3nOHi3tng4Xq2pCIAd4TIMfACCMbK4JnD45FgpupKfsPKmaU2JkeZUQ10wWmhcqz0irL8xuSeS+z5G1d7p6w6IXcwtTLCe0S9fISyw6sXENgPbYh0tNlm0W1epHMABe2gmEVWMNrIhiJbvWZRt5st1M4fYSxlVI9SnhwlxD5VJXoFtM6Gy9JiXIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12099.eurprd04.prod.outlook.com (2603:10a6:20b:747::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 16:47:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 16:47:29 +0000
Date: Fri, 26 Jun 2026 11:47:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video
 interface devices
Message-ID: <aj6tEW5xNW6UvXCm@SMW015318>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
X-ClientProxiedBy: PH7P220CA0094.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12099:EE_
X-MS-Office365-Filtering-Correlation-Id: b67211c1-0a73-4022-fddf-08ded3a29bf9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: qYZd9LZtRrOYd2Qg2lo/6mwWRCsOQRD1+LVRBcTqU/WvRqhbN9D+v44cVvZhliwaDWU8VQKnj/cgqSLlNMFr9kmTslQMirMz/xpY/jVoFRPVpFRuo048bHJzJGJHMC3X5iyRLvV/XMfh4L3w02tggnMroofMTYk7u1b22MEU6P3foEK946g88Rsn+ggquZkjKrypCeOUSFLbbt8OTuXo0CXZFa0F1nTd/oE9tSlVr58/HS1W6l4ZUiDNya3A42wbotatbm3RsdvSGKxJqqGlO7plDqa0vOaRC4RFH1G3Nq1xGcaL/o3Q1gsZmzvRYQdcxnSiy/liPAcffzaxTeUp5DWwWa6XmWzsFUhGDiXA746qao+oFUziMBq98fBimGpDdEzTVqC4PTRCGn5uWXEtehrAZKFAbWYmJf16lHchpU5AjIDjjs1KAgtz7ksC0hDoTk77t8xw1O5npSj8J1v4ig1JM+70DCAPG3kjuqjnZOQprdwDrsVV/tNG6z+S6PFhU8Gl25fwU92BElqN5Ulysc9kUcFS/mzuo9I10Hl74OujWZRDXB37TXswC4gmxn87wEQqPsM3leRry1NGqP+zuDrpKVLSarjlFJaFq+N+P1rrcAGV/Txim0WQpxRRVEmi5ropfN3zKbDXkO/GqZe7k59HCXzae6hiesITRXyVSdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyGlnEpu14K6Dhcq134EYknoH9s0r1yBQOyLoFrfsXiEpO2S78S/znKyztXD?=
 =?us-ascii?Q?TmaFqMDVfCoyzMREEtwQfNEpHCQ5wyI40N23KghheJmC1oQ+1XHmkLasfPUB?=
 =?us-ascii?Q?q7vIWsJuLuWkHIURGTpB3MHQOULmpUhKNkU1evpSu5wwqNDaySVcUPUXw18o?=
 =?us-ascii?Q?dgacmsWSPOU0LCWexUM7hnywYYYQ6og7qCZlQiKEwklCm1RmtQoeRfQNyH+k?=
 =?us-ascii?Q?bWU9XDps4lVwHnXffJDXNKZ71S589PqEr6Tu0MiEAYcWU4nHv6KPmjEIgn7V?=
 =?us-ascii?Q?p9ia0GPpPYXxsF2F5itia7PxWp6myi/St2NZLZxeN0Www/q9ub5/CAShNWWv?=
 =?us-ascii?Q?xfsUy6NORPF6NNkGm1vC/wSZcPr9sciQ4pPQ79OnTZamLhU5W0ylhZZgJ79M?=
 =?us-ascii?Q?h+duIudAwsiN/EYHzzhEHpzzYJJrXxYt/UUV5Lw4vFauKYZcv5c1ygutyX8L?=
 =?us-ascii?Q?OQlnsBLOo4BANc6DxRW8pmqrsbV9fx5nX76d8eeQkTG0Jli9Q7p0c+BkqZxb?=
 =?us-ascii?Q?+pXqNcb61ovPNwz+cpSLbgr4dT00xD5joezIDhSdFvfV2IRQ8gcD0G/tOXNK?=
 =?us-ascii?Q?tXEYQVuhkBOaF2kRscnTkWY/Mx1x8DERgFA+rxTf57S+BifdEMv1HFBNRxcG?=
 =?us-ascii?Q?605R9K7N9IH3HRmy3RaIKVDVyuzJNcvtqVmNPVVoGB3PRywb4bTtBBKrRVXi?=
 =?us-ascii?Q?gLoH7KGRJZjA+JA+WPjhkYh5cVVndaBRwrklDPVmAKxxo127M85brCOcV0K/?=
 =?us-ascii?Q?jTLIopEz+XPtf3AXwO/74cmScsHV0NzOpQ02unAnrLsiEesWQO3Mb+dgUIHv?=
 =?us-ascii?Q?KiGA1wzaWX70LHjGqWVj4i++uJNeE3LEfoAXOv/GMBmagMqe8z8/6bZ8cE43?=
 =?us-ascii?Q?PIKJuwcaBaDKky4cnH+ZkV4P3QPSL4A/U4DVQVjZ7YlQ9Pv9tU/usc2rJyzE?=
 =?us-ascii?Q?CaHB0lPA/5hNQk0kxxq+lBrZUBvNqvGifnxGuCyzWnRbOQiofeJTBf6OuYhl?=
 =?us-ascii?Q?0Muq+FkPRVOYK8xg053t0DEg5d5QFgkVwDzT1j+1lCzU2oy+jmUKwlAMBF0Z?=
 =?us-ascii?Q?NzmnhI+qfw/bzUpObtbutDJ4eJqS/gtShNwhP39YlCfy2x3DdcQlNdrkBten?=
 =?us-ascii?Q?DY3pwKLPSh5WcSPlRR6s2viAXChCcYuyp2rPiNcuCRzHdVW1Z1s3RI2uDwoO?=
 =?us-ascii?Q?tpTQHKpZ0VZyXUR/Jj/Xw+vRgVdA8pZCgZllJ5iHvpszMrF65fII4N6uVwm4?=
 =?us-ascii?Q?qA8+Dfy5qnevcEBXXegk2V0bfqSyjt+KKPDTiXgeLxNFha+t7DppYHP6jPB3?=
 =?us-ascii?Q?dfO8CTGrpvIjRA88dc7gp6FVX1U44m64v80UgtfQUlyTo44MCyJYd6nfurSj?=
 =?us-ascii?Q?NKspfuszjla1HzkPYSaWAOp0pZogejz+OnUHGfIanJnMy/bhy83DH7fpnVQv?=
 =?us-ascii?Q?9k1V1wx6SgHRwlHLynGdaA9+OBCoHp1QQIpo3rwR3oJ0YokhvORnLoVK3+nO?=
 =?us-ascii?Q?ojvkZ86zfX6xbK3t5zkzN+J9wuxzvD5KlDbjO41rpJeNz40QnTmtdMyAmjB/?=
 =?us-ascii?Q?XZuvebTYnba47c9sKLc9P93fxet1LPKJbnSYtEaj6+rB1nIidrcQB8oN58G7?=
 =?us-ascii?Q?SdQOPPWQm3y9HV016WS3SKR/qlhRpIm5Vz5RO+9ZsCNiM8JISW8ZS6Satiip?=
 =?us-ascii?Q?yB6dcDfFYlkc1u/Z1M61Mrj1gnvR0BvsyTpfSCx1TtAgmF3OszIrxKRt4oRu?=
 =?us-ascii?Q?4T5suwiVbUDiYpbLUhuWld7AxhpKmw/1AKcJtzZmLyN8J8YL+o4D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67211c1-0a73-4022-fddf-08ded3a29bf9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:47:29.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEfvsE3C6+b/zDgdbNnd+lzlkYRSpI8E4mJQBpfhqqrzgmZFD6V4R46CHLH70gweKoYyn2A1rzmZ00gCK8VR5vyQxjnIsietVZc4TmJcgbpZyiaPvw8glfn28UEq+HdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_094736_266497_43A735A8 
X-CRM114-Status: GOOD (  17.44  )
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

On Fri, Jun 26, 2026 at 01:07:53PM +0100, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
>
> This allows avoiding hardcoded constants in device tree sources.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
>
> --
> 2.52.0
>
>

