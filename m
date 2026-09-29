Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CB9C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oap7eKQ95sy7zk/boZb85vs2CX21w+UkL/wJJ4vzxoE=; b=UNl7H5R+AXT4nTwNkoHykEe2pn
	JCdocWrb+BMUYTmjKFdA1ij3xqIHYNv51yZDw8zhX9kd6e9LC6UGrxcblHiRJfmKSmpE7CkzAFkyR
	L0ZYD0Sbm2JSomfE4IB8Lse7axQu5mXwbP3ni7S+qLWMB2RFrz8LDe2ATFxoXr/xL183EjFkf7DYW
	a5KIA7jge9KOiR8brdgsaK42gLS9eLPvGWIQ1Y/WW+zksWyGRpdCVZP4Sw/u0KrMLVjHUS3oXuNkB
	IjAO83bY7uF1fjdu1HYfGHu23cye+a+oQMzRDMup8YGpDASkUE/Yxi8y0iRs1rKl+nCd9qfwmN6eT
	4TgmQY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYkD-00000003mHD-214r;
	Tue, 29 Sep 2026 14:23:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYkB-00000003mGw-2zCY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Oap7eKQ95sy7zk/boZb85vs2CX21w+UkL/wJJ4vzxoE=; b=D18xkXHQg1vFKXOkoucr3SpzFB
	0PQY8e3LgNGKDQ30eKsUSmBeGJNYBKEo0BmvwfXjLY7No7NZIdj6I2W7/3yB55/UbbHXAFbWLppwA
	cKKoy4avs2id8DuVyKbzHo5EmqFQFI/LIz0iD/FbxJqi0RDKQoyGBEgDKrHIShvP8yZB+nv9G6Dwm
	B6qpEFPeRPpiQ7utUL2VHAzydFvwfEhKhcOP5HJRrakN5H2h+Klq1KLT/sV6Uirsfsm8PBIMcjq+R
	BeN2MaptZs13zNlJnFYMOv3yH6o0dTyvJCq1ktb94D0rtcKyRm1oftweNjRpjqXAFayN9a6SjIPwM
	pMJYAvwQ==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYk7-00000002jVV-2tOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsJPeEVz0pUa7OkoTSDCqUXBcIPTwsxXYl5/rQFwbaxCzDNjm90oDJSiSnaMMb+qx6nSHkTeHLBtrhYTW//OyfF1jg5dP2JfWbLJsAv/f3yhZ9gJPmzDGtmyXL/ofT2VwPpwtQWuWvY2luBv/WurOtU5rQOrWE+llKwoPVByCibGzk4o+F3Ff0cBsPsjJCaDJvtrNGWcP1T5v7gfnxRdxluHFgxLLLXuSBL1QmZFrFaI/Dk5Z9tBmDf3zdTfeOD25yFDRoLokucckS3xCFv/EOpoUiBv7X07UF5L5uDisurm5K3U68ravss8ff3NVz+MHgcA/FRLHzOyhSNq2em3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oap7eKQ95sy7zk/boZb85vs2CX21w+UkL/wJJ4vzxoE=;
 b=OVZ0UinHLMowHv7KejVZwNWmE3I4HhC0cehiT99cxWd62JckELFM2RH2p+XrmBraFGSfF0LUoqNFUTNURgOczylHkwBVPWohrXNan5E3q0ynkeXoCETMFQFb9uJi4KrVD6r7QxishpasYxn1Jjb6/7OIV0rW7/0mydd/LCUGFxKfvgNzKPrnljauvfIxy20pzMnzEdyUyN4fDrY1QOg/w8MsPbPjlVlZs7RmvTLf6wFi1q9U3S+7ZsgYY00efXO+VjPmBhATTx04pqae7nipDvktBg3gpT5rQu5SZ0Gb7PDGz5Txl3mnM4Ks5V73v2ifQ2v4aBv6hB24q+sLpDs9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oap7eKQ95sy7zk/boZb85vs2CX21w+UkL/wJJ4vzxoE=;
 b=gV2i0vGDr+uVAQXrW0IzwyDZPL45kkfhp5QegvkQ0f0iXCwHt4tSoEVgtBvM8SiXIV2OrZSHNqDYH+r5YkU+tlQ9fzo2AwV45sWeGEfLalEf/sawX3yi98LxMUCo86FiDmmserUv9IeTOdkGuJU8IRfTe7KQY5aWaAzQchzc4k2v350atxxR4BU8xC7qXHDrucUzwocctlp66W0CFTgW+orZMGJ+dJaXIlJZLCe9+A7y8+FC7yX1CGPuecDeV9bZ/u6BfmEXHot+Z8Ijk6DiiF4Uniha2iXKNSWts3fyvLtfqA126pjQsA9OGbgfx8WCTTEvgnj7ZiJih3vIa2qZlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7120.eurprd04.prod.outlook.com (2603:10a6:800:124::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:23:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:23:34 +0000
Date: Tue, 29 Sep 2026 09:23:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/11] media: imx8-isi: Reuse mxc_isi_format_enum() in
 capture format enumeration
Message-ID: <arvJ3ZG7VWcC6XIp@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:510:324::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e69a3e5-332b-4c23-d88e-08df1e353ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wiobZD9LNZLVL+9As3vA+hRiA2+yMKJkeTC1n3EEyYdv2t5pib0L8qHuPCB1qm9zeYxFRt+7xoGpyeGTAjubnO7PAZvVYxvfw1OrUHWVtwvBXZO8L3/vNDWw2hc7NWgGJd341cGNaw0S/UVTr/Zt9HnaE0O7prmuh1tfVwHJLTGoLm2Csr2Yy/sThdTVIco55voXzAvHN2H6ckfDVbOppSkkbsrdRWvL4Oy4x8sIyd8CW7Jj0BGtqdHXlfxOROowpAHOQHgKfl+Uvgnx/utJeaAJBl7ZhWwce4nN9Up/fYjfqqfmwp4BDyPsE20eKhwyPb7orz60xd8O3LPJVypa04Vnrnn/mKxuneXh10bjLyoG6xwqN7i1/+RgnUkrT9P4g3ZTxJ5sx3d+MN+fSE2Aki7Ta3c8bIbPd4M7jzXdgwg+kgVxhyi2UjGC3YVUOYtaKgUmj6aMQEaRafFtWYljAa9VQbGxqS3X3yHEy0ZDKbNJ2HhZQwKU0C2RUCv6bpVCRn1srLAbcEna/4+buyVkApV1ybsB5pIYp9HJvBJcJeUwBaYTy/gqfhqIFJLaQw7YBVHg4wO8ll4iQaqSQ8/z0kCanjLLYYqVYTAG/bhyJRjRx3d+YQvOh//W3G9hC8hB08cJfT2wfI/E0SbjL6rRY/IoQeTvJjd1rbILS/wy0HQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pm5SJlVlOt+HVo/p5xUlHpt6clo2Pa+RWjmok1x3wdAAxb1ytYSpaGF+gP8x?=
 =?us-ascii?Q?1n4FLvqT9stUIXViEhebE5Vxbuzyjd1PCbk6tN7u1p0n+t2ltlIgZnP+diWn?=
 =?us-ascii?Q?51aDgJ6RxhiLmTgCje2c7QOR8jUVia5oMzDDfXda5hPkK9XJ5YyHqsq2msPj?=
 =?us-ascii?Q?204XTXARlKNd8+ANyf2K8rveS07wqrNPdHb7D6obu80HH0cC5N9vFQH6c8Xz?=
 =?us-ascii?Q?YtjqPai4gnWakvvSqAuHxPQtYxtXdewNDHmehWttl/eY/9LdWl0DAxCyIm06?=
 =?us-ascii?Q?VtmO6Qa3yOXBvoSOEW6ngZgVHqn2PvGX8jtZJ5l/pA6ASZmtuADqr6+daWq+?=
 =?us-ascii?Q?SNwUJK4W5EaEXXOAYJVeMCbnzfuOPLbQ2j+EOMQlRPWab3c5tCeETkompIkW?=
 =?us-ascii?Q?yRGhCrF4exr2Qywf5QxGyfqraTklsfSpbbb7xpkz+mC7PqgNL7gP3KJmc54r?=
 =?us-ascii?Q?QAEQJ4+INAD99wTopTC42WZBT2U7tunx5VULdW4nlRArrONhjoH9LKzzfhwn?=
 =?us-ascii?Q?027oySI2UZaOpqn5igqCSvDDE14pRlhcVcsfXJmvpUmREr0Q5vq5BZvbayGs?=
 =?us-ascii?Q?A5tXznqXR984KxLtbYHJ5HsEv2h3F4sN3wmmxtheysbC2wNk+8ujJ5UK1Peu?=
 =?us-ascii?Q?219cGmTE5nennUUnh2jV5yuRGHOXgW+/IcutYLlZFs1SgYNCPCbh1oNqJ65W?=
 =?us-ascii?Q?DrbczohbPCZzz+uYvGwQlXJEWgo6mi2FNq4ji3umS5vN3rLOG53ECev8znB8?=
 =?us-ascii?Q?V79oaNatuobzZr9WbHnTMxpDr4D5ARxCEx72eiC+DqjNh2uXeqG97JEQylxY?=
 =?us-ascii?Q?Y6pzcuHFkDC6fNpOpnKkiY1cs5dTidf1PJBfeBGLbcQBycmkn+jcgZ9ppQfg?=
 =?us-ascii?Q?Vi5AVwD2i5685cQHIA4w2jxFC2wx6HQIAdNeIbsMUeUNrmyd5RlPG8lR1EjP?=
 =?us-ascii?Q?HZjPNMx5HVl8ikCJDafv70UPEyVPDIRBNW8pfexZ9/QCFMm/eaSvl/kXyiAS?=
 =?us-ascii?Q?e7DX5LGBYxgcc34+1HpNWQUl9n3S1Qbz0Mr+LYks/lBei5boA/kPu1r20Xxe?=
 =?us-ascii?Q?ov2T8GlQp6jdg8ywBQk3GnoHc2To0f+NGSxg8WMtibyd38SChHGnCLof73iI?=
 =?us-ascii?Q?tXBbnynHAYtvoNexzbRfmQO5TEy/ZeY9LXsLsvUcDTqHiuiN0qd3Sd9O+Ku/?=
 =?us-ascii?Q?fRc6Y/Gv2QAsOwHGI+xWzK8Fj8DOzDr9URO6XlC3c+305g1p+b9pt9a+ZwHA?=
 =?us-ascii?Q?zEh9973Lrl+4LGTgE3iSTklLV3lcPUqlLIFl0q+91wmDV0PH27B+FSlBx+QG?=
 =?us-ascii?Q?gAMPE0Xh89sSq8s3IuEHfuNJESlKxCdkCQeYZhLm/X74hVXU11P57K2zPsmP?=
 =?us-ascii?Q?o8smXLKDCXCymG7RDgfLo0twzn+h7e3IRUFpKRsGjzQwbf+sejaJTrVQTXM/?=
 =?us-ascii?Q?GlYm1vKC4vyb/MDwUmB38reQl56ZlB1ZMTRrGk/eaD+AIir8gJEJZgoLsyal?=
 =?us-ascii?Q?UoIRFpM56xFp3i5Zzc5G1S0/7YZzwbgAjLaC98y6WPEgUvLdTcnHqlwU0M5r?=
 =?us-ascii?Q?zwHRemZ9ye3oZjEgr4bdZq3qNtu9lmjQ8UmnslJwjzQvTPGXQXfwG0oNRmDV?=
 =?us-ascii?Q?ODmfjnAE9ArQ8HCHrRJBjqtvKl+3otkFOzT7Oo7CILBvwlOdSTTCz9ruwF7V?=
 =?us-ascii?Q?dL0eNHq3s1KU/h2FnBNC3oa7EtaVs4/Q2Q2s49R+1g7ZEnJKRKNR1+ac//lX?=
 =?us-ascii?Q?foAu2X16mGBPDwdOJUZ1aEY0PPg0gD5Kebobk2n3/qz/D7h9LUnx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e69a3e5-332b-4c23-d88e-08df1e353ec3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:23:34.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYlJ3buCMxA6buFv/1zd8cfK9Aa7M/HOJFMVXNTBxyx6W7lcocnYTufLfzSSPuoLNmlTY0iDzl+q2SDnbWQYYTziRYg/qFV7eI0kT7Ov1C8nDnyOf3I74DUEdVbPPU5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_152339_900570_5357DDD2 
X-CRM114-Status: GOOD (  23.25  )
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

On Tue, Sep 29, 2026 at 04:52:25PM +0800, Guoniu Zhou wrote:
> Simplify mxc_isi_video_enum_fmt() by reusing mxc_isi_format_enum()
> instead of open-coding the same format table traversal.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - New patch
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 +++-------------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 0d87a1082727..21849af3121b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1231,34 +1231,10 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
>  				  struct v4l2_fmtdesc *f)
>  {
>  	const struct mxc_isi_format_info *fmt;
> -	unsigned int index = f->index;
> -	unsigned int i;
> -
> -	if (f->mbus_code) {
> -		/*
> -		 * If a media bus code is specified, only enumerate formats
> -		 * compatible with it.
> -		 */
> -		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
> -			fmt = &mxc_isi_formats[i];
> -			if (fmt->mbus_code != f->mbus_code)
> -				continue;
> -
> -			if (index == 0)
> -				break;
> -
> -			index--;
> -		}
>
> -		if (i == ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -	} else {
> -		/* Otherwise, enumerate all formatS. */
> -		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -
> -		fmt = &mxc_isi_formats[f->index];
> -	}
> +	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
> +	if (!fmt)
> +		return -EINVAL;
>
>  	f->pixelformat = fmt->fourcc;
>  	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC
>
> --
> 2.34.1
>
>

