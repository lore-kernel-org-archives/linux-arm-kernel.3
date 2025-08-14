Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E167CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKwq8tX6mBDse7e/uOW1QSLL1tQnbRRMOCYeeud750o=; b=ICJKJjakqs4H4CxBBDyX2ub4qd
	EL9/37Q9IgmLe05E1YAjlSRGEqE9pkyjpFks8R4a+9hN2zIZck9JqB4+YToSE5DPEWi5gYDzpyOrQ
	R6c4njHbtDUYqjXA57T42lUuBaIQlDeoFMf6skejIcqXdrHE5efDHpnJ1syTVil80g3beiohaRJ0P
	1jloLHTgarhlReRylnpvETTwCIZ8JYqcVpFNEKpRuCNuoB4DAR22++WtN8fH7R7Q3yBrw9B/9GWlG
	3K6tieQLFK5E/eUL+G+13QW9625PF9T4HmZEA3we/MihqjZCGIEJAuOtvSASLq33FFVPKJ8KxnHaz
	+6dU+ORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umacX-000000000T2-2NuV;
	Thu, 14 Aug 2025 16:16:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZmH-0000000HQ5N-0tFq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB8935C6FE0;
	Thu, 14 Aug 2025 15:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A818C4CEF1;
	Thu, 14 Aug 2025 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184923;
	bh=moW5SI2CE69IW+4yh1G1lKy2mihZtHEKrVslOxCjRoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qA+oPf5F4oizM5Jlzpx9mg2XSZC9Sj0biaUgb0ERva7kQCctz9Xys51s7BR+Hw6RN
	 JbsRGOT391Avmgks+DVlyBJI1nAQITCum4wX59LITCCZT38jcXw4ikYRjt4S3c4WeX
	 ruKKs+ydr41sbsQNg4Wi8EsV1bNyPrVYVFWQG0Wut0fsPhNt+BYaiDGd88JTXMVmrN
	 K0SxyFCs6ihCf/Fnr1lZcNen/vdOrtQ4ORpkJzIsIh7Mo6l6G1cVaZhR1PdeTsGE4c
	 hWgAjne3djADBdYpyXC+IPeSoPK2Q1Yn+xbe4E/tfaXtvhiRZYTIHIMbswnAYn/0fB
	 6oo75cQ/UdNrA==
From: Niklas Cassel <cassel@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 05/13] PCI: imx6: Drop superfluous pci_epc_features initialization
Date: Thu, 14 Aug 2025 17:21:24 +0200
Message-ID: <20250814152119.1562063-20-cassel@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814152119.1562063-15-cassel@kernel.org>
References: <20250814152119.1562063-15-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=cassel@kernel.org; h=from:subject; bh=moW5SI2CE69IW+4yh1G1lKy2mihZtHEKrVslOxCjRoE=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLm/vvWwH28edPRnO/fOiJfpXK/Lr9mo+LFuctYufxed 03s2T6PjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAExk8kVGhlm8XyZFBDFwrime yP9jv9vjDdNndOde1inOXcIe6NE+p5zhn1GTw9N7/F+eincyP/P8HvVZx9/1nvvv8xpHre03vuJ 14AQA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082205_288699_73E40EE1 
X-CRM114-Status: UNSURE (   9.54  )
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

struct pci_epc_features has static storage duration, so all struct members
are zero initialized implicitly. Thus, remove explicit zero initialization
of struct members.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 80e48746bbaf..7ee21fac81a6 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1387,9 +1387,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features imx8m_pcie_epc_features = {
-	.linkup_notifier = false,
 	.msi_capable = true,
-	.msix_capable = false,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
@@ -1398,9 +1396,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
-	.linkup_notifier = false,
 	.msi_capable = true,
-	.msix_capable = false,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_5] = { .type = BAR_RESERVED, },
-- 
2.50.1


