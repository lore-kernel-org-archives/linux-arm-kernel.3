Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73140E64AB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxRWvpRh/XATlPemsVPOp1C/WgHKNO3eQaKjWVu9JCw=; b=mr48NF3add0gZVzz2utlFPZwf7
	4tqe3c3W5RKjUCwd4KReCbBqu3YpcgDsys3trc9TAcOHm7GCJsO51qre7VGGPB2A1bzTFpoVVRLwh
	OWwpa/ZOYX3gftZV9s8c92B1zC2x6b0XD49jCBds/RZ9DtrURBmjWabNbPtMOgRpMawllQBzUFvjx
	BwRYq7rk3XjldM0d4itzCb7KGfXad9k75FELn1nMBeJqXisAg1QziSYzYScBhHqIW4pzkq5uGaw1s
	8gBuZ8A+uMNJA+jRq9YUjFzVJ38ETWyU7YzT+z9402YHOGl7zvlskAENEi9NHV2CbuGFv5pZJL0OC
	657So0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUIx-00000009qOl-1kkA;
	Tue, 03 Dec 2024 14:55:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUHw-00000009qAd-2vNt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:54:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215a0390925so22487145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733237647; x=1733842447; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NxRWvpRh/XATlPemsVPOp1C/WgHKNO3eQaKjWVu9JCw=;
        b=vNlA/bWG9gBshF33nwBQj1VTzI4sAQj3lvT4v1WtwI0UXOeT61GyMXxDdAH1mn2iVj
         rcpZROWVqIV43/kibLOrtbAjn8K7RczBTAssOWfvS0Kgu/m+fERXy9SgNR044bA3KRJe
         jFkvxvE6ncPCInRB0H/N90Y+dgdqjxjbgJLzrNtkfcAHo/MZ5MmwAFZGAdO31D8Zhhv1
         RyAPYeuR2iFQ77reou/cHscVyBMTGvfTJ8/rpT4XTmSU/Sanj8HUAII/zum9py97fR6K
         BtA6+OGwgoCvy4yRn26Nbu0qIiYrY+beEbVKbsvjW57pvbDeMKHjms4yTveEOimt4e7B
         LsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237647; x=1733842447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxRWvpRh/XATlPemsVPOp1C/WgHKNO3eQaKjWVu9JCw=;
        b=Yj6/UmV0W7S7OFi5veC3JV/eEVpCnxP5UQubV9ZiXovoHUjbfLh8AxohbH8VBX7Sjr
         PmUU1yPAUXYOHBcnIcYdo3n6YS54Afz6hCI0t+79V60CrBhvZHw7dxGWvP/IIh77QvnW
         jvLaXBy945I36BAapgeYvhx4IKAalXIjsFg4YGzml/XQLUlgocXUU1dlEyCQ6ulmHvVq
         CSAkBvSe2+eyqX3UWFBd/hZMPeHz3DWsprHiEgvRtHHQFTzibwYBFUBilQzcNF2hPf+L
         PZwXJN4MaqgGWG86964msZN7XZ1lbJu2eCIQFjRzzbkVQywPNZlzDwgojgnbcJW7NA2/
         GAqg==
X-Forwarded-Encrypted: i=1; AJvYcCX3DpQTzS64/XHgKTPv4QmSHLirTZ/wzWsFkAgperGLSHJ0mw5f37W3PzqlCbO6q2p/3YRS1nkLAloI4Pu0xWkC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Hf/PE4u8fzhFgfwCnc3CYMjkANFRWktQ0ardt2jG1/oZHFl5
	XUlVSGpXgQd8SKuKtqXF0w+dmnl2tD/Daji3tPN4luzwkMZzysMQZWpOjORfQA==
X-Gm-Gg: ASbGncvf/MKCVBcAwvFpcagbT99CcVUX0PEvx/TpmrdiftY+JP25t0SDnl43ZtCf5lk
	KKOCnbl4533c/naFpxHvwPW2zmOx8XfVEG0dlQX8RbPDuWZB3G3aCWZvNx7GLdWvSkm3B1pfGh5
	0ANksL88RdpPyw5r/0PAvwKs8K2u/TxBInKF2jm/VoMzSvFBx+90t1JI27xGu447OqAa+hIWK7V
	3F2Gat9GJbXvePhrXc/mVc/GXJvc7CirhlKBlqh+0HOvawz4E4eKZ9/ma2S
X-Google-Smtp-Source: AGHT+IG1jXS9xGAq/FRf8FrbfE+7Y1wmH9mz8EtqoFxLQOYNOcGvJFOa6X0SdbkbLcjrMI9kzEqtkw==
X-Received: by 2002:a17:902:f543:b0:20c:a44b:3221 with SMTP id d9443c01a7336-215bd1cb76emr33584985ad.15.1733237647391;
        Tue, 03 Dec 2024 06:54:07 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21565f24c59sm56675255ad.125.2024.12.03.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:54:06 -0800 (PST)
Date: Tue, 3 Dec 2024 20:24:01 +0530
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
Subject: Re: [PATCH v2 3/5] dt-bindings: PCI: Add STM32MP25 PCIe endpoint
 bindings
Message-ID: <20241203145401.7snlxk3sybufaqp2@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126155119.1574564-4-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_065408_737604_45C466BB 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Nov 26, 2024 at 04:51:17PM +0100, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> new file mode 100644
> index 000000000000..0da3ee012ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe endpoint driver
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  PCIe endpoint controller based on the Synopsys DesignWare PCIe core.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
> +  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-pcie-ep
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: PCIe configuration registers.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: addr_space
> +
> +required:
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    pcie-ep@48400000 {
> +        compatible = "st,stm32mp25-pcie-ep";
> +        num-lanes = <1>;
> +        reg = <0x48400000 0x400000>,
> +              <0x10000000 0x8000000>;
> +        reg-names = "dbi", "addr_space";
> +        clocks = <&rcc CK_BUS_PCIE>;
> +        phys = <&combophy PHY_TYPE_PCIE>;
> +        phy-names = "pcie-phy";
> +        resets = <&rcc PCIE_R>;
> +        pinctrl-names = "default", "init";
> +        pinctrl-0 = <&pcie_pins_a>;
> +        pinctrl-1 = <&pcie_init_pins_a>;
> +        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
> +        access-controllers = <&rifsc 68>;
> +        power-domains = <&CLUSTER_PD>;
> +    };
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

