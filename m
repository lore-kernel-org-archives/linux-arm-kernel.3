Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC44C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i0dyI4MRX18W1XQPVub/atygkpPpTT9XkNbCtuNLz8U=; b=dl3apV8OrRbTDNpWWLztnxrEmW
	5uuIKYyAjXCiC9lCqLsqf0heURzjb3+SXmhvxV0VVK1pglgnI1haJi0AZt3vlLoBK8Ypt6sJyj535
	qp4nYeHsNTFcarbymfaozyeBF/uy5E1znjysNlxjOcefZH/joJNOFUfpQgkVE9G2IYuodC0Hx8tCr
	+WBlfFEaQ9DDe/gVQOmB8TfpJG/yA2C7eB0RQPjHTibc3RBGae8fR4iPsdIh7vFiA2E7/cfTm9MaW
	VZaVjz4FSPeiwbJw0D6gactoJZ0AJDHDEEviTNJNQOVu907m6SsosFB59JDUhR8M1gs30wBzuKM5e
	5o86a7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREZx-00000005DcF-3Ep2;
	Mon, 16 Jun 2025 18:29:09 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBwt-00000004ufS-3E36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:40:41 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bLZ2q4xzmz9spn;
	Mon, 16 Jun 2025 17:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750088435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i0dyI4MRX18W1XQPVub/atygkpPpTT9XkNbCtuNLz8U=;
	b=d4F405nBtgaidEOWwt0/9Ijnres1SntnusICovssYK/05rh985VqVC5tSbhcmmUGY+V/fB
	sVq19pyBzBfSh7jOkhXiNzq9y5lA6pGqHOKgzSrilewfT5Wye90YLP7AA3dJzEjvc5fmhD
	/4FSb0Z8Ywt/VLDMjahcnCTnEaFfbux/nCIFZpPjWGtHmdJ2vrfHj3HoCeR7NbezZRYTup
	ICHIqdao5mUaALCxihA/0oG++809d/mH+xoyiknb11WnWZ/JPeQFHt8yTLUeFbaCo5Mtdj
	IbTeZZlch9i840NYZ8++jkmEMzxTbBPn25kiYoXBPhbWXtrKl37DPfJEPYaa4Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750088433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i0dyI4MRX18W1XQPVub/atygkpPpTT9XkNbCtuNLz8U=;
	b=VK38iCyKphvhZzQkyIYlP7iil1wpU9+Y6B1UoGLZZ+W+aKmm+ZM0mtbrXq3yqAvzV1oxE3
	bwU93R6S5CAcnchdt+ZMFx2hNogebMJbYZB4iJHhtLPewPF3/Q9ZkAag9zRCcJ/pGWkXcR
	xpqp2NXdp0JF0XZ/arh4x+TCmqMhIbnTQMlji4I5Iwjt0GH8CKwIqUa/wr4qlAohuqM0no
	KHMpQddpXi64Ci+yHV9ikJBjkdyi6sU0lTVEo4QIwxZoEroX6c9qrUCHzRtQ9Y4fBRhwtk
	zt79AHZ6RWTbWbPPX4uK/Y6euHgVPbTa2CE9GWJUtLp+Nn7Us/cW7DjCQdcYmA==
To: linux-arm-kernel@lists.infradead.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: rpi-panel-v2: Add shutdown hook
Date: Mon, 16 Jun 2025 17:40:07 +0200
Message-ID: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: izkkms45zo414kq375membxy8gh3oueu
X-MBO-RS-ID: db10599e07852c9faa4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_084040_004031_22349C4F 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add shutdown hook so that the panel gets powered off with the system.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
---
 drivers/regulator/rpi-panel-v2-regulator.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index c506fd699d57..30b78aa75ee3 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -89,9 +89,19 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
 
+	i2c_set_clientdata(i2c, regmap);
+
 	return devm_pwmchip_add(&i2c->dev, pc);
 }
 
+static void rpi_panel_v2_i2c_shutdown(struct i2c_client *client)
+{
+	struct regmap *regmap = i2c_get_clientdata(client);
+
+	regmap_write(regmap, REG_PWM, 0);
+	regmap_write(regmap, REG_POWERON, 0);
+}
+
 static const struct of_device_id rpi_panel_v2_dt_ids[] = {
 	{ .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
 	{ },
@@ -105,6 +115,7 @@ static struct i2c_driver rpi_panel_v2_regulator_driver = {
 		.of_match_table = rpi_panel_v2_dt_ids,
 	},
 	.probe = rpi_panel_v2_i2c_probe,
+	.shutdown = rpi_panel_v2_i2c_shutdown,
 };
 
 module_i2c_driver(rpi_panel_v2_regulator_driver);
-- 
2.47.2


