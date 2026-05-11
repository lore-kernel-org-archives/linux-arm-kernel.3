Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85222CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hv/1t/xGsQygAr/vopI1Yy4bj8nhzgu3manFIYqiKFY=; b=uMB3hunwyKKbH/iWu0YGAvKxrb
	9H/W28AZyiFwLlEwxhTXH+wj2bojY0c4wxE3WMpxYrnWR5RWRGVmAsY04P7BLZtM4liNANAtaDW91
	0iZztDhXMBKsbDdnFHpo74qtH/PQdGCyAtZfTQ138HBTBguFjd7UheHwqM2zDnvqadEpxVh2y2V56
	vElFNbgF6L/wyZ9OgOgBHR61TntgtTLBRr7G4uYbH9g2+LY3A9a3Lb50lBQVzG5AN9EOrnuONgQ3E
	4n6dS4yRuQ4Awa/Pm6xOiXnAEpgr6//Xxp/XR+LEM7PkaCQLn9PSEoR0TxlXHVyhCE+pG7bl8ZWrc
	nqhkqf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgf-0000000CQbG-1km4;
	Mon, 11 May 2026 06:00:17 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgc-0000000CQZX-1fsI;
	Mon, 11 May 2026 06:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hv
	/1t/xGsQygAr/vopI1Yy4bj8nhzgu3manFIYqiKFY=; b=He7KE0CXg8bR10NsVH
	pcJV9X76hZYnFm/9lfgZrZ5UIaZhx2VpNgb/D3HxSRwOzoTvHiEFOSQ5/Uliw50z
	/JGdpUgP+ryZyY+LkzknGzUbyh+tQZFM+1QFuLCHO2l5b3ZvqF8pORJ7yZBwBF2k
	I0QId1gYDu34JLI+Wl1JfrA2E=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S8;
	Mon, 11 May 2026 13:59:33 +0800 (CST)
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
Subject: [PATCH v3 6/7] PCI: mediatek-gen3: Add 100 ms delay after link up
Date: Mon, 11 May 2026 13:59:22 +0800
Message-Id: <20260511055923.37117-7-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511055923.37117-1-18255117159@163.com>
References: <20260511055923.37117-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn9yk8cAFqPHQVAw--.46705S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4kWw4fAw18WF4rJF1kZrb_yoWkKrcE9a
	yxZFWfZayjkrySkFnayFyrZr9Yy3s7Wr10qF4fKF13Aa48urn0qrZavryDAF4kGw43tF12
	yryqk3W8WFykCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRAJ5r3UUUUU==
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wUIq2oBcEXJTQAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_230014_885678_B85551BA 
X-CRM114-Status: UNSURE (   9.35  )
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

The MediaTek Gen3 PCIe host driver lacks the required 100 ms delay after
link training completes for speeds > 5.0 GT/s, as specified in PCIe r6.0
sec 6.6.1.

The driver already stores max_link_speed (from the device tree). After
mtk_pcie_startup_port() successfully brings up the link, call
pci_host_common_link_train_delay() to comply with the specification.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..5abddec4e9be 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -30,6 +30,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "pci-host-common.h"
 #include "../pci.h"
 
 #define PCIE_BASE_CFG_REG		0x14
@@ -570,6 +571,8 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		goto err_power_down_device;
 	}
 
+	pci_host_common_link_train_delay(pcie->max_link_speed);
+
 	return 0;
 
 err_power_down_device:
-- 
2.34.1


