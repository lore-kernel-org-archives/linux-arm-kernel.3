Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0154CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTQYoXHzAsvVZHpeb9xbXoz42twoCo53trrb9qs+WBU=; b=UoXinv1pnTb4M2yIW+JB9alsMm
	oZgMNn4XLWF2bG3/7nbN0RFd2GBH3p2U3f8p4lnHf6DNx82MrIYQYfQOIYbDLbY+5i5ezKLktpls4
	8pRjVb6bIL7RvUV1zHR/h4YvinDdXV6Rcx20lVoMaj+BZqePucbzdiH5nxjH6hD8pR3Ry1uEibq0W
	OjHr6TG3Z9fX45T45ioDpE9VPYsynzVmpvR7JZolVaFHqWThpXU3P+TWFqMAG6jE95YSpQdLXkU8d
	85sBbldgaICGbLvZfUNNSNu3byd1riPh+WgSbbsufYABWg1rXtcHsZD+d3Trm/m7JS/JqS0TlYVgd
	EblodUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpAh-00000006rBU-3IZz;
	Wed, 03 Sep 2025 15:13:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmsM-00000006RRp-1AcT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:46:11 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583Ck03H3263860;
	Wed, 3 Sep 2025 07:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903560;
	bh=tTQYoXHzAsvVZHpeb9xbXoz42twoCo53trrb9qs+WBU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=waZilO5rLVGtPTi60mPbG6dTrt/Svxm2d7dcz67/xqqZ+O37eQHbzlWw0F6s+jjcw
	 eRd+jBiDGyBqSZhCAtyFGHegCb6rfTzsue+IXJLphMUoxUBUqoZIrRuRycE2nMwiLS
	 c8dFf8ybrwPII8KlyVqifdJpEsCGwQ5055ZvsYYo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583Cjx8h3601941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:46:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:45:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:45:59 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wY1576150;
	Wed, 3 Sep 2025 07:45:53 -0500
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
Subject: [PATCH 07/11] PCI: keystone: Add ks_pcie_host_deinit() helper for cleanup
Date: Wed, 3 Sep 2025 18:14:48 +0530
Message-ID: <20250903124505.365913-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054610_407037_ADD4C76A 
X-CRM114-Status: GOOD (  12.86  )
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

Introduce the helper function ks_pcie_host_deinit() to undo the
configuration performed by the ks_pcie_host_init() function and also to
free the MSI Domains if the '.msi_init' callback was implemented which
would have made a call to dw_pcie_allocate_domains().

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 3afa298e89d1..f432818f6802 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -885,6 +885,18 @@ static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
 	return 0;
 }
 
+static void ks_pcie_host_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
+
+	ks_pcie_stop_link(pci);
+	ks_pcie_free_msi_irq(ks_pcie);
+	ks_pcie_free_intx_irq(ks_pcie);
+	if (pci->pp.ops->msi_init)
+		dw_pcie_free_domains(pp);
+}
+
 static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -929,11 +941,13 @@ static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
 
 static const struct dw_pcie_host_ops ks_pcie_host_ops = {
 	.init = ks_pcie_host_init,
+	.deinit = ks_pcie_host_deinit,
 	.msi_init = ks_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
 	.init = ks_pcie_host_init,
+	.deinit = ks_pcie_host_deinit,
 };
 
 static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
-- 
2.43.0


