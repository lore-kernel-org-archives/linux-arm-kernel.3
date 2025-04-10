Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21315C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+wIYi/J/bVt76+nQq066VNDmULEdyty0tMuUEshfLQ=; b=smjMY9lF9GL73IdZSbliTH/TWF
	TI+C1lnKt8KWH7SarIkYyhzQViOAkltUwn8tM9NS0Uezp2RhOcIxVbE6VSW96S2YzzMXvI/KfDPNX
	okCHBMsb6TPo/uJ0UC9T6PDkKgHprAawjhebLxLMLawFBGmrVjGuG3L9/35csuOQfToXn7a6zDUsz
	jXjrZlbHQDQaxVoRP8bXS/cgom4qRgHLRXYQFhUTznhSGISJL79X79iscQ4hlS4aSg7FDgETH/+0B
	kPOBlI11YeYYo2xjl6UYDaWaQ+picaWgo6/wTUh/FKw3aze5DFn5mBkAUhR1pJ3CDjp5fCtKi3HmG
	ufvT87sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2q5P-0000000AIkr-2Lj1;
	Thu, 10 Apr 2025 11:28:47 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pP6-0000000A87C-23lN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 10:45:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AAim4o1783713
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 05:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744281888;
	bh=d+wIYi/J/bVt76+nQq066VNDmULEdyty0tMuUEshfLQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f4TF52hpYRbI9chP/rPsADwSkW5PdouymuiY5lCFixBS2HT2XHgUQabfySydcvPqj
	 2TNSh5RzmW1sEmbrzniwX52mT0dARajNkXRezkm/R1K6prOH/O66SthVvBnqrwYauL
	 1GR3sPFaUjnRp96PLfZTs1nZsI27qEQ/9BqND/g8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AAil9G010070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 05:44:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 05:44:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 05:44:47 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AAiRfe029210;
	Thu, 10 Apr 2025 05:44:42 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <18255117159@163.com>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>
CC: <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable helper for cleanup
Date: Thu, 10 Apr 2025 16:14:25 +0530
Message-ID: <20250410104426.463453-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410104426.463453-1-s-vadapalli@ti.com>
References: <20250410104426.463453-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_034504_618761_220B4269 
X-CRM114-Status: GOOD (  11.24  )
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

Introduce the helper function cdns_pcie_ep_disable() which will undo the
configuration performed by cdns_pcie_ep_setup(). Also, export it for use
by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
to cleanup on their exit path.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

v2 of this patch is at:
https://lore.kernel.org/r/20250330083914.529222-4-s-vadapalli@ti.com/
Changes since v2:
- Collected Reviewed-by tag from
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

 drivers/pci/controller/cadence/pcie-cadence-ep.c | 11 +++++++++++
 drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index b4bcef2d020a..ffd19cb25eed 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -645,6 +645,17 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
 	.get_features	= cdns_pcie_ep_get_features,
 };
 
+void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
+{
+	struct device *dev = ep->pcie.dev;
+	struct pci_epc *epc = to_pci_epc(dev);
+
+	pci_epc_deinit_notify(epc);
+	pci_epc_mem_free_addr(epc, ep->irq_phys_addr, ep->irq_cpu_addr,
+			      SZ_128K);
+	pci_epc_mem_exit(epc);
+}
+EXPORT_SYMBOL_GPL(cdns_pcie_ep_disable);
 
 int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 {
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 0b6bed1ac146..387174d6e453 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -555,11 +555,16 @@ static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int d
 
 #if IS_ENABLED(CONFIG_PCIE_CADENCE_EP)
 int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep);
+void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep);
 #else
 static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 {
 	return 0;
 }
+
+static inline void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
+{
+}
 #endif
 
 void cdns_pcie_detect_quiet_min_delay_set(struct cdns_pcie *pcie);
-- 
2.34.1


