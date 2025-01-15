Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77519C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCinpPyq6kUzNoKBfO2/OVSn+RgG9IGx3IVY4KpK3Ug=; b=bDPt9V7jNVAwW9StFaFY0rKmxh
	S8bjYvFm5ZRBAXc2xonhOaeoMj0ff4izSRFOVNqugBEiV77qkNTfuo7c8sKLmo/FH2OEJ9zRFtQJk
	h++rhJpfI0wCb9sJJnmQWRn0jTYLHQL3ZPv825fq4JVAmBm30xlVCRzdFw14Qs/FIayh1dF+8wocR
	RfJgRINltXARGIM04vA97Oy9VBk2tvls19PpKIO84lg+rNrFFAxpU2ktd2Un2LSXHhQA+2eqyvmjF
	bLVTTRapa8Dh1TbjKIgt59lQDjI3Bv2DMewNR7DqaYkikRQPQ+Fj4GC0ytZpDJCZlNXE1TFsCimTE
	CF9hVElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2o3-0000000BsPR-0WVP;
	Wed, 15 Jan 2025 12:47:35 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1na-0000000BjMh-2ido
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:43:03 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21670dce0a7so143683595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941382; x=1737546182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCinpPyq6kUzNoKBfO2/OVSn+RgG9IGx3IVY4KpK3Ug=;
        b=hP+XLBHyfacIkutE9kXlG4JPrMzSAu5JFcoKhTj7+Lp2Zl5DDn1+Lr4m1wh4Vc13c+
         XYcuQUV7l5XLRIPMw+1jhmnjRKdfQjZFvez7/8m/lIH0tXIAzycO4f8f6iC6wCVV4zq1
         Qfu5qOfjl2AH5bHPp3lJUDPQ/Wuvo/YfcGB4BdYzvbYRb1QoERqCBl8JZDKy6jUD4kce
         cFB9ql/j6UM/APbm8X9cIr1EyB9l9X811wemM3TpHxMCSacSmDxjEFE0prkAxBgJYsOa
         H2hIzL2HYowPWzwvzV+2TXUvyS3LsrndKZj0ToTxgcXTgEInD95wgK4zoHRSOLVczGl7
         nAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIUihLlZmLht0h1jzboHG5qNcEB+O0v71HNSCIg0MZPXEQz6YKRasPDtlDZLhBXIpT34XSDM206FTtRYcSDdn@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlcHdRg7a19sizLfQaY0s91iC21EQ6FqlO3WdJQCV1VrW7/yV
	MZxYqcs3CKJi1X8HkRx+/gNxSWZBNB8OPXze7oZ2oW/4qulKGU/S
X-Gm-Gg: ASbGncthrwvR5fILI6r7hcAoOYlmVZivr7pxNnMD6C7Isdn0F74Ks9iKDJow+oRnm2C
	XVjJvrMJ+07gxWghbg5bKDvdPELwxfn6FIntMezND2iYKQea7HCVpxn3H1wLVkHjTlstvtoRY7O
	dbkMA4TaIaPlkSSoJlIpgKrPVsQjW38p3VrD48lGf88Q+DnLycin43UVO74t2Xn8XSnOSk7j13C
	kwqUl7m3anDGfPvpDKaFpFzNtK5zBYo9rFkFbGh6KY4CCA2MCtuiqOWRuHtoDk7/UpecFEuxv3c
	Oy7KqmWKUCHaxi8=
X-Google-Smtp-Source: AGHT+IHQawHUCYw2ob/UyXfWjtyHo9HpYp1N2sGEBkA9xtrXsmWo2Qf3wAOlf+UJO53bmKCDDt6eBQ==
X-Received: by 2002:a17:902:ea03:b0:216:2d42:2e05 with SMTP id d9443c01a7336-21a83f6fa87mr547916735ad.22.1736941381887;
        Wed, 15 Jan 2025 03:43:01 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21e279sm81344075ad.134.2025.01.15.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:43:01 -0800 (PST)
Date: Wed, 15 Jan 2025 20:42:59 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <20250115114259.GP4176564@rocinante>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_034302_686923_A3532E8D 
X-CRM114-Status: GOOD (  18.60  )
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

Hello,

> == RC side:
> 
>             ┌─────────┐                    ┌────────────┐
>  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
>  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
>  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
>   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> 0x7ff8_0000─┼───┘  │  │             │   │  │            │
>             │      │  │             │   │  │            │   PCI Addr
> 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
>             │         │             │      │            │    0
> 0x7000_0000─┼────────►├─────────┐   │      │            │
>             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
>              BUS Fabric         │          │            │    0
>                                 │          │            │
>                                 └──────────► MemSpace  ─┼────────────►
>                         IA: 0x8000_0000    │            │  0x8000_0000
>                                            └────────────┘
> 
> Current dwc implimemnt, pci_fixup_addr() call back is needed when bus
> fabric convert cpu address before send to PCIe controller.
> 
>     bus@5f000000 {
>             compatible = "simple-bus";
>             #address-cells = <1>;
>             #size-cells = <1>;
>             ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
>             pcie@5f010000 {
>                     compatible = "fsl,imx8q-pcie";
>                     reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
>                     reg-names = "dbi", "config";
>                     #address-cells = <3>;
>                     #size-cells = <2>;
>                     device_type = "pci";
>                     bus-range = <0x00 0xff>;
>                     ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
>                              <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
>             ...
>             };
>     };
> 
> Device tree already can descript all address translate. Some hardware
> driver implement fixup function by mask some bits of cpu address. Last
> pci-imx6.c are little bit better by fetch memory resource's offset to do
> fixup.
> 
> static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
> {
> 	...
> 	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> 	return cpu_addr - entry->offset;
> }
> 
> But it is not good by using IORESOURCE_MEM to fix up io/cfg address map
> although address translate is the same as IORESOURCE_MEM.
> 
> This patches to fetch untranslate range information for PCIe controller
> (pcie@5f010000: ranges). So current config ATU without cpu_fixup_addr().
> 
> == EP side:
> 
>                    Endpoint
>   ┌───────────────────────────────────────────────┐
>   │                             pcie-ep@5f010000  │
>   │                             ┌────────────────┐│
>   │                             │   Endpoint     ││
>   │                             │   PCIe         ││
>   │                             │   Controller   ││
>   │           bus@5f000000      │                ││
>   │           ┌──────────┐      │                ││
>   │           │          │ Outbound Transfer     ││
>   │┌─────┐    │  Bus     ┼─────►│ ATU  ──────────┬┬─────►
>   ││     │    │  Fabric  │Bus   │                ││PCI Addr
>   ││ CPU ├───►│          │Addr  │                ││0xA000_0000
>   ││     │CPU │          │0x8000_0000            ││
>   │└─────┘Addr└──────────┘      │                ││
>   │       0x7000_0000           └────────────────┘│
>   └───────────────────────────────────────────────┘
> 
> bus@5f000000 {
>         compatible = "simple-bus";
>         ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
>         pcie-ep@5f010000 {
>                 reg = <0x5f010000 0x00010000>,
>                       <0x80000000 0x10000000>;
>                 reg-names = "dbi", "addr_space";
>                 ...                ^^^^
>         };
>         ...
> };
> 
> Add `bus_addr_base` to configure the outbound window address for CPU write.
> The BUS fabric generally passes the same address to the PCIe EP controller,
> but some BUS fabrics convert the address before sending it to the PCIe EP
> controller.
> 
> Above diagram, CPU write data to outbound windows address 0x7000_0000,
> Bus fabric convert it to 0x8000_0000. ATU should use BUS address
> 0x8000_0000 as input address and convert to PCI address 0xA000_0000.
> 
> Previously, `cpu_addr_fixup()` was used to handle address conversion. Now,
> the device tree provides this information.
> 
> The both pave the road to eliminate ugle cpu_fixup_addr() callback function.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof

