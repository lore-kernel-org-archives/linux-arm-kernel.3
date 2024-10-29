Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B85D33994
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KlQygMqNbx5WmKDOoawQG9xtMvRkqwwB/44Kqytm/o=; b=d5mCLQjsbsGG2DHdpwmZJP1jHx
	NcnQZKafKkrxZqqPD9kfM6QsyMdn11DfLOfZBG82KV2qmhnFWw7p8VuAtogfBDmbS2o6UJDVNKBCK
	AwNRiQHKHXkXi7Nh0YBrFqEHeffNoaTcXdDgJzZba6/URs5DCXI1W0Vd3fwCaQw0dHRz9EVlawn09
	fu4iXZg6RtY3bYSLDs7Q55Dbz/LnDRbTvakdDGgKBODDyJW5eB3mK9HkBoIpplJoU6jsHLpU+9GhM
	YPO050LwJRyVYhLGfttLcXWzq9mt6znIwUDiK0ZvMtY2nP1eaxilfPZt+ff9JAJZ/Vy92TwSEA5VA
	t3pCqk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ghn-0000000DVhL-0NlE;
	Tue, 29 Oct 2024 07:31:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gZK-0000000DUWe-2WdJ;
	Tue, 29 Oct 2024 07:23:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0365F5C4CF6;
	Tue, 29 Oct 2024 07:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CB2C4CECD;
	Tue, 29 Oct 2024 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186589;
	bh=QAzVxk6lkr2Gefgn21V1NPzIlb3phHk+NiaSEFFYv6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dsu5VFMw5/izIn95xYd0VwvPDr1GTjf2Jxb7smE2zw2vCRp5/UersnGNdbNWnA0Ai
	 3QSz4h0Hi0J/YvW7mygRXj9CBmbwKwbmGPa+Rp8aN3zmvR8qJTzhF4XplWvbP17nCX
	 F0qCYQoenQDUMfZUlPLBdTHlXsWSYUnqeYBvo02W2ZnhGYCyP/9eANC6B3wCYEtqE6
	 lSQapXgD6doDrdyIjuKB9rxSx6vvoa9LkPGSjuYEOcOnFIQNGHuB8naXkhZ4F1I1Pt
	 o6eYQdPZor2VmwM2wQhnL0ozS47jz0tB2WGMQrfQ2oidc8BmNChR3Hi9WXyOTQu6+H
	 t1Pz8xVUE6qZQ==
Date: Tue, 29 Oct 2024 08:23:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: Add RaspberryPi RP1 clock
 bindings
Message-ID: <cxwzmlzafgdu2uarcx7mdv4p32zig7efatcg4dzmctho6mvykl@dgwvf3ltcjmo>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <914978925d34cfb5bee10fe92603f98763af48b0.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <914978925d34cfb5bee10fe92603f98763af48b0.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_002310_754941_EEC0254E 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, Oct 28, 2024 at 03:07:18PM +0100, Andrea della Porta wrote:
> Add device tree bindings for the clock generator found in RP1 multi
> function device, and relative entries in MAINTAINERS file.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../clock/raspberrypi,rp1-clocks.yaml         | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  .../clock/raspberrypi,rp1-clocks.h            | 61 ++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
>  create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> new file mode 100644
> index 000000000000..a123dd619f8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi RP1 clock generator
> +
> +maintainers:
> +  - Andrea della Porta <andrea.porta@suse.com>
> +
> +description: |
> +  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
> +  VIDEO), and each PLL output can be programmed though dividers to generate
> +  the clocks to drive the sub-peripherals embedded inside the chipset.
> +
> +  Link to datasheet:
> +  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,rp1-clocks
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    description:
> +      The index in the assigned-clocks is mapped to the output clock as per
> +      definitions in include/dt-bindings/clock/raspberrypi,rp1-clocks.h.

You still describe how current driver matches assigned-clocks to your
output clocks. That's not the property of clock-cells and that's not how
assigned-clocks work.

There are no assigned clocks in your DTS, so this is really irrelevant
(or not correct, choose).


> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xosc

What is the purpose of clock-names if you do not use it? Drop.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> +
> +    rp1 {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clocks@c040018000 {
> +            compatible = "raspberrypi,rp1-clocks";
> +            reg = <0xc0 0x40018000 0x0 0x10038>;
> +            #clock-cells = <1>;
> +            clocks = <&clk_rp1_xosc>;
> +            clock-names =  "xosc";

Only one space after '='.

Best regards,
Krzysztof


