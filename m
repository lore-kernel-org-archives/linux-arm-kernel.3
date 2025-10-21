Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961DFCCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOyIEMEMkOCm3IYKpDgnj6yCR1nc683H5EbfdB4kThM=; b=MgA4zxF7prd6QlnRhKQCmNdL7c
	R61sv//nK2e9bUEouJ9AWw8YvzQRBxXz+tc+ncJOHGClPAo4ruPKVeeLfkoLVyj9WtxZoAkwu8naM
	AgQlcRcz8ZXayBWEPSn/CSPag1jDF44LehndlSGQ9uczINwXfULkW5/kcFYlUO1zmEiph7gPuvioR
	pPKgsloXMbli6GVctxIoJiVrWs/frAlvgpEG2tChrb5ayGLk7tzdU4UbSvdO9eLVEHFukBDprZGrJ
	k3UX/25sOwmwLb8259jaEiaRxc/6zzfw7w8jvJLVSWUWXO+r7F1gXJSxIraNOSprIjWzTUAyqYrpE
	cPTmz7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBgD-0000000H0FI-2n6p;
	Tue, 21 Oct 2025 12:41:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBgB-0000000H0E0-3jvO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 501AC6040B;
	Tue, 21 Oct 2025 12:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D95C4CEF5;
	Tue, 21 Oct 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761050491;
	bh=NG4e6thsmTs+tS4vAqcXpl8k/SUzrCPff2en/NEAlIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PyV4Vj00JSE9dHMgq5+mweq44ZXS3oBAvJenwdHZoR3yAKZ6m8mppRde7nDnEgkWn
	 jsPriWl0ODqyceq5hu8CzNajIC37GJuGGivY9xoyMrzfL+0VG9AyJb9hw+1+2OYhUh
	 OcnjxMIPJ3VLVR9TYdwKiJXzJ9EzXCwYCdSw53oRsxXJfMM/Wyh07GD3LIIHwLiBL3
	 W3dEila7lPO9kfyrIk2v12ypt+G9ZGSBexV+xfaBSc4tUyzG/XhW8aReXQciKGaYAP
	 mm4rB772/7kNbPdFa4xQZc+GwD7OlWX3Qs212aUiLdyNNO1BYJBusoIDHHNuwpzum8
	 B5KQNjcR8uXaw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 4/5] PCI: iproc: Implement MSI controller node detection with of_msi_xlate()
Date: Tue, 21 Oct 2025 14:41:02 +0200
Message-ID: <20251021124103.198419-5-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021124103.198419-1-lpieralisi@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The functionality implemented in the iproc driver in order to detect an
OF MSI controller node is now fully implemented in of_msi_xlate().

Replace the current msi-map/msi-parent parsing code with of_msi_xlate().

Since of_msi_xlate() is also a deviceID mapping API, pass in a fictitious
0 as deviceID - the driver only requires detecting the OF MSI controller
node not the deviceID mapping per-se (of_msi_xlate() return value is
ignored for the same reason).

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
---
 drivers/pci/controller/pcie-iproc.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 22134e95574b..ccf71993ea35 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -17,6 +17,7 @@
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
@@ -1337,29 +1338,16 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
 
 static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 {
-	struct device_node *msi_node;
+	struct device_node *msi_node = NULL;
 	int ret;
 
 	/*
 	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
 	 * for us to obtain the MSI node.
 	 */
-
-	msi_node = of_parse_phandle(pcie->dev->of_node, "msi-parent", 0);
-	if (!msi_node) {
-		const __be32 *msi_map = NULL;
-		int len;
-		u32 phandle;
-
-		msi_map = of_get_property(pcie->dev->of_node, "msi-map", &len);
-		if (!msi_map)
-			return -ENODEV;
-
-		phandle = be32_to_cpup(msi_map + 1);
-		msi_node = of_find_node_by_phandle(phandle);
-		if (!msi_node)
-			return -ENODEV;
-	}
+	of_msi_xlate(pcie->dev, &msi_node, 0);
+	if (!msi_node)
+		return -ENODEV;
 
 	/*
 	 * Certain revisions of the iProc PCIe controller require additional
-- 
2.50.1


