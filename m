Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA31C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi+aOF3X0XE+EnDA3NYao73z90dCW8BKgRHxnIWsmow=; b=Bviko4iZuB8E/koogKpm5YvJ8V
	F4zVxSJeBdjatnE3F8Gvd8wim1xaGjAD2NSQu9P4V/f9m+9yVlr6Lr8WisjGf9eDK6GLNlFpYbURQ
	/mvlTm4KNWIQBkHOXkveNFGK82vdbQQvmw5khweKuvZwAqTCMcQNKjSWu3utYqp8hSzOG88WkNDFe
	2ITVcffqHHZIctCsacixpzl2SXu0bt8TlWacUT3Ntze5WHGaa3cR+zoIaQyjT/YY2f9JgM3nkcR34
	opV4dAlKa1K/eMd7QMVjnqozsKpWwBnMaigFRLWKyvT2NfVxqUtekEqRqMlUK2lMsJNYtw6wnuc8C
	I6Eu6BGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCUg-0000000EoXQ-25BG;
	Mon, 29 Jun 2026 13:57:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCUY-0000000EoR3-1tpR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:57:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493a440bc10so10982355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782741460; x=1783346260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi+aOF3X0XE+EnDA3NYao73z90dCW8BKgRHxnIWsmow=;
        b=CIw77trLl3xXwjBmRuCqroLawvQO2a0bpBOJqeqBtkAKYY/JnyTvVc+qEPJ5QHxjCQ
         GDs0ExEtUfN8SahUaS7vKgSeEhL5t55zs+SFiuoKQ5uwAVFmJgNy7FgsHfhH644DJLZc
         IrB1Q9ViTCfE86kfHwMf1B0JLu74fdTYvT/+DtZtYy9V+HBrbOe4Ub9zhEeowyJFSou+
         Pt02m2Jo9aMoe79yiSB6XiJ7zsaKaGXeLUE5Y5DChp2VdToBXWQqyTcBJTgeBLlwlnGq
         wc2kHmVQRSkZGyNnYR2BjTxC3zGybVXTfIM0rOgmxUp5foKR9ALyysq1j2TfB/+CRy+m
         ieGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741460; x=1783346260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fi+aOF3X0XE+EnDA3NYao73z90dCW8BKgRHxnIWsmow=;
        b=gggNKw0vHhNrkYW6zQS/KRBBbHhhiMvrdXBYoijJfTehmKAoMhFmGRwiWucbfUMItw
         7WD88Evtty/ZPsZz1MVjHk8XmuQyELRoekdskXmN+/PLRomZGPvoYDhUOTePEW8q4XuP
         cFDWiFqtt+0Pm1dW0Kmt0lK0hY6g4Cef7FW0hIRZSaeTY/4sFGdP4sHB+D1zSsOnitHz
         w0kIiA/WgMpjcIDcHrvsRY/PBX/nxZVvkxdAeg2qVU4WiiO8UZo8POiBHbSyvSMW1wz0
         lxhlcj34t47qK+fgNVl8ndAzR9HMTjGOqlLyt1vrQX5b2esFLeWqhxQx6IPxnIu4+PHc
         xnXQ==
X-Forwarded-Encrypted: i=1; AFNElJ91swmaFDUohzkUVlv0LPKvpu1Z2rW3aetxfzKN1coBWkDMTpg4ND4L9qi4d94Xm7IvebyWPIpNScxHYDAH9xKr@lists.infradead.org
X-Gm-Message-State: AOJu0YznC3za8l3nfvD5c7qRBOAglivKlq57yQQRJS8Q4HklHPq2aqQK
	BQau17vyQF5uYShI1qDx4kCIv3PEg56bcVkxbPIVvZ10ivB33vdr7WP8l6a+Gf6tBxX+DSsSE0N
	QckDS
X-Gm-Gg: AfdE7ckNAUPFKcpV3EqfWmUF9grBgSg2qLDeOekqjs2cNpPk95JV60dozyO69yFyYn7
	zYeeEE2BBKS+bUHgPOBr2Q9eXIaQ+ET3aYNkcjYFLdZ64d33UbvvHWztLiYMiYfN2fJ/yuol7Kw
	hned3ccvvXFzYDW/YdHv946sPgZMrDyIVnhpVDKEanZj5nUJYsZXWoAdSXMQOA4MgIfmFzDF4hC
	dFvH6Vho2K9uXa5Jgn9ROyGhMRzCyMixR8L97l6+sy1UujdO1Vb0tZ1SlZ/qou1i3uFHqm6M60v
	uOUCSN1CdqpJ5a1eXVVsbjmGWtubWQVc4ggJPTjyHVQJ68o5nDgWo0Xau2WQGT0D6Dpzk2peL2d
	fqgSJ3V8v7767LhC9QvG7Qj9Ya+Gbfl9C/QBtJ08E1oZSsMZ1dsvn9oYecx7yHiNIhy/pNeUQ8d
	ph7i+S3lJ3vsYqHUMH8APV8fuv01z5BtLzu3Jm1fRsZQziKcRrJi/NMUOAuLXjMh+C2nSWt1oDh
	2O1
X-Received: by 2002:a05:600c:5290:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493b7a63dbdmr608125e9.33.1782741460528;
        Mon, 29 Jun 2026 06:57:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04294e5bd34a12a699.dip0.t-ipconnect.de. [2003:f6:5f47:db04:294e:5bd3:4a12:a699])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fe949csm375305105e9.5.2026.06.29.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:57:38 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:57:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-ID: <akJ5lkLieSgkdfW9@monoceros>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
 <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4sshmqzaaw52uohq"
Content-Disposition: inline
In-Reply-To: <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065742_500018_50E393DD 
X-CRM114-Status: GOOD (  13.95  )
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


--4sshmqzaaw52uohq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
MIME-Version: 1.0

Hello Mark,

On Mon, Jun 29, 2026 at 12:17:04PM +0100, Mark Brown wrote:
> On Fri, Jun 26, 2026 at 08:00:22PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Currently that header is only included via:
> >=20
> > 	<sound/dmaengine_pcm.h> ->
> > 	<sound/soc.h> ->
> > 	<linux/platform_device.h>
>=20
> Acked-by: Mark Brown <broonie@kernel.org>

You're too late for the Ack, this patch already is applied and part of
v7.2.

Best regards
Uwe

--4sshmqzaaw52uohq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCecwACgkQj4D7WH0S
/k4QuQf+IZ3MYAOoCiX56AcddT2ysdPwmOlVVSv/6YS6KhChCyJRk6ZSdHoDg3Qn
xGnj118aX3gekqAPdZGK+3E7fkhwmSCRh9y3c2QgmPZlcwdJqeHrsMbthgmp4+r+
0GSSh+LTi6ndwo1JU+dP6aUhpyGk5AuRGTvL4ZMA7yuTmVfoSAFk/UrzBqtRXfV9
PeNnlWg92EyYbL4HQeH1S0xzB7O3KQoB4ni2q4wpQYbFSoQN+FpNRe4oNzkUlXuc
BBZDGFl7zH8/laFhRMpvfQPxXpksv5JxWWrtgcDINgpwz3+Zm7nYtVuG7r402M8T
mg//pdx2TidvXsmJe3CMWgTmnZlBAQ==
=Ojc5
-----END PGP SIGNATURE-----

--4sshmqzaaw52uohq--

