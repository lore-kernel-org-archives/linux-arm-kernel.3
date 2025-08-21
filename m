Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26C6CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83vM9lnRqG9v479UQhkfA08L4uVGlAoySxmDnnepw50=; b=nUAlwkrHeHLKQJiJLzuPRvWduL
	UhOq4bX+EoM7uB7BHt56PAAgQdRjXfI98R/8DkRaI0iXVhd9gol0xIXF806v3DkYd9upVa3UdTdR5
	o7WjOaBdqKZzTxZbvjNC66eHANyordvBhPd52HPrNhamm+GHdhm5rTnf3770mnakM1xZQog2y+Kmd
	avM60JhsdnREtopKshd+doJL7tjDrP1IUyGYuvCpSAgqQaFosHkGWoahxoovGG3rZnupFO7mt+DDQ
	Vgm1edPu+4hI5dFiNugYpgl++NK8dVQ5lNFx/0s3hf1sJKQpswj4MEvWHBcyi5HBPcDAYTXwj20RH
	D/OFYLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDss-00000000kda-2AC9;
	Thu, 21 Aug 2025 22:35:50 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Cc-0000000HLlV-0zKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+WktL50eRbfV0hbLx+Ry2zHn5fkG3V6oQgXTMfXzbtliKBWMW69i3XGRc2R+HSCF7dROKHzYYGU2A2LlCYfqJjmiQcOZEWwKyTRw7nW426JeyN/bAh2zZxvgR35l52EQKuE1afFbJXlvZErfV01Ag/MdoDUfL1r42lD8YFvSOUVSdGtpTAt1G0RB7Lvz/tsusj0EenZQgUo4tRSym1eB/3i35W6BrhSitHoTYLUtXUY3rX4zoOrV/6XwOGKShf65AQonf941kuoRN6cDotmnktoH3998dC7t8/FNW4n9fysQHhOL7uvly9ia0SiaADbm1cC3SDP/jhaBqAUN8fwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83vM9lnRqG9v479UQhkfA08L4uVGlAoySxmDnnepw50=;
 b=FrZrk04gwfLr88e5w3a8AKI5zVXil8Xu+TYfeffl1N+mwrM71spSaUFitUwL3che7ywqYdwTlXBzehIVpeDN5funrUZtol7uJ1QfAETY1NGJ8LIdMJxDxNpeujf91ENdqitRQOSaIptHsLWkA4IUZkw8Arn19h1NUYZjxin/wIt+R1YRcE5+BdwlicSlm6+GWYT12cXixQAMBWxiVylxrB7Rth83Aqwu+ZIeQFAj3Z8gz6nBOZWXfJZKkT8lMTS6x0W9B+pRJZ2oGDY6clnTCeJjZ4uSNXSia43lnF7jE42RL8XH7JrJvKLrUK6eodOvItzguqDaqaHLM+zpvkwWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83vM9lnRqG9v479UQhkfA08L4uVGlAoySxmDnnepw50=;
 b=YFY+Ru+2nXxpuFxWQQ3A5ENmVEBreReeILWY6MTvtN39ooZmodQWy59eXX+q8i64IYHsrlbMMMfmeBi2un9ZXclhZpescaU7vw9tnRGwRbQyS7lGxsUxyAJ1iA60Ez9DFLwI4KaeOeK21kYtR/y160UrHmZRAnx7xdFJtRQBehaUs+73OpgndqtjkUi+A7dFcpDhwFM7utooZvSxkCtBXhyflJcPAky8IfFu1UBInDQveYzgOVLytWYSUvfqIgl/VoZFm6P05xX1OuKHmhfD/B5mCVZYCeoY6s1dyCInWg/JpIpkVa1r2sQZOW7vmIGqGKT2omTUHRkwtbwhUXc7XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 15:27:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:27:41 +0000
Date: Thu, 21 Aug 2025 11:27:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/12] media: imx-mipi-csis: Log per-lane start of
 transmission errors
Message-ID: <aKc65YeQRYGsU6cn@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-8-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-8-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: f63a5af5-4bc8-4a44-1f8a-08dde0c74470
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cZ/JpKvgw5q8c9On+hvYRoIqNPVEfebdKH+r8Qj5SUlmke5pnx823Dfaen+n?=
 =?us-ascii?Q?J/SPAR6mwMsYfqjTyKtGZEmfkkIgqEbkOjtL4R1dJW84c5/rVtlgfXQj1zvc?=
 =?us-ascii?Q?Jlc7Y1StSPqKQNYKUIOmNoQ1X+V8W5l5j9sasp6FBpBqbZOKkt27M0XJyi3M?=
 =?us-ascii?Q?4OvC+AtnawrVhcfzx04FxDqaHruxPFR6mUjGBab6/7hZ+S/A0zrryXFBkvOb?=
 =?us-ascii?Q?NfB9NB7NUXrFyccDcCAFvchauRSpU1h2RSjWwMQraJHtpUYmaa6b8qWuEg90?=
 =?us-ascii?Q?EUdlf2sR7a1Tv5rl9M8mlKx+qvixgoru0/QrvkZ/zY/s/EVyD5iYCF0dVbFS?=
 =?us-ascii?Q?n2UzqI9chDb6BQLBXOX4N59+au4BnijCoSivbBQkF1WIPHgUTMSQfOl7r8Mu?=
 =?us-ascii?Q?VCq2hVUO1bscjw7ZZw1dsNW4ck3qVyV/vBS89FIGwNhWLR1aiovcEAqnY0K8?=
 =?us-ascii?Q?L7cX6MYMy8/8LsW1us1aAUc/wTvzvz46TwonvAAgYI5wlDmSG+YUUFbXMTi1?=
 =?us-ascii?Q?BmVwZn1XUqhmVVNOi6A+lQzOm/DwHoi/yqbqWLxsfrEuK6eaRih0h65uhx4m?=
 =?us-ascii?Q?Y7bTHMiZOSgqVGHyQsFz5BoIRBcttd/w6DwJ85KhtxwjQaJUeQVkQYbiE7f4?=
 =?us-ascii?Q?PoP1bMYc7Ki9knnUk3Ng6tuQS/Daciphx/ancT2kTz0QTCXJzccHCsKYAiHz?=
 =?us-ascii?Q?pQa/mM+nSBkmIZkeacMhXB0jV8q0p2YEoq/4EH02xDctAXpgkIg8TIL2Rruo?=
 =?us-ascii?Q?dNvOtloegKr3Z+Y6o1peH9P9YG4QRbykMD3js2m2JwP5PvHPWo3LX1Tr5e1D?=
 =?us-ascii?Q?pLkPNJhZZo/DWJ6+55Niglu9awUeNccVm3CneiMOI24/x1Ca/NMEUWjz9TFC?=
 =?us-ascii?Q?qcoQI4C48EImAE7a/w6nuQ63sKOnQxZyLv+PgSsbUmki6aJFItzv0mRwFE8c?=
 =?us-ascii?Q?iYsAqAvoylsHKw2jwdC762UG6lCjEZfqFSNT6tlSaJObyCc1WqJ/bMzNGfQP?=
 =?us-ascii?Q?pNM4bAyy0egIVqIIFmhBINC9bTEL+4BGxo3KJey1kmmY70ytTuYDR+UUGQsZ?=
 =?us-ascii?Q?Se2vxpwOjN9eQijBRywzsVmfsRX9E7jgSeOLkB88EekzOgenUYSInEonhECn?=
 =?us-ascii?Q?lCyFwsP6YiXnRFP2GYX1QDml7VzbhtVMFyovdjI4Kos/rxBm3Rw8XYffcCwi?=
 =?us-ascii?Q?8srUD4jmY6xL8NKma+IWN27QbYclScu4wcCIFbkMY0kubGFGGsd6uaVj2ol0?=
 =?us-ascii?Q?bSgyBwO+/QNJUEzimL2kCH9NFkQbxA/WUwoHkg1KzTFeoFwj8eGghkYLRIZp?=
 =?us-ascii?Q?pHZYannhbbSn1UJdguCYaRnESVaobatJkB03HdNV04zgosL5vKmlkL8rrl6Z?=
 =?us-ascii?Q?RvCRa4oN4cv6ZnD0xmsjhrhxeTmM4np1yJN1bJIofSEhhXgqJvyFX/qcD2b4?=
 =?us-ascii?Q?rxiWW+NxXmf2Gq1fUs7424LGgM9tFMNOGjQ+x0ysD6GEkXS/QJq/DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rJ4hFjtEWCkW8C2CaSitj8w9x6VZaEPj5OkswIVQiAEtcUkAl2vh77ACA4xc?=
 =?us-ascii?Q?FzZ5Zioa+SpE0W7veLnoUaEEf2ZGPRJhCQ1yT74xgaFAXcV8jd7wbPNMm9KC?=
 =?us-ascii?Q?jIxAnXhSqMtCwjhglRzYLjNNhgUwFb710vlq/EWs0J3t5RpZzzMmMpzTbM9N?=
 =?us-ascii?Q?iDwApUuestYTXqvI/VQ4lgpzz/VOImHLmZyEuNq4a+7g7LfzV0m0cAlj4s/0?=
 =?us-ascii?Q?Krul2eeVIoI60hxZH1aIev8PMzv5y4x46gEMgMsKQHA7tU5N8qmhChDz23nM?=
 =?us-ascii?Q?5VPKPS9lZbZkJJZEkR2J0kCsGPTE/xqom/6lJjr9CZBzpEgWjbHnwD3QI8EJ?=
 =?us-ascii?Q?12Og1o1tOn/ORGyihYfZR/8Y73waKlX7geAi1mRcN/smkIRFNjF24P0STPJC?=
 =?us-ascii?Q?TlLd8BuXwPs8S/7hiiePav/FOnxZBg0VB3u6WMStE2fNTkGMtGNqPxdg5Osp?=
 =?us-ascii?Q?bgeSk8d5to2NBDRPtXScgLqUwt20ZSoJ6b6ZAKQ+LmSPP5nG31DryZdt9six?=
 =?us-ascii?Q?ljo7KwEKBHCMtUQ04/+edk/VpPA8/pzhaGpAEGMwvzI5/HjvQiUCCaw4heQ6?=
 =?us-ascii?Q?6MW19eeZQ0iWleVOP5+0IU+RFPPrtWbFUNZouHOny1g5Vi91rs704m9+0AiQ?=
 =?us-ascii?Q?mZcUq/r27Xm6J91v9v3iiql0+mI1tDtaeuhnTMGwHZBdoyUvgEoSi31djikc?=
 =?us-ascii?Q?wo9+ATPuaeUnF1kLvxaajkiCygAPv2jpe57AVpDD+/49v+o31FNM4AKOqcMv?=
 =?us-ascii?Q?m9aDhKC3/LUSe7ohT+93aamXkxl6V9iztu4LsA1dgSZzh74ASocLXa93oa9g?=
 =?us-ascii?Q?x5J1Wf8DuPD12UMJFRhEv75kZA8h4n/9aAHKEl2ZknMJ+hXeKitBoBOne/b3?=
 =?us-ascii?Q?Z3jHbvCDWW9kHAt4c6YH8rsqCji6zbV5Pusj57+xniR8Bt6ISX9GcWHb3Ycl?=
 =?us-ascii?Q?p+FV/pYbdkxs3SccHoroMWWP7tTPeEdF7cmuhZcnG/mxYxQ47AGGzWH5SYbw?=
 =?us-ascii?Q?klyYcx/ESkKN9vQ5yvwdw+mtuQQ0uJOloUbv5vvsIsuF1NqQUk23aQYdBvT6?=
 =?us-ascii?Q?1FxBHWYHykOvwAl//YnmoIxmXDRQrHqoC0aR6fDAXlSF8Nw3k8latvtg7zAr?=
 =?us-ascii?Q?FxIimTNZcjndygO7sa2JhEjBVJC+Y4Fv9fT5+xSeePmy0r1LizOEo3D7sUcy?=
 =?us-ascii?Q?vECsxr+96/hUA007HKFwU6M3CH5uGG4uie6mUmczR1BeZpgObJzwcyiHMZBf?=
 =?us-ascii?Q?PAmpo//4AVRtmJJW9/LKAgRaRqDL5nN/GSNMYa7yY1aVt/mw6yxZRp6tZQqP?=
 =?us-ascii?Q?3FFu0da2gLK1m4U6k5R/Vh6ckpNXhsswNaqJ7BhHvXzqNPC5vt+ircPkx6RJ?=
 =?us-ascii?Q?eDU9kz3W5AJ5g1XMeVNpyaYj5Hw0tbMviFLJaA4b8Qcs5XDqm1VAkWR80B5G?=
 =?us-ascii?Q?ZV8lzo28f4Nil1Y6I+lo6wor9L222yZEgF3TVinsf1xL5od9R8cUn578X9xL?=
 =?us-ascii?Q?mGqhm2YDnUeiC+D2iCTgtsW4Srf30wnfe7FxCbiRK1IWlZimi9/8wd94a7/K?=
 =?us-ascii?Q?IfisINVtI7s/v6cv7v5DefBf8zBwHLD88NuQhfbt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63a5af5-4bc8-4a44-1f8a-08dde0c74470
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:27:40.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWIM+rc26SfAHGvn6lYUhon5RrXqAb7yWi0XiPo28PG7JXnPD7PahwpE+7PwNRR3AislG2d1zNAwkvlEZAJeDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_082746_272047_801CED84 
X-CRM114-Status: GOOD (  17.80  )
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

On Thu, Aug 21, 2025 at 03:09:39AM +0300, Laurent Pinchart wrote:
> The CSIS has per-line start of transmission error interrupts. Log them
> all, instead of only the first data lane.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 35c8d5309424..67da8326540b 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -100,7 +100,7 @@
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
>  #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
>  #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> -#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
> +#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
>  #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> @@ -241,7 +241,10 @@ struct mipi_csis_event {
>
>  static const struct mipi_csis_event mipi_csis_events[] = {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> --
> Regards,
>
> Laurent Pinchart
>

