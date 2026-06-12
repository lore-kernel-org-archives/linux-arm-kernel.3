Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C52CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5wnQHmqrGIZDNQrN7U/jxMi4k1qdtaoiocoy3cp5RI4=; b=MDKxCq+IJgGM5EXS2S6IMch5p1
	f901vGFmerLrGxyr/Ejay9t9biHdBVJBStzoY+YVu8dl5/DQ3yQPuZFuBiqU38MIr9L0tp/BWaucY
	WhJfmEsvowl0/mcxvnMqNvarFWfrlJ2CzK1nq5EHFAcVRl8BilVpiIU7VcifSyC9oVYphIDQ4FyYu
	qEiebs9RKkPDr6YGfRipYKZ7NY2D1xTxBLoFK2hRykHhlzYPGarQKFNcqpKJiU/WR0DWIMgrQAjp+
	49ljRAvHDA908N2bmtazFxYB4ryYa6IJw6ro9kYsOBwN279Gs0jAdGmOyp0rS7DIHmTfBnMzVDLXV
	j6QTM80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9lI-0000000BcdG-1nkc;
	Fri, 12 Jun 2026 21:50:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9lH-0000000Bccl-0cL3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:49:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7909F4423B;
	Fri, 12 Jun 2026 21:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC681F000E9;
	Fri, 12 Jun 2026 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781300996;
	bh=5wnQHmqrGIZDNQrN7U/jxMi4k1qdtaoiocoy3cp5RI4=;
	h=From:To:Cc:Subject:Date;
	b=BZtFgNU0hUkkdcYLO0UjyfbxiAgKg7vLoYzNabrgECqXZ6qx5Sgl2Ze8sHr9UEAgy
	 IV1A9tee0wwaJfvqH+yU7DKOSDzFg/G11q19S5r0UCa/LwZEnjp8LDeFEayXaS2Q6U
	 i9TXgvB5Mdp3XH3Pfid87Rl61qsc+vBaklKJYho3F1wkJpe+CWJrLFAL7orWBxGzJ9
	 rYorFr1qKJxTPj7abTBCJBBKMoTOmFjxoXL8/l28bl2AT1cLyxDmqPrtmy8f2XktoX
	 VmwwUSBOG2lC7AALaXhEDdLCiwhWv1LO/NdccAungZlfT6omZ4moFpMjn78LtLXqmi
	 PUsvLXgBSW81Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: Match DT helper types
Date: Fri, 12 Jun 2026 16:49:38 -0500
Message-ID: <20260612214939.1883911-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The affected pinctrl drivers either check for the presence of a standard
property or read a property documented with an 8-bit cell encoding.
Using boolean or u32 helpers for those cases disagrees with the binding.

Use a presence helper for "gpio-ranges" and read
"microchip,spi-present-mask" with the u8 helper documented by the
binding.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08_spi.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 8c353676f2af..e20f7dc79d43 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -868,7 +868,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->set = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
-	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
+	chip->pinmux_is_supported = of_property_present(dev->of_node,
 							"gpio-ranges");
 
 	/* optional GPIO interrupt support */
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 54f61c8cb1c0..76d4c135db11 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -143,13 +143,13 @@ static int mcp23s08_probe(struct spi_device *spi)
 	unsigned int addr;
 	int chips;
 	int ret;
-	u32 v;
+	u8 v;
 
 	info = spi_get_device_match_data(spi);
 
-	ret = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
+	ret = device_property_read_u8(dev, "microchip,spi-present-mask", &v);
 	if (ret) {
-		ret = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
+		ret = device_property_read_u8(dev, "mcp,spi-present-mask", &v);
 		if (ret) {
 			dev_err(dev, "missing spi-present-mask");
 			return ret;
-- 
2.53.0


