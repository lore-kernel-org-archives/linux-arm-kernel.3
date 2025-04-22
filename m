Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3050EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcMbMshhTN629KReXGX3TYRD3YyfD5t4evcTtPI62xY=; b=bqPmuW/7eliY4Oazhqxy1/ZoiS
	886Lg34g+J2kdsCIgJzNwKgbaaYI6Y1nlQg0VX8H+e7iPoIqmvrmgou6MiwwILVf8U7LEdYlPawYt
	vHPpeOhxPidRusIrka4ilMazTM2FJwBI/WCyLBD8lu7DGYrc6bZ7kJaqFITba6/CC/dgZVVSxeqfW
	NKlqYjt8OIo8AR/QKq/XerC8Byx/mVgg66XG9sH94scjTgelPK/ndGip1dRLqWXdu6O8ojs7Ew4SV
	tV+RuoxpeOTdumJ9pY6s4vNS6l2Jd5F5tYhoCcXTbNPx2NiQX328V8mVonbDBZKrprPElWeyDTDCj
	YLD/Lryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CMm-0000000736V-27SX;
	Tue, 22 Apr 2025 12:04:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BoM-00000006wX7-2CRR;
	Tue, 22 Apr 2025 11:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UcMbM
	shhTN629KReXGX3TYRD3YyfD5t4evcTtPI62xY=; b=ffWwJuQlVGRB3iU6gQehP
	RX2Fm49XILUdXAOPl3uNeKlx6gXE0ilHB2zMdPj2dzM7YpMicYUeWg95HUadpkIs
	1gdztOSczSG7t9OLwDcwdXfZffMRCt1z0vv3hJumHxuqBm2EYDpjgMgedGg1I9jc
	J35CogHN9LzIFOwnXMMHeU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCXbK1gfQdoRW2NBg--.44191S5;
	Tue, 22 Apr 2025 19:28:38 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 3/3] PCI: dw-rockchip: Unify link status checks with FIELD_GET
Date: Tue, 22 Apr 2025 19:28:30 +0800
Message-Id: <20250422112830.204374-4-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422112830.204374-1-18255117159@163.com>
References: <20250422112830.204374-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXbK1gfQdoRW2NBg--.44191S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF15Gr13CFWxtr1UZr18Zrb_yoW5XFyxpa
	98AFWqkF48Gw409F1kCa98XrWFyFnI9ayUCrn7K3WxW3ZIyr1UW3WUWr9xtr4xJrs8CFy3
	Cw4rta4xJF43ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRvdyUUUUUU=
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwo3o2gHegppZgAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_042910_866264_D2761E83 
X-CRM114-Status: UNSURE (   9.99  )
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

Link-up detection manually checked PCIE_LINKUP bits across RC/EP modes,
leading to code duplication. Centralize the logic using FIELD_GET. This
removes redundancy and abstracts hardware-specific bit masking, ensuring
consistent link state handling.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index cdc8afc6cfc1..2b26060af5c2 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -196,10 +196,7 @@ static int rockchip_pcie_link_up(struct dw_pcie *pci)
 	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
 	u32 val = rockchip_pcie_get_ltssm(rockchip);
 
-	if ((val & PCIE_LINKUP) == PCIE_LINKUP)
-		return 1;
-
-	return 0;
+	return FIELD_GET(PCIE_LINKUP_MASK, val) == 3;
 }
 
 static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
@@ -499,7 +496,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	struct dw_pcie *pci = &rockchip->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
-	u32 reg, val;
+	u32 reg;
 
 	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
 	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
@@ -508,8 +505,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
-		val = rockchip_pcie_get_ltssm(rockchip);
-		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
+		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
 			/* Rescan the bus to enumerate endpoint devices */
 			pci_lock_rescan_remove();
@@ -526,7 +522,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	struct rockchip_pcie *rockchip = arg;
 	struct dw_pcie *pci = &rockchip->pci;
 	struct device *dev = pci->dev;
-	u32 reg, val;
+	u32 reg;
 
 	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
 	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
@@ -540,8 +536,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	}
 
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
-		val = rockchip_pcie_get_ltssm(rockchip);
-		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
+		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "link up\n");
 			dw_pcie_ep_linkup(&pci->ep);
 		}
-- 
2.25.1


