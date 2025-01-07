Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C86E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByUJW6sm8JgZIA3YN3W1fSSwj9iK8sNF1phFxfS00as=; b=VFgVcPUHFIwvKAGXUm33+hg9vb
	wL4g9LwDT/ip1NefEoqwKamOqvDX89TDOmuo0SdCkKlAfVxGMc+d/bZFHqMvXyriqMnJAE0Dh2xEv
	UntzFaA97ndEdzzdksBW+DdwVpij71yUByphdaYQKUvZf4jUTaVH08r6rKsc+3+K4zqfvGLhHI9ng
	rA4xMrxoYEfbj1ItI7S/1FBbsjqExiydcCa202qxVzVgRM0RPiTDwdVosyZqaHDh1QN6YMJl5EKXp
	8b0ojh3FTQvzLl05cO3Re7Hp6wv+E2vo7vje0jZ6UtritSNFFheOPSu3FSZ+At9KuZTZeq/szhbIV
	n5UwcOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVE8B-000000060Fe-0tiQ;
	Tue, 07 Jan 2025 18:16:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVE6y-0000000603f-0eym;
	Tue, 07 Jan 2025 18:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 744195C295C;
	Tue,  7 Jan 2025 18:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F558C4CED6;
	Tue,  7 Jan 2025 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736273725;
	bh=HBHcmiYhdV1i4DCHsk2yrqZrt9sMvcGZpjOw1kIPmYg=;
	h=From:To:Cc:Subject:Date:From;
	b=R/oRDHZ1ZZT+orMFLLX76WpaXpgt3NZL1kwo0oQrmKl83504ib50B/6/n5QXTpONS
	 WrPp78wn2KU6NSs1TMbZ8Z581qkDl02ZY1u3xeVkw46pGmecYpZhHVHD2k3pfjL1KJ
	 h813PUx+WE8/pfnDPn4bwwudKiph4OTr4eVRWRLEXQg8HHOo5bO52TA1ttuMBZjhSR
	 n3xm4g15xorFkAubYAkc92O+n4xTViWPaEYDsKwT8X+BhQiqAUj8PES/AYIIwa2KAa
	 uFYfwLIwkIlry1mHWdzdjiU1ERjfB2VOEgxB+vFywuZcP8v/UkyabQWaweGDlsDD05
	 bwHrtO2bymmZA==
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
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/6] PCI: endpoint: Add support for resizable BARs
Date: Tue,  7 Jan 2025 19:14:50 +0100
Message-ID: <20250107181450.3182430-8-cassel@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535; i=cassel@kernel.org; h=from:subject; bh=HBHcmiYhdV1i4DCHsk2yrqZrt9sMvcGZpjOw1kIPmYg=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJr86XkFW1NSuLvlzoyr1h2c96f+yqlrpfTfF2OztFYP 812JcO5jlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAEzk325GhuMOr+Xer/iTvb9l Xvomy68+6YaMl//N4DK+4r1ynsUsLm+Gv9JG7xbfFLzUtNOUee1vx1nr4qqqD2l8Efswa8dG1dg Dh9gB
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_101528_276137_9EDDF19F 
X-CRM114-Status: GOOD (  12.46  )
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
 .../pci/controller/dwc/pcie-designware-ep.c   | 228 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  22 +-
 drivers/pci/endpoint/pci-epf-core.c           |   4 +
 include/linux/pci-epc.h                       |   3 +
 5 files changed, 216 insertions(+), 47 deletions(-)

-- 
2.47.1


