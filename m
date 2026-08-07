Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1DFC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB6Af5OjLIhaBxGF8Jei4vtdXCnTfc/GgI9MvnBm98Q=; b=SArV0u0cUmGEl5xAcOlk/LaOoM
	4LXzOUARSZuaFey86uOMt2SHEjTtsIYS4rtRCWucS+YRoZ4yvJXDehJD8gKxBO+6CVZqBbZtH5ANT
	ePxjJA4QGYQbX/UJ+gzc2HIA3gSM7z3bdZn0gllwgQqowv5we03mjxW/LwgppIRVTryLVVC1itEuV
	GpXfXIjFSAD6EtHN2g9JeuYxVfd14lq2D8W6tfIc2Vhj+6fNXSBaGn/GES7F+SWmN7bOH0D1y4XWT
	9jEEFPJfH2U+EvoG3VF4keM16a84s1kH2sIrFe7UB1tPbJx0rZ58OoeLrZUmQKA12c9T5n+Iu1fAB
	tEgovzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPpd-00000008dvO-2Zaw;
	Fri, 07 Aug 2026 19:02:13 +0000
Received: from mail-francesouthazon11011057.outbound.protection.outlook.com ([40.107.130.57] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPpb-00000008dub-11tZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 19:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoFMvnFbENk6njebGmEJ2ye9i3y4q43nVlJoIKT0liO8U8d5lL8Nejg3P4VaFFMgCvC6AE9mULbqbBXhBx+JBZKvMhJlJY+ggZQsywWMh7469LWFfvKofSG03ikDs8HqKxg5OYG9wPjok1diTEWJnmdvRJ4ljTGEI8dhhU9J7HoUowXLauOzQipvMdk0wfzU4rwr3MIsEiW50ZgC7hIY4kSUk81g74+6hpKvKmB+HZh7PJbEY/cmrQXztZox77dIvJ6YC/Fj4VfSmtnD2otMH9xfhupcjhGGMzCQi8E4r66cpHW/9qBYn4Nokp9px/WxmhsRlprSrdf6mE6oYX2FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB6Af5OjLIhaBxGF8Jei4vtdXCnTfc/GgI9MvnBm98Q=;
 b=kJJl3EfFHmsR6RMVgZUrfICvFE+sMkTUX4CSmVOBJykxx1t4Sd+5wvjPB7Op0FBTHrddYtxu/vVZIMwMiPid0C9HgKfoKZr5vxN/gObblEBkPZi6urhkf2AlahPtJldS/pz+PldOBACD/OnsfNO+5QbyLHvJ+Ys/dnxRhm0mXCKq/4QNC6f5ptVa96txpgds4ZcpolcggUQBt2IZW7ZutUBXGAz3pEuGSUkYkOoxOBSjNf7KlCzr91ACGyBUy+M7eBSRMTM7YXCUwsN+CR9/VtKnmJICNrTeX2U9QNOhbsVDhoffx272fbSaB9OtdgVNBAIUpa0wWWSTgpxfQZz33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB6Af5OjLIhaBxGF8Jei4vtdXCnTfc/GgI9MvnBm98Q=;
 b=sdxpekpGnm0pEVDVboXs7cdjpA0WT27I95zAgC44k/0Ym/tu8Wwm0BLYUCwAycSnLWhtTYLNUYdC0dL+OE9/1HU0eNvqOT2AMrBM/TXctcQ3unSzrz9N8EBd/slXvuO+bjEBUj9JloJj8wTobF0cgwo4wr5zyg1UCxXEAQb0enIaeuJoBjxwl4evB4fnok4TeY2wUB0NHLxJ9OlfnLWq5a2dF/ean9GnxeJn4ndk7DonKQW+nqftuNiJV/DbbUAiaHJWFxP6vgczg+P5gHxEfpYwMAR6GkNQfxOtCYjNR+uh9SXf7442KOEHqj41/njF4l031sH1WMaYkWe4rZULDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 19:02:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:02:02 +0000
Date: Fri, 7 Aug 2026 14:01:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path in
 probe()
Message-ID: <anYroThNbI9hcU6z@SMW015318>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2a1f0f-e0e0-4b05-9bc2-08def4b65d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QXW3dABvvHZ1YTNx2qKQFqDNC9ug1HO1WeZv6MrpxFyUVybonZow63doLkzHjwSBCS0DT/CK8RxKBXE9+MH1j+2FRAf0CvHhu99QPJqOikMCDANPkKr7HsAOx9yDME5MaTHuh2V2GYfF0Xlbqk7AN7FlcKPgKhy9TICHd5xkbuBh1pSwxCSXkdbbzOB83S4mxgV+JfejyhoSRBM0XflHavFYsP+mqzYBoH4d6SfHB/dxluNiAOwlB5RDR6tUWyhXw+YYckdregu8xfr8LlwaAaKO7CwbOZp0r7bxKqgllIRIBjNHOYdZeL+1wUxagE5l6esXRBrhIBYXDigiMEDaFGQnKLGnRTkokS9hAKyOaZ56tQF+uZF4LGfG9gKFLi5aoinoPe2UgTsr4eIsCv28L8lIFq0D6bh84dECKpaK6Y5SG6rVQW/Q2oqVD//vgwS/uaKPiv/jZcyjVDagKwEq7H0wdy0+UazdMQ25ApYKiDGLaLs0sAHC47vx1rRVyo6GfUTi/WhemoAkf+YV3+ORSR3K9v23sqJZ042hK1ntoolW1o3XKf8dZbG5KACZbN/RSbNuw8y7Ll1PU1dbVq/Qgk8DiWF790y6ShfTCIQnVn1g3WERX40BS7BBxLKGRbqgae6VK0xHT49hB2jBVsxeMnbuOYo0Nknj/H8GobjPFlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z4JM+Sov7QExCwXqHhv5uMuIqa58ju4TGhbQC8hFYr5zq5wOEsywvJWVWoQK?=
 =?us-ascii?Q?GDVJZeMC3Az/NBTOSGmFT6mMwJrL9uPOUA+2+cvOSyEAEizrdLae5NuO/14n?=
 =?us-ascii?Q?z0bZiol8eZyDufifq2d6PoLsPbuYFvf1iFkr7LUVxkL/k+I+6cKofnndpyEG?=
 =?us-ascii?Q?e/lgtg4jU5FhMAQ7p3XQDLpF/OqOrJdnOqSDYa2vwcFi7ca7MdrljEeHFeW1?=
 =?us-ascii?Q?qbmgWvCnRLXrWJdruPGQvZUmF8mMZoJuvoVW9V/Y4UhpL4pCO5zdgbmT2uMV?=
 =?us-ascii?Q?jtSKcayAaioG/C/h4BlNuepkYLozJDbadNVCSR93a9IDEpaumhPLrq13izax?=
 =?us-ascii?Q?XbUJtGtHXV5rLD3+a9245tUUL6AR8oa8hvXghoB56PPjSpydfCyes4vjAY4b?=
 =?us-ascii?Q?R0otUnxcmeHdsqeYOd7LO1j2jidiEDCTyP8NJMGkHkSCQMpHEh1+utb6s3s3?=
 =?us-ascii?Q?KhbGiwFyW4zslGej1JqOGAN2jzf5NPpQ/eFIVZy+0+KuzoIcfMhhGqfK8lLJ?=
 =?us-ascii?Q?unihshIPdRiXg/RXSzImEQDsHdKU7JJv6uc8053cjxAm7sSYz13l7TgfmMQP?=
 =?us-ascii?Q?8IRWE/gRPcbtoiMZckH51knXXdAut7Ax3PoeBWVff9qPAIJVJZ7T4jmLtVDg?=
 =?us-ascii?Q?0sVwz3Dny37KgeQRhSb8Gn9HTN0ILSw66MUvmWhwhoNx1eDkYN/pkSVdt26f?=
 =?us-ascii?Q?ZiAHeh6Z/+67k3JB4xfOX5u5Rdj4/d8qAs00ZSunZf109vY4eKm2MXebbrTB?=
 =?us-ascii?Q?pDntXyW3VbdKqS9fEfSUbFIMvFAyceYa0f0NWuGLE+boAFSttdQshHyrzj6h?=
 =?us-ascii?Q?4UQNsvvHJ4jjRu9befYhZepbjrIEoKNvyzY60MGt8PoCRDwRhc/ADm8cMAbE?=
 =?us-ascii?Q?Pg1nrPSpP6zfVoYkp4fdEubx+tCTTXzOZ98h/t0YHwSInxDRymgBmyoceYbR?=
 =?us-ascii?Q?DAX3QaBGouGPnC3ldlFADoU4o4+UmBM6BPq+Q4MvbWXU4zSWtXIf2Dfy2GR6?=
 =?us-ascii?Q?l7MUtG20/wuPHRZWkOAP3+psiFk5lPHyGgbVqk5kq5OzqEEgrnVdgtI5ZtEz?=
 =?us-ascii?Q?qmb62NRnakG0vX28d3F/tDRNxP4Y1ZUBHZW2U11PiaNoOY/oeMaUph98sOkk?=
 =?us-ascii?Q?0Q/PqF7G07t4kEDnSuCp4DQ7OIvznjtMWkGHzzHkk75LF5/nVHpLTIUTi2Zj?=
 =?us-ascii?Q?hXRAwb3JagqNIQRfkUkQNGG09B7bLjyOUHvNg0ylSVEV99wDu5Cyc1eS+Kpt?=
 =?us-ascii?Q?Vw5k4V9D8NyqkGvVetwbX/IowwiPi0dPvxpCNwCwEeQZRTyNt9EccqB8Li8b?=
 =?us-ascii?Q?he/YOXePEuRlsxLG8ohFbLvhDj6YO3vsMKa5F8YKDI8u2eC/ZrD9HObhinQO?=
 =?us-ascii?Q?6urpf2Vs4/p9TTJa/CvfzVISx5t6qlEtrt/6qhldH3A5sfxGsFRccdQ/XX8i?=
 =?us-ascii?Q?wQoXfcmHQ56BQAfvuEH8m5H6l6SZeBW+X59XR7YVXjEj7nRuCSTbjqIuGbrC?=
 =?us-ascii?Q?sA0bgthd7+Vyi9aQL1acHU2+Mc2f7FQsuuYpNGqNJhp7W4rgpoLLBV0GtCgs?=
 =?us-ascii?Q?ZeOv3lVapQ/DtNQavEoAz8Xk9SAJs8ab6Ai9J5mW/DCoYoal4bmDESOcj9+o?=
 =?us-ascii?Q?VFX0/srrCHjT007UONXpD0kDVXeMdEbkgq0+xoGG4v/jdhWDfdNGbwxlqxnG?=
 =?us-ascii?Q?kpZk2QIK+64n6m9+VE+NqAOsRGQvaCJnQei7Wer8QAbMwhWF26izSqzKl4f4?=
 =?us-ascii?Q?oEcrFiV7p+T5GxSYzEqXqSpgEX9L1J6eTEtclMn1nrRnc66yYiaB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2a1f0f-e0e0-4b05-9bc2-08def4b65d8e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:02:02.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wz7umhfTmcfGPw9OP8aKoie8liBCd0DgBJrIlZ6DKWVuqYsmTWm4azRpsj0P+cJxm3B8vyLvELFz28J1Bf7yeznzrlHt2CKk3H/7ZARMS31Wf4p3XWWkJL2CdPp5uphG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_120211_284710_B4BA489A 
X-CRM114-Status: GOOD (  23.95  )
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

On Fri, Aug 07, 2026 at 04:23:43PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> If the fsl,num-irqs sanity check rejects the value after the IRQ domain
> has already been created, probe() jumps to a single label that only calls
> clk_disable_unprepare(), leaving the freshly created IRQ domain leaked.
> The domain-creation failure path shares the same label, which is correct
> only because the domain is NULL there.
>
> Split the error path so that a failure after the domain has been created
> removes it before disabling the clock, and a failure before that goes
> straight to the clock cleanup.
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> Changes in v3:
>  - New patch, split out of the single v2 patch. Fixes the irq_domain
>    leak on the probe() error path reported by Sashiko AI on v2.
>
>  drivers/irqchip/irq-imx-irqsteer.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

I suggest create helper devm_irq_domain_create_leaner()

static inline struct irq_domain *
devm_irq_domain_create_linear(struct fwnode_handle *fwnode,
							  unsigned int size,
							  const struct irq_domain_ops *ops,
							  void *host_data)
{
	const struct irq_domain_info info = {
		.fwnode		= fwnode,
		.size		= size,
		.hwirq_max	= size,
		.ops		= ops,
		.host_data	= host_data,
	};
	struct irq_domain *d = devm_irq_domain_instantiate(&info);

	return IS_ERR(d) ? NULL : d;
}

Then imx-irqsteer this devm version. So other drivers can get beneafit also

Frank


>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..a2f0629b22a3 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -241,13 +241,13 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (!data->domain) {
>  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
>  		ret = -ENOMEM;
> -		goto out;
> +		goto err_clk;
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
>
>  	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
>  		ret = -EINVAL;
> -		goto out;
> +		goto err_domain;
>  	}
>
>  	for (i = 0; i < data->irq_count; i++) {
> @@ -266,7 +266,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>
>  	return 0;
> -out:
> +
> +err_domain:
> +	irq_domain_remove(data->domain);
> +err_clk:
>  	clk_disable_unprepare(data->ipg_clk);
>  	return ret;
>  }
> --
> 2.34.1
>
>

