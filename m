Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7247C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDOPqGAVUrmR/Stm9sv+ip3Jh00qalmdtYo7lVAEzMo=; b=lFi1+EcdIw66e01nq9u/C49sQw
	ufipjsDNR1LEG9YOa4cNFbGlEZmM+gllqEpLT3m8QRiNO4UpW5NeOLYeeZlCIubMTy8RtBA5cHaRe
	ontjUUq0fya/cCoPetLZuXsneTDGXMpQ7VqS2UY+wzCBi9wV0Xihi1jVUeCFUQZbeBSo4FUxjJAk1
	7SLKA30OWv7INvUrO4gyLaT8dx+Dk5H8Pi2us8Nrv5B2KOBvTQ2Ih6afqvNlOpmUE0+RubYmhvGCb
	ZdNwnTK2aIQkGWz/6nVJZ8Ho12LHrr7ZEb7UhQKp2Z10Z4FNTy0MUIlxwBKu/Dzvb9BPb8VyD9kVR
	z+XTBHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmo-0000000AUH4-3I32;
	Wed, 11 Jun 2025 15:54:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ5a-00000009g4E-0Q2P;
	Wed, 11 Jun 2025 10:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gDOPqGAVUrmR/Stm9sv+ip3Jh00qalmdtYo7lVAEzMo=; b=e88bi9KrFi5MDtlvchbe/cSe2h
	XGqeqwXjAp0oTu+0+u4VU0mAUpJOjN0ecHcVzfdF5tDIYn0HPWLG06G2w83ZYb06BFqWQYMeD+Qhg
	YMo/+hG4IMyjJs5iNqrW+3i/otFrdRKciVXaPPTrtNQDBb3/0WbPstUtpIGZEmsuFLCx2Cyy7zMjl
	soV4m7axQuuXG3v9V6rZ3NhWodl2LjHU9f9RCLVr3uRbZ+pqyLEWcEp5DVnwYB7NWDPYPxFSVqBJn
	94gzdYz5xAZO7q5+SJuwZKIA9i9HeDBFHA58TkMIgnt1AZmxeCHmlHNsAhXN5blKZ5ioH2TPeKizG
	6PKESUWg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ5X-00000002IZx-1jwH;
	Wed, 11 Jun 2025 10:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE0B05C596B;
	Wed, 11 Jun 2025 10:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F3CC4CEF2;
	Wed, 11 Jun 2025 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749639222;
	bh=RjGMQwNSWCZEFnr1KtbG8zsYIWeufEBEVG9ZPVbFPDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRWqPvJcRunolzJQuBXOV/kXT0wuyLr38cocFfFQYWlHioHigw7fskH/9nZ1XTmV4
	 zbzHAU5rcoNMmnjaNWv7w41tr6KyDG29eS5ZQ2FVmmoDn4v1toFRfjujIdXSu8yYmm
	 MC+WFaNvHgOOdOuSKKeaTcYZCtaIUshrQvVL1b6Zun7sX1sgUECHtkvMba7yQlYSX9
	 EqpukKd2r04MQsVDtEyNrDS3LU0tuvB6d2WFkF138C8bDJFAdnEWrh5kPFrWX0AbEd
	 akaRsNUj+EJ9wHMJ1+cemihTmV5oBbt41A1w23ye6dXMveltSr2msMn/bAgYBJLLSb
	 91c/F0v/IL6LQ==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before endpoint devices are ready
Date: Wed, 11 Jun 2025 12:51:42 +0200
Message-ID: <20250611105140.1639031-7-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611105140.1639031-6-cassel@kernel.org>
References: <20250611105140.1639031-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179; i=cassel@kernel.org; h=from:subject; bh=RjGMQwNSWCZEFnr1KtbG8zsYIWeufEBEVG9ZPVbFPDw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI84/fm7D7B80R4OZ9Gz6Ivf4IrLP2zansvVimoTE07E hRckvuzo5SFQYyLQVZMkcX3h8v+4m73KccV79jAzGFlAhnCwMUpABPpesvwP5mpPNqxjcfh76x5 Rk5V67WjNjOo9R5MEdj3zPH2y1kfGBkZVky5ntBz7FCZ78q1nsvmfZtylOfDmWbuTc+yt0m4fBQ JZgQA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_115347_768788_63A7FA08 
X-CRM114-Status: GOOD (  10.62  )
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

Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
and instead enumerate the bus directly after receiving the Link Up IRQ.

This means that there is no longer any delay between link up and the bus
getting enumerated.

As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link speeds
greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link
training completes before sending a Configuration Request.

Add this delay in the threaded link up IRQ handler in order to satisfy
the requirements of the PCIe spec.

Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
dw-rockchip: Don't wait for link since we can detect Link Up") makes his
SSD functional again. Adding the 100 ms delay as required by the spec also
makes the SSD functional again.

Cc: Laszlo Fiat <laszlo.fiat@proton.me>
Fixes: ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 93171a392879..a941a239cbfc 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -459,6 +459,13 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
+			/*
+			 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
+			 * supports Link speeds greater than 5.0 GT/s, software
+			 * must wait a minimum of 100 ms after Link training
+			 * completes before sending a Configuration Request.
+			 */
+			msleep(PCIE_T_RRS_READY_MS);
 			/* Rescan the bus to enumerate endpoint devices */
 			pci_lock_rescan_remove();
 			pci_rescan_bus(pp->bridge->bus);
-- 
2.49.0


