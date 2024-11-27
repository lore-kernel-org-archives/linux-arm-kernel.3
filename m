Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE8D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbtsIhXyipBxdc1NyVu91VYySelozod24fQsF4jY0KU=; b=r/yL8/45D5rR2hMT2/Ig5aRkIV
	LpPw4N5yeWQaHZCrjQhxevtgqpjdhL6GXFLq6L8srm01Ss5lYuEp065Et/x9DCM7O97z62rmUKlt0
	UzFUf12+MsWfvuidawoqQZWVPcRqh38Ai/OHZduyxp3AlzXlIYbETQ+wSlmWI1YC5lHtCzqLmbpGi
	NtZcBYgnteIpIXaCFrcrgBtmaFU8pHFPfbwPoSpnkBvkhMkvF5Vzk8Lb3I4Rws9RJjDvrVNDhICkB
	qjlPGz6bbFGRuwuh2tFZfAjrxqmo+AQWm/53DlUvGIg6KZbFcFMrdR84WJ3Q5EyCB2cHSwSRDS3XE
	s4uwdaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD2R-0000000CWev-4BOa;
	Wed, 27 Nov 2024 08:04:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCtG-0000000CUnT-12Tx;
	Wed, 27 Nov 2024 07:55:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD08DA437A9;
	Wed, 27 Nov 2024 07:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6B3C4CECC;
	Wed, 27 Nov 2024 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732694112;
	bh=x0xX5vYSBWllewRjPzdfK0c874WVsNj5qAoWrojVTGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bucSP35AKAy65nI+BITULDx0+C9mvIKCfCDFgHIyv84XK+74qXxwFqUbTN41rkK+C
	 Ra6tp1daRWkSizWrHnXH10FW7w58tZ2kX8hBinj8iFiX1chlQzHLXzCN+l4ncSQR03
	 OnPHmh97RjPzSeDuH/4EE01NtM3RfoJgytMQdFBrt2uZX5X3MUhBxpKV/tKlolYwP2
	 AAPuj17Gfvw2HqlZy5FOkO4Dv2lqO62E3NZ22t36PrOPbxmBz/MoM46QZS/72X63i3
	 4rCESMHIqtId3GjebgFlSCLkaOZ8aJEJHy9tLVB3HTM8J+Qb7joF3gswz/if9EU4DG
	 43V0+UResU/dA==
Date: Wed, 27 Nov 2024 08:55:09 +0100
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
Subject: Re: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_235514_417883_130711A0 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Sun, Nov 24, 2024 at 11:51:39AM +0100, Andrea della Porta wrote:
> +  '#interrupt-cells':
> +    description:
> +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> +      include/dt-bindings/interrupt-controller/irq.h.
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/raspberrypi-rp1-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/raspberrypi-rp1-state"
> +        additionalProperties: false
> +
> +$defs:
> +  raspberrypi-rp1-state:
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    description:
> +      Pin controller client devices use pin configuration subnodes (children
> +      and grandchildren) for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-9]|[1-5][0-9])$"

You have 54 GPIOs, so up to 53.

Use also consistent quotes, either ' or ".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


