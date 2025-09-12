Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkyghYoL/WFd/TQbtBpt5wxJ2U0314AhC/F/CN6/vD0=; b=QFC8Hve/CxM2WweiHyxyEN/pqF
	9A0u3c84Ls6mnd+swtxnwNsrRSCyhdW5m2SEDRX2wqwCQbFCjC9B1HBwT6OZ3lOY612LIQ4aUsCVf
	QHrAyjSRCQcDzbcCaJczKHOfKuNx9Brm1S3YOozPWYhjHZ+VjaJUO4ikqD05yJw1YnbJ1ylUfEBSX
	VPXnjRawQ/sq20eoSzeBtdFLxLA99NtAbTgOabfYe2Q190BAO+xl0pkoJlVgkvqQLsgwOiXBBxew4
	VC6sakOTYIB9fUjUrHh3r4RepEgyg7SneSIWUUNjDtsWLkmTaawDPejLkC+BS08GhOdAN4kEiQ65u
	yAnRH1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2q3-00000009Dxm-1RY9;
	Fri, 12 Sep 2025 12:25:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2q1-00000009Dvv-00QD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:25:14 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCP0Fm968105;
	Fri, 12 Sep 2025 07:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679900;
	bh=xkyghYoL/WFd/TQbtBpt5wxJ2U0314AhC/F/CN6/vD0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GdOWqbFADCc00cN1nU4PgUgvAdqVlT2tirur0NezSdJh85L6mUL+HBvaB62b3ENpV
	 NTO1Pz/YawAcQ0YhoW1fKwLYKlFG/I1DrVsXhWtUIRrll8AojfsL+SbvXrfO7qAja3
	 mCo/Ph/z64QJU6k5l8BvMKecCOIgEkr7wbT1FhEk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCP0Ts1969788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:25:00 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:25:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:25:00 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLa3589278;
	Fri, 12 Sep 2025 07:24:53 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 08/10] PCI: keystone: Add ks_pcie_disable_error_irq() helper for cleanup
Date: Fri, 12 Sep 2025 17:46:19 +0530
Message-ID: <20250912122356.3326888-9-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052513_136580_C83126EC 
X-CRM114-Status: UNSURE (   9.44  )
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

Introduce the helper function ks_pcie_disable_error_irq() to disable the
error interrupts that have been enabled by ks_pcie_enable_error_irq().

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-9-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/controller/dwc/pci-keystone.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 3a3188e89a2a..2da9feaaf9ee 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -329,6 +329,15 @@ static void ks_pcie_handle_intx_irq(struct keystone_pcie *ks_pcie,
 	ks_pcie_app_writel(ks_pcie, IRQ_EOI, offset);
 }
 
+static void ks_pcie_disable_error_irq(struct keystone_pcie *ks_pcie)
+{
+	u32 val;
+
+	val = ks_pcie_app_readl(ks_pcie, ERR_IRQ_ENABLE_SET);
+	val &= ~ERR_IRQ_ALL;
+	ks_pcie_app_writel(ks_pcie, ERR_IRQ_ENABLE_SET, val);
+}
+
 static void ks_pcie_enable_error_irq(struct keystone_pcie *ks_pcie)
 {
 	ks_pcie_app_writel(ks_pcie, ERR_IRQ_ENABLE_SET, ERR_IRQ_ALL);
-- 
2.43.0


