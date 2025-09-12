Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14749CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkuV7aobCdIbkeyG47qx7I1Surx6uFb1AcdgHCLEWSg=; b=VFqFRHj78S5MtqXhud3evQAfLG
	ggv9U2Z9qVybQ9nv+Whhjgn6JNtxo4V3e7+qjl2AZTD1EoRb3DtExbwoDo3tSfoz76TGHU6L71AKb
	oWNksG/NWGVXQS/erJhG7lTI2Ejms1fU7cKeHs0eM0Ab5zWmvJGn0wwAi8NHNkByLBEj8EjfrXz+Z
	ZLrlKQVvbVZQ7eyFwpT/uFXn/0V59DcEBuBuHSuQ0IXp4bh95tiaaGNw+vXEjLEtgFqZVe2W3nJEr
	reGKYRutiNvcuLyPljy8OeTEszKgNvokD2Xa1Nk7RwzXBo7GPicEB7U07jWiOeGoXsKVDZdBMcE2u
	VpjS1qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hn-00000008TLW-2c4l;
	Fri, 12 Sep 2025 10:08:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hm-00000008TKL-0RVx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 10:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nkuV7aobCdIbkeyG47qx7I1Surx6uFb1AcdgHCLEWSg=; b=e341DKlJ/p7wxJ34ueYO1t13q7
	NxY6vSYriqFZ3JgdQZlhmyhArrY9TKBm9Nwk4yYXqfKsQns45+CgbVbJfFLi4GcUVJw+85uGwFyxr
	3fQMj7iW/LtDdkKaQD6XbXddl3XTK7XZ5DikawrqN1Oia+hHVaX6bKB/81u9zgBLVZ+Dbal3HurA2
	ACVXvY7qQEbut2TBW0CJUsMcbYippbo2eo5PQ+9we+9aPU0peLSeF4VRTJhVZ1EirHxgvHqAHK8Sx
	qH/0/4fnPXJfRBB0aOu+1XSHGP6k22blRtMU5h/mLkMbxoGHsb4T9z56iaCc9S9ThiBPskRYIgQ/D
	zQG578jg==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hi-00000006KOk-43BU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:08:33 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CA8F8b498897;
	Fri, 12 Sep 2025 05:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757671695;
	bh=nkuV7aobCdIbkeyG47qx7I1Surx6uFb1AcdgHCLEWSg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m82ZGnTA9oGzaNeaTQWEh1g2zm0aD42xFzy+ovmzBFZImQeh9dbvKnZzk3WL33YSt
	 EAsGc0QEZDSxdUpDCLgHfRNm7k9YxL9/qSUSM+w//1AnYVFdBIqAmX9/nKro5Si6HL
	 7Ye5Qk5Pj9bDXKszSF+YPFwWAJL4xdTbHu36O7kU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CA8F632696732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 05:08:15 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 05:08:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 05:08:14 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CA83MH3740807;
	Fri, 12 Sep 2025 05:08:09 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <sergio.paracuellos@gmail.com>,
        <18255117159@163.com>, <jirislaby@kernel.org>, <m-karicheri2@ti.com>,
        <santosh.shilimkar@ti.com>
CC: <stable@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 1/2] PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on exit
Date: Fri, 12 Sep 2025 15:37:58 +0530
Message-ID: <20250912100802.3136121-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912100802.3136121-1-s-vadapalli@ti.com>
References: <20250912100802.3136121-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_110831_309948_4E09CE4B 
X-CRM114-Status: GOOD (  15.46  )
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

Commit under Fixes introduced the IRQ handler for "ks-pcie-error-irq".
The interrupt is acquired using "request_irq()" but is never freed if
the driver exits due to an error. Although the section in the driver that
invokes "request_irq()" has moved around over time, the issue hasn't been
addressed until now.

Fix this by using "devm_request_irq()" which shall automatically release
the interrupt if the driver exits. Also, since the interrupt handler for
the "ks-pcie-error-irq" namely "ks_pcie_handle_error_irq() is only printing
the error and clearing the interrupt, there is no necessity to prefer
devm_request_threaded_irq() over devm_request_irq().

Fixes: 025dd3daeda7 ("PCI: keystone: Add error IRQ handler")
Reported-by: Jiri Slaby <jirislaby@kernel.org>
Closes: https://lore.kernel.org/r/3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 2b2632e513b5..21808a9e5158 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1201,8 +1201,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = request_irq(irq, ks_pcie_err_irq_handler, IRQF_SHARED,
-			  "ks-pcie-error-irq", ks_pcie);
+	ret = devm_request_irq(dev, irq, ks_pcie_err_irq_handler, IRQF_SHARED,
+			       "ks-pcie-error-irq", ks_pcie);
 	if (ret < 0) {
 		dev_err(dev, "failed to request error IRQ %d\n",
 			irq);
-- 
2.43.0


