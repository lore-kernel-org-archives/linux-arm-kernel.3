Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E64C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HqZjTSS7S3eJwQA/m3U9yuAxHSWy2oxr0SFmWzaxHw=; b=F8AQeBFFudl1Xheiv/VVZeJgSu
	HVfjZZlnHpwmtMQP8d1xdWvoEHNeUXovLhx52Ymm+xk4kSv0hGwWCkhpuNL4ATd1qKvS0M3e4iPCl
	V14yaRO7yCzZJct53Ky+7hNK27jVSfC3T16v0JSNMOcY5WmqKr9U2mACxGsxQPKFK1r0TxkifTi4p
	cxlbkK+5k9v4Mz4bmt7Z+mtwzJvMDs5lPdaocxWwC9aevF9dKTC/m88+ehlaDqhVe4LqXeGYVMuky
	+9IgN3BeO69Tru5JAX5rUbdojzwsQ6per09AN3Dp4BVITmhQf3udsV90D8ofdfPaIL58u4QzqNqod
	Rb/07INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9Kz-00000007Uy9-3Awa;
	Sun, 11 May 2025 16:15:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9Ix-00000007Uqf-2SHH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:13:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ace94273f0dso714163066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746980009; x=1747584809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HqZjTSS7S3eJwQA/m3U9yuAxHSWy2oxr0SFmWzaxHw=;
        b=F1qNylsoU0LzZMWJcaaX0aCBepqTNtpFWW7xfolT4Tgn30Z6Za/DvS2xRf7wrVF2y9
         hOfoFM7Spr36LpMFlBL/3pICCjzNaf62h3Pe9Nk/FtFcxoHZ1pH9/h4BwY/ZyTdehvDB
         Yu+G6gCiyrv3Ui1w/d12OY+DLHkevAMaV3Qofo8JPvIP2kr1m8wuweNErgzKQDhVa41B
         Bjhgih11uv75jZwmSGLeUisBx91k6MapXQDc7RMTLDVWHoTo2uawsteKkM2d7D7dOkgG
         Ifnr6/fg61EYqiv8pBoUmClqdQy0kWMWBjzPNTqh7dX9auxlioE3/zGNPB0FPiTgibA+
         1HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746980009; x=1747584809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HqZjTSS7S3eJwQA/m3U9yuAxHSWy2oxr0SFmWzaxHw=;
        b=i39jQZIOJm7B6NyY93nWDSOhmdOa04YWiFneaA7FUoJqQUkBtj7341FX6B1QOavYJQ
         cs2o4A1t9XgNDy0hBRmJKPJ/xBKRwO2lpxXp9fLGu1toFx7undFdoVVjN1UV2pVFEbl2
         xyxOBmhiDyDysde6Q39xwXUds3WCmUS0ZJa+alUkxCGAfVKIa+DDZMgopBpjNQ17O4Ty
         QUpp1rtSm/H17pL5/GlxPysLBdlBDYpYFmjXs9RAfIdFlR9iHe9QoPw6h8pP1J+uy+4s
         g/shw+19Y5bQcDLNUNNGnMlGMH7rXlXSh6NIN2qYL8L1X/qNuTBhdvyxSuBcPu0FwYEv
         BlJw==
X-Forwarded-Encrypted: i=1; AJvYcCV9swXzTH+uocuuXy26JCISRC6vXDEhYRrn3P6cHLsAN4FEqCnBFZfIPBK5a8v+0vX3m3fK7pnFpTsJRtimlx8r@lists.infradead.org
X-Gm-Message-State: AOJu0YwUKC7IuXznG4DM55xAmJkqK3BQTbtSQn+g9Ck3ZgwP1rkbYQRR
	sXe3GxCiw4+7dXfPEQ6/O+ft/EygZu7B/u3ShgJxxMrnwIN0L3818kyIsh0YhPw=
X-Gm-Gg: ASbGncu/qa6NGUrslY4T0v6l358+uXIeLeSdvbRrQJ0PvD1lCdAy+MFeyMsi73IWld4
	heIdvoiyD6tjI7vqcFWIbJmPeOR5/vQPhf13Z8/4/B2F6ky858WFOcdzD5hFAWEtAKSlU3U7KBb
	mUrranZ/Ug+Fp8Zo1obhAAn+T42c06RUWnKUWEdx/VBZu4MMqBABzUd8+MeThJ10K77MVm/XxK4
	2iWudedFAA1FVWEw4TdZPOf2nyaA/cOofhBewZeUz6FjbzZMkdQfOP6FTpf9XitlbaiMyZtdu2N
	wbGIgJTuhLEg5WKliAjxE59a3jipChoz5WgyPHpYDFfJyBAhX+gx2Scc
X-Google-Smtp-Source: AGHT+IESpcxI/t5gHS0xU/NroD6WTODIzNlVuTkb58fYBGUQEG0LdYHtrtsB21us5W9WMInSh9G3rQ==
X-Received: by 2002:a17:906:c14a:b0:ad2:3b29:4cd7 with SMTP id a640c23a62f3a-ad23b295c6emr525907466b.45.1746980009324;
        Sun, 11 May 2025 09:13:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad24121e992sm217138166b.14.2025.05.11.09.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:13:28 -0700 (PDT)
Date: Sun, 11 May 2025 18:13:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <zszg23vtaztszlkrgs3acatiu7rmgypsqdzlpojimg22yaeaya@xfv3a7fsd2sa>
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
 <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyq67cjig5hvwfze"
Content-Disposition: inline
In-Reply-To: <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_091331_889985_0D95CDCE 
X-CRM114-Status: GOOD (  14.51  )
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


--zyq67cjig5hvwfze
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Sun, May 11, 2025 at 09:38:36PM +0900, Chanwoo Choi wrote:
> On Mon, Nov 11, 2024 at 8:25=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > +       ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to lock mbus clo=
ck rate\n");

As the build bot noticed, I missed to add dev as first argument to
devm_clk_rate_exclusive_get(). Can you fix that up, or should I send a
proper patch to make the compiler happy.

Sorry
Uwe

--zyq67cjig5hvwfze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmggzKQACgkQj4D7WH0S
/k7s5wgArggczCoL6efrWWMp6Ly0RZN7W/gX6tbjYjbxoY+uesH9jQGYcisDYF3y
6NO63q1frIIYM6sAjsLy0WBi31x3OKEo72nv2EXoOr89KEuAY1a3+Bl6BVurOyy4
wyPtLkpscy7zO42tX8jpdLdvhMgbXRIFFIMx+UC+7FPJR4FhhiCYozBLPqTvU6kI
PXc2NXmqi0uPF8X091vDWBgFHVghg1XIujiv8pssses+com+4y/bz1YWl5N87ItE
VoXZJ2TBPV4TJE4roo8I5pjUAEHnEZ1XzoipmpVZN4QT3VRT9xhrp9awUFT2qzi8
UtTmSw4MI8f/hFjGgksaVG0k27ax4w==
=3sfY
-----END PGP SIGNATURE-----

--zyq67cjig5hvwfze--

