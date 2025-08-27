Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF8CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpcn2vux79IWFeIGsdA+akP5mX/5Exh5QppyLIShFmE=; b=l8J6ENa50lrXzNRmkAyco/658b
	fPg4gnKy+mUp35aJHeXuYeb4KN4Wdr/+xqJlhKf+EVJoGLwGxFI9DEFTu5XvLplGw006A3TsCtAjN
	Aw8POiNoYrBMf3Crch7eu8zn/4esrxeeu6WpytrQG7U5Izv0tkKw66vBtmCHaOd61za7mXqK28mH+
	uEl/Y5czJ7O6vKjmZPXOuxj/NTC3cKCQplq8PxMDN6VHEJxRF9gqmynFXr9LN3VpipeAhn0bToRNx
	aPE0biaGB6haisM9ss3wEdATewTi1XM2UWXETuT0xrql018R9zIqbC1np81/IUsASXmT3kTkVUAHR
	2lsJGYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJOX-0000000GDw6-40wZ;
	Wed, 27 Aug 2025 16:53:09 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHKc-0000000Fmqd-1Ha7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:40:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcGKcWqWc76oI8UA9ffP9dIAqIos5MBv16+A7xjKdYDOSicVBB6v7T/4jKfhRqHytlUNjtentALBCezauAtsnia/xc21KyLG2Wv12OxsG3ReN00vgu8TzPx94jek0+2ROKV/aKmbr/cKd16E1p6l9oVRUwJ2DEKGbCjNoCEWWpCEZ3GIbUVt/FUIIJPPrN51o1xS9PB3zU1D7r7H3qDKWQKThzqZKR5MHoRMm/8Pxe2YDJlHnJ0x6eby0YMNg8Ep0spTgBthF3zdcayBft1ile1yTD2xS95v26TilVl86vL9bRtgEcxD6jPqhqhM5DwU0ae0My2+/XJbhfd/txuxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpcn2vux79IWFeIGsdA+akP5mX/5Exh5QppyLIShFmE=;
 b=GFUDiwBblH1C1ol9kpHAT29na3EGPszIGwlvHR2IRWj+wwmXZFA2gqUVZ6YNECQgxUaSC7UnOOUR58N7pcqLbV3nfsx6hCalOSAxkMMDfby3u+2ktKz8S0VlTYYxG/tsvNltwiZ7h3LQeAnj4jQKptuCydZ1VBD+JH3GJmA5K42LhS5GvRFP/zvUqr9i7but6s/EYt74rdWDvorU5WDaTER9ZLPEzvd0U/7c4C8CFRXs6yUPwT7lbM/R3kbEcJXWtjCqYAB9q0B7GISnNiFpXVvdpOXoeDUWNpW2hmDrhXck6wmOSBU6oNbeen1+b3+cJGRxD/LVo89CwUTE9TMYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpcn2vux79IWFeIGsdA+akP5mX/5Exh5QppyLIShFmE=;
 b=aReWoMVtv1rJqWs7YGGkRnUWZQ0u/ps8VsaplsrS08qCv20by7WfcHs4qpD6rfuWB6CGhMIOh0vkB0yzhNf0IH4pkXQ4WcxJ1cu5ucyZoUJXXoJ2WlDF9LTdmr26X8ivXJvmRasOdLsYlvSQfqgiRcr4+1cAj7bxPqL7uYNcyYVn0JRteBhyXu114eneiINIQywie1cRYZ2nhkiLOZtGn6SJsS/YD7B69NqlEMCrDBwgkgPTic2BqifEa824c6jRa1WQIBnXZ7qNwWa5tX4RDoOCsTpnA8bH821RtF6W/22VWVjEmmdGxSdUizI5azbktMqZsLogVErAvRsDget0Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DUZPR04MB9847.eurprd04.prod.outlook.com (2603:10a6:10:4d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 14:40:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:40:54 +0000
Date: Wed, 27 Aug 2025 10:40:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Message-ID: <aK8Y75/KY3wxsW2S@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-1-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-1-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: PH7PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:510:339::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DUZPR04MB9847:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e10211-1317-4510-2e2b-08dde577ba2b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u04vXR7mLHBsze0rV/wewZrPeFKIWPvK8MMUKje1hFU76jiWBpc5hDYTQVce?=
 =?us-ascii?Q?G7p2JqmBNVhrTPCQySt5yulcf5WlUammu2YuDbvrrPEpYD0zPXVY50nAHaVg?=
 =?us-ascii?Q?anbXVorcp2j6IM2s8qC1GjVUMk6BdwMLNRcG1JLROcGTUf+tiquhBrMqgNS8?=
 =?us-ascii?Q?t8U5GCRN2HrUvcLGLo8+HT9DtG2/j4PikUcImm/Cmnlbq4A4aLxOg1/3x389?=
 =?us-ascii?Q?L/0DD1pvd//L1TwnMHjT+UlzfyLDRCW3JMDu5VVb6yDohN1BuvelsNVmyoAY?=
 =?us-ascii?Q?OjJxF402e+Vx65/vTyG6WazjhMlI6NTb3j1cRamu4rd+7Y19m0AnfWgUzD4c?=
 =?us-ascii?Q?MXcA8lRCeV5wptPkVxwsx0r1FYhnj/uWiMjmhGfs+3sez5/+sXqY1M9f3Rym?=
 =?us-ascii?Q?zZWJHAjiEL5sk3DhqYyMNYvSkmXPmfZ3lHn/BwvBIPBqe2Vl3T46jC8vzNyf?=
 =?us-ascii?Q?QoAJOM/GDg4nMLCGTrtl0KSNoD0yYy9pSh5hT6kxx2Um7PcOXCNBH7T7SZCt?=
 =?us-ascii?Q?J3TcgNnQtmX6IXbr5nrtrqxNOOEXlQ3aLbIuBlD0qCwbtRJ6g8zerlCbAy+s?=
 =?us-ascii?Q?wUOo5G+5YbFQKIfK0MidFRH95c9n7kXWSoBtimfvDYp6xMcMDgXbGjc0RzoG?=
 =?us-ascii?Q?7F5KVKY8CV+uUuE+RiuF5r1qUg96MeQXArMD+cLqY2nRy/HdrAmw7doqHyqU?=
 =?us-ascii?Q?xyol807bgwRClsQWiL9vApEhbNEr8bocfSTysSHJEPPcUFx3IEk2n1e2LWYh?=
 =?us-ascii?Q?OfdT1cWhgHW6qjth/g85Euiv9Bj66zu8O7V7F1+iEr4iTYphj6/aTXET+i0a?=
 =?us-ascii?Q?OJr6Z9NN0JAHMKVZ+T0vG5t6Q/whL0rdvf1Y+NBAH270IoguteK+iihmNk9B?=
 =?us-ascii?Q?s/obn/SnyRrGPOhOUVYU0Jo+FFWcMyPM94ZsZTpJgHTf0/JT+yW/b7N1LGHD?=
 =?us-ascii?Q?j8FwPkrjp4dthX/+04x3cstJeejOwsCyhhad6I83udOBvxXmKP3b7ZtaXkXD?=
 =?us-ascii?Q?ZRUFWlYi05FhNFaiQGXnJpfeVtpshJCQC/vg8bIV5r8D0DFlLwgNRcG229mo?=
 =?us-ascii?Q?mQIm57Vd27Oaqz1pMm6wdoEEwadz+1ZF+NHf1kpx7L/J1YTZgJrwbzbkmbcs?=
 =?us-ascii?Q?UG6PPpTWO4YkzGHYIfrB/SNzVNaoL8LEMe6U5VgdgVAfHh+aJW0yg0+aEOCX?=
 =?us-ascii?Q?kdJeeiOJyXiaybZ2DYrO4wrureVuoOblphUENHtn+e6xmBfJn0MHohlbWQTi?=
 =?us-ascii?Q?JfT2NvOaWb+mxiSN3HJf5YuZ13vu88tIVjitfjsEB6NXbwuDqJTBkcWr+EmA?=
 =?us-ascii?Q?56W/fav4K5gqDwFKcrgQ14u5+alwDYehVvGy1vHYlt1Qhrzyk74GWQ99bYSp?=
 =?us-ascii?Q?YiKH0AeF8I72KHDEZWmIl3RrmnhGogcf6e9c4lGxgJDXYo6AHoVvmO39D/2G?=
 =?us-ascii?Q?FnRXt2R2ToYTXA+iAbEzzm7f3hyn5GWJSK196Pzld7KavHgrblby7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKKe1pcnJ3fF4tEME+kva+kx8t+EZnLPfwKpHsiIqPdnPtd3caXajgf5L7J+?=
 =?us-ascii?Q?9Z90IWrkr1X8502E4tsHK9bTtbNdfPwgoA0wzevJJEztiWOLNYZRabXWDamV?=
 =?us-ascii?Q?zYF3QCNLdlq4m4BYlp/tkSBsWj3Fm8GWRfMkQbeH8AiQBECRwFma6zB3GlsB?=
 =?us-ascii?Q?h01Tr69e8i9tfFRfjHA+jymt8u8CpZ+3WPIqdEfkU0EoQQ3pHDy7o8G7+AB4?=
 =?us-ascii?Q?sUl/tkOF2lQt/9VnKEp60ZS41B3GB0c+WU4YrAUZUsuNG0kw8Mg88dgsMCxl?=
 =?us-ascii?Q?T9kVEzYcXbCwsZDUARnkLGm1epfaCxJHkTU8K6UmrDmxJ2/Rya3JZH6JQLAH?=
 =?us-ascii?Q?BOozj8yuJfdTLIJcij5zhOZ7Chnq5c7jJZKq+k84kyrPrLXrdlAW69mWSjd8?=
 =?us-ascii?Q?U7J+1etMyHBC8gOhaFyJQUWCcGySDXqfrwWBktNEC6e9fFZ39tb9ehMDjS9b?=
 =?us-ascii?Q?EhYYTRpqW/cpGWyUZFpRN5tUKjRfconReVAzFN/RA0gKS9Dzf0kXg4m38EuN?=
 =?us-ascii?Q?DZ3Os3j3ufXZLmAVttdUkSEgHhssWQr+byIaHDcsHg8jdnh+I1IJ6rg8IT4E?=
 =?us-ascii?Q?sNtbzAd3VMs+TdylFZ3F649R97RrawaFx/UZaBNUoEYnBjhkNz8Ysxz+ybT8?=
 =?us-ascii?Q?aBJrSyEoPOWdBFBxRYn+SQvOh+dXS1vtMjGiJe48ld1nRNsLbNjVbIZlrdAd?=
 =?us-ascii?Q?5DAdaSqhFUwMaMPHqbqZcA8TSGTFJ+YDLJR1JWsXfG6hnpjmMW0nQZL2sRsD?=
 =?us-ascii?Q?tqpUQ9kY7We83JTDv7oChe2odbjdGAnMODuAWbnwX7deM6AVAeb9a3PAkuj4?=
 =?us-ascii?Q?qGAl8ESFV7qX9hjzNKoCF4C1flua1+ssdrIaDCG3JcOkic7ZdcWC3abamCsX?=
 =?us-ascii?Q?FesrXI9/RE4WrPzN+J2cGqoOROjl/E7BgtJWM8SStIYrvYdTs1PGF2HC6jln?=
 =?us-ascii?Q?Nzyi+u3v7vWdcxVDqSo50JlUizpXoKnYA0f2v+QuGuNPZwdStaBLUz3Mw8wv?=
 =?us-ascii?Q?IfTapUHeAiRmFuq0rwQ7q2u5GaPOm78cdjRLUK2WjoCyXnSaVj0uyAJLRira?=
 =?us-ascii?Q?Ji4QFzna2Ee7F31xlkbseh0WqnM5TtFdq3mQrQ+snhLEyAU/XQCi9UDaGyRs?=
 =?us-ascii?Q?Vu7OYCffXFrwAJHHMRHDRTi599vWeS2FWM8PxOZKAuHFJ5RwrDEkLbkaL2WQ?=
 =?us-ascii?Q?XoOcpKSY+t5wPvdGTXk9hs3bq9f2QVBbxCuzpWT6IC6a4kO1ma3ocRBagC8O?=
 =?us-ascii?Q?d+jnYFhSwdCUM8S8/NZ+D/P+bNzCfUYM9SOEEt8ekVpIPSd0SjmYH1fFQDWZ?=
 =?us-ascii?Q?W4DfFS+kVOwaJDelevvr4ORR+xOafPfDai73UzZx3/VZN9W81ivs0y5a9bd1?=
 =?us-ascii?Q?xh2vAd0KB7fakUYKLdITwLM0RZaHwjS47HdghWk6Za74DJYk9133+z5GLbLW?=
 =?us-ascii?Q?omCBtWP84sp7/bT0jhf0qEQ+AFbaZboLN/M6hiDyUz7l9qaGMhbtiXQstgCN?=
 =?us-ascii?Q?lXKqli2MLoB34uzjiJD6oa44igpdDouSXn6ECQe85R8khC4s6piooObFrHyH?=
 =?us-ascii?Q?CZiVf/yg/wXDT0f9wULZttolN4tO0/f/R5rs4Qyb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e10211-1317-4510-2e2b-08dde577ba2b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:40:54.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS+MekvNRnJQRUKdx0xbOcIGkJEqzZ7jCphZ5LXuFE65EDrvKZZdHm1Hn1ENGFnoYDuLPBh2L+jsrHbJS1YCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_074058_350831_B6FF6726 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, Aug 27, 2025 at 05:53:48PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
>
> The ISI module on i.MX91 is reused from i.MX93 and implements one channel
> and one camera input which only can be connected to parallel camera input.
> So needn't to select camera source like i.MX93 in gasket ops.
>
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -22,6 +22,7 @@ properties:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
> +      - fsl,imx91-isi
>        - fsl,imx93-isi
>
>    reg:
> @@ -66,7 +67,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - fsl,blk-ctrl
>    - ports
>
>  allOf:
> @@ -77,6 +77,7 @@ allOf:
>              enum:
>                - fsl,imx8mn-isi
>                - fsl,imx8ulp-isi
> +              - fsl,imx91-isi
>                - fsl,imx93-isi
>      then:
>        properties:
> @@ -109,6 +110,16 @@ allOf:
>              - port@0
>              - port@1
>
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx91-isi
> +    then:
> +      required:
> +        - fsl,blk-ctrl
> +
>  additionalProperties: false
>
>  examples:
>
> --
> 2.34.1
>

