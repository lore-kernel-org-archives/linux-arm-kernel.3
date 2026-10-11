Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D7CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFUETxEuaWKaun1+fDxvFjJ9XCDQJOC8LJkAhb6iig0=; b=2OBqIeY/Hl/04gO9mdpfROsZX6
	4PHbocaSVQYOoFeyjSFu+IO+iGcnzGNSftHaNwQGbuLx7kmdgEVJf8twWtj2438j8G4tlVSroMZue
	7r+XTEJ3tkb5MLnzXh3ce55+OdHXHEYNgdlrpLkJ/qG2uHMnN7JCdgRGEnnDTEAkvvIQo1pLyzY8f
	Bou1IkPZJcIn3bthheiNy4qC+YxeONSxgXTRalSfnAcStnOD4uZM0uY6I2JTMDENlIL4qPSwElPXj
	2SD7jUPcqof32AmC1KAEUqwtzZoE2A9Rxo5ZDeD5NgnmjvZq19t64RhauOJZTD2uaCLQpxN4znCXa
	ING4/d1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyB-0000000918Z-1nmG;
	Sun, 11 Oct 2026 12:48:03 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsy8-0000000915O-17tG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:48:01 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4j2gPB2jzZzKp6V;
	Sun, 11 Oct 2026 14:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1791722878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFUETxEuaWKaun1+fDxvFjJ9XCDQJOC8LJkAhb6iig0=;
	b=BPNkT52wD5GCJTextCbwGrFv2vufu3hpKM18vtz/B6mtcrlVwiQNOdV7kod+mD6V09V1ZX
	fMWetZ7b/fnwv26LZ4v20jFuy4HKjqvI+/Pt+uDeLirFDd5holRVEebVL8Oo+ajID7QX9S
	WN6C9KNC+MwcwQwdMYE3/banzgzfE5hSHdicwkpfD97Vnm+8BE4e+c4THrwF9JkdWGufQt
	D8ecMnwW1kZS1OQSIvgZ1KwOxTa8sQp1rBuQXYUveOvJcBvJEFlDmkLvFFuM+btWYYFRkJ
	0cI5gwJ3ocT1IGWzowLFmUnDf/Iw0TeAAsU6E2UFvWjGXYCpuTvtdcvZzaYx9Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sun, 11 Oct 2026 14:44:58 +0200
Subject: [PATCH 3/7] Input: s6sy761 - add reset GPIO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-lat3st-google-raven-touch-upstream-v1-3-2a9f55159b9e@timmermann.space>
References: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
In-Reply-To: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4j2gPB2jzZzKp6V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054800_460592_4B67C5D7 
X-CRM114-Status: GOOD (  12.88  )
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

Some boards wire up the controller's reset line. Hold the controller
in reset while its supplies come up and release it 10 ms later, as the
vendor driver does, and assert it again on power down. The GPIO is
optional, so boards without it are unaffected.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/input/touchscreen/s6sy761_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/touchscreen/s6sy761_core.c b/drivers/input/touchscreen/s6sy761_core.c
index 0e455060dbc0..8541cd9aa930 100644
--- a/drivers/input/touchscreen/s6sy761_core.c
+++ b/drivers/input/touchscreen/s6sy761_core.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
@@ -100,6 +101,7 @@ struct s6sy761_data {
 	struct mutex xfer_lock;
 	int irq;
 	struct regulator_bulk_data regulators[2];
+	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
 
@@ -297,6 +299,9 @@ static int s6sy761_power_on(struct s6sy761_data *sdata)
 	if (ret)
 		return ret;
 
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+
 	msleep(140);
 
 	/* double check whether the touch is functional */
@@ -370,6 +375,7 @@ static void s6sy761_power_off(void *data)
 	struct s6sy761_data *sdata = data;
 
 	disable_irq(sdata->irq);
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
 						sdata->regulators);
 }
@@ -406,6 +412,12 @@ int s6sy761_probe(struct device *dev, const struct s6sy761_bus_ops *bus_ops, int
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	err = devm_add_action_or_reset(dev, s6sy761_power_off, sdata);
 	if (err)
 		return err;

-- 
2.56.0


