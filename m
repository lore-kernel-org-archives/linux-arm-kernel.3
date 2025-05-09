Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4FEC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oAZerdoqNvoXq669EYro8m/ZBQ7UghYajG9A/pxU8g=; b=Lz/pSGxnJfeuW+acdSuMqzqXjI
	bCUoHr6Hy+iNVQUbZE0CBzb6d6n0eMDr6KfciKwCfJTQntzYpssnOhX1jv11U6LhSnrMaaW+olFEw
	qRFe+i19ZZPXmUE45X+peO9TgirOEHsVVTnpvbeGmbqoUf61xmE7ZHK5DGvhmb89WqenBE78TOwLT
	uNEyMKEP4ncsI39RSVkeT9m5Cub2XqroL3HsN3vANTVo21vR3KYXx7c1Gh42dleleftYPnUbukPhb
	vP7BqOw5c847hxmtLc0wqW9DyzyhpzyvzHefhXe4hdPmbCltlMezVZU3Ldqfk2gdRjaZ/UrweBOAU
	UogidzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxi-00000004ucD-0TGl;
	Fri, 09 May 2025 21:08:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTXG-00000004gHA-1fSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 19:37:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so18532085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746819449; x=1747424249; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3oAZerdoqNvoXq669EYro8m/ZBQ7UghYajG9A/pxU8g=;
        b=Yv9ZJ+bt63t7Gqi6QiJsPlqNTKO6r2S9fn2VVSMrlgtbUtqltv902FdHD5WkFnhKtb
         3bZ4qmlLYLGfTcb0nwKim4W1BD7UTLk9PmHca+DRVl+HcG9mKXUuA5WPhQEhZJiWacwX
         MzKGr3qjT3kirVqVpCoTGVFUiHdZcwczoxwOdECjDr2NZ8gWuvaicxqNuVd7y4cQ8DjG
         /yeAieJN/FUJeW/jxld9OPGiWFnwr6fwATuU69U7sbVAGmp9a8pEgxwQK0nDQ5b8+pgC
         9KuYqZ/cF8VLqanpc9kwiTvYNVRljyS/DZztq1IzlpTplBD1SQZdpjc6mmZyp6cRjg1F
         4/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819449; x=1747424249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oAZerdoqNvoXq669EYro8m/ZBQ7UghYajG9A/pxU8g=;
        b=Zmvint2uD7YP+m5qbeNtV2TxURiJdMaAlrs0yHsAYq2qo3h1m69eUbQ0OqHyZo5fba
         +PljRHSdfJos33DsKfov2wWLO1mfSlGbOQnP+dGqRcVhrgTXVSFZ/QbSXJCU/t1ihCmf
         pJXFVFitEjEL71fUqltb/lC+hAjJcy7kLIeKb4eBzHS7ahfqaCubCEJWx++yF/zYufV5
         SeQELMtL0IRgMc2tE37s8IUNVBF8CmMgjEZjD5PBhlxF1RpWIxVdN80VivuxcFlovWVl
         0hBXtJsUJI6i4fqbzVIKYOuude7flkMlML2LSC//WHPcq5UDCc5DxeSpnxwc9POsBHXw
         QOig==
X-Gm-Message-State: AOJu0YyHQF2l7JAf4h1UjsmuD2LrCJl3qrmQUypvDPn93Vp2QUF7Ow+e
	ft/impslPUo7cXTvPF05Otkt4NOmU78RswPBT1yD5DiyhrX/lvh+WMa6+LAK4A==
X-Gm-Gg: ASbGnctoQ4UHV/r4hbSs8z+Hw0z2jUO0uYk4hHPcRSnC6SPIcllXvsKX7N1eCzWpzdp
	554xM2qfymzoBS8ipM7B6VErvZLa0nvGJte7UOvESRNG6E+QxCXJ6FxSZXFdCrXIZ26ui8frfim
	EKSogmP/u2yBKYFcB/ZFrULT67+qH+FG4SsLuw3pcZYrJ7wmF8WJ/9kVpWm7hUo/DKIFzIFn6Mw
	5Z3hYG4rOtT6wkPl5CQFKIVVEQi8FNYhdoASScegQut3Yr57+q3bjytk98LaaikNAiATxKwKHMm
	k4idEqWtFmKcL10Q596km2awlmv0H3jlW+cYxs0/Wtov/cM5ipwd+ryJNhVtWm92YHrjiY8EYo2
	zk4+83DJUomeipyBetSX4Jmh7AB11dIXKhH/peYjAQasm
X-Google-Smtp-Source: AGHT+IHZrI/GvToEb7dCPGeWvlRmWso5d9JAzN2/1ym+EDk2TzhgDNhcO92+4YHwNzODFUBXeeEH/A==
X-Received: by 2002:a05:6000:18a9:b0:39e:cbca:7156 with SMTP id ffacd0b85a97d-3a1f6422625mr4225502f8f.1.1746819448739;
        Fri, 09 May 2025 12:37:28 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f33b5sm4223527f8f.54.2025.05.09.12.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:37:28 -0700 (PDT)
Date: Sat, 10 May 2025 01:07:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_123730_439089_9EED8E1C 
X-CRM114-Status: GOOD (  24.38  )
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

On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> Document 'aux' clock which are used to supply the PCIe bus. This
> is useful in case of a hardware setup, where the PCIe controller
> input clock and the PCIe bus clock are supplied from the same
> clock synthesiser, but from different differential clock outputs:

How different is this clock from the 'reference clock'? I'm not sure what you
mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
and the binding already has 'ref' clock for that purpose. So I don't understand
how this new clock is connected to the endpoint device.

- Mani

> 
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> The clock are named 'aux' because those are one of the clock listed in
> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
> fit closest to the PCIe bus clock. According to that binding document,
> the 'aux' clock describe clock which supply the PMC domain, which is
> likely PCIe Mezzanine Card domain.
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
>       instead and add 'bus' clock outright ?
> ---
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Rafał Miłecki" <rafal@milecki.pl>
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Junhao Xie <bigfoot@classfun.cn>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Add TB from Niklas
>     - Document minItems in clock-names
> ---
>  .../devicetree/bindings/pci/rcar-gen4-pci-host.yaml      | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> index bb3f843c59d91..528b916fdb99b 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> @@ -46,12 +46,15 @@ properties:
>        - const: app
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: core
>        - const: ref
> +      - const: aux
>  
>    power-domains:
>      maxItems: 1
> @@ -105,8 +108,8 @@ examples:
>                           <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
>                           <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
>              interrupt-names = "msi", "dma", "sft_ce", "app";
> -            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
> -            clock-names = "core", "ref";
> +            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>, <&pcie0_clkgen>;
> +            clock-names = "core", "ref", "aux";
>              power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
>              resets = <&cpg 624>;
>              reset-names = "pwr";
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

