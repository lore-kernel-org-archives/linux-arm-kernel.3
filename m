Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22B3D78311
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=; b=jSqSsJ0K13rMMQTOhaoKPZ3n5F
	gRodT3dv58LR8YoYg7jtEzviy9NGqkyO/XY3ziAaijGPgbhgxqLpYxx8KPvjMQIiTS3inMOopZmnN
	bkSD0JbvuroaCYZ7rI2INA9oslHV9XOhsYc9nv2b9RKtRf9Ck0xaZfR06n3VW7tMNHJ1c0AOYN007
	Prinon8PgZ0BU9jjChbHYEujPFqO+CTZ0PX5kJVKEkNQzHHPqF8t6Cn+Jrx5n20l6JmJrDa3v27Kp
	ChqmFj9daQggI5TaTdE5fRHXsWyVJbvR+bFLJwwOSYzdC4HJzlNgeC2J+r3/TNscuynrcqz2AKD85
	ODXoFTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Qj-000000063Wo-407p;
	Mon, 02 Dec 2024 12:21:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Pj-000000063Oa-1H0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:20:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385d6e36de7so3658377f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733142029; x=1733746829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=;
        b=hlGVWY38m7TJlS+zHLy/GbUwcM79dyq/np6DDnbrxhZalK3r8OKGjG+BfbNISslS9B
         pM7j4RSiJ9Twa6agqz9qFqdO20984NpblmWeJPNNmmqBxjUXsl0vO2Z0YEu32W0ZdB3k
         +NvECOOaiM5H4JQkXoIH0RpmafN56CvjO7aAxjiqzLcKM6Wt7Cyb9BdZ9B4EgqmJamm7
         Rz7EOEpmGHq+Ws6gNz2AfOVtr96ZmIkMheAks8LSAwwLpReANynMIw007daN9VoXC/6Y
         aptmJUIH3W7lYu86imtI/YVF8qORqR2pz07/bCENmtPBgoTZoZb8Y7hetvCMAodVEux2
         TA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142029; x=1733746829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u378XDx4WG4IL/2dCVgpOQRG8DFhsOKnAQ0gTpFbO7I=;
        b=GpoIDXHo4s0el4x7rY2tIYRvdu4qPBMIT7OYucxWogQF+8il/fqfzHErFZenYMvSmW
         PaMwrQsPTysX4iCR4mPxd42uDeAFMuu5hJ4Q7CGSPfPhvy5ctTb+Um8Rpp70O3jbrRoU
         M0sU4322VR8DikymHiO04e4Kab+m1IkI2LFpBBSKkRmxKuC5wmAus7u34lwz/HiYDPxK
         cMKqbGalQTnXJ7retqjilC3YQk8B6mppofpBPVsbEDsX2TLotFaMpOP9vndz1GQKi+Iy
         F0PgHxndxz7YG4afSwxlyZmkqK91KdWDSyD3dibvuvw4sahh8A9MrxbihXmQsV9C75sC
         XruA==
X-Forwarded-Encrypted: i=1; AJvYcCVDXKFDPW5bW4c9Xfp/hqQZAaR0s95ECHgMoLRIZuDi8WYGE6n/wReADkRwv0JzVfuRGRuz94RreWspOY6k9rNa@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHkBXTk9CkVphSIoqZgXg39QKhtFvNhQUfVqr9WJUUuVQYVu5
	qorPwkOtX3raJjD28GbR3+pSy4edlUC/Nl7WWnVv8XfjMmxKbsftGMNg2aBDHTE=
X-Gm-Gg: ASbGnctRHNFn5NgcHY1zI3ZLLeYhohZXrIE2QrnDfomhHGV/QddSW0wGzMhFIOahtUQ
	9I/S+R4VrRKQPs+1/584QbFwWpJX1gp5e0uNg9nS9/AFlno54pIfm/vqxmvE4L/WgRH3sMt4d2s
	liu52qeSdwpf9IOuz8qZPtvKYWfHZaTRvRpofEO7K6g/LDeV83VDi7RGikTsKFLwQNhuiRQ/JdG
	vIJ3tzkrWpPIZlIFYWrFK1wIip1biUur5YT/kAN8TNO3ZJgu5F29iQj7xQSaDb4rHzoqih8Euno
	+JmE
X-Google-Smtp-Source: AGHT+IGf+OvmTZwKTtzXYs9qne71qztg+HmqmaDV8f4rBxZC85P7ds5jnT+F6OPKkt5tMs8EWORR8A==
X-Received: by 2002:a5d:64cc:0:b0:385:ebaf:3824 with SMTP id ffacd0b85a97d-385ebaf3c1bmr6637399f8f.27.1733142028900;
        Mon, 02 Dec 2024 04:20:28 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd368easm12329689f8f.25.2024.12.02.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:20:28 -0800 (PST)
Date: Mon, 2 Dec 2024 13:20:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
Message-ID: <7taeakaeqyfu4x5h3r6z6lkdorxav4ox2sgjikw7zqkmnfmffs@2n2lpk4uqe4l>
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npsbh5lctdjw63a2"
Content-Disposition: inline
In-Reply-To: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042031_338720_358744C2 
X-CRM114-Status: GOOD (  13.49  )
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


--npsbh5lctdjw63a2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
MIME-Version: 1.0

Hello,

On Mon, Nov 11, 2024 at 12:22:36PM +0100, Uwe Kleine-K=F6nig wrote:
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Is this patch still on someones radar for review (or application even)?

Best regards
Uwe

--npsbh5lctdjw63a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdNpggACgkQj4D7WH0S
/k67GAf+P1XZfxK/FMwYqAbTJVZUiZwlfGN74ndrhxFPbHPThdAPRaVOh0IRAYua
nNRvgUgKYgvOKLADNuGv/G8+SbN6Znh9b+kW0BXye3Xb93OIMPJgSzoURb3DyXp9
LsFA4cuWBBUg6dUv6WT67/7HV08jK46kQ0xaUIsadtoZpqCTlSsZulNGmI1FUFd6
wsrbhwPKyO3c4s9lLNmKpfskNaEJcbiwf15UxBwtylwYS9ZujFbRyc0781JIWef5
NCNISsYYWdjX81tLApo3S7HWo7qLQLjMZnkhY8wuAE+TfYKB8usuz/d8gHJWrX+s
l3pwP9dao9owYBPAIPPnfTgv6L3Diw==
=0LW+
-----END PGP SIGNATURE-----

--npsbh5lctdjw63a2--

