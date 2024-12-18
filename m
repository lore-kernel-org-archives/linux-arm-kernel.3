Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0600E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjozMOsMtZ5TwghDOEmqXJ6JAY4r0rRBxbKRxT00hdw=; b=rnyq+/teIdEuaKByBAA0WSulkA
	7brg82ZKxYs7dQsy74ARd6kTWn/nIsx1Yw12vV5ycgqm7L/tLFX/5mxj3Yn8qF5mtYOWEyiRVq553
	x7kzQXTSVnD09xjvTfaVTCmhaARSgtz/rw9XhlJOHGq+XC5sF0LTMOQxcB9qv/CczZKp5psQgmNzI
	YCIftUgdJecpmsnPiP9vwfG5lD1mer9ySotFiky96V+KpwMT0Akq0+vaxaUvDOLoACb8ZcI7971+A
	u670VXttD7NiRdQH/uh+T4nTeqDtaxLAMtJdN3MctScWKcou1jSfrswiEdZu2EPtAhCiVWBMCbPFh
	pUCYTm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw31-0000000H1xN-3zZs;
	Wed, 18 Dec 2024 15:33:15 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvzj-0000000H1HW-1VBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:29:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 254EFBFB71;
	Wed, 18 Dec 2024 16:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535788; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HjozMOsMtZ5TwghDOEmqXJ6JAY4r0rRBxbKRxT00hdw=;
	b=Rqm+vuKlBLH5Asa0NSbWGR8djdOdUjz5bqKBT28KCUDihQ8cfLZzQZ9LIphXcqU7f5icVN
	7tOut9gktho+TMQ3jsMj3uOmEHuFJt1pJkbJbnK8DpwquuRek8L5voWys47HCNqbBkf1WE
	rPV8SaHVUam6DnvbLS2NlCBt5gmefPEUqZHO0C5vHXzpPn6OK6P5L0l41ganib+hPTLzBN
	vnmGc50YHSv8hOzjWKTR0YFDg1+YtF6B+qf8SvRcCFWXHtjlT36F/Z6zqyAnkqB+pApMWz
	klrUj24RbC+CurLUm5vIG/hPw79tRqRCiKC9UU6oc3O5XVxyFB9ZuixZbvJR0A==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH v3 3/9] Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
Date: Wed, 18 Dec 2024 16:27:26 +0100
Message-ID: <20241218152842.97483-4-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072951_547344_82B835B9 
X-CRM114-Status: GOOD (  13.17  )
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
Changes for v3:
* Rebase to next-20241218

Changes for v2:
* rebase to current master
---
 drivers/regulator/pca9450-regulator.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index faa6b79c27d75..9e5e81a9315f6 100644
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
@@ -1031,17 +1029,6 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 					     "Failed to enable I2C level translator\n");
 	}
 
-	/*
-	 * The driver uses the LDO5CTRL_H register to control the LDO5 regulator.
-	 * This is only valid if the SD_VSEL input of the PMIC is high. Let's
-	 * check if the pin is available as GPIO and set it to high.
-	 */
-	pca9450->sd_vsel_gpio = gpiod_get_optional(pca9450->dev, "sd-vsel", GPIOD_OUT_HIGH);
-
-	if (IS_ERR(pca9450->sd_vsel_gpio))
-		return dev_err_probe(&i2c->dev, PTR_ERR(pca9450->sd_vsel_gpio),
-				     "Failed to get SD_VSEL GPIO\n");
-
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.47.1


