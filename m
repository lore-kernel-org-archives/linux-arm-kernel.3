Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBBC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5jUCEkf9yLnafQe149Ub/uGZIIw9CugVMd5LhvprM4=; b=D/hrr2oqA1q5xrGrJqcBDymAN1
	DL6JJ0BgbOzzu5DkdLOpK0zTW2S5Jqtlqkd+jGIHroeKrk2/RfXJmYGOa03j0oyZCV/4hGFo7zLzc
	toHszx7wXSl8dhCuloN2I2TCCc1Qksk1ZJUqyK4BsrLEht6I6+ZaOO7LQjhY1qjXahrdnfNaHdoc4
	uzJM/cqJblidGEUDPdzFZjMuMspoJgnfrW6w7ex1GF8+A/J/Tp7+eammoPIXtLYTpYykOAi58Rm6q
	xMcY5Q5Z63TVFjeI2yhZGLWx40YW58kmPqR/M49FuEjW4K8zhj1f0hP3mAuzAXErf/FB9pcRH56NP
	WNe3JpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CZn-0000000H5A7-1seE;
	Sun, 20 Sep 2026 08:07:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CZl-0000000H59Z-0fdi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:07:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55hbg2097755
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e5jUCEkf9yLnafQe149Ub/uG
	ZIIw9CugVMd5LhvprM4=; b=Kty1hwW416uA8gajdA7yNh0yY+XBuf1N7vMsN3UU
	zxxkWksof4NOoXgHcirirZU6rUOPJlhCeVnM5VolI9KftZO1xKVU+aimHRjYN7BQ
	eGkvzUlwuf2rnRAQuMwBwjJFXlhIHtCI+bwySg2c4ZkOhUjog6AQgKE8hriAR5z1
	uWLrjPkPBUo78q/fGFEY/yVx+TbYOO9LloQ8/Egwj0g+gkh2ndhR5TRsxSqWOi/B
	7Z9oNZ5AWCJ4k3KJp0P/wWh9clA1Uyz0Y9ixKmOdLjqiUrIdpXjl4W/VsBs8zGsb
	WDkNsVtuFtlQ6Mq32mKXR+euyskVuwluBixrn/UM981OXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxtm6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:07:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso321955985a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789891623; x=1790496423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e5jUCEkf9yLnafQe149Ub/uGZIIw9CugVMd5LhvprM4=;
        b=F/lU4oNJGz2df/Ae+cJUVGtHyHfoDCzc1dJqjWq174UyRoXfKQFSOo58OPm7DkMGt7
         uswyny2fQfYBR/MkP3o0eBLuIOuUpU4kQEDfXabJXDHR24PGkZ60O8VJZwQZF0KAI+ZJ
         7IRrtmh7jaSqu01AubDRrOi7QQtFDlhCEuN3CONE0aJUsDgd3dWOQWdCbOtVE2TlPszz
         lDIWkcAgkvn7aBRAavqcPInj/Lhg1XO/FKjFgGLUXJazs/GY4CDERXA0QUGBHTdsHq/h
         Qs5bzdfrZIcSdX9jTUv/Cvq1/WQxrStcrL6gH3Vc9YRIfCWa/B8QHxqlZUXBlLqHLp65
         hhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891623; x=1790496423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5jUCEkf9yLnafQe149Ub/uGZIIw9CugVMd5LhvprM4=;
        b=phHQmbYIrxwDd41nHbEAW7w7AS5u6N3u1ARGu/XishszWo3I0nqtdXel1KACqiWdl/
         /+TqHREePHprve3gI0AKm16PYDAyvEq5MgqgdxBqOrfrIKtrpL6jgL88eDk+hXv/6sJI
         LXpqzk+x6cLzu7Cbkr16HbpgFgLp+83pHRRD+qLt321Dj8q6T5gKdcanqK81rC4sTgT4
         60CHzZO+S1Lktlevy4fTXJnwRHqKUl2BIRlWUbmbfOCUxB2QAdp+TFawAkdhj8675UiO
         JvyAqHp6WqIba9TcT7tpTklcKxvOKxTQBMu7YNqLWLzLMPY7FNZn2Ps+AsnvSM+kLJce
         TqAA==
X-Forwarded-Encrypted: i=1; AKwUvBz3hI2TUhkliUVHpiB7Fhhcj5z4VdDBpvL8U/oJl5JIcmOqDfQoWYNywjnonlcCTE/ia4mbTe9GbDtdQm+xb6kx@lists.infradead.org
X-Gm-Message-State: AFuF++kH3nwA568ly2eh+Mes0chZxTZaha1SMn0UlzRz8wDExC9iWu2W
	LEVy+P1oeqblc/dBDvbb5iPk12J7N/eC6aOeOIjYPRhEWnkkOwqmSJIAKkXyg/ReKbcD30e5aN9
	UHZb1b5wN73VT1xqwJ7ecN5polbu2E5RozzQPxlRw0AUKDAgV88LmOKeoBaXViHAvmjuwiZj5SZ
	IblA==
X-Gm-Gg: AYBFou3YWbOfATRQ8cbNDaUZU+3b2ipM10yrmSJo7wuw3Kw3h7/rlTlQ/wn39WUX7Tc
	RyDPxBKeBfemrm8YL8KXob4d5kkR8NGhruMxSqIspDNJfMhlhFfT3HxuNpA1PuLK/YDejLv+mbG
	Q4Ujfxq+O9edy+lUJjcgJf7WaXxcXQrE6OhbpCeV8Z3u0dLa/4kGObnn3uqlJNMpjNITGPhG9+c
	scK/RZTH0Bat9tCS2mY1Yx8Hg1ZRyWnJAPMbE94MO07/s+hzbmJy+JSP1gJ5gqjp0DxlVRetv3j
	NFeGpojXrYZUqKV+u6XcnMzJSFqvJ0Wyc9MImaW/fMWoMjfSjeTgPAI529eHTjM/4XOjSS8HSPg
	yvJg5tmkj3O5Bog==
X-Received: by 2002:a05:620a:2311:10b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93bfb3c2d27mr213525485a.66.1789891622767;
        Sun, 20 Sep 2026 01:07:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2311:10b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93bfb3c2d27mr213522885a.66.1789891622276;
        Sun, 20 Sep 2026 01:07:02 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc55cd8a8sm196415225e9.0.2026.09.20.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:07:01 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:07:00 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: request the MDIO reset GPIO only once
Message-ID: <aq-UJEFIq2aHfEee@lore-desk>
References: <20260920054703.1897755-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5yyGVeVacvTbMRAa"
Content-Disposition: inline
In-Reply-To: <20260920054703.1897755-1-xiaolinkui@126.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf9427 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=ROrK7FBXa46LgAKx6Y4A:9 a=CjuIK1q_8ugA:10 a=3qf_Ru5Olzpm8D4UWuwA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExNSBTYWx0ZWRfX8g62gLXSMmaz
 GzJZaeIQ9e2rH+rp4bxbAOuiflOx2nXAbFcRgZM0e5JkFp133tDslU4+gATc8tqjrhC3Ai7HR1G
 hdewIVjcCSQmnGYRxskXy71ckeRLlTc=
X-Proofpoint-GUID: Zbz7AXXufeRLRdDCSQ0msLbQOrdsoaBd
X-Proofpoint-ORIG-GUID: Zbz7AXXufeRLRdDCSQ0msLbQOrdsoaBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExNSBTYWx0ZWRfXzrFTnj8zxTfQ
 O+CP/dAAgfT9XHrIOxytmBRLFbjvH22lgQWDMxl+ytE8MOpkjx+E3voAYodzBxdudkgiSALO1Mc
 Ma27OR0t5RmlDqsMVRVzw8PnYQl/s4pX3GfY0ALC4uvraDQIYU0z9pyN9S62USf5VHDaZdV+x41
 ZnEFSVevwXxJAG7UPX/fbqcAd1PvjQ98yoor1+4kq+gH9NR3gH5+EUyC+6qYpWfzrTtKD4aauqA
 dvohXqwX4iLCzNeZkoO2UV+v8vOiWrpxBKmEiYFpW/1wgcBXamwq5Cy7Vbshgxqg0dtnRZfxA6g
 xZC1jBNgstNl62UPiQwW//F1zhnjw7oJdgjIoX9tIDvO09Sz3bPgMzUqenEidWeSG/zIHI4FpLp
 0oRUI1HAgXJ+G7Gb6jhYfHmSJuSVdMQj3qRxWgwSVKSmSYRPxwkELJtauD731kTEqfXULs5an/q
 skRiguf2pkuLUyELpDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_010705_337052_3E9EC526 
X-CRM114-Status: GOOD (  32.53  )
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

--5yyGVeVacvTbMRAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>=20
> stmmac_mdio_reset() calls devm_gpiod_get_optional() every time it runs.
> A GPIO line can only be requested once, so from the second call on
> gpiod_request_commit() returns -EBUSY. devm_gpiod_get_optional() only
> turns -ENOENT into NULL, hence the error is passed straight back and
> stmmac_mdio_reset() bails out before pulsing "snps,reset" and before
> running the STE101P MDC workaround.
>=20
> The first call, made by of_mdiobus_register(), succeeds, so the failure
> is only visible later on: every resume that does not use WoL goes
> through stmmac_resume() -> stmmac_mdio_reset(), and that caller ignores
> the return value, so the PHY silently stays un-reset.
>=20
> The descriptor used to be requested exactly once: stmmac_mdio_reset()
> resolved "snps,reset-gpio" itself and cached the GPIO number in
> stmmac_mdio_bus_data::reset_gpio, and commit ae26c1c6cb9b ("stmmac: fix
> PHY reset during resume") relies on that cache to reuse the line on
> every call. commit 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in
> stmmac_mdio_reset") replaced it with a devm_gpiod_get_optional() that
> caches nothing, so the request is repeated on every call and fails from
> the second one on.
>=20
> Request the GPIO in stmmac_mdio_register(), at probe time, and keep the
> descriptor in struct stmmac_priv. This is where devm-gpiod is meant to be
> used: the line is acquired with the device and released with it, and any
> failure to acquire it is reported during probe instead of being ignored
> by stmmac_resume(). stmmac_mdio_reset() then only pulses the cached line.
>=20
> The request is still gated on mdio_bus_data->needs_reset, which is the
> condition that installs the reset callback, and on the device using DT,
> as the reset itself is.
>=20
> Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_re=
set")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> ---
> Changes in v2:
> - Do not request the GPIO from stmmac_mdio_reset(); request it once in
>   stmmac_mdio_register() at probe time instead. (Maxime Chevallier)
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 19 ++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/e=
thernet/stmicro/stmmac/stmmac.h
> index 7582fca63741..986fb43db45f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -25,6 +25,7 @@
>  #include <net/xdp.h>
>  #include <uapi/linux/bpf.h>
> =20
> +struct gpio_desc;
>  struct stmmac_pcs;
> =20
>  struct stmmac_resources {
> @@ -287,6 +288,7 @@ struct stmmac_priv {
> =20
>  	unsigned int pause_time;
>  	struct mii_bus *mii;
> +	struct gpio_desc *mdio_reset_gpio;
> =20
>  	struct stmmac_pcs *integrated_pcs;
> =20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index afe98ff5bdcb..346f93f86abe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -386,15 +386,8 @@ int stmmac_mdio_reset(struct mii_bus *bus)
> =20
>  #ifdef CONFIG_OF
>  	if (priv->device->of_node) {
> -		struct gpio_desc *reset_gpio;
>  		u32 delays[3] =3D { 0, 0, 0 };
> =20
> -		reset_gpio =3D devm_gpiod_get_optional(priv->device,
> -						     "snps,reset",
> -						     GPIOD_OUT_LOW);
> -		if (IS_ERR(reset_gpio))
> -			return PTR_ERR(reset_gpio);
> -
>  		device_property_read_u32_array(priv->device,
>  					       "snps,reset-delays-us",
>  					       delays, ARRAY_SIZE(delays));

nit: what about moving even these properties to stmmac_mdio_register()? It
seems a bit odd to have half of the parsing in stmmac_mdio_register() and
half in stmmac_mdio_reset(). What do you think?

Regards,
Lorenzo

> @@ -402,11 +395,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  		if (delays[0])
>  			msleep(DIV_ROUND_UP(delays[0], 1000));
> =20
> -		gpiod_set_value_cansleep(reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->mdio_reset_gpio, 1);
>  		if (delays[1])
>  			msleep(DIV_ROUND_UP(delays[1], 1000));
> =20
> -		gpiod_set_value_cansleep(reset_gpio, 0);
> +		gpiod_set_value_cansleep(priv->mdio_reset_gpio, 0);
>  		if (delays[2])
>  			msleep(DIV_ROUND_UP(delays[2], 1000));
>  	}
> @@ -608,6 +601,14 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	if (!mdio_bus_data)
>  		return 0;
> =20
> +	if (mdio_bus_data->needs_reset && dev_of_node(priv->device)) {
> +		priv->mdio_reset_gpio =3D
> +			devm_gpiod_get_optional(priv->device, "snps,reset",
> +						GPIOD_OUT_LOW);
> +		if (IS_ERR(priv->mdio_reset_gpio))
> +			return PTR_ERR(priv->mdio_reset_gpio);
> +	}
> +
>  	stmmac_mdio_bus_config(priv);
> =20
>  	new_bus =3D mdiobus_alloc();
> --=20
> 2.25.1
>=20
>=20

--5yyGVeVacvTbMRAa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq+UJAAKCRA6cBh0uS2t
rG2zAP9gsrCleSZRt7ExqFD7e5Mo2sDtzXBvEdUjogUqIwHIFgEA/iL8xVFwvzmN
CrJXix3dYybHYLP1NiQCPZif+Yis2A4=
=/udT
-----END PGP SIGNATURE-----

--5yyGVeVacvTbMRAa--

