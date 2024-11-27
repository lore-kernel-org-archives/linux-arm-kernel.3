Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D6AD6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCaePtDQjPCLIdCcCr6OunaIwfPqBEUXNIZ/ElYG08g=; b=KZnzhLPrjzhUAGiToTfEf4Vc59
	CcTw01LEJ71Ab9AGMH47+KlXF40+s3u88oEtCKjeFIWEMoAsl1/hcWg0idCPc//oJGKGckmTBAYwQ
	PORhdyVImy657SUK3IrPYDHom/ZA5ouMPVyx4xiZcWxWJ2qIOqoF305wUQf9lLU/lTciSjV4b/uYo
	HwhAFiBYWsN7lkqE/VfpI4i56RDr2h9Oj0ORjcfjrMhP+aiqZ07N7rLE/vtrY10qXPlEB5TUOmAqw
	HoZgv8A1AmLUceeKAGHte50eJVHgTUdbU6PTHHY0WROCMsJ4cc/n8n1VxzMOG8oW9B/w31nDSEdRl
	RfYQUjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLFJ-0000000DgPv-311m;
	Wed, 27 Nov 2024 16:50:33 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9e-0000000DfFQ-29QB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9FDCBFBA9;
	Wed, 27 Nov 2024 17:44:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725880; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lCaePtDQjPCLIdCcCr6OunaIwfPqBEUXNIZ/ElYG08g=;
	b=DqMa2xbPOiYHmB00M8XGgKAx+DjXCOxQkjFDsSbLtpaxs1rfWfr8YLsgudXjw4NS5o3IZ5
	/8vmDOKhHvoFfhMwPvGAbh2d8OKAa5WfVolOiGbJyJwPdOzhj7m5yB58rVpYi/CadXHUCW
	wyX0t8/mhW1SV1EkKFJSj2aBiZFVa+B72sUHF6N40ATzo5FfKOIJ8OJKAq4rufg7GGJF2/
	myUD1A+WjC4vALZpQ7BNJS/l8tmEgHNcrpNn8S4/BxhamWj4HO1u3K6Lqm0muEoCrDce2P
	gqojdd5I4KeFqOEz/WEIalPVFZoOeQv1LJHYMABpVbJzAACU2DUTiAN/IIl7UQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v2 05/11] Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
Date: Wed, 27 Nov 2024 17:42:21 +0100
Message-ID: <20241127164337.613915-6-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084442_706377_8F651C6C 
X-CRM114-Status: GOOD (  13.88  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This reverts commit 8c67a11bae889f51fe5054364c3c789dfae3ad73.

It turns out that all boards using the PCA9450 actually have the
SD_VSEL input connected to the VSELECT signal of the SoCs SD/MMC
interface or use a fixed level.

The assumptions on which this was implemented were wrong. There
is no need for a GPIO-only-based approach and keeping this will
cause confusion and lead people to implement non-standard setups.

All in-tree users of this have been migrated and we can savely
remove this now and allow for a more future-proof approach
of syncing the actual status of SD_VSEL and the PMIC driver.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* rebase to current master
---
 drivers/regulator/pca9450-regulator.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 9714afe347dcc..0f8a515a0b11a 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/err.h>
-#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -32,7 +31,6 @@ struct pca9450_regulator_desc {
 struct pca9450 {
 	struct device *dev;
 	struct regmap *regmap;
-	struct gpio_desc *sd_vsel_gpio;
 	enum pca9450_chip_type type;
 	unsigned int rcnt;
 	int irq;
@@ -1015,18 +1013,6 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
-	/*
-	 * The driver uses the LDO5CTRL_H register to control the LDO5 regulator.
-	 * This is only valid if the SD_VSEL input of the PMIC is high. Let's
-	 * check if the pin is available as GPIO and set it to high.
-	 */
-	pca9450->sd_vsel_gpio = gpiod_get_optional(pca9450->dev, "sd-vsel", GPIOD_OUT_HIGH);
-
-	if (IS_ERR(pca9450->sd_vsel_gpio)) {
-		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
-		return PTR_ERR(pca9450->sd_vsel_gpio);
-	}
-
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.46.1


