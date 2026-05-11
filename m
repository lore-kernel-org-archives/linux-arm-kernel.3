Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028C7CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpTh2sXANIfpdVqv2Gr/e9DfeCO6TQqHfjZ6e0H2hT0=; b=IaA2aMJs0uyhCSF0bB/9ZtNvRS
	t2mPt6a4h9SsJ2p6EonCkSMa2uXHsXKVIN7zUKlCfsoblak2+HnT0MlvsXAfCztMaaYednreBkfMv
	zRea3vgrrsiekqXaQK21m7logQ0FW1cIuX351c9X0nLviRwbgzvHXhj+NMBpSOJjH5Gxp02srfVPL
	MuSrAuQs6lrXQr6hqtc34p0YjeKU9Gm6ELobUZpBINRSpViFoH35WZegOIdBcDiUZ6Go0b6clqGwv
	T5G57NVszBU4S4wKhmcF1y2hCJvPdgWxQDA3Se/vNWF0szD8RVU3UyKT3Z/Huku5IFHnqZTxrBY7f
	/kVbYRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJkU-0000000CRTF-2NSU;
	Mon, 11 May 2026 06:04:14 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJkQ-0000000CROl-0PJr;
	Mon, 11 May 2026 06:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gp
	Th2sXANIfpdVqv2Gr/e9DfeCO6TQqHfjZ6e0H2hT0=; b=C/CkCLCW9LZ+dw6HvA
	f+1uZgkftp911eDNvIcvsyxg2Hu9tQRKRfw8uN8BaErFVGXtnwHczQ7TO3wETDpZ
	qzCTfEuQhqnTGQb/Pbz9/A7xN85k6wjC50GfbJpCLYPUadx0SCxhWHldNRulZF9O
	cVzvb04Ushvf/0d6q6t5vFTk8=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S6;
	Mon, 11 May 2026 13:59:30 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 4/7] PCI: dwc: Use common pci_host_common_link_train_delay() helper
Date: Mon, 11 May 2026 13:59:20 +0800
Message-Id: <20260511055923.37117-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511055923.37117-1-18255117159@163.com>
References: <20260511055923.37117-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn9yk8cAFqPHQVAw--.46705S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1rAFW5Cry3Wr45ArWxXrb_yoW8Xw15pa
	98AFyFyFWrJF43uanrCasxZry5X3Z8Cay7GFZaga4fZ347ArZFqw10g34SqFyxJrZFvr1a
	9r17tFnrGw4xAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQVy7UUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAMHqmoBcEPnAAAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_230410_562992_C480D1FE 
X-CRM114-Status: UNSURE (   9.52  )
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

The DWC driver already implements the 100 ms delay required by PCIe
r6.0 sec 6.6.1 by checking pci->max_link_speed and calling msleep(100).

Replace the open-coded msleep() with the new common helper
pci_host_common_link_train_delay() to reduce code duplication and
improve maintainability. No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c11cf61b8319..7021d21bb601 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -22,6 +22,7 @@
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 #include "pcie-designware.h"
 
@@ -799,13 +800,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
 		return -ETIMEDOUT;
 	}
 
-	/*
-	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
-	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
-	 * after Link training completes before sending a Configuration Request.
-	 */
-	if (pci->max_link_speed > 2)
-		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+	pci_host_common_link_train_delay(pci->max_link_speed);
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
-- 
2.34.1


