Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0512C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=; b=Hu/OriY1s2ZSClMPFCCoCHQQ2b
	wiHuXmpZCDRoV//KGCKGWOpnn/NDMBQkkc/Uenh30vw7L4laAswKNuY1v095XzfbaE36ZCqYStQIG
	MoOMa3VcGPmRIfmnYRWT4AJuRmOtPEI0LPaenDwOv0SKzS2BpcSPgUChkKIe7rBcRKxkIXX9qI/gn
	S7X+4AM8Z4NllFfKRMv9CErWFJGkdK+evPh+BojuVDetQop7MGYZ8wuwrHsZ/Q2lSekr21PMoZhKs
	/jpv/xoIsou4XrOw3rZhQ45lpj0CLR2BkvslnVb2dKnTiWayWgVWmFQeCn6vtZFeBfTBU1HH5e2Ot
	fFrL6Pbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5639-0000000AKos-2Yb6;
	Wed, 16 Apr 2025 16:55:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55KP-0000000AC0w-2XO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso75799995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744819771; x=1745424571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=uBD6ej2fym4DHnoAmf4Ts1sUn4ZOJxNk3TTCsegicwdsg+Tz7HfCFl9fHGX+eYWz7n
         SAGDR9pghy7XabsnNJqMDueLWmVmsLq/I/wkNZnVWLHitkf6aoagmGhmQDy89iJwHLja
         OxZP2N6Bim/i48MmYBwtlCOZ/PwZOl7IOlo7Rii1BYPPs00O9MCbU9c3DMGwSGLe8lD9
         GKw9CMkOwdgyWDLz7Pp67VcIOiOA7Rt8B2ckMPP4A5Rafx42GwFqUzW2ZCa0ZBMyloQH
         59CwKzg0kGwy9j44jOeqi3jJu1icY095G0oxldfRbWR7nTfuLs28H2VgvrQKvIMGwWHU
         /q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819771; x=1745424571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gIfY2O9SRNMsf8TpU0oXNbXomtsGMw4EUG+PlvfsPM=;
        b=u3kyc+QjWeuxcm6+H7QN63lrseleP7Rc/tov3utjtjNChi5M61/wP878hY/lAmuxRG
         YcxjpeXQoq0Xctee3aZQg+/noFPBHp7e2IiVZgHTEpNOnL4UTCwlQtqqa0cFS4949/Ds
         2es2q6etKfmsO3CLpukxvau6/jD2Dop0/cwqrqXuKWmCWYuX/e/nler6ef4uIh98nFCx
         YEWSKRBUKxGT3ruzwNuCcqtaFSEmxdTSqGfNJsafW8cfcDebFevzYt1M4l6SKAOEMq4+
         /KepNHt1oKKypz5EAx3TEufKxD0LxaJZO7JEe0hl5w4jotjZU6IXqYjMxHrbCIAhSRoW
         3ktQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkU/9s+AxaofVEdphoLY4GoDNcZ7bjzx2fK0rgJGv7nvJb8ZJLCjP8To/iT8v5ZvgTmRl3MUi65yAOIwvg7rPo@lists.infradead.org
X-Gm-Message-State: AOJu0YwAJ7/Jm4auinygY7LqfNAOgCKODqjirt8zyak7PkBWv3BdeoZ8
	GPF/D+K9WGnrDWdAou8kyDh3vhn8Juy0CiSrtJQf58NJpprV6qi1f7uK3tReY5g=
X-Gm-Gg: ASbGncvrLc/OMtRvSbpfRqgH6185uXcddXp3q6iWZUBw6mPx3K98OQg6wfThZenzAl3
	3qAw+dk5VR4MSwWEAajufWgHTmiz6qtestzcdstth0oWksBNGLITkXBzwBj+jd9rnx7BnhYGFov
	xiMFZND3V62z86iKj6AxGbylvpgsNNBeLD0GHN/7oZhkUnI+XjdSpeFWJSsCC2MfGS/8K/pOeX2
	WuAttPOl2BYIBY/FbjxSsjRxoQzUpp6Vfu8XH/yS2M7a2JgFb2eJualZxApcwXdsM+DXemnjzU2
	kEo3W0s/L2r4ujXumi+QpX45InyYzL3UPYspF2mcX0G+LMVLgxp1dFEugUARG90kKbS0cB/6zxH
	MULT6q2w=
X-Google-Smtp-Source: AGHT+IF3ZHpE7zJB9IQ2y8x59SUdSUcwVopqWk1Zp0WNiDguj5I7CqqTziJa38Gb4iY+V+RufRzqeg==
X-Received: by 2002:a05:600c:3ecb:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-4405d625054mr30574145e9.13.1744819771461;
        Wed, 16 Apr 2025 09:09:31 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b4f3df8sm25248205e9.24.2025.04.16.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:09:30 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:09:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
Message-ID: <n3pyida4e4qhzzeyp4rpswiwiomgumgqeci7lwuimr6r4m5mxy@5s3w2ab3p75p>
References: <20250415112339.2385454-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed2ffzrhvzkyt6i3"
Content-Disposition: inline
In-Reply-To: <20250415112339.2385454-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090933_921981_C526A84B 
X-CRM114-Status: GOOD (  15.15  )
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


--ed2ffzrhvzkyt6i3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older
 controllers
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 07:23:37PM +0800, Chen-Yu Tsai wrote:
> When EINT support for multiple addresses was introduced, the driver
> library for the older generations (pinctrl-mtk-common) was not fixed
> together. This resulted in invalid pointer accesses.
>=20
> Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
> what is now expected by the mtk-eint library.
>=20
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoa=
kqzd4wdi3df6y@w7ycd3k5ezvn/
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I confirm this fixes the booting issue on the mt8365-evk.

If it's not too late for that:

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--ed2ffzrhvzkyt6i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/1jcACgkQj4D7WH0S
/k5aXAf/UP6i2a3y5UocoQPs0pyP+rVPxb+aRfLPNEEqjbC2EfKVw3TBePDcSXYw
62fTt6kjxzOwm4tDzLbKcDzMIqHEIs2W2mE87RbAtUcp8Kobd1qUPJD++4lcIfjO
isr+ZlQXT3mG0xCiZF5AHmhgzz4c3Ggc8RqeGDYCxzD3hj30XznRrOTTCv2wovzt
Rlnu37XuzkHOGMJly86gPc5LSJHDUMyNs/66hNb5h+1v95Hpe8YZ+ZXreQsE9+8T
9QnXW/NtxHg37nY1XIxdE6pBbUbz1jF8Woe83eBWDIwciCTpAeQ+WOFk1bLKf7Fg
wRAaujOB3aa0qRpq3UL0vErWjNaMzg==
=PJFt
-----END PGP SIGNATURE-----

--ed2ffzrhvzkyt6i3--

