Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jbni90ydB4IruupdlOayfvTBYH/WF8pKT326sjNamOY=; b=w4NRE0UVTuYsfr+260Mx+VCrEv
	aSw83dTBFKbrR3kBk1ddN3v4XayaGo8FDJ3xNhuE+lhktUuX1Le6rXwu9oZ/cSr3/MnvtBszOiIXI
	r8DHh0tez8YIroH526DgRFC6t5Ttv5fY1cYJUsVTI+Dpr9vxdWCXLXUnH0hiiilC1H9LfTmomrSlm
	WknIP20RvLh1G0+st2bmHZNjdUG6yrt7AtIeX8+tEzRV1fZmEqEn+zI9ew0DtTLawb6hL0jQ3M02d
	ZSAuSj5mMLGQOLP2+Z0+nSINRCi9ZJDicj3Wez9tRPjsoWoonYFbWiClQ9oLw2nTN7LnfHq81ypF4
	L/Gw3sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6a-0000000Aj89-3LI5;
	Sat, 25 Oct 2025 00:26:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6W-0000000Aj2b-0DH9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2697899a202so27688175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351955; x=1761956755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jbni90ydB4IruupdlOayfvTBYH/WF8pKT326sjNamOY=;
        b=REsy4BEanNNt4vEFZxZiuqJ9r/4Ecy+avNkbZV7Ju42+gWFsFs37w/1bmQsk16e46H
         ilpNrzopvQXxR2kXGoIuL6yARGGtg6NR2//zNBxsQgUsK7O26mzJDrTwOrMEIQMAXKJM
         IWrbFIc46EiPcHva3COAh2xeaLO1raeiz8tLEsmxc7VG8BOM5UdSGEd290aBPIaYx9rN
         s3gHDxKCU3P7DibsE2RjGL/2ROKwuLK8udGWUEZgxHqz/4Hi58ie/MS9311lYmL4yr+c
         tCGo6RExShNjxeawNaELOQtmJIuUIKxnjPixND1IirND18ZPBUr2Eu/Cgpi/2PKQvupH
         +2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351955; x=1761956755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jbni90ydB4IruupdlOayfvTBYH/WF8pKT326sjNamOY=;
        b=Z1MmlFRYRK2fhM5Fp0dCFPMN5YMiOg21rrho0HTHcwPzfuj59ZTMHIF6eYVWPn5kjA
         IEmYYen40Ng93WuCBgUDKgYytYufB0FPl5B2vgECPBov/Ae+oo+QIUYkgn0U3OwhkZSD
         eHbhQ3GVYCVQMMOyHRP7CjuURIDSexeLIp6uqukgP2iADZIIkvGlIWKQbIJbzIXgTWTA
         GLputezm0DMHJLCHuIkL4TR4MAli9bEPz8fbq/tBABqvnNt9T/KU/0LBAjSTZYbt5lQk
         CwcTXnE+YfvRvLJhb4AOn+lyOwoK51e1RCEQUWmrHl8NuXzHzHaOQmjURcIzJuPrvBYF
         FfLA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYFmILSVk8Nd/zti7/cp6suHHYrVftFyLtElLabwSVwOPc5H5TtyWlwNxnAf6+/X24HN8BxbwqDf6MJKYdnoP@lists.infradead.org
X-Gm-Message-State: AOJu0YxwFjp8lMB141d6ZJWUG3UVuO5JpZSxkwyelNf2RpN51J8uRKmg
	Cq7q7hpdCz7+LdYHyFTw95FtYtrc4MOKwIctD8mYRTgj4BHeRM/SCA+a
X-Gm-Gg: ASbGncu0SK3hcwcDfOiVyBAV+IlI9NyZzbnqbpo2IpbLV8ALENl9kKLFy/3DblyJoDM
	NzpSWpzu1TDaudT/VcSOwo7evSmi/M0dlQqYlegPnFmQVKEUNaPd9uUh7+sTHUcLzCzXmvVDOIH
	IOf2olTpYlAyWr24P3Gy+aLlAcSrNlNXHGzV6fG9aEvutv7zzkCKZup6QJEfliVyMaDeAUPSsyz
	RCieYDDYwsff3sr66+p/bq+HlnqFjdVwCpMWjzy00KBvH6yr2SeQlZ8IDmC4t/pW8aH0Us/9ZmN
	gXBROMreBTxBmlj8uSJsUawOt32/GJ484T02T3BNWdHBYkeCoN68znvNY6CUPLw4UMZDdtsTJpc
	SLQrwOyMRVgD1nJlAIHA7Ca8qCRz1N3n3wr68Lq8I3COsWEt2Z9zt3DXx8hUusTWPaGaRBTHK29
	0PMTLLlWBkqFppORPNBOgq/Bz1W5uftgzWaql8CQeun5Ek0PO0pXwScmu1is5l8vDST2yXkUqTY
	OhcE5tRaZejTVcWfSiov2w7Bho5XCdtJ6+FEwMF8lyvX73m/Fzmrm98jfl2Fy4F
X-Google-Smtp-Source: AGHT+IFPwqPsvtz1bsOUWAwwIaLr2lL/5o73zsh+qlU6l48owjh2dJ5ayQCBQIwjefBR+9GAkjlBfw==
X-Received: by 2002:a17:902:f705:b0:294:9132:75d2 with SMTP id d9443c01a7336-294913289fcmr29825465ad.25.1761351955121;
        Fri, 24 Oct 2025 17:25:55 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:39 +1000
Subject: [PATCH v4 08/11] input: macsmc-input: New driver to handle the
 Apple Mac SMC buttons/lid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-8-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9156;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=rPeCGfdEO5Pface1zsJfI5Bq+ssOoaIL0E4UGeysAXE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7Vsm/YljVRKbzuukhK8LVF+1NEFjaIP9ltdM3DY
 X1Rd65vx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKoPLWNk2M7MofIle/bUKA6+F7s+p19b2ta31tDgLJsei8Kj0JplDxj+2amFyl7
 ZofNfbDXjTO7EJ/dy5lk8VF7c09EQspMlbb0bEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172556_114181_F4F000AE 
X-CRM114-Status: GOOD (  28.88  )
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
index 0e6b49fb54bc..109660a1a5d2 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -981,4 +981,15 @@ config INPUT_STPMIC1_ONKEY
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
index 000000000000..d35322856526
--- /dev/null
+++ b/drivers/input/misc/macsmc-input.c
@@ -0,0 +1,208 @@
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
2.51.0


