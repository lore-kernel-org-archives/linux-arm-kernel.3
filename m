Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AD7CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNGiJZhgTLPluypgzeJ1aG/d9sbWAAhxnbKSoRw5x1o=; b=cetf2gJOZNJXZnGRyQeJGBUYsy
	QaDdFFOlpe6GJvLlRW1L0j8z0rr5WaZB4YTJ75ckTwfisho9JcoFk3FV+Px7bxt/AUp9WigIiL3gd
	VATaq+a+aQIppzTFPkKzIs+/I4jqidu8HUnJ3ZB8vBxwnqxh3bTAyorwKvJJwhRx9cdHePmu1US7U
	0ETteGeGRTSwY/x2pDjJQFAQZecCgJmGwPnfD4K3RKw5tzYt8v9zIQYJVrAoY3Cw7vgtABWRL9H2e
	n2aKNlD4mMkALqQqSEvWItPVKC9RDqCjwXyWTC9VpzF0ji8EUUvyMz9kEc2Szf1WNt5n1y6XXIucd
	hmZLHsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7H-00000001IwY-3cdm;
	Wed, 06 May 2026 15:24:51 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7F-00000001Iu6-48dK;
	Wed, 06 May 2026 15:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BN
	GiJZhgTLPluypgzeJ1aG/d9sbWAAhxnbKSoRw5x1o=; b=lgrgDVctqQNdhZIm1t
	PcEbxw4/HmqAapBQyeaO8ydZ1v915P9ACRci6PFsg1rsX/KPMVEbYTfocgsylCtR
	u6Gce0AmIoirQwtAuLx8wuzT5nrymkOjbCKp1BRUrhDHT3oWq3Qb9zfcWFVpoKSQ
	75ceAByEc1iuse/J93QGXRVH4=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S4;
	Wed, 06 May 2026 23:24:11 +0800 (CST)
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
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:40 +0800
Message-Id: <20260506152346.166056-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWfZryUWw43Wr43uw17ZFb_yoW5JFWfpa
	yDWryfGF1IqrWY9a1kZa4UXryaq3Z8C347tws2k34xWr17CrW5JF42gF1fJFy3KrZrZry7
	ZF1DtF9rGr4ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziM7KxUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBu2Wmn7XRs43gAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082450_549781_F38B0510 
X-CRM114-Status: GOOD (  11.88  )
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

The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
lacks the mandatory 100 ms delay after link training completes for speeds
> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.

Add a 'max_link_speed' field to struct cdns_pcie to record the maximum
supported link speed (or the currently configured speed). In the common
host layer function cdns_pcie_host_start_link(), after the link has been
successfully established, call pcie_wait_after_link_train() to insert the
required delay if max_link_speed > 2.

Glue drivers must set max_link_speed appropriately (e.g., from the device
tree property "max-link-speed") to enable the delay.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
 drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
index 2b0211870f02..51376f69d007 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
@@ -14,6 +14,7 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../../pci.h"
 
 #define LINK_RETRAIN_TIMEOUT HZ
 
@@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
 	if (!ret && rc->quirk_retrain_flag)
 		ret = cdns_pcie_retrain(pcie, pcie_link_up);
 
+	if (!ret)
+		pcie_wait_after_link_train(pcie->max_link_speed);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 574e9cf4d003..e222b095d2b6 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
  * @ops: Platform-specific ops to control various inputs from Cadence PCIe
  *       wrapper
  * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
+ * @max_link_speed: maximum supported link speed
  */
 struct cdns_pcie {
 	void __iomem		             *reg_base;
@@ -98,6 +99,7 @@ struct cdns_pcie {
 	struct device_link	             **link;
 	const  struct cdns_pcie_ops          *ops;
 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
+	int				     max_link_speed;
 };
 
 /**
-- 
2.34.1


