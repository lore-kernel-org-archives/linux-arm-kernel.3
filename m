Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NNYp2Ed5/Uv/KxKgNYwvtlxsfG0+ZkugIEq6kwY8FL4=; b=cTkFWcFbhQ/62zCwoYA+/u3u0L
	oRR+2+C1jImKH/razXkhhcwTs25XIl48bE7uDM19o7buEHQgNYrNdLg//WJNO6a+DQMEN+PZk88Vh
	n8P8woiMeywuMQxQI1bv+8GsbKYGx0c+P7ZSwho76I+lLQIlPxMG7Nq75U6SlQnI1picDZ9DTXyCQ
	R/z34Ln3QQv/TwL3Oaq3ddS96EcjfCE2ckbs9RTJBf+VB6r3/vGgGjDkgosZa/tyue26deQLa//Eu
	pN/Kxlqm6DEznccmByboq7imfx8HbQX4GPYD5+eikjHb/YpKZj6MQMm79bJit9g/1hR/+zpUyy9LU
	KIQpDb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9k4-00000006gpv-1CQQ;
	Tue, 24 Jun 2025 19:55:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7mq-00000006QBL-2rDF;
	Tue, 24 Jun 2025 17:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 061D15C4952;
	Tue, 24 Jun 2025 17:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32738C4CEE3;
	Tue, 24 Jun 2025 17:50:20 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] PCI: host-generic: Set driver_data before calling gen_pci_init()
Date: Tue, 24 Jun 2025 19:50:10 +0200
Message-ID: <774290708a6f0f683711914fda110742c18a7fb2.1750787223.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_105024_757799_7DF4EABD 
X-CRM114-Status: GOOD (  11.27  )
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

On MicroChip MPFS Icicle:

    microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
    microchip-pcie 2000000000.pcie: Parsing ranges property...
    microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000368
    Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000814f1000
    [0000000000000368] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
    Oops [#1]
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-icicle-00003-gafc0a570bb61 #232 NONE
    Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
    [...]
    [<ffffffff803fb8a4>] plda_pcie_setup_iomems+0xe/0x78
    [<ffffffff803fc246>] mc_platform_init+0x80/0x1d2
    [<ffffffff803f9c88>] pci_ecam_create+0x104/0x1e2
    [<ffffffff8000adbe>] pci_host_common_init+0x120/0x228
    [<ffffffff8000af42>] pci_host_common_probe+0x7c/0x8a

The initialization of driver_data was moved after the call to
gen_pci_init(), while the pci_ecam_ops.init() callback
mc_platform_init() expects it has already been initialized.

Fix this by moving the initialization of driver_data up.

Fixes: afc0a570bb613871 ("PCI: host-generic: Extract an ECAM bridge creation helper from pci_host_common_probe()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  1. Before, driver_data was initialized before calling
     of_pci_check_probe_only(), but the latter doesn't rely on that,
  2. drivers/pci/controller/plda/pcie-microchip-host.c seems to be the
     only driver relying on driver_data being set.
---
 drivers/pci/controller/pci-host-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b0992325dd65f0da..b37052863847162d 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -64,13 +64,13 @@ int pci_host_common_init(struct platform_device *pdev,
 
 	of_pci_check_probe_only();
 
+	platform_set_drvdata(pdev, bridge);
+
 	/* Parse and map our Configuration Space windows */
 	cfg = gen_pci_init(dev, bridge, ops);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
-	platform_set_drvdata(pdev, bridge);
-
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->enable_device = ops->enable_device;
-- 
2.43.0


