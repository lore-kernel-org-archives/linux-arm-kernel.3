Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F1CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 06:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cftsOZtxX29kXCinzIdqB457AE+U27lG7aeLpYLPKCg=; b=fSlhtKliBM/V8fyLCmJQEQdLWP
	JgK6jYLmMXimtFPCDnRcHrObNgkk+arQnZIY/AImBr8qpo/SkbrIztzO914A+VCiORnbSPiQM10w9
	oJECD1MRzcVrN5fLpddxn6zvD0ycq/Dh6l70ytvWFpmsMqULJHRIyvtBFVVKByoxVEmDEv7uJ7045
	/6kO0xtrU5ILFSTYvZFoS76tAsVii3SkYNVg7okFwFwbmxMy1JmjzssU8kwIzlC6lDP3DzghjRMuU
	LOjwmZepP51jhFaDMMzBZxhsoRSNfHP0YC9z/vTgHhUW/Dx+Mw0AOlf5ztCn1ds7zd7SzFDskrkmh
	Rcm9qh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgf-0000000CQbR-2K6S;
	Mon, 11 May 2026 06:00:17 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgb-0000000CQZW-3xM6;
	Mon, 11 May 2026 06:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cf
	tsOZtxX29kXCinzIdqB457AE+U27lG7aeLpYLPKCg=; b=AOGpWrBklUKzXiHe2e
	RmH+uBtaO+tn+gDtsITdEf3uD00xsvLlIzYTWEKKYgjPmqae3s74XytRXwTM7MSm
	GfmPj4SYpIVWELdmhCsmrNnyG2z6I35CmztiTlg6+1AB2Ogdr9s4kQ9Lec2m4NBb
	lU+4ubeQT0WG3InU0r7WRV538=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S3;
	Mon, 11 May 2026 13:59:27 +0800 (CST)
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
Subject: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
Date: Mon, 11 May 2026 13:59:17 +0800
Message-Id: <20260511055923.37117-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511055923.37117-1-18255117159@163.com>
References: <20260511055923.37117-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn9yk8cAFqPHQVAw--.46705S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15uw48KryxGryDtF4fZrb_yoW8CFyrpa
	98AF13CF40grW3uwsxAa4DWryYq3Z5t3yUK397G3sayr9rtrsavFWv93yIqF1rJFZ8Zr17
	A3W5K3Z7Cr4xtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGNtfUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwAHqmoBcEDaRwAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_230014_876086_70B474B1 
X-CRM114-Status: UNSURE (   9.42  )
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

PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
Port supporting Link speeds greater than 5.0 GT/s, software must wait a
minimum of 100 ms after Link training completes before sending any
Configuration Request.

Introduce a static inline helper pci_host_common_link_train_delay() that
checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
calls msleep(100) only when the speed is greater than 5.0 GT/s.

This allows multiple host controller drivers to share the same mandatory
delay without duplicating the logic.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb..d709f7e3e11a 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -10,6 +10,9 @@
 #ifndef _PCI_HOST_COMMON_H
 #define _PCI_HOST_COMMON_H
 
+#include <linux/delay.h>
+#include "../pci.h"
+
 struct pci_ecam_ops;
 
 int pci_host_common_probe(struct platform_device *pdev);
@@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+/**
+ * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
+ * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
+ *
+ * Must be called after Link training completes and before the first
+ * Configuration Request is sent.
+ */
+static inline void pci_host_common_link_train_delay(int max_link_speed)
+{
+	if (max_link_speed > 2)
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+}
+
 #endif
-- 
2.34.1


