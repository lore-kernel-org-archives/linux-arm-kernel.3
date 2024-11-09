Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF20D5E361
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/ckHga109Lqcag8VPktYj5Lt8yeWQel7fCQXXz6Ttw=; b=BaVjIddxApkJ6yFljQGhSMHIQS
	er18kANMeS4I20KL5aVaa57YpT44Dtr2KhoCdCJ7A5oZQP7IB+HFQ5ghEEu3weHYUiT84CsRLQh3u
	4NRta+/D2H16XwuZk+Z2/uGKsWcklgRWvYH57Jz3DFSUsdCEIl8+C8QQddZ+pZ9twjJVyLJKE3+Cy
	uieYrF2/HgYAeRxhcrnyI0HpPHzmsbrmthhtMeC6X9fGs7X+IOT8eXQI+hRoQTUPOdgG1jwApHKBS
	Z83/WhU63M0bYBoE/gz6PQRKjizGmNHhUIodJH5tmWjnbIOSrF02DLK8rgkWyegycbJdvSu/icSHm
	3bHtApqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9htR-0000000Czn8-00YY;
	Sat, 09 Nov 2024 09:36:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hmb-0000000Cyxj-23uy;
	Sat, 09 Nov 2024 09:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C81DB5C4A54;
	Sat,  9 Nov 2024 09:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A64C4CECE;
	Sat,  9 Nov 2024 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144568;
	bh=L+Tb8zBkZwxLcT8ZO2OWnc/bfPC5zN+Fbgmb8QaRcIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gtKbOjIppaEaAgSR4fuMak7Xra9a9/IBd6y7Qja22dc44jViJEdaAufIo3ul4Uqiu
	 shETEdwZOjYiFNr7sS+NSKkP6H/lqUXB4uX289b6g9T0Vyl9lpNq0XDVeJ7TQ9J1gW
	 vVdRbExcJRi/nFEYtrWetPEtrwNc9tUgPkpH6P66wdcYsrnoLaDVpu55WOc4+7Ptw5
	 A2StZs69Ydsqu+v3xlexPuA3TfXQCvHtyo6Pg2jBi6LeNy+mBaAG979n5eq95QdHDw
	 FlTEpNvB9WnkFjMUCCsPFY9V8odI4uwS7K1qs8RekriNAPJazxeQ2gqfPdJVsQE/n0
	 HxPfypb2s8aOg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 Nov 2024 10:28:39 +0100
Subject: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
In-Reply-To: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012929_658715_5B09351A 
X-CRM114-Status: GOOD (  13.36  )
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

In order to make the code more readable, move phy and mac reset lines
assert/de-assert configuration in .power_up() callback
(mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).

Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
complete PCIe reset on MediaTek controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16da96208b3cc0c3011 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -120,6 +120,9 @@
 
 #define MAX_NUM_PHY_RESETS		3
 
+/* Time in us needed to complete PCIe reset on MediaTek controller */
+#define PCIE_MTK_RESET_TIME_US		10
+
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
 
@@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	int err;
 	u32 val;
 
+	/*
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
+	 */
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
+				  pcie->phy_resets);
+	reset_control_assert(pcie->mac_reset);
+
 	/*
 	 * Wait for the time needed to complete the bulk assert in
 	 * mtk_pcie_setup for EN7581 SoC.
@@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	int err;
 
+	/*
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
+	 */
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
+				  pcie->phy_resets);
+	reset_control_assert(pcie->mac_reset);
+	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
+
 	/* PHY power on and enable pipe clock */
 	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 	if (err) {
@@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	 * counter since the bulk is shared.
 	 */
 	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
-	/*
-	 * The controller may have been left out of reset by the bootloader
-	 * so make sure that we get a clean start by asserting resets here.
-	 */
-	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
-
-	reset_control_assert(pcie->mac_reset);
-	usleep_range(10, 20);
 
 	/* Don't touch the hardware registers before power up */
 	err = pcie->soc->power_up(pcie);

-- 
2.47.0


