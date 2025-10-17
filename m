Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D77CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8XTtnAloymFsZu+9YfFFFgE7V8uPq5CDpA674L6UNk=; b=YjPkSWJ1P+HsuVaxnRIo4mkJ2e
	qPY0SKyMF8vy89RDETWeq599hTzTqjT3TcZ4DhwPFHcKguTJLSJpcxytaCyf41PtxGAhMUe5DAAPm
	gOW8qZ7f3dnwRJ1NTGFd9C0BVf+WZbwNaqL571RxO+h2VBA90EQT+QHOOu6a03suZRJDJCDhachBg
	AoZ8ftyHNTz6k14FCP9NvszfxmvYJtVXb5XKDuZffkCHysRB5pRglGAi8uC3s1DiNPeMwTkSAxtOw
	T2GmpMhQer45/smUolDnFNv5SMdOWwAcpOABP9CSgfYDPk6CYXRcP9f1TG+9P3vNirvXUhJO6gP5Z
	uEC9fd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8I-000000077r7-2laj;
	Fri, 17 Oct 2025 08:48:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8H-000000077pH-0r0H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E12B604EE;
	Fri, 17 Oct 2025 08:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955CEC19422;
	Fri, 17 Oct 2025 08:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690896;
	bh=web6L5TPZtt08mmDaVYY7W2Sw34M19ouNiW4LSSozIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtOQZkVCkVnVCHdtENUCT0nGeZ0l/MU+FQuzWIav1SV3uxLLVwPqSFTTrz+Jj0wCX
	 VU1hymP0EmTcTF9OYHeLQRPRkYsgPtgbwfZ3nC4djnDHs0cND15KNIOnBeDoIhEzHE
	 LK9hxvF9AhqybfE2xcjQR0HbOWaDYVIxSxrEEeRHBDLNArWEM5WhXDboiY6C6Ryso6
	 ZQKKEfsP4D0FddZohwDDB1U5AO0fuQ1pJqVqZc6B5PY7K6eZKFbyUBTkO8/f+JfELA
	 BBxT5GyhkD2eTw40KnBJSvrTeEPVGZumrO7KBFjOUwEaJG5rKnk+PUfcRIkCrl3GYE
	 NqDdMHL/26zgQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 4/5] PCI: iproc: Implement MSI controller node detection with of_msi_xlate()
Date: Fri, 17 Oct 2025 10:47:51 +0200
Message-ID: <20251017084752.1590264-5-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017084752.1590264-1-lpieralisi@kernel.org>
References: <20251017084752.1590264-1-lpieralisi@kernel.org>
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


