Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D59CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/83kUiQUFum1L9th376sQeACfJCdpnqsAdBM11IMUR0=; b=P2/xRQHD4roQ9SUZjz5D6K34zw
	E0/kS1mRONAGdJW/bNGzoHw6M00640vaAiJ2628gX9Pjox1SkvnItVHkUEORv2zlyK7ByryqhE2+N
	RlP74sb7dOYXXxcT08mTPWBqnewGdEn/Zd6RrMXOg2AYjObms/Tv26J2gSe6jQ6JjwmRgqNXcWuGV
	33sHwV354L2OO1999W4bBgYLY8mllLWNF8Se5FrE/rD6wYWBUy2MeNyR2T2EMa2/u3I/vmTNMYQ6k
	ELc/Nd6CvahpXPwAuCOQ+ymb/cNzjNP6ZWQ5bY3UEDhOgsIWPvUGBtC40hdfM7KORkjAMbyXT6pXe
	Z6mLAWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiR4-00000003jY9-06KH;
	Thu, 08 Oct 2026 07:21:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiR3-00000003jY1-1OXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87BDF60252;
	Thu,  8 Oct 2026 07:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291AB1F000FF;
	Thu,  8 Oct 2026 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444060;
	bh=/83kUiQUFum1L9th376sQeACfJCdpnqsAdBM11IMUR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aov+QAUVduF9SYcLkd+BAj3hCbvQs3oKzwwFi//YGkLLCg2/h9i6Gw9/K5/sjWHnv
	 5rja/oRq7S8u/ukpkgTHJuQ/rA4PL4hAcpXhPAbofCjqzafNo8k0SDXohfanGkGvTb
	 0tPJ+NiXpy3HGOgDJuoxRcjlq2TKIs7/5IgLoSBMvrHjKTDjOhVIvy3zKYjT2NmL4m
	 9FC231EIpsM77OUjQYsEt6UOyxtW1qwN9BuhD/deK+78u9KLdJmiLwV4I8s09fThzP
	 lD9BRsFy8KqTFW7CAULhHi0iHWU+dMygm0DNWltSHouKGuFsHf8ErjKexVGExAs07U
	 ghoDWSSryYA7A==
Date: Thu, 8 Oct 2026 08:20:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: s32g2-siul2: describe EIRQ
 input mux registers
Message-ID: <20261008-1e3e0aa3fab167d544c21e68@squawk>
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
 <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NNjeP+1IwDTZ8VUp"
Content-Disposition: inline
In-Reply-To: <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
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

--NNjeP+1IwDTZ8VUp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 09:14:34AM +0200, Khristine Andreea Barbulescu wrot=
e:
> The SIUL2 external interrupt lines (EIRQ0-EIRQ31) on S32G2/S32G3 are not
> hard-wired to fixed pads. Each EIRQ line has its own input multiplexer,
> implemented by the IMCR398-IMCR429 registers, whose Source Signal Select
> (SSS) field selects which pad signal feeds the edge detector.
>=20
> These registers were previously listed as reserved and were absent from
> the reg list. Add a dedicated entry for the IMCR398-IMCR429 EIRQ input
> multiplexer window between the two regular IMCR groups, update the
> example and the minimum item count for the GPIO/EIRQ variant, and drop
> IMCR398-IMCR429 from the reserved-index note.
>=20
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml
> index 36f2393fa406..ecf6d61a80e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> @@ -23,7 +23,9 @@ description: |
>    are used for external interrupt configuration.
> =20
>    Please note that some register indexes are reserved in S32G2, such as
> -  MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
> +  MSCR102-MSCR111, MSCR123-MSCR143 and IMCR84-IMCR118. IMCR398-IMCR429
> +  are not regular pin IMCRs but the EIRQ input multiplexer registers,
> +  which select the pad signal routed to each external interrupt line.
> =20
>  properties:
>    compatible:
> @@ -53,6 +55,7 @@ properties:
>        - description: MSCR registers group 2 in SIUL2_1
>        - description: IMCR registers group 0 in SIUL2_0
>        - description: IMCR registers group 1 in SIUL2_1
> +      - description: IMCR398-IMCR429 EIRQ input multiplexer registers in=
 SIUL2_1

Isn't mid-list insertion here a compatibility break, since there's no
reg-names property here? Seems like this can just be added at the end,
without an impact on existing users?

>        - description: IMCR registers group 2 in SIUL2_1
>        - description: PGPDO registers in SIUL2_0
>        - description: PGPDI registers in SIUL2_0
> @@ -141,7 +144,7 @@ oneOf:
>        - interrupts
>      properties:
>        reg:
> -        minItems: 11
> +        minItems: 12

Why is the new reg mandatory? I didn't catch the explanation for that.

Thanks,
Conor.

> =20
>  additionalProperties: false
> =20
> @@ -162,6 +165,8 @@ examples:
>                <0x4009ca40 0x150>,
>                /* IMCR119-IMCR397 registers on siul2_1 */
>                <0x44010c1c 0x45c>,
> +              /* IMCR398-IMCR429 (EIRQ input mux) on siul2_1 */
> +              <0x44011078 0x80>,
>                /* IMCR430-IMCR495 registers on siul2_1 */
>                <0x440110f8 0x108>,
>                /* PGPDO registers on siul2_0 */
> --=20
> 2.34.1
>=20

--NNjeP+1IwDTZ8VUp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasdESgAKCRB4tDGHoIJi
0juIAQCahwOFX0GTEsE66QHyW8i8E7s0krMkp322e4p5QDd4gAEAsKPhU1kHf92N
OabgfycCywPZi9JTCX1IkwNtMB+8NQ4=
=Y+zQ
-----END PGP SIGNATURE-----

--NNjeP+1IwDTZ8VUp--

