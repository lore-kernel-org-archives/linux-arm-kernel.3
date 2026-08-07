Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936ACC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DY/d6gKFTVZUvwR7r+EZgSjCPiJOiVZZbCY1T/z/Asc=; b=bnzxCC9po4qn6ayvxbDV3nzC7n
	9VYb4LhMRdMawqkOjTGDN0MBWMq77Uq78WGXs9hXTxwj+ObpYNIpRmu6BBrSlaCKIPQcUDp5i4q5E
	Aa2+3lWgCaBKf7H25fyxMWnlMdDB3I+X+GXUUk5moKkFU0f3YKGJsTd6XmKbyDXdhthNVedbG65ct
	Z2xl3v/YyUlHET8LKya+Q1gLjAzbwxDl7GZH6uRX6ENaXBwzxTCf+4HlxRn6eHovOtRY5/hLita8r
	930lF1IUWUU1VVm00nHEFf1neUwDTygi6l8CXcHergBRbgnPMJRadkFL9Khrfv41Lsm3BdJu0ti6D
	oZJkuoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN55-00000008OkS-2jgB;
	Fri, 07 Aug 2026 16:05:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN52-00000008Ojb-1g1M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:05:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso19614035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786118754; x=1786723554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY/d6gKFTVZUvwR7r+EZgSjCPiJOiVZZbCY1T/z/Asc=;
        b=YzjeXqijM0k2qrwtqsNbDgkkhtf29hBMdqBFvmOA9C94huvocgZfkgMEBf31Xq8VJq
         9XU4rk44I34VztorsbwT6SGnQoVwyxhH22sahFL37jHaTnxwaNMihcLKaQvS+PfkYbIK
         WwPo5d68yBCyj2M65eDSMucRQItGmVOw89HwvSV8dWA72m0Gyr2Se5gM9RIWNZ/HOIHQ
         HNHKZ/KCCZ5iBJ5ksYR9aEwI3GHdjN8ESwE2me+iLveiVT1zWQs+W272GPd8C3qg++GZ
         hq8vybQ5sHGA45nkMvRxXZC9VnoQ9Qu2dz8nKM2e7yjdCGWOxjL8S3u5omm/Ss/Xw9/U
         zImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118754; x=1786723554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY/d6gKFTVZUvwR7r+EZgSjCPiJOiVZZbCY1T/z/Asc=;
        b=F/42XqTEpo2/O6pA42l7iMxpcJZh1NJUg95fw9pidRTJVVKvzaV6PzQLL9TWKrhGaP
         6h336sYDGsV73w2L4on72hs9YmP3/9MWqvPTHsJtab6PRNWbYXIQYVBCrc6DRuUhxR1b
         e7EU1v5KUA5oI6Xbp3f4vNtZrBvheqyGG9FUK8XNoPaiAboQTgPLem7lnl8SWEIaaYY7
         yaTBQtWEnHbwRgEeXlNIbfeWi3+mWr2MAtLyNifrVivL0kG/fx98O2Y7bCpR5++U0oA/
         Q4YT0EHvdeeGBhgXv3TIWIlDej09J8JHC3BIc3ZAbQsMNuO0mbCTM7qb11AIFTxNDeJw
         wULw==
X-Forwarded-Encrypted: i=1; AHgh+RpouZy0A+PyWjNxPAlZbXfNMS8yO/6wI+sboCMVwuQxrHpoGA+UEE9YL5C820iT3scEN47ZFjUbvHeZAK94h2wA@lists.infradead.org
X-Gm-Message-State: AOJu0YzhpTYOAi3Wox1Ov6hC6yTd5H2GUQRLQVYouwTDEdxDYnzlsgrn
	fNtnHJd1wPZ7hhnaZghklWQipmmBOlMm1vxc4x4bmGD0uiaeyR/NbYZJ
X-Gm-Gg: AR+sD10oA2XkIWT84zYpQe7fFmdQG08fOhM0JI0p4nXooJOxQHxiR+xK1WoInmdM6ag
	1ZGm2+/9E2q0PDgDNzLnl22KyTdD0xBQrbzmk93gOrDZB/PI0Mm3IsG+Kf1+yCOOwL9Lgw5LGEK
	a/AH86G86jN0np3Fg/85/vugSb+fQhB7TSY7y7u1UUGlNfNOVmNZbsHQZZPUGh3ZyDr0fmA6xvH
	BbYbLorCx1YBoO+cgTqOjwRIn+OuPGHafPhhbD1P8YQO5+1rHLyDTD241NhC1yQH6xTFlIDZcBa
	j512LDe9AFVuBEi7vKfACOCYNj/r5X0xCrFSyVMxeKA/gxwgJjd8OoysiQyzn3bXOOa8kLmMBMu
	UwJhrRXF1Jx1jOUBPIKL6iqO2QLUY8jrHoJLurNNAOAkkvbSByWgA2REMngId7kseXhjP0GoMsN
	ioHf/TU5yaSKraLGKym0boRyBxEbEFzM+S3I+p8XOcTtysg5NnQ3/HXNfunrB9O8UQ40SaFF4i
X-Received: by 2002:a05:600c:1d20:b0:499:6123:ac11 with SMTP id 5b1f17b1804b1-4996123ac36mr16811575e9.11.1786118753602;
        Fri, 07 Aug 2026 09:05:53 -0700 (PDT)
Received: from SVR.localdomain ([86.106.74.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995428f294sm161481675e9.15.2026.08.07.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:05:52 -0700 (PDT)
From: Semih Baskan <strst.gs@gmail.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl,
	florian.fainelli@broadcom.com,
	arnd@arndb.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	rani.hod@gmail.com
Subject: [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
Date: Fri,  7 Aug 2026 19:05:26 +0300
Message-ID: <20260807160526.379-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090556_468658_EE9B2676 
X-CRM114-Status: GOOD (  22.72  )
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

The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
0x20000000 and 0x28000000. Broadcom's own driver branches on the core
revision for exactly this reason.

bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
Describe PCIe controllers fully") gave the controllers a ranges property.
The commit shipped in v7.1.

With that property present, two things go wrong with this driver:

 - devm_pci_alloc_host_bridge() parses those ranges and requests them,
   then this driver adds its own window and requests the whole list a
   second time, so every controller fails to probe with -EBUSY.

 - The DT window itself is only correct on core revision 0x07. On
   revision 0x01 it points at an address the hardware does not decode,
   and the first MMIO access to a BAR takes an imprecise external
   abort.

The enumeration ROM reports the correct base for the revision actually
present, and bcma already provides it as addr_s[0]. Drop any memory
window that came from the device tree and use that instead, requesting
only the window this driver owns. This makes the driver correct whether
or not the DT describes a window.

When a dropped window does not match what the EROM reports, print a
warning naming both. The mismatch means the devicetree describes a
window the hardware does not decode, and that should be fixed in the
dts rather than ignored silently.

The same commit also added compatible = "brcm,iproc-pcie", so these
nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
first and this driver's probe fails inside devm_pci_alloc_host_bridge().
This patch fixes the configurations where the BCMA driver is the one in
use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
platform path takes the DT window as-is and has the same wrong address
on core revision 0x01, so that side needs a devicetree fix either way.

Tested on an ASUS RT-N18U (BCM47081) and a Linksys EA9200 (BCM4709),
both core revision 0x01.

Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Tested-by: Rani Hod <rani.hod@gmail.com>
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
v2 -> v3: format the two problem descriptions as bullet points.
Requested by Bjorn Helgaas.

v1 -> v2: print a warning for every devicetree memory window that does
not match the EROM window. Requested by Arnd Bergmann:
https://lore.kernel.org/all/d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com/

v2: https://lore.kernel.org/all/20260807035726.387-1-strst.gs@gmail.com/
v1: https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/

 drivers/pci/controller/pcie-iproc-bcma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index 593418c2b..06a471f4a 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -36,6 +36,7 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	struct device *dev = &bdev->dev;
 	struct iproc_pcie *pcie;
 	struct pci_host_bridge *bridge;
+	struct resource_entry *win, *tmp;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
@@ -59,8 +60,22 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
 	pcie->mem.name = "PCIe MEM space";
 	pcie->mem.flags = IORESOURCE_MEM;
+
+	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
+		if (resource_type(win->res) != IORESOURCE_MEM)
+			continue;
+
+		if (win->res->start != pcie->mem.start ||
+		    win->res->end != pcie->mem.end)
+			dev_warn(dev, "DT window %pR does not match EROM window %pR, using EROM\n",
+				 win->res, &pcie->mem);
+
+		devm_release_resource(dev, win->res);
+		resource_list_destroy_entry(win);
+	}
+
 	pci_add_resource(&bridge->windows, &pcie->mem);
-	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
+	ret = devm_request_resource(dev, &iomem_resource, &pcie->mem);
 	if (ret)
 		return ret;
 
-- 
2.43.0


