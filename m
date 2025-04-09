Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E2CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXadCYGCeRlVv6nkNiMsdmZX+R6k6x5Uhyue3beQA8o=; b=rqzEOrhYJliXCPOSUCFUmEueLc
	e3duKLzma5Fa1djRXjE+It+l8/ntutAKdy+q/7P6tTJ2ZHkipBf2itcdX8ugNUrPizdKbc2+e14Tv
	bJtPT14G5pz84/R8WYpjcHLjmPv7DCLMUbB7d6YzmSJc0O/SNXb1iZx3ZW91OzVDv1ZTP45qFK04c
	W2zDLJ97ndiMDFY/wuk0v5ohIFTfxK7i9T+BOVbYXsHnwXHWOmsg+Hf+7ZihGPWhCTKYqRBBBgPzy
	Xt2NdkRPFW74A+v/rySfY/byJK8k8zxWnadiYcVIpGwODKO8mODyvtnqOqmXxgLnG1L8IxTaoWDOM
	CSLf3QJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Pat-00000006Nw4-1On9;
	Wed, 09 Apr 2025 07:11:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PVZ-00000006My0-2jOG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:06:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22548a28d0cso91217095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744182361; x=1744787161; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXadCYGCeRlVv6nkNiMsdmZX+R6k6x5Uhyue3beQA8o=;
        b=FEQ1wY606Vf9k6hcKyss9uDCLD/nTMGdoWGGu27g8wSnTbWpr4Lp64RK5Nw4VE7oXL
         FPjhQ7ZI0UgN/JzTUwX0YLphv9Ql5n3D2QF8zRyWV0vf7OuvWEUdoE+qNIUPSiTirXWY
         lVdJW6eQEZkTBliD2ewGCpK6CBpsABjpavSjPaUJe9UHizycLE+lV9clReVlNdJesR2W
         SheIcU7mJdfsvck78lvJZpQ9nw6JdmTPgAFIeYfYM0Blfxk0RVfALhlpG3w4z8YJAUOL
         Nbe7P39g3Fsv+xCLovQ/QK/Nw/owxNwl66h7kcEqTYYIK0/WY5mo2Zhnbwu9G96hf0+N
         WlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182361; x=1744787161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXadCYGCeRlVv6nkNiMsdmZX+R6k6x5Uhyue3beQA8o=;
        b=g0PfLNdSiap9AWwZKASk63S0GapTYlMaiY+gdAnxxyAlIiZpWW50qmYM/2nNweA4Q2
         ZmB56tEbCg37rUZi6RrdTpN/5Fe2OwxaRHupF6v8IkQcoCi+KgzuIraSCQqdeLLSnVG5
         J9N2h9OavYe/3taNYaX1GDPrKC+jTanlP3S9kLJ1mxOOAktl/VyHlP4UYvzpt694Cbtg
         vGnbkBjQuL/kJQWLbtyXvH2DOEgMZMtgK5NSiy8RM5yDWOfSw5z48A8r9NSHgZZeMZpQ
         74aCVMgZYUWj0U4Pl8dp61gwrITgc4e0X+j2OuKO6r/2AnpOMn0LjiKSZxOmUc25gjxR
         pG7A==
X-Forwarded-Encrypted: i=1; AJvYcCVtsKMTpCoyX5LjmrcxD0/YSx++yM8sWuXxQt68kLVrzzU3UaHi0Qz3obgjzgFSJLJBoBUFtHG5LtS9UmGGFqaZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwjtM9z7Ms0/Ii8lh9aV6yalkBCKwJT2kYwPvu8Lh6/lzWTQYLt
	D3AY+V17OqTQWBkMFICDm1VgMT2QJNvG9/rxVBpomQAkxiRlpZcRcpOw5+UWEA==
X-Gm-Gg: ASbGnctB4rGnnHkvDHftLfFk8xFdY+8Y6DKtNFP8OLypFUvoAtzh2R798sbET+tL0M1
	1xNdroaYilHuEunyDuAYviQBi2qs2Xvdx3FDSctzoG1ap/7qT91ZDdwKj4sZvPIer0G2FORKoL1
	GrFSzrsUZd2gTy26gLR72YKhhjdgx0ItzGyKs2+VY3ex+STRan7syD1PVu1Ekl/chxown2E1xkI
	6S6sfx3BLEkThoUkYccrdRYRjUm0B16JDg1d2sLG6pkbUlt8CIg+7mAJrerGw/GH5SRlgo9BU6F
	DBZltSn/Ndp64K/3KbBwERcTM/gAWbN1LArPKARqeyj7jMRlnLo=
X-Google-Smtp-Source: AGHT+IFqJVd1PW6zecG8ZDDWpR43rW6vtOPO86uNtoBeruLtvy3ff/GqSaVM1Zfqx/r16KPYIPvU6A==
X-Received: by 2002:a17:902:e5d1:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22ac29b4ef4mr36036865ad.28.1744182360606;
        Wed, 09 Apr 2025 00:06:00 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c7d9sm4694125ad.96.2025.04.09.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:00 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:35:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in
 DTS example
Message-ID: <wbqxkg7zj3opjpyhlv4qptsicwowuwyiygmhhayufwznvehful@5nhx3dtpile2>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_000601_701814_93F7BD1C 
X-CRM114-Status: GOOD (  19.47  )
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

On Mon, Mar 24, 2025 at 01:52:01PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../bindings/pci/brcm,stb-pcie.yaml           |  81 +++++++------
>  .../bindings/pci/cdns,cdns-pcie-ep.yaml       |  16 +--
>  .../bindings/pci/intel,keembay-pcie-ep.yaml   |  26 ++--
>  .../bindings/pci/intel,keembay-pcie.yaml      |  38 +++---
>  .../bindings/pci/microchip,pcie-host.yaml     |  54 ++++-----
>  .../devicetree/bindings/pci/rcar-pci-ep.yaml  |  34 +++---
>  .../bindings/pci/rcar-pci-host.yaml           |  46 +++----
>  .../bindings/pci/xilinx-versal-cpm.yaml       | 112 +++++++++---------
>  8 files changed, 202 insertions(+), 205 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index 29f0e1eb5096..c4f9674e8695 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -186,49 +186,48 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      scb {
> -            #address-cells = <2>;
> -            #size-cells = <1>;
> -            pcie0: pcie@7d500000 {
> -                    compatible = "brcm,bcm2711-pcie";
> -                    reg = <0x0 0x7d500000 0x9310>;
> -                    device_type = "pci";
> -                    #address-cells = <3>;
> -                    #size-cells = <2>;
> -                    #interrupt-cells = <1>;
> -                    interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> -                                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> -                    interrupt-names = "pcie", "msi";
> -                    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> -                    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH
> -                                     0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH
> -                                     0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH
> -                                     0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        pcie0: pcie@7d500000 {
> +            compatible = "brcm,bcm2711-pcie";
> +            reg = <0x0 0x7d500000 0x9310>;
> +            device_type = "pci";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            #interrupt-cells = <1>;
> +            interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "pcie", "msi";
> +            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +            interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH
> +                             0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH
> +                             0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH
> +                             0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  
> -                    msi-parent = <&pcie0>;
> -                    msi-controller;
> -                    ranges = <0x02000000 0x0 0xf8000000 0x6 0x00000000 0x0 0x04000000>;
> -                    dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
> -                                 <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
> -                    brcm,enable-ssc;
> -                    brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
> +            msi-parent = <&pcie0>;
> +            msi-controller;
> +            ranges = <0x02000000 0x0 0xf8000000 0x6 0x00000000 0x0 0x04000000>;
> +            dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
> +                         <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
> +            brcm,enable-ssc;
> +            brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
>  
> -                    /* PCIe bridge, Root Port */
> -                    pci@0,0 {
> -                            #address-cells = <3>;
> -                            #size-cells = <2>;
> -                            reg = <0x0 0x0 0x0 0x0 0x0>;
> -                            compatible = "pciclass,0604";
> -                            device_type = "pci";
> -                            vpcie3v3-supply = <&vreg7>;
> -                            ranges;
> +            /* PCIe bridge, Root Port */
> +            pci@0,0 {
> +                #address-cells = <3>;
> +                #size-cells = <2>;
> +                reg = <0x0 0x0 0x0 0x0 0x0>;
> +                compatible = "pciclass,0604";
> +                device_type = "pci";
> +                vpcie3v3-supply = <&vreg7>;
> +                ranges;
>  
> -                            /* PCIe endpoint */
> -                            pci-ep@0,0 {
> -                                    assigned-addresses =
> -                                        <0x82010000 0x0 0xf8000000 0x6 0x00000000 0x0 0x2000>;
> -                                    reg = <0x0 0x0 0x0 0x0 0x0>;
> -                                    compatible = "pci14e4,1688";
> -                            };
> -                    };
> +                /* PCIe endpoint */
> +                pci-ep@0,0 {
> +                    assigned-addresses = <0x82010000 0x0 0xf8000000 0x6 0x00000000 0x0 0x2000>;
> +                    reg = <0x0 0x0 0x0 0x0 0x0>;
> +                    compatible = "pci14e4,1688";
> +                };
>              };
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> index 98651ab22103..8735293962ee 100644
> --- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> @@ -37,14 +37,14 @@ examples:
>          #size-cells = <2>;
>  
>          pcie-ep@fc000000 {
> -                compatible = "cdns,cdns-pcie-ep";
> -                reg = <0x0 0xfc000000 0x0 0x01000000>,
> -                      <0x0 0x80000000 0x0 0x40000000>;
> -                reg-names = "reg", "mem";
> -                cdns,max-outbound-regions = <16>;
> -                max-functions = /bits/ 8 <8>;
> -                phys = <&pcie_phy0>;
> -                phy-names = "pcie-phy";
> +            compatible = "cdns,cdns-pcie-ep";
> +            reg = <0x0 0xfc000000 0x0 0x01000000>,
> +                  <0x0 0x80000000 0x0 0x40000000>;
> +            reg-names = "reg", "mem";
> +            cdns,max-outbound-regions = <16>;
> +            max-functions = /bits/ 8 <8>;
> +            phys = <&pcie_phy0>;
> +            phy-names = "pcie-phy";
>          };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> index 730e63fd7669..b19f61ae72fb 100644
> --- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> @@ -53,17 +53,17 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>      pcie-ep@37000000 {
> -          compatible = "intel,keembay-pcie-ep";
> -          reg = <0x37000000 0x00001000>,
> -                <0x37100000 0x00001000>,
> -                <0x37300000 0x00001000>,
> -                <0x36000000 0x01000000>,
> -                <0x37800000 0x00000200>;
> -          reg-names = "dbi", "dbi2", "atu", "addr_space", "apb";
> -          interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
> -                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> -          interrupt-names = "pcie", "pcie_ev", "pcie_err", "pcie_mem_access";
> -          num-lanes = <2>;
> +        compatible = "intel,keembay-pcie-ep";
> +        reg = <0x37000000 0x00001000>,
> +              <0x37100000 0x00001000>,
> +              <0x37300000 0x00001000>,
> +              <0x36000000 0x01000000>,
> +              <0x37800000 0x00000200>;
> +        reg-names = "dbi", "dbi2", "atu", "addr_space", "apb";
> +        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "pcie", "pcie_ev", "pcie_err", "pcie_mem_access";
> +        num-lanes = <2>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> index 1fd557504b10..dd71e3d6bf94 100644
> --- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> @@ -75,23 +75,23 @@ examples:
>      #define KEEM_BAY_A53_PCIE
>      #define KEEM_BAY_A53_AUX_PCIE
>      pcie@37000000 {
> -          compatible = "intel,keembay-pcie";
> -          reg = <0x37000000 0x00001000>,
> -                <0x37300000 0x00001000>,
> -                <0x36e00000 0x00200000>,
> -                <0x37800000 0x00000200>;
> -          reg-names = "dbi", "atu", "config", "apb";
> -          #address-cells = <3>;
> -          #size-cells = <2>;
> -          device_type = "pci";
> -          ranges = <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
> -          interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> -          interrupt-names = "pcie", "pcie_ev", "pcie_err";
> -          clocks = <&scmi_clk KEEM_BAY_A53_PCIE>,
> -                   <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
> -          clock-names = "master", "aux";
> -          reset-gpios = <&pca2 9 GPIO_ACTIVE_LOW>;
> -          num-lanes = <2>;
> +        compatible = "intel,keembay-pcie";
> +        reg = <0x37000000 0x00001000>,
> +              <0x37300000 0x00001000>,
> +              <0x36e00000 0x00200000>,
> +              <0x37800000 0x00000200>;
> +        reg-names = "dbi", "atu", "config", "apb";
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +        ranges = <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
> +        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "pcie", "pcie_ev", "pcie_err";
> +        clocks = <&scmi_clk KEEM_BAY_A53_PCIE>,
> +                 <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
> +        clock-names = "master", "aux";
> +        reset-gpios = <&pca2 9 GPIO_ACTIVE_LOW>;
> +        num-lanes = <2>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index 103574d18dbc..1aadfdee868f 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -65,33 +65,33 @@ unevaluatedProperties: false
>  examples:
>    - |
>      soc {
> -            #address-cells = <2>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        pcie0: pcie@2030000000 {
> +            compatible = "microchip,pcie-host-1.0";
> +            reg = <0x0 0x70000000 0x0 0x08000000>,
> +                  <0x0 0x43008000 0x0 0x00002000>,
> +                  <0x0 0x4300a000 0x0 0x00002000>;
> +            reg-names = "cfg", "bridge", "ctrl";
> +            device_type = "pci";
> +            #address-cells = <3>;
>              #size-cells = <2>;
> -            pcie0: pcie@2030000000 {
> -                    compatible = "microchip,pcie-host-1.0";
> -                    reg = <0x0 0x70000000 0x0 0x08000000>,
> -                          <0x0 0x43008000 0x0 0x00002000>,
> -                          <0x0 0x4300a000 0x0 0x00002000>;
> -                    reg-names = "cfg", "bridge", "ctrl";
> -                    device_type = "pci";
> -                    #address-cells = <3>;
> -                    #size-cells = <2>;
> -                    #interrupt-cells = <1>;
> -                    interrupts = <119>;
> -                    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> -                    interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> -                                    <0 0 0 2 &pcie_intc0 1>,
> -                                    <0 0 0 3 &pcie_intc0 2>,
> -                                    <0 0 0 4 &pcie_intc0 3>;
> -                    interrupt-parent = <&plic0>;
> -                    msi-parent = <&pcie0>;
> -                    msi-controller;
> -                    bus-range = <0x00 0x7f>;
> -                    ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
> -                    pcie_intc0: interrupt-controller {
> -                        #address-cells = <0>;
> -                        #interrupt-cells = <1>;
> -                        interrupt-controller;
> -                    };
> +            #interrupt-cells = <1>;
> +            interrupts = <119>;
> +            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +            interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +                            <0 0 0 2 &pcie_intc0 1>,
> +                            <0 0 0 3 &pcie_intc0 2>,
> +                            <0 0 0 4 &pcie_intc0 3>;
> +            interrupt-parent = <&plic0>;
> +            msi-parent = <&pcie0>;
> +            msi-controller;
> +            bus-range = <0x00 0x7f>;
> +            ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
> +            pcie_intc0: interrupt-controller {
> +                #address-cells = <0>;
> +                #interrupt-cells = <1>;
> +                interrupt-controller;
>              };
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> index 32a3b7665ff5..6b91581c30ae 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> @@ -73,21 +73,21 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/r8a774c0-sysc.h>
>  
> -     pcie0_ep: pcie-ep@fe000000 {
> -            compatible = "renesas,r8a774c0-pcie-ep",
> -                         "renesas,rcar-gen3-pcie-ep";
> -            reg = <0xfe000000 0x80000>,
> -                  <0xfe100000 0x100000>,
> -                  <0xfe200000 0x200000>,
> -                  <0x30000000 0x8000000>,
> -                  <0x38000000 0x8000000>;
> -            reg-names = "apb-base", "memory0", "memory1", "memory2", "memory3";
> -            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> -            resets = <&cpg 319>;
> -            power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> -            clocks = <&cpg CPG_MOD 319>;
> -            clock-names = "pcie";
> -            max-functions = /bits/ 8 <1>;
> +    pcie0_ep: pcie-ep@fe000000 {
> +        compatible = "renesas,r8a774c0-pcie-ep",
> +                     "renesas,rcar-gen3-pcie-ep";
> +        reg = <0xfe000000 0x80000>,
> +              <0xfe100000 0x100000>,
> +              <0xfe200000 0x200000>,
> +              <0x30000000 0x8000000>,
> +              <0x38000000 0x8000000>;
> +        reg-names = "apb-base", "memory0", "memory1", "memory2", "memory3";
> +        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&cpg 319>;
> +        power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +        clocks = <&cpg CPG_MOD 319>;
> +        clock-names = "pcie";
> +        max-functions = /bits/ 8 <1>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
> index 666f013e3af8..7896576920aa 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
> @@ -113,27 +113,27 @@ examples:
>          pcie: pcie@fe000000 {
>              compatible = "renesas,pcie-r8a7791", "renesas,pcie-rcar-gen2";
>              reg = <0 0xfe000000 0 0x80000>;
> -             #address-cells = <3>;
> -             #size-cells = <2>;
> -             bus-range = <0x00 0xff>;
> -             device_type = "pci";
> -             ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
> -                      <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
> -                      <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
> -                      <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
> -             dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>,
> -                          <0x42000000 2 0x00000000 2 0x00000000 0 0x40000000>;
> -             interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -                          <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> -             #interrupt-cells = <1>;
> -             interrupt-map-mask = <0 0 0 0>;
> -             interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> -             clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
> -             clock-names = "pcie", "pcie_bus";
> -             power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> -             resets = <&cpg 319>;
> -             vpcie3v3-supply = <&pcie_3v3>;
> -             vpcie12v-supply = <&pcie_12v>;
> -         };
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            bus-range = <0x00 0xff>;
> +            device_type = "pci";
> +            ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000>,
> +                     <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>,
> +                     <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
> +                     <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
> +            dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>,
> +                         <0x42000000 2 0x00000000 2 0x00000000 0 0x40000000>;
> +            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +            #interrupt-cells = <1>;
> +            interrupt-map-mask = <0 0 0 0>;
> +            interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
> +            clock-names = "pcie", "pcie_bus";
> +            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +            resets = <&cpg 319>;
> +            vpcie3v3-supply = <&pcie_3v3>;
> +            vpcie12v-supply = <&pcie_12v>;
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> index d674a24c8ccc..9823456addea 100644
> --- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> +++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> @@ -76,64 +76,62 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -
>      versal {
> -               #address-cells = <2>;
> -               #size-cells = <2>;
> -               cpm_pcie: pcie@fca10000 {
> -                       compatible = "xlnx,versal-cpm-host-1.00";
> -                       device_type = "pci";
> -                       #address-cells = <3>;
> -                       #interrupt-cells = <1>;
> -                       #size-cells = <2>;
> -                       interrupts = <0 72 4>;
> -                       interrupt-parent = <&gic>;
> -                       interrupt-map-mask = <0 0 0 7>;
> -                       interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
> -                                       <0 0 0 2 &pcie_intc_0 1>,
> -                                       <0 0 0 3 &pcie_intc_0 2>,
> -                                       <0 0 0 4 &pcie_intc_0 3>;
> -                       bus-range = <0x00 0xff>;
> -                       ranges = <0x02000000 0x0 0xe0010000 0x0 0xe0010000 0x0 0x10000000>,
> -                                <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
> -                       msi-map = <0x0 &its_gic 0x0 0x10000>;
> -                       reg = <0x0 0xfca10000 0x0 0x1000>,
> -                             <0x6 0x00000000 0x0 0x10000000>;
> -                       reg-names = "cpm_slcr", "cfg";
> -                       pcie_intc_0: interrupt-controller {
> -                               #address-cells = <0>;
> -                               #interrupt-cells = <1>;
> -                               interrupt-controller;
> -                       };
> -               };
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        pcie@fca10000 {
> +            compatible = "xlnx,versal-cpm-host-1.00";
> +            device_type = "pci";
> +            #address-cells = <3>;
> +            #interrupt-cells = <1>;
> +            #size-cells = <2>;
> +            interrupts = <0 72 4>;
> +            interrupt-parent = <&gic>;
> +            interrupt-map-mask = <0 0 0 7>;
> +            interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
> +                            <0 0 0 2 &pcie_intc_0 1>,
> +                            <0 0 0 3 &pcie_intc_0 2>,
> +                            <0 0 0 4 &pcie_intc_0 3>;
> +            bus-range = <0x00 0xff>;
> +            ranges = <0x02000000 0x0 0xe0010000 0x0 0xe0010000 0x0 0x10000000>,
> +                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
> +            msi-map = <0x0 &its_gic 0x0 0x10000>;
> +            reg = <0x0 0xfca10000 0x0 0x1000>,
> +                  <0x6 0x00000000 0x0 0x10000000>;
> +            reg-names = "cpm_slcr", "cfg";
> +            pcie_intc_0: interrupt-controller {
> +                    #address-cells = <0>;
> +                    #interrupt-cells = <1>;
> +                    interrupt-controller;
> +            };
> +        };
>  
> -               cpm5_pcie: pcie@fcdd0000 {
> -                       compatible = "xlnx,versal-cpm5-host";
> -                       device_type = "pci";
> -                       #address-cells = <3>;
> -                       #interrupt-cells = <1>;
> -                       #size-cells = <2>;
> -                       interrupts = <0 72 4>;
> -                       interrupt-parent = <&gic>;
> -                       interrupt-map-mask = <0 0 0 7>;
> -                       interrupt-map = <0 0 0 1 &pcie_intc_1 0>,
> -                                       <0 0 0 2 &pcie_intc_1 1>,
> -                                       <0 0 0 3 &pcie_intc_1 2>,
> -                                       <0 0 0 4 &pcie_intc_1 3>;
> -                       bus-range = <0x00 0xff>;
> -                       ranges = <0x02000000 0x0 0xe0000000 0x0 0xe0000000 0x0 0x10000000>,
> -                                <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
> -                       msi-map = <0x0 &its_gic 0x0 0x10000>;
> -                       reg = <0x00 0xfcdd0000 0x00 0x1000>,
> -                             <0x06 0x00000000 0x00 0x1000000>,
> -                             <0x00 0xfce20000 0x00 0x1000000>;
> -                       reg-names = "cpm_slcr", "cfg", "cpm_csr";
> -
> -                       pcie_intc_1: interrupt-controller {
> -                               #address-cells = <0>;
> -                               #interrupt-cells = <1>;
> -                               interrupt-controller;
> -                       };
> -               };
> +        pcie@fcdd0000 {
> +            compatible = "xlnx,versal-cpm5-host";
> +            device_type = "pci";
> +            #address-cells = <3>;
> +            #interrupt-cells = <1>;
> +            #size-cells = <2>;
> +            interrupts = <0 72 4>;
> +            interrupt-parent = <&gic>;
> +            interrupt-map-mask = <0 0 0 7>;
> +            interrupt-map = <0 0 0 1 &pcie_intc_1 0>,
> +                            <0 0 0 2 &pcie_intc_1 1>,
> +                            <0 0 0 3 &pcie_intc_1 2>,
> +                            <0 0 0 4 &pcie_intc_1 3>;
> +            bus-range = <0x00 0xff>;
> +            ranges = <0x02000000 0x0 0xe0000000 0x0 0xe0000000 0x0 0x10000000>,
> +                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x80000000>;
> +            msi-map = <0x0 &its_gic 0x0 0x10000>;
> +            reg = <0x00 0xfcdd0000 0x00 0x1000>,
> +                  <0x06 0x00000000 0x00 0x1000000>,
> +                  <0x00 0xfce20000 0x00 0x1000000>;
> +            reg-names = "cpm_slcr", "cfg", "cpm_csr";
>  
> +            pcie_intc_1: interrupt-controller {
> +                #address-cells = <0>;
> +                #interrupt-cells = <1>;
> +                interrupt-controller;
> +            };
> +        };
>      };
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

