Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F69C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4F1t9TQwdFtN+VA8wUAzUikarVWuciFW6HlxilNrKa8=; b=b9OzqFvlZ+IBUQU/oKCEpt3PjN
	Gi1VlIx0XUZJD/CX4skG90D6jBg0D6dZRrLvp5rJzSkSzMqYm6GazEHGPisrtbR3ouvVFYt6mEKmG
	HJIiPC3QZmP9OdLDPxaJFwdBXMFgNBsHvX6LraabY8V1YjK4cAyfSaq8z4bKB5iPOoiEsjWnzgmN5
	gEaDjSjJb0BLDltxgKKcMZaI1qRq+md8VLm0WBBf4lhmqEMPEuDP1bzWRmlzuWfXMRuBt/qH+Zxb3
	66Z9y3P+1CMGHhnsslu8fKu5bcxHPlazizfQwMM7IFaMfrFnyCD4Avq1iagDTf/T8xyBVX4p2oGBI
	ubRgL6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYFw-0000000Gpne-0kgv;
	Sat, 15 Mar 2025 20:37:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvZ-0000000GnXX-3pZq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 865145C4382;
	Sat, 15 Mar 2025 20:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCB1C4CEE5;
	Sat, 15 Mar 2025 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069773;
	bh=uYC48WL7Lbr53Qr5HSPcWtBot9HNlzJ+bYzVHHYAEG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgZMAFNN3mO+jZwZewQ14F+/AW5m4DbKlyRBhVugtgFCzmFrfFwBDwufrF9nvtCrg
	 H/VxU1BT8JqR1HJ9XM91jo38LuOGwx3cs5S0P9kvvVu1WjvrIgtCZm0E7pu6+1kI2V
	 3MECYKoIh/tL7+bmlvaMfcY+kR+mPfK3q5aRleucMCxSJdp3X3ynkvvI+DxxzUWUCD
	 CG/OnhqvSemOTHkknapp3glwpmCtmsEJC/xSs8LtgXXCC6s2llGUG7oiOvvtWOYHsb
	 YqxZpH0lN49s2gfDwexeMm3MBNdNc0vRsgMbJ3pG4YTaTvaTWoeQLAVNpORkLjRst5
	 ZRiuERdjuCkGw==
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
Subject: [PATCH v12 11/13] PCI: dwc: ep: Ensure proper iteration over outbound map windows
Date: Sat, 15 Mar 2025 15:15:46 -0500
Message-Id: <20250315201548.858189-12-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131614_004800_ED9A86F8 
X-CRM114-Status: GOOD (  11.27  )
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

From: Frank Li <Frank.Li@nxp.com>

Most systems' PCIe outbound map windows have non-zero physical addresses,
but the possibility of encountering zero increased after following commit
("PCI: dwc: Use parent_bus_offset").

'ep->outbound_addr[n]', representing 'parent_bus_address', might be 0 on
some hardware, which trims high address bits through bus fabric before
sending to the PCIe controller.

Replace the iteration logic with 'for_each_set_bit()' to ensure only
allocated map windows are iterated when determining the ATU index from a
given address.

Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-8-01d2313502ab@nxp.com
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index bb87d0c5c665..2ef9964fa080 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -282,7 +282,7 @@ static int dw_pcie_find_index(struct dw_pcie_ep *ep, phys_addr_t addr,
 	u32 index;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
-	for (index = 0; index < pci->num_ob_windows; index++) {
+	for_each_set_bit(index, ep->ob_window_map, pci->num_ob_windows) {
 		if (ep->outbound_addr[index] != addr)
 			continue;
 		*atu_index = index;
-- 
2.34.1


