Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A3CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JnSzh6uRY1DGm8qF/E1ET6S+smMFNdEHSczgKhtiNs=; b=pf106bSxJwubfxoWYrEaoR8hJG
	0MWjcu5kLZ7kV7hevh5s1/M1rsS7GeZ8FHJSUfAzjvfvc0jruGWcdZoqYVw8vBkpGl7iI53A+pKna
	AAkalhQuaqgihbwcEPIlpK9/e03PgBBrxVuam/S77Q8N7QBGPb/1iyBGowMr+Q6edgI3zKNBx5N0G
	26/8rbvAAvIWmEBMgCDL5Re9hIuu7QjgIDoEGalXaRzh5uRokyO1RsfvhHim7WCyJpoHZXUFKfWD0
	1apKirNQDUq90u8L3xLMUhxGqgRme2PIU5OWK6qyYC7NastL0NmSVZXziy46VxiBBmxSaXEbUbf0M
	/otg28Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6rN-0000000GNNC-00Cg;
	Wed, 14 Oct 2026 21:50:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6rJ-0000000GNMM-1GDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:50:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so37227275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014599; x=1792619399; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JnSzh6uRY1DGm8qF/E1ET6S+smMFNdEHSczgKhtiNs=;
        b=E+tuZZ57YmseSjNoZNDvBO5JpQN36Edsmb0b6XyQHELOxTGjiqgdbZzgJelabAVCt7
         8OHxq6Ixu0Jg6gGzUStZ+T17tI0etStNZ/E5VAO3/MyCyN1quOBqXEWijo1jErpdZKad
         3Jw8AOngyjS9xiowzDZLURc8Wo7fzPaIwNy2L1jkzTZJvQRCNoMhzz71B3zuOnF28/fe
         hvwv0v9YZVI+VRhFHdU0Y+jN6uVHVJbjHhiduhu/FmARCRjHBG5QTCwz5LMpw8qP0rkF
         9ErWYi9zZ5Fvxz+Xr2EVJnVko8tJMbFmXYHSI9xge0JcroGrOmLXv7uOd6DCTQj8SX6e
         nN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014599; x=1792619399;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JnSzh6uRY1DGm8qF/E1ET6S+smMFNdEHSczgKhtiNs=;
        b=15FSm4Ftd8RYMIGVstLOyeR+JDCpHZ1QcfFHerFFLIhMXHdUVhjjZmkyWT6P2tluAn
         c0qoMFCTUHtspJqZJK/mz9IEJMY6BW2BihvHRkprG/2HCZsLdYExoDM77AQD9h3ja+RY
         d4giKWRw1VZiPj2OSp94Kj9L89yPPnRO/+dODT3vAhLNlHeOsoJZBj/JL281n3RxbJzM
         tJgtzGZplJ7KuaMUTjwrYaXeFyqI1NB2lIo63xWyqiDkUUj26dFiEOR8q+WeLoGdRz3H
         rF3jNsQey5kxKXqyREnuacXFpt89sZV3LGxla566wDsYlgsBEYHgjzqPbE2EJya8jQC2
         efhg==
X-Gm-Message-State: AFq9FYJVt5ANb4wgrb9zTrUPwoWcbbRCY+znPTuT2ajepzc2KCf3LoJA
	fLHRjz6ajiWrJFdmzpypomnu1flFfLWo4k6sZpt95wmF199dTuEsKQ11l6kCIIdf
X-Gm-Gg: AYBFou28bdZ3GY+Ow6fjMj/mMih4vKgmIjB+CxUmON6/KYEY4XsMOqFj1D0710tJFyp
	zDt62mx63Lk90d9pl3UGVrp+JLJcYML5uCWVgqm0HpPxtQXIAmE93pRhXiMActFgX0baAcqHyDZ
	yUF5JyQmxkVKS8x2no1AhLaFhdP0dmigdXnJyyZ17+ePYeL4T0+LF0pcMWkQz0HIdCf9D6qgzBC
	9OJKKk23chSERAyyPkPcLqMOIExmtNRAf3C3DWy9R387tWeNt5bhze9gXH/FrkvQZbOGmwqUbWt
	geTvbDjMqku3cTQM/zXoA+TgLz5PfqUxztVRrGQdmccYAvMVfvcjdOMeL8rR3GmJcsWRC8YMqeJ
	mx+rVFhG853CfrCnhPWPsU243bwlvAIkdWjZ2/Babumu5yWP30C8iQXmSG6DmyWLoJbo+Ko0hH7
	ObCN/TnLLmKCqZbRthtHql8wtDwu80AnJNpI8Nf5tSSzsUmt6hPSN4J0khld9Tf0U47D+rTkvEH
	sppUOlUYdcdPqx1THDeluBk0g1ub4ugBefS00kPD6HgyDqp+aE=
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr343979005e9.6.1792014599154;
        Wed, 14 Oct 2026 14:49:59 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm19614465e9.15.2026.10.14.14.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:49:58 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Wed, 14 Oct 2026 23:48:32 +0200
Message-ID: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKiOmKHBbRlSSdhbtK6AHkQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_145002_050501_6D4CE849 
X-CRM114-Status: GOOD (  27.83  )
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

--nextPartKiOmKHBbRlSSdhbtK6AHkQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 23:48:32 +0200
Message-ID: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:44 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
> topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
> for child nodes inside topcrm.

This would be easier to review if it were split in 3 patches, one yaml per=
=20
patch. I'll try to comment on the details anyway.

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: zte,zx279128s-crm2
> +      - items:
> +          - const: zte,zx279128s-crm2
> +          - const: syscon

Afaiu this makes "syscon" optional. Why do you need syscon? Why might you n=
ot=20
need syscon?

The goal should be to avoid "syscon" as much as possible. The meaning of th=
e=20
syscon compatible is that a different driver will access these registers=20
directly instead of going through a properly exported interface like #clock-
cells. Is there anything in crm2 that is not a clock or reset?

> a/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
> b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml new

> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>

I think you should be the maintainer alone here, I don't have the hardware =
to=20
do proper testing of patches.

> +description: |
> +  Each of the two groups of low speed peripherals (LSP) has a peripheral
> clock +  module (LSP CRPM) of its own, fed by the top CRM.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zte,zx279128s-lsp0crpm
> +      - zte,zx279128s-lsp1crpm

I think splitting those into different bindings is still a viable choice. Y=
eah,=20
ZTE gave them very similar names, but from what I can see the two controlle=
rs=20
have nothing in common.

> +patternProperties:
> +  "^phy@[01]$":
> +    type: object
> +    description: PCIe PHY child nodes

You can drop the phy child node and just add "#phy-cells=3D1". See https://
docs.kernel.org/devicetree/bindings/writing-bindings.html : "DON=E2=80=99T =
create=20
nodes just for the sake of instantiating drivers. Multi-function devices on=
ly=20
need child nodes when the child nodes have their own DT resources. A single=
=20
node can be multiple providers (e.g. clocks and resets)."

In practical terms, putting a child node into the DT makes this a public AB=
I=20
contract. The alternative is to split the device with an MFD driver or usin=
g=20
the aux bus. In the latter case, what components a device consists of is a=
=20
driver implementation detail that can easily be changed later.

The PHY subsystem has a quirk that devm_of_phy_provider_register wants the=
=20
device node to have a DT node, which is not the case if the device is an MF=
D=20
child. device_set_of_node_from_dev(dev, dev->parent); helps.

The other purpose of having a DT child node is if a sub-component is likely=
 to=20
be used in a different piece of hardware. syscon-reboot is a pretty generic=
=20
example of that.

> --- /dev/null
> +++ b/include/dt-bindings/clock/zte,zx279128s-crm.h

I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.=
h.=20
"CRM" implies clock-reset-manager, but the -reset.h header has the reset=20
handles, so the "crm.h" header won't have them.

> +#define ZX279128S_TOP_PLL_A9		0
> +#define ZX279128S_TOP_PLL_LSP		1
> +#define ZX279128S_TOP_CPU		2

Do they all need to be exported? You only need those that will be used for =
a=20
clock =3D <&topcrm ZX279128S_TOP_SOMETHING> handle. That could e.g. be the =
CPU=20
wclk and pclk, but the parent PLL itself can remain a driver detail. Most=20
likely all your device clocks have a gate somewhere. In my zx29 case I only=
=20
export gates from the clock driver, with the exception of the Cortex M0 mux=
 -=20
the Cortex M0 can't be turned off, so it has no gate.

I realize that a lot of devices may be missing from the DTSI in patch 23.

> +/* Low speed peripherals 0 */
> +#define ZX279128S_LSP0_UART0_WCLK	0
> +#define ZX279128S_LSP0_UART0_PCLK	1
> +#define ZX279128S_LSP0_UART1_WCLK	2
> +#define ZX279128S_LSP0_UART1_PCLK	3
> +#define ZX279128S_LSP0_SPI_WCLK		4
> +#define ZX279128S_LSP0_SPI_PCLK		5
> +#define ZX279128S_LSP0_GPIO_PCLK	6

E.g. exporting those intuitively makes sense.

--nextPartKiOmKHBbRlSSdhbtK6AHkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP+LAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiZU8QAII3V/w/xVzGX/pRFfpS
42pGLIJGE3EDmanSGuj8ztdc4DUNBzuzuPpXp+xCmgIyDIUokzxLyrj5PQhehLNp
qaKehvOsvlckx/h5Z4ZFYW+rgjZtSLFD6/GmeeXzSdqUcfDUZr8BVKlxOcyIIeDe
pt0C8+bupAw+hTZxnf0V+/aN3OhFlhBuyv13tHzIApsOWl0W78iSfk8AFo/hpfrS
19VeqvlmLx9GuHDxHkkLZp2LcXANHQcW6/kuDBHY1D7N9CtJvaHS3d/uHwENVna+
U/HoZvfGY91niTHjClR5zWazHFN3ZNOXQ1SjwECfKmaBPXSiiPAEkQbDVuwFkdP5
Wcq+7vW8ERwBLyY0GtkuPIlrf09jXFodZE78h9Rz73dMEHLnhuSkCal8A7A0jWUe
7F7cIsQQtj/H4jaf0EtJHUmEzluvA1U/hzGqamP16b9mdKidERu7jeqF5DznAjJR
n1GFXS/4KXbGb0ae0VhlveMEEDOrE0vPc5pAbf0MbFvyEuB8c92LbEa+zcgE5RKL
RjMWm/ZylriszvK1pRqguVFyLauoQMxbPxYBMUzR4oW/42PFCscCHeq70yXlnbow
t3IZ2h9y6jIpnKti4YSwLe6vHqy1N57YVq1NxigFSGThA6wFfh/mnPts/8c/wHF0
OsHPbBD97iWsYrs78pXxUsGr
=Aaje
-----END PGP SIGNATURE-----

--nextPartKiOmKHBbRlSSdhbtK6AHkQ--




