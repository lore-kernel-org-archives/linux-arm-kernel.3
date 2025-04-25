Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P6dx24LcPTLqnmztGQ81vANm+nUct9U80WqazHI54k=; b=K34eLWPy03tvUc7/g1QgE6Uzd4
	lPZRHn7VoH+uk4Lqw3LKbzDtOpEN+XGxmdG4ahXS3vwVdn2ntTcjsgsq8JvgaHFx+mOotIw84M4sD
	zlhbQAeoaXGCNwEv89jfdhtq7+k5sWcoHnekfZMJ/sAQ8Cj+pCzEs5vdStd7IKfiu+6ss1adc74Yg
	pz+jeXCy7GGqTCm7Ds9AZ/KRxLQDq5O1GBEaadKwPSqz+hilgf4dicN0A6om/vNTuhF5ZXIRMJG89
	u60OHRfRK0HJcQB2J7gq/NdtfTIH2AlbySQNIOxRO+qOO8fvJU9VmEqC83yMTGpvyvRUh5PZ03Dix
	cUQanZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H4H-0000000Gvb1-2WQb;
	Fri, 25 Apr 2025 11:18:05 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fol-0000000GdaC-41nd;
	Fri, 25 Apr 2025 09:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9P6dx
	24LcPTLqnmztGQ81vANm+nUct9U80WqazHI54k=; b=BQHi4oT8vGRbvvroE56N0
	AyIgktZ1DIttAFQxJtXGIVB8Trkxgsa6kh6Wa8DIwPPKu0xxZt1HE5lCJrL0hYMv
	IngkQlKeaVuS67pE9u3zJJKIKQCD48Ne1OIhtZfTkTBscBgKlUcvVy8ejuSQ0U0f
	VZI0sp+ruS5VmlAlC+r/rw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAnfJt2XAtowU4iAw--.17018S4;
	Fri, 25 Apr 2025 17:57:16 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	thomas.petazzoni@bootlin.com,
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
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
Date: Fri, 25 Apr 2025 17:57:08 +0800
Message-Id: <20250425095708.32662-3-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425095708.32662-1-18255117159@163.com>
References: <20250425095708.32662-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAnfJt2XAtowU4iAw--.17018S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWUWr43Zry8Gr13Kr1DGFg_yoW5Ww17pF
	W3XrsayF4rtr45ua1DAa1rCFW3JasIkry7J39xW34fZF9IyFW7JFyayFWSka4fJr40gF10
	yF15t3y8A3W5trUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_EfYiUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDw06o2gLWGyMnQAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_025800_358297_1EE86A8B 
X-CRM114-Status: UNSURE (   9.05  )
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

With the PCI core now centrally configuring root port MPS to
hardware-supported maximums (via 128 << pcie_mpss) during host probing,
platform-specific MPS adjustments are redundant. This patch removes the
custom the configuration of the max payload logic to align with the
standardized initialization flow.

By eliminating redundant code, this change prevents conflicts with global
PCIe hierarchy tuning policies and reduces maintenance overhead. The Meson
driver now fully relies on the core PCI framework for MPS configuration,
ensuring consistency across the PCIe topology while preserving
hardware-specific MRRS handling.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
 drivers/pci/controller/pci-aardvark.c  |  2 --
 2 files changed, 19 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index db9482a113e9..126f38ed453d 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -261,22 +261,6 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
 	return fls(size) - 8;
 }
 
-static void meson_set_max_payload(struct meson_pcie *mp, int size)
-{
-	struct dw_pcie *pci = &mp->pci;
-	u32 val;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	int max_payload_size = meson_size_to_payload(mp, size);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-
-	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
-	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
-	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
-}
-
 static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
 	struct dw_pcie *pci = &mp->pci;
@@ -381,7 +365,6 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge->ops = &meson_pci_ops;
 
-	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	return 0;
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index a29796cce420..d8852892994a 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
 	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
 	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
 	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
-	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
 	reg &= ~PCI_EXP_DEVCTL_READRQ;
-	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
 	reg |= PCI_EXP_DEVCTL_READRQ_512B;
 	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
 
-- 
2.25.1


