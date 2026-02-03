Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A77E7FDE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+2XTSPZI0r7r0xxXuEFfDuh4AMy4Nmaw4oOpOLhAvXI=; b=uM2cQi5aoqRF9XlFS41u9Ig/WC
	rJe59KsYfUp6J8RKu8ASo7E5zfJ3V2VHeVDYr1alpdj6S6QO7wn35cuKjuIf9An2Tii49H0L74K/I
	rAiRG3l6WKyeXfXTuH4JIVtG9nAB0zi6vWdNsN8oXYHWkj7+aBIm1S1cJCPPFlAaGqgIiAS3euw97
	cVbB3qjE84qWz7s4ChTx0yw7GP1Jp0VrJPT51+I5Ss0Dk0/En9m4h5SBgrUsRsVeUbSJNYdxFzAzp
	aD0fhC832THIjrwf1MLL1BaNjyNn74glGy/SFEjAT5rBXqXl80F5qVhytvMW5lf9M0kVpZPi36uJo
	HIjrM5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4Az-00000005mgk-1igR;
	Tue, 03 Feb 2026 00:21:53 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4Aw-00000005mev-1R6P;
	Tue, 03 Feb 2026 00:21:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2XTSPZI0r7r0xxXuEFfDuh4AMy4Nmaw4oOpOLhAvXI=;
	b=FJ6tOz39ef3x9lh948TOCFUoh+KaPWT5sVuHy7f6TNRN961P6OhIhTYx8BzBhwsRkuCnIk
	7ZX4HfvTe1DCCbScLcc5RJgoTVjeyK+cLEbgABoOu2v2hblyR4dfOFPbvuwTb1AuLaSmVc
	G8bsfPUu8zZv8/2dra5Tpp53PzK7PvE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/8] phy: zynqmp: Perform complete initialization, including ILL calibration
Date: Mon,  2 Feb 2026 19:21:20 -0500
Message-Id: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162150_542360_A9BDB057 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

This series completely initializes the GTRs in Linux, making all
bootloader initialization (as performed by init_serdes() in
psu_init_gpl.c) optional. This gives the following advantages:

- On some boards (mine) the reference clocks may not be configured in
  SPL/FSBL. So ILL calibration will fail (and take a long time to do so)
  unless we defer initialization to U-Boot/Linux where the phy driver
  can request the clocks.
- If PCIe/SATA are not used in U-Boot, ILL calibration can be deferred
  until Linux when it can be done it parallel with other initialization.
- We will have flexibility to switch between different configurations at
  runtime. For example, this could allow supporting both SATA and PCIe M.2
  cards with [1].

I have tested this series with DP, PCIe, SGMII, and SATA. USB3 is broken
on my dev board at the moment (independent of this series; need to
investigate) so I have not tested that. I have an equivalent set of
patches for U-Boot that I will try to post soon.

[1] https://lore.kernel.org/linux-pci/20260107-pci-m2-v5-0-8173d8a72641@oss.qualcomm.com/


Sean Anderson (8):
  dt-bindings: pci: xilinx-nwl: Add resets
  phy: zynqmp: Refactor bus width configuration into helper
  phy: zynqmp: Refactor common phy initialization into a helper
  phy: zynqmp: Calibrate ILL if necessary
  phy: zynqmp: Initialize chicken bits
  PCI: xilinx-nwl: Split phy_init from phy_power_on
  PCI: xilinx-nwl: Reset the core during probe
  arm64: zynqmp: Add PCIe resets

 .../bindings/pci/xlnx,nwl-pcie.yaml           |  17 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   4 +
 drivers/pci/controller/pcie-xilinx-nwl.c      | 255 +++++++--
 drivers/phy/xilinx/phy-zynqmp.c               | 487 +++++++++++++++++-
 4 files changed, 713 insertions(+), 50 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


