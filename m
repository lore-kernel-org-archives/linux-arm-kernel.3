Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B35D46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wOThwjVEjG7NQ8lLaWkkzYwTr8y0NPlBDgaBGr3XXw=; b=hjIuIwJCIE1unwDBZrgV+4DoQO
	sb3Km6JcrG7x69xtgMFAtsQNH9eYYNv8XgKfvI7FfnogQtZ39ie3uWAsCPxN/YXZX42C2EUTrCIuy
	jxTs3GAaHTckbOQJ9TBlQZOv8Nk14iGX3MpEpGH2GqmWiBTel99273Rv07FZZkanLusQNdiqSBqYO
	34VuNTp+sLMkWCqTFJBewA4/KFLYBtWiFPJOXB2GFVoZRT00XDcEY/S01Xc/9S12kwjd2VuEiAJ3u
	r4M4EoLTuFjVItBk9uC29hNV/Nt2/ON5nLOD7Yo3CZAXO7Q9CeDRmgV/6gIvNmAzlXRRU+JXjaO5r
	NvJ/twSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1BB-00000002FrH-1XAE;
	Sat, 31 Jan 2026 02:57:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1B9-00000002Fqw-2NG2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 02:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=3wOThwjVEjG7NQ8lLaWkkzYwTr8y0NPlBDgaBGr3XXw=; 
	b=By+AgdncMdzlIMzRIK30y3oQ0fLmq1VtJRb1xEb5FzqSPF7oVWGxezbu5+8YmMtVgwHU0zk/kAH
	d6Xq9+oXd+hdFXjmSoPWZ6BwJqTbbdpg0mkukIXiNJu0KaVjn6T3b9xSe8hNCMO2VMSOhotdrU5dk
	VlcLB8YmlQFCmpvYTh1QAeUrxploNeXWZvVVtOdE9lxpo5P6VQoQhFEWizfUXbKojAgcjvO6jkw6i
	fb7BbYvOGfl11Zh6hxEw86K/wHQDIzMzb+o+Lq1PRkqA4CH6Bsj7POkXoeUiX40Z4Pjcm9GlpDL2c
	h2DtyGc/oFK7fPwNmziDuPkSL8LhPqyLpnDQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vm1Aa-003S1b-1y;
	Sat, 31 Jan 2026 10:57:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 31 Jan 2026 10:57:08 +0800
Date: Sat, 31 Jan 2026 10:57:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, davem@davemloft.net, lee@kernel.org,
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	linusw@kernel.org, olivia@selenic.com, richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org,
	richardcochran@gmail.com, horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v5 00/11] Add support for Microchip LAN969x
Message-ID: <aX1vhJ7SCu5JB2ga@gondor.apana.org.au>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_185743_724998_0BE9F50E 
X-CRM114-Status: GOOD (  19.11  )
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

On Thu, Jan 15, 2026 at 12:37:25PM +0100, Robert Marko wrote:
> This series adds support for the Microchip LAN969x switch SoC family.
> 
> Series is a bit long since after discussions in previous versions, it was
> recommended[1][2] to add SoC specific compatibles for device nodes so it
> includes the required bindings updates.
> 
> [1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
> [2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
> [3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
> [4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> 
> Changes in v5:
> * Picked Acked-by and Reviewed-by tags
> * Change clock header license to match the DTSI one
> * Alphabetize EV23X71A pin nodes
> * Remove the requirment for all ethernet-port nodes to have phys property
> as when RGMII is used there is no SERDES being used
> * Drop phys from RGMII port on EV23X71A
> * Drop USB, DMA, MIIM, SPI and I2C bindings as those were already picked
> 
> Changes in v4:
> * Pick Acked-by from Andi for I2C bindings
> * Move clock indexes from dt-bindings into a DTS header as suggested by
> Krzysztof[4]
> 
> Changes in v3:
> * Pick Acked-by from Conor
> * Drop HWMON binding as it was picked into hwmon already
> * Document EV23X71A into AT91 binding
> * Drop SparX-5 and AT91 bindings merge
> * Apply remark from Conor on DMA binding regarding merging cases
> 
> Changes in v2:
> * Change LAN969x wildcards to LAN9691 in patches
> * Split SoC DTSI and evaluation board patches
> * Add the suggested binding changes required for SoC specific compatibles
> * Merge SparX-5 and AT91 bindings as suggested[3]
> 
> Robert Marko (11):
>   dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
>   dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
>   dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
>   dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
>   dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
>   dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
>   arm64: dts: microchip: add LAN969x clock header file
>   arm64: dts: microchip: add LAN969x support
>   dt-bindings: arm: AT91: document EV23X71A board
>   dt-bindings: net: sparx5: do not require phys when RGMII is used
>   arm64: dts: microchip: add EV23X71A board
> 
>  .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
>  .../crypto/atmel,at91sam9g46-aes.yaml         |   1 +
>  .../crypto/atmel,at91sam9g46-sha.yaml         |   1 +
>  .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |   1 +
>  .../bindings/net/microchip,sparx5-switch.yaml |  15 +-
>  .../pinctrl/microchip,sparx5-sgpio.yaml       |  20 +-
>  .../bindings/rng/atmel,at91-trng.yaml         |   1 +
>  .../bindings/serial/atmel,at91-usart.yaml     |   1 +
>  arch/arm64/boot/dts/microchip/Makefile        |   1 +
>  arch/arm64/boot/dts/microchip/clk-lan9691.h   |  24 +
>  arch/arm64/boot/dts/microchip/lan9691.dtsi    | 488 +++++++++++
>  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 756 ++++++++++++++++++
>  12 files changed, 1309 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
>  create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
>  create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> 
> -- 
> 2.52.0

Patches 4-5 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

