Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A18C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDmlt9RDKbAS65tpISiNDaFS1yWWw3Wq1GeLi/uFO9I=; b=rlzs6DW6eInTnhDeM5Q6zAiwIL
	IHlDg/Dhg4IvVkjfVRPFosqzrtKgVgFUVuOXB93Z+18SaI0SeasjoOdC2J2q3DaDgXkuHMTsILvt0
	s1HkD0f2h82SHOK7qsVEMu3TEfSmKTLBJ+x75txXR6yWdXyWgb2bmoiqlmaJd1nZUtWjrgGgnkUhH
	JRSTBEDDe/VR2ayWgBWredhj0TL+rLcOoRTpunXfhkVbHAb9XlAtVizYJ3EkKR3UgLRZQ502rJ/S/
	1IHRoMoiXqBeLuWqd3x4tzNvAvSMtLm+Guf922BBy3/UrSOtjnVbEmmV9BafnIO14pL2l6Ia9/f7P
	0TkQ2cIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oir-0000000CEmG-1wec;
	Tue, 01 Sep 2026 13:40:21 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oip-0000000CEkE-0Zqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:40:20 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.98.2)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1x1Oih-000000008Jv-2X2P;
	Tue, 01 Sep 2026 15:40:11 +0200
Date: Tue, 1 Sep 2026 15:40:11 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: imx-rngc: propagate clock enable errors
Message-ID: <apbVu9mZpjslNi6k@akranes.kaiser.cx>
References: <20260830131253.2718-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830131253.2718-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_064019_172270_BE1CE5EF 
X-CRM114-Status: GOOD (  20.08  )
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

Thus wrote Pengpeng Hou (pengpeng@iscas.ac.cn):

> imx_rngc_probe() reads hardware registers after enabling its clock without
> checking the result, and the runtime resume callback always reports success
> after the same unchecked operation.

> Propagate clock-enable errors before accessing the RNG and to the
> runtime-PM
> core on resume.

> Fixes: 1d5449445bd0 ("hwrng: mx-rngc - add a driver for Freescale RNGC")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/char/hw_random/imx-rngc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 7693328f10564..00a21d62c79c3 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -266,7 +266,9 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;

> -	clk_prepare_enable(rngc->clk);
> +	ret = clk_prepare_enable(rngc->clk);
> +	if (ret)
> +		return ret;

>  	ver_id = readl(rngc->base + RNGC_VER_ID);
>  	rng_type = FIELD_GET(RNG_TYPE, ver_id);
> @@ -338,9 +340,7 @@ static int imx_rngc_resume(struct device *dev)
>  {
>  	struct imx_rngc *rngc = dev_get_drvdata(dev);

> -	clk_prepare_enable(rngc->clk);
> -
> -	return 0;
> +	return clk_prepare_enable(rngc->clk);
>  }

>  static const struct dev_pm_ops imx_rngc_pm_ops = {

> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> -- 
> 2.50.1

The same patch was sent 2 days ago.

https://lore.kernel.org/linux-crypto/apHlIGM3_GHf86fK@SMW015318/T/#t

