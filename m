Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3791CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HpgtZCj4DKF+SCKQEtmtg4VCmfcp7NcNAjYNdNYVU=; b=36IZiOKED4V4iv1mVrfTYryUPy
	vkaFg6gRMlD+JUQLHptlPMKtUxmxQrs16ep4OXIhx4q2YZGDv1bXnRg4fiGu6zGDoW2klbgnxIL8X
	GKed6Gc7AxWnOutsX38y85PNVZipUH3xS6+Asgc/gNx29sPqO0WF7WkYBLzuEiVx11djIeyhHJ9vC
	qy5ukp4Bys8bKhlg/ZKhFd81Gh/NuGviuu4BflIrPWLgjvGXGZ4XCRE1vkm2HqzzKicUf6OChZiAb
	s55J1IOE0GAZ43KxrNpI6dMAXRxjHOYFvQXRuE3Nxm9ecexCDd7Lsuqv3lMp+DKQQewXBXd96Xrxg
	Jxf/rE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umacY-000000000Ul-2k3K;
	Thu, 14 Aug 2025 16:16:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZmR-0000000HQ6y-0pHf;
	Thu, 14 Aug 2025 15:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86E765C6FE0;
	Thu, 14 Aug 2025 15:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0289EC4CEF6;
	Thu, 14 Aug 2025 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184934;
	bh=74Vt3a6n4teThZfYp3RaKUgXovIDf9PomEewqYdyFlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8G/nwgTbuZmIIfx/MYu0RtWPSsH57qPusFyf5ZmNv7b+96E/7doIjPukmMRRsqFB
	 pxVUgittAXpitSSA0/z+oGVVBR8yeKqRLeQcogrNrslyxnAInrc+coC0lscy7uOxk8
	 Y7zPK2aWd07X6vKhr8PHW1xVgye1pqaGgtQpdG6WrPOjmUbWXup8K/R1C2OGZ9Pvu0
	 lVOXBYVzg+Z8Ok3tZ77VBMOz4vqy/foFIUlz10SRQp9unRJkFJI89DeOzTppdrbdmZ
	 geqAva12zeV9GbVShDLdSZXQivQnDR1JPmn8QS90BOQvHlfBA6AUxN65Ei1H29fjrq
	 btV2jPKWYHHJA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 09/13] PCI: dw-rockchip: Drop superfluous pci_epc_features initialization
Date: Thu, 14 Aug 2025 17:21:28 +0200
Message-ID: <20250814152119.1562063-24-cassel@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814152119.1562063-15-cassel@kernel.org>
References: <20250814152119.1562063-15-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=cassel@kernel.org; h=from:subject; bh=74Vt3a6n4teThZfYp3RaKUgXovIDf9PomEewqYdyFlM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLm/vvx5hjvPTPNraVXuW0sWZZZJd53YGf3thbwMZnT5 iNvceplRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACZS+oXhn42x7c2bm+ZkMnyZ HDC/unNqVnOnX8YZoxBL3jzL0ze4lRj++xeuXfpx4a4fbledVpxQeGujk/hwQheD2F1fV9a7gpq /WQE=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082215_274261_E31F04CE 
X-CRM114-Status: UNSURE (   8.71  )
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
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index b5f5eee5a50e..c045353fa493 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -325,7 +325,6 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
-	.intx_capable = false,
 	.align = SZ_64K,
 	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
@@ -346,7 +345,6 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
-	.intx_capable = false,
 	.align = SZ_64K,
 	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
-- 
2.50.1


