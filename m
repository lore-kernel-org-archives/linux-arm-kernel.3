Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B40CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYf9zqAkwe4A/uwWbD1D1D08fPtGbuiKj6p4y3N/f9A=; b=AjjfgoZyOPKinW39h3BrLvg7wH
	hO7qgg/TNeuUefVeWNHyojbUhicmLc0rGPz1LcoJ0OZ5VqjGYzr0Pwk0Vv3aKJBkrYFirgsF3okVP
	DSBcRlgEnLW/f/pvW+BCoFnp1/6XB2qR003bBqdi0BMeRLFfV+i+b56GE/39i09zrbd7vCvcZvYJA
	8rAemHOGyynljJu8TnrqjOg1PzqPciKp/Gwxju8ESI8JHfpJtTcwIMlxbaAL5h8YXeeU/XCVFZF7b
	lkl2E31beUY7FtT8iRJT8N7Chc49jclclkII91fBUzM+PgzUmEHIevAbBdS7RArAN8waSd/oHkBFD
	gb+WFJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqHw-0000000FfrL-013n;
	Wed, 03 Jun 2026 18:26:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqHt-0000000Ffqe-0tz1;
	Wed, 03 Jun 2026 18:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQRwmqSr2UoazxyyXz8vaJVzMLcPHcMxne3tO+9vL0abDoCjP64NUi+31ONl37IssP2hUd/DdD8DYRX1KzUBLeaP2KOiW3uZIB9J1mV1LgtctZSfCWLgnh7HZhHRUY1DlGZAgSnve176w0lRXkxxTxueqEeapxusY7L0HLi4CxTdS+IGw9mvl9Zy9QTxdGJBotcY/+GBNMtOexq1TdPxeJxM6Uesrq8jjW7WPwtUyfjAZZAaeZmIckynFkxlLHWzZkfHL1WAUcAPD01C+jemzp0O3CXyltP7hgs5923R9Ju6p80Kf3s7qUydNk5vQG0BV4fWZWUANHAhz6UiywYHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYf9zqAkwe4A/uwWbD1D1D08fPtGbuiKj6p4y3N/f9A=;
 b=TnJoTGuWFh/8kjd7crlu1V3USJqymzmjVzva4S7tdA3fUEz7odCOAGXD9k20prLaNze4VrrvDoObFpSFLtM7eFU9yju73hlfKlFLx+L/4Fx0dbRNBiO5LHX9/OqrTL1vgNA39CcEVTvQLJkvk6lqPZi+oI8ofkR/nWxQ4IaIfdBVjfys5Vhr4HPye9/cJvTtFgNy7qpvNBd/NMwdRrbDR/aSyhiLstYxmwz/aZdxeq4zMOEDkWhtlLxsFulryDVPYt5LbH8/w+SH2fsbV31c4LpXvSnk11e08Vu246AB7gPL39tHjc8IZz19Nzld7FKz10XcMOtklmiNZVdT9+Ozrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYf9zqAkwe4A/uwWbD1D1D08fPtGbuiKj6p4y3N/f9A=;
 b=OL70jeNRkKBPc5tFBb/jbs4FRGNrBQZ6U842TfBX3fnLmx/TYOPSW4ATOwpiICO+XkEkSMQjbU0X2lZwrsqxA/jU6qShyZWyezlUbxxlG0y0sD1y4ZI5P+YblkjpfHx1vPQ9n3iX/3qtZISFnalEbQKe2oNh2J754wieF+9T4Nx8mF+4r4LFdFh5EsUAj26o5OpMuL7+9pNUJVgowb4ng9bIjR+a5Cw1sySlHZ20uB8yoaBGO5ENxYcO7a7zBpYrWZ47RLkw2t3bAxi3puSeDTjvKIbxuT6eThGNNrylQYmeN2HkdpeJAHSrwUeNW9L+MkZtAW9hIh3jKG8ScZ5ZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMCPR04MB12669.eurprd04.prod.outlook.com (2603:10a6:20b:76f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:25:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:25:52 +0000
Date: Wed, 3 Jun 2026 14:25:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Gu <ustc.gu@gmail.com>, stable@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 1/5] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Message-ID: <aiBxqjm5lsPDXEtW@lizhi-Precision-Tower-5810>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-1-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-1-7afb8f89abc6@nxp.com>
X-ClientProxiedBy: SA0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:130::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMCPR04MB12669:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a824984-e165-49d9-181d-08dec19d8b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|4143699003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: ULK+BLQ1rTPqeg7nCzM3SgafC0qle0ceDcMxhYLOXg+Ihp9196NVg4Bg1Q2DX47LaKyeCcMhgt3aGQ2PddxKmI4PljwXSf5MUsorWc+/PP3Q3wLuOw+yZtU97A4ymKmVS60YlP5CxdDPMTdl9aIgcobYJw57xKDIPcvj5b8ON1pxoFqFIR6MGjL2iqO6XQqXRDstroj+MdBhX20+NaHlxy7DK+DjiB9q2VLKuFm/QOTh01pBFZ6JoORuChwV7PVmdpd33pOFaAhj52yPLxSKwdYpAZr5VEC1SIw43KBxItta+Jfp4CdhdGRfkN6Ni4XxeNfmzeFv9P/GXagkYJvivkeasbJFZWNg2Pz8n1YUri2iaSe10Nbz7tB0/6No57yz5pr8I0ieeUgqIeRRI4T7oUYqwCRDaBn+NbAIhmEJN+iXqE2sA3Avw+3OJ3RJ72QZIReogPsdyFzdeNrmBk5N9ehTiPkfufMU9DKx7F8SOvTzB9GMZUm20ex2FaVcO8v7GDMqFmqcaQHFN3vnrMXTFf0fdELLqZ2nTcNsi9PEElzba1ExTG1DZKFF2YT+n3TG1/9YddpOaJu7eckrSnSsPVHiJjWZ25CeqwxKYnjzN6G8mNob7AIeMgdcAOoc+9pTYaFgjpgmxhvE5Pz42RmmgIZT/D5/g/Rz/jUk+1NDCWNnA1TVHQf6og3Dq4FyZbGmpz9S04LV1G55NhEOWz7uTKY8tRfywVjOoeKaP9hZ0NezNR8Xpl0xsHEoo2Yef/6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJv8cZLQWMYJb7WyIK6xM1/tJbcrnjl8wM1h3me8qmq36ap9dPH6njqjQQig?=
 =?us-ascii?Q?KQfxCXTM5b6J8u/tPdW04Hwczfr25arYn8y7gkLKdDZzCbV9BKZHjoHqqV2M?=
 =?us-ascii?Q?UD8vK7/+UpOYc6gqPF1uKC/aLjyTQSG9mSVzmejhXPjVH+wT/CRzUgojWJxb?=
 =?us-ascii?Q?VwnEGpozETobxxpNQ2G9plB6nfK/VW3wSPfqpJuQh2tIQThrGDvgM1SQZF4A?=
 =?us-ascii?Q?GSzjAewocRuR+oJPBPh3D8T28ypRcpC6mKO3x/ENejjbUe07sWzBIlsq8Z7W?=
 =?us-ascii?Q?53RUik9cg82YprNngvixAcPO+0XJLNSA+p54iYF5CkNi8pqBWq8bDy/1g12Y?=
 =?us-ascii?Q?M++P+nLQmPhPTGqHcWXxNlWszwSJvTFdSSGUJ7CWMv+mVayQncjPWqZMuSgM?=
 =?us-ascii?Q?SXNiohblbBo3hZ9/ZC62DWc7Cft4MC2ATVXmouLzFw+6Ucna9e0IQRs27sYf?=
 =?us-ascii?Q?r+xOR/7+NHObjNDidAaxFB6PEO3xSJP/lP8H3qQz45xKdnpf2h0W8f96k5vk?=
 =?us-ascii?Q?NyYw7auYyvxi/jo9w2aCTipU+0dH0TIycl0rQJchhMh/UNGIsnGgFhoMkfgL?=
 =?us-ascii?Q?TrW9cpcsrasNPmWlIAhpBFhjSZaRo2zFVKR1IVjjoeVchnK7wBKpIhKVE6lz?=
 =?us-ascii?Q?hsAl72uctWhNRiryX1jbSGmihAv6ahTjxTq4psyUwjrbfristFKNA4b71PUc?=
 =?us-ascii?Q?FKAlGTBWkOF9e09UV1p1fPYRriT4yOfdXozewla9cnEKCdXC2v85urVPMC26?=
 =?us-ascii?Q?Ayjeu2iBL5zvfWW94z+efuU7z/kVKYF/SoWiVHj3rRVRiYeVqLcettlx3mvy?=
 =?us-ascii?Q?y/o7u7U9vpJ4APxB0q3SXQrOr8DcduakacwcWXu8ZPF07XuUlyWnm5RPped8?=
 =?us-ascii?Q?RGP6GT5PxPnNlb3OmPRHATD/BBvda96Lyqmiuz9+ScDS8UyYLlSelO/Y0bA+?=
 =?us-ascii?Q?AW0hOtf9hIUqJYI7C8vrGCHeYFWurI4HpXA0p1AHsa5KL7Tz59zeC7olEGm8?=
 =?us-ascii?Q?RgKSYcmW9VnyDjYuwy+iygPKB2jhhD7jIj4IXKDEfTGUmqHtV2QkIlWV84lA?=
 =?us-ascii?Q?5mNy+woyqPnQblhgBRYxLtz7Go+T+shmGR9QvpsqNFfeein9wgO2+DgjWZdw?=
 =?us-ascii?Q?6iBgWlWZgR1Ql83BtJkbLhvO9+++Zk9A1fS521Hh6fbieWLnDYVCGePirCme?=
 =?us-ascii?Q?ukUSfNNa1+2v/5ODJa274LO2D5G9STdyKNCqfcMrieWsONeZuWbsbMatJc+0?=
 =?us-ascii?Q?P7FGjlwCh6QD9omdquMRaGrOBN/zEK3wywx3Vd4U5ZwQkEoAL9mENEiC7c10?=
 =?us-ascii?Q?Y3nKUIsHeXqbeti7WM8XRS+6fI6ciFIznL0HzhnoYk6+yeMnTNmVcwYxCBXB?=
 =?us-ascii?Q?JNpCkOrrUR6CKYbZHyiYML1Rs4pH4WLkEcjdhXiT6pTqY0rRXDLhR673MVx4?=
 =?us-ascii?Q?FRnYJ0cpHDzbKTJZ+xO6XR0uOSZDQ7qACwIAJUScB5AqzWzyUDhInDJiyZpy?=
 =?us-ascii?Q?gSkRmgCpFuUjUlWVS3LhkJHpenuzPyzfg0bY8zoEx4aIo0vx83h4grscgEW3?=
 =?us-ascii?Q?UjoTWSHEVebhDvaD4w3hQoh3xjG1ZfhEuOM9kjI+XeF+GO6v677Mnk7wpqNQ?=
 =?us-ascii?Q?D3Y+lfVdNMlOTkCdsDoC1mAKCmUv+OWO3r/0qZeK4zIHe+PJrsZJ1fAjZfrr?=
 =?us-ascii?Q?CVZsECsIlXgGsRsY4ST/5XyxabV0QHB3uNxxdXag+Ys4SopH+sHW4l8ndvSC?=
 =?us-ascii?Q?LGpMsXORMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a824984-e165-49d9-181d-08dec19d8b7b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:25:52.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQBd2i8Heqls0hkthQaHP8KH0ZjC9nvXrOQx7EdsWDSOvXinu6U1WrCGfJDYswUL81ogv+Rv5l8tMAZXctzdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_112557_401867_D58C3CD6 
X-CRM114-Status: GOOD (  25.84  )
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

On Wed, Jun 03, 2026 at 01:37:14PM +0800, Xu Yang wrote:
> From: Felix Gu <ustc.gu@gmail.com>
>
> If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
> switch leaks because the only cleanup path was in .remove, which
> never runs on probe failure.
>
> Use devm_add_action_or_reset() so the switch is cleaned up on both
> probe failure and driver removal.  The .remove callback and
> imx95_usb_phy_put_tca() are no longer needed.
>
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Xu yang, if you send out patch, need your s-o-b tag

Frank

>
> ---
> Changes in v3:
>  - add R-b tag
>  - cc statble
>  - drop "sw = data" conversion
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..88b804b2c982 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -173,9 +173,9 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
>  	return sw;
>  }
>
> -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +static void tca_blk_put_typec_switch(void *data)
>  {
> -	typec_switch_unregister(sw);
> +	typec_switch_unregister(data);
>  }
>
>  static void tca_blk_orientation_set(struct tca_blk *tca,
> @@ -248,6 +248,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct tca_blk *tca;
> +	int ret;
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	if (!res)
> @@ -266,17 +267,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	tca->orientation = TYPEC_ORIENTATION_NORMAL;
>  	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
>
> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca = imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret = devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, tca->sw);
> +	if (ret)
> +		return ERR_PTR(ret);
>
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }
>
>  static u32 phy_tx_vref_tune_from_property(u32 percent)
> @@ -739,16 +734,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> -static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> -{
> -	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> -
> -	imx95_usb_phy_put_tca(imx_phy);
> -}
> -
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> -	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
>
> --
> 2.34.1
>

