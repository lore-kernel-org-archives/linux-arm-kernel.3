Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34112CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcZbWnpqTBBcWyQnhfBBodfgLLsigOVlRE5RikKEkBI=; b=Jb4BUL2qmXA2itw2rXQBqgvG9t
	oBJHY4J5n43zSsqBV+OofuTTGhiegoAefRK4WzAK9U6Bt6mVZOjb+GICv+fDDyryasZbzhetuoGg4
	bIR1nPjV1b8nmWsytEK/eaQ8UnXmY7gel2+lDbP9OIeONCaji8ck0N4st941xupMhgsBtfV2PAPWv
	89UN2CoAdfpBhr35jszdvG3sNUjpCIQhdEVXHLj1lsd0DMHbdZUpjBhmYHAqW1Q6ZNWb6oG6MPofg
	DyioQUagVcrGulZY5+J+Y6B5GmMbQGYbvhiEqlu2570ps3txTWxYF/1vnKvfoMl5HI23K188etVVX
	EcdMHh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm5H-0000000DlVE-1Fvi;
	Mon, 18 May 2026 00:43:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm53-0000000DlN6-39Gl;
	Mon, 18 May 2026 00:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hc
	ZbWnpqTBBcWyQnhfBBodfgLLsigOVlRE5RikKEkBI=; b=GWuKyRrOy6UuE8O7C/
	HsxV6xT1jpXNS6oE2G8VvdtpN4yzBb8zpUjDnS9xyQNZfU5W9jKs4PM1zlq+wx0C
	vHbMthlX/Cfnjdop1OxjfOmeFx1PCiyjhao+r7smSrO5phZanDIqhU8VhWwoXH9g
	WLqP4qvUXHAZ8uKhxPFzHbmWw=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S9;
	Mon, 18 May 2026 08:42:59 +0800 (CST)
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
Subject: [PATCH v4 7/7] PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper
Date: Mon, 18 May 2026 08:42:46 +0800
Message-ID: <20260518004246.1384532-8-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnj6SIYApq2fikCA--.4779S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFy7uw17AFWrCFyDAry7KFg_yoWkArg_u3
	47CF9rAw45Kr9xCF12v3ySvFyYya4Iqr1jga1rK3W3Jay2yFnYywn7ZFs0yr15u3W7J342
	vrykCa48CryfCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMfOztUUUUU==
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBNZ-GoKYJMF0AAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_174338_136275_BF000882 
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

Replace the unconditional msleep(100) with the common helper
pci_host_common_link_train_delay(). The helper only waits when
max_link_speed > 2, as required by PCIe r6.0 sec 6.6.1.

This avoids unnecessary delay for Gen1/Gen2 links while retaining
the mandatory 100 ms for higher speeds.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..66f687304c1c 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/units.h>
 
+#include "pci-host-common.h"
 #include "../pci.h"
 
 /* AXI registers */
@@ -1663,7 +1664,7 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 	if (ret)
 		dev_info(dev, "Failed to set max link speed\n");
 
-	msleep(PCIE_RESET_CONFIG_WAIT_MS);
+	pci_host_common_link_train_delay(host->max_link_speed);
 
 	return 0;
 
-- 
2.43.0


