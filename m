Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3B9D44172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYjRt6aAXmLduNc3M0AhX6eJNrQcUOwMqW4r+1xGqhM=; b=FT1EY/+eToOyi8HghlbSYO55Nk
	L+D1CVbN3l/lw8v83XNbAK4IIa15b+DRQ4VnTQkEn/2h7qf44JYpCFd/L2ApfAnc2BGK10thwZDPp
	1b7qGe9yGQnAy5SLRhEQGwVuVmTLrBqSa/uakObu2c9lzX3vJc6If6AWjYe5DjLlz4YkO7eDtquJY
	wU8hdEdhkgTr/z58uEySUy/c+O1fu1e8t3MFE4byHDMMM3OYus98NNPqMv5TR1omRwVQTEbjfH0KC
	IYBw8+DJI4WmoJvQQs4b2xJDYPhBnXHPuzA0+VHrGMpDEQkF+Kbrft5C5l9vh66fz51rztELKPnh8
	1CjKghPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ2O-0000000CqDj-0xRx;
	Tue, 19 Nov 2024 15:21:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ0h-0000000Cpll-3wpg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:19:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43193678216so9951235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732029562; x=1732634362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MYjRt6aAXmLduNc3M0AhX6eJNrQcUOwMqW4r+1xGqhM=;
        b=Dmn0IYfjoZDZRpSgskYZ19Wm4s2Lenfnxq0i2f/KcvObIPywxME5CCEC/IK32ZN/VN
         6R4Y9Sp4APxHTRKmFdr3HjS9UzHm9FzLRMsrIwqU3jwY6XkC5O/SirTP2gzQQYOvfYLz
         pmAdQaxJjvSyV8l5yB8bRoh0g0zNaFTWKUkwNnAJo51ynQD1WbamssfsxbY4pwQXg+W+
         DzfSy0hxvbXjWKaSy0cfHLbPMVbyYwIJH/IGwTjXswZvWACOGgCBox4FLHH5VcU8d9Kz
         HbaBRndc2Vl58PbxT477HZf1isv1ez9DtVSfoMWYZlNFflQCjn7xh/wx4ELR4UsthgAS
         r8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029562; x=1732634362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYjRt6aAXmLduNc3M0AhX6eJNrQcUOwMqW4r+1xGqhM=;
        b=Tlvnl0Rgwj7mROk6FwS2bq23Rx/830VpuN0CMa9VZIuxxA2nn6uFOIjghKucxLphwf
         je51n7wgvkAkZG3uZNZUb8Tjs5FhpwniAuXfTOekgreiH3+B1/HOHX3zBqYhkMkrxU3c
         OsL+yeXbtIc2wMuh2AwrYOZ8kI36nQkiBwfw41uq8sgj79nYwVQSXexkr/Dix/c30j/0
         HCh33DkOTkoG4nmW8z3T0pp3PT3YbkTPU+OYv9RYqUk+VWzpGLuBwZQKouHyq18re2dB
         JmF4IWOC29PBQhOWy9ME1rM55dpIwKPoejUyCEM1feJYE7xVKOoTFCBMU5eW8yYTqqAx
         RUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTSqc92c1JA/eN7sYlu2hJPK/G9hEoSvbN+ggz3FkDdewToo50cckApLsXRVWh36yZvNv+SgA5F4NnfBGXV894@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl3yATGBf+x1yXfbTTW7zPkTkPyqlNXzQ6/uvE9WKhNQ9xerpx
	QJYV87GYoA1IurJFeBlA2VZ/GbSuuUwYTUPxzsKI5sqa5K8laNzA5PNo+9U2oDk=
X-Google-Smtp-Source: AGHT+IE06JOv6iPIXo45XJ7NZ7v2VX2jdRE9SZJkOfZPKGcIoNUYJ/Eqqb17OBd17sK6rS+MKmE8PQ==
X-Received: by 2002:a05:600c:1f0b:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-432df72a4f1mr147121875e9.13.1732029562335;
        Tue, 19 Nov 2024 07:19:22 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab789fasm201173905e9.18.2024.11.19.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 07:19:21 -0800 (PST)
Date: Tue, 19 Nov 2024 16:19:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
Message-ID: <fbafp4qvf7xq7ob7pdtrps2bgk7n5azcysq4jpqhwxtxxhyt5g@kq763dnqkk7m>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
 <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
 <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
 <l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5>
 <ed5cdef1-aaa7-4ff3-a427-87eae4c90f18@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujldv2oqf45x6kez"
Content-Disposition: inline
In-Reply-To: <ed5cdef1-aaa7-4ff3-a427-87eae4c90f18@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_071924_246418_0D28C456 
X-CRM114-Status: GOOD (  31.48  )
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


--ujldv2oqf45x6kez
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
MIME-Version: 1.0

Hello George,

On Tue, Nov 19, 2024 at 03:51:34PM +0300, George Stark wrote:
> On 11/7/24 11:41, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 06, 2024 at 04:54:41PM +0300, George Stark wrote:
> > > On 11/4/24 12:32, Uwe Kleine-K=F6nig wrote:
> > > > > @@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
> > > > >    	u8		clk_div_shift;
> > > > >    	u8		clk_en_shift;
> > > > >    	u32		pwm_en_mask;
> > > > > +	u32		const_en_mask;
> > > > > +	u32		inv_en_mask;
> > > > >    } meson_pwm_per_channel_data[MESON_NUM_PWMS] =3D {
> > > > >    	{
> > > > >    		.reg_offset	=3D REG_PWM_A,
> > > > > @@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
> > > > >    		.clk_div_shift	=3D MISC_A_CLK_DIV_SHIFT,
> > > > >    		.clk_en_shift	=3D MISC_A_CLK_EN_SHIFT,
> > > > >    		.pwm_en_mask	=3D MISC_A_EN,
> > > > > +		.const_en_mask	=3D MISC_A_CONSTANT_EN,
> > > > > +		.inv_en_mask	=3D MISC_A_INVERT_EN,
> > > > >    	},
> > > > >    	{
> > > > >    		.reg_offset	=3D REG_PWM_B,
> > > > > @@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
> > > > >    		.clk_div_shift	=3D MISC_B_CLK_DIV_SHIFT,
> > > > >    		.clk_en_shift	=3D MISC_B_CLK_EN_SHIFT,
> > > > >    		.pwm_en_mask	=3D MISC_B_EN,
> > > > > +		.const_en_mask	=3D MISC_B_CONSTANT_EN,
> > > > > +		.inv_en_mask	=3D MISC_B_INVERT_EN,
> > > > >    	}
> > > > >    };
>=20
> ...
>=20
> > > > Personally I'd prefer:
> > > >=20
> > > > 	value &=3D ~MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> > > > 	if (meson->data->has_constant && channel->constant)
> > > > 		value |=3D MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> > > >=20
> > > > even though your variant only mentions the mask once. While it has =
this
> > > > repetition, it's clear what happens without having to know what
> > > > meson_pwm_assign_bit() does. Maybe that's subjective?
> > >=20
> > > Actually I also don't like meson_pwm_assign_bit() too match and I'm
> > > surprised there's no something like this in the kernel already.
> > > I again objdumped versions meson_pwm_assign_bit() vs double mask repe=
tition.
> > > Unconditional bit clearing takes only a single instruction:
> > >=20
> > > // value &=3D ~channel_data->const_en_mask;
> > > 9ac:	0a250040 	bic	w0, w2, w5
> > >=20
> > > So in the current series I could drop meson_pwm_assign_bit() and use:
> > >=20
> > > value &=3D ~channel_data->const_en_mask;
> > > if (meson->data->has_constant && channel->constant)
> > > 	value |=3D channel_data->const_en_mask;
> > >=20
> > > If it's decided now or later to drop meson_pwm_channel_data then
> > > w\o meson_pwm_assign_bit() future patch will be line-to-line change.
> > >=20
> > > What you think?
> >=20
> > Sounds sensible.
>=20
> While changing the patch to drop meson_pwm_assign_bit() one thing
> concerned me on the approach:
>=20
> value &=3D ~channel_data->const_en_mask;
> if (meson->data->has_constant && channel->constant)
> 	value |=3D channel_data->const_en_mask;
>=20
> that we reset bit in the value var even if that bit is not supported on
> the current SoC. I checked several datasheets for old SoCs and those bits
> are marked as unused (not even reserved) and I've never seen those
> bits set. Still I'd offer to use precise condition for changing those bit.
> I'll send v3 let's discuss it again if you think I bother too much.

Usually writing zeros to unused bits is a safe procedure. If the
hardware we're talking to is a newer variant of the supported stuff, the
hardware engineer did something wrong if keeping the read bits or
writing them as zero is incompatible. So either way is fine for me.

Best regards
Uwe

--ujldv2oqf45x6kez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc8rGsACgkQj4D7WH0S
/k5YUQgAunaABIHOeGpv6VDiLMddmRGSo4/uW0SrIyOgXPRNNIk5scQlObQuTijW
wAVLCBr/SS9SIuZvbqo8S7ok6kT9RtcO5SWWGRbSH5CUohyzVQeeDTRPk6DbleDv
Gb56WH4WFWiHzBpQnI49ianH/8ypmo05vHQpP5lUsO2Rnxc4uvkqrLpA3+Lf0brv
ogVDUbMmSSxGMIwm2Kj0oH7FvDLt9aoTcDAaa7DYsgDBt86jyabBVGcnsGX/AOhM
y5/3Z0eZd41DltgEZGO16RJ8IcEb57DaYcU1sxCewdmsW/4qTLZPVqrZd+jzx2A3
84D2FEaM6yRQ5pNFZo8uAY30Db9L4Q==
=lMnI
-----END PGP SIGNATURE-----

--ujldv2oqf45x6kez--

