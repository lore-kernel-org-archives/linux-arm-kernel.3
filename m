Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlXlhcr6/DYLKPgrxbgTpw1meSaotSsfgIntKJEXx9Y=; b=kcdlR+5h4732fD8DmkU8OocYYC
	0ZX42SFPfKFLgapememImv+3O0JiLRKgTaSZzUJ0JRFHDDgYxor2IwsX08QsoQPc4sG6sBABenB/n
	tZ6VoXlONtkMDWlJKKLjferB+mKxoYqPhhZffyENLSxD0HWiXfxf/+ZC0wzxcv51z/BxfqPpsd9+X
	zQDWAPHNQyWyC0SvasNeSO3115hhaY//UUJIszbPkG+NHDbVk22YRjdtka/9OkRyoGqlneyT3HrsB
	V3Ed5+3gEsR28dGjtShZOmrHecRMatFVTbhEWd5AME1s1g93rFrLoscKwR1UnPaVCqLoAIT1qIVKh
	CZJzrpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viarB-00000005lyl-18mH;
	Wed, 21 Jan 2026 16:14:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viar9-00000005ly3-19Ta
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:14:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5942530f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769012093; x=1769616893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hlXlhcr6/DYLKPgrxbgTpw1meSaotSsfgIntKJEXx9Y=;
        b=N2oLchE9/DQHZEWa/pA/HKEfhDSA/uk55CXzYK8KfAgHpj1zKLSdtXMFRHEXaS9O84
         AAQdwdyLeNhjWRic34orP2CcY7XAGx/qdYv7oWLEPCgGP5KF5ySUvzK+W9YeD/HBVUJG
         iFSYI40cpqe/pH4atMd3Op1TFRGEj1EYSn157uXp6QwQQng1NG9ooqNoy6m/ef9YF4cw
         9GuGlCTGdma7bYM+HrEizk2dJs8gUdu76n2EOJPzpme4BtR33gYZaYFf0eJmZr0VJ+Dw
         c++kajtVsgRZCXWjNxSBzryOvdxK87eu1tEYudUucScLTipZmPbDrbjsOIiHwAdFgTZm
         hYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012093; x=1769616893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlXlhcr6/DYLKPgrxbgTpw1meSaotSsfgIntKJEXx9Y=;
        b=EaNFMKrzD4TDypfpcIgk7QlZeDenymoylMlz1LVJhrHxFJcELS7PlZP67KkhgPsAuF
         1WUvGhntMx+YMs8UZmado0sUGkr5rhuC6Z7Trskrqhz6n9VvCzwaI9ZQdRDteNQDCltZ
         yu9F7s6vnOBjwmbS+TUh00ktEK4CsMpEqGNitgGS3PwYXGs01vu9WCAZoGitR1JrdHKZ
         eSA8RoirVLH6yJhEIREQjxk9yBBMXtSxMpnNHN3REllM9LqVrdB6SZMGdFwfvdrH+dg3
         FtQ017+PWntJqV8j3tUovPCmQIXKnXS7sXZ/8b4mkEJ0d4qRy2/npEWCR9MWI1Iev6kt
         PaEA==
X-Forwarded-Encrypted: i=1; AJvYcCUGbR2Qbh83HQcpjV373FFsYI4CuSRdBmhoHob7LDsOhwxVUbUy7yr06FplWqrd98/9dDxqf3T42psW7YK/iwQn@lists.infradead.org
X-Gm-Message-State: AOJu0YxaKpZuiPzoc2m3AfLs+s7HnLWDBElBKTN0nfiHwM6ZRO6Yz2dm
	B2rVG1FvFQGeoNKh561KqwkVIKzmdRUB8F/Yoe1AAwMgg/qVoqALoIYHeeJGjAm24ZM=
X-Gm-Gg: AZuq6aIy8M/sq1RVoQPE22XdbW1gC7tZfwTz9w0snLpkh7RZnKoL4ip/nheesnKg6g/
	fwJpIRdXPBI/LIJzmbaQgy20JLs2W/HeTicSpHmy9q1nTsPbw44stG7b1/ROq6aZuxqM8COnbmn
	nt3JS76R9wGG+jjR3BNgpEk4hfu/MKyoxlC4EzWeXCJo0Tyja/VebnQ9QcA9wdeJQDzAdn1zOZg
	AHfvwg+EZJ8Lk2YFzS6uxYomF+gV/VO8qWIw83ejt5IQHAgXAPYSXyS9mRCCkRFTInHrMxiQ4mu
	33REsvZbbgaw5IzBdLjOPI/X1CW3AC5m4fKP981A09VbiZD0MS9Slumdez2UXwcQp535DU4XCq4
	+h8APpY+USCTd0s5wcYDBDmEzkShSoaYnwqzFRHExdASf0NEcqlIX3bbCcHvmrOiKJkey5E9YEY
	+WnteaVdw/+rF1xmrDuyAcb5D9Ao3ySZWCnbMZTP3UGD+/CQWHDafamg==
X-Received: by 2002:a05:6000:2dc9:b0:432:8504:f67a with SMTP id ffacd0b85a97d-43569998f9cmr26906178f8f.20.1769012092538;
        Wed, 21 Jan 2026 08:14:52 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm36687408f8f.18.2026.01.21.08.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:14:52 -0800 (PST)
Message-ID: <122dceeb-3221-4715-91e9-3bad43889ee6@suse.com>
Date: Wed, 21 Jan 2026 17:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
To: jan.petrous@oss.nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org
References: <20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com>
 <20260121-dwmac_multi_irq-v2-2-3b829230d071@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260121-dwmac_multi_irq-v2-2-3b829230d071@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_081455_367341_138732DB 
X-CRM114-Status: GOOD (  14.04  )
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



On 21/01/2026 15:23, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> set them to allow using Multi-IRQ mode when supported.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 42 +++++++++++++++++++---
>   1 file changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> index 2b8b74c5feec..e1ebc3bea095 100644
> --- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright 2021-2024 NXP
> +# Copyright 2021-2026 NXP
>   %YAML 1.2
>   ---
>   $id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> @@ -33,10 +33,22 @@ properties:
>         - description: GMAC PHY mode control register
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 11
>   
>     interrupt-names:
> -    const: macirq
> +    - items:
> +        - const: macirq
> +        - const: rx-queue-0
> +        - const: tx-queue-0
> +        - const: rx-queue-1
> +        - const: tx-queue-1
> +        - const: rx-queue-2
> +        - const: tx-queue-2
> +        - const: rx-queue-3
> +        - const: tx-queue-3
> +        - const: rx-queue-4
> +        - const: tx-queue-4
>   
>     clocks:
>       items:
> @@ -75,8 +87,28 @@ examples:
>           reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
>                 <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
>           interrupt-parent = <&gic>;
> -        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> -        interrupt-names = "macirq";
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                     /* CHN 0: tx, rx */
> +                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +                     /* CHN 1: tx, rx */
> +                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +                     /* CHN 2: tx, rx */
> +                     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +                     /* CHN 3: tx, rx */
> +                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +                     /* CHN 4: tx, rx */
> +                     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq",
> +                          "tx-queue-0", "rx-queue-0",
> +                          "tx-queue-1", "rx-queue-1",
> +                          "tx-queue-2", "rx-queue-2",
> +                          "tx-queue-3", "rx-queue-3",
> +                          "tx-queue-4", "rx-queue-4";
>           snps,mtl-rx-config = <&mtl_rx_setup>;
>           snps,mtl-tx-config = <&mtl_tx_setup>;
>           clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
> 


