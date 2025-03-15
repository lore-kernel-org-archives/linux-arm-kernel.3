Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E8FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnTxTt9bxab/YmHebqr5xJsTlFtBmEyYRmxXsph8Yaw=; b=fnPHfuTYAPaSqd29cWYJpHK5Ti
	fhYU33nbT5qtyxk8Ck5VpEfVEujOfxpG49SAlWGX1kUqhDOXsZ9sQWSVrTQToIgzgCxWL5mxV5Pv1
	kwG34Ux649Hdsn3ju1C0nFpjtDW/MOHHAV+2pER1iEufyPnOQ2pN1K9PWmYa/n8YbfvQrlfraLx/A
	L0DNsez5zP1mep9H2GE00U5BipJoFKhOu1v6JebkB5wIhqXAdDra+lbwhvc1OA6mumjrkyvlFcbnI
	2BYTq20xAEMvqTt8Vku0bDFFG+vWx+0lkRcBqaHeQBuIUDHveueZwLJtYAeJTnt0UrHLaZ7scSNDO
	MmI184Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXxh-0000000Go5l-08zP;
	Sat, 15 Mar 2025 20:18:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvJ-0000000GnRE-27hl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA3F5A48B7C;
	Sat, 15 Mar 2025 20:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6D7C4CEE5;
	Sat, 15 Mar 2025 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069755;
	bh=XEoOzG46XXSFCigErs0BgukJPEtc5flcUfkUJgOgzIc=;
	h=From:To:Cc:Subject:Date:From;
	b=S9skukOwLYXwPWenoQ6yvLO7gET2V/b7mOX1ISf1RLNNW/Ym5CZ711TUYjp4DlpnA
	 ssV40YFRIJs4wYy+hhVzK7bEmm8GG9NLXEYSSTUWn+wLgTN6rIFPVIugDZhAA6qZPX
	 0nrODQlFO0hMfnqP8Og7F7TVXsWCw417DXBsYv6niXAmU4EdTZIDCiZ5BX3gShNz6Y
	 I1h3Syv/c4p1o5zLAMABoQvznM6i25Ec4JFXEG25mwHig2uP4IgPVfEjU2GgIYXZm9
	 ADL619FMCnMX+swWKpoVHA2jbjEz2DwqdVUWlfXjWyBn9dONEVuOOX8mx0t8h6ek8O
	 N3jmR2OBoMWUQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 00/13] PCI: Use device bus range info to cleanup RC Host/EP pci_fixup_addr()
Date: Sat, 15 Mar 2025 15:15:35 -0500
Message-Id: <20250315201548.858189-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131557_678171_52AABEEF 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

This is a v12 based on Frank's v11 series.

v11 https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com
    
Changes from v11:
  - Call devm_pci_alloc_host_bridge() early in dw_pcie_host_init(), before
    any devicetree-related code
  - Call devm_pci_epc_create() early in dw_pcie_ep_init(), before any
    devicetree-related code
  - Consolidate devicetree-related code in dw_pcie_host_get_resources() and
    dw_pcie_ep_get_resources()
  - Integrate dw_pcie_cfg0_setup() into dw_pcie_host_get_resources()
  - Convert dw_pcie_init_parent_bus_offset() to dw_pcie_parent_bus_offset()
    which returns the offset rather than setting it internally
  - Split the debug comparison of devicetree info with .cpu_addr_fixup() to
    separate patch so we can easily revert it later
  - Drop "cpu_addr_fixup() usage detected" warning since we always warn
    about something in that case anyway

Any comments welcome.


Bjorn Helgaas (3):
  PCI: dwc: Consolidate devicetree handling in
    dw_pcie_host_get_resources()
  PCI: dwc: ep: Call epc_create() early in dw_pcie_ep_init()
  PCI: dwc: ep: Consolidate devicetree handling in
    dw_pcie_ep_get_resources()

Frank Li (10):
  PCI: dwc: Use resource start as iomap() input in
    dw_pcie_pme_turn_off()
  PCI: dwc: Rename cpu_addr to parent_bus_addr for ATU configuration
  PCI: dwc: Call devm_pci_alloc_host_bridge() early in
    dw_pcie_host_init()
  PCI: dwc: Add dw_pcie_parent_bus_offset()
  PCI: dwc: Add dw_pcie_parent_bus_offset() checking and debug
  PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr
    offset
  PCI: dwc: ep: Use devicetree 'reg[addr_space]' to derive CPU -> ATU
    addr offset
  PCI: dwc: ep: Ensure proper iteration over outbound map windows
  PCI: dwc: Use parent_bus_offset to remove need for .cpu_addr_fixup()
  PCI: imx6: Remove cpu_addr_fixup()

 drivers/pci/controller/dwc/pci-imx6.c         | 18 +---
 .../pci/controller/dwc/pcie-designware-ep.c   | 74 +++++++++++------
 .../pci/controller/dwc/pcie-designware-host.c | 57 ++++++++-----
 drivers/pci/controller/dwc/pcie-designware.c  | 82 ++++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h  | 24 +++++-
 5 files changed, 171 insertions(+), 84 deletions(-)

-- 
2.34.1


