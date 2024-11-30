Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B64DD73606
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=; b=VraS5lhvBd/bBekYtJ3Y3150vk
	17KhQIMTiCeCr2awucGak+pgG+EUWxU1ymUeTnQVoaJxfd1diZWOX77XjndJLCY24ttJqoW8lkQkf
	29sDHWbfXRhAAV1P47Kk1PKgwbnk0BmkePE65hiEIpTp/wOlCcqvTYk+UrF344jei1AD3vpPKP5N4
	8HcnVeGymPRcK1xsbp7ZCwxm/n7auV9vQ4TfOuONk/kZlSb7WMHxHVomKIRj7rMG4IvtdvLukqOzO
	thjt2SN2um7gOGt495CcfUgUtdRqq72/8zMQ1CqwSs9vZZV7gdKkjyKHUkIxCj4tXRDEB5y9YB3Ex
	XtspIuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHRQU-00000002N1X-1L5T;
	Sat, 30 Nov 2024 17:38:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHRPU-00000002Mt7-3nYE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 17:37:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43497839b80so17836875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732988255; x=1733593055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
        b=BQWWsLTrQSLNg9Mxsv7wn2S7Ko4w4Ws06wQn0uLS6qIRKEs5b4fCfjWJAQzFERbMpn
         hwMMZD6T+/AU9FzS4VcJ6wOf6MD+Swc8OqJqk469Rhbl4OkJtHiPC6eKhVtH6s5brdfS
         mqPyltrVNnYylbzNOsfAQK2+pNNp+B7cI32YoonDzBvlR86R73bUsqB9EZcXjkmggr8o
         iOA41dyu2W42qxxl5F3JSwC+hRdqxvrgIURbeQlru7s2zcc+n+4t6sGvRGHPtrzmfpdj
         6tTDlmWsAMWPrOGbN8iZzMil4uFXKgHRv/sNRo6iM1kEmS46VTgABwg4nGZASmS8NW7e
         Y0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732988255; x=1733593055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
        b=jKKa70hOuFL3K1Iq7GQgK78seVOlvB4UmOt6+XqTOe2cA43di/2+dVE9Pgorum/bfD
         xvodwjTE/Vnvree/sriu32L1C8ABRj3T6GnWZtdQjkVKHfwNlWS0g/4LGPLfMSG1OAlr
         7diIlv8CljwDW5burHuzCbKrX+pzYqrza/iXcnxm7/2OaUPuBX4KE4XDDlfcU5XfJlBN
         A3EF64MvxjP6lQ/otCY+vbvkK2DCyQ6HvZZifQd1aeJcrgQLEAlWFNbQwhYsEBwo8muy
         h/qFqF4KQ5kEo4q36AowYbG/yp5MVPDlsJK6gZLnPJ4zGDGN4mWCLBRvb7rGcBdTIo4d
         VBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQi6i9MWhf9LrgLerR5CsEzAT3CLLEBwvYlWRw+5ivmpBjzIATi00gpSZRcvNu/b3MrAUpfioEsKhbyLSqioFX@lists.infradead.org
X-Gm-Message-State: AOJu0YzebGnCDLr2pSpzbmmCsiyb9KKIIFd4a3EB9Zo2/NRmLISouKez
	ZL9Wc0hSK6Iq0zngaj6cMmTxqGXFOHOyl3c8lktJPxkcxxIiTBXbMF33NFP3BIk=
X-Gm-Gg: ASbGnculn5DjfeeC3ZH6h1t83bvjrJRfaJbPIdX/DAS2d9oehB+7SRj3a8FjyVUmAkY
	oL/0qKaXgmm0RaYjmH4Oc8oF9fdw9jHvbjUnFSfUP9z7EDlXsK6XaT0v60r2f30yZ+HbjWZvlTU
	uomY4ykVar4eRYeQ4SaufI0pPe5WOqVLD+9eAKYCBHldL5HRgmRVfcEq2q2o0E/zXP8TiAWw9gs
	pjp4710DmRXanK8HXIJUB18umAjlSgG7u4h3/H4iTCuevsHnB7zKnA=
X-Google-Smtp-Source: AGHT+IFwFQ2rSjeB0u3yaS6t10AI+CYIIMAsPZIeMkH7fQN0rD+w3+XGwsQFyRldnEvjiwCvxiOdhQ==
X-Received: by 2002:a5d:59a3:0:b0:385:cf9d:271d with SMTP id ffacd0b85a97d-385cf9d2858mr8248469f8f.21.1732988254848;
        Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eb10bf7esm453594f8f.14.2024.11.30.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Date: Sat, 30 Nov 2024 18:37:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
	aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <gyt3z6jisr4cea4wwk32hgzbatbczibppgrv6copcl4qo2chlx@w5kcqulhoe2p>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4chv2ajqebpzf4n4"
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-10-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_093736_944404_089FEDE1 
X-CRM114-Status: GOOD (  12.23  )
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


--4chv2ajqebpzf4n4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
MIME-Version: 1.0

Hello,

On Mon, Nov 25, 2024 at 05:33:06PM +0800, Liu Ying wrote:
> +struct platform_driver dc_de_driver = {
> +	.probe = dc_de_probe,
> +	.remove_new = dc_de_remove,

Please use .remove here. Also in a few other patches of this series.

Best regards
Uwe

> +	.driver = {
> +		.name = "imx8-dc-display-engine",
> +		.suppress_bind_attrs = true,
> +		.of_match_table = dc_de_dt_ids,
> +		.pm = pm_sleep_ptr(&dc_de_pm_ops),
> +	},
> +};

--4chv2ajqebpzf4n4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdLTVoACgkQj4D7WH0S
/k4Tewf9EssJcTTmbhrMd+Z9OEMUakhfq+ufnw7+fdnL5bSz1UG4O6BpXKdSHEOG
3GVGRRTto7bFTDc8d6AjAymdKak5N9qoiKUvbjXBcqqw/yrQnatqoSbVaGXl1AhM
bC3ACa2Jk+hpxBLZ0ADQNIsiTHt1JsD25oyDT+LdjtBWwGcao8CWuPNQY9vu/+np
jeqbvSKy0ZxJyb9DtQkAErXp6TDgbDIus7W/t+SER/BSZVQuZQH1cZ/Il8Fyf41K
jlKO+ARu3pWEngcNyxZmR5mUzZdh6+0Gfoy31/tdmao58gaN/fLFirQ0NruQFDEM
3M2Ee3lQXE8MXaOGn2uhWj312eKAZw==
=RpIh
-----END PGP SIGNATURE-----

--4chv2ajqebpzf4n4--

