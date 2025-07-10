Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8257BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGWfNBdHoVHP4kTvUQ6WShWEYkHdudkm5fWMOhkJyS0=; b=VuiTu3vOb+TWj2t99N9U3regW+
	Vq8apzyXENez20nIZbf6+yoz0K8fuqesOL47UgVOHR+5lSqSZ9YqtJwTQsZo5Nm1dqYkB7fLBzy7X
	bR6HTfQ4o4FsYELoufS9D9K/hhV8RMqu9694Ga9atow3JkkaFFxVAuEOTAwosUaGwrvkzPtv6zzkb
	96Jk+hSdjQ47yFjTQbl9dmNe6Zg232l4jsJxSXJlfyibwtpNjCUpJ5nGix5CYZlS9UrIwZpKNd6nq
	8LMHLUWHf7Zvf4aqS1p9ViFo9si/EkBrF/sbaunP1fDivVpr1BOdtKkbI5NrnYpywo0TMMfbTC5UI
	Vczw0spg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqvZ-0000000BriO-0ysZ;
	Thu, 10 Jul 2025 13:03:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpIW-0000000BcRb-2Gyz;
	Thu, 10 Jul 2025 11:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OGWfNBdHoVHP4kTvUQ6WShWEYkHdudkm5fWMOhkJyS0=; b=RqUHNqOoepFa2HPuBXfxAAL/Ay
	w+6aKfzuDz1B9FST9JjSIXn3Od+Rb0LSLbwwXDzxu33q9bDydHWA+DjJIJG7hh7cgXS9v1ne1u6HN
	qWMijKFV+y776h2PEsTo+lXj1P4RMgtCdKAVUADIlKrZVwSg+cQMD/F9AiPiUnlP91GRVcJG1x9bF
	mvuzg7ZUBFh+cImic3a1tp8uiWQTxgIWpG2fy1kIWjxvxqqOoZlpN3NiaSZ4XGFCKdNYYLRJQJ8BV
	w5MCSFtaMrsA/7kPYyZNudLxiyE+BAZUvrY/QEayUR/K2RsQNu2f7G3cEyh9eK3dfkUwFzkIt+s4p
	Fxa35FNw==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZpIM-0004Ra-84; Thu, 10 Jul 2025 13:18:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v6 3/7] thermal: rockchip: Support RK3576 SoC in the thermal
 driver
Date: Thu, 10 Jul 2025 13:18:29 +0200
Message-ID: <4039995.ElGaqSPkdT@phil>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-3-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <20250610-rk3576-tsadc-upstream-v6-3-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041840_578104_3D59E442 
X-CRM114-Status: GOOD (  15.09  )
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

Am Dienstag, 10. Juni 2025, 14:32:39 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> From: Ye Zhang <ye.zhang@rock-chips.com>
>=20
> The RK3576 SoC has six TS-ADC channels: TOP, BIG_CORE, LITTLE_CORE,
> DDR, NPU and GPU.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> [ported to mainline, reworded commit message]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Nice that it does not need introduce another temperature table.

> ---
>  drivers/thermal/rockchip_thermal.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index 40c7d234c3ef99f69dd8db4d8c47f9d493c0583d..89e3180667e2a8f0ef5542b0d=
b4d9e19a21a24d3 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1284,6 +1284,28 @@ static const struct rockchip_tsadc_chip rk3568_tsa=
dc_data =3D {
>  	},
>  };
> =20
> +static const struct rockchip_tsadc_chip rk3576_tsadc_data =3D {
> +	/* top, big_core, little_core, ddr, npu, gpu */
> +	.chn_offset =3D 0,
> +	.chn_num =3D 6, /* six channels for tsadc */
> +	.tshut_mode =3D TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
> +	.tshut_polarity =3D TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> +	.tshut_temp =3D 95000,
> +	.initialize =3D rk_tsadcv8_initialize,
> +	.irq_ack =3D rk_tsadcv4_irq_ack,
> +	.control =3D rk_tsadcv4_control,
> +	.get_temp =3D rk_tsadcv4_get_temp,
> +	.set_alarm_temp =3D rk_tsadcv3_alarm_temp,
> +	.set_tshut_temp =3D rk_tsadcv3_tshut_temp,
> +	.set_tshut_mode =3D rk_tsadcv4_tshut_mode,
> +	.table =3D {
> +		.id =3D rk3588_code_table,
> +		.length =3D ARRAY_SIZE(rk3588_code_table),
> +		.data_mask =3D TSADCV4_DATA_MASK,
> +		.mode =3D ADC_INCREMENT,
> +	},
> +};
> +
>  static const struct rockchip_tsadc_chip rk3588_tsadc_data =3D {
>  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>  	.chn_offset =3D 0,
> @@ -1342,6 +1364,10 @@ static const struct of_device_id of_rockchip_therm=
al_match[] =3D {
>  		.compatible =3D "rockchip,rk3568-tsadc",
>  		.data =3D (void *)&rk3568_tsadc_data,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3576-tsadc",
> +		.data =3D (void *)&rk3576_tsadc_data,
> +	},
>  	{
>  		.compatible =3D "rockchip,rk3588-tsadc",
>  		.data =3D (void *)&rk3588_tsadc_data,
>=20
>=20





