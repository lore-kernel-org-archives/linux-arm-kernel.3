Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A057C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Iqz4A4cmPoMAbi2mas0FhYPceSpxxVKTMiFbR6tctE=; b=wUxaK2dysSgWsZyy2cxXzzGRbU
	jeaDgfKakWm+UHSm7oObUcczPPPPWPsZprYGVA4iNErUwk+GGJ+ZBmpc5TFmbWKRvuiPwD3Ia6kJ0
	zqYRKFW7PBIILlYCUCIJezyj8n+4vQHGLyr1Qw45+5cjI31qs3Kkrh02Yl//wAAP9oWYv6Dck6ST3
	f6loUhCtbD1K8eP/m6Xkl8I93tCVzwSsKw8aC87XSHDMDuGgLyZVbybwdzeXD3gDaqo6UEOIO8/Ho
	OmV/w2bS3P+6c9nYaaVYn/GRKuGUdaVldTvnWkAD9ehef+9MU0kArDdE8GDcLNpDtftXxqU3JmgCZ
	Z7GpVP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr69-0000000Ch4G-3jjM;
	Tue, 13 May 2025 14:59:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr2V-0000000CgHo-23tZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3223244099;
	Tue, 13 May 2025 14:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CFFC4CEE4;
	Tue, 13 May 2025 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747148127;
	bh=Pyya90VltnrLC0B716Je0xNS94BZ+Qszup8DumxnMIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1zlyvKXRzhR/IYM6vzjs+fbY48Hz5qdZLLSGgn1TqDTYUSFAHLY4V2aRDfsvHNMG
	 1ijUBTgtLiLnN7rL5KOU35SPi7cQuWH4h0dACKBFvjFMEZTmWasw8xyRuXEqU4c8l8
	 Zm6Hwz8MJCbnAp8eaZOikKOee9bJvCjrfDhLXAYRlzQE0vHNw10LVeWqr+l2kac7tO
	 AvX7AUuctKzSx09inTCdGRADssuXh9xlbNLM1y6kSMmGjqZ8flLDsONOjfEDxIHQyN
	 9iLdR+oSooj7u+aYc2iJHrMmeALQXLIbjTQ4cK/VLyPajrf51dUT8LxpkAdrb5U0EL
	 bLow5fI/yl3GA==
Date: Tue, 13 May 2025 15:55:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 3/5] dt-bindings: media: allegrodvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <20250513-earache-cesspool-6d08e2cfb73a@spud>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
 <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2i/8aIx86r3PFwP0"
Content-Disposition: inline
In-Reply-To: <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_075527_579010_AA2D5249 
X-CRM114-Status: GOOD (  22.06  )
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


--2i/8aIx86r3PFwP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 10:35:48AM +0200, Yassine Ouaissa wrote:
> Add compatible for video decoder on allegrodvt Gen 3 IP.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegrodvt,al300-vdec.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al=
300-vdec.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vde=
c.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> new file mode 100644
> index 000000000000..4218892d6950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description:
> +  The al300-vdec represents the latest generation of Allegro DVT IP deco=
ding
> +  technology, offering significant advancements over its predecessors.
> +  This new decoder features enhanced processing capabilities with improv=
ed
> +  throughput and reduced latency.
> +
> +  Communication between the host driver software and the MCU is implemen=
ted
> +  through a specialized mailbox interface mechanism. This mailbox system
> +  provides a structured channel for exchanging commands, parameters, and
> +  status information between the host CPU and the MCU controlling the co=
dec
> +  engines.
> +
> +properties:
> +  compatible:
> +    const: allegrodvt,al300-vdec

Other than the vendor prefix, this looks mostly okay - from the
perspective of someone unaware of this type of this device.
Just some minor comments from me.

> +
> +  reg:
> +    items:
> +      - description: The registers

The registers for what exactly?

> +      - description: the MCU APB register

0x80000 is rather a large space for a single register!

> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: apb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MCU clock
> +
> +  clock-names:
> +    items:
> +      - const: mcu_clk

s/_clk//, since that part is obvious.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    axi {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        ald300@a0120000 {

The standard node name here I believe is "video-decoder".

> +            compatible =3D "allegrodvt,al300-vdec";
> +            reg =3D <0 0xa0120000 0 0x10000>,
> +                  <1 0x80000000 0 0x80000>;

Please keep things consistently in hex here please.

> +            reg-names =3D "regs", "apb";
> +            interrupts =3D <0 96 4>;

If this is 3 different interrupts, format as "<0>, <96>, <4>".
Otherwise, consider importing whatever header provides definitions for
these things.

> +            clocks =3D <&mcu_clock_dec>;
> +            clock-names =3D "mcu_clk";
> +            firmware-name =3D "al300_vdec.fw";
> +        };
> +    };
> +
> +...
> --=20
> 2.30.2
>=20

--2i/8aIx86r3PFwP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNdWAAKCRB4tDGHoIJi
0pMqAQCxvmLsenCJpwac0iKVtQVMEpWT6ORRwFiX8dorea9EdwEAma4QR2QByMgU
6q2ezL9VUKNRkqw2Ug7xP+MFydgZUAM=
=55nJ
-----END PGP SIGNATURE-----

--2i/8aIx86r3PFwP0--

