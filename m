Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3726D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2D0/VtKDqUpRog+5t5t5DmSi0ECoMEow8bXhuzPCIA=; b=qoWB4e4Dt3T55JMwsbW0rk5jk8
	LfL3c5PDH/boebZoLPTHrxdg7Zrlfb2DKrvnDXYPnhI17pe9cjKBnVw2+XPb1JNe+2KpQAOxgu3SI
	1PFP1M46NexHoEt1Qw7NSR78gGCT0O3tYRYnj+dmwQtecCqVZyAWFsKSz5hZbxGA/jPCgI560Kn+i
	FhhUKyz7fUFoP6MvgPxaqm3jIyNuB3xa9k0/lxjvG8Dr9a8GpKg3sSrTGCRZTVMq4qJxLVKrf0Of0
	9z7nfRH7M7APrIaGKu74gmtb/8qheHhueK4jtf1liL/WnLApMs9kniMq/5wwEUJbPu6TJZx+EVKsC
	1+pQJkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlQC-00000002TuQ-3TBM;
	Tue, 12 Nov 2024 07:34:44 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlOL-00000002Tbh-1D5g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:32:50 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2V4hQ026848;
	Mon, 11 Nov 2024 23:32:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=M2D0/VtKDqUpRog+5t5t5Dm
	Si0ECoMEow8bXhuzPCIA=; b=SxyEzqCiLj5X6uDxcgGg8nqKCTeAu03VsQrmC5V
	kfkYFsL2Qol8JP9XZ2ypB8eTo7VeQ+V9lQ10pwcWDOYI89TBOoJ1lLKAalGGSxvx
	0gFtPi98iEa+t51H+9JfyF9ktWwPd3kX/jFZSyS0qf9HCOOY5tnw2VumFZu/oRwK
	wDiFcuf51MQmTdmrYUYjTHuvw1GZAZ1WWbFaL3IP+FtvdUF9QfdBeidk3AvknHnj
	Id8lQ5hApakcIywd4h5LH4joNaVdyWzi7nOThBFvjQYuiFd1/V3G1vobfvA3CroG
	NiQjYR9go655tn2Syl6VAoqIP72nh2IlsjDN6xtzi7gdxKw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42uxa40dh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 23:32:31 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 23:32:30 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 23:32:30 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id DCF543F7079;
	Mon, 11 Nov 2024 23:32:29 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <lpieralisi@kernel.org>, <thomas.petazzoni@bootlin.com>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] PCI: armada8k: Fix bar assignment failure upon rescan
Date: Mon, 11 Nov 2024 23:32:27 -0800
Message-ID: <20241112073227.769814-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bC87ndm-7f21n9n3gngKeaoInBfMOENY
X-Proofpoint-ORIG-GUID: bC87ndm-7f21n9n3gngKeaoInBfMOENY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_233249_362686_CA45DD8F 
X-CRM114-Status: GOOD (  16.02  )
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

When the attached device recovers the link from
an external reset, the following error might be
seen upon pci rescan.

On link-down event, it's not necessary to remove
the root bus. Only the child buses or devices
should be wiped off. However, the rescan operation
should be performed only when the link could be
retained. Otherwise, it should be done by a user
manually after the link is finally recovered.

~# echo 1 > /sys/bus/pci/rescan
[  322.857504] pci 0000:01:00.0: [177d:b200] type 00 class 0x028000
[  322.863682] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x007fffff 64bit pref]
[  322.871031] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x0fffffff 64bit pref]
[  322.878362] pci 0000:01:00.0: reg 0x20: [mem 0x00000000-0x03ffffff 64bit pref]
[  322.886845] pci 0000:01:00.0: reg 0x244: [mem 0x00000000-0x000fffff 64bit pref]
[  322.894193] pci 0000:01:00.0: VF(n) BAR0 space: [mem 0x00000000-0x007fffff 64bit pref] (contains BAR0 for 8 VFs)
[  322.905154] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x2 link at 0000:00:00.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
[  322.921371] pcieport 0000:00:00.0: BAR 15: no space for [mem size 0x18000000 64bit pref]
[  322.929507] pcieport 0000:00:00.0: BAR 15: failed to assign [mem size 0x18000000 64bit pref]
[  322.937999] pcieport 0000:00:00.0: BAR 15: no space for [mem size 0x18000000 64bit pref]
[  322.946131] pcieport 0000:00:00.0: BAR 15: failed to assign [mem size 0x18000000 64bit pref]
[  322.954614] pci 0000:01:00.0: BAR 2: no space for [mem size 0x10000000 64bit pref]
[  322.962225] pci 0000:01:00.0: BAR 2: failed to assign [mem size 0x10000000 64bit pref]
[  322.970193] pci 0000:01:00.0: BAR 4: no space for [mem size 0x04000000 64bit pref]
[  322.977804] pci 0000:01:00.0: BAR 4: failed to assign [mem size 0x04000000 64bit pref]
[  322.985766] pci 0000:01:00.0: BAR 0: no space for [mem size 0x00800000 64bit pref]
[  322.993373] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x00800000 64bit pref]
[  323.001331] pci 0000:01:00.0: BAR 7: no space for [mem size 0x00800000 64bit pref]
[  323.008938] pci 0000:01:00.0: BAR 7: failed to assign [mem size 0x00800000 64bit pref]
[  323.016903] pci 0000:01:00.0: BAR 2: no space for [mem size 0x10000000 64bit pref]
[  323.024511] pci 0000:01:00.0: BAR 2: failed to assign [mem size 0x10000000 64bit pref]
[  323.032469] pci 0000:01:00.0: BAR 4: no space for [mem size 0x04000000 64bit pref]
[  323.040079] pci 0000:01:00.0: BAR 4: failed to assign [mem size 0x04000000 64bit pref]
[  323.048037] pci 0000:01:00.0: BAR 0: no space for [mem size 0x00800000 64bit pref]
[  323.055644] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x00800000 64bit pref]
[  323.063601] pci 0000:01:00.0: BAR 7: no space for [mem size 0x00800000 64bit pref]
[  323.071211] pci 0000:01:00.0: BAR 7: failed to assign [mem size 0x00800000 64bit pref]
[  323.081914] pcieport 0002:02:03.0: devices behind bridge are unusable because [bus 03] cannot be assigned for them
[  323.092384] pcieport 0002:02:07.0: devices behind bridge are unusable because [bus 04] cannot be assigned for them
[  323.102857] pcieport 0002:01:00.0: bridge has subordinate 02 but max busn 04

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 drivers/pci/controller/dwc/pcie-armada8k.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index f9d6907900d1..ca2dedaa69a4 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -231,6 +231,7 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
 	struct dw_pcie_rp *pp = &pcie->pci->pp;
 	struct pci_bus *bus = pp->bridge->bus;
 	struct pci_dev *root_port;
+	struct pci_dev *child, *tmp;
 	int ret;
 
 	root_port = pci_get_slot(bus, 0);
@@ -239,7 +240,14 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
 		return;
 	}
 	pci_lock_rescan_remove();
-	pci_stop_and_remove_bus_device(root_port);
+
+	/* Remove all devices under root bus */
+	list_for_each_entry_safe(child, tmp,
+				 &root_port->subordinate->devices, bus_list) {
+		pci_stop_and_remove_bus_device(child);
+		dev_dbg(&child->dev, "removed\n");
+	}
+
 	/* Reset device if reset gpio is set */
 	if (pcie->reset_gpio) {
 		/* assert and then deassert the reset signal */
@@ -279,11 +287,12 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
 
 	/* Wait until the link becomes active again */
 	if (dw_pcie_wait_for_link(pcie->pci))
-		dev_err(pcie->pci->dev, "Link not up after reconfiguration\n");
+		goto fail;
+
+	dev_dbg(pcie->pci->dev, "%s: link has been recovered\n", __func__);
 
-	bus = NULL;
-	while ((bus = pci_find_next_bus(bus)) != NULL)
-		pci_rescan_bus(bus);
+	/* Rescan the root bus only if link is retained */
+	pci_rescan_bus(bus);
 
 fail:
 	pci_unlock_rescan_remove();
-- 
2.25.1


