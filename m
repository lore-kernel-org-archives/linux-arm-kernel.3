Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D127D74EDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoEKG55J8CWC7AWr6+bsykApZP8SQi4YU4rHOyoCFDY=; b=07AC/8D0Mv65VguuVwDTv+Ues2
	xARtEm3D8CJdcM8vTI27GPUrJt1pGBJ25EhP7k33JWiyI94T5aA6ZKeKRu6q9PtMRlVSfaEN3F1gz
	WKZMlcYnHmQoNxEw0zXBY4PJRB6maBOadQ01zqqvfT7UWYB7Jvru06HmYG6J+LjRdA8M2PPxZD1lT
	XeLLTDyj1O4Y6lsS7sAv5BLqTuTykxgiBsb8v+BwEeWylKvkq/wOzMmz+T9waOPsca4tvQvNI3BX/
	6ytp4fZ9a8QPoHpPMohGZ/ZHutZ0CKUgJkhTUGj0+sD9vBr8KVcf/j/ihT0QfD27oMeTlvRydY9Ui
	uN3DR7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIZv-0000000943M-1ir0;
	Fri, 23 Jan 2026 14:56:03 +0000
Received: from mail-westeuropeazon11011026.outbound.protection.outlook.com ([52.101.70.26] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIZr-0000000942K-20W7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 14:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUEPz9ZdiKK7ALv4Hpt+b8aG7ijVszMgZCDB1oHacIXKxdcT/YG1r6Axo9c06cxIGyMzKJ8yyPwZ5l9AnT+ckoM7AAbi4ICS74Od8o2E8nFTv2RteraK0mnexPxcvNpoaOxhge4UxPsnYmWc15EWS9XsOdUBlrAjiIDJ9JsPWhLg91Ru++Lwpr9N5XKzcNuOopxTpRFJ+rv/wcfctP4ZsaS+fXJ6U4m1genO9BlD24Dh8zHJsKDq8Dci3mXQ2k8clJzWBkkxRgc6Ct+UhQN5G4d4BvpsafbGjVAvbfmJ6884PDFjJsunrFx43+UWiE5pkIXlXt59BwG0isqLPD6xDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoEKG55J8CWC7AWr6+bsykApZP8SQi4YU4rHOyoCFDY=;
 b=mRlOtdQJFYGwk9Mgt4TxLVz08aU4qYHarLXfT4nhm3xrLYRYjevtfDNUHNe6WyQfHa+7NLMQ5Apgk0tdC/G36ZyTv/FWEfHthOo1dcV4p66gpUAvtUBBJ3xsxO5SuRfut/ZYhMhJPlY/yhkUmo+dlnlmAq0KkAYA9eF+bQSxBp1VoHCdDmWeg5VgTiZ4OmnTf5E2ykQU9Al/Aiu/lMRhJzp/EtoZg33tnvEh05vfSv7UuSaCyNS2GV3Y+c0ty6mN35+AbNj/Fyqj5MxaU7y+g2RfTrJg2Ho72b0mw/QiPkJ/jkyn3Z8lnn1rO49MgPNGRCQIWlXUjTampR3EhRvA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoEKG55J8CWC7AWr6+bsykApZP8SQi4YU4rHOyoCFDY=;
 b=gCvHWgoW1qJC5KPKFofNqAIKl14TVUI3nXfxuZ4HNJAvED5ey2GAzsUnWrkRFkkMixnl2muI7k2qiwCV4Ji1R6gXb+v6eJTPc2PNg4Rj20aNTeNXZWgI1EqFO3uvW0I5XXktBEKEvYlXHfoMLNDWaFPdje0L1SlqKbaLjo+nqhwDgphcChs4p52RvxZUNT14rzLQOfUH3RfXh1Ky/ko2GenmtlIj+Vc++pa6a3Xk+DfS3XfUvYLtUw+KI7xyJDZfJ7g8V+x3MYQjVZdGYbjPfa/o27ry/aNJWf3iA12AVXeaRy72dayfn60qpTMNExD4gVHSzCKGxapCU/rGqvNCVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:55:55 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:55:55 +0000
Date: Fri, 23 Jan 2026 09:55:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer
 dereference in imx8qxp_ldb_bridge_destroy()
Message-ID: <aXOL8K/aiIQkU1Xu@lizhi-Precision-Tower-5810>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: aa438ddc-fc78-4183-f308-08de5a8f8294
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A2CuljiUKh5p8pWP9P4mv8FOQLVKrMV28zVR+6aeNWCDcG+NmdyGjSl2NNaz?=
 =?us-ascii?Q?kp917pSeFU8fCpfnfohIt1/GdGOHmuQmKIz5hSE2yzEa6UMSYAFygL8RLslw?=
 =?us-ascii?Q?CngqjFzLtLXmftUJxnkHKns9BUR7vmA4rWNMTPLnQEIlpDJ55nH5Eif53S1t?=
 =?us-ascii?Q?K6fciSsPtmtfCm4ayrioEgVgG5DD7W+eYELOl5pQcWOViGq+bHFPsLMdA/GU?=
 =?us-ascii?Q?8mSSIPlBurAH4S/zYXW8o8P85SuVZFlOYFk/Z8W34FPSsG1RfS3g6P7THmxA?=
 =?us-ascii?Q?i+N+N63lhULr9AEPZOEavSesv+O7RHRzudJHdt/45nS7dp6EGkjdKwOY56mR?=
 =?us-ascii?Q?TzfHSNzfOA8mzOJl3YPgT+bxWs6n+DYk9PFkgoPFf4MOiYdpUufRabB6HGtD?=
 =?us-ascii?Q?N9Oc0oHKO/3preNwBV8O7+Rw5jH6JiUln0LFaTX6d36bgyjW83KtVlzTHGsx?=
 =?us-ascii?Q?du+rPuNx9xs+FH6OCtis07vE+t0ZatQZSTZZ1d9yTRHIb072NALd5sqBK72F?=
 =?us-ascii?Q?8AnkHLaPkcrK2JAj1hWNy6siXo9zwiKo48UEJdFBCjTk3sZ074XNchUZWupX?=
 =?us-ascii?Q?sBAUq0NnpL6ffjM6AKqC35fBN4ksrRFpooo2BYwdKygqHBnrGiRMn4d041kv?=
 =?us-ascii?Q?ev/Wle03JGS7jlMu2MQ3t7ItMFlwCZakYymtaSvFwobRX0eEJPVG5/iDbi1x?=
 =?us-ascii?Q?Jisu8xk0wggHICQNR3KP3106b9Rzt5IZCoCLjgrWGIt5KjdSETESrUfrtAPH?=
 =?us-ascii?Q?KucvARloHr6poAeJjynbzoCRj9T2WxAWqOXQ+wKxxZ9rsNh0LdOWnwNc5R2t?=
 =?us-ascii?Q?VnUt2kTZH1riymo/20ZhUrH4maUvagekHCZqkxY0uAKaxQKKmrhJ2QjZ/8bE?=
 =?us-ascii?Q?f8NkY9GmNjFqhgGfCIjGZZbI0gp3X8Vdg21gljd3ygEni0OYmS8bFNXLNUA3?=
 =?us-ascii?Q?H8KnRIZvPlvsMCLfgbw9zOEwqpeCJforaegJKT8UweluuKy/4MkakfFVB5Mo?=
 =?us-ascii?Q?Vnszcub1ZmAlun53d8Ixltn81oalG8JqSMqA7pqinS5+s93MBS7bkSf85G3/?=
 =?us-ascii?Q?khkyELF4OOGuSEAPpHAmX7XM/6ZmZwDTXzMpYn4vWbGcWDM6Hl0w4SOUVfI4?=
 =?us-ascii?Q?EtEb7mne6dYASyHGa1eZO6uwY5Hm6AbPDwFydMInV8SMKIJa3YfMbMQteUE7?=
 =?us-ascii?Q?ZnGhMt7aow/YT/FMAnK7/RhmoJhp4L+JdctA4ewAYh8q+GLp6QAI+2ZZf+TH?=
 =?us-ascii?Q?dmRgF3K+WZJyNA/WwseCFPQdRv8z8aIBB5xYvr+n+wK8LIz1ZdcCinL1GM7Y?=
 =?us-ascii?Q?POLBkWZe2zxWa6Hvwb5+t08qkuABausnSJxWtyrJ3wJBFwu1J86+CP8jT75Q?=
 =?us-ascii?Q?ZKXYmFk/0LaRmcn1Grhh/WgaCByfiBYPpnVwIkWYsjJhLiA1Mpcx+3smhUGm?=
 =?us-ascii?Q?KyICzapSYwXsmtkkgisruIsLj6zS3vL3lLSJFyKWt7PaqBne5yf7rBv+ldq3?=
 =?us-ascii?Q?To8Fi+nEz6t3Zy//aSg3pWG/GprxEBYotBfVwHur2+LOkck+Xnyte4eunAFx?=
 =?us-ascii?Q?tRgxSRZLghnzWkVzXKBz6FstqGC3+dfS/rI6UhpEBAVaLguuSdVehGjvXcl9?=
 =?us-ascii?Q?W92JqcnI4t6sAEHCaWZ6kXs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ph56z4qkkaaDxIpyypcuNKLJg3u/K9JzY+AOoSP01XFsuC9zM9phiwIok2WQ?=
 =?us-ascii?Q?u0+sgr7MPc8UAgv3HmydLB2wyOV2fIacmh6EoTSqIrqD16TlvTWQwqKUaDjO?=
 =?us-ascii?Q?dpxNI0EAJ8tMB9uuazLFL+FHzqTyGINWr2A+V2CoEeJ5m6eOHTn0Hvrd9YN9?=
 =?us-ascii?Q?P7RCb8meEhIMTzm/r7rkVPdHDKXgwg11Y3THP1jGkVUC+Kto5nJsBv7E6aE9?=
 =?us-ascii?Q?la9gpKZJuVjO5nl97LQORu+fMS4KXjI76cyBcEc6rIltv4u1xjc0q9QVaWsu?=
 =?us-ascii?Q?EQTAWqhfz++kqOfnOZfTYsOPq0wcDvZZpZm2D0WEE/oxmGz/lA8/7dqEbnNo?=
 =?us-ascii?Q?mXxTmapgtnOGb9rbpSxP3gN2p+rbjBLJyCoOVUkLB9LFmXfLfhOXAjbjmYxC?=
 =?us-ascii?Q?TDSH4zmkHMDaqF6GzM2VbexPwCZh1lR1bNtY20Lw0sbh5RqkZlmmgenLBk0X?=
 =?us-ascii?Q?0TMpDfeKw7OoL8JS8GoH5aYkLyZhajsUAW1CzuCnNkFD1BBibxiwSxyhJtbD?=
 =?us-ascii?Q?bJRnO5eXjyamFmUKGThB7KdErjMvV2Oy4X9F6Jx2opoR+2nRvOMmR5imXSRL?=
 =?us-ascii?Q?WPmI9h0d3C4AEXp456DE7r5YIUJlyaiwgfl7b5pe0YmgipFR8xbYFVW+JBVQ?=
 =?us-ascii?Q?M72JnNmjub1+PZ09aEZvXQxYit57i9nMPYOfLrSpudob7h+CbX71x3Z4tUNg?=
 =?us-ascii?Q?rIziufkxzCN3vI4YMpkyYSlYNmWhelHN1vST6SjkY1yQAd/U7cF7qZmloQvY?=
 =?us-ascii?Q?23KRhcFkTzNasLsEd+Yo0Xo7n7hTf0p5Vx/qWdvACrCZbQd+rxmRYsxTRrkC?=
 =?us-ascii?Q?7dUTNw4PxbPqMm9djqqb3jWyzawqTh9EeQXkYmF8Sc7ZytPbd6jxioePzIgb?=
 =?us-ascii?Q?eVDY7xG5RZ/I4pTixmshqvIg7XQyyqsBSFnq7sL0YorHW4ZJev7/I7/F1/nw?=
 =?us-ascii?Q?JpUpa2xwZiv+9mWJmOQTlVWiHd6xhluM3dgUD8J8SUglOKbz31DPiWkQlqsX?=
 =?us-ascii?Q?YCzi2YB4SxO6nPrgbpWIxlgrzfqvabVkgpJvfAs9c+sbVeaSGnw2I1ygY3Uy?=
 =?us-ascii?Q?IVUbsmc2X62jn+IziPUkGVB+OGEz+/4BS8wlrTC3tGHfX2cHCe4YevKw02B0?=
 =?us-ascii?Q?1Xems7O8hPtvMsP4EmS8TEV6yb0zMgtZMTR6cT+HGprfOvB9+1xZJqwujFNy?=
 =?us-ascii?Q?xvQgPRfuatJ3hHEoWaVToJo9vcyemktj8k93Dr94Gh/mOSUcS9B5TvKwDQm5?=
 =?us-ascii?Q?Bt3SHl3sGZOS/NkfENQzSJxsFiax5ilQV9+a9ejm4c8phC9IGbSK5VT+mrci?=
 =?us-ascii?Q?PaXVPalmEAsDe/+j5U/r/662qxY5YlQnjNr/z95ZmArSK1fIiIqC+y6NzNKE?=
 =?us-ascii?Q?qAu0p7/gSvOWIbg0DxB20+96VYCQDI3qBANeOmtXYeZZUHXLfy+OwQRKQf0b?=
 =?us-ascii?Q?/Az6npCUsaELhylXtO7uGJGd9xuVk8advFXfneuOGyW6jM/CneJlLPfAtDQt?=
 =?us-ascii?Q?VeEBPBUVY4CIWjZnIPbjNojvgmRYxasdks0TVbOcfqA+CchNz2ZeldJ92hu0?=
 =?us-ascii?Q?qy/pxoP0BpfO9bA8Kys5mXzOYVjZY7Zp9T1Hmftk+gGet/HoASZY2C9fFMeh?=
 =?us-ascii?Q?ekPA87PVpPFNAkarDrKgEQ7tvcx9QMvK3ip/PjOBd4vB7qgeHDS4EbFNgfFB?=
 =?us-ascii?Q?o7zwXtPRG7XNdy9FK7KXhDk5G6Jgwf3xzPi3WWlNpZTxpBMpHY0CZXipQVn8?=
 =?us-ascii?Q?zJBvR7edLA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa438ddc-fc78-4183-f308-08de5a8f8294
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:55:55.5552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: My+CK4+I/aRYXJ9KCgISrEtDltjkmUQAeSimwJZ5GqUaJ4x2jN2K/t9AvE+bMduhDcz/GsGCGbG+URNJHC853A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_065559_524043_234A4571 
X-CRM114-Status: GOOD (  20.82  )
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

On Fri, Jan 23, 2026 at 05:22:15PM +0800, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_ldb_bridge_destroy() is NULL
> when a LDB channel is unavailable or imx8qxp_ldb_probe() returns error,
> because ldb_add_bridge_helper() is the last function called from
> imx8qxp_ldb_probe() and it doesn't initialize bridge->driver_private if
> a LDB channel is unavailable.  The NULL pointer would be set to pointer
> ldb_ch and then NULL pointer ldb_ch would be dereferenced.  Fix this
> by returning early from imx8qxp_ldb_bridge_destroy() if !ldb_ch is true.
>
> Fixes: 32529d384cea ("drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index 43b328cb5314..ada11eed13cf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -65,9 +65,12 @@ static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
>  static void imx8qxp_ldb_bridge_destroy(struct drm_bridge *bridge)
>  {
>  	struct ldb_channel *ldb_ch = bridge->driver_private;
> -	struct ldb *ldb = ldb_ch->ldb;
> -	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct imx8qxp_ldb *imx8qxp_ldb;
> +
> +	if (!ldb_ch)
> +		return;
>
> +	imx8qxp_ldb = base_to_imx8qxp_ldb(ldb_ch->ldb);
>  	drm_bridge_put(imx8qxp_ldb->companion);
>  }
>
>
> --
> 2.43.0
>

