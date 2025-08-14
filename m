Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0D9CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb3iMcqEfAjeD1qcIrxjbGmbzpQ4JVCq2AuCsZriloY=; b=3bzN4kdCKkWKwxq03WM98/2b5p
	NQpA0flsP4Qkh3fCDGUUi4YSOCpNPVqOc0wBOK/p55c1KRHTg2NjBPidASnX9S7RqzlsJUGH/orQR
	aXSzKY9P3bQ1DhjOOZJx5/K2oFc46NTYH17rbhIgsM1aHu5IbNH2hFCPxMLKqXgZ2G0kfTY9eKq/t
	G/gMyOQXtID4VcjDJkyV59HZMmVZKKSQM/M3sMVd1Emh3Akqo3pI8Bkjsq8DNeU7e+O/+t36+igLh
	A0tS7MQeUceUOiNE5TYe9dQC9tw1hByKNyzmwHNkWEI7POdZwW9iNGnnBC0zFsX1r2KHvAmDX/o/B
	exrOPQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umacW-000000000R4-1rwD;
	Thu, 14 Aug 2025 16:16:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZmE-0000000HQ4Y-0vcg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0193450A0;
	Thu, 14 Aug 2025 15:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6983DC4CEEF;
	Thu, 14 Aug 2025 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184919;
	bh=jnYozd3vWL8E5iUlI97XyQZtx57KDI/7g/iBSexDyDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5GBarMuVEM/72tqKNvIlO2TVy4/oRNZ/7VGEr3DNJemfXy6nbqtUVMLP1lg+t0Va
	 Dt5eD2GG2iiFND/6gVywDZoLB+uJc1CDErkXS1CTygzVKujAk79PPwSvJXHeZBQsmm
	 2Z2HvWFxqhj/reW0K3z5IDPJBMBod/GSVXoti8PpVgNkg1xy04FZFbNAcPPqIbz5JR
	 SAFTgs48ksxtoY54hQMXlnVDSdMvtJp183aZhjnRrEBkgy0s2dPwIpHRLg4FHvEE8x
	 G1VAJV40F5VGFGRQSAh0zhe0wKMWN62+pXLZ36UzAtlxH52lwZ1IVAyI6WrIyTa4f3
	 1tEOkhhLDa4lQ==
From: Niklas Cassel <cassel@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/13] PCI: dra7xx: Drop superfluous pci_epc_features initialization
Date: Thu, 14 Aug 2025 17:21:23 +0200
Message-ID: <20250814152119.1562063-19-cassel@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814152119.1562063-15-cassel@kernel.org>
References: <20250814152119.1562063-15-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=cassel@kernel.org; h=from:subject; bh=jnYozd3vWL8E5iUlI97XyQZtx57KDI/7g/iBSexDyDg=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLm/vtWeid1x/1Gtf831LP+pN/j2SV44ozdhlD9jtmL7 0tMF93M2lHKwiDGxSArpsji+8Nlf3G3+5TjindsYOawMoEMYeDiFICJaGUxMrxw7u6Z7pBm2/r8 +KdPK/uTtcWcllfc/9MsGnVc5bLTyg8Mv1mz0tTaKtrWK9vJ/Nilsab5rpPN1Znd3MWff1blJW9 7ywcA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082202_279534_3ACF2FF8 
X-CRM114-Status: UNSURE (   9.07  )
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
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index f97f5266d196..01cfd9aeb0b8 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -426,7 +426,6 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features dra7xx_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
-	.msix_capable = false,
 };
 
 static const struct pci_epc_features*
-- 
2.50.1


