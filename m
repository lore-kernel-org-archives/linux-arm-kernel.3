Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjtp5uxq5PJR8SPbumJFOhR6APtRTEBkqcgJtZZs/yI=; b=yCMvbJDySJa+SRpI8tUWgtiHPz
	A4jhxbwM6BfXNbHlz4+V8/YgG6tVb7MzQEKOOeTZ+h14tT9RRMDt9Mvww9gU6Xgb6QZbvU5ggBgsd
	hyra+TCCtKZxWx862JuGDToQtzNGcs3c0d3wWKnR6k5gNIRPYz1bJwKG4Md7l3CoMLivJvW2n/Q1n
	Gu1Bz93PGuHCP2Vg3+3BdH2LorSqj7Phq0KC5FNFnLN8HxvKEAF37kdzP64dVCRR4OnrPh7qUG4wD
	r8/g4oJAK6Y/G/cqIdben/WCEWtIT1xw6VFtZ1iwQNZ/Tf34PMk3uTeaSSxzGajCoojL/1ybqQFTP
	8C2OZRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PsZ-00000006QcN-0KXd;
	Wed, 09 Apr 2025 07:29:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Pq6-00000006QLA-1YTd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:27:15 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-739525d4e12so5822349b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744183633; x=1744788433; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjtp5uxq5PJR8SPbumJFOhR6APtRTEBkqcgJtZZs/yI=;
        b=yAnZ3913J7RiEhmliqR2WE50KTsotx4LLj2HdQPmwMmB+iECokVcIz+ITXLMECs7ES
         7miU9rmBJ7IBFLk3x7qGm5p1lbioutfJYFm0aKu807S42rWkNmaLRLzDnCJ4gIKIPJNB
         CzfHYqsu8ivvk93ntBKaAQ0/H6J0GJCao1J2vbz8+RiJR2xXW6ZNRLUK1XeslI8CASmQ
         nnI/ypwlAmRrL8i6ImDJzjnN6UEZZ7/Upn4YfHknmPxBDGnERUtMoHQJfLa3mLS2Pz2K
         tPfG2pgwzx5LmaU+PrUVCJ/J/7W3HieNa99FYSyWVI5BNrkvQzvUKi6YWfSrA1l08hMl
         6qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183633; x=1744788433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjtp5uxq5PJR8SPbumJFOhR6APtRTEBkqcgJtZZs/yI=;
        b=Nvk2WtGEl/R45SjZxOJzlIZUI45povGQMMfHCdcnsRpkrywXicXRI0vYCYOx4q3m0Q
         tDil8G3TvzCtWtBQH8Kr1j/sI/oNoud44lcScQl1cqZZKD9OPhAsuC4RlWKbjspeCDny
         r33qhTEH/Mn4KkRSb42da08BZ9I7RlXyquEp6pNvs1yT3gHFfxWlRhI56gz7aDzfTVO3
         gI04VuT02oqOZ4OBtHuj/GemBhebih9p3Fpv4oQ/I5Xd16gLWjOdRua2bzh1SspxT0xd
         4ly2la1n7nfurRxuxCDLjQIskMkl5CkZnuILBF6qXo7hI80cvd7nS2MOHY/SFkGSuNKT
         lH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKd7V/b06ava0KxpDDfunBnxjSuoqjaHliHypH336C5tf0Q72O9XHAEhVNroEqUR+FXtnh+h1FHx3XtgmSG/Pb@lists.infradead.org
X-Gm-Message-State: AOJu0YwJUDvVDOY9I68QlKcPXjH4dsUAGJCYHVB636YPtmvhLPkY62oS
	m+EBs5zLsyrBD0KQJn0Fz/dgziUGHY1sz2L61gtw/QbPtzJ4594+WHqRPiqzWQ==
X-Gm-Gg: ASbGncv6kSho92dM7+eXdSgLvBrvMk8U/4z5WXJcZuzPPnCwKxFXWin+HEs2DmFzxKN
	w+egQOhR/U8otnh91pjIhfTuej8OYMEfEqHp1+baLl+7V2uxjS5EIZPrZaQaY8JBC2kUMoNWIUq
	6MIaRjRmFrtkDcqD0ceo5Rdvd6hXbrlLBs+hgcaEbt/MdiXAlHBcnaBBnmKAVN2WL7IvCHgIFyz
	zJWgZjHnSr6eRHhcvu6tyZVlyN68/Ozq7p4SnGqatgkl2GOUkBTKu6U9jIztjrYByzCgyBXe8yy
	YipyWYtC2GTfC6fxyHK2k97C08KQAciVCCwZ8jsAedtf4GFZ50lYTIBYqLmrDQ==
X-Google-Smtp-Source: AGHT+IFJNOB7FQRc/Tw1WyrEz0Y4erL5DJ65iCK7Rvye19VpLIDU8oQWce0axOQ4lCLAH8Qrt4ZW7g==
X-Received: by 2002:a05:6a20:c88f:b0:1f5:6d00:ba05 with SMTP id adf61e73a8af0-201592e1b96mr2765473637.38.1744183633456;
        Wed, 09 Apr 2025 00:27:13 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322117bsm469422a12.64.2025.04.09.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:27:12 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:57:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	johan+linaro@kernel.org, cassel@kernel.org, quic_schintav@quicinc.com, 
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9 RESEND] dt-bindings: PCI: Add STM32MP25 PCIe Root
 Complex bindings
Message-ID: <ku3lsolnbbwwlngi54lpe4j6s476rhxi662vqvlwwua4sos4du@b6j6zofrpuuy>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
 <20250325065935.908886-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325065935.908886-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_002714_413194_67C3DCDF 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, Mar 25, 2025 at 07:59:27AM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode with one root port.
> 
> Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports WAKE# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below.

> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  33 ++++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 112 ++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> 

[...]

> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
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
> +        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
> +                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
> +                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
> +        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
> +        clocks = <&rcc CK_BUS_PCIE>;
> +        resets = <&rcc PCIE_R>;
> +        msi-parent = <&v2m0>;
> +        access-controllers = <&rifsc 68>;
> +        power-domains = <&CLUSTER_PD>;
> +
> +        pcie@0,0 {
> +          device_type = "pci";

Indentation is off by 2 spaces.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

