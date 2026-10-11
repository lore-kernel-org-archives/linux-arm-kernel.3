Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E271CA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=; b=ldaGgM+qaE6vGkygvkUqQ8NI87
	6Y01R14SBk01l7M0vGS7TLvi4C/q52wX3OB3DKFHFop8cGw37X9FtZN40Efc6xvdqhZYyWMHPbc/T
	jl++79T6R1n4W21DCL+hn5E8VmmULpcYXNB5UCxafjBSOkpKxr2up9TzJqBVufe8VMyhTHzrbZhyZ
	hU+WiXICr7CIU1F6iIAuxe21og4GR8qXpGZbEBLnfLnr7mp3wVuYnk6l5+5LgA1N9mhXkCv3MXRKl
	wCAN7eXjNoqdB/KDglwJPdIr6f1YUEYYXUJBYuun04gywvnfQ/K05vLlzVxE96HyYGGJlfttFqO9k
	eEGj4qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2ce-00000009Twq-1xZB;
	Sun, 11 Oct 2026 23:06:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2cY-00000009Tvx-2DUX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 23:06:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1195522f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791759980; x=1792364780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=YSAPy71IHA1Z9YdNqFkPYWM1U5yTF82Q1KjlMP4Cee8fTRr89QnvzUIfx3jEY3SyIV
         3+xj1W3cUj8RvK6axQWvqgbPiQ9OUwPYu65axRlvsbmViS7Xr6UXZpLg0mXKfcb/3l9I
         CaKn0/mtOXgo3uar9qMXGWUIg2MFSLod9WP1ff4YvzSCjmXNln7YAzqwwQJsYRhgjdqD
         4bwxJXaq98ZQ8VvcazEFDcodzUd8b/rfdMdwTlMgCiKjPNLeC9Zm1S1cSYk6SrPmiMS9
         3qa2FB2gh1AkFAMnGGm3elvbIuY2Yy4ekPlwuuGFSltx58XXx+9Z48qUGmdFWftQOcMw
         3uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759980; x=1792364780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=UfR5K2F4ZkwT54okv5ey4wWSLcKdJmibT4dQMkK+/mnI8botYgdckBBUt0CknMhI2M
         Pk1f5TMfwprpABLUuYsHglKnJ3k0rbpSHUc7vobfvvUYa+JnDYKgHM6vZ10BxXpPYy2o
         k5YZdb81siE83bJJb01jNbYcVrMiEs9Wt0ysi5xMV0E48mK2upQV3al9oy9qs89ymcgS
         Icl6N7QfRQlAElw7vxhJnOJ0puyNtQJM/F/kKhAx+eixk3V/CAfzFB7WyoEv9ZrTLxTJ
         auyKT+Jk49otPVbkbHhYLWrUVe4VVg9z2IeEqz1934l+V8WtlBqSYRihV9LgnTEvuMZQ
         iMqA==
X-Forwarded-Encrypted: i=1; AKwUvBy5ay86+sph/0SSXpPMnzXEK9RfMJgL8if4dX5Q+cdxA4ELw0WX9fYFms4sJYgHoT8n/0ns2b2jFPegbLiQhP+g@lists.infradead.org
X-Gm-Message-State: AFq9FYJIwQCkCj0VINDgKGeBVrnoy33TR5eVjI9JdyFYYuPdAlC5+JNF
	J3g9PprTwJ2VQvmPO127549qc1xPGkrBlzX6C9l/Dj7XxxEM/6h1bJWFmRQrFGmGmGI=
X-Gm-Gg: AYBFou1UVXbrHK7sTEmrYfQ40Sf1ZDor8ciI6fAHG7KXiBO7TKZvAF3s6pUQPyJB2k1
	gY3Q+LNqsCCIhkqoJDXZkX29NszAs5cS7RbA3IZYsczCnrazmUXyxwfPa4BtB8QvS5ed2D16IR3
	RysCFJOsO83a9699px5EBgPKCwhOK2kLMpxLOrKTZLu4NbYWNcsw71DrXHfXlwmS5Gt/u6qr4Mw
	myhIv24GXBwiAp0+NK61ZrBBXft3hwPT/ChLIhr2Jm+N18Tcnmj+MgCwwbijYdDDGOw4Y/pYw4o
	eccH5R+nIf+UWJpaqAdX7sErKwJSlh4a0qiHqu9jPzaLTnCeDbVpiNb0HoHBY01XFfmx+kEdkf6
	27TYllFkcM2/v8jZqngSsS4/squGu2OjM2dyE0dxZ/sIwczs/WmAHMIDPeFmEHCHt+V27mZ8Bm5
	vImWG0uoXqVxCxJq2hSWwkp35WeMbDVlKQr4rC8ud2E2Ks9p9J1jFzSKyQuEHGG2RsSFY1qixss
	WQ=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr13299157f8f.7.1791759979566;
        Sun, 11 Oct 2026 16:06:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dc1abcaecsm12488698f8f.18.2026.10.11.16.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:06:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:06:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org, dmitry.torokhov@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, allencl_lin@hotmail.com, 
	tylor_yang@himax.corp-partner.google.com, felix@kaechele.ca, dianders@chromium.org
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
Message-ID: <aswV0ATke05Aa-q5@monoceros>
References: <20261011181633.1778969-1-michal@nozomi.space>
 <20261011181633.1778969-3-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zn2xrgow5dc2xy6"
Content-Disposition: inline
In-Reply-To: <20261011181633.1778969-3-michal@nozomi.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_160623_074748_D20C3BD5 
X-CRM114-Status: GOOD (  10.37  )
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


--2zn2xrgow5dc2xy6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
MIME-Version: 1.0

Hello,

On Sun, Oct 11, 2026 at 08:16:32PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. This file introduces a
big amount of unneeded dependencies. You can rely on <linux/spi/spi.h>
to provide of_device_id and spi_device_id (which are the ones you
actually use). Alternatively---if you want to go full iwyu---include
linux/device-id/of.h and linux/device-id/spi.h directly.

Best regards
Uwe

--2zn2xrgow5dc2xy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFmMACgkQj4D7WH0S
/k4MXgf9EcZ3GfDdHxsy9EN8ExCwEfNg60ObLE8QD0gdVxF+YdCbdpGNF2XrpYvk
exy5MWNHx1evhGI8uT/bu9C/jyhN3agP3CnjN8IYUDxTDMIt6AnsMR8o/K87exej
Jwx8C3Y9Yo3SQpDDR4mJF9ftPo4LgbCWne5l9cEAMH4M2i2xBYSZrMNHdPsRZ8rh
91JD5Nl0fgYKcD290dVrM6Yyzy0jTpbUgTEm039g0ev8eEvvylQcfsP30oqEDaI9
sHPHaxeZY+jPpKiOqzfBMP1IzFSQNXt86mzcWDLKLVHalJWEh7O1dnfv1SqWhPEA
s2aLRmZvKqCLimKqBYM+vLnmUtqynA==
=yG/u
-----END PGP SIGNATURE-----

--2zn2xrgow5dc2xy6--

