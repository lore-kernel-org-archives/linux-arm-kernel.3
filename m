Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA7C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbYSVVLiDJmYREd6jvmG7aLMbaPcR8znxbDKR4HQp1A=; b=Ze3KCO6fUMYyylv9E/hzXrP2JY
	RWDU4ycFT0jzAnsdmGlxcp27znFFxznGq1e4m8HdeOoax2eQJ8OJ7d/088CBAc3GrZMALZxp7acNV
	F4Bt6uDlXuTOj9/i12Bl7y0fUGmlohab4OBPlHgyvJGIF9Yl5C1L0uPKdr4kRFlRSq3pg3RW6G3RY
	NzD9wD6i1o5WJ1MW05D0WfOkpOtHfMFJSDsxqB7/hM+r4k9zanKdTuMVMM3R9ZWiS1y1xeB/WTOW8
	FoCz2h1k+bMOVSflUaegbU1FubaK7opfbWcjh0k7gFRzr+aMmanwRUFx94y9M67/5x2wf8QI4vARr
	V68ITMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkq-00000007SBl-02D3;
	Mon, 05 May 2025 13:21:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvd0-00000007RAd-3tFf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:13:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvcr-0006PX-1O; Mon, 05 May 2025 15:12:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvcq-001EYf-0D;
	Mon, 05 May 2025 15:12:52 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvcp-000Jxu-3C;
	Mon, 05 May 2025 15:12:52 +0200
Message-ID: <3685c6351d8b940abe70ccf22d783e71ced6f6da.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 05 May 2025 15:12:51 +0200
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
	 <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_061302_964493_34C9F8B8 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Patrice,

On Fr, 2025-04-11 at 14:41 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
>=20
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index d002b9c16714684e4e4623f9255a7f2660c46fd1..ef840f377459891b559be6d6c=
0435408fb58a1e9 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_d=
evice *pdev)
>  		return ret;
>  	}
> =20
> -	ospi->rstc =3D devm_reset_control_array_get_exclusive(dev);
> +	ospi->rstc =3D devm_reset_control_array_get_exclusive_released(dev);
>  	if (IS_ERR(ospi->rstc))
>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>  				     "Can't get reset\n");
> @@ -936,11 +936,14 @@ static int stm32_ospi_probe(struct platform_device =
*pdev)
>  	if (ret < 0)
>  		goto err_pm_enable;
> =20
> -	if (ospi->rstc) {
> -		reset_control_assert(ospi->rstc);
> -		udelay(2);
> -		reset_control_deassert(ospi->rstc);
> -	}
> +	ret =3D reset_control_acquire(ospi->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
> +
> +	reset_control_assert(ospi->rstc);
> +	udelay(2);
> +	reset_control_deassert(ospi->rstc);
> +	reset_control_release(ospi->rstc);

Could you keep the reset control (mostly) acquired from probe() to
remove()? The reset control would have to be released/acquired in OSPI
suspend/resume so that OMM can temporarily acquire control during OMM
resume.

regards
Philipp

