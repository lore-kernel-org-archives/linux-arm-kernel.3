Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E77C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjdLvqTYMdmq6YJjDVV1MuSty97ibwW8lRLkoP2T1lA=; b=eFYwx/XQqvfTpI3gAKGh+zOgzQ
	aHNlenbo+uhqjedkKyfPWojRx0owu+iGNHfsG9vOl8gTnEgyosCdDCzWE/0bd6nv3dSCnwXMqYl2M
	1DMfh9NgDuR2P03+XuKt/AOIr6nypgbvKLIQCK0Ry3xZGPK+serX2Wbo3c8S3lk3Vg+x7v3bcdnNO
	RysYmyTiZhLKS8H9NCGPPWd6M8ne2avk71yNYEmRDxNjt74dov4HMQpl81ofTWEvD/KO8BDRFROjC
	o5CM/PN0SIPgYQ9ZzSrawX3roFRWsFOBQdGumZHRtzenRCcrFasdZTB4YsBNCILOPwLj3UwIZnYfV
	X8dbQWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1X5-0000000FJZP-3dDt;
	Wed, 15 Jul 2026 15:28:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1X3-0000000FJY5-0h3I;
	Wed, 15 Jul 2026 15:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAVEIJPzZE8VCPQWL9rfZbfWE6PztFLwcaLtxPGev7VR9CxPEtovKlxIYnRokfELHDKrZ4QEi6SHJ+PvNzhk+aik5E8uo4/kLP+fjR3wtl3LW9o3BnBrcsTOqQvKM/iNMB1Dtfci8s1tu1Zw1X4sRGaH/yVyDCJVWWw+lotupKA177W821Rbl3yawxruqbAjNFivjwLyELgKBPPZbLn5pq0uR3RwC/CwFRoKYWsFgph0hSpKi2NohPYxruNJwbN2AniIjgaZM179/fBDozFi2HyGUmB975z/1dKL7cmpbqz5mCebJTjJmYWFhJ94mIMaNXGLtMuh5yc98UtRiuWvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjdLvqTYMdmq6YJjDVV1MuSty97ibwW8lRLkoP2T1lA=;
 b=K9ypest28sGQCjI8VTdeceSHJPEvkDGBl1cSZmXqNCSskD774u2m+27c57sGv/nQRHHUnm+D6ZqBaRN+6j9Uh/GEl+8qb84xD7/swAfUgr5tf73mwajtTldJymdVsFLrNn9dh4WaT2Dl12bF1IGYbD8eBzi77uGX/wip/kJU7z0ThHq8QaupvWCXRxvQt40SqBmQ7Lol/4vvyiSey78CwOxZR7Hm4jgambZnzpzkAg4zy4lhxm4E1MGSKNowkvmEomG2bUvokOJkcey49xljJUGsHZd4ST9k7AOK1NfMrKUKahBfZlUamQ2jGjA+CTJs+7W0NtCSESCZdob7suXExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjdLvqTYMdmq6YJjDVV1MuSty97ibwW8lRLkoP2T1lA=;
 b=GZG0m6CuQ0J72tr/A7eDiiiFWyJdQWeczx64g8bp2Nje999vuSn9T9Xqf6o0idYACke1vVXdGUkWrOqbIhbiZJCIybZjf++204nfAon+ZrvEg+bC8nEAWyOeXS6sZXs8M/HYhmGrH8c6eOyBXLTdO+PnY7Dwrdc2RH76xIOaueeyB/1p6XMcK0yB0gWr0TTew9lKyJIdFc96/X5QSACAC6sSII9eokgQauOpzuyANBiPwnR70z01G2qyBE3AYDeGUhK8zB3aTs91Haa+0RxCVmamaWtMfE8vyTLHgqsXUDxf9b80hQqrc1LT/weON7HLKC0KnaJ2n03iavEv36BERw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10496.eurprd04.prod.outlook.com (2603:10a6:800:21a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:28:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:28:15 +0000
Date: Wed, 15 Jul 2026 10:28:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <alenBaMOTSPo7DJV@SMW015318>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
X-ClientProxiedBy: SN7PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:806:122::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10496:EE_
X-MS-Office365-Filtering-Correlation-Id: 9266854c-0fc1-47a6-b1e5-08dee285b038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|3023799007|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Cn/4EyZQyqV7AP2dKaRLv3kbwhq/L8gFRAbDsTDvum74SgDBG/WA/00fUaHEP8w40pUNPsRHtcNvSMx+9WcsXW74VVcrwQpAZVW7KbmBeDyvZs7bccmfP3uux2HG9RJDRjXmy5X0ct+FAelMBSYnbUu/BF3sTBXmCxAiIcfjE6jgBI8Y4gojGkpiyjCWdGDqi4+/xbkq4ehK2+nA4rq5UXcyd7TCeDPYl86G5NZ7AwcWX5iA6QsNYPXGvi89QxNfevnypYbbs7NvBTG28n3OM9zBe4FjAnMdqbztHdDHmnv3dBaR6MH5NHKaQOPOCvvRBu2mCptk+2q2r+fXi2Ge8w7LxS6OF6z04nNwurrYeXIflJ1XA2sA0j3ldHoLc8Xt7A21sjL/v4Fs5G7JchPRu/Haekm6GNtZl6OVXDam6iVjVAh6ymRq3ZHtbxIvVFCViLkSt6ne0O3nw12SROqsS8xK4o0J5tUWHoRtYBJsnkqiwcLY4GSbnLGyKybWADR4/rew7f4Xb1/HcfxmpadmTN/fkBltF8xs4GPCY+bUzDpRtWZrMDju/kzE84lBj/1/QT6rSrfpKtoupArbFTQ8GR6zgDo8tYWE8Te7/Tt8z+uc7Nt4+/1ghL1iu9KdXpubHinPsNrHJSC1tAaXKaz2AAziYnaO3tQp11IU2/HhmiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(3023799007)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIO8OeSRU0vNLDdqOy4GYiO/QCq25CiaCIyaDd8JaDxB+bPilzI4q3Wj345g?=
 =?us-ascii?Q?kfwpsHdZ5ynRxx45UiouX1hdC4rfJlRh4r3sZauT0PyAYexpY1ahQqXiPat0?=
 =?us-ascii?Q?M2g59Oyzf2rebku/V78z87dXOcGm9L1gVWt+iMKccIHjpATYTW9xhFBlGE41?=
 =?us-ascii?Q?o64ww5gz5qk8UCo55wBpmJtlMd00QwSD2AOg6l62VQsVBixPIyu9yjDUxbAW?=
 =?us-ascii?Q?S3SurOQKz0qi8b1vP07EREhudF1SVfX47rM+4bL/siow0ojMZIiCVQ91N3nw?=
 =?us-ascii?Q?xHfa6SATHtJCjhJbeUoRGoG9/CSySFrS0HfwmQrOldn3Jarvxkm3iW4ykpG7?=
 =?us-ascii?Q?nC7N16+EiznuontFG//WLgxpQPsJVMWkIOPqVUOLeaXOOE7B6hWU3MeqsTdB?=
 =?us-ascii?Q?IeJ2u4bRwzEFyVCAMmPW3PguPxHkGO9VOktbtXh+b4MO4DPrtyryB7S4mptM?=
 =?us-ascii?Q?pxJJa5XX6GJCt+k3rK5+l51RZmrtwx9wyUCMhK45VhAzAOPwKNfaeK47RUVp?=
 =?us-ascii?Q?IC3qRkRIKz/3grQhpisPkYaOhEeNT7rEkG53njISzOZGEhKtmoRbk4Fxc9+0?=
 =?us-ascii?Q?0KRzc2xBAtKjXDh/k68eFd6haEeyngpwGGq8gSMMej14AEwuvqdGhFAyEBmI?=
 =?us-ascii?Q?FlLFJWVv1e7ODAOdURV+0TnH7yL6PIeCJcdxC5Xz6P8v15IPJRGupVV/PCen?=
 =?us-ascii?Q?/HSTlvhHYXIFViPxoyiS7A/HlJAuZh03NLQ6tPlyY2ThcaKg1OArKiyVuSJ3?=
 =?us-ascii?Q?fGdtaezzAbjre4N2B4Zx2eb1e0kRR1okpS3H1oGibvjFcyuauoiC2PrAP2h4?=
 =?us-ascii?Q?ncngKAfYhxR6m78iO9YHGYwysZPsAgjSdp8yX4GyzW5i1zdGkJLjhVo4dT5/?=
 =?us-ascii?Q?SNacVUfbGrWRsHnk6OnErLe47vAUumevRuOCrCySMqhN6LiWQI2JcP++3Ha1?=
 =?us-ascii?Q?5sEsvWRU752MDFe+7BDHNC5GvVtRu2rUgpXUqUCf2AdFkni1Y39ECH+8gyLA?=
 =?us-ascii?Q?MNTXwOh7SUjwB0iQvs0NQEBOhZYHUpSMvHLm1B1FH6V+MHOtrwizmcVEyjJQ?=
 =?us-ascii?Q?oBP7p0/QQk0oZ3JJVJM6glxCpnUtqHKYP3aRpUOWS4hVjVLR1VWCprBRk2ND?=
 =?us-ascii?Q?9pBA3UDW2QyFi4a7nolVJYG2ZNj4OLKpTWeE4PwTiCogZ2hOthqcvV02ku6N?=
 =?us-ascii?Q?6MwloVDqVzxkDUesvOtzJgtPhamp8jvzuSQs/oIkVLkQwoc3AtlwD4Y6Uu1L?=
 =?us-ascii?Q?YG+107Gf4dp6qqJtVqNO+Huc6W4WPNXJWkIsgGXH728Acwrozbw5qWUR/1EG?=
 =?us-ascii?Q?xJEoI5nk5/j70T5Q+uP57Lg2n64z16gLkarli5aazRikVOmhvUvNcKRdjrVu?=
 =?us-ascii?Q?qviigbPOjM2RXQXx7kaZ5ry35CjF0Vpv2x3Gr6quCUeYm5EG2t0Mih3dPLib?=
 =?us-ascii?Q?8RVJLoOWhgTW7TEDZwBoCHWrru+yPFrGjGsI3KvBZqxGZR/s9sLXHc7TSV+n?=
 =?us-ascii?Q?h2nGQu0XWd6iZAhYCwWymot1r04vNgMPyPAMfRNj9Jb5FANyhHum4hWbMStL?=
 =?us-ascii?Q?bakIzN57c1k9dpk1ye8rhOiDgyKi4mAILhBb4u1bXPhNGbU5WHcthsyWkoHD?=
 =?us-ascii?Q?S/bDGaiJVprj3vB57PhypdeEqPndQv83CxDZYXAu/E5/rGdZIz6dgtqRco4Z?=
 =?us-ascii?Q?fBVyzbukSQ8tNdzaW7tp/jxSCryjH0i+mb0kEe9N/bCM6o1bpRHl8LDsxBvv?=
 =?us-ascii?Q?yBCox/mdRwAi8+BUNfL0lQbW2q4tkL0srq1/tjyys3PRbQrrCLpJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9266854c-0fc1-47a6-b1e5-08dee285b038
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:28:15.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfQ3X5PUh2AL1imZ3tdn0LAZtlydxBUNnvtkJ/QksJDaPK2KGebrqcA/UL3Iyb4LLmd9eZ2gaw9WnMuuqhBPDYXaSA4FIFFgdJz74tjcOc8cInmgkF16HoXxZ+qWGL0o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10496
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_082821_208762_800E9C54 
X-CRM114-Status: GOOD (  27.96  )
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

On Wed, Jul 15, 2026 at 07:33:58PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Add runtime PM to ensure the PHY is properly powered and clocked during
> register access, preventing potential system hangs.
>
> It guards register access in the following scenarios:
> - PHY operations: init() and power_on/off() callbacks are guarded by
>   phy core
> - Type-C orientation switching when PHY/Controller are suspended which
>   needs explicitly care
> - Future PHY control port register regmap debugfs access
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v6:
>  - use devm_pm_runtime_enable() to disable runtime PM when probe fails
>  - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
> Changes in v5:
>  - use non-devm PM runtime callback to correctly enable/disable clocks
>    when unbind the device
> Changes in v4:
>  - replace guard() with PM_RUNTIME_ACQUIRE()
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 67 +++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1..bc804d2b5aee 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/typec_mux.h>
>
> @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
>  {
>  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
>  	struct tca_blk *tca = imx_phy->tca;
> -	int ret;
>
>  	if (tca->orientation == orientation)
>  		return 0;
>
> -	ret = clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
>
>  	tca_blk_orientation_set(tca, orientation);
> -	clk_disable_unprepare(imx_phy->clk);
>
>  	return 0;
>  }
> @@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  	if (ret)
>  		return ret;
>
> -	ret = clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(imx_phy->alt_clk);
> -	if (ret) {
> -		clk_disable_unprepare(imx_phy->clk);
> -		return ret;
> -	}
> -
>  	/* Disable rx term override */
>  	value = readl(imx_phy->base + PHY_CTRL6);
>  	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> @@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
>  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
>  	writel(value, imx_phy->base + PHY_CTRL6);
>
> -	clk_disable_unprepare(imx_phy->alt_clk);
> -	clk_disable_unprepare(imx_phy->clk);
>  	regulator_disable(imx_phy->vbus);
>
>  	return 0;
> @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	const struct phy_ops *phy_ops;
> +	int ret;
>
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, imx_phy);
>
> -	imx_phy->clk = devm_clk_get(dev, "phy");
> +	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
>  	if (IS_ERR(imx_phy->clk)) {
>  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
>  		return PTR_ERR(imx_phy->clk);
>  	}
>
> -	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> +	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
>  	if (IS_ERR(imx_phy->alt_clk))
>  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
>  				    "Failed to get alt clk\n");
> @@ -708,6 +696,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	pm_runtime_set_active(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
> +

no place to call pm runtime suspend, so whole driver's life cycle runtime
pm is on, is it expected?

Frank

>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
> @@ -737,15 +730,51 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>
>  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
> +
> +	/* To allow devm-managed resources to be released cleanly */
> +	if (pm_runtime_suspended(dev))
> +		pm_runtime_resume(dev);
> +}
> +
> +static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(imx_phy->alt_clk);
> +	clk_disable_unprepare(imx_phy->clk);
>
> +	return 0;
>  }
>
> +static int imx8mq_usb_phy_runtime_resume(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(imx_phy->alt_clk);
> +	if (ret) {
> +		clk_disable_unprepare(imx_phy->clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
> +				 imx8mq_usb_phy_runtime_resume, NULL);
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
>  	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> +		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
>  		.suppress_bind_attrs = true,
>  	}
>  };
>
> --
> 2.34.1
>
>

