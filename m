Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/u1WPi+N8qxUGERiF9DGe1utbzEb0Znb4/E4Lz+qUk=; b=PMGwknLigoGcL+XkJzop+83pMj
	VmTbqaQ4bN+BApC4trr7YwbO59OlwMN8Y4E0HWQUSUM/npFn5xBWGOdPZDyXw98TfZXRntMWQMevF
	69un1L6b/41fBJhukmCPPfJHD1hbvH2E6SEgFJ9M+HPfeBLosgeYCvTOZxqEGpMLYQNUk/hr6w1KB
	989jR6BWyYxLvXQA0dHgRb+2D7luuCWV3MTVdajdbXM2PZaVvxAnC9vRzvpK367u5Z7X5pcSIdEfB
	DvxdQG5SFbQgKx5FEjljTHZeICZB4+MiwqABh9SO7alm8dlIF9yrWTUH6taXMgoR4fmgy1aTe9JL8
	9icaCt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDQP-0000000Eyl7-1cSQ;
	Mon, 29 Jun 2026 14:57:29 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDQN-0000000EykL-3G8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq9nbpe7hRcMFdh8EkUoC/FHAZ7fuW5yNdiT79N7QEVwK4fBU8JG7Tzm/R3C1JM0EYuiMwSRLHL0eO0lB/b9ZM/s+dD9MSUdip7h+96lW/1LC6Jds3saUQZ9GLjZBf06aeAmpwADQzD5jhjPKbVpRSBdZ2qZbv0blW58C45VFTAafzHyrviZfGmHQIYNBlGrkqCcJDm4ycsCTa8dfuoqgrGoGRXi9nfKFgSrO5n3fpA6p0SxQD6ojPQBCT84NLmch4TK2F3IF/XeeVd+pwwgow1+eAGtNRWeH4PB4YYaVtND18OnN6ciM66o+1Z/ziqmxn3R9Ovuf598qewx+J3tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/u1WPi+N8qxUGERiF9DGe1utbzEb0Znb4/E4Lz+qUk=;
 b=ryE1Uy7PljkBZxctH8ILZjUfshYS+IolEXd2esPjSnVQ4rH8L7lUeJygcvWQwDFNW1TI+waX1zprrqvTeqaM2L19D7z9n6UIB/QqhDTFWhDdpWjaAP+oikSGtHmKU+2Q3CZhBC5PcqEUUS1E2SKpbjvDR1ZHw+2wrEeCLHyFTb8Adklu1+Rd6qqduLtxI7dWD3xfpkWn33ItL8oPYBHjzec65AxNFkLR2j1BBVjV5oOR3Udbb4sIoFbBAXPdomYpuqZKWRHN/bj/fJeF7fbXs5iSYX/TAYv5Kyhh7LouYFDw6NV+UBMhw4mjMYWfEPPlTflwQWfcnogVpepTob9lUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/u1WPi+N8qxUGERiF9DGe1utbzEb0Znb4/E4Lz+qUk=;
 b=FhjaGmCxYZLit0VP9n9d1BYYvZvATx9l/JbQhL2THaVf1dSmvfUwCJw+/H+MCKHu9IYmLHR+mltGpqCZkF0xET7ZeZNoiFDMw7tI+9EdvWEb8tS7MXfOiz6U3rby1FX/u54RnFWWZf6XmJSyricFH05BIAF3seukIwGLgMbzljWXTGCbxpRLH+4c2RSpME0W6q7Vgzr5eYa4ojTZAp9ZnL8uwP/6JHnr94oqGLjrudjtBXUpyBECB9ueKj3/nTN09rMSNLH6/BtOfhffPzUQ3JaGFxPQN8inZRcnkL5ghnc6UeSHmYs+pLkaM/KmCh9gvA3klk4WWFwVwKGJc8wJKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:57:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:57:23 +0000
Date: Mon, 29 Jun 2026 09:57:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH 3/5] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Message-ID: <akKHyBl-Ejo41KXW@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0112.namprd11.prod.outlook.com
 (2603:10b6:806:d1::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: c833623d-4036-45be-f43b-08ded5eeba1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|7416014|3023799007|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: cgE43DdbqFSnps5/B1KnA+jVN421K6Q1t8+zghcweyO/Mpkq7qQgzqcV0hT7Oo4N9u3sWz1egKohpszOlfeH2VB1jOy3xZP9EDPeqVFZCzjnmvEsmmaTXFVxzG7dyCSt1JiWB6YzKIdICw6dNmKkjcZsxyh7g7xwbUeSRU1AgX8HMNeTKbXBqhpkGVtjipRIWx7j3GufCph/dv327Uw4bw5YDu6Z2L1Akex5mnoEE4XNGMLhGwDZGX4vHCn0x0DkpRjWCP7o3ER3fGU7qPwDexs4o4WDtghK83+kiLpRWPVNeFB73MD55SnJ3yXTChiISkgZLVAI/wb7GPAyjp/OuDnC2MB5UJv0GGwQ+Ugww5NX7b7IFUotvSTc6JSbnLcZCNoX9qO3vfJ55SMLuovstf2B1vHIJbh1UnVIF/WSq4OFgCxDsHEdFyfYc/x1tTjfO9DQ7/YVe9pf6YQ2WqoLma0SsYEg/YVtkGvigPeiRZ3elJknAbTns6RBLzhb9sJEVM/2UR2zCzIEPlVHezi+mg5uvhs2diIVLH7zFjIFDGZPOp6INtd0fWRZWvlqKSOJXl7H2xEo5QpapNMqE76tf7anfBsizxIPnbGFw5WvoMyGVFtKR8YjqYnDGtMaDPHsOTXjd0YFgDFdkwhgvmGHPDf7CgWBWWFg916cA8g/udA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(7416014)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qSJWsN9Ko+mK/OywH6cEjwROpXDK1NS5O0QDx9n+8tpooY1BiXQeGcxS8Jit?=
 =?us-ascii?Q?X/h9LSexUDJPw4nF9nNg2vuuU/aHe1Z4JwRlQ7KYNkOkLnJ8SqFp2laRjU4z?=
 =?us-ascii?Q?3LbWoLAA8jqmg2Vg8alyE8ABAPVLymnUdJXmxmd9FGzhhfDP/HhYvPU9Rise?=
 =?us-ascii?Q?GNvFl4eNXetoA5dURhkZz0+QeneoDFINpsV3uI2W9H3oWeAHlL+v8tsvaoz4?=
 =?us-ascii?Q?x5cAD9H9dUVBjCjA91cvdlzehT3mMVeWD3hdqvYqvFMWKYEJR2nm91uv5JY6?=
 =?us-ascii?Q?UAE8U/LtFBa+67cmIz5LWiJBYzPLdiyNGrexbeJYUPRLVfZIpCs8hMEKAsvY?=
 =?us-ascii?Q?EUekUjlZMTVxmrGkyE6XGBSvwtXfODj4H1Bsbz7Cp7Qo+zKPy0bsd9J9j7PA?=
 =?us-ascii?Q?SfZylliY93BW2e2BkzI+nZRGKfvHBmJKznBPKb2+Pk93zbtVvqdJZ1XMg26j?=
 =?us-ascii?Q?UEfIabEDDJ9D1cgW+GmEw0lGNDtdcEb8GnCbgMXJOFqRxfDF3CaYVpBnO9ZH?=
 =?us-ascii?Q?b+2Tr/PGQjL2xF7cNHkHV1S4Rl0m0cp1TYYpP20ashJnKyk9rOi0xdplraCx?=
 =?us-ascii?Q?3HOo0cmh7XBDRZCJms/0u4Bd7uSWZ6sunqRdF+9IrhHKN5qiwNT8/bk8bbST?=
 =?us-ascii?Q?S7sxyfvZ2LnQZXBHZrCMhw410G2ig6lXz6JZvlkobD/eHtddAVb9to4dI1qm?=
 =?us-ascii?Q?Xn7Q6MGszieqQUkonMtXb/kunmEtBkJyRdHgnPzCz1NHbmV/tZQ8/NlrnpsP?=
 =?us-ascii?Q?XpmsF9ZxqGHf6QgAYgyJXJ3tr7KC03+MWx7C6QcHLrXK3agSKW9L9k2kuMQK?=
 =?us-ascii?Q?M2n+f3qtUWiNd1U8lHT8o2FlMPpiiEe2HY6uQJFic5iS21rDvUO3Li0pmnvA?=
 =?us-ascii?Q?gBsdpqhAAK8otKIGVZ5REqzWeE7XxMZjLyZ/qIJB3Be4YbF1XPNclqnZFsaB?=
 =?us-ascii?Q?VS0L7WvtGqf3481TXUmIVbNj+WMfE+4irse693/oKCLGXW6ImahSY6nsBDPw?=
 =?us-ascii?Q?0LYz1j550XvciBZaQhZ5MTYcjeWgYtDuSk/CE4EmjoIixpThdOYTkCSq4h2o?=
 =?us-ascii?Q?xQwer+aqoUTxbbsHO2ViW4D5ZGkC+pMgo/JnrLRh+lcmj6tIkfZTTjL8YkHe?=
 =?us-ascii?Q?37vbllqmL9vWQ/fXN6ThlwTYRi5IIl9Hkq3zqeh6Ca92Pjdu8bvJZQ6RNRWn?=
 =?us-ascii?Q?lzsYlOKU80ndylcZjuHKRcqoqIWoitOhJHcEU1PHgIiauay95X0yRL8mLr2X?=
 =?us-ascii?Q?2M4Cmp8WCXa39cziDHR2SiuObDKTz/8p4+nEv9Hpz6iQnT1XKt7v0jZqrvwT?=
 =?us-ascii?Q?j6425C8g/ckA+eiOany/sVb5sdZHWqNZfr6kYL7sbiCg+o4SXFlan4avEyHi?=
 =?us-ascii?Q?a88xbe5HgF24lDPX8UqRSWhNJQFh8/5QosJqgbqRjN6qXpHqCa72T1ghljt+?=
 =?us-ascii?Q?xynyAZppb/e4TaVmtc85Dxyp4vmtgOPzXp4N7BTHztmF7CfQfETUgpvL5PXV?=
 =?us-ascii?Q?ENx7zyVGvISe1QawCFcWsJjdw6vorUIn6g0GWG9ef1tPsXOS50sYRer3eZLY?=
 =?us-ascii?Q?157ycazFNQN+W7NXgNhB1e7Zc2WRgtpd7nC0tf4RKN+CHi9GnU4SfwGjVdhg?=
 =?us-ascii?Q?bQfRcAxeLXRIzuzahBxktTNqGTljTj3VojF355rAh1XNDDHJPX+6YfGTES/r?=
 =?us-ascii?Q?Op0fnmlzfbLsL4JGRienVRj51xX9yrAli4Y5Oi08JZapJ6DMnP2KhV1UaKZo?=
 =?us-ascii?Q?ETECj4a5fC+IO2bj/TKegVLuo6VE2Hz/6OoLQpGoY6b6vl4mVA3h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c833623d-4036-45be-f43b-08ded5eeba1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:57:23.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDotvgrI6TMCLoqsQaio8Pak7ZG5XM6tsoppjt99Y3l1T+bwuMaxVHcIK++6aNRAwK8tz1iCU+6XdcaYKrqUW9+TRo+tOfqvYFACmBJ0NgrtzTkA/l2yGfeJLE898xyv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075727_819942_C6EB9D7F 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Jun 29, 2026 at 03:44:57PM +0800, guoniu.zhou@oss.nxp.com wrote:
>
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
>
> These formats are commonly used by high-end image sensors that output
> 16-bit raw data, enabling the ISI to process and capture full dynamic
> range from such sensors.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 2d0843c86534..e58925d71164 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
>  				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index fe4adfa3a1f0..5eb448f4c26f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SBGGR16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGBRG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGRBG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SRGGB16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
>
> --
> 2.34.1
>
>

