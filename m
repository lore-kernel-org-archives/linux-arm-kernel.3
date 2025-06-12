Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF006C71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1s398bPcc74LnzUZZ1jNzpNV0ID4nGP7hP3zLCVXd0Y=; b=IvHooKDJbGQLJbXdKglTSjPeF1
	i/EeSXTz4G0mtdZhr84ELqLWRIT2+3WY14kAvHBG+BTAPld5AdA0cer4jb+Vg7YOnXNIRZ2LIMLRv
	+V2AamDx50Z/LjO7vFf7ZXytpQyBk3JXgu8xcUmDx7DpgXB51GUhnbBMM38l2idXMIt0kfRekrrGP
	H8mC5zFlEMSbvhE+oWhj8eGrUB9JsAAuHd0NE66rAmzV1w71VTncx6dePIhm/eTtlAtQwwUCuAs3w
	IyNHAA5BVJHjMwnhymZ7DjX9cMGv04gN9v7jZ3evn7s/Sfx8lgYNmZ81eXmNEQQcc0/J5TNlrCRVx
	C/2fwsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqX-0000000DOHD-2ygp;
	Thu, 12 Jun 2025 13:19:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgRM-0000000DBjJ-3hOm;
	Thu, 12 Jun 2025 11:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEEF95C5FC4;
	Thu, 12 Jun 2025 11:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E9EC4CEEA;
	Thu, 12 Jun 2025 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749728992;
	bh=1Tm3QIXGlVl6CARF7272tS5RzBN9w6RAQBcJlB7/0jQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRRcQ8YM2gAU5t9Lemw/hQFm408MLCtqkEtJUHThVAKb2G4jbAD9SKLC2Zejkp6ys
	 kNzrgZUH1EiZVAqSLoyAoCdstSopuNla0M9ZlBtIo4AVJTCFmMJEaB6jX5NVwChc6o
	 8sRTlme7axTi4rixFhFKF6CDAEpPilAG7pNGzgbEjf9U9noxqU8QC23Q+9Pchg31ZR
	 ZZGOvgwBU/yhHrHcFQfsZ+hmvX8K71rX2FnFYIwQgB6QBhEFAwvpyGSA0HPaCVwd4n
	 /Ywpg0U0PbWhONeEQ0/ieuhFHRZw8YZQ0Y3kE0bkiSDW5ZfVi6rgbKCQH+giXQxMT+
	 iLs45IxrX31Mw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Simon Xue <xxm@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/5] PCI: dw-rockchip: Wait PCIE_RESET_CONFIG_DEVICE_WAIT_MS after link-up IRQ
Date: Thu, 12 Jun 2025 13:49:24 +0200
Message-ID: <20250612114923.2074895-8-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612114923.2074895-7-cassel@kernel.org>
References: <20250612114923.2074895-7-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=cassel@kernel.org; h=from:subject; bh=1Tm3QIXGlVl6CARF7272tS5RzBN9w6RAQBcJlB7/0jQ=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDK89h0Xvi9aP31JscEbvj+XlVs3r5M5OI9hm/SPf/ePS Umt0vC37ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBEvE4wMjTIvctyj7qocH39 M+HgRabiHt5fp516y1+1Va94cswGyzBGhgNO6eUfj1w4Gh+quipd5VbIwlOMaRd/SUetf/A2JvH mGx4A
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_044953_002798_3C06FBAB 
X-CRM114-Status: UNSURE (   9.53  )
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

Per PCIe r6.0, sec 6.6.1, software must generally wait a minimum of
100ms (PCIE_RESET_CONFIG_DEVICE_WAIT_MS) after Link training completes
before sending a Configuration Request.

Prior to ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since
we can detect Link Up"), dw-rockchip used dw_pcie_wait_for_link(),
which waited between 0 and 90ms after the link came up before we
enumerate the bus, and this was apparently enough for most devices.

After ec9fd499b9c6, rockchip_pcie_rc_sys_irq_thread() started
enumeration immediately when handling the link-up IRQ, and devices
(e.g., Laszlo Fiat's PLEXTOR PX-256M8PeGN NVMe SSD) may not be ready
to handle config requests yet.

Delay PCIE_RESET_CONFIG_DEVICE_WAIT_MS after the link-up IRQ before
starting enumeration.

Cc: Laszlo Fiat <laszlo.fiat@proton.me>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 93171a392879..8a068fd4f867 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -458,6 +458,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
+			msleep(PCIE_RESET_CONFIG_DEVICE_WAIT_MS);
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
 			/* Rescan the bus to enumerate endpoint devices */
 			pci_lock_rescan_remove();
-- 
2.49.0


