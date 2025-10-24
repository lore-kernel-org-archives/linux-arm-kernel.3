Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80B8CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY2q1+xJKg4azQuMAYEYuLlJhhn5b+ALxExQmfB3kYg=; b=poNezYdmVUnSZ/+oQgbVwPPJ0Q
	KL0TRMy743ZGB5+IEmOhE2SCsdam0zc1Rrbke+lqSdJZ8sQxwFHTwb+jBvvmK0wMCbBl/Hh4DZ5eA
	ytU0AJia8p40sooBAO8gmjSmn8v46UyHGBCKAscaWO1HCBy0sp+N+zt2ZnXqfPRsTZlwL4Lk4/ogt
	qgdxAp8QaXHr9Yl10tZG2q6TOfUBgYytCCdYY4NR6DrURb7Gg7a8t/8CIdxEgkIVhIHe0trt2mqRS
	nCKHC+vtT0RsNzaiCDhy6dP7Y+wP6p+xPcSalIxTYOb2wLtP0tpIB7gUeZinT6uUpyRE9q6PFcwHR
	QTNoVo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLHp-0000000A4tL-2mhn;
	Fri, 24 Oct 2025 17:09:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLHo-0000000A4sZ-2pOT;
	Fri, 24 Oct 2025 17:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D768B6023A;
	Fri, 24 Oct 2025 17:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69DAC4CEF1;
	Fri, 24 Oct 2025 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761325747;
	bh=nEsdPzi/tI01PeUgGVuo2zqDEcBVeBbnMqQ68PWLzVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QamugzSLBu5WaDeDpKXu4OBuo2iT0CBGV4gsQNQieHyIBXMKIEoRrJoeARLexzznd
	 s0Jv5aVIYnZUz+9cX6dEIlPuyltqWfS85b0qGIAMbS/29Jvpd3zhro6HTjRyjC0ALl
	 /FEhzqwZ9g/P4xNmU0baHCs8viygjcFDwnYx81rEinu0bfEs3ZeXJq5gi6dTGRv8js
	 xHWAS8qqJwYsxi6B3Pv8dRR4bAyW6UGBIPAHA8AQgwnwIma+suj9Upc9ZTrXkI/Wlx
	 nfx9mW+0t5M+h/NdkjyPFxEoodFuQABjnPlbXrRXO+gt86g63Pr2r/QIFib8KfWOGw
	 vWzsgrucEU6HA==
Date: Fri, 24 Oct 2025 18:09:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 01/24] dt-bindings: phy: Add mediatek,mt8196-ufsphy
 variant
Message-ID: <20251024-spilt-deviate-e3f6bfd3642c@spud>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
 <20251023-mt8196-ufs-v3-1-0f04b4a795ff@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3wlVB5ViarihM4q"
Content-Disposition: inline
In-Reply-To: <20251023-mt8196-ufs-v3-1-0f04b4a795ff@collabora.com>
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


--w3wlVB5ViarihM4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 09:49:19PM +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an M-PHY compatible with the already
> existing mt8183 binding.
>=20
> However, one omission from the original binding was that all of these
> variants may have an optional reset.
>=20
> Add the new compatible, and also the resets property, with an example.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/phy/mediatek,ufs-phy.yaml        | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> index 3e62b5d4da61..f414aaa18997 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-ufsphy
> +              - mediatek,mt8196-ufsphy
>            - const: mediatek,mt8183-ufsphy
>        - const: mediatek,mt8183-ufsphy
> =20
> @@ -42,6 +43,10 @@ properties:
>        - const: unipro
>        - const: mp
> =20
> +  resets:
> +    items:
> +      - description: Optional UFS M-PHY reset.
> +
>    "#phy-cells":
>      const: 0
> =20
> @@ -65,5 +70,16 @@ examples:
>          clock-names =3D "unipro", "mp";
>          #phy-cells =3D <0>;
>      };
> +  - |
> +    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
> +    ufs-phy@16800000 {
> +        compatible =3D "mediatek,mt8196-ufsphy", "mediatek,mt8183-ufsphy=
";
> +        reg =3D <0x16800000 0x10000>;
> +        clocks =3D <&ufs_ao_clk 3>,
> +                 <&ufs_ao_clk 5>;
> +        clock-names =3D "unipro", "mp";
> +        resets =3D <&ufs_ao_clk MT8196_UFSAO_RST0_UFS_MPHY>;
> +        #phy-cells =3D <0>;
> +    };
> =20
>  ...
>=20
> --=20
> 2.51.1.dirty
>=20

--w3wlVB5ViarihM4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPuyrAAKCRB4tDGHoIJi
0n3qAQDuISPZivWMxQqyWT7hptpBU8VJakYcV1f/3Uook67DEgD9Fuw/t0xI+buQ
vy1+kgKQvO/lTUze9oKFvo5TZQgdYAI=
=ts27
-----END PGP SIGNATURE-----

--w3wlVB5ViarihM4q--

