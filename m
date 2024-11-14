Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CDBD6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jINxuziEGUKxSEDQO12O3R9xdpJrug6G+fjPTMpWDhU=; b=LdHKMF8uvSsouk25riSbFC43G5
	Nbm0xOslAzSbNH4PfwTqNr/QVEU82d+Bu4l/SOYAF1bGmORu00E/u22PvSs5YBTyyCNZbq7RsfvKO
	jPS4KH6++WlWS5pii36d/P9R89Wm4IQ3MArWFPtklmVvOlZ3GIkgZjllU1ax9THVJVyABI2UbSGCr
	2yc2Sn2LFiRjKoR2aAsac4w/f5c9c+/POILymJqop102bEBJMPXbbe5mmfFIsGZV8N1fVmhR7s797
	c8uARNOcWfz4NmXUUQ2uid1fqVjAqj/MB8rjARYEkuwcVLHFxqCRHM1MyI5kUuvkbjOaH7naxbpVU
	LMYgZEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdef-00000000KSC-297E;
	Thu, 14 Nov 2024 17:29:17 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBddi-00000000KCo-0Mcl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:28:19 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7f4324503d7so683439a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731605296; x=1732210096; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jINxuziEGUKxSEDQO12O3R9xdpJrug6G+fjPTMpWDhU=;
        b=GpuwXGnfoxuXZ82z4lzEoi+MSpAKsqMbp8qWTucmhjP91tayYR3h9JaTRXLqTD2n6j
         ru4voO6FQLBGnigZlTji/FYU3UeerPb7Qi4V3iOB2KSK0qFE79ahfJMBwOQYY/VWbc4k
         2h4kgcBdNPG5E2gOQixi77GxeIZziVKZ6yLrd2HB5seLlYrX3FcdljN/BUHYHQfYaW+f
         1FQPQ6UXWr+YjKsGPpqXUgWnGwwt4muzNsE5yQtP5tPeLfTxJMJVKjuxkKTmKXAlTCcr
         ngwF9+uH1WMXR3PLUeqov/0SGWUcqJyxStiGTBRBVC+2Wjd9AlxJB6W/IBAcE1p+U98Y
         Mn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731605296; x=1732210096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jINxuziEGUKxSEDQO12O3R9xdpJrug6G+fjPTMpWDhU=;
        b=jI8q8VtO82curk08csbdXamDBJEZ3M9W1dR+kXTsRA4Rb/cwo/nyoaoK1BKBX0tG4W
         HFVb7A0vHXMXMWoPcztJ3tNtP7y/ZhroW4Q91WEAn4Qmwrs7/uc9FQpnBtPrW7Vcxg2b
         8tamA4Y9rrXqcRl1xBv+13q7zgjaeon+W2sNi9ix7uybmwQ0S/ynWANbq6NEUqVCixnY
         zuJOhAx5DN+GfLUAqw2AquDZbq/Va6fibeKNqa3D/jK1IdgoxeTHVFrV/dZGOAatc6Sa
         8jyMGfvc6tmzJxY+DOOzSxjIuixic2V21kQvE3TLidpafr9/3wuEFJfqaK/fLMeD7RDs
         FpUA==
X-Forwarded-Encrypted: i=1; AJvYcCXePCLhgJNTtw1dSNaK+nmjN+dVl5tU0Bn0/TktjqoillAk2u+W5GY3Eca7SfFUuBFKLodw3PdRD2xpJMA+0bE0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn5zrcMady8ZMNZ241axA+1S5nh+qnPGWZKv1F4ix8jSC6WP+L
	9oaupMsMjTVlZjXJaJnD2rXJ342fo5fnz9kwLfo1fW0LkTZO77N2QvRMvuTGlg==
X-Google-Smtp-Source: AGHT+IF0kTNpd9maxDbIGrdGFuphWSiT+uTWui2ph8Yv10bDI8Lj8IF7aQjnn3D4RSc5j+V9Z/0nTg==
X-Received: by 2002:a17:90b:4b4f:b0:2e1:e19f:609b with SMTP id 98e67ed59e1d1-2e9b177fc81mr32873637a91.24.1731605296407;
        Thu, 14 Nov 2024 09:28:16 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea02495651sm1560066a91.16.2024.11.14.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 09:28:15 -0800 (PST)
Date: Thu, 14 Nov 2024 22:58:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: Re: [PATCH v7 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <20241114172806.cusbzxlcqtayeqvw@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <ZzYqKNAWRH6EMiny@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzYqKNAWRH6EMiny@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_092818_142902_48A02907 
X-CRM114-Status: GOOD (  31.34  )
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

On Thu, Nov 14, 2024 at 11:49:44AM -0500, Frank Li wrote:
> On Tue, Oct 29, 2024 at 12:36:33PM -0400, Frank Li wrote:
> 
> Mani:
> 	Do you have chance to check dwc part?
> 

Frank,

Sorry for the delay. I plan to look into this (and other series) tomorrow.

- Mani

> Frank
> 
> > == RC side:
> >
> >             ┌─────────┐                    ┌────────────┐
> >  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
> >  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
> >  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
> >   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> > 0x7ff8_0000─┼───┘  │  │             │   │  │            │
> >             │      │  │             │   │  │            │   PCI Addr
> > 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
> >             │         │             │      │            │    0
> > 0x7000_0000─┼────────►├─────────┐   │      │            │
> >             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
> >              BUS Fabric         │          │            │    0
> >                                 │          │            │
> >                                 └──────────► MemSpace  ─┼────────────►
> >                         IA: 0x8000_0000    │            │  0x8000_0000
> >                                            └────────────┘
> >
> > Current dwc implimemnt, pci_fixup_addr() call back is needed when bus
> > fabric convert cpu address before send to PCIe controller.
> >
> >     bus@5f000000 {
> >             compatible = "simple-bus";
> >             #address-cells = <1>;
> >             #size-cells = <1>;
> >             ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> >
> >             pcie@5f010000 {
> >                     compatible = "fsl,imx8q-pcie";
> >                     reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
> >                     reg-names = "dbi", "config";
> >                     #address-cells = <3>;
> >                     #size-cells = <2>;
> >                     device_type = "pci";
> >                     bus-range = <0x00 0xff>;
> >                     ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> >                              <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> >             ...
> >             };
> >     };
> >
> > Device tree already can descript all address translate. Some hardware
> > driver implement fixup function by mask some bits of cpu address. Last
> > pci-imx6.c are little bit better by fetch memory resource's offset to do
> > fixup.
> >
> > static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
> > {
> > 	...
> > 	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> > 	return cpu_addr - entry->offset;
> > }
> >
> > But it is not good by using IORESOURCE_MEM to fix up io/cfg address map
> > although address translate is the same as IORESOURCE_MEM.
> >
> > This patches to fetch untranslate range information for PCIe controller
> > (pcie@5f010000: ranges). So current config ATU without cpu_fixup_addr().
> >
> > == EP side:
> >
> >                    Endpoint
> >   ┌───────────────────────────────────────────────┐
> >   │                             pcie-ep@5f010000  │
> >   │                             ┌────────────────┐│
> >   │                             │   Endpoint     ││
> >   │                             │   PCIe         ││
> >   │                             │   Controller   ││
> >   │           bus@5f000000      │                ││
> >   │           ┌──────────┐      │                ││
> >   │           │          │ Outbound Transfer     ││
> >   │┌─────┐    │  Bus     ┼─────►│ ATU  ──────────┬┬─────►
> >   ││     │    │  Fabric  │Bus   │                ││PCI Addr
> >   ││ CPU ├───►│          │Addr  │                ││0xA000_0000
> >   ││     │CPU │          │0x8000_0000            ││
> >   │└─────┘Addr└──────────┘      │                ││
> >   │       0x7000_0000           └────────────────┘│
> >   └───────────────────────────────────────────────┘
> >
> > bus@5f000000 {
> >         compatible = "simple-bus";
> >         ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> >
> >         pcie-ep@5f010000 {
> >                 reg = <0x5f010000 0x00010000>,
> >                       <0x80000000 0x10000000>;
> >                 reg-names = "dbi", "addr_space";
> >                 ...                ^^^^
> >         };
> >         ...
> > };
> >
> > Add `bus_addr_base` to configure the outbound window address for CPU write.
> > The BUS fabric generally passes the same address to the PCIe EP controller,
> > but some BUS fabrics convert the address before sending it to the PCIe EP
> > controller.
> >
> > Above diagram, CPU write data to outbound windows address 0x7000_0000,
> > Bus fabric convert it to 0x8000_0000. ATU should use BUS address
> > 0x8000_0000 as input address and convert to PCI address 0xA000_0000.
> >
> > Previously, `cpu_addr_fixup()` was used to handle address conversion. Now,
> > the device tree provides this information.
> >
> > The both pave the road to eliminate ugle cpu_fixup_addr() callback function.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Changes in v7:
> > - fix
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410291546.kvgEWJv7-lkp@intel.com/
> > - Link to v6: https://lore.kernel.org/r/20241028-pci_fixup_addr-v6-0-ebebcd8fd4ff@nxp.com
> >
> > Changes in v6:
> > - merge RC and EP to one thread!
> > - Link to v5: https://lore.kernel.org/r/20241015-pci_fixup_addr-v5-0-ced556c85270@nxp.com
> >
> > Changes in v5:
> > - update address order in diagram patches.
> > - remove confused 0x5f00_0000 range
> > - update patch1's commit message.
> > - Link to v4: https://lore.kernel.org/r/20241008-pci_fixup_addr-v4-0-25e5200657bc@nxp.com
> >
> > Changes in v4:
> > - Improve commit message by add driver source code path.
> > - Link to v3: https://lore.kernel.org/r/20240930-pci_fixup_addr-v3-0-80ee70352fc7@nxp.com
> >
> > Changes in v3:
> > - see each patch
> > - Link to v2: https://lore.kernel.org/r/20240926-pci_fixup_addr-v2-0-e4524541edf4@nxp.com
> >
> > Changes in v2:
> > - see each patch
> > - Link to v1: https://lore.kernel.org/r/20240924-pci_fixup_addr-v1-0-57d14a91ec4f@nxp.com
> >
> > ---
> > Frank Li (7):
> >       of: address: Add parent_bus_addr to struct of_pci_range
> >       PCI: dwc: Using parent_bus_addr in of_range to eliminate cpu_addr_fixup()
> >       PCI: dwc: ep: Add bus_addr_base for outbound window
> >       PCI: imx6: Remove cpu_addr_fixup()
> >       dt-bindings: PCI: fsl,imx6q-pcie-ep: Add compatible string fsl,imx8q-pcie-ep
> >       PCI: imx6: Pass correct sub mode when calling phy_set_mode_ext()
> >       PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
> >
> >  .../devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml | 38 ++++++++++++++-
> >  drivers/of/address.c                               |  2 +
> >  drivers/pci/controller/dwc/pci-imx6.c              | 46 +++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware-ep.c    | 21 ++++++++-
> >  drivers/pci/controller/dwc/pcie-designware-host.c  | 55 +++++++++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-designware.h       |  9 ++++
> >  include/linux/of_address.h                         |  1 +
> >  7 files changed, 148 insertions(+), 24 deletions(-)
> > ---
> > base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> > change-id: 20240924-pci_fixup_addr-a8568f9bbb34
> >
> > Best regards,
> > ---
> > Frank Li <Frank.Li@nxp.com>
> >

-- 
மணிவண்ணன் சதாசிவம்

