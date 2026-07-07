Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSiPl1Eq7KKLTt1UhXrTqQ8J4cUQVL1d4HGOdMyYuAc=; b=mekOqka/2tytSlz5wzfkg473Ne
	03OI9sxFT2/5GKuYg+iCI4RM1VPJUWadxY0sYQcuJrp/szwO0tZ/jUC36SR5jcQR5rdUlzI7sdU/c
	nL4cGmKo1yjodJSYuLlHkyowLem/huJ44Ow7sxpXmC649nhNEm7JFZdI+lZchAUloVngDGXgdrNdv
	7pKhUf8n6hZVImNXit9zUExGdJ7Xm8O877RplaYCPosy3rfrEf3FPwvLIEzBt5Pp5mdsy9VxKdvY+
	E5NaqqCoTLE9eq9c2a1X2gTve65h6WLOvpH5uQCC7IzDplRxp2O/Yv1NSRs+y0M62A8UEQ5kbe+p/
	Zz6KYevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6fb-0000000FA9J-2Gy9;
	Tue, 07 Jul 2026 14:21:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6fX-0000000FA22-3qRr;
	Tue, 07 Jul 2026 14:21:05 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSiPl1Eq7KKLTt1UhXrTqQ8J4cUQVL1d4HGOdMyYuAc=;
	b=KoqnnWDYriVnLVKyqkUochigyRZyRl6l2pIZXLeCoOLkfvevikCUcDxocUxTXxehP8SLq0
	Vsi0g3mR12CIjEKf9iegZg8Nlzs8BlZiAGnzniE/42z+edYaVX04uIrH36J0/jCPasCVxA
	aQAXOJ/WAvAk+SUMnHiv3gUbaAnPh4VyMPOmRx3NCW9sqVYvF7yuTz5E944Xdo7HHEKbWV
	oV1BoJPuU9Pd1GBvTUYgKDwrnCS+lA8qYR5qIADqFpGKCrkpNPzqFM1hUnV08197MBh7yf
	JDp4clwazTfpYJpL3DyPdJ9ccbFAN/AL2IeyRm+8g7sdeSL+kGgU7WMrdyEv7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSiPl1Eq7KKLTt1UhXrTqQ8J4cUQVL1d4HGOdMyYuAc=;
	b=fLrawpu5RqEtvPl6CudGrPFKaLkjW0/svjdeqWNeOza0GBfETd43MuS9q9F4l1douvVte0
	dl0cz+Ex3B8DUKCw==
Date: Tue, 07 Jul 2026 16:20:56 +0200
Subject: [PATCH v3 3/4] firmware: raspberrypi: Add reboot mode support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-rpi-tryboot-v3-3-fda82fe7ed76@linutronix.de>
References: <20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de>
In-Reply-To: <20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783434058; l=5567;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7PR0tE664SrEKUrrvEpFf3dr9BxOTxo3gbfyZ5sTqwU=;
 b=MT/Ma0PiUvoiYpZQgijB10dKUK3tdwdzjH1RtEkxv6juq7TylsL5qVOBu3ANvlzeQ5rQG4jas
 zMsJa7tdxgaAQNbyWEp1kBbkj2xC9Dto3taAEaU4T5AvHoWJvCcriWg
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_072104_145711_DB8732C3 
X-CRM114-Status: GOOD (  20.52  )
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

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This can be used to create a A/B update scheme.

To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
message must be sent to the firmware. Add support for this by
registering a reboot mode driver.

Furthermore, safely registering the reboot mode requires adjusting the
teardown sequence. Replace the manually called rpi_firmware_put() with a
devres-managed called (devm_add_action_or_reset). Without this, the
cleanup function of devm_reboot_mode_register() would trigger a
use-after-free error by attempting to access the firmware context after
it had already been freed by rpi_firmware_remove().

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/Kconfig                   |  2 ++
 drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
 include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d84838..34605bf7c9734 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -115,6 +115,8 @@ config ISCSI_IBFT
 config RASPBERRYPI_FIRMWARE
 	tristate "Raspberry Pi Firmware Driver"
 	depends on BCM2835_MBOX
+	select POWER_RESET
+	select REBOOT_MODE
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e73..2a0c40b8052e5 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reboot-mode.h>
 #include <linux/slab.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -29,6 +30,7 @@ struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
+	struct reboot_mode_driver reboot_mode;
 	u32 enabled;
 
 	struct kref consumers;
@@ -273,10 +275,37 @@ static void devm_rpi_firmware_put(void *data)
 	rpi_firmware_put(fw);
 }
 
+static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *reboot,
+					  unsigned int magic)
+{
+	struct rpi_firmware *fw = container_of(reboot, struct rpi_firmware,
+					       reboot_mode);
+	__le32 fw_magic = cpu_to_le32(magic);
+
+	if (!magic)
+		return 0;
+
+	return rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
+				     &fw_magic, sizeof(fw_magic));
+}
+
+static void rpi_register_reboot_mode(struct device *dev, struct rpi_firmware *fw)
+{
+	int ret;
+
+	fw->reboot_mode.dev = dev;
+	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
+	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
+	if (ret)
+		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
+
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -292,7 +321,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
-		int ret = PTR_ERR(fw->chan);
+		ret = PTR_ERR(fw->chan);
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}
@@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fw);
 
+	ret = devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
+	if (ret)
+		return ret;
+
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_reboot_mode(dev, fw);
 
 	return 0;
 }
@@ -321,14 +355,10 @@ static void rpi_firmware_shutdown(struct platform_device *pdev)
 
 static void rpi_firmware_remove(struct platform_device *pdev)
 {
-	struct rpi_firmware *fw = platform_get_drvdata(pdev);
-
 	platform_device_unregister(rpi_hwmon);
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
-
-	rpi_firmware_put(fw);
 }
 
 static const struct of_device_id rpi_firmware_of_match[] = {
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 66cc5a426c3c5..f905bff0fb3ea 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
@@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_SET_SDHOST_CLOCK =                       0x00038042,
 	RPI_FIRMWARE_SET_GPIO_CONFIG =                        0x00038043,
 	RPI_FIRMWARE_SET_PERIPH_REG =                         0x00038045,
+	RPI_FIRMWARE_SET_REBOOT_FLAGS =                       0x00038064,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,

-- 
2.47.3


