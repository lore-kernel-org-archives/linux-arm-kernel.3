Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA38C02193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FPIUwICF6R53Y8gLgoq6cCGzn1O/NbAK9+8HzbaNX2E=; b=4c/gDy/lOq9CxkoJSTc8WIXwUV
	y9knfX6Pr4wR6g7ZGjXHFGlpiKUPFBvj3WOBfM973JZ7/Z9Pjl3ZjEzz+kp2dSy32WSFVyVn1WdAO
	XfpJrlONj78pdKysnG1vwnZYy/xupMwvni5Cv1YGsS7aG0t9VnG/v39/0p4XoIuYy15Vo0kHySKAZ
	+JlDY1M2PyOgOI4Bm8aZvQBeiHtLA4P9x/vXw3dvPVvOuV3iLMFi4ebiRATyWxGQ6Z+rNtbWG0WBk
	Zw+s+BUbe9j1q9uNC3JytlUsrSGhcYps5FUe0rgmNnKheaRfzvDsb6cceyAP/N3Q8IWjD4+zZHQdp
	8+5+p84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvnq-0000000BDPd-1Tth;
	Fri, 31 Jan 2025 18:31:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvmV-0000000BD4N-0oLm;
	Fri, 31 Jan 2025 18:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5374F5C6367;
	Fri, 31 Jan 2025 18:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2D3C4CED3;
	Fri, 31 Jan 2025 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738348218;
	bh=x1/ZVTQMmRVVIFw2D8Gr10vnmzAC84NLSgrZVeSMY4k=;
	h=From:To:Cc:Subject:Date:From;
	b=dJEZSktz5FLTnjBKggCmDQ+cF20eNIvEicD8Qri2LrNwp1nBYz62AcoRip0qmZEUv
	 g4mluErZ0wUSKrq328HmKOzJG4an0GZrkkSo2Kcs8iYlU+qwBUVM9niRd0FaDBp1Bf
	 LNA8ci6vkIgu+RNXdak7ofjwTdwwe50KfVWw+AqxQgy40Gon9VsLqPhqK1nwvPGRec
	 /TqOOnzceSs7rPhgY2NhdYLVAxy93nCLISjUcckTgQwal1gjDS9Ch55US3u6Ugsdof
	 LtMNkvRR0G8xrRVtOi9fBszxeeEFeV+TlamXqIxMZAFCmlx4gRC4hoC0TpwQVBE3ZD
	 njMF+arfTIrng==
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
Subject: [PATCH v4 0/7] PCI: endpoint: Allow EPF drivers to configure the size of Resizable BARs
Date: Fri, 31 Jan 2025 19:29:49 +0100
Message-ID: <20250131182949.465530-9-cassel@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2780; i=cassel@kernel.org; h=from:subject; bh=x1/ZVTQMmRVVIFw2D8Gr10vnmzAC84NLSgrZVeSMY4k=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNLnis29v4317lKnK6de7N60dwaL4S0GWwuuaFPRWyVZV 51XdRnf6ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBEDu1k+Gcn8CNCyEhi58+e lFfb/0TKPDbQf1fpI7OSY/rywBalD84M/6sFGDnLJp+MWd926feOuZyZU6RvNZhvYmHadH/aHYv zT3kB
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_103019_314290_5CD5B8F2 
X-CRM114-Status: GOOD (  11.84  )
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


Changes since V3:
-Picked up tags.
-Addressed comments from Mani.


Kind regards,
Niklas

Niklas Cassel (7):
  PCI: endpoint: Allow EPF drivers to configure the size of Resizable
    BARs
  PCI: endpoint: Add pci_epc_bar_size_to_rebar_cap()
  PCI: dwc: ep: Move dw_pcie_ep_find_ext_capability()
  PCI: dwc: endpoint: Allow EPF drivers to configure the size of
    Resizable BARs
  PCI: keystone: Describe Resizable BARs as Resizable BARs
  PCI: keystone: Specify correct alignment requirement
  PCI: dw-rockchip: Describe Resizable BARs as Resizable BARs

 drivers/pci/controller/dwc/pci-keystone.c     |   6 +-
 .../pci/controller/dwc/pcie-designware-ep.c   | 218 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  22 +-
 drivers/pci/endpoint/pci-epc-core.c           |  31 +++
 drivers/pci/endpoint/pci-epf-core.c           |   4 +
 include/linux/pci-epc.h                       |   5 +
 6 files changed, 239 insertions(+), 47 deletions(-)

-- 
2.48.1


