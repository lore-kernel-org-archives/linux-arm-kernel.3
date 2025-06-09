Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AAAC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vmNxAHTcAKYa4+tkKZ6yahAu+0AClxsWX7LSkn8ioaU=; b=REXaVKzjpDx06K1toEUCpk2AC+
	TcO1ZKFQ1T3s73o3vUj988Y85KV9fhRpNgRpeIVFxHIcqLKZG86kFpD0NqFyAf54IqPCAbes9VFE/
	aCO4jKBRWkU9pfuy4jed5OU7zgvnYFdddzKOgTo9w6BR+P+Jb1NdydPmfEwfcPIL9CDhX3wAxlU8a
	/PM8+VhPFaULfmtiNmb4HH0iEfcQBi388BW01vbIyyYvW5oEGgUMuE2HMiEqMvBJ53gy0xiFzP0C+
	/IIutRQmNJyROcjRFA5fjVzRGpEmVzQYufTbqIMtEUWOyoJRvtL21qcuvPsV39N76lS3ra5r/A0ua
	jg7jfd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl2t-00000005Lpf-18v7;
	Mon, 09 Jun 2025 22:32:47 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl0k-00000005LjP-44OP;
	Mon, 09 Jun 2025 22:30:36 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bGRT22xS3z9tGG;
	Tue, 10 Jun 2025 00:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749508230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vmNxAHTcAKYa4+tkKZ6yahAu+0AClxsWX7LSkn8ioaU=;
	b=UPprLgQT/oECTfkICeKjc9LWqXN+k1R+2p4+qiFGbCVitcA7GQh2m94W1yFuKufHmC462x
	sS3gVw7BC6Xhu4RvmpgNSKy5msqkH2HeNTRY/V60CSn12mASOwpIQwWhfscBAdF4p1zumL
	qxmuz5ORkLlJP/7ijVCuveu8LpOWzwlqw03XmKfkPVdN0UWUZu1qaf0kray6Eb4yOj6XIY
	sPGIse376rDG/KtR/vHX5DScK2vKwte+TbUoNLOIoS/Dk2+5pljCTLQgsys4FarL50z8UU
	Tm12k4z8pohSH2W0+t+OeVYAASyfomK1gpCAcCy7bsLI7bLs4xnCSLRo/l84oA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749508228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vmNxAHTcAKYa4+tkKZ6yahAu+0AClxsWX7LSkn8ioaU=;
	b=QekqR9OZ5KKbH8tJkJBjd+zj+ZlL4/A2hSmd1r/F/HuI/D15UIaG9wzwxGzBomxrs2KVUd
	oPPf3Zr1rU4f7SK/JM/XNLNSciSAtlIDRPN4kCUa0kgZEnr9ELonNVM0dty/EDBkE+fRWF
	NeSgrundz06LM9teRZUIIJJisjeJ76GWHF43kSjSHOXNyWiTgUpV+e9zCd1YLHAYlRNUMC
	O+ms/W4IItFI+xLF8QIKp4wBBzvytIK39s5C34T7E7bAcE1fyUfONQp6XsZnAGu0B5/SvX
	ekzbCrWIVp7XMvPXOcfwIgmxsKhLGyEs9vKteQtZFRpI3JHV2sq4qpQovqj8Dg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] regulator: rpi-panel-v2: Fix missing OF dependency
Date: Tue, 10 Jun 2025 00:30:00 +0200
Message-ID: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: n4adzpkjoks7wk61tom9eaz8eq9mn7mz
X-MBO-RS-ID: 20a527d05fd7ff8970a
X-Rspamd-Queue-Id: 4bGRT22xS3z9tGG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_153035_184365_E438F8CD 
X-CRM114-Status: GOOD (  12.53  )
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

Add missing OF dependency and drop of_match_ptr() use.
This fixes the following LKP report:

"
>> drivers/regulator/rpi-panel-v2-regulator.c:95:34: warning: 'rpi_panel_v2_dt_ids' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id rpi_panel_v2_dt_ids[] = {
                                     ^~~~~~~~~~~~~~~~~~~
"

Fixes: d49305862fdc ("regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506100440.fyTGO7CG-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 drivers/regulator/Kconfig                  | 2 +-
 drivers/regulator/rpi-panel-v2-regulator.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 9a3dc883ff40..7423954153b0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1156,7 +1156,7 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
 	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
 	depends on GPIOLIB
-	depends on I2C
+	depends on I2C && OF
 	select GPIO_REGMAP
 	select REGMAP_I2C
 	help
diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index b77383584a3a..c506fd699d57 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -102,7 +102,7 @@ static struct i2c_driver rpi_panel_v2_regulator_driver = {
 	.driver = {
 		.name = "rpi_touchscreen_v2",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(rpi_panel_v2_dt_ids),
+		.of_match_table = rpi_panel_v2_dt_ids,
 	},
 	.probe = rpi_panel_v2_i2c_probe,
 };
-- 
2.47.2


