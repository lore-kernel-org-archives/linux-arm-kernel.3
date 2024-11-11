Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF023D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+TpjgBVGRmeOwgTGMmxF5i16Q5dwmhLR/v9pNyTtPQ=; b=OMATJ7860oCflLGFQLbSj06NEX
	PJGhyB/u44WVqTJS6s+22A8h6pxNlM71TI5sS7eSiuvrBE3b7O4R47txC7pM/ieOGhZK87DiRQq3j
	QtD8saOAkjmXqufKMbOHILDr1pCcJZtfO5xJ/YpucR5CwR/6MowkA1/rj31Gbeb10PXV/D3QpMLzy
	8n5efjDYJRIQ4sB3yY8JCR99di/aqv0LY/MfUXi+1OXT6RSc8KodcyyOvfF3akV3SN9s8pICEriMs
	u/jD9Cs/ocqXvnlo87v/DGwu/HZk4GkX4jHmNmzrxNE9JXMuVbGWoHY52mgFBY6YOJcA7A1k0d0H9
	ZkZhcB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcs7-00000001VRJ-2XkM;
	Mon, 11 Nov 2024 22:26:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcqK-00000001VBj-0jHt;
	Mon, 11 Nov 2024 22:25:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1731363901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g6Q6lEqRF3mAMWuHhrROQyDor9bc0B8R2f6QV2vno0hePCfS7IwZnDd2FbI/JAiMukYqqSV5Wv5sCxhkoBHLaNLOKBn01yz84fMYoG8ocMb9cioUIfmq4dmLLJW3VIqwLXCS5xkohadK0sm36HdkvCjMQi1NjF11pixcBtQOLLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731363901; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y+TpjgBVGRmeOwgTGMmxF5i16Q5dwmhLR/v9pNyTtPQ=; 
	b=DkKY/zJwjUhmMFxjHBc+OA/TAAAmfUwwy/tO91kD2to6aPMIn2A1UpTEcGQEFFezYQNKRYABgu3mFTYHR5otYGbgcLXkOzbAAj2EwxgXdDqAj7yxhOJlNFhLK4dI3a7aLFXkj1NLtHoIUQAbW8U9A+JiYU3t/rvI9fFX8T246xE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731363901;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Y+TpjgBVGRmeOwgTGMmxF5i16Q5dwmhLR/v9pNyTtPQ=;
	b=EmVmzz4IwInYhyy4PLojruni4yPVHzr5eE4qHwRTj1XALaecYb+morKRs0aJc8sS
	GOkGG/p9WC0OrI4HXwVX5n6SLkkVBRaqlTKj9M7S0wmIja2wb4nuRSB/v+xbDbIV7pW
	vGC7BAcTwvFYUkrTA/O9FPm6kYHiRLfDlf8vsitg=
Received: by mx.zohomail.com with SMTPS id 1731363899386675.8494422225675;
	Mon, 11 Nov 2024 14:24:59 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 835E81060457; Mon, 11 Nov 2024 23:24:54 +0100 (CET)
Date: Mon, 11 Nov 2024 23:24:54 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
Message-ID: <pf3objqv5sh6me56iuvdm2rq2q5rpibgy2zjaj5aj3u4het5ua@37ztk34zrao6>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-2-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6656zhf2jq3tyeo"
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.294.59
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_142508_307768_C6B4F6FC 
X-CRM114-Status: GOOD (  16.45  )
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


--b6656zhf2jq3tyeo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
MIME-Version: 1.0

Hi,

On Mon, Nov 11, 2024 at 10:34:09AM +0800, Ye Zhang wrote:
> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpio/gpio-rockchip.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..71672d654491 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -26,9 +26,15 @@
>  #include "../pinctrl/core.h"
>  #include "../pinctrl/pinctrl-rockchip.h"
> =20
> +/*
> + * Version ID Register
> + * Bits [31:24] - Major Version
> + * Bits [23:16] - Minor Version
> + * Bits [15:0]  - SVN Number
> + */
>  #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
> -#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
> -#define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
> +#define GPIO_TYPE_V2		(0x01000C2B)
> +#define GPIO_TYPE_V2_1		(0x0101157C)
> =20
>  static const struct rockchip_gpio_regs gpio_regs_v1 =3D {
>  	.port_dr =3D 0x00,
> --=20
> 2.34.1
>=20
>=20

--b6656zhf2jq3tyeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcyhC0ACgkQ2O7X88g7
+po2UQ//SaaGn6KvUKLzfv6DxDAi3EtbLuUg0+4X9iyEI/lQ46DQQzLZ3dhoa6vp
Pg5bjpTppFJq4ZAh9ANH6ngoXPmmE8GHq0lVca2cJFQHW7nPb5Dr5ffgtLiC720Q
Y/ZJBMlFQ6cCy0jftIF989pUD9q+tuP6rC1bfFjpW23a/vD83bvraRKXf/shonuZ
REM5GxHugB0nQrXWEFa+45zmE1IBEgikI+/g4rgc/JNsAlL1kgZHkfVCVqHqx0GF
5f0l00IOPTQBT1nc2G9dk3yARdOGx7zLWidD5b7tS4uwY+pKBBE6VzwqEoPSHWI+
aQkH7RZ2ljfcbjhzV9KpxgxTKKJzz/uaR5lsUJuHnHuk5bniTrp5xaVEQZaQRutW
csnIMrSZJZekyFnMASLY7uG+Een/8/8qQfGTjkeDTtpKqBUJ7HfWv1u2R2CZWAvM
Vw7U5wGuFlhRjuNQ3UdCVA43duIcVR8Aljd3a0LxqpgZzjEf7Jl0UmN6M42S3PKl
tpDxcOKAKcHeA5FsHrS0pTqQjFz7oCrP17mCmmvmLsSUkhuxg+NOwDYrd/ZKH/8k
Lo9b+bjWe7ajZoW6I9ndV2hOejdWsE6/5cGKI0VHdlEoURlooeL8iMEMiz+HjEub
zP5zTfdXeop/eXdOCGNuBcnlbC42Ubf3uWnCyjj+QlY+vHagkno=
=zlKr
-----END PGP SIGNATURE-----

--b6656zhf2jq3tyeo--

