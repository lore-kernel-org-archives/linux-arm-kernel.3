Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D6BC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMlj09fIVZ5bCrwvTPqT+F9Hrb/dd4nPMhY8DVc7qtg=; b=bAHrKf97XeX6JpaciOukx4zH+g
	ypIncJz8TOOtYMGyuBSmRkcTbILQ10teOpK0uftA/sV4pOzhldOtf5T++rGbT+n1PRYrS9+74V4jy
	YVmRLmOXvtaBiQLzSpww4FCaUXrNUgf51pxxQRiguWvs/7E069p8N49O5oaxZa0qZXCgQ6u9cQL8p
	IwdlGa0Bq3PptkyTgQ4JmmNS0/GhkRgyCRspLWEE/brtSBsy8ZfUyuT1zfJI0wS+9z0M5OOWHZzev
	ociezpet7+lPE+mvIgk6Hf/FqOimYoD0N6X4Xj27GqFEiMbyOrzyUUpU+b9fk02p2y4KdnxU/H4VY
	TEmQ/UDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7X2-00000006XlR-2FCs;
	Tue, 25 Mar 2025 16:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Ry-00000006DyR-26s8;
	Tue, 25 Mar 2025 14:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DMlj09fIVZ5bCrwvTPqT+F9Hrb/dd4nPMhY8DVc7qtg=; b=B66ZwTvNv9IbapeTry0fyfOZpm
	ISuQ+K1QEf3XSIexMqUqKk52iTYzTL1T01UzPHdOfcbrPdKD2a21aonMvmV+IKtJyhLxx8I2cqGDK
	h0iWdMZygnWuPeHNmGXAeOepoAXdZeKsAbhYiwr7SrF04bJxWLwuZeIEcCsuE/O7wmb9bP3nahnXC
	bZcILadmr8GXy68ltT4IIhVjKiCy9u1H3vWJrhIANowtEwFs46y0s5H+3aFL1ystCNOXqZPlLxJug
	CK4lHEWJryAfk7gA+TIVO4qziSlyLZnIB16MwBgXdjwVhKy0CcefWimlxh5YXVzni7lcqxxlIW0IQ
	gx7pSk6g==;
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5Rv-00000005W6K-0lqv;
	Tue, 25 Mar 2025 14:40:17 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso6574759e0c.1;
        Tue, 25 Mar 2025 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742913612; x=1743518412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMlj09fIVZ5bCrwvTPqT+F9Hrb/dd4nPMhY8DVc7qtg=;
        b=lRPBUmYLh/mipSvxPasrwRZ3cIPESYKCxtoDSN+/lvr6i/Oar2D3QINpNzbrWam7gF
         BVV404yi5WeJtRgF9vlALo7m9xZpRgIvqHPCVbbSjZyTERjGu7ZfyLFfmkcPFje35GuR
         rsHiPxXKulX4Ur3NABQUFNc3MA4bghlmhSdnU/kFfWKjkj42kIXnw/yNXYgsgxKeJi28
         oR8rxUU1FP7+AdX5U+V7UKlwNDix2tY2zgQtzXMSFKQl1EybJdGLaT2RBMk6c1syrkm3
         8FaMzGu6wvYvExwhrYsaPaARm05jEYJZ1pPYOvFHMO5sRp/ptcHH+AJhUSJ75Ev5gIdZ
         gcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913612; x=1743518412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMlj09fIVZ5bCrwvTPqT+F9Hrb/dd4nPMhY8DVc7qtg=;
        b=Oi/3Tre2MCkFYmcRXH5RcfO8zX4R8Cbw3MPT4IuOgtnQuYOmrZ6r19/sUsK9kdqhC/
         qM/5DUxFhP07G/kdgBsCzYQ73kuUiYyS4Uut/N0GjCtSWnWtQZMos9lJ9F1j3sDJFcq1
         wJsA77ib1xz6BOWbFtZK7Mijtlu6t0ClJsgBncbw6GZEY35pR8r0wdywQccC2V0HBjz2
         hS9Lkxxte/rKT7rHdJjYH70G1wZP98da+/nqrVQTx/BIJoupfKLmfBDZ7JYcHfsWes/G
         6HxI9vO3Cd/nwAs6zt1VrtWlTK2iq3gO0DdGA0UBkELAqvL7PJOj1/LjbM7Mm7YG0IQG
         usCw==
X-Forwarded-Encrypted: i=1; AJvYcCVt/AIZLPhYPHEgnQPkgdMWweVIyHkE8XUJM1UCJU1A0W351lCIrlgwGVdST1d3hfViDCS9f1Zqp9fbxB1WuAaR2A==@lists.infradead.org, AJvYcCW+Byu5PUcedFZLHrWBz3pfSgw5YR7cJfVfwz+rrUukZGwbCFmYw+0cP8WWzJBKg2N8xobksZtmLfEiF8s=@lists.infradead.org, AJvYcCWi6gbBLNnXEoo7gpgVzdGO92ydWDMHwMc7ffJk+FJ4Q1op05V4lnRA3JTK3rShCGo1Fx8MDqXnaDPMCkEbEF9f@lists.infradead.org
X-Gm-Message-State: AOJu0YxPoPAARSdINsY5ZAS2FUhueRJK1JvYco+1L9m1mpAav6l6PNYp
	kHbsjRiHHQVgnK3q5/Sw7jd4K6Raclo/5z4C34uw8eExkTeIeR8gTFWscxK85BTYeCpyJmMEwZH
	dSoQZs7pB2QERqsVsLhWD6t234gY=
X-Gm-Gg: ASbGncsFdW9KYoryc/O4kBi1PY2GzwMtCe7YPnQcdjGgNMYKcN7hrks0klkpUf6P7IX
	yRV+mbu2j9pBZWHA1++kqtHYJWaUw6UJ81NugqRV2gAuKRo/vhDX1uFcnsXQp8il1STSOYFMJ2L
	yAW1CSHC34x51dNlZcKNKRQ6TSdQ==
X-Google-Smtp-Source: AGHT+IGtwzkZ6ndWeM7la3PLnGL2uhrN/BNIR5yKopiVMtLaMCqdTr8BUKoLVfhndxRhV3Ofxdu7djWJP68ffLQA5CU=
X-Received: by 2002:a05:6122:6081:b0:523:a88b:9ac5 with SMTP id
 71dfb90a1353d-525a854d25fmr12581425e0c.9.1742913612013; Tue, 25 Mar 2025
 07:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Mar 2025 14:39:45 +0000
X-Gm-Features: AQ5f1JrcGB56TwWUUuwN0Pzhrxh-tYqsQxZxsCDWKDV-H_PJkl_jSCFm7UnC0pw
Message-ID: <CA+V-a8thYZhYS_5FUQxbTmr7O+G4UZMhRQzRUwBr9V9GD7nyWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_144015_348660_E412AAEC 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, Mar 24, 2025 at 12:53=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pci/brcm,stb-pcie.yaml           |  81 +++++++------
>  .../bindings/pci/cdns,cdns-pcie-ep.yaml       |  16 +--
>  .../bindings/pci/intel,keembay-pcie-ep.yaml   |  26 ++--
>  .../bindings/pci/intel,keembay-pcie.yaml      |  38 +++---
>  .../bindings/pci/microchip,pcie-host.yaml     |  54 ++++-----
>  .../devicetree/bindings/pci/rcar-pci-ep.yaml  |  34 +++---
For rcar-pci-ep.yaml,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  .../bindings/pci/rcar-pci-host.yaml           |  46 +++----
>  .../bindings/pci/xilinx-versal-cpm.yaml       | 112 +++++++++---------
>  8 files changed, 202 insertions(+), 205 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/D=
ocumentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index 29f0e1eb5096..c4f9674e8695 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -186,49 +186,48 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>
>      scb {
> -            #address-cells =3D <2>;
> -            #size-cells =3D <1>;
> -            pcie0: pcie@7d500000 {
> -                    compatible =3D "brcm,bcm2711-pcie";
> -                    reg =3D <0x0 0x7d500000 0x9310>;
> -                    device_type =3D "pci";
> -                    #address-cells =3D <3>;
> -                    #size-cells =3D <2>;
> -                    #interrupt-cells =3D <1>;
> -                    interrupts =3D <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> -                                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> -                    interrupt-names =3D "pcie", "msi";
> -                    interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> -                    interrupt-map =3D <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TY=
PE_LEVEL_HIGH
> -                                     0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE=
_LEVEL_HIGH
> -                                     0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE=
_LEVEL_HIGH
> -                                     0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE=
_LEVEL_HIGH>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +        pcie0: pcie@7d500000 {
> +            compatible =3D "brcm,bcm2711-pcie";
> +            reg =3D <0x0 0x7d500000 0x9310>;
> +            device_type =3D "pci";
> +            #address-cells =3D <3>;
> +            #size-cells =3D <2>;
> +            #interrupt-cells =3D <1>;
> +            interrupts =3D <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "pcie", "msi";
> +            interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> +            interrupt-map =3D <0 0 0 1 &gicv2 GIC_SPI 143 IRQ_TYPE_LEVEL=
_HIGH
> +                             0 0 0 2 &gicv2 GIC_SPI 144 IRQ_TYPE_LEVEL_H=
IGH
> +                             0 0 0 3 &gicv2 GIC_SPI 145 IRQ_TYPE_LEVEL_H=
IGH
> +                             0 0 0 4 &gicv2 GIC_SPI 146 IRQ_TYPE_LEVEL_H=
IGH>;
>
> -                    msi-parent =3D <&pcie0>;
> -                    msi-controller;
> -                    ranges =3D <0x02000000 0x0 0xf8000000 0x6 0x00000000=
 0x0 0x04000000>;
> -                    dma-ranges =3D <0x42000000 0x1 0x00000000 0x0 0x4000=
0000 0x0 0x80000000>,
> -                                 <0x42000000 0x1 0x80000000 0x3 0x000000=
00 0x0 0x80000000>;
> -                    brcm,enable-ssc;
> -                    brcm,scb-sizes =3D  <0x0000000080000000 0x0000000080=
000000>;
> +            msi-parent =3D <&pcie0>;
> +            msi-controller;
> +            ranges =3D <0x02000000 0x0 0xf8000000 0x6 0x00000000 0x0 0x0=
4000000>;
> +            dma-ranges =3D <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0=
 0x80000000>,
> +                         <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0=
x80000000>;
> +            brcm,enable-ssc;
> +            brcm,scb-sizes =3D  <0x0000000080000000 0x0000000080000000>;
>
> -                    /* PCIe bridge, Root Port */
> -                    pci@0,0 {
> -                            #address-cells =3D <3>;
> -                            #size-cells =3D <2>;
> -                            reg =3D <0x0 0x0 0x0 0x0 0x0>;
> -                            compatible =3D "pciclass,0604";
> -                            device_type =3D "pci";
> -                            vpcie3v3-supply =3D <&vreg7>;
> -                            ranges;
> +            /* PCIe bridge, Root Port */
> +            pci@0,0 {
> +                #address-cells =3D <3>;
> +                #size-cells =3D <2>;
> +                reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +                compatible =3D "pciclass,0604";
> +                device_type =3D "pci";
> +                vpcie3v3-supply =3D <&vreg7>;
> +                ranges;
>
> -                            /* PCIe endpoint */
> -                            pci-ep@0,0 {
> -                                    assigned-addresses =3D
> -                                        <0x82010000 0x0 0xf8000000 0x6 0=
x00000000 0x0 0x2000>;
> -                                    reg =3D <0x0 0x0 0x0 0x0 0x0>;
> -                                    compatible =3D "pci14e4,1688";
> -                            };
> -                    };
> +                /* PCIe endpoint */
> +                pci-ep@0,0 {
> +                    assigned-addresses =3D <0x82010000 0x0 0xf8000000 0x=
6 0x00000000 0x0 0x2000>;
> +                    reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +                    compatible =3D "pci14e4,1688";
> +                };
>              };
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml=
 b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> index 98651ab22103..8735293962ee 100644
> --- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
> @@ -37,14 +37,14 @@ examples:
>          #size-cells =3D <2>;
>
>          pcie-ep@fc000000 {
> -                compatible =3D "cdns,cdns-pcie-ep";
> -                reg =3D <0x0 0xfc000000 0x0 0x01000000>,
> -                      <0x0 0x80000000 0x0 0x40000000>;
> -                reg-names =3D "reg", "mem";
> -                cdns,max-outbound-regions =3D <16>;
> -                max-functions =3D /bits/ 8 <8>;
> -                phys =3D <&pcie_phy0>;
> -                phy-names =3D "pcie-phy";
> +            compatible =3D "cdns,cdns-pcie-ep";
> +            reg =3D <0x0 0xfc000000 0x0 0x01000000>,
> +                  <0x0 0x80000000 0x0 0x40000000>;
> +            reg-names =3D "reg", "mem";
> +            cdns,max-outbound-regions =3D <16>;
> +            max-functions =3D /bits/ 8 <8>;
> +            phys =3D <&pcie_phy0>;
> +            phy-names =3D "pcie-phy";
>          };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.=
yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> index 730e63fd7669..b19f61ae72fb 100644
> --- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie-ep.yaml
> @@ -53,17 +53,17 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>      pcie-ep@37000000 {
> -          compatible =3D "intel,keembay-pcie-ep";
> -          reg =3D <0x37000000 0x00001000>,
> -                <0x37100000 0x00001000>,
> -                <0x37300000 0x00001000>,
> -                <0x36000000 0x01000000>,
> -                <0x37800000 0x00000200>;
> -          reg-names =3D "dbi", "dbi2", "atu", "addr_space", "apb";
> -          interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
> -                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> -          interrupt-names =3D "pcie", "pcie_ev", "pcie_err", "pcie_mem_a=
ccess";
> -          num-lanes =3D <2>;
> +        compatible =3D "intel,keembay-pcie-ep";
> +        reg =3D <0x37000000 0x00001000>,
> +              <0x37100000 0x00001000>,
> +              <0x37300000 0x00001000>,
> +              <0x36000000 0x01000000>,
> +              <0x37800000 0x00000200>;
> +        reg-names =3D "dbi", "dbi2", "atu", "addr_space", "apb";
> +        interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 108 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "pcie", "pcie_ev", "pcie_err", "pcie_mem_acc=
ess";
> +        num-lanes =3D <2>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yam=
l b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> index 1fd557504b10..dd71e3d6bf94 100644
> --- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
> @@ -75,23 +75,23 @@ examples:
>      #define KEEM_BAY_A53_PCIE
>      #define KEEM_BAY_A53_AUX_PCIE
>      pcie@37000000 {
> -          compatible =3D "intel,keembay-pcie";
> -          reg =3D <0x37000000 0x00001000>,
> -                <0x37300000 0x00001000>,
> -                <0x36e00000 0x00200000>,
> -                <0x37800000 0x00000200>;
> -          reg-names =3D "dbi", "atu", "config", "apb";
> -          #address-cells =3D <3>;
> -          #size-cells =3D <2>;
> -          device_type =3D "pci";
> -          ranges =3D <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
> -          interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> -                       <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> -          interrupt-names =3D "pcie", "pcie_ev", "pcie_err";
> -          clocks =3D <&scmi_clk KEEM_BAY_A53_PCIE>,
> -                   <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
> -          clock-names =3D "master", "aux";
> -          reset-gpios =3D <&pca2 9 GPIO_ACTIVE_LOW>;
> -          num-lanes =3D <2>;
> +        compatible =3D "intel,keembay-pcie";
> +        reg =3D <0x37000000 0x00001000>,
> +              <0x37300000 0x00001000>,
> +              <0x36e00000 0x00200000>,
> +              <0x37800000 0x00000200>;
> +        reg-names =3D "dbi", "atu", "config", "apb";
> +        #address-cells =3D <3>;
> +        #size-cells =3D <2>;
> +        device_type =3D "pci";
> +        ranges =3D <0x02000000 0 0x36000000 0x36000000 0 0x00e00000>;
> +        interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "pcie", "pcie_ev", "pcie_err";
> +        clocks =3D <&scmi_clk KEEM_BAY_A53_PCIE>,
> +                 <&scmi_clk KEEM_BAY_A53_AUX_PCIE>;
> +        clock-names =3D "master", "aux";
> +        reset-gpios =3D <&pca2 9 GPIO_ACTIVE_LOW>;
> +        num-lanes =3D <2>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.ya=
ml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index 103574d18dbc..1aadfdee868f 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -65,33 +65,33 @@ unevaluatedProperties: false
>  examples:
>    - |
>      soc {
> -            #address-cells =3D <2>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        pcie0: pcie@2030000000 {
> +            compatible =3D "microchip,pcie-host-1.0";
> +            reg =3D <0x0 0x70000000 0x0 0x08000000>,
> +                  <0x0 0x43008000 0x0 0x00002000>,
> +                  <0x0 0x4300a000 0x0 0x00002000>;
> +            reg-names =3D "cfg", "bridge", "ctrl";
> +            device_type =3D "pci";
> +            #address-cells =3D <3>;
>              #size-cells =3D <2>;
> -            pcie0: pcie@2030000000 {
> -                    compatible =3D "microchip,pcie-host-1.0";
> -                    reg =3D <0x0 0x70000000 0x0 0x08000000>,
> -                          <0x0 0x43008000 0x0 0x00002000>,
> -                          <0x0 0x4300a000 0x0 0x00002000>;
> -                    reg-names =3D "cfg", "bridge", "ctrl";
> -                    device_type =3D "pci";
> -                    #address-cells =3D <3>;
> -                    #size-cells =3D <2>;
> -                    #interrupt-cells =3D <1>;
> -                    interrupts =3D <119>;
> -                    interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> -                    interrupt-map =3D <0 0 0 1 &pcie_intc0 0>,
> -                                    <0 0 0 2 &pcie_intc0 1>,
> -                                    <0 0 0 3 &pcie_intc0 2>,
> -                                    <0 0 0 4 &pcie_intc0 3>;
> -                    interrupt-parent =3D <&plic0>;
> -                    msi-parent =3D <&pcie0>;
> -                    msi-controller;
> -                    bus-range =3D <0x00 0x7f>;
> -                    ranges =3D <0x03000000 0x0 0x78000000 0x0 0x78000000=
 0x0 0x04000000>;
> -                    pcie_intc0: interrupt-controller {
> -                        #address-cells =3D <0>;
> -                        #interrupt-cells =3D <1>;
> -                        interrupt-controller;
> -                    };
> +            #interrupt-cells =3D <1>;
> +            interrupts =3D <119>;
> +            interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
> +            interrupt-map =3D <0 0 0 1 &pcie_intc0 0>,
> +                            <0 0 0 2 &pcie_intc0 1>,
> +                            <0 0 0 3 &pcie_intc0 2>,
> +                            <0 0 0 4 &pcie_intc0 3>;
> +            interrupt-parent =3D <&plic0>;
> +            msi-parent =3D <&pcie0>;
> +            msi-controller;
> +            bus-range =3D <0x00 0x7f>;
> +            ranges =3D <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x0=
4000000>;
> +            pcie_intc0: interrupt-controller {
> +                #address-cells =3D <0>;
> +                #interrupt-cells =3D <1>;
> +                interrupt-controller;
>              };
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml b/Doc=
umentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> index 32a3b7665ff5..6b91581c30ae 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
> @@ -73,21 +73,21 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/r8a774c0-sysc.h>
>
> -     pcie0_ep: pcie-ep@fe000000 {
> -            compatible =3D "renesas,r8a774c0-pcie-ep",
> -                         "renesas,rcar-gen3-pcie-ep";
> -            reg =3D <0xfe000000 0x80000>,
> -                  <0xfe100000 0x100000>,
> -                  <0xfe200000 0x200000>,
> -                  <0x30000000 0x8000000>,
> -                  <0x38000000 0x8000000>;
> -            reg-names =3D "apb-base", "memory0", "memory1", "memory2", "=
memory3";
> -            interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> -            resets =3D <&cpg 319>;
> -            power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> -            clocks =3D <&cpg CPG_MOD 319>;
> -            clock-names =3D "pcie";
> -            max-functions =3D /bits/ 8 <1>;
> +    pcie0_ep: pcie-ep@fe000000 {
> +        compatible =3D "renesas,r8a774c0-pcie-ep",
> +                     "renesas,rcar-gen3-pcie-ep";
> +        reg =3D <0xfe000000 0x80000>,
> +              <0xfe100000 0x100000>,
> +              <0xfe200000 0x200000>,
> +              <0x30000000 0x8000000>,
> +              <0x38000000 0x8000000>;
> +        reg-names =3D "apb-base", "memory0", "memory1", "memory2", "memo=
ry3";
> +        interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +        resets =3D <&cpg 319>;
> +        power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> +        clocks =3D <&cpg CPG_MOD 319>;
> +        clock-names =3D "pcie";
> +        max-functions =3D /bits/ 8 <1>;
>      };
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml b/D=
ocumentation/devicetree/bindings/pci/rcar-pci-host.yaml
> index 666f013e3af8..7896576920aa 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
> @@ -113,27 +113,27 @@ examples:
>          pcie: pcie@fe000000 {
>              compatible =3D "renesas,pcie-r8a7791", "renesas,pcie-rcar-ge=
n2";
>              reg =3D <0 0xfe000000 0 0x80000>;
> -             #address-cells =3D <3>;
> -             #size-cells =3D <2>;
> -             bus-range =3D <0x00 0xff>;
> -             device_type =3D "pci";
> -             ranges =3D <0x01000000 0 0x00000000 0 0xfe100000 0 0x001000=
00>,
> -                      <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000=
>,
> -                      <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000=
>,
> -                      <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000=
>;
> -             dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 0 0x40=
000000>,
> -                          <0x42000000 2 0x00000000 2 0x00000000 0 0x4000=
0000>;
> -             interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -                          <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> -             #interrupt-cells =3D <1>;
> -             interrupt-map-mask =3D <0 0 0 0>;
> -             interrupt-map =3D <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_=
HIGH>;
> -             clocks =3D <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
> -             clock-names =3D "pcie", "pcie_bus";
> -             power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
> -             resets =3D <&cpg 319>;
> -             vpcie3v3-supply =3D <&pcie_3v3>;
> -             vpcie12v-supply =3D <&pcie_12v>;
> -         };
> +            #address-cells =3D <3>;
> +            #size-cells =3D <2>;
> +            bus-range =3D <0x00 0xff>;
> +            device_type =3D "pci";
> +            ranges =3D <0x01000000 0 0x00000000 0 0xfe100000 0 0x0010000=
0>,
> +                     <0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000>=
,
> +                     <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>=
,
> +                     <0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>=
;
> +            dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 0 0x400=
00000>,
> +                         <0x42000000 2 0x00000000 2 0x00000000 0 0x40000=
000>;
> +            interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +            #interrupt-cells =3D <1>;
> +            interrupt-map-mask =3D <0 0 0 0>;
> +            interrupt-map =3D <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_H=
IGH>;
> +            clocks =3D <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
> +            clock-names =3D "pcie", "pcie_bus";
> +            power-domains =3D <&sysc R8A7791_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 319>;
> +            vpcie3v3-supply =3D <&pcie_3v3>;
> +            vpcie12v-supply =3D <&pcie_12v>;
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml=
 b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> index d674a24c8ccc..9823456addea 100644
> --- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> +++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
> @@ -76,64 +76,62 @@ unevaluatedProperties: false
>
>  examples:
>    - |
> -
>      versal {
> -               #address-cells =3D <2>;
> -               #size-cells =3D <2>;
> -               cpm_pcie: pcie@fca10000 {
> -                       compatible =3D "xlnx,versal-cpm-host-1.00";
> -                       device_type =3D "pci";
> -                       #address-cells =3D <3>;
> -                       #interrupt-cells =3D <1>;
> -                       #size-cells =3D <2>;
> -                       interrupts =3D <0 72 4>;
> -                       interrupt-parent =3D <&gic>;
> -                       interrupt-map-mask =3D <0 0 0 7>;
> -                       interrupt-map =3D <0 0 0 1 &pcie_intc_0 0>,
> -                                       <0 0 0 2 &pcie_intc_0 1>,
> -                                       <0 0 0 3 &pcie_intc_0 2>,
> -                                       <0 0 0 4 &pcie_intc_0 3>;
> -                       bus-range =3D <0x00 0xff>;
> -                       ranges =3D <0x02000000 0x0 0xe0010000 0x0 0xe0010=
000 0x0 0x10000000>,
> -                                <0x43000000 0x80 0x00000000 0x80 0x00000=
000 0x0 0x80000000>;
> -                       msi-map =3D <0x0 &its_gic 0x0 0x10000>;
> -                       reg =3D <0x0 0xfca10000 0x0 0x1000>,
> -                             <0x6 0x00000000 0x0 0x10000000>;
> -                       reg-names =3D "cpm_slcr", "cfg";
> -                       pcie_intc_0: interrupt-controller {
> -                               #address-cells =3D <0>;
> -                               #interrupt-cells =3D <1>;
> -                               interrupt-controller;
> -                       };
> -               };
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        pcie@fca10000 {
> +            compatible =3D "xlnx,versal-cpm-host-1.00";
> +            device_type =3D "pci";
> +            #address-cells =3D <3>;
> +            #interrupt-cells =3D <1>;
> +            #size-cells =3D <2>;
> +            interrupts =3D <0 72 4>;
> +            interrupt-parent =3D <&gic>;
> +            interrupt-map-mask =3D <0 0 0 7>;
> +            interrupt-map =3D <0 0 0 1 &pcie_intc_0 0>,
> +                            <0 0 0 2 &pcie_intc_0 1>,
> +                            <0 0 0 3 &pcie_intc_0 2>,
> +                            <0 0 0 4 &pcie_intc_0 3>;
> +            bus-range =3D <0x00 0xff>;
> +            ranges =3D <0x02000000 0x0 0xe0010000 0x0 0xe0010000 0x0 0x1=
0000000>,
> +                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x8=
0000000>;
> +            msi-map =3D <0x0 &its_gic 0x0 0x10000>;
> +            reg =3D <0x0 0xfca10000 0x0 0x1000>,
> +                  <0x6 0x00000000 0x0 0x10000000>;
> +            reg-names =3D "cpm_slcr", "cfg";
> +            pcie_intc_0: interrupt-controller {
> +                    #address-cells =3D <0>;
> +                    #interrupt-cells =3D <1>;
> +                    interrupt-controller;
> +            };
> +        };
>
> -               cpm5_pcie: pcie@fcdd0000 {
> -                       compatible =3D "xlnx,versal-cpm5-host";
> -                       device_type =3D "pci";
> -                       #address-cells =3D <3>;
> -                       #interrupt-cells =3D <1>;
> -                       #size-cells =3D <2>;
> -                       interrupts =3D <0 72 4>;
> -                       interrupt-parent =3D <&gic>;
> -                       interrupt-map-mask =3D <0 0 0 7>;
> -                       interrupt-map =3D <0 0 0 1 &pcie_intc_1 0>,
> -                                       <0 0 0 2 &pcie_intc_1 1>,
> -                                       <0 0 0 3 &pcie_intc_1 2>,
> -                                       <0 0 0 4 &pcie_intc_1 3>;
> -                       bus-range =3D <0x00 0xff>;
> -                       ranges =3D <0x02000000 0x0 0xe0000000 0x0 0xe0000=
000 0x0 0x10000000>,
> -                                <0x43000000 0x80 0x00000000 0x80 0x00000=
000 0x0 0x80000000>;
> -                       msi-map =3D <0x0 &its_gic 0x0 0x10000>;
> -                       reg =3D <0x00 0xfcdd0000 0x00 0x1000>,
> -                             <0x06 0x00000000 0x00 0x1000000>,
> -                             <0x00 0xfce20000 0x00 0x1000000>;
> -                       reg-names =3D "cpm_slcr", "cfg", "cpm_csr";
> -
> -                       pcie_intc_1: interrupt-controller {
> -                               #address-cells =3D <0>;
> -                               #interrupt-cells =3D <1>;
> -                               interrupt-controller;
> -                       };
> -               };
> +        pcie@fcdd0000 {
> +            compatible =3D "xlnx,versal-cpm5-host";
> +            device_type =3D "pci";
> +            #address-cells =3D <3>;
> +            #interrupt-cells =3D <1>;
> +            #size-cells =3D <2>;
> +            interrupts =3D <0 72 4>;
> +            interrupt-parent =3D <&gic>;
> +            interrupt-map-mask =3D <0 0 0 7>;
> +            interrupt-map =3D <0 0 0 1 &pcie_intc_1 0>,
> +                            <0 0 0 2 &pcie_intc_1 1>,
> +                            <0 0 0 3 &pcie_intc_1 2>,
> +                            <0 0 0 4 &pcie_intc_1 3>;
> +            bus-range =3D <0x00 0xff>;
> +            ranges =3D <0x02000000 0x0 0xe0000000 0x0 0xe0000000 0x0 0x1=
0000000>,
> +                     <0x43000000 0x80 0x00000000 0x80 0x00000000 0x0 0x8=
0000000>;
> +            msi-map =3D <0x0 &its_gic 0x0 0x10000>;
> +            reg =3D <0x00 0xfcdd0000 0x00 0x1000>,
> +                  <0x06 0x00000000 0x00 0x1000000>,
> +                  <0x00 0xfce20000 0x00 0x1000000>;
> +            reg-names =3D "cpm_slcr", "cfg", "cpm_csr";
>
> +            pcie_intc_1: interrupt-controller {
> +                #address-cells =3D <0>;
> +                #interrupt-cells =3D <1>;
> +                interrupt-controller;
> +            };
> +        };
>      };
> --
> 2.43.0
>
>

