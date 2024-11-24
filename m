Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6ADE668B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXCY6EyQ5ICJyfv/tJQrr5Lem3XCz+vNyHRaV4HuQGs=; b=2CShNfMfjWrxpt7vs1qfhu8fxq
	Cs0tzJmRGuqy0w3bSoK11ELDV5Ri7iENlw5yFuoPU148MjUiPj4mPl7xnSGHHxkR50oK/Tm1Bd2pu
	ONModafkn7MytJ+GHvQDDF0zeKOWxhSfPRvY+OtNFOlLxy/7+QJxl8blqWsGaMUryYxBC+rU7jygQ
	yv2zlV9AIZtVMuc/nkv3EklfHh1OLfduqJGvsBgAcN2M64l6Sxbqo4cA1i6aricoKv0PkkHrw+9PD
	MqImhYYjz5b324z78qEPSnvEXOyp9aTbsOGpzQt/PLZpwWhqjVUZEOGUsv7asICrpd9yobcX3h9zY
	pWoB20mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFDm9-000000068E9-14l0;
	Sun, 24 Nov 2024 14:39:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFDlB-0000000685l-2RrH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 14:38:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso1674342b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 06:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732459128; x=1733063928; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXCY6EyQ5ICJyfv/tJQrr5Lem3XCz+vNyHRaV4HuQGs=;
        b=Yp1W0bFqR0F7N2ZG5DSo6rfzTS5GIFizMiXcogPqlA+XPjXCGsRygwx0FbnIwNbGZX
         WemhIhsZ+5DRaVFHp5tJT4B5jx9vKVFWPC32KJyucC8qI/A0yPkuk+F5FZMTEDquZ7hs
         tVgLKtLvsjDo7bgo9HkDM1Cd8naSeIOwHPZfEtHRopBe4QEuaKIS6WS9fymr6L/jA8Hx
         ohVZAKhkqxpJopPmdmtmZKCkS7A68jZ6pKxiZDxtbKV9BfEFshwXgoxrScPF65nPjgud
         p5J255GbBKWP7lpKowPIt8KRMAG2ygyqPcR4waKOSV8M9dNIsCV59PToBVeNip/rVKM+
         z1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732459128; x=1733063928;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXCY6EyQ5ICJyfv/tJQrr5Lem3XCz+vNyHRaV4HuQGs=;
        b=cZVqo2j59KVVAyNzp0WpvXFIOTz4hCnmETU7II93vtZYt6Ee3yKoeKYLVHeAG9uccj
         lncJcDnD9Nv/JOwCxH+Fk8xn/OPxdrad7reERD6bZhbOw8ILG1JXgH/pNOfhaah1HaGG
         a4h7d/3qOz7DZI2UWXquJLnr4KyZf+Perry08JJKWmekiK45B6Zdlndkzox/YtfH3CNL
         3LbDu2DAX+r0UBObCRClAn2+8kF/8RHc5mSW1Qhw+7E69xm4nkceC4rcQrve9D5+jffv
         rV3UylZ2fSf/jkyUxEnMQHctWqxzxbmn+8LmVB6q4cG3fosQWBMVSAxFTYSZC3/8VPpa
         2AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg6SNZnIjVGkgjFLIZLbN3dmLuFhrqrJ7Oqx6BLcogwBUm3RHbJlNQvH8xXno0mFkqc0kBY5chxe2Hj1A3P/5G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7nYNBg1KClsuSqTcQtc6CI0VshMm4fZQy0/Y28JxJzDkUSdZE
	qB98RBfi4VZMRRuhba5Wc8Yuag32VfZHD8jY1Uqj22hUTU2Sp0qu5Xsgt0J9Kg==
X-Gm-Gg: ASbGncuk9kBxUa2WwhjGtrL0Y7DxycV+q8UGPS7tf9kXMyaNPCrSM5gtgdUNBaFfdnB
	Nn5EsDhfUzPcNcgzUtgPic3i14aJjLFD6FYQZGH1YbxFcdgMP19GU19KGQl5CahfvFg0Fv/36rQ
	a+tYgN4C5gx4bYVHReNhVaMrfy7vQNW8Rj6QzF2Enzr0LNs0OtHXLXs78OJJnR3pM2+N9G88+V0
	R8ugTzzhKCL9z9irnNQoYZIdrZc+y9RfcUUzVcTgbSOlmp3VCExiDQF1Tel
X-Google-Smtp-Source: AGHT+IGUYdNBQyl/4X7lky6FWTh3PlUIHJNEByI3IDGXwvkIIW1v1nfc0TsyL72NMdiksJeZISQVKA==
X-Received: by 2002:a05:6a00:1709:b0:71e:98a:b6b4 with SMTP id d2e1a72fcca58-724df5ef7f8mr10750073b3a.11.1732459128405;
        Sun, 24 Nov 2024 06:38:48 -0800 (PST)
Received: from thinkpad ([36.255.17.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de532d59sm4653362b3a.130.2024.11.24.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 06:38:47 -0800 (PST)
Date: Sun, 24 Nov 2024 20:08:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
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
Subject: Re: [PATCH v8 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <20241124143839.hg2yj462h22rftqa@thinkpad>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_063850_452998_F232D212 
X-CRM114-Status: GOOD (  28.21  )
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

On Tue, Nov 19, 2024 at 02:44:18PM -0500, Frank Li wrote:
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
> 

Series looks good to me. Thanks a lot for your persistence! But it missed 6.13
cycle. So let's get it merged early once 6.13-rc1 is out.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v8:
> - Add mani's review tages
> - use rename use_dt_ranges to use_parent_dt_ranges
> - Add dev_warn_once to reminder to fix their dt file and remove
> cpu_fixup_addr() callback.
> - rename dw_pcie_get_untranslate_addr() to dw_pcie_get_parent_addr()
> - Link to v7: https://lore.kernel.org/r/20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com
> 
> Changes in v7:
> - fix
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410291546.kvgEWJv7-lkp@intel.com/
> - Link to v6: https://lore.kernel.org/r/20241028-pci_fixup_addr-v6-0-ebebcd8fd4ff@nxp.com
> 
> Changes in v6:
> - merge RC and EP to one thread!
> - Link to v5: https://lore.kernel.org/r/20241015-pci_fixup_addr-v5-0-ced556c85270@nxp.com
> 
> Changes in v5:
> - update address order in diagram patches.
> - remove confused 0x5f00_0000 range
> - update patch1's commit message.
> - Link to v4: https://lore.kernel.org/r/20241008-pci_fixup_addr-v4-0-25e5200657bc@nxp.com
> 
> Changes in v4:
> - Improve commit message by add driver source code path.
> - Link to v3: https://lore.kernel.org/r/20240930-pci_fixup_addr-v3-0-80ee70352fc7@nxp.com
> 
> Changes in v3:
> - see each patch
> - Link to v2: https://lore.kernel.org/r/20240926-pci_fixup_addr-v2-0-e4524541edf4@nxp.com
> 
> Changes in v2:
> - see each patch
> - Link to v1: https://lore.kernel.org/r/20240924-pci_fixup_addr-v1-0-57d14a91ec4f@nxp.com
> 
> ---
> Frank Li (7):
>       of: address: Add parent_bus_addr to struct of_pci_range
>       PCI: dwc: Use devicetree 'ranges' property to get rid of cpu_addr_fixup() callback
>       PCI: dwc: ep: Add bus_addr_base for outbound window
>       PCI: imx6: Remove cpu_addr_fixup()
>       dt-bindings: PCI: fsl,imx6q-pcie-ep: Add compatible string fsl,imx8q-pcie-ep
>       PCI: imx6: Pass correct sub mode when calling phy_set_mode_ext()
>       PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
> 
>  .../devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml | 38 ++++++++++++++-
>  drivers/of/address.c                               |  2 +
>  drivers/pci/controller/dwc/pci-imx6.c              | 46 +++++++++--------
>  drivers/pci/controller/dwc/pcie-designware-ep.c    | 18 ++++++-
>  drivers/pci/controller/dwc/pcie-designware-host.c  | 57 +++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.c       |  9 ++++
>  drivers/pci/controller/dwc/pcie-designware.h       |  8 +++
>  include/linux/of_address.h                         |  1 +
>  8 files changed, 155 insertions(+), 24 deletions(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20240924-pci_fixup_addr-a8568f9bbb34
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

