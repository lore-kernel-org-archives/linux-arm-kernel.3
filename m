Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4839DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=; b=o0Q1nXec4W5Sz49GoPFXnLBDGK
	lYYz0lhpzo28523BhbvAv5On19COcqfNJ1ZXPDALbwVwe01cxTOI163Qto4h27af+vF6I1iRRyapK
	Tlvha1enPtiKva5ZPZ7LT9aorjiVMbOtRDDpreSxyAnANYAwXELNY0oPi46hnrND4nmtWzB7xcYGf
	DE9RwqQSldKAamtssAkzsv3vOTTG2e8JekNyIzNwe4LHeCoAyGURdlv5tDduydTy+COZz/BEnE6tt
	ZwyiRgQqYmH6TPC3UTSJ4HNltJhekU0/6+p1j4AvHEwy5PfphVyLu3LMp6q/YYg+DaYxqriPBR8rp
	8KYM5How==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UTW-00000007O9C-34mg;
	Mon, 28 Apr 2025 19:49:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UQC-00000007NhL-00IL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:45:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4359196b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869543; x=1746474343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=RtmYMB1CR92aqoxhFYSBuH6HHEPhqh9JVah+KfnlARzY0Rv/2sSDVrXzjyHnV1dI6M
         tXywOjtwW4On7fOM9xOtex0ofN4KSyJPaP8KvBgGL0d1xKJn2+7M5XbrtW9GKxab/wC9
         qJpPU3DFajw3p4yYOXuPJuvemuEVKyPmsHzLdHsf3deKOGP0XtGOiNCjrF03+2Gi5hCY
         IbCrQydPrUJr2NI7otHTSVhByGNMzpj+ZsSDxUquq81Syyi3ThCj3bf80QN4MvyFbrnN
         YwD/xQNoxe4+kaoh9P1tBjSM4OORGKCFIIjDfAiKBdX9fp0V74F8vM4dXTHAuzEMm5zn
         Yflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869543; x=1746474343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=XSJT/yCDOc0uNXD9j4QiDswJwJtVJ2qKS4ZhILRCd6u24P59vdsgCtEdQW0u6clUSE
         4vLQfYLaHoBpQSPAiuT1B5eD6YgXLMiVWdKd8beDdynMgaPK/pMkTzwVGn59B8cf71Uc
         TrO9RqA56sFBnANHl72qykjdgRKwFL+v9246atBETBHHQIauCoqksruQSIVoJBITpvZY
         HuyJrVmotiWk+9oxtHmYkgj3jF0whtsSGm5MGqgqsOl0GSaykClBXb6iJ/Dtjs+kHUxd
         2JQH9a9SMSaurmCrl5J/Sx6adAs79XF/w/eDYuUHZXPJ+jXfK0rR4b3M186BR1NJRhaQ
         g+ag==
X-Forwarded-Encrypted: i=1; AJvYcCWt6er92fWbsuZb/BbeAuvf0DGKiScbUvMe3F8eon6ns0eMY5RUHuf+NQg1mjgKUJWScZ9R2dHHpfILcEdOt1lm@lists.infradead.org
X-Gm-Message-State: AOJu0YzhlHXPzq2sywakf4QVUk/ZaHqckxgmvIaU8YaZxlFry8yVIzss
	qJ3mlCWjb8Vh6d4ErxeWLafKHDiXfIlG+Hz6AcDvz/d8aSNDpu4a+gnSuXXZHg==
X-Gm-Gg: ASbGncug5ltmAUIemhRerFY2Q0PGSzRL4Z3YSE/OI6GiOwqzttg+H9qPM1v0kNYmD0B
	KVlaFb3f3GzvKyQq9Cu8mgL30AM2qRS7KUoJFp0Y3TOuxEAsQnRLvd3Di18IAgLgioSUHboMa/e
	4C+4GI0Z74fVl/zdkPJYpmMmm26VyZgKPARpRP1WENfdm5NIz/E+vNeqqa5nOrNjdQ0V30xBeve
	DXm0ubZXXjMTsAgDsFtO35lEEuEQzZdhh3N+9/e99SrvMuAeDSq38Pq9d7lIREt0f1wOyTQ4/AL
	ZLKQM89CmnqxRWhmeIBnxX7QdsCR2rRnEt1OHFvdLMA2l7jtt2Oh/9XsTnxxShV8n0bAAbpToBE
	evDc4g/Bc
X-Google-Smtp-Source: AGHT+IFYlvYhne57m4K5klZLGQL12xu5rF8UHasgAgtYn7L+ZI+rW0iA6PRZDAtjG6kMT4NaEVhDYg==
X-Received: by 2002:a05:6a00:4644:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73ff7280114mr12876072b3a.6.1745869543146;
        Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8429207b3a.39.2025.04.28.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:41 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:37 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
Message-ID: <aA_a4Whqm35-pdKk@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8X7Hm8zNZQujXZIe"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_124544_047366_D0987667 
X-CRM114-Status: GOOD (  19.85  )
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


--8X7Hm8zNZQujXZIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:45PM +0800, Chen-Yu Tsai wrote:
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
>=20
> Add them to the probing list.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Rebased and resolved conflicts with "spherion" trackpad prober
> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 019578bc7ad0..10dbaede0541 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  	}
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
> +DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
> @@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>  		.compatible =3D "google,spherion",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_hana_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,steelix",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,voltorb",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
>  	},
>  };
> =20
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--8X7Hm8zNZQujXZIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/a4QAKCRBzbaomhzOw
wjG2AP4ijnSVnwRAZNpFtMiKPIOjyp13MuNiw9PMzfMbCr+MRwEA9hFqvOc+hmFl
cJV85xxmxWaYDZTsW2Gw5ByJNl+JBAo=
=LvH0
-----END PGP SIGNATURE-----

--8X7Hm8zNZQujXZIe--

