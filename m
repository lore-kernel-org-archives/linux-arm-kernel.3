Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70681C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzS2TVF0KTqdm7w3+IvzHczTzwQfADP8TeCIQv8e5jU=; b=P9sUUV3XskjvDiraCwgF+PWq2J
	icSyxRlzQFLMttTclx5PBYWWybodzUpAn1NbQRGR8KyygEMEXCoGlzfSGoM9gtHp+1Tr+5BBZf/b9
	zYLKQFhCgW9oTW3vSBalD5w272hA6hsz6/o5V69PuxL6Agy7poSGli0Ji91u6/D7og+y6PaBna6wl
	jIt2Efy6WI95+jUXOV2EbtSR32sVNRzTfFZwSwqdjcqfHG4TXHJKKZtT1ZYKwCENMQKqyiy3z6O0y
	9Ge3myfoOZI7Dzj0KA3kZmDTTdHNsKVHa/5E0PdTwOmutaAv9OAnR68/0saSji5E9GcPCYH6krh9I
	1ww+1qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ41M-0000000GRHs-2SxD;
	Fri, 13 Jun 2025 13:00:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3qL-0000000GPo0-2Y81;
	Fri, 13 Jun 2025 12:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 105DE6113B;
	Fri, 13 Jun 2025 12:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91142C4CEF0;
	Fri, 13 Jun 2025 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749818952;
	bh=wX1Jm2lYAIbPE66Dwi838XJj+Gobl7EuV/Pwtb/T0aU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dY4I2aA6Z9SjXZtLDpYISinWj+O617Ldj351pF+kracLye+Kw9TIWvjn8uxIxuDp0
	 jkPS5lraJ9urY3aBbuZoG7j+UvdETTn2Dyo3x7mQF20QUfSbZzbINynOUxmWe+4l89
	 vEWo+AS8KtiBnTyCvbCY6J8i/Y/tK/Q5w5jTY59y7LF0Maed6VuMj5ra9ham/13ztQ
	 Jrqd/VZ3uT0IkKDYLUYfDmj22ZNXERHWCzHByusQORPfGsFQ7pAAnYW+80zAqNgCNQ
	 WHsijro6ETpxi8I/E0P4PzrA3u1woE47rr6jnPqSCILpPY2GSHYgmMf5thERAfCGPn
	 f3OoRpKpWIlqQ==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 3/6] PCI: dw-rockchip: Wait PCIE_RESET_CONFIG_WAIT_MS after link-up IRQ
Date: Fri, 13 Jun 2025 14:48:42 +0200
Message-ID: <20250613124839.2197945-11-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613124839.2197945-8-cassel@kernel.org>
References: <20250613124839.2197945-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=cassel@kernel.org; h=from:subject; bh=wX1Jm2lYAIbPE66Dwi838XJj+Gobl7EuV/Pwtb/T0aU=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDJ85HT4ufb1SDw2nubNbWhoUZR5dwprmb5Y8Z9bHLwRv m+3f+7pKGVhEONikBVTZPH94bK/uNt9ynHFOzYwc1iZQIYwcHEKwES6djL84Y55rPPKPm2/gt75 XfLS0+Ze5ztoL5ies/y05yeJ5Q3MWQz/fY+8aFqUJysZ/eDl9/r2lScYWbnl/kp79sy/FyyT80y WBQA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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
100ms (PCIE_RESET_CONFIG_WAIT_MS) after Link training completes before
sending a Configuration Request.

Prior to ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since
we can detect Link Up"), dw-rockchip used dw_pcie_wait_for_link(),
which waited between 0 and 90ms after the link came up before we
enumerate the bus, and this was apparently enough for most devices.

After ec9fd499b9c6, rockchip_pcie_rc_sys_irq_thread() started
enumeration immediately when handling the link-up IRQ, and devices
(e.g., Laszlo Fiat's PLEXTOR PX-256M8PeGN NVMe SSD) may not be ready
to handle config requests yet.

Delay PCIE_RESET_CONFIG_WAIT_MS after the link-up IRQ before starting
enumeration.

Cc: Laszlo Fiat <laszlo.fiat@proton.me>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 93171a392879..108d30637920 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -458,6 +458,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
+			msleep(PCIE_RESET_CONFIG_WAIT_MS);
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
 			/* Rescan the bus to enumerate endpoint devices */
 			pci_lock_rescan_remove();
-- 
2.49.0


