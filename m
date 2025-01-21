Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04846C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=; b=LSrEUfNfrHU3BVtuuspVvkYlXR
	WOFZjeJOMc9NxKBqrHhToYduhU5nXFwMnM8J70M8ZHJIk2OTsCYsbZFfy4RGGueJ9Ekm91G9PnRAR
	cvW9AwHLBAFfGJslVdjtOyrFKqY4YXqwHBW17XTFF+YFxLSI2CTR/dAE7iAcVQuQRRlsHLXqecHM4
	f+n2Al/Xg9GSYiodBkvUVo3xkNm/QCO5v5jwJqYkRZnvoqEX7FVeHNLL6nuZXMcabeELGE7MxaVOM
	9ES1SDwSB4aGe1eM3077Km/J3xenoCU6cqGbdSxEB2tNB/BdU31ZJrYz4uHnEUL4GiIu3GHi1QOdc
	w29Y2lHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIPe-00000008WWR-01t0;
	Tue, 21 Jan 2025 17:51:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIOM-00000008WSW-3xet
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:50:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43622267b2eso59201595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 09:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737481821; x=1738086621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=;
        b=0TPH8LhfprQVu/lwoUD5EbeYxNO6iSWZEwgVSqS35zIhnAYcGeHK4YykoF3bjlBWtw
         4C9S2EcNkFeJ3DTsyD3Qy9Xswqd0N66+TzC3oxOPHTST0HhMqFdqTHYRbzRCHeiedHcG
         qlgis1zry3sOgUmZ/PJ7SNAalpktEM9Uc+KoaK3apjJiau+uwLpruR1F4pU9WUQMXTdi
         2We4feA6e85GDOxiao+fW7JjjY8DPtLOaJylv9pSICBdySkyrISX93J5XBL5BxcWlht6
         eDQSvzSG+/JqS/rs4FatjtadAMm6YcLtrbJs4zh9zV9R2xbAW7IWMdaJ5y8vp8eiQ8VG
         qqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481821; x=1738086621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=;
        b=bDbGN/J+Dp0DkJ3FxRissDTnrmopDYKIDXx6KT+HnChE6998p3S+jC9ETIKIFDrSN+
         zGwllCNRjGIvCU3nfGldrBDRyk+2rvLFlgcBi8dri4UECWeWWcyqjlwDWHhftdrUVhVK
         cVC2HDsyGznj9sA0iGbq7AcASrfbeFuoriREfsKik7CYVibi1xu5/YDF+uStP93/26/U
         rzgQHXYAWICig8ZxAc//XvKvR6L/BSd5N2bXODZWiUvhdJ0vFaJxrq8sbwWGQUwLDeP4
         hoStwcUG8+l5g1g++z5TiWlx9vlFveQqZiXMYZ/WOqKo4JYfFOvFN4zpK0XzV1U08WKy
         xrYw==
X-Forwarded-Encrypted: i=1; AJvYcCWhs6djV46FB5VfHWn4+1F5m6mGKpn6j9Eekzk5x1FvbPRB5xhDNsSEmt+oUVsMgD2Z0CGnyraVsaZdpvXq9BHb@lists.infradead.org
X-Gm-Message-State: AOJu0YxXzXdpMGMkBSasFpA+h8EovpwgYrHQCd+Sfxf9WUZA0sDxTRs3
	6JgCdeEDe9bw2hNj26thq2c1azYSEwv6ajZhFc8xHLo3dC9qBHCTXL+4NEsBZFU=
X-Gm-Gg: ASbGncunPcXfF1NBs8plsWg8ftks7V9BuS2KeN7n2EFuWoJsdJvz9179raXidVVGer5
	zlmSi2l7yWOypIciNk/yuhqg/OSwtFcJvSsq4mH2CitLhlfog6VBYLd31VpQpjDLEGI/vNu37J4
	8LWwMn7Inx3Atwys+V2tmMXaTpmqlRCEZL6pL9TgXQNcpej15UCiTu8EMmUkaE6BWR2VTMtnfO8
	L0iy/f4nNEldenPA41e08iKp59TPiplhTjfBxuOdOdXthY+ySwDHwmVuQtD7QFgktYSZTdg8tWr
	cPgrxN66TNUs0Vf2HAzFatnpkfqD8UM/kBLO
X-Google-Smtp-Source: AGHT+IGPbhDxMbt3iYzgXLX3wIo1AlxBNC0CatVnDX2Ryc3K1ya/vSA+XrTgwj8dmgoeD68B8Htdsg==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr167514035e9.13.1737481820805;
        Tue, 21 Jan 2025 09:50:20 -0800 (PST)
Received: from localhost (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f0a:fb04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499884sm252100635e9.5.2025.01.21.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 09:50:20 -0800 (PST)
Date: Tue, 21 Jan 2025 18:50:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
Message-ID: <rv3ej2tdmfff2qilnpgvef64ujrozuplu7ix54rpd25kbrbhwd@zm5sjyn2vjra>
References: <20250121084818.2719-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ug4dj3w4uiulvkrk"
Content-Disposition: inline
In-Reply-To: <20250121084818.2719-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_095022_991192_5B5560EE 
X-CRM114-Status: GOOD (  15.05  )
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


--ug4dj3w4uiulvkrk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
MIME-Version: 1.0

Hello,

On Tue, Jan 21, 2025 at 04:48:18PM +0800, Wentao Liang wrote:
> The bcm_iproc_i2c_init() always returns 0. As a result, there
> is no need to check its return value or handle errors.
>=20
> This patch changes the prototype of bcm_iproc_i2c_init() to
> return void and removes the redundant error handling code after
> calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
> and bcm_iproc_i2c_resume().
>=20
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

LGTM:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--ug4dj3w4uiulvkrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeP3k8ACgkQj4D7WH0S
/k7QlggAkOfHqgXrjFpc18b6r08Yz1N73AYGtxalMar9UBjbJ4mnvejHMlCZw1S9
iMf6fMrZCQAdZQYoPQ4xc9Ri/EMTuYoNUN6SWnS0P53f7HIzpzSEZoYwflxDDxov
rbPlhcXoCZPQ0eywbXbev1frxH06OPwj3Rb7WoECfJY18Tb1czKjgGa9vwS+otLu
N4ZYlUQnbS7u0PO/omVtMB1voNBJzRVqc81tjVrwIHJjzLPf5xFHfjy45vbiCH5O
ZabwO/ZQZWtHA+zwUjJ/UCM+8Wc948R+hhzDHRhipHO19/Y6nTqACwZ3hQj/ncay
hhKz/yQOBncrz8yjTaAC+9AJGRqRTg==
=q30A
-----END PGP SIGNATURE-----

--ug4dj3w4uiulvkrk--

