Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D227C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvrwNGdIZSgJq5xWaqIiDKNV3AzrKgK1obvtMUj6EjM=; b=lsGpMJ3ghKf2LX+F8nEgTdYCYb
	pBCspcId9Fjk1a4sTc5h6nLyss1dqluqkZvQWXpjvwXVDAUsqC4QTDf3qpFL091k9RsnehWJnUMTt
	aAOnQ56Eq/ReBXXhGGbJErtD2Ai7JFU1GbI0eF4BG0wJKxXqb21VcaVEcu90c5LdLnSvsgU1huG2b
	awfp6WLk3RnIehj5T1OkDFHXnQQqVHP/CFm9M+H4LT4tCL9JYfxjy16vSfALzIlhJP5VvtfCsFzb5
	2I46J7JoGHPgXv78I+hkDY7CDeT5kd05+bzHUWBl7gqkOqpde268N18oVrv+BxLVnI92aMP4XPRLG
	4L7M42Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRKa4-00000005ufX-02nx;
	Tue, 17 Jun 2025 00:53:40 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRKXo-00000005ubZ-2qT8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:51:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bLpGD0Jqgz9tbw;
	Tue, 17 Jun 2025 02:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvrwNGdIZSgJq5xWaqIiDKNV3AzrKgK1obvtMUj6EjM=;
	b=lfS1vp2u/vyPqSci6vIOHT0uon8iVtQ6TN1L7GzuzNpZKLMsiG+pitv6FZsG4BsQ5X6QPX
	4wr7tMcGOetpbtTNiQB21mUeSiCd+Tx0stq+fbrsAvlAMO93gog5WlIoEyYuDp9+IGc/Dm
	n5BHTgD37eFeLOwexXEe8+0PiO1DALOlsnhwHZKI3feolNqJy/DCAjtf13HGA52NDQsjVv
	o1ZhpeFj9i99b6EhvJKdv0WkFZsfJKxLYAGamn+E+2Eb7987s3ooUaoUtsgOuK3Wurh1HP
	mqGc5WQRJ5U9htWP6AwuNxkwfxPYCRbebxvM8b07M6AnvWJKgwiYt25HuLYR+w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvrwNGdIZSgJq5xWaqIiDKNV3AzrKgK1obvtMUj6EjM=;
	b=T4FlS+9DmT+pchNlPNZzlMWopjehJh9nEHbFHunQfbDDB7V+imn0f4sQ14wnwewhd/Wup1
	1Ur80j57M5cY1Dl/+Jmr7NUJjMOLIRHVgtfinNMGfYYmBScIcAMCFcSlNUPFpSI4kyyjgl
	e8NMocb4Cf7mFPtNvsHhrYMhuzW1wIgjE3lg7dnfbijCT35judx3Y5+QHOZ82cBvJsGxkQ
	W853BlKNn6M2lF7OCnLnoWGLpffhehLgktW8s9JLRqO/TPmYoKtHc8eyRXCZPkx1TQMMdS
	5Cgj+FMZ5i2CgTLm9t2FxWWGaM0q5hTP/aGP9nqaPnhqx+gkW92SyGm+GTnRpw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
Date: Tue, 17 Jun 2025 02:50:25 +0200
Message-ID: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nmug86pujzqqmcesapuay11to3qu6osh
X-MBO-RS-ID: e6a123acab8373b2a78
X-Rspamd-Queue-Id: 4bLpGD0Jqgz9tbw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_175120_926742_EDE54313 
X-CRM114-Status: GOOD (  11.82  )
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

Convert the driver from legacy PWM apply ops to modern waveform ops.
There is no functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/regulator/rpi-panel-v2-regulator.c | 50 +++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..be42afc81d72 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -35,24 +35,52 @@ static const struct regmap_config rpi_panel_regmap_config = {
 	.can_sleep = true,
 };
 
-static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-				  const struct pwm_state *state)
+static int rpi_panel_v2_pwm_round_waveform_tohw(struct pwm_chip *chip,
+						struct pwm_device *pwm,
+						const struct pwm_waveform *wf,
+						void *_wfhw)
 {
-	struct regmap *regmap = pwmchip_get_drvdata(chip);
-	unsigned int duty;
+	u8 *wfhw = _wfhw;
+
+	*wfhw = DIV_ROUND_CLOSEST_ULL(wf->duty_length_ns * PWM_BL_MASK, wf->period_length_ns);
+
+	return 0;
+}
 
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
+static int rpi_panel_v2_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+						  struct pwm_device *pwm,
+						  const void *_wfhw,
+						  struct pwm_waveform *wf)
+{
+	const u8 *wfhw = _wfhw;
+
+	/*
+	 * These numbers here are utter fabrications, the device is sealed
+	 * in metal casing and difficult to take apart and measure, so we
+	 * pick some arbitrary values here, values which fit nicely.
+	 */
+	wf->period_length_ns = 100 * 1000;	/* 100 us ~= 10 kHz */
+	wf->duty_length_ns = *wfhw * 1000;	/* 0..100us */
+	wf->duty_offset_ns = 0;
+
+	return 0;
+}
 
-	if (!state->enabled)
-		return regmap_write(regmap, REG_PWM, 0);
+static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const void *_wfhw)
+{
+	struct regmap *regmap = pwmchip_get_drvdata(chip);
+	const u8 *wfhw = _wfhw;
 
-	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
-	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
+	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE : 0));
 }
 
 static const struct pwm_ops rpi_panel_v2_pwm_ops = {
-	.apply = rpi_panel_v2_pwm_apply,
+	.sizeof_wfhw		= sizeof(u8),
+	.round_waveform_fromhw	= rpi_panel_v2_pwm_round_waveform_fromhw,
+	.round_waveform_tohw	= rpi_panel_v2_pwm_round_waveform_tohw,
+	.write_waveform		= rpi_panel_v2_pwm_write_waveform,
 };
 
 /*
-- 
2.47.2


