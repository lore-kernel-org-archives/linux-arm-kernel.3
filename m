Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E193C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjYFaSOXw6nvqbq4IDi+uXJUjRekOycaZIZRolfobi0=; b=wOkgC96m6mvN1PpyIaAM3oxavF
	K8FYI1HNC8g6lMzLA8gll23UK+CKVZM181a5qRLSJWm03pa5uYScKsClT8lcButMpcE5IKCprK9sF
	0irgKrLsRORNqmarqUNIhKR+UahBykF44ov8PUez236LxMkejfmEiJdKPBqcZLh7L6GaSwqwhM5ii
	oEj5HVM/+1wQiExoCNVu5ecBdqDgjpVwQso1gSYyLlkqS012dD9enHCaCWGCLS3pJgVFR5u5j/6w9
	EpYHQ5Jsk5PLzUyGaViL2qHp1uSUI1McSIAHm1s2LvZ6LNF0SkXdzlzBhaG1im6ipvr3jRmichnke
	l/XRPSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQsV-0000000DbdG-1jvL;
	Tue, 06 May 2025 22:35:07 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMCc-0000000Cre7-2bN0;
	Tue, 06 May 2025 17:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pjYFa
	SOXw6nvqbq4IDi+uXJUjRekOycaZIZRolfobi0=; b=fvyufsTQd2ABuLR+pk0LT
	13Dqm5uQ1Z9Oqfn4YkO7iSVzazDCH8W5MI3iIva/Kl9WrzCg9sTdWN+fFGaxy1UF
	hyGy2iebiM3D8kl6urgiyBYcem4IgVVmH50/yYnWsRBN9Q8CCECU/+L8wgMfNOzp
	nBBQspJQWe9LxXQRIiA4as=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAX_U4ySBpoVmZeEw--.15363S3;
	Wed, 07 May 2025 01:34:44 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v3 1/3] PCI: Configure root port MPS during host probing
Date: Wed,  7 May 2025 01:34:37 +0800
Message-Id: <20250506173439.292460-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506173439.292460-1-18255117159@163.com>
References: <20250506173439.292460-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX_U4ySBpoVmZeEw--.15363S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4rCrW8KFWrtFy7GF43GFg_yoWrAF1rpa
	y3XFWftrZ7GF1fWanxJa109w15trsav343trZxGw1F9w15AFyUKryYya1rJas7GrZ7uFya
	vr90qry8WanYvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi2NtcUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOg9Fo2gaRElteAAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_103535_055868_560AE46E 
X-CRM114-Status: GOOD (  16.83  )
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

Current PCIe initialization logic may leave root ports operating with
non-optimal Maximum Payload Size (MPS) settings. While downstream device
configuration is handled during bus enumeration, root port MPS values
inherited from firmware or hardware defaults might not utilize the full
capabilities supported by the controller hardware. This can result is
uboptimal data transfer efficiency across the PCIe hierarchy.

During host controller probing phase, when PCIe bus tuning is enabled,
the implementation now configures root port MPS settings to their
hardware-supported maximum values. By iterating through bridge devices
under the root bus and identifying PCIe root ports, each port's MPS is
set to 128 << pcie_mpss to match the device's maximum supported payload
size.

Explicit initialization at host probing stage ensures consistent PCIe
topology configuration before downstream devices perform their own MPS
negotiations. This proactive approach addresses platform-specific
requirements where controller drivers depend on properly initialized
root port settings, while maintaining backward compatibility through
PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
utilized without altering existing device negotiation behaviors.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/probe.c | 66 ++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 364fa2a514f8..365d9a7dd37f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2149,6 +2149,37 @@ int pci_setup_device(struct pci_dev *dev)
 	return 0;
 }
 
+static void pcie_write_mps(struct pci_dev *dev, int mps)
+{
+	int rc;
+
+	if (pcie_bus_config == PCIE_BUS_PERFORMANCE) {
+		mps = 128 << dev->pcie_mpss;
+
+		if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT &&
+		    dev->bus->self)
+
+			/*
+			 * For "Performance", the assumption is made that
+			 * downstream communication will never be larger than
+			 * the MRRS.  So, the MPS only needs to be configured
+			 * for the upstream communication.  This being the case,
+			 * walk from the top down and set the MPS of the child
+			 * to that of the parent bus.
+			 *
+			 * Configure the device MPS with the smaller of the
+			 * device MPSS or the bridge MPS (which is assumed to be
+			 * properly configured at this point to the largest
+			 * allowable MPS based on its parent bus).
+			 */
+			mps = min(mps, pcie_get_mps(dev->bus->self));
+	}
+
+	rc = pcie_set_mps(dev, mps);
+	if (rc)
+		pci_err(dev, "Failed attempting to set the MPS\n");
+}
+
 static void pci_configure_mps(struct pci_dev *dev)
 {
 	struct pci_dev *bridge = pci_upstream_bridge(dev);
@@ -2178,6 +2209,10 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 	}
 
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+	    pcie_bus_config != PCIE_BUS_TUNE_OFF)
+		pcie_write_mps(dev, 128 << dev->pcie_mpss);
+
 	if (!bridge || !pci_is_pcie(bridge))
 		return;
 
@@ -2875,37 +2910,6 @@ static int pcie_find_smpss(struct pci_dev *dev, void *data)
 	return 0;
 }
 
-static void pcie_write_mps(struct pci_dev *dev, int mps)
-{
-	int rc;
-
-	if (pcie_bus_config == PCIE_BUS_PERFORMANCE) {
-		mps = 128 << dev->pcie_mpss;
-
-		if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT &&
-		    dev->bus->self)
-
-			/*
-			 * For "Performance", the assumption is made that
-			 * downstream communication will never be larger than
-			 * the MRRS.  So, the MPS only needs to be configured
-			 * for the upstream communication.  This being the case,
-			 * walk from the top down and set the MPS of the child
-			 * to that of the parent bus.
-			 *
-			 * Configure the device MPS with the smaller of the
-			 * device MPSS or the bridge MPS (which is assumed to be
-			 * properly configured at this point to the largest
-			 * allowable MPS based on its parent bus).
-			 */
-			mps = min(mps, pcie_get_mps(dev->bus->self));
-	}
-
-	rc = pcie_set_mps(dev, mps);
-	if (rc)
-		pci_err(dev, "Failed attempting to set the MPS\n");
-}
-
 static void pcie_write_mrrs(struct pci_dev *dev)
 {
 	int rc, mrrs;
-- 
2.25.1


