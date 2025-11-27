Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B937AD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4BEwT/W3XQBlce+4mMjg1k8Az7t6B/IA1oEwR7bxT4=; b=PoltIgL+yBEMPFX/YsShVhpkYS
	/n1yZFDZH4onc+mdOzl1vlvUy2wKTD3LGqg0YsA3/+u/Eboc94xylQxUtUEvh56+naPSXRizB4agI
	stwYWZgZS1mVAAgaHQLpwDg7zySTaWilQE/wRYvIGBuvyCDvU5IotpCCUquBtHbI1uhwqQKHaatEb
	e8BqOq84QdO5uMO/lH01Imx31atfmU6kbSe7aQttEASrL+ulVyLeGvbHpGMAnyD3Pu+U+JnPYFR6I
	iGwExB48VkJY9mlLczUk6xHIDrmugDh99mjsXP424k0UeidC3qIuHB9DbeR5BwfNVBLdR1XwPJadD
	rg/wiIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfVN-0000000Gy0H-36np;
	Thu, 27 Nov 2025 17:10:05 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfVL-0000000GxyD-2D65;
	Thu, 27 Nov 2025 17:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=p4
	BEwT/W3XQBlce+4mMjg1k8Az7t6B/IA1oEwR7bxT4=; b=HPevv09xcNHbDY2eOg
	1Rf/8YCvaecuIRMb7ZFfrihMYAcMaBYOXZftMvF+9CZRbAH9rQ5e69LQa2iM0ESw
	EMCAV0+/TjKJ343vJmy2vI5MCqzrahW3Of4mWqy3amrcEl/DBj/TpCzVfLA8WzPH
	m3t96BHgcbyp1bpBnUsaA/xj4=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX71K2hShpkFjfDA--.43603S3;
	Fri, 28 Nov 2025 01:09:13 +0800 (CST)
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
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v7 1/2] PCI: Configure Root Port MPS during host probing
Date: Fri, 28 Nov 2025 01:09:07 +0800
Message-Id: <20251127170908.14850-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127170908.14850-1-18255117159@163.com>
References: <20251127170908.14850-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX71K2hShpkFjfDA--.43603S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DCr43Xr1rAr4DKFy7Awb_yoW8KFyDpa
	yUWanYyFn7GF43ZanrA3W0vFyYqF93ArW3GrZYv34qvan8AryDJrW7ta95Jwn7GrWI9Fya
	vFn8try7CasFvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPCztUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:9218:e74d:98cf:7e7c]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOh4To2kohTEP5AAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_091003_899918_5BD40814 
X-CRM114-Status: GOOD (  10.55  )
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
Signed-off-by: Hans Zhang <18255117159@163.com>
Tested-by: Mahesh Vaidya <mahesh.vaidya@altera.com>
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
---
 drivers/pci/probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9cd032dff31e..3970d964d868 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2203,6 +2203,18 @@ static void pci_configure_mps(struct pci_dev *dev)
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
+	    pcie_bus_config != PCIE_BUS_PEER2PEER)
+		pcie_set_mps(dev, 128 << dev->pcie_mpss);
+
 	if (!bridge || !pci_is_pcie(bridge))
 		return;
 
-- 
2.34.1


