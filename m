Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=; b=glXhrDyTQmM+mSaEJXokPGje/a
	vKd0YVvcaInbIUb8tM/KDSTw9PMcV7TTSjeA1uXgOhp4KTj/2XjdpFvp/G9Lr/5RHz7Tjbtd2tv2p
	7/g3QWpwghvV1+U0pGSdOspejlV0YAsaQErqW2WcUTbEG5RyvtF/h9z74vs8fMry4SO3/eub+RfBe
	RslviWSBzmayl41yjzKBprpNGbAArNh0PvISH0fmRiOPRUpghacIIqNMM6vz1bsueFe+8+9J4UN9k
	zeuX7xGYYkiH89xZLh+4BgVnWos9XVKq4698wwqLLUGtB2jJ/Z3SjgJIu0qehxJYrD1Z/PwLq3yi8
	AHxObceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL3Z-0000000EjXP-3eDl;
	Wed, 11 Dec 2024 11:39:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL0H-0000000EiwK-0BN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:35:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21670dce0a7so22199705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916940; x=1734521740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=juYxJ6kFpPHuJznoumjU1ti2xvUTrrBFuNty2pnlONKvoHgT9QWSp0OmbNb0BDWhb3
         x03mJZu5XO/4NlEY9GZ13eJsp1bXILnrTWAojAryKWonB6fdjP9qqlF5R9/XT5s2/3QO
         MfD96bFcY5ZtPagKkxfI15NYto3CizvE3wkXZnmthoF9oRbSV/Yex2q/QvLmqlLRoy+y
         pu/2AzQCrG7FB/ACcR8tOK9agHCjxzC1ZmBc5Q7Ya+/2Y8Dvde14wVHBzVCluRrwn3pO
         2/ITJwdYs8mzduLDjQLsRNN2KsJHsLDKjcK2P1aHAX/EjifSxoj7sxKFPeBf3xPxNUj0
         MaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916940; x=1734521740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
        b=ppdtt4t8kHFNuPvB5+89McZ9+kbn+MSrvbDuQkHpB9O+ke5HtPlU1KkChchuYrBocQ
         vIzbd6ox5SqCoDtUsVUtHoUnwEZpGoRt0EONKc8sJxAOBzYKpxvU1oQl5e89UIhl0qHu
         xhIp0FO1w5WCDqWNdnJZd0jo3lqY1OGEs73Az95EOUUzkuKqL0eAyacYiVAz6mI9TQOy
         GU+FiYPwL1tpt1kH0oAaHUbdFs+mzTJ7zdWAPbhNruDvJJbvzkOlx2eQwNe6o4NUJzmi
         PowE7EDL5f/zce9+qpr3l5f5O+q5RoeWTwXB+yBnQ9YBtZhVKsl+Qy/p4wQG4DpD00+1
         psvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfZ1LSAP1Xa6mQpmuIU40KwjpBzLC2B1+o6jpNXTTREX4zZsUoxTQrcORuAb37iDK2bsSWQVUOdEsOUBE2knV6@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ8mfxYo+dCrjU78l8TeXJIDk/x81tSa0UmFQ0dLbUGX9otlMr
	fMCRUBEyEa6T4Jqzhoizc8uyAxUwPTgac94ArQlUMGqZu1y5RPGd
X-Gm-Gg: ASbGncsvzEZvUX/r2kEQyPEEXh59CMr6X00V76etV4NoZVQ4qE0zniJYHJ/Mgsto2y8
	AIZGiiq1IHlBzGt8seHTFLtNK5ErYyXegw6dfmGjEIT+FCRdXTuRICyRiKRF0FXf8UBKhOJ2MUh
	8m98y09PMCSb5MSiHyRLRVl14hcqDS+E9NVWYzX6PMr5z+oQNG1stUMw55q0/LaLfaBoscpjhwA
	pYdoE/sdW3UoEKt4zRYvfr3/BUpQlRAiuLZa2T9lLG6bCTHi6sPukNWYntHMW7K8NdOeQ==
X-Google-Smtp-Source: AGHT+IEvwlSiJ/A/e/bX+VxNlELH+lImFhyckJUBzQs/9yPJZMVZ9VQiinmNaf4t+2eVGwvQVdZbIA==
X-Received: by 2002:a17:902:f646:b0:212:615f:c1 with SMTP id d9443c01a7336-21778534ccamr43159815ad.14.1733916940321;
        Wed, 11 Dec 2024 03:35:40 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:38 +0800
Message-ID: <20241211113512.19009-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_033541_094631_2E2384F7 
X-CRM114-Status: GOOD (  24.16  )
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

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Although there is an existing apple_bl driver, it is for backlight
controllers on Intel Macs attached via PCI, which is completely different
from the Samsung-derived DWI block.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..debb1326df63 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..45cc80d9ae22 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..59e5cad0fbd8
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.47.1


