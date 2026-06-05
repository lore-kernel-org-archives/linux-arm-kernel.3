Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD29FCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIe9PJTXxBHQ0XX31cWOxKtFhK/4Vta8bzAs10DDqbM=; b=WtrGqdTR2skrDufN//T4bSihcL
	3D58xqap0/AF2RW+EhO/pzniimRJWilmOYIftR1eesIkbHgrQE5bbX03gQoUENfvioJAVEuJW0er2
	xvv3gc/1BTYQ+OL+CqEdmhXRCkoeA0fYl9kgNDJD22T5/QlQpIeRZC73aKDpeHKZajUPTRBCGp0zk
	d5Q2IFGRXa46tkwX5PUwf1wAJzliImGh+/iKkPFArajWIlMZteOVs0Qyahgksk4EnnPybDGdM003+
	8xIKqB/eox20iNzIXEkB0qRmjZ/vgKo8rmzUHl9ub83eqZl3kAFyhSdVG0lPc6xeY3xD4M9Z/asXQ
	FKqA62Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWmI-00000000rLs-2ua7;
	Fri, 05 Jun 2026 15:48:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWmG-00000000rKs-1rkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:48:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1117714f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780674486; x=1781279286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIe9PJTXxBHQ0XX31cWOxKtFhK/4Vta8bzAs10DDqbM=;
        b=hMkMvIjSnvZmuiVxLb8Mfk7NiurW/HFW4GRASMmlg0n/oz7MTGvqUTHOtbUQAt0J+8
         HZUtMa1qU/IEb0oeYUpAYMZRptXH18oNPiHcK2C4/GcVUVb/ASOBRbnipW2EIgyXdT7n
         Ixvps8Rbvzu7cS1EQMrbBvNlbateIA3G7w01m0WhgyfbnC6YzU4XqBNTZKt8r5/w/HGB
         uCqm3etmXXhmOzNwJsTXo/Yy+XH4/yA6lDCabrZV7BHmmiG33LvDHMQqSBHZjwG3ORiP
         yWl1LIOfeE1GLOyeSDzTa7Ubm2CKX7Y30kIRhgA4Fa4oLNMLMTMhf7G5hGHYD4nsBLY/
         Rkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674486; x=1781279286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIe9PJTXxBHQ0XX31cWOxKtFhK/4Vta8bzAs10DDqbM=;
        b=YahhvSDXK7ZMAPYmy7+j0Gm36Q54d1tNqtYPfDuTaQzQgNjEgrpgerpz+4MBe/Dzvd
         cgj1DEe9aRg12gBv2XbJxoc4Z3Oz8+dzdJhhgZFdiuT/BIB6JqboH1HBFdcC1fCckJH+
         xHybOCcHf30/WCf2j735vvLB66i3JQukaWMLAToVYF/boDnXxXdXxurRsqYLA/0vIn1c
         kvk6pkJ56GcFtyR/0hXofsfEnv8gB/7w6cV2xt5Ln1xo4VHy7ZGOAmbmuLlpYsUWo9Xz
         TfADotcFg0/CANsjZgp/dacVooywxEy6pt1kn8/CZ6E1yVI55Aj3UJl0k5Jy50qbLxF8
         A2kg==
X-Forwarded-Encrypted: i=1; AFNElJ8Js8iJDS9fFwOegv+MpWyhsXW68WhrGspICsNB8DJdkFXA3WmlEZ2OnDYS9NwU5t+kgXRQfq+KnCiCzCzbzi4e@lists.infradead.org
X-Gm-Message-State: AOJu0YyJsmz5NWua6WvxTvapt9+zVmawKAJu3SmrdGDB7Gt9lnu6C6/a
	3+/nhld3h6SAthDfNPtAAw5/GGLiAMGhgJbimS1oyZHzlSrKxmuaXpsx
X-Gm-Gg: Acq92OGqToRTvFOYaJgYjQdRJ9afw+ND4wkViPZAgMcUw7GmQQN+1IqmZHKiF83QSrh
	szlw7Fl5rCKsf6rxh4CzfrKhC2Bzd4ahMk8uEuiIPYnE1ocdKi/ACpmQDyoQzAd6aK27khbTaM0
	lbFEdkbZHHeIIRV1DnFUeq/tUiSj8L+EEV9M+yxafYzRkCmQk45scd+BnXZMbrWYU5VVgG9eXag
	Sc7Z8yUPfeQnMryU6GzKPdQZch8o+TTFI7M+6EfbxeEEthp+Cv7wYoaOFIFVD9M0n+lcTmIm0mv
	0UU4dbshpT7T1HyGAfe8ONpSVYcfGmhecT5VSvz4Brmvy72yO2fcdvlgDPATvFsBod3Vk9O3WpR
	+Zx8CcL5CPiCm32vwZSVTzpRv60pfl/oMH9DdJ+uB923Opp0vLcgVUVUvQXgfvj4VSkyC9+aS/V
	AfGqShjTvWSiBS0Fy+rcLLQgd5qv4a2ZNKzSyIJw1VRToitAUFfk7Pi4pZRbhQ35jCpYY7JrXmR
	ejF3LA8ZqPsyM8/C080loaxVeltN70Nuo2eJprc4DYSt6IGRJuG9LnZ+hFLfyi7j05oKuEQyQqE
X-Received: by 2002:adf:ef88:0:b0:460:1e9d:31a5 with SMTP id ffacd0b85a97d-46030631ba3mr5236539f8f.35.1780674485919;
        Fri, 05 Jun 2026 08:48:05 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f14:5400:d967:4840:e11f:4ad4? (p200300ea8f145400d9674840e11f4ad4.dip0.t-ipconnect.de. [2003:ea:8f14:5400:d967:4840:e11f:4ad4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm27730653f8f.4.2026.06.05.08.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:48:05 -0700 (PDT)
Message-ID: <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
Date: Fri, 5 Jun 2026 17:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
To: ricardo@pardini.net, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
 <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_084808_515594_2C2DA5DA 
X-CRM114-Status: GOOD (  21.75  )
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

On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
> 
> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
> compatibles documented in their own bindings (e.g. microchip,lan95xx)
> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
> these PCI function nodes can be validated.
> 

The of node seems to be created by of_pci_make_dev_node(). But this
function is called for bridges only in pci_bus_add_device().
So where is the node created in your case? Did you test node creation?

> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
>  .../devicetree/bindings/net/realtek,r8169.yaml     | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek,r8169.yaml b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
> new file mode 100644
> index 0000000000000..6923211ff4c93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek,r8169.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/realtek,r8169.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek r8169 family PCIe Ethernet Controllers
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +description:
> +  PCI function node properties for fixed/soldered Realtek Ethernet
> +  controllers driven by the r8169 driver.
> +
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci10ec,8125  # RTL8125 2.5GbE
> +      - pci10ec,8126  # RTL8126 5GbE
> +      - pci10ec,8127  # RTL8127
> +      - pci10ec,8161  # RTL8168 variant
> +      - pci10ec,8162  # RTL8168 variant
> +      - pci10ec,8168  # RTL8168/8111 GbE

This list reflects just some of the PCI id's handled by r8169.
Any specific reason for this exact selection?

> +
> +  reg:
> +    maxItems: 1
> +
> +  local-mac-address: true
> +  mac-address: true
> +  nvmem-cells: true
> +  nvmem-cell-names: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        ethernet@0,0 {
> +            compatible = "pci10ec,8125";
> +            reg = <0x10000 0 0 0 0>;
> +            local-mac-address = [00 00 00 00 00 00];
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b539be153f6a4..6341de4fadb6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
>  M:	nic_swsd@realtek.com
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/net/realtek,r8169.yaml
>  F:	drivers/net/ethernet/realtek/r8169*
>  
>  8250/16?50 (AND CLONE UARTS) SERIAL DRIVER
> 


