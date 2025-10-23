Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4705BCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+4tkw9ZZbWEh391k2/rUyJBGPpQBQFucTuQa8gvdT4=; b=jGkxW+Mq7RDg30mSvN6+2w7P/T
	Tz+mjLYlqOHCLWMsJgJFwhpJapXuOfVoS5GEjx9NhK1sPqnw88CFTWwgD/cX8Q7xCGhJetFFRiXT2
	8MYRnyClomd083rIFo4LPiNp3kvFE/q06CisvPijUVkrS66oUJjVSnhCQiIW9d189l3sA5TyDBB4o
	iLlaS6NT0ZKSSnwgAikBg79Aw6wxFNd4mAVYhrEQXF38kReUiTiZdOiNfBPiXdgjzdsWUKxQKGc1p
	B8O5Zaq2dSiuKTtFnQruvxO+jaEXPE6QBPCs/rETzinYqZovCSTJZHiTB2MKRWnseeOh/GTiZsuRU
	9/FKE5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0GZ-00000007GG3-1PMn;
	Thu, 23 Oct 2025 18:42:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0GW-00000007GFt-3A1c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A05601B3;
	Thu, 23 Oct 2025 18:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E7C4CEE7;
	Thu, 23 Oct 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761244943;
	bh=7cg1XT3E5PgSjEeikeZ9kqIVrBH3X8dSeokFRv7rNPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlEhJnahRlAztC+puvhNXPiKdE2U1thO894TnL/x3rf2GRYv8es3HLzcXaT/T8T/Q
	 LXKexrtFE8vvdJW+VtDlR7HcrG+5wIJPi/t1z6Xyi7Y35lzCnXM/MJMGgdOKHxSqFH
	 A/Kv+OLOenPYYFhx9dRrrEVmBbqqmP3i0TNJZLmSj/SMj7SMeXUoHrLdyB2PM9hadp
	 rrXKAC8Ln68DcI1Gf0gjjOF7g4Mxsmf+yOY7/BnMZx+iQ+xbrIB2zp7jYWHhChk/gt
	 NGxYQt8IvsITdpgWeVmYdHQp0BnhpKxcvKYnVEJ6nGg5zJ/yPRJOlu99ZphVd9h12k
	 OcQQuMSbDdYVA==
Date: Thu, 23 Oct 2025 19:42:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use properties
 from pincfg-node.yaml
Message-ID: <20251023-twice-brisket-fb7a3f439a13@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-11-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU1dAtIe/+VxJvoH"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>
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


--bU1dAtIe/+VxJvoH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:58PM +0200, Antonio Borneo wrote:
> Don't re-declare the standard pincfg properties; take them from
> the default schema.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I acked this one in v3:
https://lore.kernel.org/all/20251014-privatize-unnerving-bb26a0626276@spud/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 27 ++++++++-----------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 961161c2ab62b..27c0dd7a8df01 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -151,6 +151,8 @@ patternProperties:
>            pinctrl group available on the machine. Each subnode will list=
 the
>            pins it needs, and how they should be configured, with regard =
to muxer
>            configuration, pullups, drive, output high/low and output spee=
d.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
>          properties:
>            pinmux:
>              $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -195,26 +197,19 @@ patternProperties:
>                            pinmux =3D <STM32_PINMUX('A', 9, RSVD)>;
>                 };
> =20
> -          bias-disable:
> -            type: boolean
> +          bias-disable: true
> =20
> -          bias-pull-down:
> -            type: boolean
> +          bias-pull-down: true
> =20
> -          bias-pull-up:
> -            type: boolean
> +          bias-pull-up: true
> =20
> -          drive-push-pull:
> -            type: boolean
> +          drive-push-pull: true
> =20
> -          drive-open-drain:
> -            type: boolean
> +          drive-open-drain: true
> =20
> -          output-low:
> -            type: boolean
> +          output-low: true
> =20
> -          output-high:
> -            type: boolean
> +          output-high: true
> =20
>            slew-rate:
>              description: |
> @@ -222,8 +217,8 @@ patternProperties:
>                1: Medium speed
>                2: Fast speed
>                3: High speed
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3]
> +            minimum: 0
> +            maximum: 3
> =20
>          required:
>            - pinmux
> --=20
> 2.34.1
>=20

--bU1dAtIe/+VxJvoH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp3CgAKCRB4tDGHoIJi
0tg3AQD8bWKk/YfN5ZMpkKgIGbTc19jQ0QsVxpdvLl3aEu+5XgEAs6z0D7RrT691
W6QkYi0onTlPEu0LmNwdPXMp2aDCAQM=
=954d
-----END PGP SIGNATURE-----

--bU1dAtIe/+VxJvoH--

