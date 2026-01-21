Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84416C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwSOT/yQWEA+mh+MAPkTqG/wbQ6a0oX9ZNNu12ekmpY=; b=xTpHpMXTcsCQQVpO+L8GSG/Kau
	wrdoq7i8ULQYivewKoA9HSN1QCe8jeM8UT6TYRKtVWTmLW5f38o+6qLO5U+bGZ7GNN5somWnqHxGh
	W5HD7Td6+qHh2mnrOM12sD0f3iyrhzGYgmfE7nwgQU4tXCRLi3nKO4OsW7gXzUDtamu0925+aAx5V
	+n5QNtYr6mdP0VegaA3c5+QMAnNy6y9E1lvqRl0DOON/H9YcCgXMYBCd+TsMKK1Gb918G/NWOhVNQ
	Ydp+O5ABXTJi8tfdkroQThdCcFMNCXLR3sth24nK0C2AVev3yJss3RbCGJF0ZPuryQ8cjACHMDEY3
	M9WIcotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viarU-00000005m3P-2REp;
	Wed, 21 Jan 2026 16:15:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viarR-00000005m1z-2iMh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:15:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4037105f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769012111; x=1769616911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jwSOT/yQWEA+mh+MAPkTqG/wbQ6a0oX9ZNNu12ekmpY=;
        b=HpNpFZDJQdQv5761qPpZRuwRIIDxgBR7rWmNYqb0rDguUKzrZgQ3KlQfiC/9Yxipgw
         jJhsvjOlIUi9iJzfNCMvDShsRA2PrU4GDbFsussLFdlH86SsQnbLJGkz0gMBmuihTOnu
         M9ad2UogmdJCsQXcgD4f/u9XtEpun/J1D190kGvQYfTKK3ytEo27plSGadFaYKfVyo01
         zsneSvPj6382wYRAk0ixXrITw3yrWQ5l2RM2O2UBKDygg/qxr9YAPTigvCDYJuwpptIR
         cQLj3NJBHwfJBbclsMWk9Wur1WPnN+xTgkBlfaOu9DmbdiQba6eNPG+Ms/fndtReJ5OR
         F/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012111; x=1769616911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwSOT/yQWEA+mh+MAPkTqG/wbQ6a0oX9ZNNu12ekmpY=;
        b=TkG/phHCJumPMhhH4KaXn3NeJAy+GYdc2b9P6Om/o9Oh8EpHhCcVUJ0K4pwCR1NIGX
         3YcKPsDFDJ1qglDVcm7+YaI6IJwmicW7wv2EtnyZHPpStDcna4nyfyyPxZ6sHURLzxAj
         +gCjS2tN53h89KJXw7gF+pQU+R9FA2cK1F/ecnbMuIdRxSXuEQ9kWdXS0SKrV0KpJVPD
         FKpGABpyRoPNOalHtab0lZoBvChhh5JEkmMniQC7PC3ir43k9NQbbV0DnsOE34lg9PoM
         WYfD03x/XGm5a1sm5u6m9fgz2WjyznKq1bFBjNob5Z4jJMs8Xqi4i+o/oKFswrhoYikX
         2/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWtLIqMosshXnd8RqVPeU7JuqK7HYDrasWJDVj+yCQJaPWw0fiaqsllofAnRoWxlU6E597h96Vzz+0IEPaee2Vk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9DjPJnsAwZA86GHfeT+142RX6OZpmumnssbPy9Y8osjHiwily
	6iVK1EgmDU/jQCLI5pr1gJCnpnLlNz3X59Sz1ppH+17EPu/8whR6eYhNkM7RYmu/GqI=
X-Gm-Gg: AZuq6aJFpGe+6LgjC2eZG3fGA1rTubJcK7C4UyV2EykQoRk/XTp81Cjt41y157kcvg8
	h3OyaLG421gJE35KPpOKzPH8YguH8jiPAgQupGysbYMi4+ifHa1LkIaz/dd1Bp10LlJYkRQxhiw
	lC7I1tdzu7SPbnMF79D3/Zw/qR1gGDX7JfJrZseR8rrgj4jrRKZ6FaWBZelt3afQBob4yDZOZQt
	Tjxb4RFp/r+xnnNjASBHcFFSuNYsqwPQulxvkVJIuwL9L1dstF6D5wcYTxm4t8/Ya3oaHteXRHv
	KHFkSJesgFke0aZ5E0GVhvz2TuNhSygppcoA5lDBhrbd6w4F5EWgbNcjvcLLsLEVSBQGsRnnPHK
	YImifv5rdj2GXZ9YJPK3Oe5X3wKKH0vymtucwlL74EJR5yVD+zWrwJJ3RagrH0awCKPnN71XHmr
	bKdPEXgLJq4v8RDwhpGN7w8aH+Zsqgx7L1CvUZymFZmJqEG23Zu9fiXw==
X-Received: by 2002:a5d:5848:0:b0:432:a9d9:b674 with SMTP id ffacd0b85a97d-43569bd4899mr24188248f8f.63.1769012110431;
        Wed, 21 Jan 2026 08:15:10 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a705sm9859116f8f.14.2026.01.21.08.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:15:10 -0800 (PST)
Message-ID: <ea1af06b-fb85-4131-bad3-00d12c032c1f@suse.com>
Date: Wed, 21 Jan 2026 17:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] arm64: dts: s32: set Ethernet channel irqs
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
 <20260121-dwmac_multi_irq-v2-3-3b829230d071@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260121-dwmac_multi_irq-v2-3-3b829230d071@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_081513_747780_7ED9E601 
X-CRM114-Status: GOOD (  17.24  )
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
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>    1) Sharing IRQ mode: only MAC IRQ line is used
>       for all channels.
> 
>    2) Multiple IRQ mode: every channel uses two IRQ lines,
>       one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++++++++++++++---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++++++++++++++---
>   2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 51d00dac12de..5a553d503137 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>    * NXP S32G2 SoC family
>    *
>    * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>    */
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -732,8 +732,28 @@ gmac0: ethernet@4033c000 {
>   			reg = <0x4033c000 0x2000>, /* gmac IP */
>   			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
>   			interrupt-parent = <&gic>;
> -			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "macirq";
> +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 0: tx, rx */
> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 1: tx, rx */
> +				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 2: tx, rx */
> +				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 3: tx, rx */
> +				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 4: tx, rx */
> +				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq",
> +					  "tx-queue-0", "rx-queue-0",
> +					  "tx-queue-1", "rx-queue-1",
> +					  "tx-queue-2", "rx-queue-2",
> +					  "tx-queue-3", "rx-queue-3",
> +					  "tx-queue-4", "rx-queue-4";
>   			snps,mtl-rx-config = <&mtl_rx_setup>;
>   			snps,mtl-tx-config = <&mtl_tx_setup>;
>   			status = "disabled";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index eff7673e7f34..e1f248d3aedb 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>   /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>    *
>    * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>    *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -809,8 +809,28 @@ gmac0: ethernet@4033c000 {
>   			reg = <0x4033c000 0x2000>, /* gmac IP */
>   			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
>   			interrupt-parent = <&gic>;
> -			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "macirq";
> +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 0: tx, rx */
> +				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 1: tx, rx */
> +				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 2: tx, rx */
> +				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 3: tx, rx */
> +				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* CHN 4: tx, rx */
> +				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq",
> +					  "tx-queue-0", "rx-queue-0",
> +					  "tx-queue-1", "rx-queue-1",
> +					  "tx-queue-2", "rx-queue-2",
> +					  "tx-queue-3", "rx-queue-3",
> +					  "tx-queue-4", "rx-queue-4";
>   			snps,mtl-rx-config = <&mtl_rx_setup>;
>   			snps,mtl-tx-config = <&mtl_tx_setup>;
>   			status = "disabled";
> 


