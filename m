Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092A3D11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl9tkNBmhCA9sDnCvbv+DotTx+3RqfD2wa9mLM4ab14=; b=Bu29Uz2C3xkZ/2vvmGdC3RPYem
	pPfEnVKoZsKvAK+zclzQVONw7AnjQUj4vbRgsttblkilm6XX+yyV9qUaByuRfcx9jfhognyMUpiar
	qpoNG83nDDKeSjLcsf1jqeyrpP7sPugCl3veaZqqw60JS0mBWkTS3tq/YU8y8T6Vh3EX6R7UN9fcY
	rDJdlK5BvbwbYwx7atKoM4EFU4vHYDhSrot86vTi/ZlZQrscvCDcDSmAMrBjIUtXMK+BIOGAtP6Xd
	JUmAsnJzNGrx2UDDa2uavnFFmEnmGMK4QLLJznVNrsWvR3g4leZgWzbiY1gEoRptqtZMLclWCe486
	bwvzZBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMAG-0000000Fcca-2shr;
	Wed, 26 Nov 2025 20:31:00 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMAE-0000000Fcc1-1bY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:30:59 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.96)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1vOM9P-009WC2-1t;
	Wed, 26 Nov 2025 21:30:07 +0100
Date: Wed, 26 Nov 2025 21:30:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
Message-ID: <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_123058_422621_52334412 
X-CRM114-Status: GOOD (  17.03  )
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

Thus wrote Jean-Michel Hautbois via B4 Relay (devnull+jeanmichel.hautbois.yoseli.org@kernel.org):

> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

> Change devm_clk_get() to devm_clk_get_optional() to support platforms
> where the RNG clock is always enabled and not exposed via the clock
> framework (such as ColdFire MCF54418).

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  drivers/char/hw_random/imx-rngc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 241664a9b5d9..d6a847e48339 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
>  	if (IS_ERR(rngc->base))
>  		return PTR_ERR(rngc->base);

> -	rngc->clk = devm_clk_get(&pdev->dev, NULL);
> +	rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
>  	if (IS_ERR(rngc->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");

The clock is not optional on a standard imx25 system. If it's missing in the
device tree, the rngb will not work and we should not load the driver.

Should we call devm_clk_get or devm_clk_get_optional, depending on the
detected device?

Best regards,
Martin

