Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38026E64A93
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM0b+TuYNA5dZ5GF7J4Mkq+u9rwoaZ/qL/ReFdXCGzk=; b=lu5D/QXy7p/ZcQtAc2OjvzXnj1
	Rsh43Y7q1TJ3etBd1jfANPd9LjKOQQ0YJ2HYF0PXAsqwRAnbWBysgbz437D9+D6F2y7qgxkAvqGL7
	DXWQX+RAh4Ja7TAMpfZRz8inimT5Z44y5MY2/yZ7ZvqkB1B+tLJtIkxatXgGDilCbNmlV8/b1vivE
	9T5gw6y1XjIM0Cd7d70TOm/4//Tq1as5oT/gpF2n5TRlK0o7GI7O4mrpktaZj7yta6K6tjq1E1CKB
	gfa1Q2tkrBc0hTPA0UTe9LuJMsHR89hDwz6LgTPRFtuWfMJhk/hcZ3eMJnFTF0DaPUCFk8k5+e68A
	qJz86aUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT45-00000009d29-0bMP;
	Tue, 03 Dec 2024 13:35:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT35-00000009csm-0jiS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:34:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-724f74d6457so5433857b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733232882; x=1733837682; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VM0b+TuYNA5dZ5GF7J4Mkq+u9rwoaZ/qL/ReFdXCGzk=;
        b=OoGX5zjn1OqpezvjMoC31NYXiNqT3XRNxOTkRMDWj72XrLJ128JPmZ8RexBXOWnnjz
         p7OR5PT8Pjt1qUxKCLbtBEFvFli5hTPSw17a2kHGK+s4PSL65zNSEQRE11F5fqRLXDBO
         yDs+q/iNhVuCU8FtVXWAd/ZcQWm2qk1g6repXFCawNxhpHSnEXctEhaleS/hrF6UUwjS
         eMGckKTQOt96A3Sx0HaAy5Une4WRiYEqJqNd3+eymwQ52LqRqzXrQsKDcSOsEdDb6/ti
         H5plZxEUVWrDcQorPN7ukkqaXTfF7ylRf9RZ+coyhAAsyOZ9DwFITWo9JBAKtwT+o+j6
         WBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733232882; x=1733837682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VM0b+TuYNA5dZ5GF7J4Mkq+u9rwoaZ/qL/ReFdXCGzk=;
        b=QxDOqmX5EJzM89F6L3ufaTJmRC4FiqiidyTyexdSpgDk48nBRmDi4ZQTTsm7NnVEk7
         QpNAenFayX3kY36jsUKuPjvbqlhe6BjYsLx5/SL/Wlfyymn3aJmGaxThXrcbWeWUfkkt
         Bc9ng8Gj3J2muQfuLdwSvdGaAqo/ECOIE1dk7qTVA5/i18y4rPT/ixkbJfm9lZonFpee
         V2l0JUwxE1qANNoSgev3eFfeOWXxEQqmVW3s4Juo9EC40KDpPHKlX1mIKbvExIwhH/lV
         ZJr1Mt4E2scIYCF4DJdIo0hlM32aXNQbAbYcesVGc2jWlNypNbhjjHr+dESnA/BGG4Rv
         6I8A==
X-Forwarded-Encrypted: i=1; AJvYcCX1EUenzcB6imHYSEdp/8w1AsFrp5a7OAFKzU5gwurgws7Vn+ptZKcui7aApDHDae8DV4g8htDZjgx6snmettMM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl6Pirgu+vTMMwUeEDMuSRATHOPdHKmwxEsZDw69yQAnvAnJj+
	UFqYihaV7kZuaIOoYymW2KJLaYwkNoytH/GvBE1yH8iLxlbFJbPWy9EDttGEeg==
X-Gm-Gg: ASbGncuP9tZ7J4lY9QKS4BLhRvVby/QBNyBzTDQSYMc4o2OFFpJcisB83GiIJ4xs6oI
	DgoHcoZRzD6j5SLiAFflZRkO7qLSCjzfwrImSZGVOH4LwiEi4kN71u/GBiq8W8BVf7/E89HWZG3
	YAuzgNM6mkHqHi7YwdR/l97nQNfhUx/YS3RERYy2xfAv19QC7i/bbjVaOnZWL0iA2fqoW8dglEB
	QODtr73DWdz132fSQ7xEoedeo+1Ms6c5ozdgAC41fgUmcylMmFj6fSfbdjz
X-Google-Smtp-Source: AGHT+IHayNjuQ1X29URUJCX9sq0e/A4DCoC/llYxuth0yx0/0uBpnijEWmYVIRWVw90O9w6CjRmR2Q==
X-Received: by 2002:a17:902:ce08:b0:212:e29:3b2f with SMTP id d9443c01a7336-215bd250316mr28172835ad.44.1733232881563;
        Tue, 03 Dec 2024 05:34:41 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215908ab2dcsm36529975ad.209.2024.12.03.05.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:34:41 -0800 (PST)
Date: Tue, 3 Dec 2024 19:04:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241203133434.2qbohwi3wrjjja5a@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126155119.1574564-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_053443_230240_CDB329C2 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> 
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports wake# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    | 45 +++++++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 99 +++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
> new file mode 100644
> index 000000000000..479c03134da3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe RC/EP controller
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  STM32MP25 PCIe RC/EP common properties
> +
> +properties:
> +  clocks:
> +    maxItems: 1
> +    description: PCIe system clock
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: pcie-phy
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO controlled connection to PERST# signal
> +    maxItems: 1
> +
> +required:
> +  - clocks
> +  - resets
> +  - phys
> +  - phy-names
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> new file mode 100644
> index 000000000000..18083cc69024
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe root complex driver
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      const: st,stm32mp25-pcie-rc
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-pcie-rc
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: PCIe configuration registers.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: config
> +
> +  num-lanes:
> +    const: 1
> +
> +  msi-parent:
> +    maxItems: 1
> +
> +  wake-gpios:
> +    description: GPIO controlled connection to WAKE# input signal
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +dependentRequired:
> +  wakeup-source: [ wake-gpios ]
> +
> +required:
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
> +        num-lanes = <1>;
> +        reg = <0x48400000 0x400000>,
> +              <0x10000000 0x10000>;
> +        reg-names = "dbi", "config";
> +        #interrupt-cells = <1>;
> +        interrupt-map-mask = <0 0 0 7>;
> +        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x01000000 0 0x10010000 0x10010000 0 0x10000>,

PCI address of I/O region should start from address 0x00000000.

Also use hex notation for all values.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

