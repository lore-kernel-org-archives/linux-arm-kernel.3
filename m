Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93776C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMB8qrzvCzG2dzY3o75tbMmVvOToCBUcaj6Q1+VQd8k=; b=2aUmGFtofltWzP+hRmD4JG0NEb
	6ZD2dOJHkVvPY4GVdFEkaS4BZAgSMSl7K/W/FLr90pmxNxrjFMIXZnWiyel1lpctHNXfbN1eCKZqh
	gadwuLYxDWzp1eSTITwP5neC/DPZDKX4OClMxxizLL7iZnOM3IABU9qX+KD4En/5V4boWe2yrQj56
	ZZvXyIPuGc6shOvhSelBg+DpDoAYX8PtZHVFOUffqZS8zNkBRlVg38M/Ak5J/t3IcZ0HhdHg5M6RI
	NjFrxMiSLfnMDjQor1OqioZeHJWlkeHVzDHqBOZTKM7zIw1EqT3HAp59RDH3wsxjJ++w8e8OBxc70
	4bG7iRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9CV-0000000E9uf-2mkd;
	Fri, 11 Jul 2025 08:33:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Ru-0000000E1EW-28LU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D646B6115D;
	Fri, 11 Jul 2025 07:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA952C4CEED;
	Fri, 11 Jul 2025 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219937;
	bh=gpOEXh/tkkdMvtKnEFy+UBpnu0hmbuwIrGzuHPvq4sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0+Xv5Xl46ARoxRuBAaUWmx+tLBkwAcZ3S4k9GUD4qOrdj9uB9Md+LgH7ZcksYDR6
	 mStpaawxXo5K02FGAwzNYZ4ns3h3V0u9IQFDN6ozeim1zg1ZjdZDe98sLyeZdlOXhh
	 EL7aFlqhUBNTmJiWUAgbkmQ72rVKbJpZNL5kr2IreoSBqMgkZBv+/h0iBotkztuIpu
	 VhYXsUzT29yMClmmATnBEDwdp9bBfRbSl7mt6t7a57ZnuwPShB8+SDAIL0rPruh3TU
	 IL6sltjrYxDFiU+o6o1GDCNaLYfRSyB9iBjQzZeD0kTTIPsaJyT9CJNj7FARpbjQFl
	 DS/dzbEISNUsA==
Date: Fri, 11 Jul 2025 09:45:28 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Frank.Li@nxp.com
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 0/9] PCI: EP: Add RC-to-EP doorbell with platform MSI
 controller
Message-ID: <aHDBGDFnYZF_2luF@ryzen>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
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

On Thu, Jul 10, 2025 at 03:13:46PM -0400, Frank Li via B4 Relay wrote:
> Frank Li (9):
>       PCI: imx6: Add helper function imx_pcie_add_lut_by_rid()
>       PCI: imx6: Add LUT configuration for MSI/IOMMU in Endpoint mode
>       PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller
>       PCI: endpoint: pci-ep-msi: Add MSI address/data pair mutable check
>       PCI: endpoint: Add pci_epf_align_inbound_addr() helper for address alignment
>       PCI: endpoint: pci-epf-test: Add doorbell test support
>       misc: pci_endpoint_test: Add doorbell test case
>       selftests: pci_endpoint: Add doorbell test case
>       arm64: dts: imx95: Add msi-map for pci-ep device
> 
>  Documentation/PCI/endpoint/pci-test-howto.rst      |  14 +++
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   1 +
>  drivers/misc/pci_endpoint_test.c                   |  85 ++++++++++++-
>  drivers/pci/controller/dwc/pci-imx6.c              |  25 ++--
>  drivers/pci/endpoint/Kconfig                       |   8 ++
>  drivers/pci/endpoint/Makefile                      |   1 +
>  drivers/pci/endpoint/functions/pci-epf-test.c      | 136 +++++++++++++++++++++
>  drivers/pci/endpoint/pci-ep-msi.c                  |  98 +++++++++++++++
>  drivers/pci/endpoint/pci-epf-core.c                |  36 ++++++
>  include/linux/pci-ep-msi.h                         |  28 +++++
>  include/linux/pci-epf.h                            |  18 +++
>  include/uapi/linux/pcitest.h                       |   1 +
>  .../selftests/pci_endpoint/pci_endpoint_test.c     |  28 +++++
>  13 files changed, 470 insertions(+), 9 deletions(-)
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20241010-ep-msi-8b4cab33b1be
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 
> 

Tested on rock5b (which uses the rk3588 SoC), by adding the same msi-map to
the pcie3x4_ep DT node as (what already exists in) the pcie3x4 (RC) DT node:

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 90414486e466..c0121aea791d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -389,6 +389,7 @@ pcie3x4_ep: pcie-ep@fe150000 {
                interrupt-names = "sys", "pmc", "msg", "legacy", "err",
                                  "dma0", "dma1", "dma2", "dma3";
                max-link-speed = <3>;
+               msi-map = <0x0000 &its1 0x0000 0x1000>;
                num-lanes = <4>;
                phys = <&pcie30phy>;
                phy-names = "pcie-phy";


The new selftest passes:
#  RUN           pcie_ep_doorbell.DOORBELL_TEST ...
#            OK  pcie_ep_doorbell.DOORBELL_TEST
ok 17 pcie_ep_doorbell.DOORBELL_TEST


Thus:
Tested-by: Niklas Cassel <cassel@kernel.org>

