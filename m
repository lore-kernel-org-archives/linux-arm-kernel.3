Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FE7D2E00F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFw2SKt3AKU65RCxsklheAfSiZxOhrpzrYODbhZcNBk=; b=36f/MZGXgyeIKk3X775lRahubx
	BKZKpv4zT/tZQ5Rg44GldUL9bU9fUL07HfAa9eSD9z/rR7I+4puzpn6F7QTlmRS305JYMmaVptRa6
	HNUZ69uHDRLcF0euOj41S4qZKRitxHFQVw3R6auCki4iFbSVqbJna7z6WXCaILiMxsavelKxqHhM9
	VwdIy09erSTQV+vkpFxpLcQo5+0N2l4JyRjyI+45pFtA3I1XqvimChOBM6g1egIHWyVgJfuJXd9kJ
	ZMVY7jNi8LM67R66mGJGji5q3b+mpUfHUnEmiH/ye28V9Le3TtmS1VI7vkHbJxnsG65+jRh0Mi6Fm
	Aralf4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vlB-00000000B3j-0DaV;
	Thu, 24 Oct 2024 11:12:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vay-000000009KU-1TiD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:01:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-0007iV-Rm; Thu, 24 Oct 2024 13:01:23 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-000BRi-1m;
	Thu, 24 Oct 2024 13:01:23 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t3val-00B9fo-1P;
	Thu, 24 Oct 2024 13:01:23 +0200
Date: Thu, 24 Oct 2024 13:01:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-pm@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
Message-ID: <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
References: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_040136_668861_60A983A9 
X-CRM114-Status: GOOD (  18.77  )
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

Hi Dario,

thanks for the patch.

On 24-10-24, Dario Binacchi wrote:
> The patch standardizes the probe() code by replacing the two occurrences
> of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
> other error paths of the probe() function.

I assume that this paths aren't using dev_err_probe because these paths
can't return EPROBE_DEFER and therefore dev_err_probe() would use
dev_err() anyway.

Regards,
  Marco

> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  drivers/pmdomain/imx/gpcv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 963d61c5af6d..6e6ecbf2e152 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>  
>  	ret = pm_genpd_init(&domain->genpd, NULL, true);
>  	if (ret) {
> -		dev_err(domain->dev, "Failed to init power domain\n");
> +		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
>  		goto out_domain_unmap;
>  	}
>  
> @@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>  	ret = of_genpd_add_provider_simple(domain->dev->of_node,
>  					   &domain->genpd);
>  	if (ret) {
> -		dev_err(domain->dev, "Failed to add genpd provider\n");
> +		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
>  		goto out_genpd_remove;
>  	}
>  
> -- 
> 2.43.0
> 
> 
> 

