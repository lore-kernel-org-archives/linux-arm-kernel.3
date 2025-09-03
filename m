Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B7CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QD21tgjxfBWtfcipGGATPRBLLmOBGCMaskE3EBQK8w=; b=rJPXN6kEVBtvLLztLpXks0k3ZV
	lvd8lV0x15Wr+wEvWWa5GHDacUdbKbPijH0I8mLRzCVL/9zPWTnd6mtIPAvk68iB57y3ZaYiXaZJ7
	qm2tMDuqLPyF/yMHwlEDkVzxXfA1Jy2eRZlCkn/QU2+b8I8/j0HG2aPCCBNg/fqqBq2zdxI87LVyG
	68/k0vYnUJev0vTg85pew/NOZiufNSYZdbLfFmNMYt7/y5jc8cvK8cCO7XhoRLXeNpnorGAFg3W2i
	EmA3kkqsaOBc0WJp8MOPG0LLFccgXhetEt0vfE/WQs8xZtebcDaB3Gl7TqGxR1xSHiA0ns7qhfUJ4
	Kd+pj3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utozw-00000006pJH-1Oed;
	Wed, 03 Sep 2025 15:02:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmrx-00000006RKo-04km
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:45:46 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583CjXRm3263808;
	Wed, 3 Sep 2025 07:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903534;
	bh=4QD21tgjxfBWtfcipGGATPRBLLmOBGCMaskE3EBQK8w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DsAmnW0ZLQ/P1vKp82E0eRSmQFK2Tjlxyw5N7Ry3pAVrP2RC24rBNzwTQaMASNwB0
	 kz7f7v22ECfwfbK5CT0PDScB9pZpsGBoobcv6GwS/gp3p9v2EcZmf51e6EqoCw2YX0
	 KD1gY5HjwbqcrvKDoQzdzCmUHN088BK4zgO3vowM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583CjXH4084035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:45:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:32 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wU1576150;
	Wed, 3 Sep 2025 07:45:26 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <fan.ni@samsung.com>, <quic_wenbyao@quicinc.com>,
        <namcao@linutronix.de>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <inochiama@gmail.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 03/11] PCI: dwc: Add dw_pcie_free_domains() helper for cleanup
Date: Wed, 3 Sep 2025 18:14:44 +0530
Message-ID: <20250903124505.365913-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054545_145948_2EDFBBBF 
X-CRM114-Status: GOOD (  12.85  )
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

Introduce the helper function dw_pcie_free_domains() which will undo the
allocation performed by the dw_pcie_allocate_domains() function. Export
this helper for the users of dw_pcie_allocate_domains().

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++++++
 drivers/pci/controller/dwc/pcie-designware.h      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 3cc83d921376..df55c0ed75e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -211,6 +211,15 @@ static const struct irq_domain_ops dw_pcie_msi_domain_ops = {
 	.free	= dw_pcie_irq_domain_free,
 };
 
+void dw_pcie_free_domains(struct dw_pcie_rp *pp)
+{
+	if (pp->irq_domain) {
+		irq_domain_remove(pp->irq_domain);
+		pp->irq_domain = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(dw_pcie_free_domains);
+
 int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index a44f2113925d..9f6f6f0ecd93 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -802,6 +802,7 @@ void dw_pcie_free_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
+void dw_pcie_free_domains(struct dw_pcie_rp *pp);
 int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
@@ -846,6 +847,10 @@ static inline void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
 {
 }
 
+static inline void dw_pcie_free_domains(struct dw_pcie_rp *pp)
+{
+}
+
 static inline int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	return 0;
-- 
2.43.0


