Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igoCCgnZ/X1DMDEVudEaDJx1Zu4lUx4Hg3bpipB8g7I=; b=2uwNb+kkWi5nniG2K+f7Lvs/rp
	TZ6/livdIUcOgasJNJA+0+Vwv/1tcQHcmbITmYo3ObNqziDfO8nDurASY7Ps327cN41B0/z5+StNJ
	vtCqqs6POxwtAhHEkk32HI5G73PdaveMV+vJwTtqeWpaFDklSQzkGUh3NSwGxFO/OocsGvDZjYt78
	RiZjP5rXiS7D+/HC5lfLNg/qqtlpgPZN81S+Fw+MQs6BaI9NJkr4+d/VIl77ta1lu2tHEFCO//Xon
	gnWjnIp3JIjVVv/TxczjYmvLJQ0/5VDQW9kMXxKsNPHs02HnDxprOZUlp//j8wvZ8egAJQKAdExMz
	glph0nUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65i3-00000001rnD-2P5y;
	Tue, 07 Oct 2025 11:18:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65i0-00000001rkX-2WrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:18:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so6176057a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835900; x=1760440700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igoCCgnZ/X1DMDEVudEaDJx1Zu4lUx4Hg3bpipB8g7I=;
        b=G623IaIxpnpAYfSBWWqfQ3wPECx/X9wr8AEKzzIUj/9r1TbEPXRWE4yJReokTF4Y/i
         BhkzxcSd9hsAfoZ9GCGd2kIt/QuArbVBgy87xY7Zyd3j0It03jfC5TR5MRRitucJ6CGk
         UFoKMvfARX6xIGfTZLTaeiXCdsrA1jjJ+sj8Wl/gAI94CbtOfsI457HeyYB01EKkp+LW
         BQaZOYhHBkFuAXLvkWQmE83WFsCrNd8nt4FfoWU+OynjL23ddNYPNhk+OzsyxMwipfmP
         0Wgzv6hABXvrIHVZPbU0Mgv5yXxQqE8f4xUjhp4vYCR3jWrTY2oWpb1vnvAc9PSv5dPr
         ATEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835900; x=1760440700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igoCCgnZ/X1DMDEVudEaDJx1Zu4lUx4Hg3bpipB8g7I=;
        b=ACnibfM+zoMpGAFl08xMlytcTsRMZT49dR5zMblrg6CC5lsJDDHV0xykuQxE6OB9wf
         ST2/SWM0Eqa81kzMPENv2wNV7EDv0MqJtB36vOIZjtEHF8WCn2HbbzZo5dtcJE84bl88
         0Krzey2kGCgR1k+bmOF/RYgCOiifIoFqnXfNkabsgpuM7w31mJIfoJvFrhNi45dZV+0D
         X+4ig6n7yKNvP17SRuZSCKPdrjPecaFeM8xUo0A1A5Ov6yKpuCswKMKHMN/JLusFXwkH
         5rqiyHbyanpXA1e2zsrtT2AmAKNt7m5Yw861SeZSsQplZTkQstlXDKElDgBgk8ew/bMX
         bOug==
X-Forwarded-Encrypted: i=1; AJvYcCUc0KIMxS/pVriPNz6dUAtaHLSV1RYdESCSRS2d0Ih5/e23wr8M1Z45jawkvnLFeB57RFEUjl+Fv/bvs40AZ+If@lists.infradead.org
X-Gm-Message-State: AOJu0YybJeLNfWiiI5YTX2w8YOHMGq6uIT49+jDrdXFxW7iIow3lhKsj
	WUVHimdChcozKO17robNUKTZQZCcbkVhKCbwNFJi7XHdCe3hPvxbjZDz
X-Gm-Gg: ASbGnctfaVcTaAnb02DPwMZlaLcaIZp9Nb9QHMYz2e+EHJNdCvsYCf3bm4TkZkhUj+R
	1p+2HV/h8jQ+b+V+2yQd1MjAL6P46NABknrzlekpucTNX+0YAdC+g8FQRx2V92Bd3aGUxQ0O75M
	5io6bSSJ5h667XcGwsA1J5ZHCHfhB8uVrce/SU2aF6qFoUGeiogpQfw6ln98Ru9UypTCFbf/lNm
	Qs7ZjpUsx+R6Pdb/yd6dVq9aE+crzrS8Tn5xGltOMflOZir2x+G5Fsc+vcyqdbf8aAIvS52NUM6
	ywRI6S7IWs0xEYiX4+PX/KQouXQWI9koCNvTeNJuyPsqpkO3j27iNcyiSUqFpHF0nz55mKg9zuY
	xP5ykjdRE4b9FouTuO9L/2R2NOhslEBWeTcJl7SetjW8AMLY/4D2wdpnVGBK9S418L4RmHlyony
	PUmPaVpNrEMej8MMh0uHQ/R/PFB+NB3NEDr1utnDBSSw==
X-Google-Smtp-Source: AGHT+IFI5v34OHkG+BFkCWyO6dCr2DH0coMDDT0kpNcUl4tnkMlzQd9Njd2Uvgcn/+fuwyD7FqS6SQ==
X-Received: by 2002:a17:902:db0f:b0:267:af07:6528 with SMTP id d9443c01a7336-28e9a61a842mr185808585ad.35.1759835899767;
        Tue, 07 Oct 2025 04:18:19 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:49 +1000
Subject: [PATCH v3 08/13] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-8-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9033;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=N7YD7RNasaiUaTxPQY55v7KHLaj7T+3xfqua/vl4ebg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm372yWfIr7EStiIpe5H49ZohcOnFcKm7dF1KF64b
 MO8RU+/d5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRaRkM/5MmnX2leiyf03vj
 Zv/kkutl2Q0Buk+TZqXOVF25+8SaC9GMDGeM3tTP9JrH97y0SLSlJcJzfV3EEfbUA/a+8x9MV+J
 t4AQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041820_674195_A66B582E 
X-CRM114-Status: GOOD (  30.00  )
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
 drivers/input/misc/macsmc-input.c | 208 +++++++++++++++++++++++++
 4 files changed, 221 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79b9f40224a9..e8283f127f11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2451,6 +2451,7 @@ F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/misc/macsmc-input.c
 F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0e6b49fb54bc..5ab8a4729e0a 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -981,4 +981,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_MACSMC_INPUT
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
index ae857c24f48e..480a0d08d4ae 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
+obj-$(CONFIG_INPUT_MACSMC_INPUT)	+= macsmc-input.o
 obj-$(CONFIG_INPUT_MAX7360_ROTARY)	+= max7360-rotary.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
diff --git a/drivers/input/misc/macsmc-input.c b/drivers/input/misc/macsmc-input.c
new file mode 100644
index 000000000000..ebbc7dfc31f5
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,208 @@
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
+		if (smcin->wakeup_mode) {
+			if (state)
+				pm_wakeup_event(smcin->dev, 0);
+		} else {
+			input_report_key(smcin->input, KEY_POWER, state);
+			input_sync(smcin->input);
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
+	if (smcin->wakeup_mode && !lid_state)
+		pm_wakeup_event(smcin->dev, 0);
+
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
+	device_init_wakeup(&pdev->dev, 1);
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

-- 
2.51.0


