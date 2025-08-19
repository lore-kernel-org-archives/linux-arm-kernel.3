Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5C4CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXRoXM3DvDAsJ4ioc/Y/G/EGKWE3my87dTILegnnEzc=; b=23u/L2gO9swF6QlUpYharWdMOP
	pS4C0oZWx7QvPOjR+TfrpiBYrHiDz7aPRjcwLRmetXuFw3MV1wMby0AZbm8fClTF9YANT2wP47aNT
	7LXao2gi1pXzj0BoK9/n8n+OLPIjp7Ddfx/bDAneFpkLN/tgZtdM8j/Q9FYA5VTa/YlltycjRNAo4
	o9pnGxCRdCvttc0oqO7XrW6qbPDJTesZ7E9pXcFNELSJYJlwy4gE/KL/ES0AJG1y8qdvCjskoH3B9
	98/IUpY5P/+qbb24jITo4GeUzV74L6BJohVBQKbjkSnEJI0UudG7SA10Y/AMhyiY2Ao20Io5VKdhX
	vtyaNODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNLJ-0000000Al3H-2CuU;
	Tue, 19 Aug 2025 14:29:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKpX-0000000AKqv-3bMX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e6cbb9956so1489117b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604123; x=1756208923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXRoXM3DvDAsJ4ioc/Y/G/EGKWE3my87dTILegnnEzc=;
        b=Edf+fIlnrm8EBzBFZ4hjh0+XYqhiV0JO/rh0ydMUe/pro3qsBULK9dKyWzpGBd4kRA
         PwV5lUNMO+ztjjtPLSP8cmxL0/fik9QDnEr+KeGmLLgMhc7OAJJO9+J4w2FKUYlTC+RP
         vtXe7H1upJgR4jIY9uSCPWX1gMCZ7kQ7wCjayLxthf3VoJCb9jRkOva9LaTvjMtCUC5F
         Gjdq0G8EEOLuCGadZYiN3RN1EXqjcgHP/tLYF/Lyw/32Y4av1vMka5+2KGw5j+m19Rtz
         csC2JtHK7I7Oxvwaukrg2+RDgr5aW5Y7DIvKu0qgZt+bIaL7bsua2DlboDKUNxb5PKy4
         XXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604123; x=1756208923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXRoXM3DvDAsJ4ioc/Y/G/EGKWE3my87dTILegnnEzc=;
        b=g8kG3LL3KkI4L6T6JXFVX1QpP4dOwedNGSAhXanVUOtwZv2KrufDwuhHtVzN1oEhZz
         +GV5mw6uWVXJNGb1poXcKz437Ulg9FLG1SFyR8GpDKW1zB0XL5iMnRgRCBevJqcucrQw
         +M3uT0scLdaGY4GA8vqLBPsUZOYe/Tx+oUrgMHOXNCJ+lpHip7sqE7tGWELjDMdC8E4J
         jB3UwjidAzzw55VJpG7/Z5jAEx3xDvAZwEMO43LPKhB3MNdzwJbCpViqn9Zes8LLqc8S
         i5G3UXNoxC/L7OgQLBy3U6FsMRpXUrYoZUtJ86q3BdoYc4McPtl0LRQ+o4IihoRZZgjz
         Sqtw==
X-Forwarded-Encrypted: i=1; AJvYcCVqzlT4tB49kD4k8U6BQuvX8IlzhRcPJ38b/xCVQTg0zxWQ3Hm4GQTjS+5eJ21bhDXoWxgMA+eixzwl306uOHQI@lists.infradead.org
X-Gm-Message-State: AOJu0YzImGnTQh+8lRUgFb4J/mRz7bOqjJco1o3UcXg/ENowD4sdh8sA
	gRrTsrCGnpytvIxWXZ6KYWya/V0pmwI1qHAaPozhK0UXThaUnRH2DqOD
X-Gm-Gg: ASbGnctlzexyClZ1f+qEd5PBqZP7jqDtehwTXwZP9ydd3PBg3IEyNX3hu2FpmUlmRV/
	gGKNSJ+loOP8nZzVwqnjYTWe2TGaXvq6fgt47L+RFkZHnW5nhvFW4fIWzUTcDi7/Yp8Ov2tKRKS
	twjeFD8cEWc4nPfY08g3M6sAxgOmEcEylIyWc451cnwz7qkQGkz+fJL7Lnc8rUb8CkMFhBXklGv
	pVQtdjGVNgzO9wp45gVLHFa/Eh+3iX50VCeRUWJT47N78teJUTBDCc1WvT6i/2CtimtLFAVh/p1
	M6KtP9W3iyFWAdQizv+k+PCKObb6c/O6efYaUBb6hT7uNhverZqI3I0rGv2RvVLk0ShniDAOSaO
	zuGhy4FLX7eWT3e6dVamviClNfT+yaavKNmcQhv3kWvZcmuLUZr4k7IHutG0w4YcpLe4yQSCm+e
	laJTsjhI3JdR1+FrQ=
X-Google-Smtp-Source: AGHT+IHNuaJ0iQlKsaqW/TpGaZtDz/UoIX9Qtn8OcFIfbGXQhTIKU1bXyqHLmLAOXfJrLMQXsEGaEQ==
X-Received: by 2002:a05:6a20:5483:b0:240:1c36:7979 with SMTP id adf61e73a8af0-2430d42cc7dmr2771195637.28.1755604123006;
        Tue, 19 Aug 2025 04:48:43 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:42 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:57 +1000
Subject: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple Mac
 SMC buttons/lid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9790;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ywfc4mmL8m8wZ4DdTYNSycoo5uhc8m+LjSm+qJ/8tn0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvJnlzfMFNCqmdL50kdKS2F5yNTMmsSzyg9a3GZO6
 tCXzzvWUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQsVjAytEffkpeetOjJ/7yG
 S/0n+pUyplTJGkmIqXUpWN+b/6ZkCsM/oyMSHw0euftH3HWOSPd13cGTERix8bfYsqiY/rpq9fd
 8AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044843_909636_2F8C7FA7 
X-CRM114-Status: GOOD (  30.33  )
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

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/input/misc/Kconfig      |  11 ++
 drivers/input/misc/Makefile     |   1 +
 drivers/input/misc/macsmc-hid.c | 210 +++++++++++++++++++++++++
 drivers/mfd/macsmc.c            |   1 +
 5 files changed, 224 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2eb23522654dd050262eb06e077587030cc335aa..b3b5220fcd0d4bbef67613c8ee9afa880c0aa45d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2412,6 +2412,7 @@ F:	drivers/hwmon/macsmc_hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-hid.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3d1230d7f40f99e0c2d360bbe80e8..a430c50e7f63f245bba56bd526026ec7901cf821 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -961,4 +961,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC_HID
+	tristate "Apple Mac SMC lid/buttons"
+	depends on MFD_MACSMC
+	help
+	  Say Y here if you want to use the input events delivered via the
+	  SMC controller on Apple Mac machines using the macsmc driver.
+	  This includes lid open/close and the power button.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called macsmc-hid.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index d468c8140b93da5bb537e8a3baea2b90e7bb4229..95b8ebbb9ebbe6f3afc9db724d2ebeba1d75d1a6 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_HID)		+= macsmc-hid.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
 obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
diff --git a/drivers/input/misc/macsmc-hid.c b/drivers/input/misc/macsmc-hid.c
new file mode 100644
index 0000000000000000000000000000000000000000..cdeef6c4797f82f464e3a6a760dbaaf186e1c58d
--- /dev/null
+++ b/drivers/input/misc/macsmc-hid.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC input event driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver exposes HID events from the SMC as an input device.
+ * This includes the lid open/close and power button notifications.
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+
+
+/**
+ * struct macsmc_hid
+ * @dev: Underlying struct device for the HID sub-device
+ * @smc: Pointer to apple_smc struct of the mfd parent
+ * @input: Allocated input_dev; devres managed
+ * @nb: Notifier block used for incoming events from SMC (e.g. button pressed down)
+ * @wakeup_mode: Set to true when system is suspended and power button events should wake it
+ */
+struct macsmc_hid {
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
+static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 button = (event >> 8) & 0xff;
+	u8 state = !!(event & 0xff);
+
+	switch (button) {
+	case BTN_POWER:
+	case BTN_TOUCHID:
+		if (smchid->wakeup_mode) {
+			if (state)
+				pm_wakeup_hard_event(smchid->dev);
+		} else {
+			input_report_key(smchid->input, KEY_POWER, state);
+			input_sync(smchid->input);
+		}
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
+			dev_crit(smchid->dev, "Triggering forced shutdown!\n");
+			if (kernel_can_power_off())
+				kernel_power_off();
+			else /* Missing macsmc-reboot driver? */
+				kernel_restart("SMC power button triggered restart");
+		}
+		break;
+	default:
+		dev_warn(smchid->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
+	}
+}
+
+static void macsmc_hid_event_lid(struct macsmc_hid *smchid, unsigned long event)
+{
+	u8 lid_state = !!((event >> 8) & 0xff);
+
+	if (smchid->wakeup_mode && !lid_state)
+		pm_wakeup_hard_event(smchid->dev);
+
+	input_report_switch(smchid->input, SW_LID, lid_state);
+	input_sync(smchid->input);
+}
+
+static int macsmc_hid_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_hid *smchid = container_of(nb, struct macsmc_hid, nb);
+	u16 type = event >> 16;
+
+	switch (type) {
+	case SMC_EV_BTN:
+		macsmc_hid_event_button(smchid, event);
+		return NOTIFY_OK;
+	case SMC_EV_LID:
+		macsmc_hid_event_lid(smchid, event);
+		return NOTIFY_OK;
+	default:
+		/* SMC event meant for another driver */
+		return NOTIFY_DONE;
+	}
+}
+
+static int macsmc_hid_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_hid *smchid;
+	bool have_lid, have_power;
+	int ret;
+
+	/* Bail early if this SMC neither supports power button nor lid events */
+	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
+	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
+	if (!have_lid && !have_power)
+		return -ENODEV;
+
+	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
+	if (!smchid)
+		return -ENOMEM;
+
+	smchid->dev = &pdev->dev;
+	smchid->smc = smc;
+	platform_set_drvdata(pdev, smchid);
+
+	smchid->input = devm_input_allocate_device(&pdev->dev);
+	if (!smchid->input)
+		return -ENOMEM;
+
+	smchid->input->phys = "macsmc-hid (0)";
+	smchid->input->name = "Apple SMC power/lid events";
+
+	if (have_lid)
+		input_set_capability(smchid->input, EV_SW, SW_LID);
+	if (have_power)
+		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
+
+	ret = input_register_device(smchid->input);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
+		return ret;
+	}
+
+	if (have_lid) {
+		u8 val;
+
+		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
+		else
+			input_report_switch(smchid->input, SW_LID, val);
+	}
+
+	if (have_power) {
+		u32 val;
+
+		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
+		if (ret < 0)
+			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
+		else
+			input_report_key(smchid->input, KEY_POWER, val & 1);
+	}
+
+	input_sync(smchid->input);
+
+	smchid->nb.notifier_call = macsmc_hid_event;
+	blocking_notifier_chain_register(&smc->event_handlers, &smchid->nb);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	return 0;
+}
+
+static int macsmc_hid_pm_prepare(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = true;
+	return 0;
+}
+
+static void macsmc_hid_pm_complete(struct device *dev)
+{
+	struct macsmc_hid *smchid = dev_get_drvdata(dev);
+
+	smchid->wakeup_mode = false;
+}
+
+static const struct dev_pm_ops macsmc_hid_pm_ops = {
+	.prepare = macsmc_hid_pm_prepare,
+	.complete = macsmc_hid_pm_complete,
+};
+
+static struct platform_driver macsmc_hid_driver = {
+	.driver = {
+		.name = "macsmc-hid",
+		.pm = &macsmc_hid_pm_ops,
+	},
+	.probe = macsmc_hid_probe,
+};
+module_platform_driver(macsmc_hid_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC HID driver");
+MODULE_ALIAS("platform:macsmc-hid");
diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index bc4adf2fcfdce6c5ecbc51ced0e5985cbd36f54d..6a5ac449e23ddda0ebe4980614c49fe6c3bae50d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-hid"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),

-- 
2.50.1


