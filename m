Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C7C5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvfjZC9+BJl+tHW2HeH5B1q6/FvCkYz1fIW9Dc4GRXE=; b=Cq12GndsOrrCCWXl5pr79qwzni
	xFer4k6Ed4G9xHSIL3ITdwoPmkyonh+HchqKf5kMbvYMttUW7UDz0+cM0c3n02Tl/s09PG22MozgJ
	UPtGgR1wIuPQTtO2QOCetp4u+intvatMU2O/pRmcWh0i0BXlgEDfvW0r6rZTKALtBpEQovmvkU9uu
	YnxNL3CaRGaYn5kPRlYAS8CGZFCoAW0L6kSwGGFTBub5/p6vJ8x15yz7ygufP/iyDrqRMz6yc8iy6
	RZ7r4ol6XgKR7lPIo1C1eA21jJhtXJHOd5oho5Y9tOY6uFcO/LzIuUeplqW35Zg/LYSDj/ibu07mq
	2Qtm4Mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruxq-00000005Uqq-1yZC;
	Thu, 06 Aug 2026 10:04:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruxp-00000005UqN-2crQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:04:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id AC0F860A64;
	Thu,  6 Aug 2026 10:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D742E1F00A3A;
	Thu,  6 Aug 2026 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010676;
	bh=EvfjZC9+BJl+tHW2HeH5B1q6/FvCkYz1fIW9Dc4GRXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9wHswZnH0VZ5WnJ6vBhnNGe69jlToiJUhWX/SkuYWp0Y6UpqTNKsrcHlLkQxf2jO
	 LhCywSbWq8veEc+5eCv4IRTK6zEjheTIclipwzEsawbLel0BJrW0UU4Rqk7AfvFh77
	 euq0TZeZfTwiEX4nT6Z+0UaD1KLcbsN9Grs0br1dTgJIIHuF74VgLmnodD9e/9hD/7
	 buG4fCodh9tcOqM8e5LDOaXmmcyAn4zsdSGioQXMLEs//5X1mn81Mp3rQ7eS6xmtig
	 FhXyWBgdNBhdnOgRkhr46HUox+C5TlnykN9oP1of1z4ZuH4uTZwem3sTBStzx86dw8
	 oGzxNPVbOix6g==
Date: Thu, 6 Aug 2026 12:04:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <anRaB--HAHoWFkDo@monoceros>
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="phnqktoz57ccllis"
Content-Disposition: inline
In-Reply-To: <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
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


--phnqktoz57ccllis
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
MIME-Version: 1.0

On Thu, Aug 06, 2026 at 02:01:30AM -0700, Petar Stepanovic wrote:
> +#define PWM_MAX	255

That define has a name that looks much more generic than it actually is.
Please call it AX_TACH_PWM_VAL_MAX or something similar.

> [...]
> +static int axiado_pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, long *val)
> +{
> +	struct axiado_pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		if (attr != hwmon_pwm_input)
> +			return -EOPNOTSUPP;
> +
> +		scoped_guard(mutex, &ctx->pwm_lock)
> +			*val = ctx->pwm_value;

If there is a hwmon lock that serializes calls to hwmon_ops::read and
hwmon_ops::write, .pwm_lock isn't needed. (Unless I miss something,
please double check. Also I'm unsure if there is such a hwmon
serialization.)

> [...]
> +static const struct of_device_id axiado_pwm_fan_match[] = {
> +	{ .compatible = "axiado,ax3000-pwm-fan" },
> +	{ },

No trailing , after the list terminator please.

> +};
> +MODULE_DEVICE_TABLE(of, axiado_pwm_fan_match);
> +
> +static struct platform_driver axiado_pwm_fan_driver = {
> +	.probe		= axiado_pwm_fan_probe,
> +	.shutdown	= axiado_pwm_fan_shutdown,
> +	.driver	= {
> +		.name		= "axiado-pwm-fan",
> +		.pm		= pm_sleep_ptr(&axiado_pwm_fan_pm),
> +		.of_match_table	= axiado_pwm_fan_match,
> +	},
> +};
> +
> +module_platform_driver(axiado_pwm_fan_driver);

Typically `module_platform_driver` follows the struct platform_driver
without a newline.

> +MODULE_AUTHOR("Axiado Corporation");
> +MODULE_DESCRIPTION("Axiado PWM fan controller driver");
> +MODULE_LICENSE("GPL");
> +

Trailing newline at end of file.

Best regards
Uwe

--phnqktoz57ccllis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp0XC8ACgkQj4D7WH0S
/k6CtggAqc2SkaT/74paCQn8c06aLqh+ZQkQt9kOhzsh+nqXBbzoUpyzYVbZ1qKf
KljBTvQZl662s+bADLObfOmJraNBFmm4geuKju1SwTtb4306Vq9YyVCz1QNSlcVz
IGmVDdNGZFpIOa9TpCH6yxDwpSZG0NS6s7AphknUn7pROhVDFGgPAKuU99SxGicj
63kSmknKODrbwIQZNPNQcVGHHwMzbHL8s/cY5KOxhHir6ZcjnL8qeuKVMagPeI1b
4o4/N2UiUDomVIp3Uyj3R2sUBzN+TjtbM+KWQKGfPQZEWanKRDdoo06r2w4yJkdd
p3w5vHhYuCUQi44Swaz41xcqITW3sA==
=Mni6
-----END PGP SIGNATURE-----

--phnqktoz57ccllis--

