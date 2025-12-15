Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB0CD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX4l83PZei/eA8H23B1WzGR4a5PAckpfpztaLgsdyrA=; b=duKCuS7laoVjpdzNHcfmUO3NAu
	c72jWwcSGC9QLu/iGlgFgnc+onxVBeMHAk9ZTjvR5Vp3OH5Wqw/OghIF96kYPXVz7C4u0fSVB4diU
	NQK1ytkk1aW/zF5GaBGlJKOvZeCvTtAI5HqmthvROSyNkhb+5d/d73u4alhhEtr3rdHytyB3U4Toz
	1TbcYWlQO2wJ1oN06X7s8zjUvv151JSYeq3RGWd02VyTIWOEntWB+UNcXOihLWHvn4nEfhLId+U2e
	vpuqxGFFrnF6EP2ovz/H6N7YyJlAPMOV0xZaytkFgMJXa8PPIgNIJQVJk/LZdSZ8BsVz8tPOEjWXY
	hlN4bf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52b-00000003Nf9-0Lcj;
	Mon, 15 Dec 2025 09:38:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52X-00000003Nce-3SND
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:38:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2984dfae043so28936385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791529; x=1766396329; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX4l83PZei/eA8H23B1WzGR4a5PAckpfpztaLgsdyrA=;
        b=TOgb7qEfbOkBeMvmnz2Oen0Kl88HAWlbeUFGpB30vtKdjZkckXfdo5XTNtvOgwZzX3
         YJNeSVprHIpCNMKD7OBpShA1ulRvC3eekQ8m7jDWeNXwB3eFeSzKgMUSnzpmBQgtVmPf
         lzcC2OeDo8I6np+lWJHsDziFA00hj8bgxd/LbElKDzAkNKF4zv+QGCoY4mUGaEnUa5Xg
         LPvOmBXew8723AZ+kBBdsndxrlF0vchld4NK6c9T3/9lx9mC7fQFMz9m3A76BClU6BrQ
         rQwLZ6dgjGmzQP+Ov1oWPS8gvmx9skZNcrpBZKfVX6Gb9Q++ZuQLVAJ0GGKhTGXlJo4o
         By0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791529; x=1766396329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MX4l83PZei/eA8H23B1WzGR4a5PAckpfpztaLgsdyrA=;
        b=q3DrdR52oMtXbLY+EhsFau7VXgpR65KJPBU8g7E/9/rhO64sVLX3FJS7zXaXTUaMiW
         TmyugKOp28jibIokmDBYqTh4/JbkrN2IB4YwfzOA636IXIi0XrCr9i9zt6SNiom+xs/N
         F5mJnHj98ffPeTBlHcDOCTKlOgPy7iNYSlw6eiC8FnPmrgPothIlLhw10WgKrfFmfUUZ
         PmeFLFzGjD3xs/X17l7HzW6aFtrl3LX5UMtP7VzBrvx4Df6y28gCKAZFcBL9XupTJNn0
         m8uJrwaE1+2rZh/VoslODAZIFcekHMPnfO+fPs+J/eDOFZcayLi9ykknSQuZx6+TjlJ9
         4mLg==
X-Forwarded-Encrypted: i=1; AJvYcCXnhaozq+GWNAS1H3pR+BXcgMutgAQDx8Dlqv9vfasMChNhLR32B2QJweyqC7pglMpR5GkuteMBetkS0nQ++li/@lists.infradead.org
X-Gm-Message-State: AOJu0YxYUn4niNwXx56nCh0vHBuob2qmDK3B166wfRAukazi4ShDPko3
	5mfpy//glDegq/kHXtX4bkhnLN9ZBqBhS6rN8+rGcUCLnuX9W7clteZK
X-Gm-Gg: AY/fxX6YzuRNH1M63SCXL+ddITgf2fYxg592TNI2QisyoQTgA8sOZC64tu8Ot/sLhky
	oBfn2UdmYzzJ3wN9nNWj+xFMF0q/sidOGXhgqrtEtEEehzdRuqJGD9SqDcpR13WSCBJm3qprnbU
	YIlL1RymDaQVjeOP+BZJQuBw7N4C7+oW20dameHT3CAAs6TeDe+BKIOEwlDZXFhYGXQzzNCWtZj
	sg/qQ8DArlKoE3ZAZkpuSt6oDo4Db4fbTqjbvPu3C1omw7xtcX0WMmzU9iGg4wlLx3Pv00p0HE+
	5PDZfysXSWQhi4MqTR86Y7SMxXwDxLQ7C+X4x0EmJ3M+wyzoQZ6AClgknlzD1hKoIDC7LhIbfrf
	8s+p6KDkf2UGkM8ucaUGBbeJeIkq+vITNnOCGIVGVzk0vEa/K8iUFqjZLdLe35WRrpZRKB7Vw7d
	z+meVJ8SRAnT4cZxTYAGqojeTiu+lHkR6VIVSNoIJANTxPAsE9OrPbF4Mq0oNvlU7W/snG9ZajF
	JJWIm/8oiAuDGnxu41OOd6r7kugd2eCA0CjjQRdusSSSvJkJtA+uj1+SFfTAuz2Cva50zvkWa6Q
	7JRGQ46GbWoBVqjSS8lWAGKAbJLu8cw5Pggv7KlrETuKnVFrx08Jt5f9VxYiSw==
X-Google-Smtp-Source: AGHT+IEGJ44+51Fi+YdUwyKv9dsSN+8JmzAkupuBnmxY9duLk9j4SAUpGagR8Wr9Xf65hMIh2opKeg==
X-Received: by 2002:a17:902:e784:b0:295:6c26:933b with SMTP id d9443c01a7336-29f23dd1fd2mr76096885ad.1.1765791528782;
        Mon, 15 Dec 2025 01:38:48 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:48 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:48 +1000
Subject: [PATCH v6 4/7] input: macsmc-input: New driver to handle the Apple
 Mac SMC buttons/lid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-4-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9128;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lS/4q39E8TljfGLFH7Nskm9ro5EkQw4hj2XcyHKJZLk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215mrpy8p3nlB5ZD90yrBuRZBLrWFR2a/lzUWjYmoi
 mnw3N/dMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx1jHSMGLk4BmGqjvQx/ZQP2h/89rBe/+7vGt6M9ATL70h0fdSodumMVxZJ/J57nGSPD+fMTtvU
 XTRS/uiFxg83h3Z9kX39pC41S+MVrcz54U68CFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013849_911597_B241B603 
X-CRM114-Status: GOOD (  29.44  )
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

From: Hector Martin <marcan@marcan.st>

This driver implements power button and lid switch support for Apple Mac
devices using SMC controllers driven by the macsmc driver.

In addition to basic input support, this also responds to the final
shutdown warning (when the power button is held down long enough) by
doing an emergency kernel poweroff. This allows the NVMe controller to
be cleanly shut down, which prevents data loss for in-cache data.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/input/misc/Kconfig        |  11 ++
 drivers/input/misc/Makefile       |   1 +
 drivers/input/misc/macsmc-input.c | 207 +++++++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f160eb6762e..7f2160a18da2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2492,6 +2492,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-input.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 94a753fcb64f..0e805c870e29 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -1003,4 +1003,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-input.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 415fc4e2918b..174031304975 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
 obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
new file mode 100644
index 000000000000..f4598e65fc80
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes certain events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+
+/**
+ * struct macsmc_input
+ * @dev: Underlying struct device for the input sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_input {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct input_dev *input;
+	struct notifier_block nb;
+	bool wakeup_mode;
+};
+
+#define SMC_EV_BTN 0x7201
+#define SMC_EV_LID 0x7203
+
+#define BTN_POWER		0x01 /* power button on e.g. Mac Mini chasis pressed */
+#define BTN_TOUCHID		0x06 /* combined TouchID / power button on MacBooks pressed */
+#define BTN_POWER_HELD_SHORT	0xfe /* power button briefly held down */
+#define BTN_POWER_HELD_LONG	0x00 /* power button held down; sent just before forced poweroff */
+
+static void macsmc_input_event_button(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && state));
+
+		/* Suppress KEY_POWER event to prevent immediate shutdown on wake */
+		if (smcin->wakeup_mode)
+			return;
+
+		input_report_key(smcin->input, KEY_POWER, state);
+		input_sync(smcin->input);
+		break;
+	case BTN_POWER_HELD_SHORT: /* power button held down; ignore */
+		break;
+	case BTN_POWER_HELD_LONG:
+		/*
+		 * If we get here the power button has been held down for a while and
+		 * we have about 4 seconds before forced power-off is triggered by SMC.
+		 * Try to do an emergency shutdown to make sure the NVMe cache is
+		 * flushed. macOS actually does this by panicing (!)...
+		 */
+		if (state) {
+			dev_crit(smcin->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smcin->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_input_event_lid(struct macsmc_input *smcin, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	pm_wakeup_dev_event(smcin->dev, 0, (smcin->wakeup_mode && !lid_state));
+	input_report_switch(smcin->input, SW_LID, lid_state);
+	input_sync(smcin->input);
+}
+
+static int macsmc_input_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_input *smcin = container_of(nb, struct macsmc_input, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_input_event_button(smcin, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_input_event_lid(smcin, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_input_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_input *smcin;
+	bool have_lid, have_power;
+	int error;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smcin = devm_kzalloc(&pdev->dev, sizeof(*smcin), GFP_KERNEL);
+	if (!smcin)
+		return -ENOMEM;
+
+	smcin->dev = &pdev->dev;
+	smcin->smc = smc;
+	platform_set_drvdata(pdev, smcin);
+
+	smcin->input = devm_input_allocate_device(&pdev->dev);
+	if (!smcin->input)
+		return -ENOMEM;
+
+	smcin->input->phys = "macsmc-input (0)";
+	smcin->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smcin->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smcin->input, EV_KEY, KEY_POWER);
+
+	if (have_lid) {
+		u8 val;
+
+		error = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smcin->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		error = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (error < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smcin->input, KEY_POWER, val & 1);
+	}
+
+	error = input_register_device(smcin->input);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", error);
+		return error;
+	}
+
+	input_sync(smcin->input);
+
+	smcin->nb.notifier_call = macsmc_input_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smcin->nb);
+
+	device_init_wakeup(&pdev->dev, true);
+
+	return 0;
+}
+
+static int macsmc_input_pm_prepare(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_input_pm_complete(struct device *dev)
+{
+	struct macsmc_input *smcin = dev_get_drvdata(dev);
+
+	smcin->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_input_pm_ops = {
+	.prepare = macsmc_input_pm_prepare,
+	.complete = macsmc_input_pm_complete,
+};
+
+static struct platform_driver macsmc_input_driver = {
+	.driver = {
+		.name = "macsmc-input",
+		.pm = &macsmc_input_pm_ops,
+	},
+	.probe = macsmc_input_probe,
+};
+module_platform_driver(macsmc_input_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC input driver");
+MODULE_ALIAS("platform:macsmc-input");

-- 
2.52.0


