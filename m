Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F6FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4qptzRTLzEX4ORnvKTYYJwd+9jdXwoH4m16aZtajA1I=; b=FrLUb35oWW3r82hr48+0zO0Hp7
	dO38eifxbfwQ5z6Wii0g3NSEMl+v1SDUnPYzHXGKrFT46FrvO79mqFRXtysUhOWi6eY3ovbo1be2k
	AUYlmKRcUYHCOnqg8KWdiOQaCAh7cdf+mdfFGZNgcjBu+cLXCXrbDc2ET2jV0OHkRnXjNknDRB1hV
	pHoiTIIZNNU/Z+Vh8rY6liMdx1uxPAWjcPUX1mHcYp11uAKuMIvb0o6FKkYN/DSNaMIMn2sxNErTA
	uxSPPv9j4ILydtaAIZf/UvgUFZmPIT0vLAnWmm8Cjkwo09CJ9zR4FKvVVvOzYOqRxCHybqXblx0CH
	MNP/Wl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8euB-00000002NVl-39nc;
	Mon, 21 Sep 2026 14:22:03 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eu8-00000002NVH-33qX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:22:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f05ffdso21620125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790000520; x=1790605320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qptzRTLzEX4ORnvKTYYJwd+9jdXwoH4m16aZtajA1I=;
        b=HwhcGvAyJjSWJVK6MOBaNzvw/1ASiz3IFYDARXsNRrzxOs2JsVX1ZmartscIQAysBf
         7uYmIWR4Sdn9/U22L1LDot4lpB99i4icAfKZLGAM28Gvtq9h45qgax9I+I9ENx7rWbqD
         HHvU5fjpPWT4tQSTE5QCejy4VmvfYp8KkyZQghmIxDsbuJUyW3fGuSmJDTS46zwxBK4K
         sYtMBu6tktdbx8d+vp+a2mYDvMXNQJacZL4H0H+tnZqmkUiWV5EcjYI0a1ICnvpazadY
         7mveR3so3Mf+YrGryJ/f4Me2yujZJXfM2Bqsbbz8LYsaldZjgrg2EWMDaxzWyVGI1sdR
         a3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000520; x=1790605320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qptzRTLzEX4ORnvKTYYJwd+9jdXwoH4m16aZtajA1I=;
        b=moAuqln9S0dFZ50pprZffEOPQAes5tLV+161RRQf+xHzDonUekV/YOPnqqWHbK2Auk
         NsvRXjbnQk66hd3U8cKxsAwmIUriLj1YV/Dt4pm7aGDRnbXeipAbw23SBSSQy1Y8jh75
         v3Sb8ofQCKPVjkRmD1IQoBT5LcE/U0L0unwMq7JnRsr2X3c4QTCGG+YbEVp9qfuH55KT
         PpTPF8GUbiDJp+yuMuKZAudsqW04Qk0p8vaPLLz/4igklM+SHxAP5MnRVY1oHb2tvhPv
         mA8+uGu6dtlkb9BOJ2We2DJE4x0mcPrs6gPe6ou5+4jtWKtpSEF0lpEqpsCaBS1+Vn5W
         a23Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5K6NO6xP00rf2jtH9XY1G3IylDCE37diaT/UJImL2S6lMxHUDZFwPCawewqACEwosHjsmu/At7wSQe7MoiuIP@lists.infradead.org
X-Gm-Message-State: AFuF++kVx88/t6VW3EEt1thifiv/c82d1rANSeiQrKZR3ybyohDOiy37
	9Sm1pBVzvMi7RGCSwIGuIJBMTjBW02eEWtnAszTIpUe6N1EgE4DuontY
X-Gm-Gg: AYBFou3gn90w5ipN9twoCBN2qk4oVX7odmr8wFO8M0YYEF8tXjDl4E2nfFrQJbXTm5o
	vIrklgGgyFssZI7/5z0LuigGcHg4b0GFRspS0etiAaAAgKIjQwcLTsdRMXFpaCQgSWASOGBREFu
	zn+MSu05N6FHu/+LYAHc10AnsMOw6xJxgRCnVoqwg5FiYWKD+IdPIG/7k1oloRALFUoiOX6FKzI
	OfgdoGK0hDi1Fzz5wGPXipdMnMWTIrVRiMOUUqm7IOmj1Vl7BOwZ/QgK1/XSfuvsd2pard0Az+Z
	r9AS+ywcVFPPmuR7T9E//tj8kf+bu/Xiog/Y0uHcBxJfi0MHDoxapty1aClftX4pdMHTgZSOGwP
	cL5x+qQP8Nc5MqHOYhDKqkx7Qq6pfkKopUdT23v7G+V1Pal/xt5orcNM6O5wQvykOfA8kbIOVz0
	r7lYgjsWFMmF11BRqc7E+o0JcxIKSQgVdnDYapaQPeHrVKabF+d+N4HpRJhmk2CahS
X-Received: by 2002:a17:903:13d0:b0:2dd:c100:80bd with SMTP id d9443c01a7336-2ddc10081cdmr113240275ad.56.1790000519755;
        Mon, 21 Sep 2026 07:21:59 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm35130485ad.39.2026.09.21.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:21:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Yuho Choi <dbgh9129@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] PCI: keystone: fix endpoint teardown on remove
Date: Mon, 21 Sep 2026 22:21:47 +0800
Message-ID: <20260921142147.435953-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_072201_661129_6D2DA281 
X-CRM114-Status: GOOD (  19.11  )
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

ks_pcie_probe() initializes the DesignWare PCIe endpoint with
dw_pcie_ep_init() and notifies the endpoint framework after the
endpoint registers have been initialized. However, the remove path
does not perform the corresponding endpoint teardown.

This leaves the EPC initialization state and resources allocated by
the DesignWare endpoint core active after the driver is removed.

Make dw_pcie_ep_deinit() notify the endpoint framework when endpoint
initialization has completed, so controller drivers do not need to
duplicate the notification before endpoint teardown. Keep the
notification conditional since dw_pcie_ep_deinit() is also used on
error paths before pci_epc_init_notify() has been called.

Remove the now redundant explicit notification from the STM32 endpoint
driver.

Cache the controller mode in struct keystone_pcie and use it during
removal to deinitialize the endpoint before runtime PM and the PHYs are
disabled.

Fixes: 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x Platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Cache the PCIe mode in struct keystone_pcie instead of looking up the
    match data again during removal.
  - Move pci_epc_deinit_notify() into dw_pcie_ep_deinit() to avoid
    duplicating the notification in controller drivers.
  - Remove the now redundant explicit deinit notification from the STM32
    endpoint driver.

 drivers/pci/controller/dwc/pci-keystone.c       | 6 ++++++
 drivers/pci/controller/dwc/pcie-designware-ep.c | 3 +++
 drivers/pci/controller/dwc/pcie-stm32-ep.c      | 1 -
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 602516239a57..59f7b2e152a2 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -121,6 +121,7 @@ struct ks_pcie_of_data {
 
 struct keystone_pcie {
 	struct dw_pcie		*pci;
+	enum dw_pcie_device_mode mode;
 	/* PCI Device ID */
 	u32			device_id;
 	int			intx_host_irqs[PCI_NUM_INTX];
@@ -1226,6 +1227,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 
 	ks_pcie->np = np;
 	ks_pcie->pci = pci;
+	ks_pcie->mode = mode;
 	ks_pcie->link = link;
 	ks_pcie->num_lanes = num_lanes;
 	ks_pcie->phy = phy;
@@ -1349,9 +1351,13 @@ static void ks_pcie_remove(struct platform_device *pdev)
 {
 	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
 	struct device_link **link = ks_pcie->link;
+	struct dw_pcie *pci = ks_pcie->pci;
 	int num_lanes = ks_pcie->num_lanes;
 	struct device *dev = &pdev->dev;
 
+	if (ks_pcie->mode == DW_PCIE_EP_TYPE)
+		dw_pcie_ep_deinit(&pci->ep);
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index de8ee3db4360..b785e098f759 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1188,6 +1188,9 @@ void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
 
+	if (epc->init_complete)
+		pci_epc_deinit_notify(epc);
+
 	dw_pcie_ep_cleanup(ep);
 
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index a7988dff1045..1cb31bd76da5 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -304,7 +304,6 @@ static void stm32_pcie_remove(struct platform_device *pdev)
 
 	dw_pcie_stop_link(pci);
 
-	pci_epc_deinit_notify(ep->epc);
 	dw_pcie_ep_deinit(ep);
 
 	stm32_pcie_disable_resources(stm32_pcie);
-- 
2.43.0


