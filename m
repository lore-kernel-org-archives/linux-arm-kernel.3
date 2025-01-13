Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE70E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=giLrDB11eqGbyZwh4Ted4RM4uqLNFjufLmCxToegUpI=; b=PuYHkpWJJ6cru1hnJCGyYcdz9L
	R7/dCYhDtUnEip0Csg4goTn/ryhV2+s6LtEfNohSg2teg5rRj4bttPeqULXqfRjSp7v5dHurXqpbl
	cNiOgbDT7EYUBg35DQVBqtcqs+QWSwpHmg0gWKAa/4/IPkX4p6iHWIkl3HHv+bk1QiFNA2zWzUr7z
	cDgeDuu1W+j0eGgmr5lo1LP/LxCT2ibtyCo1pKS4gPlZ6ePVHH+jDLMLQSCwkWlLN4PH80zmoHZE1
	K5o7av+HvZ5F0PzxKc0gVQENjsg0hRq4pjxl2/usmbVUmlWdhB0Vk2mZLujDt00EPYqX3FezvBcok
	c0nFZgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHh0-00000004msK-13L2;
	Mon, 13 Jan 2025 10:29:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHfm-00000004med-0Gug;
	Mon, 13 Jan 2025 10:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42D555C4860;
	Mon, 13 Jan 2025 10:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71FAC4CED6;
	Mon, 13 Jan 2025 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736764072;
	bh=CjA961n7thifjHeeT8f/0KEw4480OgyCf9lH69QrF2g=;
	h=From:To:Cc:Subject:Date:From;
	b=rK9dGLgjxIhZoQjmEAH0qqcYwp32TnsmUlNd9pyx07TeJP+YcdOuUa4GBpaQJa5WZ
	 iHMSRwa7z6JuyjxWWwV6brWGrUHECfsEz5T3u2HhyEcQeB6UJZ0V3tENdBBgESs4ws
	 zZuHDNAZDiaoN1bODQaSXayxOvc3TF8d9rGsLm3u5uSeKCd6XrXO4D1pamNistJFi1
	 dQ66yON6Q2WPq+F83dkOXgCv+6NA4jRHndyH0c9daBMAkPeEIqjd3Kgs/J/YJtE/8j
	 369sx6zkzlfDJ7gQ0c3s76hBeDhDfCrhsmIjhDOA/y6O+8PAZlkUVhn3WPXJgzadmd
	 pZ288373NH6pA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/6] PCI: endpoint: Add support for resizable BARs
Date: Mon, 13 Jan 2025 11:27:31 +0100
Message-ID: <20250113102730.1700963-8-cassel@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; i=cassel@kernel.org; h=from:subject; bh=CjA961n7thifjHeeT8f/0KEw4480OgyCf9lH69QrF2g=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJbXk0+Ep3juWN+dJYl42fB+5+Ed0UbXVI8FVks0py10 PvSNq6VHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZhI3GdGhomOS2N4b1/O/1al f1AwNvBz5t32R9/mXTDf9jTK73h03CuG/9GhmQ+tbqydJZZx2caXefaHjck3L2zj31OrISC2zYl ZlgEA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_022754_190281_2BFF8501 
X-CRM114-Status: GOOD (  13.18  )
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

The PCI endpoint framework currently does not support resizable BARs.

Add a new BAR type BAR_RESIZABLE, so that EPC drivers can support resizable
BARs properly.

For a resizable BAR, we will only allow a single supported size.
This is by design, as we do not need/want the complexity of the host side
resizing our resizable BAR.

In the DWC driver specifically, the DWC driver currently handles resizable
BARs using an ugly hack where a resizable BAR is force set to a fixed size
BAR with 1 MB size if detected. This is bogus, as a resizable BAR can be
configured to sizes other than 1 MB.

With these changes, an EPF driver will be able to call pci_epc_set_bar()
to configure a resizable BAR to an arbitrary size, just like for
BAR_PROGRAMMABLE. Thus, DWC based EPF drivers will no longer be forced to
a bogus 1 MB forced size for resizable BARs.


Tested/verified on a Radxa Rock 5b (rk3588) by:
-Modifying pci-epf-test.c to request BAR sizes that are larger than 1 MB:
 -static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
 +static size_t bar_size[] = { SZ_1M, SZ_1M, SZ_2M, SZ_2M, SZ_4M, SZ_4M };
 (Make sure to set CONFIG_CMA_ALIGNMENT=10 such that dma_alloc_coherent()
  calls are aligned even for allocations larger than 1 MB.)
-Rebooting the host to make sure that the DWC EP driver configures the BARs
 correctly after receiving a link down event.
-Modifying EPC features to configure a BAR as 64-bit, to make sure that we
 handle 64-bit BARs correctly.
-Modifying the DWC EP driver to set a size larger than 2 GB, to make sure
 we handle BAR sizes larger than 2 GB (for 64-bit BARs) correctly.
-Running the consecutive BAR test in pci_endpoint_test.c to make sure that
 the address translation works correctly.


Texas Instruments kernel developers, if would be very nice if you could
help out with testing on Keystone.


Changes since V2:
-When looping in dw_pcie_ep_init_non_sticky_registers(), use the index
 that we read from PCI_REBAR_CTRL (e.g. a platform could have BARs 0-2
 as programmable, and BARs 3-5 resizable, so we need to read the index).


Kind regards,
Niklas

Niklas Cassel (6):
  PCI: endpoint: Add BAR type BAR_RESIZABLE
  PCI: dwc: ep: Move dw_pcie_ep_find_ext_capability()
  PCI: dwc: endpoint: Add support for BAR type BAR_RESIZABLE
  PCI: keystone: Describe resizable BARs as resizable BARs
  PCI: keystone: Specify correct alignment requirement
  PCI: dw-rockchip: Describe resizable BARs as resizable BARs

 drivers/pci/controller/dwc/pci-keystone.c     |   6 +-
 .../pci/controller/dwc/pcie-designware-ep.c   | 231 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  22 +-
 drivers/pci/endpoint/pci-epf-core.c           |   4 +
 include/linux/pci-epc.h                       |   3 +
 5 files changed, 219 insertions(+), 47 deletions(-)

-- 
2.47.1


