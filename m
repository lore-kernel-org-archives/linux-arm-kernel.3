Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C67FCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpnkv8sjp18UMvlu0bszxjEN781OkuOaq6ugdu+OZEM=; b=vpIK2ZuYer5vswKheoB9XBl8rt
	qmLEMMF0Jp9fLSgDiMMfz16cyye2IDaw4Gt2ovOqz+ZF+hyeYwydq0auvnJkhu6SIcU9RsYNzJA1n
	Atf4aQnX+V4olDCJ/g4/I82uzmMCnTcQgd9rSraglpLIsOvaiaadZeMLfJVnVPOYb3hi/aMjo6hza
	znilTaBS75AXUbSrBjTO33rQXHSSOIqWacgrdkru1DB7+ko0s7mplSdlog78Rh48dxd3TskeFNggK
	EzGXY9G04F3RQt7C2Y+mn0TMb/kcCg8GfxGN63TmYA4jBUTJBwFb3UHGuj5WezueiMwD3dpMT6yQh
	2648qx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMNi-0000000A4bk-1xJE;
	Thu, 01 Oct 2026 19:23:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMNg-0000000A4bc-497s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BE994387F;
	Thu,  1 Oct 2026 19:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504511F000FF;
	Thu,  1 Oct 2026 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882628;
	bh=Rpnkv8sjp18UMvlu0bszxjEN781OkuOaq6ugdu+OZEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fY1V5cH1JLiLTot6M/QR5x9Z67RjCTDyu9UEu5ze3oJFHI4vMHHgva5vxSOLb2mmj
	 D03ZXFpoPdcmas4irXiyv+uhjtaSZkG5wySv9VOIncBFZ/2casOgi6aIr1RgfIa1Kx
	 YKVo11pY8r8//bBs/I8Gfxzx1oK0UmbjuM99UMa4RsJvv39yikja+Jda9JmhIwRGNl
	 mJbkg4idXCXMkWflnCNf6qfiwUWXQK+5EtP/8eSWJ1YKcaYx3urELmJuZRP/0pquAs
	 c1P39wEjLmUMvVJd9gn2EM/dg9Br3QQLcmiOvZn+9xOLp4572zx5DcgXRhMpKCAXpM
	 4q6QIueiIyT5g==
Date: Thu, 1 Oct 2026 20:23:41 +0100
From: Conor Dooley <conor@kernel.org>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 04/15] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Message-ID: <20261001-attempt-savior-5d4a0eed4320@spud>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-4-486cc289a4b8@ambarella.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWgF0jKgF/ClaY3B"
Content-Disposition: inline
In-Reply-To: <20261001-cv75-v5-v9-4-486cc289a4b8@ambarella.com>
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

--HWgF0jKgF/ClaY3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 08:40:53PM +0800, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
>=20
> The CV75 GPIO banks sit on the AMBA PrimeCell bus but are not
> register-compatible with the ARM PL061. Each bank is 32-bit and 32
> lines, with extra mask/enable registers, so arm,pl061 must not be used
> as a fallback compatible.

What has this got in common with the pl061 beyond using the PrimeCell
bus? Current reason for putting them together is a bit tenuous to me.

Cheers,
Conor.

>=20
> The AMBA core matches the PL061 driver by PrimeCell ID, not by the DT
> compatible string. These blocks do not implement the standard PL061 ID
> (0x00041061) in the ID registers, so arm,primecell-periphid is required
> and is fixed to 0x000e8061; the driver uses that ID to select the
> Ambarella layout. gpio-ranges is required because each bank is a slice
> of the SoC pinctrl pin space.
>=20
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       | 25 ++++++++++++++++=
+++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Doc=
umentation/devicetree/bindings/gpio/pl061-gpio.yaml
> index 4d970e55104b..c22dd8a1d2c1 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> @@ -15,7 +15,9 @@ select:
>    properties:
>      compatible:
>        contains:
> -        const: arm,pl061
> +        enum:
> +          - arm,pl061
> +          - ambarella,cv75-gpio
>    required:
>      - compatible
> =20
> @@ -25,7 +27,9 @@ properties:
> =20
>    compatible:
>      items:
> -      - const: arm,pl061
> +      - enum:
> +          - ambarella,cv75-gpio
> +          - arm,pl061
>        - const: arm,primecell
> =20
>    reg:
> @@ -64,6 +68,21 @@ required:
>    - "#gpio-cells"
>    - gpio-controller
> =20
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ambarella,cv75-gpio
> +    then:
> +      properties:
> +        arm,primecell-periphid:
> +          const: 0x000e8061
> +      required:
> +        - arm,primecell-periphid
> +        - gpio-ranges
> +
> +unevaluatedProperties: false
> =20
>  ...
>=20
> --=20
> 2.34.1
>=20
>=20

--HWgF0jKgF/ClaY3B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6zPQAKCRB4tDGHoIJi
0sbWAQC2gJITIvi3oeB7VNQ7l+eQKH46qmQnUasw4hIdQq9aKQEA1pUhCnsQx5St
9qZrXpVm5HYjxjulbTmRwuxs88NSPQA=
=Eo/9
-----END PGP SIGNATURE-----

--HWgF0jKgF/ClaY3B--

