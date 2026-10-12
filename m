Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A647ACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=; b=J4ISWALQUob4sE6HmcrRbly+O4
	LfOAe2mOrfCtqWSN12fL3bdlxcI3/ga2/vqRxlMdDLVv08reSt7sTJSP2JaVdWNZPOi+krPit005+
	qF/EKwKUEoUH/UISYVXWLojNfO203/lWEqsRLhcSyRbxheUN4T5yrdrV8Wz1cPFbpUqzOlu5gUtpV
	/yObWUm93au7PDxP3yG4MbHtdj66NfkvkhHDVLV/TJBzLwV/yPpJ5mGVr2I9YYllBVdFfk2p9etIU
	EvXH04hRvzXpg4MzMZK8J+2qQmFXd3yt8yEpimmoOnvfSrE2/UJcTYwbN7yS/cNdOB6NgTwLIlUba
	IwxxAwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE35-0000000AKu4-1wlA;
	Mon, 12 Oct 2026 11:18:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGE32-0000000AKte-091y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:18:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so14329215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803906; x=1792408706; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=ZaYjlKneI7Y1qW98uREcYb2JPjqJRQU/G/g1apZ3LiO6Z+EftkYABqTUwu8qI/89Qg
         wizg1TJYAB0MOMf8cXUrEufdWh7Eg9g2zrhrFLEHyc4lYivtYMbYMFaIYETj9hd0QvPr
         X9BiM5pqWA5+2uwoJW3exax2N6Q81tLnCKrb0lO3Z8cS7IkorcXtQ6D0j1NYtCAS7PNB
         GcdLwjV7oPfKk2ztwNoX/S55b88vqWHBFEoXiJ2HsAFqoBMlGOZ2WzvTYr+z2e61abCe
         eld3QhRyEompYCqi/xU+KPMRU6BUtCpHoBq89rT3RruXgLgfmGqhaMjYLSl72IMdKV5Q
         5gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803906; x=1792408706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=YvObe+f8veZZYWVVd3+nb5zRMN/YTGRV68YICngR2tp6MBU611RMOgFv7RUsTNrcc6
         4Kw0U7wtghpjceshr2LNwOpMdSJuFfidUDOArq4xqI7K65qfIu8ZGkbeewiF/wC9DPV1
         KFqHmY4AC+CwMLxAm24vrdITdjzfZJyey8JpjK/2dGeUneCRCf4/s+Kt1FoU7KLhneAp
         MW0H/eA9IRNz97WtGFaFjGICGVB4/etW+bCgm3TPWpeg7hvLA6WjeK8+Xj9nOxBCrRmA
         4Mjgy3HsMCqcuazbowCMOmqaIgJ15WqibFHx5eUQ7+5Tho1mxMm0aO5vwQdVq3bGtIf9
         dydQ==
X-Forwarded-Encrypted: i=1; AKwUvBwenPCyS08OBtm4FNzi1n5JXKNCJ5AC02hKj4EpeR+kgwOPfMxKrYB6lL4Ee6J2LqEfBb0aMuiyaMZovPRDVnIj@lists.infradead.org
X-Gm-Message-State: AFq9FYKJI/vD+tB2jn5q+3cEUOHZpTdzwfnGmibbcai5uGEhOjBfYf9p
	wv8jqoTwH9v76HaOjL4Z7sabwlUP521IhvQ5WHrXwh3qdXIXFPU3KO46Z3QnknNHdvI=
X-Gm-Gg: AYBFou2UJVhctIP+m+OlBMWhBQA9eqsq6r6UdDGgNRkYWkRuo1s9FbX1Dx7c06DF9lh
	Wmz17gUz/omCmC0Mtuk6cXyy1olfeMa2bu/wmiwTB5H13dBL46TctE89O11KH3dUuctgtoyYQOL
	i5vV5ujQwrFs+k6p8Zg7joGyVgJsxP7EeKorees8t1eZtlcakAhIazU27skswee6R3xS9zrRgqo
	BE6J2mUTlfpQQQKjpZLzlOwIxwqQTH1Bvx/NEXVd31bguLot8jZMyzhPXVdU8ICqd+nPhUY2Y4L
	I/LoXdFRDrhTXenA7oCFj03fjEdQFVXF/nYAJYJX6L/f7xXfGeeFaj1/CpvZ4OMHTkSoP/pNhUR
	bI1NVlGwqdNAB9nF8hO1r6uiabzlayHgkD4tM/gHhGziFvUjxxvsL1XxjonSJmYok2AqLwEhq+V
	OcQ5cnjP7u62X4Qu+Ia6jQbVvqd5vak6+LX9ekcFnyTKyDEOsM7NQqVtLsXn+xmmkqwYLN3KwRM
	T9LGguvmufF12GbTzkPBBC45qFwsrPvksURBOXZb1BIUgc6xwvXkMVjwJRhGw==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr159157835e9.26.1791803904585;
        Mon, 12 Oct 2026 04:18:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bb68abfsm311754435e9.0.2026.10.12.04.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:18:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:18:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aszBIkBXoFIkkeiL@monoceros>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdga4qrbhoxcfsbx"
Content-Disposition: inline
In-Reply-To: <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_041829_443087_35E887AC 
X-CRM114-Status: GOOD (  15.20  )
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


--cdga4qrbhoxcfsbx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
MIME-Version: 1.0

On Tue, Oct 06, 2026 at 12:22:00PM +0000, Laurentiu Palcu wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please rely on linux/platform_device.h to provide of_device_id and drop
linux/mod_devicetable.h.

> +static const struct of_device_id dcif_dt_ids[] = {
> +	{ .compatible = "nxp,imx94-dcif", },

No , before } please.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> +
> +static struct platform_driver dcif_platform_driver = {
> +	.probe	= dcif_probe,
> +	.remove	= dcif_remove,
> +	.shutdown = dcif_shutdown,
> +	.driver	= {
> +		.name		= "imx-dcif-drm",
> +		.of_match_table	= dcif_dt_ids,
> +		.pm		= pm_ptr(&dcif_pm_ops),
> +	},

I generally don't like the effort to keep the = aligned in such
structures and don't recommend to even try it. Still more if it's
inconsitent from the start. Just use a single space before the =.

Best regards
Uwe

--cdga4qrbhoxcfsbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwfoACgkQj4D7WH0S
/k616wgAm56cItlrtTGYJGQMifXXyKIZEbNaNh8obfuoDdC9KTfL6OrQDbETA8n/
83AtYbd6RkC4JP7NX3SK5DlSDS/oLGmxynxAfceKMBWsUcqR4oEpGee8ZRkIFMYn
BL355LaaGTv56+1iWN/tYDLNYYgKV+jwUYXmDJferAy0J0I1aTlYgEYMNoCJGGxb
ciaSMXRD1FzuAb3vpJpUvWltH2+boMSdeaKoj6ZblcP2sHWtw4UWN3b1YEcrSVcl
zMXusjBfMNf3S6BQ3GHOW5axtmRXjnPsqxXPCouSaEqqAahemWk+g7rA/4XF+Xax
302ZWP3FujxCr3/FFyysMyUncNGZnw==
=Kiiw
-----END PGP SIGNATURE-----

--cdga4qrbhoxcfsbx--

