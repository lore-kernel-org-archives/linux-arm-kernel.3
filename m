Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E8BE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fs7gcQ7fnbEH/1iZfWSEGC+Rf9uUF6wVcLAsRgyI8Y=; b=jXD4nmpj2OmSN925nSPtZKPkYN
	0GS6auh0EVc3j9quEPLGhPptYsKVR6uhbLJhzCQFl4PMnna6DSTt8kC1p9aMwtowCaeq9KpDpjfAp
	QFg05wLfi3SpqOyV6FoqnO+Z7KngjnDErYtrr0BUmgr+K82ze/J6EBdQy9Miq7hrITqrcstdfD88k
	cycZMo75nzsGD2U6aUsFWa0scTzcsHZz9Qi/sMTiS2QFWMoZONi2Zp8A9Xa2LthKalPtDJANs4b/7
	n+8LKdBzgGRv8YRUMjjYRfmLWzi6m6pSEbODO8FurcXkZu6BLDHDDWEap+JUWrvpGsrazWGxizUb5
	TmyjjVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSbs-00000008uif-0jgf;
	Tue, 17 Feb 2026 21:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSbp-00000008ue2-1NNP;
	Tue, 17 Feb 2026 21:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23ADB43C7E;
	Tue, 17 Feb 2026 21:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C804C4CEF7;
	Tue, 17 Feb 2026 21:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771363672;
	bh=mw3yNaEjiLtrT+L0HuG+D9JSTgzEPCjD3Q6jq3Ta/zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r4vEbJfhBZh5Mu3Ukf4bStCjxqIVZpMwCP7i0eZkWAzdWbqIsn6wYCvusyCv42TIV
	 h9iiPyBaByjSiQd43Ga0Q2o5UFzA6FLrEJe8yw2Z7FDP2G3kjT1o+l7R1E6LMNZIT4
	 /zQAO8RmY4cTpxTpgNbnxN0kgg/pZwYCQXhDrq4X+1PJfSHqcJJ8j2xzuqUPsCQnwh
	 Uaee65Ze6NVs0BiV4lD0duu+33y2DQfQBVPJ7BpHwOv4kojktIj9CGC3z9xf/cBOJZ
	 TM9dHNCVg8cLoToJFw84Bu+epqrOETGYok5ISrP665nWUg9+d8T0CvHRi0GzYMMqjO
	 pGP6C1XMfuufg==
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
Subject: [PATCH 3/9] PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
Date: Tue, 17 Feb 2026 22:27:09 +0100
Message-ID: <20260217212707.2450423-14-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217212707.2450423-11-cassel@kernel.org>
References: <20260217212707.2450423-11-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=cassel@kernel.org; h=from:subject; bh=gHLF5xu0z81u0rODJeorxHOpp/bwOtW5+Ab5x6tbCsE=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKn3NWV3P3moBvTzTueX4qLl5jpnjBblfdB2tfkTrMZ8 8+N0zg1O0pZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjAROXWG/3WRvxnVWf+/aPj9 sZAjVPkIa6hfbJSHzvE59r7JCdNSPjMyXIv7fshYQLayZpv97OknDmz9Y/+uuWb58/p1QXkV16b oMAEA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_132753_435857_7DF52AA3 
X-CRM114-Status: GOOD (  12.56  )
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


