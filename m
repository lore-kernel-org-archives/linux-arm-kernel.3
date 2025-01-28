Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpPG8eTIMD/U/u1M38LsDCK6x2DmckkLmBf5dU+5s/0=; b=dOD/UXF0B26Ui7WlRIAxohuvwR
	XlFIrtPzXmVoP7KI+qpvqKnzuen5yBYNwLvsrEROhOO9KS0QRiyvtJp3tE9MbUn9oim4tFbddotcu
	F7PoytOGAEycX+pmdCzM/HE1XP1nMTqzuR0eUVu89kRytCpJnASoMrYglwQhXU6a0xPhdlfNdOwQw
	yq3JpQypOUOjPaipswURHSWEg/dUAoDHSpQnbeNi4YlxhMtcJ3xkahwjQadXBGTVPNpBSq4U5XcrS
	o4zeW6/ti0/HAjogAlwItxicnFHn9BHzSUg1laXzPI0nQsB496i/z242bfixtlRUZC0S87taQFExc
	AHWv07/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpwN-00000005Vde-1cVp;
	Tue, 28 Jan 2025 18:03:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpv1-00000005VPV-2wQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 18:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 811A35C5E29;
	Tue, 28 Jan 2025 18:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1C5C4CED3;
	Tue, 28 Jan 2025 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738087353;
	bh=17sm+X5zyYge664zgijjG3INLik8MXrleSdffgx7+sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMuWqg4RYnrqYMaIA/ZcIhJErUloNcadylvAlyJ4i9jsnhEmcRFaEO2o7xl8Ja3iy
	 tBWkCZAQ5y5NziPO2hZOgxCC3JFFI/rJxezpT8UBtHs3SIVOszdw4j6Sa7qhAa7qn/
	 WiYbmsI7ax4600FToUWN2gu2ivn4HCCaenBf2WxpCFKyUr437gEGFDggU65b6vkxgd
	 LK4Xy3n2XBXGHn2gbCBBvyMU+WFdhFU4j09xNsRVjagaGFRX92Nk8jQywRUleI6Skk
	 L/wXxLWnMaElYz1nZoTyWrAaUPRu9tMWIyIYrzcQHeFu+hwDWquzTQmYp/FyRyZ09e
	 nbXueTytgVkCA==
Date: Tue, 28 Jan 2025 18:02:27 +0000
From: Conor Dooley <conor@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christophe.kerello@foss.st.com
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
Message-ID: <20250128-panama-manly-a753d91c297c@spud>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xfUYpCROzbnYgVkv"
Content-Disposition: inline
In-Reply-To: <20250128081731.2284457-2-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_100235_826789_9343F523 
X-CRM114-Status: GOOD (  27.22  )
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


--xfUYpCROzbnYgVkv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 09:17:23AM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Add device tree bindings for the STM32 OSPI controller.
>=20
> Main features of the Octo-SPI controller :
>   - support sNOR / sNAND / HyperRAM=E2=84=A2 and HyperFlash=E2=84=A2 devi=
ces.
>   - Three functional modes: indirect, automatic-status polling,
>     memory-mapped.
>   - Up to 4 Gbytes of external memory can be addressed in indirect
>     mode (per physical port and per CS), and up to 256 Mbytes in
>     memory-mapped mode (combined for both physical ports and per CS).
>   - Single-, dual-, quad-, and octal-SPI communication.
>   - Dual-quad communication.
>   - Single data rate (SDR) and double transfer rate (DTR).
>   - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
>   - Data strobe support.
>   - DMA channel for indirect mode.
>   - Double CS mapping that allows two external flash devices to be
>     addressed with a single OCTOSPI controller mapped on a single
>     OCTOSPI port.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/spi/st,stm32mp25-ospi.yaml       | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32mp25-os=
pi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml=
 b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> new file mode 100644
> index 000000000000..f1d539444673
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/st,stm32mp25-ospi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-ospi
> +
> +  reg:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1

Whatever about not having descriptions for clocks or reg when there's
only one, I think a memory region should be explained.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: phandle to OSPI block reset
> +      - description: phandle to delay block reset
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  st,syscfg-dlyb:
> +    description: phandle to syscon block
> +      Use to set the OSPI delay block within syscon to
> +      tune the phase of the RX sampling clock (or DQS) in order
> +      to sample the data in their valid window and to
> +      tune the phase of the TX launch clock in order to meet setup
> +      and hold constraints of TX signals versus the memory clock.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Why do you need a phandle here? I assume looking up by compatible ain't
possible because you have multiple controllers on the SoC? Also, I don't
think your copy-paste "phandle to" stuff here is accurate:
      st,syscfg-dlyb =3D <&syscfg 0x1000>;
There's an offset here that you don't mention in your description.

> +    items:
> +      maxItems: 1
> +
> +  access-controllers:
> +    description: phandle to the rifsc device to check access right
> +      and in some cases, an additional phandle to the rcc device for
> +      secure clock control

This should be described using items rather than a free-form list.

> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - st,syscfg-dlyb
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    spi@40430000 {

nit: you missing a blank line here.

> +      compatible =3D "st,stm32mp25-ospi";
> +      reg =3D <0x40430000 0x400>;
> +      memory-region =3D <&mm_ospi1>;
> +      interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +      dmas =3D <&hpdma 2 0x62 0x00003121 0x0>,
> +             <&hpdma 2 0x42 0x00003112 0x0>;
> +      dma-names =3D "tx", "rx";
> +      clocks =3D <&scmi_clk CK_SCMI_OSPI1>;
> +      resets =3D <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSP=
I1DLL>;
> +      access-controllers =3D <&rifsc 74>;
> +      power-domains =3D <&CLUSTER_PD>;
> +      st,syscfg-dlyb =3D <&syscfg 0x1000>;
> +
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      flash@0 {
> +        compatible =3D "jedec,spi-nor";
> +        reg =3D <0>;
> +        spi-rx-bus-width =3D <4>;
> +        spi-max-frequency =3D <108000000>;
> +      };
> +    };
> --=20
> 2.25.1
>=20

--xfUYpCROzbnYgVkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5kbswAKCRB4tDGHoIJi
0lcIAQDU7HTXvB+po6yvcl9praNiHvh+3GS9lcFqfp1k7eAIrwD/Vghbo+R30BML
AU87FB9nIF3rIe0J6yZGyW+mcijJaws=
=Sliy
-----END PGP SIGNATURE-----

--xfUYpCROzbnYgVkv--

