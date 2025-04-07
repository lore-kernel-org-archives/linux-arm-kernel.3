Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=; b=tPTSUOvfpiJ1CB3vSrOnXufWS6
	O8mrTDOv28QGGFXQ0Ip3bpvvHaWhZTkxNSZJnjjfOO48ekw3aMHvx1kcl1KjryNnvUDIsl5MPzbnO
	zxeQJraExcrv0ayT/oe9A4XsncvfeFYgL9YDPB7eVJVXsDUqMJnBwlwW1RsuNzVoZZmsTVx67DCz1
	9ixF85HCrnKjrqHAdY55xmXpy7Hg3xK8fQUDLIHGCQpvAKVFNSFuIYxqnL90SNmambX/Tozr2Fodo
	Hh0oW8BAt7z1lSlyL2GcdV1FNy5uYs6CSJmCGUK+/HzHN+QfOVvvgAZ0HJex5xRJkG9LMwMzDrbe3
	fq7/4Dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jgP-0000000HN1A-1F4z;
	Mon, 07 Apr 2025 10:26:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jed-0000000HMis-2Q7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 10:24:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so24069315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744021473; x=1744626273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
        b=ytYZmraUDRMRIy9WauJSBFhD1vwbFNi25k1jORCT+zSJoTmanalsSiIsqyCupAlXFg
         gJ7Z6PQ0BSQZm1oS3gfhaPllZk1OjMl3xE8tYVoGLSBj8c3JZJXrHXzA6z5F2M0XfYtM
         fJQFgNLSRtAVG5zBDYaUI2702p4Vp4JDNL61KP9C1fWL1Tl2QVA/QjDID5LxIx4NMW/Z
         GOkDKYC9Ij+7G+Ij+bSk9YRyrUHgnmFPUI9LIyHIWPGLI06iCLsLnHCHjE/YqOC6bTzg
         H/21fI4I/fDdIaP9QwCa0+6RiEMnnphBePgXfcBtdTqRroR083f0iUYGluXtz6oivNL+
         2+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021473; x=1744626273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
        b=tBgpSZKOtl1A3rvQ3t4Z55II1KbDdMH5KcV5qxpCqOB7iBDvbYg2uXmRPzEXmBVZnq
         sRr66v1JY81D+YtCtkwexVHB87RpwSeoU/fuUMZy69QX3fOQWWLnYV5fSgmMSAoGNX7Y
         WY6/IylqTc/Hz6fEoQRygS94bF1nghQR0AV/2crkpuZ8wrG5FZ9cukoygGgFFgOUwIoy
         e/MDGhIxsUqAHkuls9UWH5l0E6dFZZRLvqEu3UD+GiidQtraVrGCa7d4niHHWRv5M7Xc
         lQcmWDCwFO1jCFeoy28FZRp8WcUGR0J/wBXrzWeVXOZilOBVkzJTuiOpCaJCDrEYVdec
         P0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq48lGWzNena7n1Qb/gNrW40IzGTa0oFD+u3aNxRQxNyqAWzSHf1k7CN985agUA0sEHkwOyWr7XDyCJVj4LEoa@lists.infradead.org
X-Gm-Message-State: AOJu0YwUVhAAta4GSNU+KjqLK2uq0I/104s4S1FEyQgC5/J19Zy/t90P
	ravIiXDyf9jBZukRKqMQyApaNz9cTlv7GoMOMP0no+u83sH/1InZu/NYRw7ixHA=
X-Gm-Gg: ASbGncsG7UQbIY4kV3cvvFlYSFVNgmvw0RezCCW6KoJPxzE2RwR+/qUKY6Pz6n3nDU9
	JjFCc0WxBk6lWg7s9Vvbf9OnPQzHoIb5kxuLBUnTg2kZxSuPj9vSxp0Hq5NpTBTbvg9Iz17UwX2
	kPo7au62f+5QazqyZcMNpVF4i4tRNPbnG9G8jEFD/blkX/HPKbkuMrJV1mlgoUPsjqMUdNK/w23
	C5ntvXvZ10ZW2avQmYWBrHzPZZMdXoLNDZnUSOOuQwAuYb/oWcH3EhDAwmREQjBbEIhiYs9wmFA
	0yO/8u+srzv5BSCu66ifGbY2pMIR8vN4gUnVUn/eI9fAzeaMkUhRES4EEhOyUIOaHXh+n1tgYQI
	RJMLvVzSdzsI=
X-Google-Smtp-Source: AGHT+IGZWuoPqI5GhADsQ3RuS88slV6GMK9gadfCiV0+cI0VoYQJ9/cpeSLu1FczN67nQ6IYvyNLEg==
X-Received: by 2002:a05:600c:4f05:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-43ee0664696mr69308895e9.12.1744021473550;
        Mon, 07 Apr 2025 03:24:33 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d753e48f7sm5409639f8f.4.2025.04.07.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:24:32 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:24:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
Message-ID: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c76mue3amd423vde"
Content-Disposition: inline
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_032435_810434_3CF05736 
X-CRM114-Status: GOOD (  19.54  )
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


--c76mue3amd423vde
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> while working on character device support for PWMs I found a few
> inconsistencies that are fixed in this series. After that I plan to work
> on getting the character device support into shape to get it into
> mainline, too.
>=20
> While some of these patches qualify as fixes I think there is no urge to
> get them into 6.15, but given there is a bunch of such changes I might
> send them to all together to Linus for inclusion to 6.15.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (6):
>   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
>   pwm: stm32: Search an appropriate duty_cycle if period cannot be
>     modified
>   pwm: stm32: Don't open-code TIM_CCER_CCxE()
>   pwm: stm32: Emit debug output also for corner cases of the rounding
>     callbacks
>   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
>     rounded up
>   pwm: Do stricter return value checking for .round_waveform_tohw()

I applied patches #1, #2 and #5 to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

I still havn't made up my mind about trying to get these into v6.15, but
at least they should be included in next for now.

Best regards
Uwe

--c76mue3amd423vde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfzp9cACgkQj4D7WH0S
/k5h1wf/ePnI78AwsFL73hW/6a3vkcMZT1DX5QGpwIyEH62MofINXyMmZ/DLn3/E
cHpC9YmdK4KjuLW/FjdG/yxNo/Me8osVzWaMTNNbFZAtgVc5gIka3FbfznJML970
5UYLrmq4YcgT+PfECKmwQ5n2qleTpUimRIgUkSIu1GSCutJ47Z2K+SmwW2RdoDZc
ILkPr7uTh3Smp5SMXU1lIXI6p5BrbxHDTtgidp6qEbLLU56zulCqUY8Xc/BaBzQV
oPqykCt5ec5E1NdyLN6OTmQPSrQTFzsQqcuPSRj9E0RJeD12HwC/toKhG13vWAGW
w1Iu0W62/tqWEksU+l9Op9pMMa6u5w==
=PhOu
-----END PGP SIGNATURE-----

--c76mue3amd423vde--

