Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF8CDE018
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0TpL/uQKcXjj/1P0tKp0hA2j+bgPUGaGAw/0f/W2wM=; b=eq/FiRAkFW4jMiB4ihLYd6OZrD
	SdvHDMpUCa2uaU86wWstZV02ED1HHqvytFKTlUmXPYelgo06m1aALHvgkyP6dMXuoP1fm0iex9nJQ
	Rv8OE//Peum++wPwLyYn4gyriz42o6i4OPWVZvJ1p6nQ81dwqBg3qXJ0lqjl2LiMQRWv6qUS60Mtq
	ReG6rykuFdpOnOAAp0epHfJgg5M3RvYTJYLOjt55zserAy0y4iBgWV1TGcaD01WbEeVDUj1gxIbj8
	CnSefDz7yMeLu55zXVzsS393A2DuSFMVFGaJ/LfC5JX/dih1QJR8IoQtQzfL5d1ZAG30h50k2iL/K
	ZEXUvJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtg5-0000000CFIK-3l3O;
	Fri, 14 Nov 2025 13:17:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtg2-0000000CFGd-2I9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:17:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso17854605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126241; x=1763731041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0TpL/uQKcXjj/1P0tKp0hA2j+bgPUGaGAw/0f/W2wM=;
        b=Uz3No67Er2Q6u7pTIMK9IlXMi0Umq3fA6sKbdh2cLzHL9ueijY7NAfXihrZytDUMm+
         2j0+fWker+2aO9u0WliOIfEyXWlTi+r+33qqjP5zkM1EiBF2xajHhVTP91xj+Vgfjt8Z
         0MbHAxezQ9QVD70vRS0GXbeZiyAU56zoBXW0C6KP7yjtpI6LQFW7fau/KYZ4QTEvzSXn
         hqGHzQV6e5pqp/nMq0j+1MSXNJRI7LU7HHd9mHzHClXTUoyHRZmtBJzdrMYHVGT/8Mhx
         YqAjcZ6e1UjyMVy3ImO+zbZYNcdeqj3aCNJgJvY4wj8LxlxDneSnC3DGl9+yS5JP8RwZ
         gyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126241; x=1763731041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0TpL/uQKcXjj/1P0tKp0hA2j+bgPUGaGAw/0f/W2wM=;
        b=H7vx80KjlodDrEd5Zbp0esrcCRb9AnfHejlmcqFffLY3Ddh97Lfyqgiq8/q+qesXD/
         PDvcRCmGPulBiUpXwDk6UWBsS9bHAiU6FVuIukOejvdLiH0E/OjC21LRbr88BJ050wRb
         g6pwgHMwh2ph2TpeahzaYopr16zp84VPgBps4ET42an4BgKnLqoCQM04BGptZSHVcwYa
         DaaCR3t770hKQxK8iubkB35oKISfoiGhR6txu9HX0q3rfWE3n3abgf3fowI72HMPNCP4
         64VNfQXK5h6mM3kA/f51hgdPbiPN8x6Vh3pFXJax7uG+3CmPxFMczD+fAEq6nY5ASEoF
         SNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7dTfCqOGzn3/ahCWXGtAxE9/3JYaaDpxPNkpKLY2rTrYtXRsi5YvQuBGvtVyHrOqhiR0eTm7G3nMig6eNyno2@lists.infradead.org
X-Gm-Message-State: AOJu0YzhkZvykuEECxJtOL88wIeLEOFvfnSqA3CfCbmNSmBLb+1eW8Jk
	MGr/WkHJaRFIcvCvvnHo37q2wQxi4ekkXhLMRYqDmvdABFgiWC6cODn1
X-Gm-Gg: ASbGncv7a/ZYf94zKKZv+9k5+LttxhQt6X9sVSF/Q9o7MnVGl9r3mJM5IXpABUQD93T
	pnx7U2iauzmV4112C3g6IbgBMjpIsEYUfkUMM0iVTWuayvKu8hyTnigJnsdEfsX0CLvLszHOutz
	97Ep4yjzUXcZKKy85fRKmGOng/M1Oq9H9kKuGq5C8N+fWPWBvkWGkvXo1e3gRS5pRJAgVroEP1U
	rbFehYyeTQtmavLOti0It8wk/thhSXpbRKKE/qnT0mbCG4uDwtvqGnLSXZAidOPM9R+HbKCyrMi
	uY3pfyxo0FDJjeAnOR3Q5v8QKyJkz79BlwtxAPEinf23UakJQEb2XRApNdQVOQu8Nscjsul1qaz
	iRx2tq2jd/RV0nXe9Fx7NRQEUowxATb+4flkn0l3Nxp/9UzTd/wLAt5H0/VGHezPJNDENSKNorD
	o9zNlqGy+sZe7Muv0Ctu620I/Yp1Y03zwsctMBH/v6JNYAcKJnld5eSHHRna+nxSE=
X-Google-Smtp-Source: AGHT+IE9bBUs5+fK/teaotf1hwhzAkTnpdK+HO3WDqdKR+mWJDdDdywb+mQyN3FtSPr5SthQHUQsmA==
X-Received: by 2002:a05:600c:4695:b0:477:7b9a:bb1b with SMTP id 5b1f17b1804b1-4778fea681fmr33855485e9.32.1763126240242;
        Fri, 14 Nov 2025 05:17:20 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e43c2fsm141848115e9.6.2025.11.14.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:17:19 -0800 (PST)
Date: Fri, 14 Nov 2025 14:17:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
Message-ID: <jhrvha3ytpt3wqvyfrlt5zirfnnnijssrufzg6bc4cfah7ahln@wxnnrdv3qbid>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3uqy45lsar5fgfon"
Content-Disposition: inline
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_051722_600869_1BE1B82A 
X-CRM114-Status: GOOD (  14.45  )
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


--3uqy45lsar5fgfon
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 11:28:56AM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>=20
> Depends on the first OF patch.
> ---
>  drivers/soc/tegra/common.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

I assume that you'd want to take this through the DT (or some other)
tree, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--3uqy45lsar5fgfon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXK9wACgkQ3SOs138+
s6GJEg/+Lvwv/Uc4dUYUzG/6oY2h1PdiGuJvJA9YspnmST4S0yhN92w4uF7VktO8
48OfDwxqJHwx3SDbrqTyuzmBBpk+vUOVyILkxEFHIHHfU3FSie3o3o8xQ1reITF5
xRkKWVj4drW/J3lr7dXETpSnaq8ASU9LbXzjA5V5WEZIjvOwEDTOiUtjycoL+dJN
EZcP60yEeH9WZqPvBNJcDpppUFwZINIUJ41aLebwav40cxSOr9AWGyaIoirg0hAC
4B5FfUrlvpG6uToKYAI+F8onTpuhbY7ucFNx420eOkY1MfcBDx6CxL2rATwe0wso
U9+7SRCF59hiIZLQVvPj76JtLjAVrvmfanOKa5J2/Y/2vUG/3PfSdzCzqXykmv3i
fCsdqHqur0RkWwjayS76p/QSldpOQszoGL4Uio2k7u+RM5SXEA+E1im8qq7ed2+N
0XjgaZjOoGP24Gn+V1UUyD04j/IjPm36o1hHwa27wJnEf33rp932nOQch3/T0fA+
3MERBRP+Px+jXOgg3D3F/gzJa3Ps7rRNp3XRHmv4EwjSMU1Hoq9ePdT38fW1Xl0o
x+gIeNWpWoVeI7D+3OfAoJTthFdmNVUznKco4qxwigLQnoGo1s0Id7hRygTsz1fC
MGSxHO88pn2zCtJqXCByFHjVRYA+y5zQx0zB6IX5ndliVu/HM3k=
=GzNq
-----END PGP SIGNATURE-----

--3uqy45lsar5fgfon--

