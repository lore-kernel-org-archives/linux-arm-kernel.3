Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B78C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVqYn/Ux/g4Ywrq/aBKi13oyKDJDmOzkdViG+3ve29Q=; b=nYfOf8+6i6oDmymlZuglUudCo1
	1ZYak8t2Ka+vmdhRJ7YANqqxYaFVJ47ztWHLzUBV3kbW0URRoyUXVZHpkHqaACa31tOITto7xugZL
	998n10mefeUDOcxSSa/L45RzLJq/u4LXidMLgbCIvZ8WKGNjYYKrJr2kBBxaIdD/Wx5bFIK21AXI/
	CpC8qcJ+3+iVKTM+F7/Epu1JX/bpH3x4qwOMkRSMteodwAUjWxuljkeflU+hX/SyM1JoDyQ22OJFV
	AUmt8f8a34a2HZqR2llRUTTaVuPUCZddPwpk5+glWVfUMx1BRxzta1A93uBVzpRuLV7Oj7QGXdICp
	XDJb65MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveph-00000004w3v-1jIy;
	Sun, 16 Aug 2026 17:39:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvepd-00000004w3C-36Fq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 17:39:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1767864a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786901977; x=1787506777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVqYn/Ux/g4Ywrq/aBKi13oyKDJDmOzkdViG+3ve29Q=;
        b=H6CldTDn0yxUVtYoKsi3c3TTlxrBsnKa214BlOCfwFO9vbv/PRz80vLeGjmXsIMiHX
         ejNSUOTB13LyI6/jPaNboEGRttDKhugcLBPEyGM75hqZoDFY8BG4fLr/uGCXVXukDgFP
         2K9RvIrIGLSWjefQB9Z6iiBuU1m76wT/DiwWPb0beZkrG2a5ewVNxl7c/Pq2mnwT9c/z
         VRLQvWlF0u2IYmnH0Ybg6xxifIqaPd9uDx1Cfhnttum87Moyrl81C6EsaguGYjEnzbpe
         7O26bBdtmZJmIRk+H3SmdkiuFByF9DB1biJ6uy08AHgr1stQkv6Eo9ocqRoRBf31ARAP
         5VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786901977; x=1787506777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVqYn/Ux/g4Ywrq/aBKi13oyKDJDmOzkdViG+3ve29Q=;
        b=awCgSijbHQe0JwqGkbpmipk1LULmbjojKcZTy1SWGIuQTAoyo4AhuEufw4stGNzvno
         Tpc70NMGEskmRkp/2X1qbcoczEQbCHmbA6bYyX5d9OmEN52GGI0y3WjZM5vqN2rqwIep
         di+bhaUdLKp53dBGW/WJ+q+AhpLIT4M/J7eS3g1G/DmyBOHNwSxQTtul5HtFr5TaiOEd
         j4KyWftU8X5p7pCP3NQbeE5jL7c1ZjvhHJUD5e6Y7nn8FJHdG+yo99G1f043664qItcs
         FgDtqcBE9T/1oLtLXnT2vKtM6gdkOm9JmlX5gV3Gqg00LBVzkelz3xaXwAI18DG0A+Nb
         AFew==
X-Forwarded-Encrypted: i=1; AHgh+RoGhvMXYdMieb3IQJiYb4fFKU1FQK4v6sUGpVmJEbaEKmxNai42s1nX7lj4bmK8dHM60obQQ6uRo6MIxGTwm52d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1bXwbPPyIS2jzg9GLC4a4t7AD8cvQzWfAB4gUPoj7qQ6itEMb
	9SlPoYUHJ2XYVKyyyP2a8EZj9DZ+llb6+MQQL1hHg9N9MjB1FoOVacP+
X-Gm-Gg: AR+sD13GWy3ErLbLlqALWkx/pxynrkL9nP/qcvhdT9qtfbaSo8xTqBXzXEKtQC0rGBA
	GKwesz6K6LhJKbpMv/5WplyFz9V+pBc51yb1+PENsAAJ3MiGgi7AP8wwIGXFeQRIjUptvB94Lc9
	WV5D6uVB/GAKwhBaEPMKOFE41V66W5a5BOv/4qJUtkKeZQ+fOu/aHxIsXtudr1jhiyAzvUlZnks
	13EU4VRkpFKXhpasv4i0TF4ncm/TA7CiQWH72uKiDY+8EEzYFU+xnAtwIMUOLx5XHjm69asvLUb
	Wbn+vPMRXXhT7RXKdHHqnaRdWyAAGH7heumeji47/hPl1AMiaaODLC2JTKxJ90eotHBOATDz564
	bnw1/y2oeCXqVPBX9CnyEmhfn5U4vrRgwLzYxxjaXhinVOPIv9xNHJKaHT/K3o45Mbct4iC/G26
	dOT/vtg51wuFbZN+5wfAVE2NYnaPLfQwm759KcEXc2/1VUWjP/b5OMWvSgNKwwGM4qLZGvo7UwX
	aiH6u5oOJg9SOU16peS01MmtG0HLSQdVjUpPeI=
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr21383173a91.12.1786901976477;
        Sun, 16 Aug 2026 10:39:36 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:403c:f88f:3e17:55ae? ([2406:7400:56:e503:403c:f88f:3e17:55ae])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c5747sm31311985c88.5.2026.08.16.10.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 10:39:36 -0700 (PDT)
Message-ID: <ed2d4520-f09c-4be2-9c0b-5c6636e74653@gmail.com>
Date: Sun, 16 Aug 2026 23:09:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
 <20260816-ti-davinci-spi-v2-2-6c6f5171422b@gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v2-2-6c6f5171422b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_103937_861757_D18014D6 
X-CRM114-Status: GOOD (  23.21  )
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

Hi Bhargav,

On 16-08-2026 03:53, Bhargav Joshi wrote:
> Convert the TI DaVinci/Keystone SPI controller binding from text format
> to DT schema.
> 
> Changes during the conversion:
> - Create a separate ti,davinci-spi-peripheral-props.yaml schema to
>   properly define the ti,spi-wdelay peripheral property.
> - Add missing dmas and dma-names properties.
> - Add constraints to ti,spi-wdelay based on the 6-bit width
>   of the SPIFMTn.WDELAY hardware register field.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/spi/spi-davinci.txt        | 100 ----------------->  .../bindings/spi/spi-peripheral-props.yaml         |   1 +
>  .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
>  .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
>  4 files changed, 144 insertions(+), 100 deletions(-)
> 
[..snip..]
> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 000000000000..b685082de721
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DaVinci/Keystone SPI Controller
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - ti,da830-spi
> +          - ti,keystone-spi
> +          - ti,dm6441-spi
> +      - items:
> +          - const: ti,keystone-spi
> +          - const: ti,dm6441-spi
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
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Should contain a phandle to a PM domain provider node
> +      and an args specifier containing the SPI device id
> +      value.
> +
> +  num-cs:
> +    minimum: 1
> +    default: 1
> +    description:
> +      Number of chip selects supported by the controller. This
> +      includes both internal and GPIO chip selects.
> +
> +  ti,davinci-spi-intr-line:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      Interrupt line used to connect the SPI IP to the interrupt
> +      controller within the SoC.  The SPI peripheral can route its
> +      interrupt output to one of two lines (INT0 or INT1). Set
> +      this based on the SoC-specific wiring to the interrupt
> +      controller.
> +
> +  dmas:
> +    items:
> +      - description: RX DMA channel
> +      - description: TX DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ti,davinci-spi-intr-line

The old text binding lists #address-cells, #size-cells, and num-cs as required properties,
but the converted schema omits all three from the required list, was that intentional?

spi-controller.yaml defines these properties but does not require them, so this silently relaxes
the binding and permits controller nodes without the SPI bus cell declarations.

num-cs was also required by the old binding. It should remain required to preserve the existing binding,
or else the commit message should explain why making it optional and relying on the driver's default of one
is intentional.

> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,keystone-spi
> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@20bf0000 {
> +        compatible = "ti,keystone-spi","ti,dm6441-spi";

One minor nit: please add a space after the comma:

compatible = "ti,keystone-spi", "ti,dm6441-spi";

> +        reg = <0x20bf0000 0x1000>;
> +        num-cs = <4>;
> +        ti,davinci-spi-intr-line = <0>;
> +        interrupts = <338>;
> +        clocks = <&clkspi>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +            compatible = "jedec,spi-nor";
> +            spi-max-frequency = <25000000>;
> +            reg = <0>;
> +            ti,spi-wdelay = <8>;
> +        };
> +    };
> +
> +  - |
> +    spi@41000 {
> +        compatible = "ti,da830-spi";
> +        reg = <0x41000 0x1000>;
> +        num-cs = <6>;
> +        ti,davinci-spi-intr-line = <1>;
> +        interrupts = <20>;
> +        dmas = <&edma0 14 0>, <&edma0 15 0>;
> +        dma-names = "rx", "tx";
> +        clocks = <&psc0 4>;
> +        power-domains = <&psc0 4>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> 


