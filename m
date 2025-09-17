Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9ZjjcdDT4GQa9nWuADYSebHGQBW40rmclnxTg7FJyk=; b=t/mOlfsrY+QbAzENal0u90yaj6
	ei/uW0OFKFVYwxh9rTiyYBtAa2Qto0c3T4EF4OS/3Sj+GnbAk2VUsoiM6j3sYjsRFZ++nMzjaWN2B
	XPWCQcoC6PgiD3/xwOSt3bzybKQCGVyb7nDqCCW1715G+PYFc736KzWmdI+y+U+5KmSBr2ejLq6vs
	+afCmTzWA0lGRGScLOks6139hMUG472XuopB5pv2bw3wVIrYpENyL67Q9RrOzoULyJXwaxmjal7Sd
	j8/KZcIdhcqO/antooqPzPJLHgSl3Iq7A+uZbGJz74u1I7+YasobylUDRW5HUbFSKC8Xerq04kKwy
	MVSemWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyywq-0000000Edbz-1X5s;
	Wed, 17 Sep 2025 20:40:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyywo-0000000Edaf-1BCR;
	Wed, 17 Sep 2025 20:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA26444A89;
	Wed, 17 Sep 2025 20:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA3BC4CEE7;
	Wed, 17 Sep 2025 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758141613;
	bh=oWRF0e+JL1I2wWRpFWpkjtN2+s+6zaJH3zvzmrp0RGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYVjwLHHA/7Yhkh2KRc8XzIxzcxuNa8oalYYl6JthoyVK/yU844EsWgorjBU/tHzq
	 Dp3lcKUMJVC4tYDPeJmNLaVEfLZlY+BULrfCYq4HB934D8gfnnpmG9b8hjJCQSorxR
	 8lh3njPOHoKVcAs7Fflntx8gVgzYftF9Q1PQP4dcx8NAHs7GraVvSmD0q+CTO2a4gP
	 YpP60W30bQj6wPvI3n8pK5MorPMhf3LNPhe58LwyfDl+6NtHKPuMLA2g8gH+5orgnD
	 5exL6jNlX4bpNA864glMyxUuLmJf7Yv7pAzorrPVMk3buq24tL2PAFP0eDKjOMhxJ+
	 09kXbsw/EALWA==
Date: Wed, 17 Sep 2025 21:40:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 09/25] dt-bindings: clock: Add RDA Micro RDA8810PL
 clock/reset controller
Message-ID: <20250917-lividly-bargraph-2d3c036fe469@spud>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-9-74866def1fe3@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GCP3T4o6WO3PNuz"
Content-Disposition: inline
In-Reply-To: <20250917-rda8810pl-drivers-v1-9-74866def1fe3@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_134014_359736_7796F666 
X-CRM114-Status: GOOD (  16.94  )
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


--+GCP3T4o6WO3PNuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 03:07:26AM +0700, Dang Huynh wrote:
> Add documentation describing the RDA8810PL Clock and Reset
> controller.
>=20
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  .../bindings/clock/rda,8810pl-apsyscon.yaml        | 44 ++++++++++++
>  include/dt-bindings/clock/rda,8810pl-apclk.h       | 79 ++++++++++++++++=
++++++
>  2 files changed, 123 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.=
yaml b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..988b609403a96abc4964ab366=
daa6fec0514595c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rda,8810pl-apsyscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro RDA8810PL AP Clock Controller
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rda,8810pl-apsyscon
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rda,8810pl-apclk.h>
> +
> +    ap_syscon: syscon@0 {

Drop the ap_syscon label, since it is unused.

> +      compatible =3D "rda,8810pl-apsyscon", "syscon";
> +      reg =3D <0x0 0x1000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/clock/rda,8810pl-apclk.h b/include/dt-bi=
ndings/clock/rda,8810pl-apclk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..372358e72436a28c0775519f4=
9626c9c5f4c6046
> --- /dev/null
> +++ b/include/dt-bindings/clock/rda,8810pl-apclk.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +
> +#ifndef _DT_BINDINGS_CLK_RDA8810_H_
> +#define _DT_BINDINGS_CLK_RDA8810_H_
> +
> +/* soc clocks */
> +#define CLK_CPU 0
> +#define CLK_BUS 1
> +#define CLK_MEM 2
> +
> +#define CLK_USB 3
> +#define CLK_AXI 4
> +#define CLK_GCG 5
> +#define CLK_AHB1 6
> +#define CLK_APB1 7
> +#define CLK_APB2 8
> +
> +#define CLK_GPU 9
> +#define CLK_VPU 10
> +#define CLK_VOC 11
> +#define CLK_SFLSH 12
> +
> +#define CLK_UART1 13
> +#define CLK_UART2 14
> +#define CLK_UART3 15
> +
> +#define CLK_VOC2 16
> +#define CLK_EMMC 17
> +

> +#define CLK_COUNT (CLK_EMMC + 1)

This is not permitted, if you need this define please add it to
the driver directly.

> +
> +/* resets */
> +#define RST_CPU 0
> +
> +#define RST_AXI_VOC 1
> +#define RST_AXI_DMA 2
> +#define RST_AXI_CONNECT 3
> +#define RST_AXI_VPU 4
> +
> +#define RST_GCG_GOUDA 5
> +#define RST_GCG_CAMERA 6
> +#define RST_GCG_LCDC 7
> +
> +#define RST_AHB1_USBC 8
> +#define RST_AHB1_SPIFLASH 9
> +
> +#define RST_APB1_TIMER 10
> +#define RST_APB1_KEYPAD 11
> +#define RST_APB1_GPIO 12
> +#define RST_APB1_PWM 13
> +#define RST_APB1_AIF 14
> +#define RST_APB1_AUIFC 15
> +#define RST_APB1_I2C1 16
> +#define RST_APB1_I2C2 17
> +#define RST_APB1_I2C3 18
> +#define RST_APB1_COMREGS 19
> +#define RST_APB1_DMC 20
> +#define RST_APB1_DDRPHY_P 21
> +
> +#define RST_APB2_IFC 22
> +#define RST_APB2_UART1 23
> +#define RST_APB2_UART2 24
> +#define RST_APB2_UART3 25
> +#define RST_APB2_SPI1 26
> +#define RST_APB2_SPI2 27
> +#define RST_APB2_SPI3 28
> +#define RST_APB2_SDMMC1 29
> +#define RST_APB2_SDMMC2 30
> +#define RST_APB2_SDMMC3 31
> +#define RST_APB2_NAND 32
> +
> +#define RST_MEM_GPU 33
> +#define RST_MEM_VPU 34
> +#define RST_MEM_DMC 35
> +#define RST_MEM_DDRPHY_P 36
> +

> +#define RST_COUNT (RST_MEM_DDRPHY_P + 1)

Ditto here.

--+GCP3T4o6WO3PNuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMscpgAKCRB4tDGHoIJi
0ps/AP4piHliUCDvEEUik0FH/7MzvmR63WJQrrnsPFPC3yOkfQD/Qx91k9Cbmdnw
BKNMCt5IYsh65uJuh73HEVehqhuQzgA=
=v+w9
-----END PGP SIGNATURE-----

--+GCP3T4o6WO3PNuz--

