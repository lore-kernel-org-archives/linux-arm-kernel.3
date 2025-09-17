Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5403CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5StibBwUEgv/Vyi5WdtggWqWQHaTG5rbL3fl+3Y4STk=; b=cGQh+I4stkx7bfAN1cvAs4rsBF
	TGCkSWd5EyaAZBWbuAQOt0cgy9i+HEdoj+kgglzZfvef1v1PARW6aobmZksuea+B6kBJYX237Y72d
	hJBDhOqR12xWLYocFikYsplpi7rDKxO6nyZ5Ld97G7BRsx7F2ufWGSCdofybyjwX37BG2aahM+zf+
	Fv80jY/VB3cqRO4clONoQNCnqDTIAJP1LVYqoT+pTOT6+oCph4ICVdjOKATJ06P267TOAXI3lWYGQ
	WhaQAU4VvW1T1Gb1scXAJOw2ItPqol08F+swIplNee4+p9qlByZ+XVTHKLKSPNwoYWpP4Snbv2iJd
	RlHjzqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxry-0000000EImS-480P;
	Wed, 17 Sep 2025 19:31:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxrv-0000000EIka-3rEX;
	Wed, 17 Sep 2025 19:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BD6741939;
	Wed, 17 Sep 2025 19:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9F4C4CEF7;
	Wed, 17 Sep 2025 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137467;
	bh=CqHwmT9jquJeX+EOuVFi/0NzpVRGCzy+hiZmGgVtW60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFBRx0CEoMoBxb7hu4YJFHjQFHjSbGtjzre87bEBhm34jP6xjcJiUEwdATpcjUYkw
	 SRG2RoHicyG/894mlK9TWuGmMNM475o19F2JfEEIc85onRIivFD7NHqeABm7hUKCOC
	 s5SsRpTIZgCyA0+NK1AhDUCr4o/pBURjCjE4wc89Bae4c1W7FESfXqhEtqAO6grm8D
	 Q4eaF08o+ZUJWcxHT+lk1Nc9QQa/+IVtUrY+r8HnlyMmAajwCNRoqWi+pkO36em7YR
	 hAunXLRVwqzVVRTAYM4dqxS86uL295XAeCrBfb1rp8b4YKwhD7bXQMzZhrle/3gSr9
	 RNKFWLo3RPHVA==
Date: Wed, 17 Sep 2025 20:31:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
Message-ID: <20250917-crept-romp-8c02570c1d6f@spud>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <20250917063233.1270-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsLFofKKl/aa/7Bd"
Content-Disposition: inline
In-Reply-To: <20250917063233.1270-3-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_123107_999112_1A21CCF5 
X-CRM114-Status: GOOD (  16.91  )
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


--hsLFofKKl/aa/7Bd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 09:32:31AM +0300, Stanimir Varbanov wrote:
> Add bcm2712-pm compatible and update the bindings to satisfy it's
> requirements. The PM hardware block inside bcm2712 lacks the "asb"
> and "rpivid_asb" register ranges and also does not has clocks, update
> the bindings accordingly.
>=20
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.ya=
ml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> index e28ef198a801..c8d3d6131a8d 100644
> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
> @@ -13,8 +13,7 @@ description: |
>  maintainers:
>    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> =20
> -allOf:
> -  - $ref: /schemas/watchdog/watchdog.yaml#
> +$ref: /schemas/watchdog/watchdog.yaml#

Please move this down with the allof.

> =20
>  properties:
>    compatible:
> @@ -22,14 +21,15 @@ properties:
>        - enum:
>            - brcm,bcm2835-pm
>            - brcm,bcm2711-pm
> +          - brcm,bcm2712-pm
>        - const: brcm,bcm2835-pm-wdt
> =20
>    reg:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
> =20
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: pm
>        - const: asb
> @@ -62,7 +62,25 @@ required:
>    - reg
>    - "#power-domain-cells"
>    - "#reset-cells"
> -  - clocks
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2835-pm
> +              - brcm,bcm2711-pm
> +    then:
> +      required:
> +        - clocks
> +
> +      properties:
> +        reg:
> +          minItems: 2
> +
> +        reg-names:
> +          minItems: 2

If the new device doesn't have clocks or the extra reg ranges, please
add an else clause that enforces it.

> =20
>  additionalProperties: false
> =20
> --=20
> 2.47.0
>=20

--hsLFofKKl/aa/7Bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMdQAKCRB4tDGHoIJi
0oEUAP96o7GTUuuNQybMRhkNw285zZaGo8XaVxkYQ3BLGFgV6wD/RPPmf9sqKXEb
fpXxJZcldGF1WuzX8uE8HjH1H+SKgAU=
=7ERd
-----END PGP SIGNATURE-----

--hsLFofKKl/aa/7Bd--

