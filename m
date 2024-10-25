Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48240D149F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4kMK+WOZrkOl7ZxRO0QRYVsE0xd+BFqoTk/YOmM72AU=; b=RnzTI/F75XzFDrFCfRq/XjwIuN
	WY5lORYnJ5g1UHhSTUJbLKKGP6pAwBDPWuk6nJbP6tulfTHGrXiZYknkaXgCF2qNsRyz0cOFQ64/h
	q3jdZUM/c0gtEK6RgYzet5Ea3jpikpMIYqycwyAdL3jEbIXzAWAprXYVk57TwB8oLt6Hm5wPKadV5
	WLZJpYa+8hUUVrctYvoSmudPHg5+x+CRmg38K2qFvakRkNv9Af1HPNrqT77kkNR0Qw088oWQJp5A5
	UN51zewP/PJKrOLe5wuct9SAi+x2m1A5ISxll2O25T084swPpeCDiC+JIGGA6cAJ+82OThJQ63Cme
	kKI65n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RGn-00000005Bzx-2sEP;
	Fri, 25 Oct 2024 20:50:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4REM-00000005BGM-3NE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 20:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BEA0FA430C4;
	Fri, 25 Oct 2024 20:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899B8C4CEC3;
	Fri, 25 Oct 2024 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729889300;
	bh=Qa6XR9RW2tuGLCT9wz9qCCFF4BPpg05WsUdkaKPe9fc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=O0JoU/czSmbl+S8+9DjdgPrBH4OmStTDDTzQIXwjc/OMHpIXfOrQFB4U6ZVqzv0xf
	 F1MBOFsMXtjYe4DoZdxBedNzkL7+2ieGaLLZK+yuVaTzyVti3Exkg4lm0TkWNnnr1f
	 huLA4gDA4gUde3lNmzInCEadt86mhXxFsWeoUuL5kuu+N9hoYpz9Awaedcotpo98ol
	 eRikEEuML8bhWNUsDjWgoM+NGO04UqXJwse0KOc43uQAa88h5Nqm+UlXR4wI4IE5b0
	 s7TfTXzVRq2ntiZbmQOHmiBI0TxH1+Tuf+umrAbPcjDQTfMzZ6vhiFMBVibpuuY/H6
	 J/ZkDfqrihYTQ==
Date: Fri, 25 Oct 2024 15:48:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] PCI: ep: dwc/imx6: Add bus address support for
 PCI endpoint devices
Message-ID: <20241025204818.GA1028925@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024-pcie_ep_range-v4-0-08f8dcd4e481@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_134823_010248_B6DB698D 
X-CRM114-Status: GOOD (  24.16  )
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

On Thu, Oct 24, 2024 at 04:41:42PM -0400, Frank Li wrote:
> Endpoint          Root complex
>                              ┌───────┐        ┌─────────┐
>                ┌─────┐       │ EP    │        │         │      ┌─────┐
>                │     │       │ Ctrl  │        │         │      │ CPU │
>                │ DDR │       │       │        │ ┌────┐  │      └──┬──┘
>                │     │◄──────┼─ATU ◄─┼────────┼─┤BarN│◄─┼─────────┘
>                │     │       │       │        │ └────┘  │ Outbound Transfer
>                └─────┘       │       │        │         │
>                              │       │        │         │
>                              │       │        │         │
>                              │       │        │         │ Inbound Transfer
>                              │       │        │         │      ┌──▼──┐
>               ┌───────┐      │       │        │ ┌───────┼─────►│DDR  │
>               │       │ outbound Transfer*    │ │       │      └─────┘
>    ┌─────┐    │ Bus   ┼─────►│ ATU  ─┬────────┼─┘       │
>    │     │    │ Fabric│Bus   │       │ PCI Addr         │
>    │ CPU ├───►│       │Addr  │       │ 0xA000_0000      │
>    │     │CPU │       │0x8000_0000   │        │         │
>    └─────┘Addr└───────┘      │       │        │         │
>           0x7000_0000        └───────┘        └─────────┘
> 
> Add `bus_addr_base` to configure the outbound window address for CPU write.
> The BUS fabric generally passes the same address to the PCIe EP controller,
> but some BUS fabrics convert the address before sending it to the PCIe EP
> controller.
> 
> Above diagram, CPU write data to outbound windows address 0x7000_0000,
> Bus fabric convert it to 0x8000_0000. ATU should use BUS address
> 0x8000_0000 as input address and convert to PCI address 0xA000_0000.

The above doesn't match what's in patch 1/4, and I think the version
in 1/4 is better, so I'll comment there.

To avoid confusion, it might be better not to duplicate it in 0/4 and
1/4.

> Previously, `cpu_addr_fixup()` was used to handle address conversion. Now,
> the device tree provides this information, preferring a common method.
> 
> bus@5f000000 {
> 	compatible = "simple-bus";
> 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
> 	pcie-ep@5f010000 {
> 		reg = <0x5f010000 0x00010000>,
> 		      <0x80000000 0x10000000>;
> 		reg-names = "dbi", "addr_space";
> 		...
> 	};
> 	...
> };
> 
> 'ranges' in bus@5f000000 descript how address convert from CPU address
> to BUS address.
> 
> Use `of_property_read_reg()` to obtain the BUS address and set it to the
> ATU correctly, eliminating the need for vendor-specific cpu_addr_fixup().
> 
> The 1st patch implement above method in dwc common driver.
> The 2nd patch update imx6's binding doc to add fsl,imx8q-pcie-ep.
> The 3rd patch fix a pci-mx6's a bug
> The 4th patch enable pci ep function.
> 
> The imx8q's dts is usptreaming, the pcie-ep part is below.
> 
> hsio_subsys: bus@5f000000 {
>         compatible = "simple-bus";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         /* Only supports up to 32bits DMA, map all possible DDR as inbound ranges */
>         dma-ranges = <0x80000000 0 0x80000000 0x80000000>;
>         ranges = <0x5f000000 0x0 0x5f000000 0x01000000>,
>                  <0x80000000 0x0 0x70000000 0x10000000>;
> 
> 	pcieb_ep: pcie-ep@5f010000 {
>                 compatible = "fsl,imx8q-pcie-ep";
>                 reg = <0x5f010000 0x00010000>,
>                       <0x80000000 0x10000000>;
>                 reg-names = "dbi", "addr_space";
>                 num-lanes = <1>;
>                 interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
>                 interrupt-names = "dma";
>                 clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
>                          <&pcieb_lpcg IMX_LPCG_CLK_4>,
>                          <&pcieb_lpcg IMX_LPCG_CLK_5>;
>                 clock-names = "dbi", "mstr", "slv";
>                 power-domains = <&pd IMX_SC_R_PCIE_B>;
>                 fsl,max-link-speed = <3>;
>                 num-ib-windows = <6>;
>                 num-ob-windows = <6>;
>         };
> };
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - Fix 32bit build error
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410230328.BTHareG1-lkp@intel.com/
> - Link to v3: https://lore.kernel.org/r/20241021-pcie_ep_range-v3-0-b13526eb0089@nxp.com
> 
> Changes in v3:
> - Add mani' review tag for patch 3,4
> - Add varible using_dtbus_info to control use bus range information instead
> cpu_address_fixup().
> - Link to v2: https://lore.kernel.org/r/20240923-pcie_ep_range-v2-0-78d2ea434d9f@nxp.com
> 
> Changes in v2:
> - Totally rewrite with difference method. 'range' should in bus node
> instead pcie-ep node because address convert happen at bus fabric. Needn't
> add 'range' property at pci-ep node.
> - Link to v1: https://lore.kernel.org/r/20240919-pcie_ep_range-v1-0-b3e9d62780b7@nxp.com
> 
> ---
> Frank Li (4):
>       PCI: dwc: ep: Add bus_addr_base for outbound window
>       dt-bindings: PCI: fsl,imx6q-pcie-ep: Add compatible string fsl,imx8q-pcie-ep
>       PCI: imx6: Pass correct sub mode when calling phy_set_mode_ext()
>       PCI: imx6: Add i.MX8Q PCIe Endpoint (EP) support
> 
>  .../devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml | 38 +++++++++++++++++++++-
>  drivers/pci/controller/dwc/pci-imx6.c              | 26 ++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware-ep.c    | 14 +++++++-
>  drivers/pci/controller/dwc/pcie-designware.h       |  9 +++++
>  4 files changed, 84 insertions(+), 3 deletions(-)
> ---
> base-commit: afb15ca28055352101286046c1f9f01fdaa1ace1
> change-id: 20240918-pcie_ep_range-4c5c5e300e19
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 

