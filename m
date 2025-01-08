Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cuSrltjvkzxAoQOtMu4WRHfXq6bp8x92iDHnihbR3k=; b=NV8NE1HWU9yl+J+nxy5G92el9Q
	KB2nr/0x3f2BJsP1zsU0Z3uNfE6ydpHo1AKeJcuqH5IptzbNQoBDMWaSfdjiU0n7RUAcltYicVY0V
	p5Gj8N2cNR8gYsdtbER0QdUFE+PLhtlLCJa01Xy68E96htip/3dL/nH6n38ii6JCRP8kHi3qGjmqJ
	LbqzO8TZ2TuFawSqOXk5MM94Y42eJZgWlbch23preXj+AfU8eObs7t4HOZWv48ot68PbyqbHKEknQ
	bxLBO9PXuoNLLlEb1Qoa4DA8yTeU4dmUKoWOi3Zo2pu1I6jzBfx6wFLaptqjchccg64BNWR9KbYl6
	RBpiHXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZJF-00000009Gp6-2lZC;
	Wed, 08 Jan 2025 16:53:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ4b-00000009D1p-2bKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:38:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43621d27adeso133255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354304; x=1736959104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4cuSrltjvkzxAoQOtMu4WRHfXq6bp8x92iDHnihbR3k=;
        b=CaWqVxJXSaaVFcsCQwMR20pVVs7q2T9xps+T7InhtMXLTiuMiHIj+Hq4Y+T5KueX+B
         QZd/dgNGkX64sbTY8aoazBI4O0IFohahmwLEwnloI8zv6ytkrkOnvC5Ht8uzuba9s02o
         p8ox3WQrEVgN9sXhPQM24EyjGDPFTKFjvMiQskOI95f9roy7PGXfKS9QXtizHKPpOok5
         kYjYiUuqQBY9HNnJqOdHsWkh/hgwuR0LYm9g2ZtVOrOFTJQIwGciEzrQ7huxJYBYWij6
         Y6mnn4htr6Gn6uDaSqEvvv3kGqRCvFmvX+qYE2VIGxnQPypR0+65xp2ybymsrwBkpMGA
         TVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354304; x=1736959104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cuSrltjvkzxAoQOtMu4WRHfXq6bp8x92iDHnihbR3k=;
        b=Cx3jp8jsjkpMBJyhieaL1NXrgDiAy+l4rtsO2N36rrFZq44b0PX9UAd+qIqPBa3I8u
         p0Is+5ozci00VqIWqlsjs3kpt4TqzaX1napiLIU3l813MAEA20HTtMkpqlt81semnTle
         K+aCZcnz5Emi2Y7nhdq2x+H11TUq7XVJdy5ooo5DPTd3dz91VeAxh8Ab4gMn9z4LGFUL
         382KjiuE/yZiaeX+IRJAZ4nchMKgDczYefY1jDvgGbdf/xfxAUT8/XZiuH7KcBDajz5s
         pFv7IctaiuCGAX/dsY+sxt4YnpU1kk2vZilrCgXmdg31QQd7eOuQTDO2S0xwmeEBI/K2
         9ntg==
X-Forwarded-Encrypted: i=1; AJvYcCUN3tfHzA8iV/wK+R61O2N2lxZrjiliUTH9+YVsSXjPYmyVpYcXJNNonKVRnddb/xg/h8k4pd2TEUugVlWFGDFS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/JSq8g0q81OnY3K36kSsKXqC1wqN9jgbX0BWFBxxlwxj4ueim
	flSsdRRs6eOBNUQ6GuzTG/Zk8FnsE2Hw+Ze9FLoNHpmkeiJ7piEB
X-Gm-Gg: ASbGncsRlAWX7h/vE1mwaGazUH4t16fwTszAbyJ3vf9pDZtHjxUr0a+X7oyH5vGo7j5
	YBTqbsQPxL4YUK4viZOa0PmPH9JMQd+Gfr3bob45C0Gt6BOPIDIj4f+6Yb5jnf6z9vY0P+aiBmj
	3khCxJz491sW2ISZyWP64sJSbGWdkjDKsPXCCEyjh0KR4dE+CpcsbjYjfaXlCEbXgYGXqpcuPXj
	C1EilCFpiTfquYvKifQkcAcEKNWEbdUnfNnvdE7KGytCPWYIuPE/YXF5Sx1fqxu5LzRQ7/umjZy
	epb4HSTUMRmWeoiAFA3Y32NVXpuQ/ym1J7cCLnt7nR0=
X-Google-Smtp-Source: AGHT+IGp1cgCy8Xm3K9YW0ye3mjPWJQZ9C81gUBXymA3f6FFEe37p3slvzHvRuRGSFy39baH4a7Gig==
X-Received: by 2002:a05:6000:184e:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38a872c93e3mr2679293f8f.10.1736354303999;
        Wed, 08 Jan 2025 08:38:23 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e22767sm25890945e9.39.2025.01.08.08.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:38:23 -0800 (PST)
Date: Wed, 8 Jan 2025 17:38:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <uyld4j6frger6oe332c4i32lkk5ue7ifrhu3565lrcn2xwc5xc@hgfyaryobqz2>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5borij4dhzmoodud"
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083825_660243_27D08D76 
X-CRM114-Status: GOOD (  16.25  )
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


--5borij4dhzmoodud
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 02:10:13PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    |  4 +-
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 38 +++++++++---------
>  .../bindings/usb/ti,tusb73x0-pci.yaml         |  6 +--
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 20 +++++-----
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 16 ++++----
>  15 files changed, 161 insertions(+), 161 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5borij4dhzmoodud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+qfwACgkQ3SOs138+
s6Er4Q//VZl8qzubU2vGD+vYdws9AIeAPkYgq0YF3ngrrr5mGTubUKQ7Zz8JK///
i/3WJevwDy2USeH86kJMNE9iNo4IreDdz2QsYaZzAb8lArTFezDCTHJrqyBDniQM
OCCNB7QNsWqaUe9H6g4NpfD75Bwmhe114ywlB7hj3WzOVa/KTYF3TtE/Ktp4JdQg
MSVpkv9wmN3RIY09OVtpmgIjbJ+te1tQHALu405trlrtG6HtjSmcVGAdrA1U+A8Q
x+miGhfUBdnoXQehPW7PVLzMCqo92ToQPmsjhRgKVMNixRqDJlLHhTICIuaNgtFB
KnO3meD4Z9Tz5H+ZXdRwIL6/HkCr5ofoqKll8Q0ihoDsq02auv7O50m078coyQv5
kyLOjhVr8e1BxNv/gQ1msux6UH3R7oOeB2Dz+tkzgheVbE4sbgsrxc0qA9smcB7X
G57z8Kau0/nZiUEKKsnleEhEtyNMfOFE+Jw1evYNp24D4OzykGpuaJfzOlG1Lse2
jGaqgnw5EqRNF85hVVOHXqVzZVVFQzw5gRoBBbbcsXnC9iYXdvmRWSMZzdBUEVto
vwTMpeMD4fFfQbxub/u81Q8800zwF8jow8+ivNd8cPJrzWznKDQRubvPOoTl+HZU
ODkzlPRv8vnNYUHt+Ug3/L00O6fTOdZ/+MtCX7hFZNA4Rde2Ewk=
=DdZu
-----END PGP SIGNATURE-----

--5borij4dhzmoodud--

