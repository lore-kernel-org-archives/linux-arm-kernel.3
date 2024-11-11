Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0229D12D52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 02:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYOeFEvjF9EiBqY8V2DdoQCpdhmvNoj/sQPxdzZTp+Y=; b=QiKRL6MgROshU5FKbrAdH86CFr
	LNmaSI8wDvE24kGggzK13VHU+Y/u60apR7OnrgOwv545NIl3hCNHcibXLCAe5+36MpRqUyVVopxwN
	D/OrWPPHwbXlbHpdi1y2+JvmZW4wwGI1KUwegn2oijhbZSb+oPSEDbin6vZcCwXo0Kx7kRO9Cq0eS
	5U0Rgc/pdS7jCNawPrIaRZEwC0lDckiJZxqwBZCgLD+UD4HbXaKdtN7u5CCqLb9Dmd8W/qxF8mKsN
	D2LUCTKzKA/8Dz7NbcNeRfE/YKzeiMYp5LHaBXaET6xQbMNGQSrP+LpbJUwWXZzAjjeSmiGCBgxsc
	SUhG8oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKHt-0000000G8ca-2ocX;
	Mon, 11 Nov 2024 02:36:21 +0000
Received: from mail-m245.xmail.ntesmail.com ([45.195.24.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKG5-0000000G8Jv-2lbm;
	Mon, 11 Nov 2024 02:34:32 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a5842;
	Mon, 11 Nov 2024 10:34:20 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO version ID
Date: Mon, 11 Nov 2024 10:34:09 +0800
Message-Id: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0gaHVZNQk5MQ0xPTUoZHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931912755a09d8kunm258a5842
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Mio5AzIhNCwiIwgTGDY2
	Sz1PCjJVSlVKTEhKSUJJT01JT0pNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSktPQzcG
DKIM-Signature: a=rsa-sha256;
	b=CAhwIL9TPSOIgZTHl4UJ5tsTP4/WuxKODyQlakAqUTs/AhGlDQj7pAzT1JeLgzeS5RsfcXWGwYv/oR5SgVMChfrod/cTyNbyCYCkwUm6KKg71BflYlY+GOepVUW5Uv3W7spoH040aVhDobQx1m4DCysnKtvRHTTA4XX3RRyfHtE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oYOeFEvjF9EiBqY8V2DdoQCpdhmvNoj/sQPxdzZTp+Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_183430_255914_2D13866F 
X-CRM114-Status: UNSURE (   8.40  )
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

Remove redundant comments and provide a detailed explanation of the
GPIO version ID.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..71672d654491 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -26,9 +26,15 @@
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
 
+/*
+ * Version ID Register
+ * Bits [31:24] - Major Version
+ * Bits [23:16] - Minor Version
+ * Bits [15:0]  - SVN Number
+ */
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
-#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
-#define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
+#define GPIO_TYPE_V2		(0x01000C2B)
+#define GPIO_TYPE_V2_1		(0x0101157C)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
-- 
2.34.1


