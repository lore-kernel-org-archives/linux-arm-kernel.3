Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7J3yXyaGt/G5hnQcvxHMCiYNb3Sd5mnD4YuztycONU=; b=Mu2gV3KBdZgQdlr/nNhI/CHL2n
	4gxPtMXt2k2NKptX0W/LNIM1V+IogdWTfl4skEcgbfTbJPfyUax5ck7y7boDMvwwqvTNV/VxFKtu0
	ThArNvmWWZ0gmkYmOn5ooXumzevojuj3XskC4gAy6DuS9ASJKNoNZGVO5ThLnOfnFWhIbFvhOBTSD
	utrVbxgIdySLx2pVhXzJ+/usqag5DVoNULJOgfy/gQvpLTTGo1USFIXDJBqXUkEc1F0yqxv2QSz6n
	MOGYaD7oKdSswzakKvzJKfjka8ufN5pnQ7yWPQLS3UYszWTGYCG47Y1/Y0ZuTZ/meSTNMTNathcjg
	DnX6uyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWjM-00000001U15-3KNF;
	Fri, 06 Dec 2024 11:42:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWiL-00000001Tve-2JVW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:41:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWiA-0004H7-Up; Fri, 06 Dec 2024 12:41:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWi9-001zVh-2H;
	Fri, 06 Dec 2024 12:41:30 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tJWiA-000nbD-1C;
	Fri, 06 Dec 2024 12:41:30 +0100
Date: Fri, 6 Dec 2024 12:41:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, marex@denx.de,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx8m: Add remove function
Message-ID: <20241206114130.zt4rkotzbzi3xt5n@pengutronix.de>
References: <20241206112843.98720-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206112843.98720-1-peng.fan@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_034141_667262_6C6AF512 
X-CRM114-Status: GOOD (  25.32  )
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

On 24-12-06, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Unregister the cpufreq device and soc device in remove path, otherwise
> there will be warning when do removing test:
> sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> 
> Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx8m.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 8ac7658e3d52..8c368947d1e5 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -33,6 +33,11 @@ struct imx8_soc_data {
>  	int (*soc_revision)(u32 *socrev, u64 *socuid);
>  };
>  
> +struct imx8m_soc_priv {
> +	struct soc_device *soc_dev;
> +	struct platform_device *cpufreq_dev;
> +};
> +
>  #ifdef CONFIG_HAVE_ARM_SMCCC
>  static u32 imx8mq_soc_revision_from_atf(void)
>  {
> @@ -198,7 +203,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	const struct imx8_soc_data *data;
>  	struct device *dev = &pdev->dev;
>  	const struct of_device_id *id;
> -	struct soc_device *soc_dev;
> +	struct imx8m_soc_priv *priv;
>  	u32 soc_rev = 0;
>  	u64 soc_uid = 0;
>  	int ret;
> @@ -207,6 +212,10 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr)
>  		return -ENOMEM;
>  
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
>  	soc_dev_attr->family = "Freescale i.MX";
>  
>  	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
> @@ -235,21 +244,34 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr->serial_number)
>  		return -ENOMEM;
>  
> -	soc_dev = soc_device_register(soc_dev_attr);
> -	if (IS_ERR(soc_dev))
> -		return PTR_ERR(soc_dev);
> +	priv->soc_dev = soc_device_register(soc_dev_attr);
> +	if (IS_ERR(priv->soc_dev))
> +		return PTR_ERR(priv->soc_dev);
>  
>  	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
>  		soc_dev_attr->revision);
>  
>  	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> -		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> +		priv->cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);

If CONFIG_ARM_IMX_CPUFREQ_DT is enabled, I asusme that
platform_device_register_simple() shouldn't fail else it will be an
error, right? Therefore I would like to add the 'if(!IS_ERR())' check
here instead of the remove function.

> +
> +	platform_set_drvdata(pdev, priv);
>  
>  	return 0;
>  }
>  
> +static void imx8m_soc_remove(struct platform_device *pdev)
> +{
> +	struct imx8m_soc_priv *priv = platform_get_drvdata(pdev);
> +
> +	if (!IS_ERR(priv->cpufreq_dev))

With the above shifted, we only need to:
	if (priv->cpufreq_dev)

Regards,
  Marco


> +		platform_device_unregister(priv->cpufreq_dev);
> +
> +	soc_device_unregister(priv->soc_dev);
> +}
> +
>  static struct platform_driver imx8m_soc_driver = {
>  	.probe = imx8m_soc_probe,
> +	.remove	= imx8m_soc_remove,
>  	.driver = {
>  		.name = "imx8m-soc",
>  	},
> -- 
> 2.37.1
> 
> 
> 

