Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0DC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGRgdcL3hYpLvnGFyKUFvjXygNKkl24WYKGarG/Ntdo=; b=GxS05Ko3mk+KUcjMzD3ZJSAT7w
	Tg/+yg4zCr0LgPYIXoo14BEj6SglmLXDv71zMDfHC/B7jUxQc46vFkgPZRyQyxZcSkYlNFIXtoe0/
	txLfFb+2ONHKXGr1ZdAhZM2CWAt2iGBKFbgDZuFn1ast/mkKrmJqNtw6KoBbrjvwPsD6SzPmbnMe8
	FABTKYY6IfJxwiE54yrBXZKIU4aeT4+qdcIqb4x7B7QpNruEBJPtBI+ogRWvWKUV9lq5keTGD4e+R
	rTt9K/SVzqx9QdcvsAWv7Ew53RCcbHE7WLAzPCWTjkZb+r2CWHLcnmV7OWKJ/WqY0z5dxUEu1dHlP
	Fun37FDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4fD-0000000GCrO-1Vo6;
	Wed, 14 Oct 2026 19:29:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4fB-0000000GCqy-0t7Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:29:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48bbb06e746so540864f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006159; x=1792610959; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGRgdcL3hYpLvnGFyKUFvjXygNKkl24WYKGarG/Ntdo=;
        b=and7twk2VDvb8Hi4A/6wjdnOKie/VRd0mU8KMTHU9Bji1fBNqGE923XzEr6+iz26T0
         a/RK3va70wbZBMRM+ssy/Z5YOp3GyIZvnXK4//c66eoZybzbat+390pXfRb/xErWrGgc
         SqU6aE1LcwAdduV+GfAf0M5CwxpumH0glqApZKYJ7uodZbDvtviUod3X3suhE1rL0XxF
         o5epxaW6T6FW87znQJyzH1GHsnEXbMx72CkQDVYol1YPW0yAXuxr0t5y9I0Cw1xQ+F00
         tQCTEELa4ZP8wRLSy/Uv0pgy06zjCkDyjykAV/2vg7lTxLmyMs+7QIF7nVxdJ/EkHP9n
         KrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006159; x=1792610959;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGRgdcL3hYpLvnGFyKUFvjXygNKkl24WYKGarG/Ntdo=;
        b=od/sm95AgPHHK9eCITuyRSv+blXVsdp8jSWupZzVrbV8poK8vdswyluR/HjPBDGEfa
         Uxlq+fj01IivZHsqzAIc5VaTOQeQDwVZtraGTy/T2mwhsvAnyqFFTSLCXqf35U+tEOW4
         ezczD46YR2ExL6IFx/9idehEwzkG/UaejQNNeGElWmm/TpxASKbZsNr2eZHWM9oCKEZb
         1fn+TaB5XhOiDBHUbpQsFG9f26W0GX+VgUMz+XHB4iRAMZMDpb1m/THT74rZezTHQq31
         o1jbBUhoIIT+g8BLpphyYBWoj+eD/C7vk9MR5PkSbjiwV5FU5v19xJavLiUKkYDcdBvO
         2WfQ==
X-Gm-Message-State: AFq9FYIBBGmpE3bLvZl6zm2J8Gik5DpFVWPmgVVTRDBFlDFRLWA+Lj1G
	A/KBFYu6eUsPbyrSrGOpBevp7v5wDHdrtK2SUiRsmZq4Qsdhpkze9g6jN5GBpw==
X-Gm-Gg: AYBFou1fHHsT8b8EddLtUv+D+yl59EzA2Q0OhP9a5dpHjkEALDmd1Z51szh9pz/bguE
	kfT3U30yx+2dZ5Mu1gESfiKxpHKbM6O/WNSLy7dxOSjghSk94gFM5yIVtQjSMM/r6WPFKTSOGf6
	y9Ynidni9zF7PjWPuSrG9dTlyJmFJ1xFnEytLvruhSZTfyrptHvNPFenXMalahszKe0LiqWgiIP
	J9dkR8RsI/Ytav+xO2RkYVNog3XNoMwLMAZV47S7+e8rd8dGk3yH/Tnt2se5bsLHQ+sBe0/N44o
	UU84hJ/ZBlINSsNFJz1jAL3OoEpu2lEfe+eXNoQdjvCwV1KuG1AdADeemnq3lk2fxEaS3179oYr
	nYASS8uNvZf6Wip9ihR1/28R0RGS8o32dYZpk29WbaYz8Q81DVlQUXurRtMJESNpJfhc/wGHZ3j
	8ZVeRZCtTz9ZJ4aciDwVwbPezX2J2C2gDAfOcDeL5/DC2B1WmaPutvoMJdjVeD8xaMyQCAmmSLM
	IoGuHImrrB4E43+Mik177ZsxRnWihC2TpPiSBJ2HgGMDIZHKaQ=
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr324226295e9.31.1792006158806;
        Wed, 14 Oct 2026 12:29:18 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm15366385e9.1.2026.10.14.12.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:29:17 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Wed, 14 Oct 2026 21:28:05 +0200
Message-ID: <bE7m-smAQceC5FbpqYFgPw@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartn0EpJE-9SfSFuAAbPf508w";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122921_287675_E9D86592 
X-CRM114-Status: GOOD (  14.32  )
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

--nextPartn0EpJE-9SfSFuAAbPf508w
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 21:28:05 +0200
Message-ID: <bE7m-smAQceC5FbpqYFgPw@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:21:00 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Add support for the SPI flash controller found on ZTE ZX family SoCs
> (ZX297520V3, ZX279128S). Implement tuned PIO to avoid redundant FIFO
> depth reads, dynamic CCF clock scaling, 4KB operation chunking, and
> optional DMA support.

I'll diff this to the version in my tree and see what I can grab. I don't k=
now=20
if I'll find the time before November though.

Thanks to Navid for testing the driver on different hardware. I'm happy it =
just=20
worked :-)

> +MODULE_AUTHOR("Stefan D=C3=B6singer <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx29 quad spi driver");
> +MODULE_LICENSE("GPL");

I plan to submit this myself eventually. Right now I don't think the state =
of=20
zx297520v3 support is ready for SPI (no pinmux yet), and the code itself ha=
s a=20
pile of todos.

If zx27 gets to the point where it has the prerequisites  are upstream firs=
t I=20
can speed this up of course :-)

--nextPartn0EpJE-9SfSFuAAbPf508w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP18UbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiYhMP/3T4GABMIAqaQToNO4bW
5MxJeHgXF4/Y9WgnyJpEShP1rbz33EBc9GonZUdR4gXd5G2lBmdHxOJFfyGr4BZ2
x9peuvHNo/sPJyGKah5Vzuc7u8xZNr8btz5Ii84aQtIZVlaSpeR1S9cJBEmIlGZ5
85/3Cj1IzgkVH+JcNEQtKzGzktNBoUBCnENMmwwH8ipgaaCcoIPgNAdRJpRFGzWp
e2rxRXAy+myHu2LYVxxrO0oKjb282Zww4QOqfdlg87NALZPYwHwNO4c7pVgWILb/
9jg/IXAuSj4ZL0/FmYT643GPLeqpIgkdD5wdY4o3tpJoi9CxTazQqp/8sZtQb4Oq
w/TnwFEKasPUKrgJnsOjYBwAeSuRPeg5ru5+P25cZPiB9oEGB/HpZvlHHVW9LC8A
Ife9JcUXnRYmOzyGIjhRT7QOX1BGxjiHKrN773QZetafZCvjMh2QnfTdb/1ENB9E
qWDOEBNUdXjhbsT/d4pWn5pjdufUni20OcHlhBaOFMZFabF/nWdUFN+/wXKVP0BR
twBNS/vtYkhD8LU/40uBOKzqHXOUVsnQn5R/hc5/LbvhV7mPnShsqf3Q2aMjfFHk
pb5hJgqiBHD4iFUx/6Rh5tfnyT920sdUj1vB5gGOj6JZJ1pCGr5XJSAoZSBmy8Mq
l+U83RloZSQSKjTwRix7tXWx
=cqfH
-----END PGP SIGNATURE-----

--nextPartn0EpJE-9SfSFuAAbPf508w--




