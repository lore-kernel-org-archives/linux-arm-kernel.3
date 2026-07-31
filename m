Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36js5g+Sc5slBO0etiCm8G4bKxXOR0+pDE7HszkKry4=; b=l2Z6hVzNHwNqHA/fUKxukd/Iu3
	FrOFRK4revL69svrryllEPzKYYk3sh9vqKpNpIaVSnk5m7U8I4OXow+3bBojCq0P7sa2TYSOVONOU
	I385j9sNKSVzKDqjuElMAe5q2VQGivS7BYvDRPxH2AUY69Y6n1Ty4MjAtEWvWxcbz625HIkmLUdJm
	mMLKThaQIioEkZi0dhtcEtGrTHrF3XROH+iv0S/T0QJmnrmbsiPxqnIcCbTCh08F+DxP2v6yT37Ii
	hEHg2LGUECuVDadW9Rt/Nk3fZJORkRwpZZFf719Ps1AibNS1/o5Utd5cBIkyxfNiDg8vlsXyQS0UA
	EGBj8K/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTS-0000000Co1I-23CP;
	Fri, 31 Jul 2026 14:44:34 +0000
Received: from mail-westeuropeazon11011070.outbound.protection.outlook.com ([52.101.70.70] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoT8-0000000Cnfo-0DoS;
	Fri, 31 Jul 2026 14:44:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7zS10JEB+g76nI8006Yjman9tsyvPJNM/2FpYP2A46vX9wIkFg1f0K+EPZxFzajFY6jZWJVaqrF3SAhvyuudGeXRFJHEDfAfnin5b3lZOrMsMWmLO//cRtbtySI4336rsElA1FrnH//YjWBK6X5rMMblb+uZEjV6IuPj7JL4bX/eZUcOosuTD1MIAvdjBpjZY9yrii+ElhrYZB8KB8n7Xii5AVKBspJ0Q55hhuz2yM99GypoUE+sMyOpSH1JGjB0zh92QJs4MDjsTgpuIeLJK9GOWNF9xDgLDPMgBuQ+YgpvJDBzxNYXqOf0qEUyUdEJ4NKnNINvtQ9mRUftDhMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36js5g+Sc5slBO0etiCm8G4bKxXOR0+pDE7HszkKry4=;
 b=gTgUhjBMjNJhZFnTlHpbOLlZSLrFx7hFGHqGMGWu1gulRycoYFe1CVRTSNGw+LR6nugpgnXPeIV3z9WJyTShWEuHUmfms57gPrGUEN1KbITyNyOrLVc4Lqbn7cw5Akj0gEJ3UrvHwcLqazxXO8RVYz2P9pdo22bggsvmj2/jXc9itUqcnZc+7F3HQ3xdCwYtRd/TYOBNj8pOt5XGjfyGjDAeVvLljEIN+G5dRISB4vxyRUfwV/OMT7QHSMhaUKXFiS2bFrkAwCEf7qukvZCs7NgStwXkD2LtxD0Cn5uUVVKSezYYiDTUSFaRYAAz7/bfIkwNZgG+h5ceIt+G5ZwTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36js5g+Sc5slBO0etiCm8G4bKxXOR0+pDE7HszkKry4=;
 b=I6ilOF8ld9MfaePXb6KeqYMI3Ok5H3U6pVfVit2ofFKBzSia+1pDAe2Sgrje8A86KylgUQWgAxejplr1K/Zgy3zGlF9UuLCUUwfaUpc1/e0p3EZq3pwdwQpKsZ9qeJg1qkuwlso1sEdOsQSNAKy3iNwK9GbBsCfeJcPZsZ0BoH9gkhdPgn9oi8MH5lmGFDepCQFPXLMQmUHyVOIYxkEbjnpbAs8oUYsc52e+XievWrYLdPf221NfCz4NP0fJh1N27du9Mfplmu2nzllytiGul4coVpLCR1N6mIH122iqDCccI/1xlo3VEWaWDfRCYYWQiZa+njx/Va9+qiM7h0FKpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 14:44:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:44:09 +0000
Date: Fri, 31 Jul 2026 09:44:00 -0500
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
Subject: Re: [PATCH v8 6/6] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <amy0sBg9QT-3v__p@SMW015318>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-6-2ec8d6b3854d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-6-2ec8d6b3854d@nxp.com>
X-ClientProxiedBy: PH7PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:510:324::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB11741:EE_
X-MS-Office365-Filtering-Correlation-Id: 4917f870-ba13-46ce-4166-08deef122e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zUjt/7Z5N0LN3haOr91iKPRUaPegtJrzlzAyccAfZgMOUM6UWuE+DGbtCz8WsfpPsKKwkfUseNNSJM40pGeafUmOZbQIxFAc6ML5fyCnQOFO011NIGrG9epmpIw0nU2KnrpMrx3t0e2ow7MLAIUsxQVlh7O/OCNSNUCJyTSAblnBmIwvLxgC0+780rd38JYGO7lwjOD8r8hqS/TFO3PuyaoSiRf8STqHqpK0J6dhoo8PAXg9nJIjoZD3p2YwbBozHi/fUGAG3mc07DBfEqAQuH983MjpvAKNLrFDUqsl+xEHSVdK6MquvRl4QiudvqEPPzUUg9udjpJr+lgp+jYKq4jwTdheDrnKk0ZSTNLKsFH87woouZM6NBHNQtYKMoAKQ7PLU/uJN21ttYuPhhXvwoqOWDEPFSw0lDAHJJ01uaR9/TlQbnieK8c9BllKs+htojh7+T4bYiSamyFGcEKcLteJ527FhwqIXmoBKeAD2ZxLiMOzrpKDNzG3WfR8olCGhtu9chKyMjvpAaVOSMBaq9zVd46j6L3I3lwI7KQQLRKz/epCbA6X8p6YF+rOBHy4e5Al4vpppurvxeHr26WzyoDYJdc2DQRxFKdUKtPQmGCN11yF5v/leS+bXl+G8iQ1GNq8MZ0JxU0wjbHLOIo4MJV20eoOpZQLY5hglvLQTPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xNYb2uItMof0jxq9zcppwDeHDFS8wH+vxRPYcpp+9YiuHmGcDKeckVleWG0y?=
 =?us-ascii?Q?0PCJ+xKeExOFmbMF5IgZfgid7EXiPagtJAvMHJ0S3XnnqbYTCmFc8CXHiaG4?=
 =?us-ascii?Q?7P/HDIrgy3D0dZB60uiATY/Bo5U5es8LKOZgTpD8Yxsy7AzUCfG4VwItr1lu?=
 =?us-ascii?Q?JN+WnoYd6/EXc3QT4dy+AEtZMvcc1x0CfsQ6sb5hJU6Svmrl7Pvjg5bfXUYg?=
 =?us-ascii?Q?GKpq/xA3FGqdouAzuJtc28zHER7+mxl15RwYJXzwjFB630fC6UqHilXkBwC5?=
 =?us-ascii?Q?OaWeQI9ioDSGVCiPDCidDeYwa87AKdS/l0h0Y/iGvpvFoGfeESUGA+FzoKub?=
 =?us-ascii?Q?NxI3XaIvYtZzQf52gZpEIC9ZqWvCVRjHlfxAkQTtpkP+i+6kPxWycLZQhRc+?=
 =?us-ascii?Q?TofITL9GrvzV/Tyc6FVeNa1Bn0CKkfAkk1nhG2Vy/GCFBTYaYZc4mmK3XJoA?=
 =?us-ascii?Q?1sIeJbu9tucs/xechoZdvQsdjXhclr1aoFxpQFJecA0jBjlR7fmZeNamKPXv?=
 =?us-ascii?Q?VKDzvh9zJ0HzDegvnaaho/ZZvJdzHEmuG2LEJd5M7+GoU23JqGIdxJ1jKwhF?=
 =?us-ascii?Q?zqBcSVNtKMk8eM5NL/giag/DMbBabR548RDOPpDPPPDgT8wg3VOJDwRDeiKY?=
 =?us-ascii?Q?kUFTrN+Z8H7Vf/a/fK6Vbb7Asl2dLdxiibBAV+ulmz0zPLSKvMGfDYoC2Fr0?=
 =?us-ascii?Q?MBLJwLCCBdfR+MjRtj9Tf2IT+nGgpmxPkrjOsd/9vYTU5P6msXqLCWjq/HmP?=
 =?us-ascii?Q?UTOWk6+riyt8M2t70NVHRyoB8HOUQzw/VeaXFpkDkFcpf0VnRQtJr/sq6MiU?=
 =?us-ascii?Q?vffCatcn0L6WTTcg95Kugiojdbdzdc1d3wnR/Xj0x33Fno+PtuJkfoULp9uU?=
 =?us-ascii?Q?I5H3lqBItTHUDXipYskUOFwJPBtXsk5t8MeoupkIutXKr0A268/vwH/Pt7sH?=
 =?us-ascii?Q?c7a8jX8O8hFkp2LAGaOxBV350oAgCzRv/J5AEwtazlcP4rvsSKOffXAUNamF?=
 =?us-ascii?Q?byw0uMH3g2X535R3VzSEl91FgiptPPzT0HAJJai9jxNrAlBedCj1aZ+mcbX9?=
 =?us-ascii?Q?W//7TC3RnGchdv21w2mGHlFEu3s3EJqoPMN9s+bl+IA+efYrciV2JDt/YI+t?=
 =?us-ascii?Q?guPUMm4DXJRhlQ4qrjOtFc0J8KON+31BxlfTfZ/S7fbUxv+3/8+4uejDLLaq?=
 =?us-ascii?Q?aki0AKmNcY4QEyQ26n62T2HTVe8WqIE0YaeRjkC2v+GlK5WlJju74W6f9eMb?=
 =?us-ascii?Q?Gt1DTBvIi6jPtFNF9wV/6lH/liaLh46zaq/GMnVx2AQUuHNHX/pQyizxkqt4?=
 =?us-ascii?Q?Z3IRiU6DcAGd0lSaXcMxm3ziDTMJmNuqD82ERecEvO70k/qJlp0bd7/LSZDQ?=
 =?us-ascii?Q?+1RPe3i14kufOr3aQ/yhvuvTNV5GRV8SijgVghMLOzZrEcxVcWEZtt73P5Zk?=
 =?us-ascii?Q?3zOzxebUQo89EtQKwoujHByns7wEIRfgYNai/VOrWwRlb/VWfHQoHQqDtoNp?=
 =?us-ascii?Q?oxItvW0uK9noGiKU7+7pR3YbF18EoPI0MUj6oeaxvyZfo3PYfm9CiRnmh3xk?=
 =?us-ascii?Q?AXoFZbQH7nAPTPTQcbeEVtHadJZVP119FZ15zFHnoJuzoOqgf227tIlp3//E?=
 =?us-ascii?Q?Zcc3l0zloDg8Bk8QUU3Am6zVIWrzInyOy82/A1+a1kBRyIOHlLbCfQN+h9AE?=
 =?us-ascii?Q?P8y1CuPf0h+HeO78GMT03VahN7kjxUYpt5XyrapXXPnHSbgzRVBTJbC5y8gZ?=
 =?us-ascii?Q?YQBf0Xxg8oh2seLAY706OaSoWsolEhnhWesA5s18FtA4O0rp4iXU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4917f870-ba13-46ce-4166-08deef122e22
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:44:09.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGquaW3LJmUV5TUKq6KxwWMYLXkYLf0uOK7fiq9YR4XAuTC5lziK4rlXuIaMccmD0tTiThXkkCjK2ILHdjJE42Jcu3Im6XWz7SS9gN3wJhZdwIVud9Fm9hyYzxQKxpFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074414_128614_CD926882 
X-CRM114-Status: GOOD (  22.31  )
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

On Fri, Jul 31, 2026 at 04:11:24PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> never powered off at runtime. With the introduction of runtime PM support,
> the power domain will be powered off if the device is runtime suspended,
> which breaks USB wakeup functionality.
>
> To preserve wakeup functionality, mark the PHY power domain as runtime
> always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v8:
>  - no changes
> Changes in v7:
>  - replace dev_err_probe() with dev_warn()
> Changes in v6:
>  - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
>    if the flag is true
> Changes in v5:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index ba7603a008d8..8859835541b1 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
> @@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
>
>  struct imx8mq_usb_phy_drvdata {
>  	const struct phy_ops *ops;
> +	bool need_genpd_rpm_on;
>  };
>
>  static void tca_blk_orientation_set(struct tca_blk *tca,
> @@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
>
>  static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
>  	.ops = &imx8mp_usb_phy_ops,
> +	.need_genpd_rpm_on = true,
>  };
>
>  static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
> @@ -738,6 +741,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (!phy_data)
>  		return -EINVAL;
>
> +	if (phy_data->need_genpd_rpm_on) {
> +		ret = dev_pm_genpd_rpm_always_on(dev, true);
> +		if (ret && ret != -EOPNOTSUPP)
> +			dev_warn(dev, "failed to set genpd rpm always on\n");
> +	}
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>
>
> --
> 2.34.1
>
>

