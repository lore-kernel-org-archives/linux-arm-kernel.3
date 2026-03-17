Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8592F53D84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHtZECZh1lccSMdvYoO6Obq74NAnMNmsVszX85g9OrM=; b=F9vMd113Yd/4qQmPUZOZ4OrO0R
	ZRBppo9RcfEVUH2I6+1jNYQPShOXObEXBPmXwZXi1uNutchG+jSdkUGyUul6+NE4q4Y8n8Ee6kKM+
	PqLDkVNpt0BzCk6dyT2TJ3Kw63fIQUOHzrRgHbJYIHSozkY9vvgHW5Pz+c2G+u1co8av8P2xciFUm
	1JxWCnOpbO+xjuSCawyKgBYujLJ0yuJ8hmESq2afJr7NnTBOjnz9gEcwfcxFte2lZTXCENiVJESl5
	lE7luHCrfkzZ4Z2yYt687/CLnA2y3oWH4FviNNiaP8ZW+jRbWjODI4oRgmpIrloL80mA9u+BjzMKC
	VwUZu17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NQH-00000005SvZ-1mUA;
	Tue, 17 Mar 2026 05:56:57 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NQE-00000005Stg-2srU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 05:56:55 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Mar
 2026 13:56:42 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 13:56:42 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 17 Mar 2026 13:56:43 +0800
Subject: [PATCH v2 2/2] mmc: sdhci-of-aspeed: Handle optional controller
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260317-sdhci-v2-2-39b1f063061b@aspeedtech.com>
References: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
In-Reply-To: <20260317-sdhci-v2-0-39b1f063061b@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Andrew Jeffery <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773727002; l=1614;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=DSoqlna8u7OCuF3/5m/l2C6jTM9r0dUx3ka7UV6Fe8A=;
 b=VbYwjGJsR8J3X3Nl8Beo94UfMy+DhfmM5ZwdouDHm49volC5Ts/2ld8y1hSW5+kPrm8Y4R7Ay
 OQHgXV3c3EuBTmaGZQ5PkgTqZyk2fIwFpDNDZ9zVCB0mO5TQwMMT3q+
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_225654_745956_C00F1729 
X-CRM114-Status: GOOD (  10.55  )
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

Get the optional reset line for the ASPEED SD controller during probe by
using devm_reset_control_get_optional_exclusive_deasserted().

This allows platforms such as AST2700, which require the SD controller
to be taken out of reset before use, to work with the existing driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v2:
- use devm_reset_control_get_optional_exclusive_deasserted replace
  reset_control_get_optional_exclusive.
- add include reset.h
---
 drivers/mmc/host/sdhci-of-aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ca97b01996b1..8f638ffb55ae 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include "sdhci-pltfm.h"
@@ -520,6 +521,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
 	struct device_node *parent, *child;
+	struct reset_control *reset;
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -529,6 +531,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdc->lock);
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(reset), "unable to acquire reset\n");
+
 	sdc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->clk))
 		return PTR_ERR(sdc->clk);

-- 
2.34.1


