Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F269CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11ikX1sFn7k/YSRdSbKKr00GnN/L9b+csqVGwtKcwdY=; b=iISKKgnhESYNn6d6FVziz0vXDA
	NMJqA0uM8ciUkPZmhGFWkm7F5pZMtTOFE2UKiG6ZUpmW1igUtomRvB1MmsX8U25asSfCxuEcg3jhO
	JlF7DEwZyvaGtgtErJ7AVxE41XU8OlF3V/N/iv2wl7UgiDEnsqBR98nbXAX3Z6emC2ajPBgOksNbm
	uzmpwIFmQUL2Yup7YYpHRldPn6cmcUNxMKTj1q1cn0sBUa6ScJf6+giF1gStl5SrhWAahFk1RAhbQ
	c65O6gzR72QE28YadveOIqMXi5U3DJiE89/IWqdGKo+PRL3JGtw7kEFJWDsY7qo8H5uErY9mEFZVL
	sDgozilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVba-00000002M3Z-1uGF;
	Wed, 22 Oct 2025 09:58:06 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVbL-00000002Lqc-3XLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:56 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59M9vYJA1376542;
	Wed, 22 Oct 2025 04:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761127054;
	bh=11ikX1sFn7k/YSRdSbKKr00GnN/L9b+csqVGwtKcwdY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jwtAsl8ASyy6in/v9KTdZsJqK/VQHrQyzAN16br0IQq0Y7ZRif+cCd9My5wa5c5Gv
	 pUHiEu8XEE4vgKn5ER3TAB+GLvY1Ts0rkSZrYHWjXgdPx80iO+9nz9RGE+8aPeWL14
	 +hPVebUkaN/9X2kf93Otipcq9cPVlg186ZpN4SQM=
Received: from DLEE201.ent.ti.com (dlee201.ent.ti.com [157.170.170.76])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59M9vYU61842698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 04:57:34 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 04:57:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 04:57:34 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59M9vFcX1029418;
	Wed, 22 Oct 2025 04:57:28 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <quic_wenbyao@quicinc.com>, <inochiama@gmail.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
Date: Wed, 22 Oct 2025 15:27:10 +0530
Message-ID: <20251022095724.997218-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022095724.997218-1-s-vadapalli@ti.com>
References: <20251022095724.997218-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025752_147587_2AF54098 
X-CRM114-Status: GOOD (  11.15  )
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

The pci-keystone.c driver uses the functions 'dw_pcie_allocate_domains()'
and 'dw_pcie_ep_raise_msix_irq()'. In preparation for enabling the
pci-keystone.c driver to be built as a loadable module, export them.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v3:
https://lore.kernel.org/r/20250922071222.2814937-3-s-vadapalli@ti.com/
Changes since v3:
- Rebased patch on 6.18-rc1 tag of Mainline Linux.

Regards,
Siddharth.

 drivers/pci/controller/dwc/pcie-designware-ep.c   | 1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7f2112c2fb21..19571ac2b961 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -797,6 +797,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msix_irq);
 
 /**
  * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c..d74bc571f65d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -232,6 +232,7 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_allocate_domains);
 
 void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
-- 
2.51.0


