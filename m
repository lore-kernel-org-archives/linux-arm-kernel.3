Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ABACD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV2K3H+KHYzHX7vRsSVamrYLgjqDH6WEHqL+iSyUBeA=; b=hLB1xyg5oGYVS9OoEm1z7KeYXH
	ayf8VznQ25TnxcUjsl9Cf7OeqJxtNHldR5pwFt1w2OdRpcN4Tgo6PWn+puOsTyRENhoYmEAfQ8X9g
	nTf5fAagIclghiLfgse5fpcCc7jj662Y9JMCAGJfF2KLHgYieMqajaRMD5VEfQ0Ev3FqdUsTLYACt
	yJP9WSNDWu8YeXmKqZeVx3uYZa6bVAPk1o6AcqChNlUrV7XcF785fPA1psIYpeK5w/6Y7ihL0KRlZ
	c1d9j+aeBiinrcAx23iAKRUTZ9g0OIk9Snpsp2TnZMg6PqGT/c46vhcxAhJdXhga1sShWTGblZeaa
	3M1F23dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRzG-0000000BI85-0XJN;
	Fri, 22 May 2026 15:40:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyv-0000000BHsV-31XJ;
	Fri, 22 May 2026 15:40:15 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV2K3H+KHYzHX7vRsSVamrYLgjqDH6WEHqL+iSyUBeA=;
	b=Hb6j78efjk+fp1odwvNXm105cPdySDNPqtLWfwX9WTvWwLSMkNBJFKHyU7CTjX3RpyjP2f
	d32smxclp4yORZpSqrTDBz2W4c8dAd5HevAl5q8M2qXZgYCgv6+0ht2l2MfkBlIawOs4RO
	v5mJ1kMFTVxeqvji6sBnpscC79IUbXh/DvlOMASh/lxP5Z7UxMQSDPbwCLKc81KK5jliO0
	/GIBWm/rKaTJJEcQWKYnlhpNdvpJb+OrzPO+G9t6GXQFV/g7LByRJ0M68DpeV6NEYx2zYV
	ZkouukuXaBJC0rGE+6TiF0sBdlszKckSnANuob1KWlcAgGU9mtPwyQWg0QdZiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PV2K3H+KHYzHX7vRsSVamrYLgjqDH6WEHqL+iSyUBeA=;
	b=9cDL0XAwCBqzqo+hZvLkW3+0mzgtzxbE4mA6bl5boFdmsTILTRvG2Wi8kvtkv6p6Ladpu5
	1SDRl4Hv+SBJuzAA==
Date: Fri, 22 May 2026 17:40:05 +0200
Subject: [PATCH v6 05/10] firmware: raspberrypi: register nvmem driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-rpi-otp-driver-v6-5-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
In-Reply-To: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=4313;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=cDB1Q3lXgbhR8mOX9hP2JfVt3BP7PAd4G8RBXXHWMEo=;
 b=G8dF5TkzpGGCAUTiBXooG8d+qzy09x4lhaUQtvqu7xCAOaovA+PzkhbmktebNq7TpdblPkG0y
 FpEQFMFCQelCyTc9JXqyNKV1p5Mbiga1nVxd69FUvbfV//69O84nPs5
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084013_947539_9A788AE2 
X-CRM114-Status: GOOD (  14.92  )
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

The Raspberry Pi firmware exposes two regions with otp registers. The
first region called "customer otp" is available on all Raspberry Pi
models. The second is only available on the Raspberry Pi 5 (bcm2712).

Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/raspberrypi.c             | 59 +++++++++++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |  5 +++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e73..1d3b8c190b2fd 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -24,12 +24,15 @@
 
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
+static struct platform_device *rpi_otp_customer;
+static struct platform_device *rpi_otp_private;
 
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
 	struct completion c;
 	u32 enabled;
+	enum rpi_firmware_soc soc;
 
 	struct kref consumers;
 };
@@ -231,6 +234,47 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+static const struct rpi_otp_driver_data rpi_otp_customer_data = {
+	.name = "rpi-otp-customer",
+	.read_tag = RPI_FIRMWARE_GET_CUSTOMER_OTP,
+	.write_tag = RPI_FIRMWARE_SET_CUSTOMER_OTP,
+	.size = 32,
+	.root_only = false,
+};
+
+static const struct rpi_otp_driver_data rpi_otp_private_data = {
+	.name = "rpi-otp-private",
+	.read_tag = RPI_FIRMWARE_GET_PRIVATE_OTP,
+	.write_tag = RPI_FIRMWARE_SET_PRIVATE_OTP,
+	.size = 32,
+	.root_only = true,
+};
+
+static void rpi_register_otp_driver(struct device *dev)
+{
+	struct rpi_firmware *fw = dev_get_drvdata(dev);
+
+	rpi_otp_customer = platform_device_register_data(dev, "raspberrypi-otp",
+							 PLATFORM_DEVID_AUTO,
+							 &rpi_otp_customer_data,
+							 sizeof(rpi_otp_customer_data));
+
+	if (IS_ERR(rpi_otp_customer))
+		dev_err(dev, "Failed to register customer OTP device: %pe\n",
+			rpi_otp_customer);
+
+	if (fw->soc == RPI_FIRMWARE_SOC_BCM2712) {
+		rpi_otp_private = platform_device_register_data(dev, "raspberrypi-otp",
+								PLATFORM_DEVID_AUTO,
+								&rpi_otp_private_data,
+								sizeof(rpi_otp_private_data));
+
+		if (IS_ERR(rpi_otp_private))
+			dev_err(dev, "Failed to register private OTP device: %pe\n",
+				rpi_otp_private);
+	}
+}
+
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
 {
 	struct rpi_firmware_clk_rate_request msg =
@@ -299,12 +343,14 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	init_completion(&fw->c);
 	kref_init(&fw->consumers);
+	fw->soc = (uintptr_t)device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev);
+	rpi_register_otp_driver(dev);
 
 	return 0;
 }
@@ -327,12 +373,23 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	rpi_hwmon = NULL;
 	platform_device_unregister(rpi_clk);
 	rpi_clk = NULL;
+	platform_device_unregister(rpi_otp_customer);
+	rpi_otp_customer = NULL;
+	platform_device_unregister(rpi_otp_private);
+	rpi_otp_private = NULL;
 
 	rpi_firmware_put(fw);
 }
 
 static const struct of_device_id rpi_firmware_of_match[] = {
-	{ .compatible = "raspberrypi,bcm2835-firmware", },
+	{
+		.compatible = "raspberrypi,bcm2835-firmware",
+		.data = (void *)RPI_FIRMWARE_SOC_BCM2835,
+	},
+	{
+		.compatible = "raspberrypi,bcm2712-firmware",
+		.data = (void *)RPI_FIRMWARE_SOC_BCM2712,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rpi_firmware_of_match);
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 1e5e5f7e378d0..a4c94b85b7aa9 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -9,6 +9,11 @@
 #include <linux/types.h>
 #include <linux/of_device.h>
 
+enum rpi_firmware_soc {
+	RPI_FIRMWARE_SOC_BCM2835,
+	RPI_FIRMWARE_SOC_BCM2712,
+};
+
 struct rpi_firmware;
 
 enum rpi_firmware_property_status {

-- 
2.47.3


