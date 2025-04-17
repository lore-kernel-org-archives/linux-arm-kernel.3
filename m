Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F058C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzsdAKvkx3xe6MXF6awZIF/PlbMwL/TTHjodxLHUJU4=; b=r1atNTPG9J/o31GWBBjLAtTFjL
	VTFFa0vU2n0A2WM3Y2Ty8kijvNqzwlvnprfR2Wfct4p+lcWEl5LCV2KNXaG2QCVFRiOK4zVrolhP4
	1t8MaDvKZWXB6/CSZmY1MJQsvAXEU4MpVfFEx8vL8aHOiR3oqGoGchkAntCiclr2RcPj7jXIYk+ld
	VTxxkikF5w9FMzAI5JsmZj8z7uf7HtvyqbGzmxVfP2l3aU4hQ9EqycYxumPQ5DEV3FvEU17Lf6zsH
	ci8ymyY2ZiOXAsyUpIjmUzbMUlY+PKVq5SvoVX8ga10or915sp6F7MDAuegDjHGTzpoPeDgNuHXWe
	/J914Fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Oqa-0000000D43M-3pjl;
	Thu, 17 Apr 2025 13:00:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Obt-0000000D1r7-0OAo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 12:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AzsdAKvkx3xe6MXF6awZIF/PlbMwL/TTHjodxLHUJU4=; b=E2I6KD6GWboMYh4ZGplaHCJkTl
	b1GegcinAS440e8XM5lz4DUEKeuQll7cBor6VhIz8EMMFZ0sbsT8L/Lso2p+XUOsC05SBiUu3gxin
	9eaE/RvYVKCGnEsKURlY++w6jR4/zFLekZTvnZeMrm2KriOj8gxMRAL/3n0sC6MB+gDZl6RZZZg0Y
	dh5/Mr4oWWLaUcHzcSfQspCvU6P30GEpadNYBuBBKVF4zGA9cEs0WSK4+pMSHMn+z9FfL6Ojk5p9r
	SUqmg9YsWHM+C58HYdj1jOvqM987LRgEIOVh6zbAz2kVQIs6q3UV1T5gAJgmV3xIRR29ndMTZwdnZ
	ik6TkHCQ==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5Obp-0000000AHHi-17Rj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:44:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiTh4012128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893869;
	bh=AzsdAKvkx3xe6MXF6awZIF/PlbMwL/TTHjodxLHUJU4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F+CQOjZgBaLjHoMcju6hphfzyKyjClt12iSg1J72QON++spnkf1igPMMNAFiDlbQ6
	 UNVmVMBR7BJW8ari8iV/6y8B/AF9I/4uG5AdgVnTo29tsSWJ3orYgs85VxKBHIRRsT
	 +CSi0gmXwTXa03WVc1214Ko3K3xpRFiJqFi3Lyfo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiT2a065131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:44:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:44:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:44:29 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCi9XE048918;
	Thu, 17 Apr 2025 07:44:24 -0500
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
Subject: [PATCH v4 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable helper for cleanup
Date: Thu, 17 Apr 2025 18:14:07 +0530
Message-ID: <20250417124408.2752248-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417124408.2752248-1-s-vadapalli@ti.com>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_134449_694226_74A1EE6A 
X-CRM114-Status: GOOD (  10.31  )
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

v3 patch is at:
https://lore.kernel.org/r/20250410104426.463453-4-s-vadapalli@ti.com/
No changes since v3.

Regards,
Siddharth.

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


