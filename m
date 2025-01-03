Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848BCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAVQKGkxPRrXdhp3FYSbWZKG8D4zkixBtbsokz2j5is=; b=y0VE1XWLsPOxsvXJqMMXUoVW3P
	7sqm0cumzH0JdfoW5FXYBD0e2pDNyWGpBJXPqizuhJrgMUlUT/MDv2QCfpF5D98tvMN5TMYKYW+k/
	kyh+V56TalOwZgAFcifk7VnobbRIzWZ5AfQg2xR3UXnpXsFplrW4e+bBKaewYnNG/zoMH+yQiBY+b
	9hbveIrBNNX7R3HNQcy1xL4kfDis1Wf+Pwz+Vn/svsjF+xq/aMusXdklnnRTbWCvMwgiAK1iBcxkY
	CALrPKVlslLBr99TCvdHPgQFIScjq/uaOG/xFCPEQu7XcqbVzgda8dx9L0GKRkm4ZdzZIQauvnSpa
	9WGwEUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeTO-0000000Cg2u-3LoO;
	Fri, 03 Jan 2025 10:00:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeRg-0000000CftC-1xET;
	Fri, 03 Jan 2025 09:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A37D85C6355;
	Fri,  3 Jan 2025 09:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F10C4CECE;
	Fri,  3 Jan 2025 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735898299;
	bh=K4fzD7ubtKTn0SOctnqu1z25EeAlhR621aiktUmrQIc=;
	h=From:To:Cc:Subject:Date:From;
	b=OJPrZvpT6AQbvqgtB9D4+QOFBPxLzaXc67UE8SuqxFAaUxNQjfY2lE3aZAdoJT3ua
	 FWEva1e/bC31mVTvFNwdkSJRyN0YA5GNgFhXLrZ0XiCf5RLb8PNHV9B8d5kTpL3uNY
	 traU8B33VeEVU0iuOdS4NA/lzUdv49Lrfpg6x6mZbTNmfwFV6EmCRFW1VmoZkSLagb
	 2gGOgwHNUzu9oHma897WyBcsDswCUsGwNO8HQ3ARrBTot3ZDj2OZLRRIhhMSxhc32Z
	 Fhn5m5D8uC0hyfglJt0OUcCWF7M7NXrMtbYdY76wfWvd6874gysdaAvvNZHBrkSAb3
	 dI2B4NVH3y3Tw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Niklas Cassel <cassel@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] PCI: dw-rockchip: Replace magic values with defines
Date: Fri,  3 Jan 2025 10:58:12 +0100
Message-ID: <20250103095812.2408364-2-cassel@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=cassel@kernel.org; h=from:subject; bh=K4fzD7ubtKTn0SOctnqu1z25EeAlhR621aiktUmrQIc=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNLLt2y58jajKmlB5OyESRcuba8XWTWVN8fJJs5CT+Swa MWEzBy1jlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAEykZQ3D//T4eQfuXnyqs9um 8oOhuvGuuMVH1/38+/BQxHvHlS7aO5QYGWb+upyyjEvhgEFAc+fr/R9bPAIqtJqUnKw8C1/m370 QyQsA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_015820_546868_210AD69A 
X-CRM114-Status: UNSURE (   8.97  )
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

Replace magic values with existing defines.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ce4b511bff9b..b65c6ad803c6 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -488,7 +488,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	}
 
 	/* unmask DLL up/down indicator */
-	rockchip_pcie_writel_apb(rockchip, 0x20000, PCIE_CLIENT_INTR_MASK_MISC);
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
 
 	return ret;
 }
@@ -545,7 +546,8 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	pci_epc_init_notify(rockchip->pci.ep.epc);
 
 	/* unmask DLL up/down indicator and hot reset/link-down reset */
-	rockchip_pcie_writel_apb(rockchip, 0x60000, PCIE_CLIENT_INTR_MASK_MISC);
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
 
 	return ret;
 }
-- 
2.47.1


