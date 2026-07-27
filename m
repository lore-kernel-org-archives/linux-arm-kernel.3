Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7356AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZQGufv8V5UALActQvoi2xI1X049Urg9KaUNIMjb1xY=; b=o+IpcrkPpkDs3+/TtxFnfzEfDm
	6h2NGzP8bpCN+enx1aaW17szutisWguyXzGleoKemf9xMZr+UvvGu1mwoSNKvXjKW9/ccPr8h6Lkk
	YTkB8VH7876LZWpkL1zrPIVprSfLghKR7MZhDaCvUYiAzfkzrbNGT3dJ5kKl+fF2kTBDnA1tHO7zU
	XF9PBbVdtpDAhQtGbLanRc0tiEI39+axKums1hMv7pxRZe53/zN8n/s8viegjQOeXJCXLdH0kFogx
	XFJ9ragL+oZQgrP/8wf2v+uWYfpDpJA3w1yKbev3TM/UbGw/7Yt6jTE1+sBaBpGu7zBKTDHRjfVti
	BMPxnFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woM1f-00000002wSb-1HuM;
	Mon, 27 Jul 2026 14:09:51 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woM1c-00000002wRu-0z9h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:09:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69fec980a30so1318423a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785161386; x=1785766186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZQGufv8V5UALActQvoi2xI1X049Urg9KaUNIMjb1xY=;
        b=JRth6fZqCPyVQ5hCSecM68sIEQp/QCRT90b4X/xXABP5/twneKGlA1PSGOhhH/ELM7
         oXGRqYlb01+UWBrCQJ+hdwTm4CRkEK1EQfSK0IduA8d3Pp0K+Jq1klR6jhMR665c0CjH
         Rhrqj/bhsAP6NRyq+nrRjnbxHtgiQ0E7BvAzgYCU33oZHQbRZ8LqlY/Mv1WOAvNnrX2w
         KYSB8OxImPwmFNMF+TunEbKBfDmhI7jmEY6paZLV3XYvTrqG7LqjXKSyP5olxTscdbS0
         Fm2sVSWT5xIz5gyDA1IRmfu+cV3GFHapxsVkdNJqOFKrq15pPViKQpUAUvh/RG00xYPU
         KysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161386; x=1785766186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZQGufv8V5UALActQvoi2xI1X049Urg9KaUNIMjb1xY=;
        b=MKv29OYocugGLzWPCBzw37+or2LLs4lHZPQDLxEAUv9WP37kpAQTciJv9gkhAjXMmA
         sVqz8xtv75InaXcPHnUgjqa2OPL0T4PKuqFKu9r3AtMMWPfCYRtnESuTA/lAf9IA7JDk
         6+D8HEGkevGMjmaPWEn1DiAqhajuuo321LCzJYaDj6+SBxcI79HBI39w6V8TMEXEGZbw
         UM9fWo8h5fTLRF7UEnZlE9q4bkfPOOYA+MwByfEhjWB+EVjEFZx4he/XbTvFkt2Pt7sk
         UCwZkF+dZGSzp5tU3CzbA78r1DH4RL25npqEq15QM68etgW5ZihSV05oRDvyCgCHbz68
         dojg==
X-Forwarded-Encrypted: i=1; AHgh+RqknF/iu8aiJAX16YY5IepV4p4AuklpFyeX9SRvKl1sAJI6VNUyg+tjAekEXLUcUmCkxstx/wU7DuoxVO0p1cgc@lists.infradead.org
X-Gm-Message-State: AOJu0YxEM/TF5cPfNyAzUNjWae8qxFzgdAEc/Z2H3TcplD023zzQv9Ia
	FJ9wm8Q49eQgLsIkfpEZuRHwztCNXjy433xaONqGzfcryoJ0NPCdx9wMI/K5QuA6nUE=
X-Gm-Gg: AR+sD119zJGKV/tKAJ65+RlPQEGWGCZ6diCNB0uxg9Em8DkvjG0gXdiBnIqEZ8bRZfm
	viBhTTCn666guQZ5PkCAxOylHisWQuElaQoIUR6+hBDAmanlCiswvyDHsSPBx2jn1Wgl7Cq+Uk0
	/e7jXKJFHvl4utCp+EyTpx/8a4pLL1+teTlDTcy5r5rADm5bXJ1TRvFjsAAatjJhO9HOhZ6Xw8P
	HgJpr5vA0wsGO396ICM6UICa0do3TfPxg3B12+zBIjHSRh+9olW2yHIgtsKQFYgmOUmt13U0gm1
	e8IsqvFLoJ5t+qepHfq0ghyBY0yq4PoxyAKWVWjj2nShtXfp8Vdvj8qdOeRU4RtP2pLu0PDya9X
	HzNA8bju5HopnL1GZfhsyVfwHQTMXqtLKMmzwOJ7yAlZit+pfVVQk/KloN+b4Cb1UCb7/Mx4uSg
	pgM7towA==
X-Received: by 2002:a17:907:2683:b0:c16:7969:12be with SMTP id a640c23a62f3a-c1f1f0bbe1amr399763766b.31.1785161385818;
        Mon, 27 Jul 2026 07:09:45 -0700 (PDT)
Received: from SVR.localdomain ([185.189.114.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac6ff3sm658071166b.19.2026.07.27.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:09:45 -0700 (PDT)
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
	florian.fainelli@broadcom.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	rani.hod@gmail.com
Subject: [PATCH] PCI: iproc: Use the EROM outbound window on BCMA
Date: Mon, 27 Jul 2026 17:09:39 +0300
Message-ID: <20260727140939.389-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_070948_294483_4CA874B7 
X-CRM114-Status: GOOD (  21.00  )
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

devm_pci_alloc_host_bridge() parses those ranges and requests them, then
this driver adds its own window and requests the whole list a second
time, so every controller fails to probe with -EBUSY.

When the DT window is used, it is only correct on core revision 0x07. On
revision 0x01 it points at an address the hardware does not decode, and
the first MMIO access to a BAR takes an imprecise external abort.

The enumeration ROM reports the correct base for the revision actually
present, and bcma already provides it as addr_s[0]. Drop any memory
window that came from the device tree and use that instead, requesting
only the window this driver owns. This makes the driver correct whether
or not the DT describes a window.

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
Applies to v7.2-rc5. Related DT-side approach:
https://lore.kernel.org/all/20260628231156.1254012-1-rosenp@gmail.com/

 drivers/pci/controller/pcie-iproc-bcma.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index 593418c..f0b8d90 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -36,6 +36,7 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	struct device *dev = &bdev->dev;
 	struct iproc_pcie *pcie;
 	struct pci_host_bridge *bridge;
+	struct resource_entry *win, *tmp;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
@@ -55,12 +56,20 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 
 	pcie->base_addr = bdev->addr;
 
+	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
+		if (resource_type(win->res) != IORESOURCE_MEM)
+			continue;
+
+		devm_release_resource(dev, win->res);
+		resource_list_destroy_entry(win);
+	}
+
 	pcie->mem.start = bdev->addr_s[0];
 	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
 	pcie->mem.name = "PCIe MEM space";
 	pcie->mem.flags = IORESOURCE_MEM;
 	pci_add_resource(&bridge->windows, &pcie->mem);
-	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
+	ret = devm_request_resource(dev, &iomem_resource, &pcie->mem);
 	if (ret)
 		return ret;
 
-- 
2.53.0


