Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3551CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 22:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umNPOZkCrKlDMO8AKev8FMr3gxVoTCDdcW8E929h4+E=; b=fEIJGcLIJHmwZSmLkoBsZvQO9l
	rsit4R7yYyhQDDmKGBRPz7pyxGfa8bPU/OQGxP5CQEtdwhK/sQo8XehBj5DF/fBBqLxS8otmg3Bdh
	gbtgf3uK0o9sy9s73iI8EaC3HxkzcrH/XLKUGY5IaYqZ1nFTdYy7zQX3EHRPch8Mqw/6z4Xa1DPLW
	kLNQmx/iwsymwXpD9BLJAemWNvk9YGPHOYqozT45otiqbWASbKpe5FVbJu9h48eReE2wKrypgJ08M
	sJV+QsJvHLGTu65/0I772HzdJfu7Hj8PUeUMGLdQIU8UCtM8FarI1lzaofFIPuCUSvC669a214uxz
	2Zx9z5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Rn8-0000000BM7Y-3mWt;
	Thu, 02 Oct 2025 22:28:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Rn5-0000000BM7A-27hS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 22:28:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7841655;
	Thu,  2 Oct 2025 15:28:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B6DC3F5A1;
	Thu,  2 Oct 2025 15:28:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] reset: core: reset-gpio: Suppress registration error for optional resets
Date: Thu,  2 Oct 2025 23:28:26 +0100
Message-ID: <20251002222826.16516-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_152847_583947_6EC89659 
X-CRM114-Status: GOOD (  14.56  )
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

For reset controllers that are marked as optional, we should skip errors
during probing and return NULL, to avoid unnecessary failures. The
reset-gpio controller does this mostly, but returns the true error in
case the __reset_add_reset_gpio_device() call fails. Treat this call the
same as the other registration errors, and consider the optional flag.

One could argue that at this point it's a proper error that should not
be ignored anymore, but in case of the reset-gpio controller this is not
entirely true, since the code at the moment does not support GPIO
controllers with three #gpio-cells - there is a TODO comment about this
in that said function. So to avoid unnecessary probe fails for devices
using reset-gpios (it's an optional reset after all), let's treat an
error as still optional at this point.

This fixes operation of WiFi chips on Allwinner boards, where some use
reset-gpios, and which currently fail because all Allwinner SoCs use
GPIO controllers with 3 cells.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/reset/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 22f67fc77ae53..c2ccd08fb36e1 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1044,7 +1044,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 		ret = __reset_add_reset_gpio_device(&args);
 		if (ret) {
-			rstc = ERR_PTR(ret);
+			rstc = optional ? NULL : ERR_PTR(ret);
 			goto out_put;
 		}
 	}
-- 
2.46.4


