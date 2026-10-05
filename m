Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0766CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nzUTkMGw2FUAW6LuwD/ZNDODRpqoHDAQwQFc1CjSYPg=; b=fcKSLlR3iyLPpUZVfHRjGFVs4F
	CTDBc1kQAf8kFuUWEeRcZoEeZjVBWLJkOLfURnXgr2sSKhAXYspXw8+xbZ+gBIuilzb/byuZpBQBS
	Vn52nINOlEjAuj/LVAh1oescVJu1AV5m2P0joQAyE4azsAn7H/JzP1wMOPFs8Fp8U4ZJwn81w9ux2
	Z3UY51IyxE9YX68q01EtyzZ7GcO4NaJxlXV+TBnWDn+lUXwv23ZLjzvA2hnN5BnsbsIiBwLaL2mKL
	zrCe7mRsRwWr4fr2f5cOcQsxiMipj18En+iEOagyTn0vavlUUsevFaWteSR11GTzLVqx8WeAVJGvE
	yiroBlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDi15-0000000GPxM-35D2;
	Mon, 05 Oct 2026 12:42:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDi14-0000000GPxC-27IK;
	Mon, 05 Oct 2026 12:42:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8096022E;
	Mon,  5 Oct 2026 12:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493DE1F000FF;
	Mon,  5 Oct 2026 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204121;
	bh=nzUTkMGw2FUAW6LuwD/ZNDODRpqoHDAQwQFc1CjSYPg=;
	h=From:To:Cc:Subject:Date;
	b=SiJWDRnvdHzX5L6j68vY9lMX0NVa03XwvfSvzf9ju2puAsQL5sjT2lbkHuEvJw9P0
	 jiW+mSmxbW4acqy/D1vZXZJsI9ri3fXUKKyOrCQh4PJvSVmn19hhHRR7tiFxK9q2rm
	 K/XOJ02by9haIwWOkBm3a1EjV1WfktXnv/CIzMQBcJArea24vvJvy1E13ZMsdutB+C
	 WseB7a3CSe1yZGKa7IxufovwcxV6I3WO+RNhZP7NadDWUIf+BTRINAQnCl027+jsHl
	 66DUjOsMW7Cn8pc/7w14/maEAWMPc0kP6Tw9CNl0jguVMdvXlP1rKF4J327D/88QuE
	 8sbuOPjsxCzaQ==
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] PCI: Update saved Max Payload Size in pcie_set_mps()
Date: Mon,  5 Oct 2026 14:41:55 +0200
Message-ID: <20261005124154.2190628-2-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263; i=cassel@kernel.org; h=from:subject; bh=FB+arrFjBGrAlUmQqtf4EI5iCQwOgK1EVKfXkbU9/y4=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLIOzxayd460vzbjx9cSf+9520VljzBufGFU6Vrdoj2Fy 8t8kTFnRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACZiG8rIMC2H+Zzy91Wxb2va tS3aNmSWV5wIcau1/rJy56Udhdt2bmdk+ObpJiHfI3Q8YqLC7I0Ryy1uzKybetzn15FJue+aLN/ cZgAA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
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

pcie_set_mps() changes the Max Payload Size (MPS) in the Device Control
register but leaves the copy saved by pci_save_state() alone, so the next
pci_restore_state() puts back the old value.

The PCI core does change the MPS of devices whose state has already been
saved: pci_configure_mps() reduces a Root Port's MPS when a device with a
smaller MPS Supported is hot-added directly below it (commit 9f0e89359775
("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")), and with
"pci=pcie_bus_safe", pcie_bus_configure_settings() can do the same when
pciehp calls it after a hot-add.  The Root Port's state was saved when it
was added and again when portdrv probed it.

Since commit 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root
Ports in a platform-specific way"), pcibios_reset_secondary_bus() restores
that saved state, without saving it first, after host->reset_root_port()
has reset the Root Port, e.g. during AER recovery or on Link Down with the
qcom and Rockchip DWC drivers.  The Root Port then goes back to the old,
larger MPS while the device below it is restored to the smaller one, so
the Root Port may send TLPs that the device treats as Malformed.

Update the saved copy of Device Control when pcie_set_mps() changes the
MPS, like commit 909f7bf9b080 ("PCI: Update saved_config_space upon
resource assignment") does for BARs.

Fixes: 3fc686d550f6 ("PCI/ERR: Add support for resetting the Root Ports in a platform-specific way")
Assisted-by: LLM
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
This fix was originally sent out as part of my RFC series:
https://lore.kernel.org/linux-pci/20260930145017.1356088-6-cassel@kernel.org/

But sending this fix as a separate patch, as the fix is really unrelated
to the rest of the series, so it could be picked up independently.

 drivers/pci/pci.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8cc6a89130b5..f3b82eb7bfaf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1736,6 +1736,24 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	pcie_capability_write_word(dev, PCI_EXP_SLTCTL2, cap[i++]);
 }
 
+/*
+ * Update the saved copy of the Device Control register after changing it, so
+ * that pci_restore_state() doesn't put back a stale value.  Device Control is
+ * the first register saved by pci_save_pcie_state().
+ */
+static void pcie_update_saved_devctl(struct pci_dev *dev, u16 clear, u16 set)
+{
+	struct pci_cap_saved_state *save_state;
+	u16 *devctl;
+
+	save_state = pci_find_saved_cap(dev, PCI_CAP_ID_EXP);
+	if (!save_state)
+		return;
+
+	devctl = (u16 *)&save_state->cap.data[0];
+	*devctl = (*devctl & ~clear) | set;
+}
+
 static int pci_save_pcix_state(struct pci_dev *dev)
 {
 	int pos;
@@ -5983,8 +6001,12 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 
 	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 						  PCI_EXP_DEVCTL_PAYLOAD, v);
+	if (ret)
+		return pcibios_err_to_errno(ret);
 
-	return pcibios_err_to_errno(ret);
+	pcie_update_saved_devctl(dev, PCI_EXP_DEVCTL_PAYLOAD, v);
+
+	return 0;
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
-- 
2.55.0


