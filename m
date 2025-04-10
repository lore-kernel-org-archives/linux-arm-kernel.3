Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29CFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOGuWJKD0WzESm/bo5U4hXHCwzgbA73NauItgs6mHmQ=; b=BHXcloLWSPMzUZoaVc/698Lzs7
	Xlk1KHbeVJPU99aTJf9t/4ByFdik2BosCNw4QJww5BCEzi8xcnATODeB7ApSaIB5nWhWKaZTMy0er
	0oDu6lRh8yb5+qM7dk6woy0t29IcZWhiWMKVUdkVuijDJ6BO0yaebuHnHEoNJCT9Qg58t4ULJIsLW
	zFRZSfhl43DZ8O2l0Lcd1nWh+QHF/fu4PgI1vrvZ43zvOEsdMCDj+llNiZBZimnf/1Bq7jzYxGtM8
	8ZWD1a2lxx4fpYdwUgqrUoh4KgdYyBedcV8OKM01VdYcknNA2CER8CUZhM1AlGSgHH3pXRHSXCxH3
	nIDFne0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rRb-0000000AaD1-0rKL;
	Thu, 10 Apr 2025 12:55:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rKN-0000000AYqI-1ndX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:48:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKC-00081a-9j; Thu, 10 Apr 2025 14:48:08 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKB-004Guz-1D;
	Thu, 10 Apr 2025 14:48:07 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u2rKB-00093a-0z;
	Thu, 10 Apr 2025 14:48:07 +0200
Message-ID: <2bb410e34babc4c66895e8e74cf014f89127914d.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Apr 2025 14:48:07 +0200
In-Reply-To: <20250410-b4-upstream_ospi_reset_update-v1-2-74126a8ceb9c@foss.st.com>
References: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
	 <20250410-b4-upstream_ospi_reset_update-v1-2-74126a8ceb9c@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_054819_464570_53F98F80 
X-CRM114-Status: GOOD (  17.49  )
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

On Do, 2025-04-10 at 14:23 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
>=20
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 668022098b1eac3628f0677e6d786e5a267346be..96fa362432f13c19e4dde63d9=
64a0db64c8ade95 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_d=
evice *pdev)
>  		return ret;
>  	}
> =20
> -	ospi->rstc =3D devm_reset_control_array_get_optional_exclusive(dev);
> +	ospi->rstc =3D devm_reset_control_array_get_exclusive_released(dev);

Why does this drop _optional?

Also, since _acquire() is right below in the same function, I see no
benefit in requesting the reset control in released state.

>  	if (IS_ERR(ospi->rstc))
>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>  				     "Can't get reset\n");
> @@ -937,9 +937,11 @@ static int stm32_ospi_probe(struct platform_device *=
pdev)
>  		goto err_pm_enable;
> =20
>  	if (ospi->rstc) {

This check only makes sense if the reset control (array) is optional,
otherwise ospi->rstc can never be NULL.

> +		reset_control_acquire(ospi->rstc);

This is missing error handling. Alternatively, you could just use the
normal request function to get an already-acquired reset control.

>  		reset_control_assert(ospi->rstc);
>  		udelay(2);
>  		reset_control_deassert(ospi->rstc);
> +		reset_control_release(ospi->rstc);
>  	}
> =20
>  	ret =3D spi_register_controller(ctrl);

regards
Philipp


