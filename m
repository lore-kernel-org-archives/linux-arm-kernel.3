Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C432FD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeinyN/5Nec/44C5dTybhhrHH4wmAkP5DqVHdTtI3c8=; b=ODaRMG9cVKhpyqDmzBU2A/K9yO
	ztb1Y2BvyeiPE0gIeXFjD5cohv29FsRFDCuce7hdpuX1exKzspksRWHtte9yOuv0T6/8uSqIeGtu3
	W53i92tQWtONhpe+Kxqtk0eAW6cShoum92p7btTqJAZTaVJyQlbczuvDw6IAz/aOW2f3N9wV7idAJ
	qhq2itgfJyg6ex0PaUX+Gj/E6WjuXFj2ae3f8/VqMXAaSdQWBrXs/Ru3S4gKgfw1XildS01squ5IB
	ebMFeicdS4S9Ilv0TSV22nP01lfggNDvLwGXAzBXQH/uhPxkt46EeuU70ShImTkFdXMUbYeZEsZ0Y
	Ky26ig0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t9K-0000000D7JB-20Of;
	Mon, 04 Nov 2024 09:13:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t49-0000000D5jf-20Hj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:08:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so488885966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 01:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730711284; x=1731316084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeinyN/5Nec/44C5dTybhhrHH4wmAkP5DqVHdTtI3c8=;
        b=YYoXUQgiLbigSaqWtqMJtROvmTSgN25ZPloZn3CYordFOORu/l5vyNCKMnpSXQTear
         VSg7T5ay5l5G2ICDAAlR8XogJP9aVGHZz4jGHF2SThvz/wOeCCMEB2cZSDlKKyJkLdYa
         0dy0idNlGCEq7iC1HLeKjRGgDMqFHxN5QqWmI8NmiNLndqmPLmSi+5WYZGLsgTSkLpfQ
         Fyx5F2RVXKlFL7cvlgoRYRHZiqFD8NlQaMB4IyDiD+qblnokzWj0irdsa5v9x3Ztm9nv
         ybf2ZBS4YQbZ2Jd5ZmFdZfMhj4Twd9T+RnBaKTrLiEqK9XX6p6H16P7SfIOx27Jbnnam
         mFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730711284; x=1731316084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeinyN/5Nec/44C5dTybhhrHH4wmAkP5DqVHdTtI3c8=;
        b=TE1i1KYHgZvRGHMoPbdMELjStsdcgH2tOY3PyZimFnC1kXn05e7MlV4vKoaR29AY/U
         f3Fu2EiLbpdahtn1PDSoKnzOdUiZYiNEU3XCLDwwrPa3Zg+UUEQAr1ZCyT36tJvoiAp/
         QLJUKd/SN0m7Gi0olTIa48pmDnSxxipvJV6U+lHoR3T8kXuIjOKjPzim+SmdWhO6wm9w
         Kifmf8PwWevN3zZhQnhJFifYDcAtdnYMwHBL6YWdRp32ODFGKjPIuDeZFEL7uGcTnrjV
         2nfeWtu+kVFhyB/l+8O3+arOgJCTdGkv0G6N0Wjd49LoMBxFbJgJ1dtOy0r65Lhl+7pq
         i4rA==
X-Forwarded-Encrypted: i=1; AJvYcCVdfTxbXqbJ1pwqhSNVyOBgA2d9GmSyF5kO3C1HDdLD0MxoBYr6Z8kPGpDz4i1CKj7XxbrNQdkOjgqKPDRvrY5B@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo6V8pli3dfwISwvIEXQuEoIkr2PFVSzbwd/Q+EOd0XyjMb330
	9yhiUIVJPwRQB0TRp/XHhexxICLAG+B8fuRZv+AzWyLPTT1QwOGymEYNUz5VE34=
X-Google-Smtp-Source: AGHT+IHbjqQG3EbTVZChskg4oJ3EPibMoamir516XriRk8GBfxJS4NEjIPq5u7GVGdstesR3PRimKA==
X-Received: by 2002:a17:907:1c02:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9e652c179emr1170000866b.0.1730711283666;
        Mon, 04 Nov 2024 01:08:03 -0800 (PST)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e563093e5sm523477966b.0.2024.11.04.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:08:03 -0800 (PST)
Date: Mon, 4 Nov 2024 10:08:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 1/4] pwm: meson: Simplify get_state() callback
Message-ID: <ll3i664yuojtueo5c5uzclduylbrjxf3r672jjb5hgtbslx6jj@fvcefnjftqmq>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-2-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gvh7qusglqyop6c6"
Content-Disposition: inline
In-Reply-To: <20241016152553.2321992-2-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010805_549256_1BC46963 
X-CRM114-Status: GOOD (  17.91  )
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


--gvh7qusglqyop6c6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] pwm: meson: Simplify get_state() callback
MIME-Version: 1.0

On Wed, Oct 16, 2024 at 06:25:50PM +0300, George Stark wrote:
> In .get_state() callback meson_pwm_channel struct are used to store
> lo and hi reg values but they are never reused after that so
> for clearness use local variable instead.
>=20
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  drivers/pwm/pwm-meson.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 98e6c1533312..2ef632caebcc 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -310,6 +310,7 @@ static int meson_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  	struct meson_pwm *meson =3D to_meson_pwm(chip);
>  	struct meson_pwm_channel_data *channel_data;
>  	struct meson_pwm_channel *channel;
> +	unsigned int hi, lo;
>  	u32 value;
> =20
>  	channel =3D &meson->channels[pwm->hwpwm];
> @@ -319,11 +320,11 @@ static int meson_pwm_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  	state->enabled =3D value & channel_data->pwm_en_mask;
> =20
>  	value =3D readl(meson->base + channel_data->reg_offset);
> -	channel->lo =3D FIELD_GET(PWM_LOW_MASK, value);
> -	channel->hi =3D FIELD_GET(PWM_HIGH_MASK, value);
> +	lo =3D FIELD_GET(PWM_LOW_MASK, value);
> +	hi =3D FIELD_GET(PWM_HIGH_MASK, value);
> =20
> -	state->period =3D meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel-=
>hi);
> -	state->duty_cycle =3D meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
> +	state->period =3D meson_pwm_cnt_to_ns(chip, pwm, lo + hi);
> +	state->duty_cycle =3D meson_pwm_cnt_to_ns(chip, pwm, hi);
> =20
>  	state->polarity =3D PWM_POLARITY_NORMAL;

Fine for me if you drop the local variable channel as found by the build
bot.

Best regards
Uwe

--gvh7qusglqyop6c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcoju8ACgkQj4D7WH0S
/k7vqQf9EAur5SOfIWCiCkCZxW/Scb5JUD1k+pcoodOq/QAeYaAQXNkffAIjVnkU
Z4y1vJ8j6gQr/WXYQdbOQ4Qj7G5m9DJQmxyYdv0Cog9PKmAmVyHGLmi+zxGJ+kZb
Dq8JuERY7/Le7vPFWFwOhpq/1n5gnsg9Dd7ZlA/hN55VL3cWXft9eVBj5e8DGBym
qN4tnX3Hz494Bm/71xJM3D311Vaq6HYYvXdoY9HzFaNXh3mvJHqgB3ysekBRMt3f
RCyuCe0yQcwKsGqKLJmNJOzxPgx0Wpmdv+qcYKv50Ubr0sTs4HPhSnYYEFksu3IC
IuJjdsPpo1Ts5mAkwLAFdXzdAR9pXA==
=NrRk
-----END PGP SIGNATURE-----

--gvh7qusglqyop6c6--

