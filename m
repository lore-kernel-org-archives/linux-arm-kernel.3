Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E786CCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOz45MFV4Kd6InTf2fNUwVjM1vD8FNKrSsFNkWG9jKY=; b=EANOQ+XYe71d7be9ET+o3I/EYW
	IR0pUNuxqYVuZMPYmJP6D7sNeoxBzfeLxeFuRCz73E9Otergm93A3Pkl3VVxM0cldU9PdjWzWqpHh
	4dp4IR7vysKyt2F/Dh0/uBtPZoGuR2mTaM0BRSN2idshEDomsnL2TS3vl0SvOSsjC4gQt2FLB6GLZ
	N734upm0a2pcJkdl/y8UMdWLQ5jhgdztzmogc+Goii4srsdlvjJIYFzT3EmyCRGtpt0woVAkyyhiD
	fHBORrTMRHpabyh9RTiqgRlr+a3c679TB3P/ntVjOh4nf8DEKgRuuOWnoOGyPVyFOvR8pyisCWko0
	tozghymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOJ3-0000000263m-0A5f;
	Wed, 07 Oct 2026 09:51:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOJ1-0000000263S-15GF;
	Wed, 07 Oct 2026 09:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A8B5601FB;
	Wed,  7 Oct 2026 09:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1096A1F0089B;
	Wed,  7 Oct 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366682;
	bh=tOz45MFV4Kd6InTf2fNUwVjM1vD8FNKrSsFNkWG9jKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KzUM7Q3tQ7f7gdBPajsnsVyfrl0X+VcgmmljBuwxnIyastOWSy9k503gClGgl/n0j
	 j0FRiV24qhwVt0HxUfiGOTWf5LHku8NAMNwGjUWiOAWy8wTz67xbvljsKlDK66V5D3
	 +XSOXXkAGBDplT0HzC/elsbLZ0rQTEk+olQrpe1J6YN3G/4PR8a5oUqXqQpIuCV3Sv
	 B7dRFOrmTT1u0qr5H44oiazyrhZYcCg3Ui6LODgmStu2bvBx2CYSb4YwVEYpIJMK1h
	 k/X6L45sUr5dGlKQlXOPRsUPF9Q4OpXOC+eoQGlIRak/BIgAtH/2OAJwsjBcLT0MER
	 nZgIugSJzb7dg==
Date: Wed, 7 Oct 2026 10:51:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <asYWEwjFO8g50o1i@squawk>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qM3efczHaYFLahFS"
Content-Disposition: inline
In-Reply-To: <20261007082627.63807-4-tanure@linux.com>
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

--qM3efczHaYFLahFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 09:26:23AM +0100, Lucas Tanure wrote:
> The T7 has the same ethernet glue as the G12A, but the controller
> reaches memory through a pipeline stage that this SoC inserts in the
> bus path. That stage has a gate of its own, which no other member of
> the family has, and nothing else in Linux claims it. It is therefore
> switched off as unused, and the port can then no longer finish a
> transfer.
>=20
> Describing it needs a fourth clock, and the fourth clock of the
> existing list drives the timing adjustment logic, which the T7 never
> uses. So the T7 gets a list of its own with the gate in that place,
> under the name the SD and eMMC controllers already use.
>=20
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Didn't I ack the previous version?

What changed?

Thanks,
Conor.

> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 90ef79161ab1..96118b4d1560 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,6 +23,7 @@ select:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>    required:
>      - compatible
> =20
> @@ -57,6 +58,47 @@ allOf:
>              - const: clkin1
>              - const: timing-adjustment
> =20
> +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables=
 the
> +  # timing adjustment logic, so it has no timing-adjustment clock. What =
it does
> +  # need is the gate of the pipeline stage the controller reaches DRAM t=
hrough.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path bet=
ween
> +                the controller and the DRAM. Without it, the controller =
cannot
> +                complete DMA transfers.
> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +
> +  # Delay definitions for Meson8b and newer (including T7)
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
> +    then:
> +      properties:
>          amlogic,tx-delay-ns:
>            enum: [0, 2, 4, 6]
>            default: 2
> @@ -106,6 +148,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>      then:
>        properties:
>          rx-internal-delay-ps:
> @@ -143,6 +186,10 @@ properties:
>                - amlogic,meson6-dwmac
>                - amlogic,meson8m2-dwmac
>            - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac
> =20
>    reg:
>      items:
> --=20
> 2.56.0
>=20

--qM3efczHaYFLahFS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYWEwAKCRB4tDGHoIJi
0gQiAQCnRNDWnYbBw+1lohiWh6F2GylN3jQDADGtPXSsfCKhvQEA4omhqA+mhCtG
sD965n7CT9LfUf20zqI2y5eeBX/8Oww=
=RzBf
-----END PGP SIGNATURE-----

--qM3efczHaYFLahFS--

