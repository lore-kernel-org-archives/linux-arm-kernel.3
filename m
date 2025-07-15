Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BC7C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DnKILW9uySvij0igSZMLj3M/sPtN3rANDvGp1XLZfmc=; b=LQrZVEk131UOi6
	7dJMGhA7Bk/5K+2ShcbSMUariEL/mYRhe3yNRhVs6P/FPqjNFUATodRagKdO2tg76seFVgSFDiqST
	ErpgxPHCXOUYWA8KLlVUme7y87vWIOXIrPbfIQoXeDu3yXnjP2E2qokNeMXtLZPfUN4O9sVEQK4+5
	nKnEYVJvthB9nnKsNETva2godcsVg6zrqih765famsUqwzy4xL1WF6+h295XOGuBJBmWsZF8JK52f
	95GT00c0NqerVMFdy1BSo8zfu9qN3hgyg654/ISf78dGR9arMGPz9bWpJ2NAD8bgPXyOiAWPL9hTz
	FXNvQPh1cAZWy3KExvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiQ5-00000005jVJ-2H8Y;
	Tue, 15 Jul 2025 16:22:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgvE-00000005Qsg-2guU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A80365C5A20;
	Tue, 15 Jul 2025 14:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3826DC4CEE3;
	Tue, 15 Jul 2025 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752590778;
	bh=KZ1W7mzel2tzyENmIY/KyfG+sQOyLDK8atG59n7g34U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nhOI4oOcjdEd81/BA+chqSa9l8uanzEnEhr+bgfqoi60EpD0cwakUJpbZX2fvZD9c
	 h0r1Tl3SHdyGUqyNniLCPaRBLWnhR4Mw4wlI0b9cxK2s7FO/4PCh/z68CLf37uqsbN
	 Ss57RFtoC1bv1VmoENClwao3WYlFrjJ6yC7SIvm9bi5akXlS/Oy+9OsgqHLoZsWQN+
	 aOS+cqX7rXhgqW0olOrGTZRfSSAUFdUoXJJXA1aV5LA9A12qLH5D2M+l2ZRGSowLbs
	 FUNKbLBEz/i0hS2tpLxxlwcQJOY2rIHFi2EcPvKl2lBHzOWGB1F27V57vVQ2nL9Xb7
	 ZNVpaMdVZGo+Q==
Date: Tue, 15 Jul 2025 09:46:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
Message-ID: <20250715144616.GA2458869@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_074620_761153_E9F481C3 
X-CRM114-Status: GOOD (  25.15  )
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

On Fri, May 30, 2025 at 02:19:09PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds a PCIe driver for the Renesas RZ/G3S SoC.
> It is split as follows:
> - patch 1/8:		updates the max register offset for RZ/G3S SYSC;
> 			this is necessary as the PCIe need to setup the
> 			SYSC for proper functioning
> - patch 2/8:		adds clock, reset and power domain support for
> 			the PCIe IP
> - patches 3-4/8:	add PCIe support for the RZ/G3S SoC
> - patches 5-8/8:	add device tree support and defconfig flag
> 
> Please provide your feedback.
> 
> Merge strategy, if any:
> - patches 1-2,5-8/8 can go through the Renesas tree
> - patches 3-4/8 can go through the PCI tree
> 
> Thank you,
> Claudiu Beznea
> 
> Changes in v2:
> - dropped "of/irq: Export of_irq_count()" as it is not needed anymore
>   in this version
> - added "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
>   to reflect the board specific memory constraints
> - addressed review comments
> - updated patch "soc: renesas: rz-sysc: Add syscon/regmap support"
> - per-patch changes are described in each individual patch
> 
> Claudiu Beznea (7):
>   clk: renesas: r9a08g045: Add clocks, resets and power domain support
>     for the PCIe
>   dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the
>     PCIe IP on Renesas RZ/G3S
>   PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
>   arm64: dts: renesas: r9a08g045s33: Add PCIe node
>   arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>   arm64: dts: renesas: rzg3s-smarc: Enable PCIe
>   arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
> 
> John Madieu (1):
>   soc: renesas: rz-sysc: Add syscon/regmap support
> 
>  .../pci/renesas,r9a08g045s33-pcie.yaml        |  202 ++
>  MAINTAINERS                                   |    8 +
>  arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi |   60 +
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |    5 +
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/clk/renesas/r9a08g045-cpg.c           |   19 +
>  drivers/pci/controller/Kconfig                |    7 +
>  drivers/pci/controller/Makefile               |    1 +
>  drivers/pci/controller/pcie-rzg3s-host.c      | 1686 +++++++++++++++++
>  drivers/soc/renesas/Kconfig                   |    1 +
>  drivers/soc/renesas/r9a08g045-sysc.c          |   10 +
>  drivers/soc/renesas/r9a09g047-sys.c           |   10 +
>  drivers/soc/renesas/r9a09g057-sys.c           |   10 +
>  drivers/soc/renesas/rz-sysc.c                 |   17 +-
>  drivers/soc/renesas/rz-sysc.h                 |    3 +
>  16 files changed, 2050 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>  create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

Where are we at with this series?

I see
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-stm32&id=5a972a01e24b278f7302a834c6eaee5bdac12843,
but also this kernel robot report at that commit:
https://lore.kernel.org/all/202506270620.sf6EApJY-lkp@intel.com/

I normally don't include branches in pci/next until we get a
"BUILD SUCCESS" report from the robot, so this branch is in limbo at
the moment.

Bjorn

