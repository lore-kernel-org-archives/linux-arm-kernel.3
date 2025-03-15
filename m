Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2ACC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuZ/crdGc26iszRm2Ygt7jerJJZWI96IYNjt0v5KnSM=; b=4KHcgldyh7l3F9b4O6XeGg1+wm
	6MQHVgHQD5Y40a3YE91Z0Jjo11VEbxnJU/hooY1PjCKnLsDnawEYe4YsQkF3oPmnsHDUsh4ADTJXk
	V56yHL2Tgu2eTkJFTosO6X1GJaSvIJi4NxPrRZ0115N2GoaXtRspeu12pwuPt3D9Gs6gbDGj1kz2R
	k467OrtdOIf3ccSsY36K+hmXAqLZKTYhfZbwBYjSdJFDlUbEgCoEuyf62Dq/oIPotEBUGnM2x1wJm
	sH0qw3Kf5ISyvvW9QmHHEQiXowtr5ZMdkaGeQ0dXQt8mEWY2R6WGgj263vlASDVbF/6EQUSrR/oQU
	yGLz8sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXzL-0000000GoLv-30D2;
	Sat, 15 Mar 2025 20:20:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvL-0000000GnRT-1wxq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B3405C4382;
	Sat, 15 Mar 2025 20:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56371C4CEE9;
	Sat, 15 Mar 2025 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069757;
	bh=ce45hTdaEpFy2QpraH0ZrMeEMIsCGcxs2/r8PQnCB4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9hWYw9WrbGTWUJaOVmESjkIwtQr902psTdxYdA+Kty7jkGwfjdLBPBxkh8PguMGd
	 4cOCqpZ7BwFVe+Kd/oPf0HFffeRnxRUCsYDDBBUpmJhwW+GATHh9r5TJU69qG8aPLR
	 /ptE87LGlu+ASzit/SZmFK5szS5CqH4c/q9y2gvoTRdiXY3w/FO4E1jsvQmSv7gxmX
	 SJuLJ9Mu+bwnm2Eb2KO23zSaPK/Afhd5ejL4KIP5Ou7AQDOy7nuYoJLgjKA2XUN3En
	 IdYeTeCTA1u9SJW6FeCYI+Kd/ii5ZR5ZrUEXtgcSlNKh57oc2ASFbKQMwaeiZ2Canu
	 SIJfTIKCyzB7g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 01/13] PCI: dwc: Use resource start as iomap() input in dw_pcie_pme_turn_off()
Date: Sat, 15 Mar 2025 15:15:36 -0500
Message-Id: <20250315201548.858189-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131559_580801_7174C295 
X-CRM114-Status: GOOD (  11.92  )
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

From: Frank Li <Frank.Li@nxp.com>

The msg_res region translates writes into PCIe Message TLPs. Previously we
mapped this region using atu.cpu_addr, the input address programmed into
the ATU.

"cpu_addr" is a misnomer because when a bus fabric translates addresses
between the CPU and the ATU, the ATU input address is different from the
CPU address.  A future patch will rename "cpu_addr" and correct the value
to be the ATU input address instead of the CPU physical address.

Map the msg_res region before writing to it using the msg_res resource
start, a CPU physical address.

Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-1-01d2313502ab@nxp.com
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..ae3fd2a5dbf8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -908,7 +908,7 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	mem = ioremap(atu.cpu_addr, pci->region_align);
+	mem = ioremap(pci->pp.msg_res->start, pci->region_align);
 	if (!mem)
 		return -ENOMEM;
 
-- 
2.34.1


