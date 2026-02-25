Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA4FD3775
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7Lc0SocliBwpEi6/brEEz+OL920MfkhM2LFbAv2BKQ=; b=Vc8+HQjY/11LdIro+lXYKYsBNt
	axRFMBY5ioJelzF0x1rGIMRKIsQuHjsijW4+VWosTFaLc8pCaG+pDbjnGSqicZNSq6ydh/Zvz2g8s
	cZXjsqWm7dKIMgNffNEx2LSiDtAgNbbdVzGEVFHH8xeTzfQg3rLjfcONy+dqC/TrjJZtKwTlrOUPn
	2b6vZo3ixw/fVDS6fVTTERiKihRcfb4zUSGtVaZD67h6WTTMIML6bc6VXRuvOdYc3aSgpUpKKp9Vp
	DPiwp/E/giRGiFds/IEyUGtj/xYqHf2/axtWtFV3ZeS9WD0HhWQlixVVDy2jNMXXKc6mp6oGYPVOx
	btk+XCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIz-00000004bHC-0XnJ;
	Wed, 25 Feb 2026 17:04:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIw-00000004bDY-34Pd;
	Wed, 25 Feb 2026 17:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E22C660134;
	Wed, 25 Feb 2026 17:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ECCC2BC87;
	Wed, 25 Feb 2026 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772039045;
	bh=BiZdYZ10oL1f55oVAP47WgrRQOSSvegymMz9vjIkBHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S4dPdGKIjdGulNPoRTOZgr8I+1+b89i/gavoJ9mRYh2AYJJMoZN1krGYS+qbe+fjc
	 yBEz7swwRJip3jJx/S8yhJ72IEst3fzp4fDbYefmNTO83pr/kdeYSWYTzU4BRH2kbG
	 xw7i9iwsAOl90tZFHoCKt5il7gUGReSmz58eSGlJ1LqwhGVKbzaRQAMylTkR6nFO4V
	 xy3rTyxpfYLOtP2emQOESOwNos/EhIOeK7KKp8D4wXqg/vYxdqruJDEMbN68eB8A61
	 zo5KtC1JdtqstsWK0zKmQ2dLLtVDa+Is869hQEkZDpdeLJh0X3VokdHyU2joIVyJtT
	 mbU1WrtjI2vow==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/9] PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
Date: Wed, 25 Feb 2026 18:03:26 +0100
Message-ID: <20260225170324.4033466-14-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225170324.4033466-11-cassel@kernel.org>
References: <20260225170324.4033466-11-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067; i=cassel@kernel.org; h=from:subject; bh=Zg6ckjc98vCLhAPfUK/ZqioFk2nlRbszSHiX5dxQx4c=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLnaycxpCv5P7Nd+GeB97HgT6IG6dzBV2U8y5efMUlvN bj1ZuuhjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWwIF6cATOSlPSPDA+kFnZeKF7cazjIK mle24CZ/+5f3d+/3z3pvFiodyCR2luF/3Y1Gy0WGrbu5Li6cE52ZHq/c+WJ7+vUry9Wyz3y4Yxn BAgA=
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

From: Koichiro Den <den@valinux.co.jp>

On RK3588 PCIe3_4L in EP mode, the integrated DMA controller registers
are permanently mapped to BAR4 and must not be repurposed by EPF
drivers.

When the remote peer needs to access these registers, it must use the
fixed BAR4 window instead of creating another inbound mapping in a
different BAR. Mixing the fixed window with an additional mapping can
lead to incorrect behavior.

Advertise the DMA controller MMIO window as a reserved BAR subregion so
EPF drivers can reuse it safely.

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..ecc28093c589 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -403,6 +403,15 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
+static const struct pci_epc_bar_rsvd_region rk3588_bar4_rsvd[] = {
+	{
+		/* DMA_CAP (BAR4: DMA Port Logic Structure) */
+		.type = PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO,
+		.offset = 0x0,
+		.size = 0x2000,
+	},
+};
+
 /*
  * BAR4 on rk3588 exposes the ATU Port Logic Structure to the host regardless of
  * iATU settings for BAR4. This means that BAR4 cannot be used by an EPF driver,
@@ -420,7 +429,11 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
-	.bar[BAR_4] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = {
+		.type = BAR_RESERVED,
+		.nr_rsvd_regions = ARRAY_SIZE(rk3588_bar4_rsvd),
+		.rsvd_regions = rk3588_bar4_rsvd,
+	},
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
-- 
2.53.0


