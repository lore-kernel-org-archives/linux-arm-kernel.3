Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B75CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGgWE0Tl5cnxHy45lLW+DID+vUomYoRlrDaUa3MdY7w=; b=ly7kODReHNwyapg93u2mgxbD3K
	iPg2b+/7ZUwjF0YfuW/QCbAn/79uRUcHVLIoYmomiOoZRc1cK6rFRcIDNR39HGX08XfHl3hvh45Kt
	ZxmVZqmJwpye4jqrgE7ap7OTKAA2NbRuPXQY9TZo/Vdsii9iY75E8vI0KTV98VEZBIg5lvsvukmdY
	5+zI6zcRmO7uhmkZnEqtLcDUet4MBHIBmanwG2/r+/jv1Nk1if50OFZizpvSSez8e1LbSvvri4jLy
	gl/Nlkz10W1+V1Z/Jcg479xwxaaaJAZo02dlN0p7+pRs5MJ3uH9Zk/SwiwSEKDPoQAMqYX4WRoMF4
	mxaj+8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jON-0000000H8Vw-2hva;
	Tue, 14 Oct 2025 18:04:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jOL-0000000H8VJ-1qip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 18:04:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D2294429E;
	Tue, 14 Oct 2025 18:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06192C4CEE7;
	Tue, 14 Oct 2025 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760465097;
	bh=XkTcoOEhikNfdYenQLoMD9cYANodz0P4ptRHT0QHziE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/lNTyQTzb3SyPdkaaWt6zYajhsIj9ue5ZW3m4AoH1QSaO1cyKOV/F+vFemY/qQuL
	 p9jqcYtb7P2yBuPbsh8H3fYdPegq73HDq+kg+cDAxtMiHtrMaCkbTjmRiHYKGut1YB
	 c1z/aSN0KLwwYDrfjKAoJeBWXjxTUN0MQ/KnXTIUZfwRCLfdPABADNZYQ2EWhYP7Dg
	 GABee502iJOBShuJ1xHVMit13DhyyiOb0+hk3Rh7w8Mc/1hZCAMrKHE9LvJQS3zoRb
	 qJXQFGcKsG9ySjQNX65Nc/KYtujILQbuCWnasJSciwib8fRTxLcAlKk05FtphzQYyo
	 Kj/US40GGssFg==
Date: Tue, 14 Oct 2025 19:04:51 +0100
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
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
Message-ID: <20251014-barbecue-crewman-717fe614daa6@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="797F+UieUNy4iCeD"
Content-Disposition: inline
In-Reply-To: <20251014140451.1009969-3-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110457_538216_3C17582D 
X-CRM114-Status: GOOD (  19.23  )
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


--797F+UieUNy4iCeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input' and 'skew-delay-output' to
> specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/pincfg-node.yaml         | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index cbfcf215e571d..c3deb103d816b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -153,4 +153,26 @@ properties:
>        pin. Typically indicates how many double-inverters are
>        used to delay the signal.
> =20
> +  skew-delay-input:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected clock skew on input pins.
> +      Typically indicates how many double-inverters are used to
> +      delay the signal.

This property seems to be temporal, I would expect to see a unit of time
mentioned here, otherwise it'll totally inconsistent in use between
devices, and also a standard unit suffix in the property name.
pw-bot: changes-requested

> +
> +  skew-delay-output:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected delay before latching a value to an
> +      output pins. Typically indicates how many double-inverters are
> +      used to delay the signal.
> +
> +if:
> +  required:
> +    - skew-delay
> +then:
> +  properties:
> +    skew-delay-input: false
> +    skew-delay-output: false
> +
>  additionalProperties: true
> --=20
> 2.34.1
>=20

--797F+UieUNy4iCeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6QwwAKCRB4tDGHoIJi
0vcqAP9GGuk9psTaHkfPXjaUQtfxqAsXqRhqDaXExHqvhEHf5QD9FGn7+lMqWTn3
gkgqoVZu1cClK8lWAtm67p7nBAiJ1gs=
=upTw
-----END PGP SIGNATURE-----

--797F+UieUNy4iCeD--

