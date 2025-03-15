Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08237C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 18:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRPOjYnSh8ApHHzvgr2hPl5wbkf5pyUscON/xnu2WNQ=; b=sZqGfC9lygstEdFaRuJA67G/Dq
	kUbp3zfX6T/jYJcmCDR/27hA4tMadVEjiUWKjGNyqDcwlODele13IB+jKK1MUpHkuiyGAacVRw2Qy
	upmDeuDjiBNQI7wLHD619gSoYSNbEcnvhHrFxKJSaV8itwa6ZIrj9YE7NrqCwP5N8JAzwMGvUUFRC
	c/89WqjAATpcsjmV3b3aGDb689ckH3qEmTY2Qgtr1o36VC803tE3YYXcq6b4+0pTisTjmsSI19g8V
	V4hc7gmDBhLuhs3IFf7/VnHmF91D+TMLqypTrEs1eZIBeOUSKu+gMFjMeuzfEBSmceuUb0fkaE0G4
	bS6PhNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWSk-0000000GiHS-06Mm;
	Sat, 15 Mar 2025 18:42:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWR3-0000000Gi5m-2SSO;
	Sat, 15 Mar 2025 18:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C49CEA48B36;
	Sat, 15 Mar 2025 18:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E57AC4CEE5;
	Sat, 15 Mar 2025 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742064036;
	bh=00RmH4uBlvkSbz6rfOkjFvbEmq2n+WwmAs6qZnlIY2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qYKTwSu+jSfZi4orffYnERK0ro+MZCC0aG9Ccz6itSm5oeGfBdat6ovAVDBtyfOVE
	 kNyMg8vS7cl0TAlVD4aXWOq+qlX9kZLGhfggeTQMfqpDYLps3E2+gpSVEge6rI1ki0
	 VZ6S4+vxVXVOI6CGOr0iuqi9vDd23lcOyARxOoGVlewz7RU/kToieksHnvPD3cEP4S
	 znpU2Oo4YkLJuAT4aev1rsB0g2TmGJvjDUZp7JKjmUN4LKcMFVmWVAaFCAEjTYTmND
	 FXP5K6wrEiKmS3m4hzH3NrPKRvY1k5OXVlKbrKGAgXQzdmVzirvxoGJLrOWqRl8/Pu
	 TlnQ0FKNps/XA==
Date: Sat, 15 Mar 2025 18:40:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Simon Xue <xxm@rock-chips.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Shreeya Patel
 <shreeya.patel@collabora.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: rockchip: Fix clock initialization sequence
Message-ID: <20250315184028.46053659@jic23-huawei>
In-Reply-To: <10623626.nUPlyArG6x@phil>
References: <20250312062016.137821-1-xxm@rock-chips.com>
	<10623626.nUPlyArG6x@phil>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_114037_703878_30E8396D 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, 12 Mar 2025 08:00:54 +0100
Heiko Stuebner <heiko@sntech.de> wrote:

> Am Mittwoch, 12. M=C3=A4rz 2025, 07:20:16 MEZ schrieb Simon Xue:
> > clock_set_rate should be executed after devm_clk_get_enabled.
> >=20
> > Fixes: 97ad10bb2901 ("iio: adc: rockchip_saradc: Make use of devm_clk_g=
et_enabled")
> > Signed-off-by: Simon Xue <xxm@rock-chips.com> =20
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
ouch.

Applied and marked for stable.

Thanks,

Jonathan

>=20
> > ---
> >  drivers/iio/adc/rockchip_saradc.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockch=
ip_saradc.c
> > index a29e54754c8f..ab4de67fb135 100644
> > --- a/drivers/iio/adc/rockchip_saradc.c
> > +++ b/drivers/iio/adc/rockchip_saradc.c
> > @@ -480,15 +480,6 @@ static int rockchip_saradc_probe(struct platform_d=
evice *pdev)
> >  	if (info->reset)
> >  		rockchip_saradc_reset_controller(info->reset);
> > =20
> > -	/*
> > -	 * Use a default value for the converter clock.
> > -	 * This may become user-configurable in the future.
> > -	 */
> > -	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
> > -	if (ret < 0)
> > -		return dev_err_probe(&pdev->dev, ret,
> > -				     "failed to set adc clk rate\n");
> > -
> >  	ret =3D regulator_enable(info->vref);
> >  	if (ret < 0)
> >  		return dev_err_probe(&pdev->dev, ret,
> > @@ -515,6 +506,14 @@ static int rockchip_saradc_probe(struct platform_d=
evice *pdev)
> >  	if (IS_ERR(info->clk))
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
> >  				     "failed to get adc clock\n");
> > +	/*
> > +	 * Use a default value for the converter clock.
> > +	 * This may become user-configurable in the future.
> > +	 */
> > +	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to set adc clk rate\n");
> > =20
> >  	platform_set_drvdata(pdev, indio_dev);
> > =20
> >  =20
>=20
>=20
>=20
>=20


