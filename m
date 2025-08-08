Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2664CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f6xy+aBOaPKs56VR9kjp6cxPwtioSpnzbBMEVe8kGI=; b=dNndfYTaeIeEy35xxssk+I4P/e
	ErGBbcwZwxE9P8xtZpl8xc8To1vLIUujUu9ud3GBanHaN7uMbWJOUjP/Nj3D18xk8NNnh1pOOQ1mG
	aM3CZF5Jq+ndZ33Dr++1PVf5CbPwhERMao8d8pG8HronpZdk02Ohw2cXnss6FbE859Tt/+cEFVvPc
	fr7xTGbudHYLFyjKDahCEQC1y372K4s7S4T7R79Ml7jOV1eqHqg+msApfDAo3G0+b2Fmnz+yvcLRs
	XrA2oa36S0/PUr9r7sCdmincLsoXrK1qhb+Mcx397d1URFcNdn9MW9UgDlZcmuHp9pDSiXDrcqiei
	4VNztqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLs3-00000002kod-2irM;
	Fri, 08 Aug 2025 12:06:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLEI-00000002fMU-1DP4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:25:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7892609a5so1224886f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652345; x=1755257145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f6xy+aBOaPKs56VR9kjp6cxPwtioSpnzbBMEVe8kGI=;
        b=pNvgov/ey+H2/Pq4eIF7z0EF0oerpnpoH8HxxITYW+KnL5T29+ltQVYfFxtNy0v+KO
         TZS/BfMI5S2BAz0Uh6ZdT4hdmKZpP27x9FHIcuLhM5phj5xG8YXvq5TzghxwHtuJXRBk
         wjUyGfCqSvwwW8G+Wfay2ODtuxjK2Fex6DEW5Uf+6iCsWCAIJS0c2ZxPRHTHQizn+SC6
         iPl/6mLpMIbzXiwrRA4Lsp+aKfJi7HdI3GhWNNlOuml687SckQhUTFCqIFd2WjM4zHU/
         a5+WdWi74qhr+OKE8SuqfZ7Uyp4cSwgTnlceUfZOuuxH8DxlwHj84YF6Yt55WkqLGvSp
         M25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652345; x=1755257145;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f6xy+aBOaPKs56VR9kjp6cxPwtioSpnzbBMEVe8kGI=;
        b=Hqdnig2gJnhHB6NVoaMgKGi6o05Jfb6gMrg46Yp9E86EsrBQHl3SzEO5KGFXpAw2/R
         kVnJWJPClooKzb8peUZ0jl0NlUcfsXJredVSZOm168iLbhe+54adJOWyvt6ait08UtEE
         Mp2dYEtaM4GsrpV1RqSuuM/jf+YzwOqm/hpBY9pEVCr8cpSpYef59XtQQ3WdN7XLQFXK
         ++fOhv4H470upZuAEPo9vN2DJzbWSnIA44QAyPG9fyPQWm/8NMgrUQ3vmend6ougYedd
         CuvGN/8we4TA3W5vOGEMSRs3hXtnlLl9FZ1X+PKErlxClqVANv0vGSM/OBfbjmvIUtoM
         NX3w==
X-Forwarded-Encrypted: i=1; AJvYcCVgdVWdYy3drVobBmL9VAoc1dc+O+R31wGdVYsX6hoR+Y88ImNbT0zvTbUjkXO8MYmuOG7ITKYw1cvVhDX1Le0z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEv3beU6ijE3uKgdlhcRKoIl9613RFPxv/e/pF9tzI8KpuGf01
	bYZ0hNkIBZB9uHNsEjH5eb6THl3hZ2V45BDupNCR0IW8Sqc/pwq9vZBDJEJWj6xRFMU=
X-Gm-Gg: ASbGncs+svGvZZ0uaiLsPD8bn9D2tVFDvkxAoj7aYUWlDkUB93o5zCb08DaTEvKVpjb
	lBolnzdLaVw0TxVb/NUGpZZOaxXebIX5EKQZeSNLzagmJn+FZOd15aWOlPcPQRLuB1xAV+i4nW3
	0pJi0BAxcWoS+azHHh5oQdgzW/2Pq9HQP3x0fTl3VikOBAGH2I+MpTNXFFtlTObPi8kj7phoIvj
	CzK55S2VyQfIgpmIIbTavDbJiAxGFbGDTFernohboUqLM28ew5vNLzdQW6y+nTZDBoRp4EksHUB
	lY5PutNhTSrGIzYyBur7UQm5WKzgMUdcsnFmQrDtzBXhzIexWsPOn1/VeHcNDpS8sklZduDhMka
	h33djr4rD7ojKMB0Hmer7f4Mvc+NB5EMAq9VxPsGlQQ==
X-Google-Smtp-Source: AGHT+IG+d+QVEEJZwj2dMpvlEXKWBGDwCt68UnmyWGJ/cwYSS+LXI8Tj/fvC7ktt2tblrQA7hmZ3Sw==
X-Received: by 2002:a05:6000:24c5:b0:3b7:8f49:94f7 with SMTP id ffacd0b85a97d-3b900b4d8b6mr2051559f8f.31.1754652344801;
        Fri, 08 Aug 2025 04:25:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58553f8sm141920125e9.14.2025.08.08.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:25:44 -0700 (PDT)
Message-ID: <71d109a1-211a-45ee-8525-03f1859b789a@tuxon.dev>
Date: Fri, 8 Aug 2025 14:25:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250708163407.GA2149616@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250708163407.GA2149616@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042546_335386_F88A2342 
X-CRM114-Status: GOOD (  22.40  )
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

Hi, Bjorn,

On 08.07.2025 19:34, Bjorn Helgaas wrote:
> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
> 
>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> 
> The "r9a08g045s33" in the filename seems oddly specific.  Does it
> leave room for descendants of the current chip that will inevitably be
> added in the future?  Most bindings are named with a fairly generic
> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
> keembay", "samsung,exynos", etc.
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        pcie@11e40000 {
>> +            compatible = "renesas,r9a08g045s33-pcie";
>> +            reg = <0 0x11e40000 0 0x10000>;
>> +            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
>> +            bus-range = <0x0 0xff>;
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "pm";
>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>> +                     <&cpg R9A08G045_PCI_RST_B>,
>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "serr", "serr_cor", "serr_nonfatal",
>> +                              "serr_fatal", "axi_err", "inta",
>> +                              "intb", "intc", "intd", "msi",
>> +                              "link_bandwidth", "pm_pme", "dma",
>> +                              "pcie_evt", "msg", "all";
>> +            #interrupt-cells = <1>;
>> +            interrupt-controller;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
>> +                            <0 0 0 2 &pcie 0 0 0 1>, /* INT B */
>> +                            <0 0 0 3 &pcie 0 0 0 2>, /* INT C */
>> +                            <0 0 0 4 &pcie 0 0 0 3>; /* INT D */
> 
> The spec styles these closed up: "INTA", "INTB", etc.

I'll update it.

> 
>> +            device_type = "pci";
>> +            num-lanes = <1>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            power-domains = <&cpg>;
>> +            vendor-id = <0x1912>;
>> +            device-id = <0x0033>;
> 
> Some of this is specific to a Root Port, not to the Root Complex as a
> whole.  E.g., device-type = "pci", num-lanes, vendor-id, device-id,
> are Root Port properties.  Some of the resets, clocks, and interrupts
> might be as well.
> 
> I really want to separate those out because even though this
> particular version of this PCIe controller only supports a single Root
> Port, there are other controllers (and possibly future iterations of
> this controller) that support multiple Root Ports, and it makes
> maintenance easier if the DT bindings and the driver structures are
> similar.

I'll ask the Renesas HW team about the resets and clocks as the HW manual
don't offer any information about this.

If they will confirm some of the clocks and/or resets could be controlled
as part of a port then patch 3/9 "PCI: of_property: Restore the arguments
of the next level parent" in this series will not be needed anymore. Would
you prefer me to abandon it or post it as individual patch, if any?

> 
> This email includes pointers to sample DT bindings and driver code
> that is structured to allow multiple Root Ports:
> 
>   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/

Thank you for this!

And, thank you for your review,
Claudiu

> 
> Bjorn


