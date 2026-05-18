Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5463CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdFSyK04AoD5VtRUeqFfTh6wHr0kkAqRVXcL2zF5BEw=; b=qu3b+1GcQwMSSErO13bimVbb1H
	orLrLKCVSYeROCa+zn46R8xjLihwtnZbmQUpYABU/mAIrxEl4YpWYyWxRB9hziWGBez/jgZx9N8fi
	zLQ5rLt5uRjzZvgFiopFi0TCLlgJ6Q3X1FfLMy5cIul0CFQy0KOWswXM8al41DxZXuG5JPYyG0V31
	RrQVVh0QDtAegMYH+8dqgxGQ1SYnaQUdPHTpett55mYA6xFbHTxjftVptCMxxHRLyjf2JRvEntDjJ
	WS3vXQKpYYw71tMP5aeq5S3W3UV4/bAYyoSxZ5oe04AIzTs4+TBuL78dB6nRpax//URCML1B6NNPs
	qTqEs3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm5Q-0000000Dleu-3q2x;
	Mon, 18 May 2026 00:44:00 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm5C-0000000DlSQ-3CzX;
	Mon, 18 May 2026 00:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yd
	FSyK04AoD5VtRUeqFfTh6wHr0kkAqRVXcL2zF5BEw=; b=a51K8YoecgZ2vIJxna
	DWp4PPp/w3AyGA53UYh8xLVEHJUYPi5StkHW4FJGA8o0TxN/K4tGwa91HqbHLeim
	ufsuX2gjSUJfGQ8qIhbkYZOhP96x67Dvj5Y5O1WO1PD78BjxcahhzoGehpJffGrM
	gy76iJEJq55itfZqE725FhbGQ=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S5;
	Mon, 18 May 2026 08:42:54 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
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
Subject: [PATCH v4 3/7] PCI: cadence: HPA: Add post-link delay
Date: Mon, 18 May 2026 08:42:42 +0800
Message-ID: <20260518004246.1384532-4-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnj6SIYApq2fikCA--.4779S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1xur48Kr4kAr43WF4Uurg_yoW8tFyxpa
	4DWFyfGF18Xr4Y9an3Aa45XryaqFn8A39rt3yv9w1xZrnrCr4DtFnFgF1xWa43KFZrAr17
	J3ZrtF9rGr15ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UoWl9UUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww9Y+2oKYI8OGwAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_174348_316331_8ACC219A 
X-CRM114-Status: GOOD (  12.51  )
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

The Cadence HPA (High Performance Architecture IP) specific link setup
function cdns_pcie_hpa_host_link_setup() waits for the link to come up
but does not implement the required 100 ms delay after link training
completes for speeds > 5.0 GT/s (PCIe r6.0 sec 6.6.1).

Add a call to pci_host_common_link_train_delay() immediately after the
link is confirmed to be up, using the max_link_speed field. Also, in the
HPA host setup function, read the device tree property "max-link-speed"
to initialize max_link_speed if not already set by a glue driver.

This ensures compliance for HPA-based platforms.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
index 0f540bed58e8..8ef58ed01daa 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
@@ -15,6 +15,8 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../pci-host-common.h"
+#include "../../pci.h"
 
 static u8 bar_aperture_mask[] = {
 	[RP_BAR0] = 0x3F,
@@ -304,6 +306,8 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc *rc)
 	ret = cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
 	if (ret)
 		dev_dbg(dev, "PCIe link never came up\n");
+	else
+		pci_host_common_link_train_delay(pcie->max_link_speed);
 
 	return ret;
 }
@@ -313,6 +317,7 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
 {
 	struct device *dev = rc->pcie.dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *np = dev->of_node;
 	struct pci_host_bridge *bridge;
 	enum   cdns_pcie_rp_bar bar;
 	struct cdns_pcie *pcie;
@@ -343,6 +348,9 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
 		rc->cfg_res = res;
 	}
 
+	if (pcie->max_link_speed < 1)
+		pcie->max_link_speed = of_pci_get_max_link_speed(np);
+
 	/* Put EROM Bar aperture to 0 */
 	cdns_pcie_hpa_writel(pcie, REG_BANK_IP_CFG_CTRL_REG, CDNS_PCIE_EROM, 0x0);
 
-- 
2.43.0


