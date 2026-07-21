Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E15C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y836RDygiFaggeJaLzpXSO6oiC8XFkafbWfePgMLBZA=; b=tDw8B6/uBtt5V94qfcxQggErAm
	KcN0i9d+GFP7wSxFeYvEWsIWQD0DMd3XtskroVGzb6wh+GfCL7P9DaNnQpUdKocinEqF2ayLae1By
	3AhLkU7FEmuKFx7DkaPJ2Vly1Gq6CdFdnyGBWz9hJ0GULSc1jlAsN1fcNLQaJgG/0xI/ns5lM/yNt
	NW0xzwLGgO6qxYdyZW+nox9KAErGd1rHoQhzu2XGHnjvaDdga6iR0JUmIhUbizGzcUWPQMyk5VcjX
	5x90ADoHHvn5xTab4e5azjMeoJHVu2O2YADTNz1Z31cUH7Xb8s7lLsu5zMOf+Z19UQy86IiabsEzC
	BQAQ7nRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCAA-00000009lZ1-2U9f;
	Tue, 21 Jul 2026 15:13:42 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCA6-00000009lYP-2hI6;
	Tue, 21 Jul 2026 15:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784646804; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gf5OjuRAT5zbqoYF3jN4tuCWVwcP81yBTx+3H0U3gUbBQUFLKYt1vwaNkCH7j60DqVjA7bryGH0uTa6iK29FaA3t3NUHWzZulueKbMqnv8giQHtYeL7u1Q06lCnKAKyb482MFJ6XeFqOUCHaJbZ4AHGEtC/b+zuPbq5Y2OkVBTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784646804; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y836RDygiFaggeJaLzpXSO6oiC8XFkafbWfePgMLBZA=; 
	b=ndEsefTWEmt+D+gO2M1E0XgteopkYS07v/RuSZwbW4SdddDsIKm1qw+Y2tSE6UH7BbmiPsJFaLgjJqVxefo8rkft2IPeE5E9/ZsRA64XAlgpW90gwCG8tRk2ZO7HzmOXvBQa/c5QVuKaIlozVDcm6r56HtFgO6JZV6JZojPwkv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784646804;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Y836RDygiFaggeJaLzpXSO6oiC8XFkafbWfePgMLBZA=;
	b=BIfTiq/QQXfqb3DXP4fmhplQMOesc6RoouD+aBlBcllNiFOo+OUSjTNm+NTcUVGD
	Xt02vBEPgtk0pGQV6yLmkTPeGKqP2XPRV0SjEgHV8lOqO0kmgVc+xyfm8t1iTAYSbTL
	U0fJh1IFKU0njFxh+UjiIa7929cnisOg9INcsHuY=
Received: by mx.zohomail.com with SMTPS id 1784646803126404.39697867473046;
	Tue, 21 Jul 2026 08:13:23 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 738FB180765; Tue, 21 Jul 2026 17:13:18 +0200 (CEST)
Date: Tue, 21 Jul 2026 17:13:18 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <al-MajLSsTj0oPe5@venus>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-2-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ve2dgbtcld52yk2j"
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-2-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.638.57
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_081338_744636_3734F30A 
X-CRM114-Status: GOOD (  22.75  )
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


--ve2dgbtcld52yk2j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
MIME-Version: 1.0

Hi,

On Tue, Jul 21, 2026 at 08:41:12AM +0200, Igor Paunovic wrote:
> The HDMI RX controller can expose the audio embedded in the incoming
> HDMI stream as an ALSA capture device. Document the #sound-dai-cells
> property so that a sound card can reference the HDMI RX audio DAI.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Changes in v4 (both suggested by Krzysztof Kozlowski):
> - reference dai-common.yaml and switch additionalProperties to
>   unevaluatedProperties: false
> - drop the consumer comment from the binding example
>=20
> Changes in v3:
> - no changes
>=20
> Changes in v2 (all suggested by Sebastian Reichel):
> - reworded the commit message to describe the hardware
> - property description now documents the DAI indexes (0 =3D I2S,
>   1 =3D S/PDIF)
> - moved the consumer reference into the binding example
>  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml=
 b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87..b80660d 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -78,6 +78,13 @@ properties:
>        The phandle of the syscon node for the Video Output GRF register
>        to enable EDID transfer through SDAIN and SCLIN.
> =20
> +  "#sound-dai-cells":
> +    const: 1
> +    description:
> +      The HDMI RX controller has two digital audio interfaces, one for
> +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
> +      I2S and 1 for S/PDIF.
> +
>  required:
>    - compatible
>    - reg
> @@ -90,7 +97,10 @@ required:
>    - pinctrl-0
>    - hpd-gpios
> =20
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> @@ -129,4 +139,5 @@ examples:
>        pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdm=
im1_rx_sda &hdmirx_5v_detection>;
>        pinctrl-names =3D "default";
>        hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
> +      #sound-dai-cells =3D <1>;
>      };
> --=20
> 2.53.0
>=20

--ve2dgbtcld52yk2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpfjIYACgkQ2O7X88g7
+pr9WxAAog6hBJL0wrUW73CpAnMhQTt2RG9L/d0ZV2n4AAUhrpSoVViOx3hG+4yi
QPgxdXhRi8BcWwqcFoRLb09M/DtN/zy9jwsjFJhuxNsms2O5YfAOqhPfAjs6IQKX
T47J/zF7LF0lWx3cj5D9O4frZGc70Fz12IfiGAuvaOl2/O7jpCvea1M0TUAyGhpX
s1+YUUC3k5jba0SK4k1JrW9gjNRH4NYnPmr0y9m1vfYFhowTV3784hxlQBuOk6np
YlQsqrtQYBx9+43NSxEan8TIKsUSjyWslaEX3Y5rOh66s5vMjBDMPcDHzdGBYzFC
iwtTBOFQEsvVXkwtW+CtolUccp1uS2UcGs5OTLrBLZvT3sre8Q8hLdJQbEQG2/sg
BdWwhtboHSJ0L5Sp7kvjqPZ8amMayZPzbIXupFhczn3MlugeO4leBYKgEpldhvEH
Sne3GbyPwJinZzUnjQFKw0Rn4LqewhygbJ7gCZRPyWpstdWXC6GLU35VrL71X0LD
Z7XORHVhYlf7ggHhvHy3N7Yb0MUQjRYnafmIBU2lFyo5KWk8c3E0bkeAtJCstano
5RIRmTR7De8XqIBdu/6UOFKfOOzg4pd2qbcFrauKX0sisQmEz7LIsLE3Q+6HhEZP
aw2yfZ9Ao40znmb84p3XD6uKq7KU1yf580xj47v+YLxBpjMAFSw=
=ml4u
-----END PGP SIGNATURE-----

--ve2dgbtcld52yk2j--

