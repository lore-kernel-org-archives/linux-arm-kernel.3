Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17DACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rWue2hixAfkhDeS1NcjZTC89ybY3RUFDUF1w10HaZw=; b=cBFTtleFwUctYm+V6Jvo3835CI
	5DVAjTNGAJM3J5rpxQnn4ULmrdnneKdm2jHYVGM568gFoHffAAJS0l3tT2wdUxwROK5i9IQXKST6q
	SvmUl2qQfiFMmgHbahAAeSUiawR26G2EZBH/JjR4CUyDi1Xql8CclP2R66OzVBf9gzuezxwagZ4R+
	ZxDVONH1NrmWg3CcYQpVdEjMlk7qdOCf6RevP+BRWz+LsQTC14DlvIabLX8P3MoG0v27XoySaPpGT
	9fACBHSqRuc2HNyCdZlKTcXESm63I8H5/7cIQzl70KzSxFqmkdekzw0gIB7eF5s+Iw7ysqqxwRp+x
	0PLJalrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzRS-0000000G4eA-2k33;
	Mon, 18 May 2026 14:59:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzRR-0000000G4cs-2IJU;
	Mon, 18 May 2026 14:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0387B601E5;
	Mon, 18 May 2026 14:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2E86C2BCB8;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116376;
	bh=ECoXg3gC3Bh+h2o1n42paArpk4jp4P7Tam92UW2RViE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gQs5MJLis6UVecTNK7IBd2IlJgQiFxhwt7w27uj0aIP/JtxjfkgCTv2GtAAAzx0WM
	 eyNZgbR1TJQihLZDJOCJx02FsIemL0KN9lIdH/qJb7IqD4szt76BfHkxKH8UHIZyLs
	 TPvw/MDJL78kc0UFdm/EpqLBeQo0YAp7k4NBaH3fTCTObp9TdqUvY3A7yiYS4gtGiA
	 7u0AMreAiOVzIKQthxjRTOz5urdWXgSD5lYG7IfdOJPRcq8gTs0K87gdH9YoSIgSa7
	 R3PcUahA10xl6+62j5BFrOyLTRQ4Ukb47viYxXO2Yxmf+cp/CqUrJqHoNA3EM6rYfk
	 0q9CXfisL9oPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90555CD4F49;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 18 May 2026 20:29:13 +0530
Subject: [PATCH v8 1/5] PCI: dwc: ep: Clear MSI iATU mapping in
 dw_pcie_ep_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-pci-port-reset-v8-1-eb5a7d331dfc@oss.qualcomm.com>
References: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
In-Reply-To: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
 Wilson Ding <dingwei@marvell.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=DOBc0qbyq7keowKanldmTADeubkY3d2RuxJiiS/OOM4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqCylUbgmSbz1kVr7omfIK0go80pJFvGDFzpmhY
 9nEuMnSMXmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagspVAAKCRBVnxHm/pHO
 9Vp1B/wOqPF1w4/rxr1pZQAJ04G+p0MJoPG4wsGqn4QByaQH0A6xK3NTFRxmhprieh8pAZUVLiv
 Bfk9nqjL34e6h89veBGMpdtMjzM5K1Yd9rjfahszPgaQnTozmKX71C3zG2Gf62yCYbGIxDU0fN7
 wF9y8NDGQ6mY1osHaoCK76W0XZIqiR1qUOwlVUh1xNCspSycCzJc5KhSmcBZdrc+PrEP9ukFuQv
 W/NyAxeQV/Sz0vX+7XKAac8Blfb/ubk0kqlWq+KbLJaIh1DUw/sp7UVCIx3SVbGMVcDmGjrBopn
 /XHtcZL3biY8r5MXhNm5m2XnDXLSZk3RcxLpbHTE5Q5nhg/6
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The MSI iATU mapping is currently only cleared when the endpoint is
stopped via configfs or when the host updates the MSI address/size.
This avoids redundant iATU reconfiguration every time the endpoint
raises an MSI interrupt.

However, a fundamental reset triggered by PERST# assert/deassert
resets all iATU inbound/outbound registers without going through the
configfs stop path. If the host also retains the same MSI address/size
after PERST# deassert, the driver never clears the stale MSI iATU
mapping. It then continues using this stale mapping to raise the MSI
interrupts, which can cause IOMMU faults and MSI failures on the host.

Fix this by clearing the MSI iATU mapping inside dw_pcie_ep_cleanup(),
which is already called as part of the PERST# assert/deassert sequence.
This unmaps the MSI iATU region and sets the msi_iatu_mapped flag to
false, ensuring that dw_pcie_ep_raise_msi_irq() performs a fresh iATU
mapping on its next invocation, regardless of whether the host changed
the MSI address/size.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d4dc3b24da60..4ae0e1b55f39 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1035,6 +1035,11 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
+	if (ep->msi_iatu_mapped) {
+		dw_pcie_ep_unmap_addr(ep->epc, 0, 0, ep->msi_mem_phys);
+		ep->msi_iatu_mapped = false;
+	}
+
 	dwc_pcie_debugfs_deinit(pci);
 	dw_pcie_edma_remove(pci);
 }

-- 
2.48.1



