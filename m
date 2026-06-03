Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AA6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjzxz0t6lEOZubRT0pRgqofvMBOODUDsEOG6BtNFkrY=; b=XBH8a9EWk2XY3wQiRLB7vXqE2U
	4TkyFoGqdIOP+EMbEyUtNQ289jLjZ2kzBSmh6B4kGpHcJ8hQxJ9VX7qPgZaJURcbYAs+MvlISAV1H
	x7azGnhmXZ2TtW6iQQvXSDHfvyvJBgu32BmoB6aW4EGb5+Fd12fXtO6cxVUx+KoFUUIWlvzfh3S4H
	FkNI87G8zS8kuJaqwkDw8Q8DD4deAIAvfkzLZsXnCPUjOjsi8SUY8iw6GMdwf7utGoYOfJLq3A8Zs
	7L+ob4ECSCTiSD3rzbdwjfNMpwtB/oy5GHXrt8cX82csQ78rCoznq6SWzRXgzFHFMwm8eTbUgjz7h
	6+h9y1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSQ-0000000FPPY-0Sr0;
	Wed, 03 Jun 2026 15:24:38 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSO-0000000FPP6-31iu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kjzxz0t6lEOZubRT0pRgqofvMBOODUDsEOG6BtNFkrY=; b=f2zc6hhdsOXLYlgGXHlmEbknsV
	vwXGx0YtNJqEQBrvy2Ilw1xlloi6N4x7BGgSNAem3PCnHwIcA3ZgRuYK4EmLG+dQeZYWk/9m+58HF
	07xGai4MJET7E4A0sWp/DslwFTOqrLOo8YOgCMC2Ps3K54Jd1RvJgOCWutT03PCCMoBhf0jk90iib
	d9sxcN1jjMngPwFpj5GRGGRQk1HD4scmWRBGaDYzHUTaErvDad9kOk4uID3WS/8VGGWpIMN2HPKKf
	bKDmRi3QndDnGsh3tsSJ4U7H+9p9E+d+EeqteFFWLAUEcid639X7vHxUNexIWnMxw7aePk5wKz5/f
	3nh76ZZg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnSL-0000000CYrw-0hZM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F11640C1F;
	Wed,  3 Jun 2026 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DA81F00893;
	Wed,  3 Jun 2026 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500270;
	bh=kjzxz0t6lEOZubRT0pRgqofvMBOODUDsEOG6BtNFkrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CY6046kzgjy/4LzHpfa083N0szyRpUPGZ0I+Wk+DFOg7yHaruMmEgIArZyLfSHeRD
	 QE8DezpHY+8eYXp8keBkf6MFHUxwXX/IGsfFwnOrtQCasWpdF0OD18r+5OzF6/nf7J
	 al9s/eLoErKQcEmTNZZ7TLF7yG2vVJKCvS22nf8udkazLaY7SXnhIgHF8cxuXttyuy
	 kPBuM2EbwuS40xhnfS9TedanwKSCyKm7pGNKmCzXC0teyv3FJ7n7HFtMLE7Nlecbr5
	 qTRo7Oou0oTsl8qgpyiehMwNt3xKBdvz4oQHY/ixSJS7Q5brkXUYQawah9FNimLCYh
	 U7fh60Kdxx7zg==
Date: Wed, 3 Jun 2026 16:24:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
Message-ID: <20260603-daybed-absentee-1b64f5caabe0@spud>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dmNkohdYccTOM49Q"
Content-Disposition: inline
In-Reply-To: <20260603043551.1062112-2-cwweng.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_162433_540722_D1A34FA5 
X-CRM114-Status: GOOD (  16.18  )
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


--dmNkohdYccTOM49Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>

Missing commit message for one, but why can't your Nuvoton mail be used
here?

Sashiko had two comments about resets and num-cs that looked valid.

> ---
>  .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-=
qspi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.ya=
ml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> new file mode 100644
> index 000000000000..f7b9cb52d8e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Quad SPI Controller
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-qspi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        spi@40680000 {
> +            compatible =3D "nuvoton,ma35d1-qspi";
> +            reg =3D <0x0 0x40680000 0x0 0x100>;
> +            interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&clk QSPI0_GATE>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            flash@0 {

Drop this flash node, it serves no purpose here.

pw-bot: changes-requested

Thanks,
Conor.

> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <30000000>;
> +                reg =3D <0>;
> +                spi-rx-bus-width =3D <4>;
> +                spi-tx-bus-width =3D <1>;
> +            };
> +        };
> +    };
> +
> --=20
> 2.25.1
>=20

--dmNkohdYccTOM49Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBHKQAKCRB4tDGHoIJi
0kNbAQCOgW0doQKE85Sk4jtKfNxpQIdQUC339qiL0/5yHx1NEwD9E3D0JKa6xsRm
zY/qv1p/jXCiL28U4tfuyAiUS/355wA=
=J1hd
-----END PGP SIGNATURE-----

--dmNkohdYccTOM49Q--

