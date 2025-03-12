Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A0C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4cQcUJ36qNbXsGyNZN8cofiMvUd+P7GunVsv0lw7ng=; b=PBpnc8lo5TcxFfIP3TQ0WlnfiW
	MN37VdC14VVy94vK8OY1fMBICEp+5FHvuOrWwJqiYwduV/USZvE+8s99+L9sZPYRPO7Uf/d+G1XHv
	SXwXP2mh787RyKlWzK8a7RIOC6O8eSW1PrKW3lyKrf08hGoMMZB4P+O6UKyAF8SN/fbd1jUTD6gEg
	SNC9wkID5/6kSOaTkq/Jz1qSdfMv/yj+dbukFH/Cu/9hNuFIY0LRGI94LtnRHtHuG9tEleFCnSvBZ
	qeomNYwEt0F8UzlyIayq0gbIFENRF6g/lZT7yMCXQaMse2QcIhIc5+Nc7Nx3O7ChIyoFt1037vdJG
	4aPALxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsG7F-00000007enz-22Va;
	Wed, 12 Mar 2025 07:02:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsG5b-00000007ed0-2HgZ;
	Wed, 12 Mar 2025 07:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T4cQcUJ36qNbXsGyNZN8cofiMvUd+P7GunVsv0lw7ng=; b=c+Z7jXJEsCDQ9/aVNgTQtUgjLQ
	9bBfzxsRzEr+7FgnoT0aLBS72UX8EMfN4yuhXInO/xqKBcWaOlQ3xJH10Hb+H//OG0D4+/Ftas+mh
	Ad7+HvP37hxYRSdvb95uLBkgh68AbtFocQlTEKGTWuuvG3R8S6HYYimbWALR7jMXOkfFiSU5LED0s
	TTp+Gw/WSL9zsvuXmkZ1sbabx/mQg/jaBGYpKSQ1nvGAT/iAUWS2XBXTgs8zrDK+e6sZwvA1ektdr
	h6h8aDqap0NSXKpjLINaomhQt51r8XDO6lRh15D7jMWSuep2VXpjQVBhbxxnsITO4n6k/qAzZQDdP
	HGE7Ru5g==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsG5P-0005ev-CI; Wed, 12 Mar 2025 08:01:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonathan Cameron <jic23@kernel.org>, Simon Xue <xxm@rock-chips.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>
Subject: Re: [PATCH] iio: adc: rockchip: Fix clock initialization sequence
Date: Wed, 12 Mar 2025 08:00:54 +0100
Message-ID: <10623626.nUPlyArG6x@phil>
In-Reply-To: <20250312062016.137821-1-xxm@rock-chips.com>
References: <20250312062016.137821-1-xxm@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_000115_582330_2574E6B6 
X-CRM114-Status: GOOD (  18.06  )
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

Am Mittwoch, 12. M=C3=A4rz 2025, 07:20:16 MEZ schrieb Simon Xue:
> clock_set_rate should be executed after devm_clk_get_enabled.
>=20
> Fixes: 97ad10bb2901 ("iio: adc: rockchip_saradc: Make use of devm_clk_get=
_enabled")
> Signed-off-by: Simon Xue <xxm@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/iio/adc/rockchip_saradc.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip=
_saradc.c
> index a29e54754c8f..ab4de67fb135 100644
> --- a/drivers/iio/adc/rockchip_saradc.c
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -480,15 +480,6 @@ static int rockchip_saradc_probe(struct platform_dev=
ice *pdev)
>  	if (info->reset)
>  		rockchip_saradc_reset_controller(info->reset);
> =20
> -	/*
> -	 * Use a default value for the converter clock.
> -	 * This may become user-configurable in the future.
> -	 */
> -	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
> -	if (ret < 0)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "failed to set adc clk rate\n");
> -
>  	ret =3D regulator_enable(info->vref);
>  	if (ret < 0)
>  		return dev_err_probe(&pdev->dev, ret,
> @@ -515,6 +506,14 @@ static int rockchip_saradc_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(info->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
>  				     "failed to get adc clock\n");
> +	/*
> +	 * Use a default value for the converter clock.
> +	 * This may become user-configurable in the future.
> +	 */
> +	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to set adc clk rate\n");
> =20
>  	platform_set_drvdata(pdev, indio_dev);
> =20
>=20





