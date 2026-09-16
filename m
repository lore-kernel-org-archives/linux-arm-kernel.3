Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756B6C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXXLyITMJT1yST+MFquna26ESmZnA30Nae1jXyWuEoU=; b=m0jb0YbYw0tWik14h5xBulycts
	3Z6n1LRdMyPnEW+esl42TBjDpAbqg8e/YOF6KR18D207nZMpM4Azn8NPhq3b9CPZbVwQMgRyCpWdj
	FF5beNejvZkI3WU1zzxo5qrSqFIFJszey3/QF5ubP6QGEQGjlb/4m2Rm1anw9i9Mq4FzzmRBbYMeB
	7V0TOGWaTGJ3a2iYo9FpGqAgLXkOGSb4I3ELH2gYpYQrqs3j4EW/rF5lIWI8/KMls5yOZi64WGsxb
	3rkKhuc+L4xTEWE4mXVyHcAIHtPDEKJ444K6B+d/nd1pri1SItVX1/U+fMaIhzs2O+q4s9fG+ZMlq
	RZp19q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjy-00000009c1M-00xG;
	Wed, 16 Sep 2026 15:40:06 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjs-00000009bsp-2Zcn;
	Wed, 16 Sep 2026 15:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tX
	XLyITMJT1yST+MFquna26ESmZnA30Nae1jXyWuEoU=; b=R4mSVdX04i829VBmYT
	cmXwOwWC7FEurPwMRCcJeY0lIReA6OQdYVbBFjfxBeKwNXP0pHKRfK+uFKw4qmlf
	tMVnF5VOgpVzljpaGoGx40wnuzRu0CmRZsTGDVEdLTDEuPuwhtOlNVPAgC53Bgbt
	C1DZTQj8Sl3frPxwHVVqYEhco=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnbxQduKpqGzAlBA--.54876S4;
	Wed, 16 Sep 2026 23:39:12 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>,
	Mahesh Vaidya <mahesh.vaidya@altera.com>,
	Ricardo Pardini <ricardo@pardini.net>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v9 2/3] PCI: Configure Root Port MPS during host probing
Date: Wed, 16 Sep 2026 23:39:06 +0800
Message-Id: <20260916153907.60344-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916153907.60344-1-18255117159@163.com>
References: <20260916153907.60344-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnbxQduKpqGzAlBA--.54876S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4fJF15AF47uFWUuw4UArb_yoW5GrWkpa
	yUWanYyFs7GF4fZFsrZ3WFvFyYqF93Zry3GrZ3Z3s0van8Zr9rJrWaya95Jw1kGrZ7KFya
	vFn8try8u3ZIvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEVyIbUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:a95a:12fc:887a:b0f1]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAB7H2qquCBtpwAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_084000_997506_A4A86371 
X-CRM114-Status: GOOD (  11.73  )
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

Current PCIe initialization logic may leave Root Ports operating with
non-optimal Maximum Payload Size (MPS) settings. The existing code in
pci_configure_mps() returns early for devices without an upstream bridge
which includes Root Ports, so their MPS values remain at firmware
defaults. This fails to utilize the controller's full capabilities,
leading to suboptimal data transfer efficiency across the PCIe hierarchy.

With this patch, during the host controller probing phase:
- When PCIe bus tuning is enabled (not PCIE_BUS_TUNE_OFF) and not
  PCIE_BUS_PEER2PEER (which requires the default 128 bytes for optimal
  peer-to-peer operation), and
- The device is a Root Port, the Root Port's MPS is set to its maximum
  supported value.

Note that this initial maximum MPS setting may be reduced later, during
downstream device enumeration, if any downstream device does not support
the Root Port's maximum MPS.

This change ensures Root Ports are initialized to their maximum MPS before
downstream devices negotiate MPS, while maintaining backward compatibility
via the PCIE_BUS_TUNE_OFF check and not interfering with the
PCIE_BUS_PEER2PEER strategy.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
Tested-by: Mahesh Vaidya <mahesh.vaidya@altera.com>
Tested-by: Ricardo Pardini <ricardo@pardini.net> # on Odroid-HC4
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
---
 drivers/pci/probe.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 232bce2819f0..08af75aa7366 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2248,6 +2248,21 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 	}
 
+	/*
+	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all) or
+	 * PCIE_BUS_PEER2PEER (use minimum MPS for peer-to-peer), set Root Ports'
+	 * MPS to their maximum supported value. Depending on the MPS strategy
+	 * and MPSS of downstream devices, a Root Port's MPS may be reduced
+	 * later during device enumeration.
+	 */
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+	    pcie_bus_config != PCIE_BUS_TUNE_OFF &&
+	    pcie_bus_config != PCIE_BUS_PEER2PEER) {
+		rc = pcie_set_mps(dev, 128 << dev->pcie_mpss);
+		if (rc)
+			dev_warn(&dev->dev, "failed to set root port MPS\n");
+	}
+
 	if (!bridge || !pci_is_pcie(bridge))
 		return;
 
-- 
2.34.1


