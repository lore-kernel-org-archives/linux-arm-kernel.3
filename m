Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A5CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7FX6a6j2vVPuJvt3QATUkrzhJNfnfdpsHxwWwNuhKQ=; b=NagzjdJ2razIABt4692RnDAUve
	dCXx2sabftB4ltn1wDlPOxgnqQbMU012kuQM1FQ5lTgVsFhdK0TnYzKF3mwtrBnbNm+brm8RAjVZn
	BWySiI7CyRzDZsClIh+ypVohr4Tfq8mcOU6h/OA5pbiP17Pqoe8+zWzwWNGnybK84p067cR4Peg7I
	WotnfI2yMiq8xzqkX/34/CIQWFvV32nyi5MA7sxvWIpjfO7t9D0LsmRNOlunWeofZulc5cMq0LvMT
	kbV+wQ2fXLPbwewAsTeolFaWXaR752w8fUeLY5q+/0F8D12H3byUj92XO69C76cDeN9xnQ6cKYcBV
	46I6q4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOik9-0000000572Z-1Qe6;
	Mon, 09 Jun 2025 20:05:17 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOihz-000000056pX-2Nul;
	Mon, 09 Jun 2025 20:03:04 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bGNBs2Zmlz9t5C;
	Mon,  9 Jun 2025 22:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749499381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s7FX6a6j2vVPuJvt3QATUkrzhJNfnfdpsHxwWwNuhKQ=;
	b=cyyhig3dyGVOMfbrt+Q6J4b9bMu3tfK/YfRAiUcy5biR9xHuMnq73Mj15DRhb/+qJNY5Jz
	C466H7u+466vT24rL5mlbkL0UadCQGXLL7WbdDhnKDZR1xv1cvTpkyA5xdduTVTwdTwsUr
	ZXMhmljOl70EhxCfnKz/x4IuKXBmxhyHqZdSgwFRl8OEYefbpocsdL92lbUEf84s7Jrvl1
	o4KzDpQrQlZ0o9x7h2HTG3yOZXCd2ObiuYS0a95SXLACWZ+/sgBcl+MZlBizpDmsAobiq4
	Gtlbgkatl24SzdVjxDDCjbm+/Jl8NvvvV5euvOhyGisXqKu/bGG4v0/SEFiIEg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749499379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s7FX6a6j2vVPuJvt3QATUkrzhJNfnfdpsHxwWwNuhKQ=;
	b=pP6nfX3oDeL6cz1oxMxJjaXCeAw87ShgOiwp9ZZDEZ/fYjLTPVHlHbdAo7P5+pRtKqfKQl
	6PrqtU0sMd81G5GvR792jO1clpFHTY/Amjog8nH+7O20j0yiuAyHsvfwLUdyHUBlxBgIlC
	pjg33Dh1Om2Jw77bc47Syn0rDRP14sMdOCFE1ciHY6MqS1bcb8x6HZHv/waHEBtqVJrtLd
	/4VG8ks1ZJ7bj6lmdSanvPlCoNAMtZKsug6BO+9Pmq3sbIkY5e7WalwWG5g4QryTfRdmoW
	Kf8CD70jPMGNsD32mpcU5tNzNcqft2rbw1kpioTUbmeSjvwrXAyPsaEwnrns4g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] regulator: rpi-panel-v2: Add missing GPIOLIB dependency
Date: Mon,  9 Jun 2025 22:02:06 +0200
Message-ID: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hr4y89zgfs8o5ckt38irad4xdgyf1bzw
X-MBO-RS-ID: 1575762181f3be4783f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_130303_747248_62B12A7F 
X-CRM114-Status: UNSURE (   8.87  )
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

Add missing GPIOLIB dependency reported by the LKP test robot.
This fixes the following report:

"
kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_REGMAP when selected by REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
   WARNING: unmet direct dependencies detected for GPIO_REGMAP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=y] && REGULATOR [=y] && I2C [=y]
"

Fixes: d49305862fdc ("regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506092341.enbNKMOR-lkp@intel.com/
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
 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 21ad6d938e4d..9a3dc883ff40 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1155,6 +1155,7 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 
 config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
 	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
+	depends on GPIOLIB
 	depends on I2C
 	select GPIO_REGMAP
 	select REGMAP_I2C
-- 
2.47.2


