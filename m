Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C1AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjejw0wJrEZFF46CLZ8856k4YvBtnjatxUBLwfNoHfo=; b=HhekmdrEnKyQCtEf6QiW5swF9m
	TcVVGS8sxUCnm0EiERnFjouealIOkniGIWMQYnovu+Ho3HLf7gk8cpZwfwr8SC0Di5WBkolqlhf2Y
	6p8fle+paUXszL54as4Tzv51rsS8MWJPFkNMsyDoAnHgxBZCVmtFSiz5xGVzkG0Kv7wFuRKKVrItD
	Ldh8MhqgcePFROpPW1Q2zJJCPVGiIfcxCKl8maAH/CUi6L22ChRG6y2YkayMz1tx6T+gRlz6EznFA
	Sv39XaYBOv0xF9S7WkXU0jepYRr3qWbodeEdor4PuuritZucdwv5kCQQuiC8de8VkvPLd9JO0IECm
	xdcSEMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxtT-00000000Iv6-0iOb;
	Thu, 08 May 2025 09:50:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxMU-00000000EN5-1GTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:16:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxMN-0002ns-0K; Thu, 08 May 2025 11:16:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxMM-001hZc-0Y;
	Thu, 08 May 2025 11:16:06 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxMM-00042G-0L;
	Thu, 08 May 2025 11:16:06 +0200
Message-ID: <ee4e3e521434a0dadce058e7e5f3bbd77f598f90.camel@pengutronix.de>
Subject: Re: [PATCH v3] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 08 May 2025 11:16:06 +0200
In-Reply-To: <20250507-b4-upstream_ospi_reset_update-v3-1-7e46a8797572@foss.st.com>
References: <20250507-b4-upstream_ospi_reset_update-v3-1-7e46a8797572@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_021614_337106_FA54C111 
X-CRM114-Status: GOOD (  20.32  )
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

On Mi, 2025-05-07 at 18:04 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
>=20
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v3:
>   - Remove previous patch 1/2 as already merged.
>   - Keep the reset control acquired from probe() to remove().
>   - Link to v2: https://lore.kernel.org/r/20250411-b4-upstream_ospi_reset=
_update-v2-0-4de7f5dd2a91@foss.st.com
>=20
> Changes in v2:
>   - Rebased on spi/for-next (7a978d8fcf57).
>   - Remove useless check on reset.
>   - Add error handling on reset_control_acquire().
>   - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_res=
et_update-v1-0-74126a8ceb9c@foss.st.com/
> ---
>  drivers/spi/spi-stm32-ospi.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 668022098b1eac3628f0677e6d786e5a267346be..b2597b52beb1133155e0d6f60=
1b0632ad4b8e8f5 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_d=
evice *pdev)
>  		return ret;
>  	}
> =20
> -	ospi->rstc =3D devm_reset_control_array_get_optional_exclusive(dev);
> +	ospi->rstc =3D devm_reset_control_array_get_exclusive_released(dev);
>  	if (IS_ERR(ospi->rstc))
>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>  				     "Can't get reset\n");
> @@ -936,11 +936,13 @@ static int stm32_ospi_probe(struct platform_device =
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
> =20
>  	ret =3D spi_register_controller(ctrl);
>  	if (ret) {
> @@ -983,6 +985,8 @@ static void stm32_ospi_remove(struct platform_device =
*pdev)
>  	if (ospi->dma_chrx)
>  		dma_release_channel(ospi->dma_chrx);
> =20
> +	reset_control_release(ospi->rstc);
> +
>  	pm_runtime_put_sync_suspend(ospi->dev);
>  	pm_runtime_force_suspend(ospi->dev);
>  }
> @@ -993,6 +997,8 @@ static int __maybe_unused stm32_ospi_suspend(struct d=
evice *dev)
> =20
>  	pinctrl_pm_select_sleep_state(dev);
> =20
> +	reset_control_release(ospi->rstc);

It would be nice to point out in a comment that OMM will temporarily
take over control during resume. But either way,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

