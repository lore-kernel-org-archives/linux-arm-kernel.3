Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ADCCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1C66At/iPHB+YbOfF0ahn3G5fgbhry39+iH3jn1wwY=; b=38cY+WaKxcKxOoJOQPS+KKkZNu
	Llv4GLmCHIi1Q9PiQFy+veVaC5T1Oi8NkAWenxrGfe3gveJ8TOu5ET2nu5ZfEdAVGkdw93jkbbvko
	TYK7vNM/W+Zi6DQDtRVJYBF44FXG6oGCLyv6H3OIx/IraS4WNcrRqqNRWEx15h6b1F37zwTnZ4Kv0
	etxeKZzjDz/H23K7z2FCDv5Z61yDTd5zR13m6MiNCBfzOAPjLPwGX7AGdrdO3DAi6y/frci0Dfkxj
	yn92T61qxmaUUHiiHrnqEuabY3kle+sbqTA2RBf51YXSXtJCQOeVXxGIBxWHDrm1VDa+tNy0tzlmh
	iBZEslBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2o-00000001NzV-2vQx;
	Sun, 14 Sep 2025 13:45:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2k-00000001Nwo-2HTs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:45:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3df35a67434so2025441f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857525; x=1758462325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1C66At/iPHB+YbOfF0ahn3G5fgbhry39+iH3jn1wwY=;
        b=YKBSLCeLpFJugnkrBpL3gmnz38jPU1cFq522uWcNC9b1E4J4rHqScP7tIbWcYsqqoz
         y5egLMuQ4QzhBOQR9t1Z/t6fzLsGbvlA/aAX7u4Txtl8zDcseTz/O2Tnp6LS1CrFc8gt
         pw8kDI12zxTAs/lprlh/Qn6XAhWIUMEmjbIiKxaRIsa3ddtVHFPVKWRJjeroVNpum1ou
         fHZNBI6Wq0XEjw7LP3BHMPk2clsYOIUifkFGZomjiujVHCTiIoNwug4slr5L6FJOubTT
         KdIMWRXZWU5aPJZ5owBtT3BuB6qqYdiwR8oHWk0lTWIt9kPRIM1l1SpFW0nnoN2ymlvl
         8TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857525; x=1758462325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1C66At/iPHB+YbOfF0ahn3G5fgbhry39+iH3jn1wwY=;
        b=An1nW4vIHLYUb2XY79VNTbmo3Thxi8SNMX/nyofVK2M21UBIakVTFX8oy3IFSJ/UVw
         9LOgCdgITmf3PvJSJz/iG/yYtcKXNSiiHFpenKXGgiBcgwqynEZPNbVZX+wQi6J3nTZW
         8UfSKHNfkyHDsKaD8oqS/gb9Q382Bm9JtOtl7EEk5jVgFDT+AXaz9Pgr4fWjN4+xrbiy
         5NUk6gZ6+fLDWF7+nF2Czn9W6f1qpSfDBtQQyBljbpenjIibUL3IoP+Da9CnfBii9IZW
         JPwwBH1kViUnrCmZcZlcz5wtP9H86yn4r9JDOr+F2rz2pNxcIjv+wnxduxYWHck4HyCU
         GQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9aI4q4J5I4CaaWNBHhETjHg6jiOeiKQ8XDhB0rLkdq3uspJeGRPDnPl0N1CM3kjQ/RWOLEPgRacVpLQF7RcI6@lists.infradead.org
X-Gm-Message-State: AOJu0YxjlfuzIS28dqAarYPL7lG86BYvKt3+4g5fvj2Ka/cA8XyM1tKy
	CKrePfMYvf86MFTmbuVqXars1jK15IYhBJ/Kf/jLojtwUC46A0M1cDGi
X-Gm-Gg: ASbGnctVKnUP4eMIh9wusUyC0S9vCnIIEPjXcABR/LJYorgTJbuL6hF7fSgnlLA+YLW
	XL6qipzLnbHL+jqI4ym+XbHGpJxuD6E097GYmCu2zz9CrL0XrMe1y1alN+bmbCSkOGe8UbpZAkb
	lTzZlcPmsjOPf4WyI9z1x2jkZlpRLpGu7kbV7UDCgbnbx7QMFrJoHytZ4CEqaePsEA77XRyP7lv
	6kL73grv1l3TmqOOLUtbwByILhrmhO1tZcc2JpXA9AtO6oRmhLSYLRIIpuQk+44M0AKiOLgnaZz
	6pe9KXW9Yx2A6dNk6FjMFQhILNgjx9TRN+9p2OvqTGEO2UL44niAZB1OWQNKqIGYYfxEdhWa0oi
	KBjzs8hSqB769Xxpi/9mNdmMOsXgZtHLRhHsKtayiQloYI24/+1m1ugcPHsROK5ZyMwZYyQ+4D5
	txCB7aBdss
X-Google-Smtp-Source: AGHT+IGY5Y2KTdaZaAd3HnAGXpedRNw4b12KEMkqN57ZikiQBKfKGS5CdY+ghvCof9iN933uImvqEQ==
X-Received: by 2002:a05:6000:22ca:b0:3e9:2fea:6795 with SMTP id ffacd0b85a97d-3e92fea6b35mr2699385f8f.53.1757857524471;
        Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] Input: s6sa552 - add a driver for the Samsung A552 touchscreen controller
Date: Sun, 14 Sep 2025 16:44:57 +0300
Message-ID: <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_064526_732657_7DFDB33E 
X-CRM114-Status: GOOD (  31.59  )
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

The S6SA552 touchscreen is a capacitive multi-touch controller for
mobile use. It connects via i2c at the address 0x48.

Introduce a basic driver, which can handle initialization, touch events
and power states.

At least the firmware for this IC on Galaxy S7 differs from S6SY761
in register layout and bits, as well as some missing registers/functions,
for example for retrieving the max X/Y coordinates and the amount
of TX/RX channels.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
Samsung almost completely didn't mention the IC name in the vendor
drivers.. I retrieved it from a fw-update function that checks a
firmware bit and matches it with an IC model string. Otherwise
everywhere else it's called sec_ts. I believe the main difference
between samsung touchscreen controllers is the firmware they're
running on, but this one is a bit different from s6sy761, featuring
different registers and bits, as well as some missing features. I
went with calling it s6sa552 to follow the "s6s" convention, because
as far as I know, s6sy661 also exists, and the important part is after
"s6s".
---
 drivers/input/touchscreen/Kconfig   |  11 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/s6sa552.c | 439 ++++++++++++++++++++++++++++
 3 files changed, 451 insertions(+)
 create mode 100644 drivers/input/touchscreen/s6sa552.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162..2d65dd13e 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -505,6 +505,17 @@ config TOUCHSCREEN_IPROC
 	  To compile this driver as a module, choose M here: the
 	  module will be called bcm_iproc_tsc.
 
+config TOUCHSCREEN_S6SA552
+	tristate "Samsung S6SA552 Touchscreen driver"
+	depends on I2C
+	help
+	  Say Y if you have the Samsung S6SA552 driver
+
+	  If unsure, say N
+
+	  To compile this driver as module, choose M here: the
+	  module will be called s6sa552.
+
 config TOUCHSCREEN_S6SY761
 	tristate "Samsung S6SY761 Touchscreen driver"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 97a025c6a..d3be3e21a 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_TOUCHSCREEN_PCAP)		+= pcap_ts.o
 obj-$(CONFIG_TOUCHSCREEN_PENMOUNT)	+= penmount.o
 obj-$(CONFIG_TOUCHSCREEN_PIXCIR)	+= pixcir_i2c_ts.o
 obj-$(CONFIG_TOUCHSCREEN_RM_TS)		+= raydium_i2c_ts.o
+obj-$(CONFIG_TOUCHSCREEN_S6SA552)	+= s6sa552.o
 obj-$(CONFIG_TOUCHSCREEN_S6SY761)	+= s6sy761.o
 obj-$(CONFIG_TOUCHSCREEN_SILEAD)	+= silead.o
 obj-$(CONFIG_TOUCHSCREEN_SIS_I2C)	+= sis_i2c.o
diff --git a/drivers/input/touchscreen/s6sa552.c b/drivers/input/touchscreen/s6sa552.c
new file mode 100644
index 000000000..32ef338de
--- /dev/null
+++ b/drivers/input/touchscreen/s6sa552.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0
+// Samsung S6SA552 Touchscreen device driver
+//
+// Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+//
+// Based on the s6sy761 driver:
+//   Copyright (c) 2017 Samsung Electronics Co., Ltd.
+//   Copyright (c) 2017 Andi Shyti <andi@etezian.org>
+
+#include <linux/unaligned.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+/* commands */
+#define S6SA552_SENSE_ON		0x40
+#define S6SA552_SENSE_OFF		0x41
+#define S6SA552_TOUCH_FUNCTION		0x63
+#define S6SA552_DEVICE_ID		0x52
+#define S6SA552_BOOT_STATUS		0x55
+#define S6SA552_READ_ONE_EVENT		0x71
+#define S6SA552_CLEAR_EVENT_STACK	0x60
+#define S6SA552_PANEL_INFO		0x23
+
+/* acknowledge events */
+#define S6SA552_EVENT_ACK_BOOT		0x0c
+
+/* status event types */
+#define S6SA552_EVENT_TYPE_ACK		0x01
+#define S6SA552_EVENT_TYPE_ERR		0x02
+#define S6SA552_EVENT_TYPE_INFO		0x03
+#define S6SA552_EVENT_TYPE_GEST		0x06
+#define S6SA552_EVENT_TYPE_SPONGE	0x5a
+
+/* boot status (BS) */
+#define S6SA552_BS_APPLICATION		0x20
+
+/* event id */
+#define S6SA552_EVENT_ID_COORDINATE	0x01
+#define S6SA552_EVENT_ID_STATUS		0x00
+
+/* event register masks */
+#define S6SA552_MASK_TID		0x0f  /* byte 1, lower 4 bits */
+#define S6SA552_MASK_NT			0xf0  /* byte 1, upper 4 bits */
+#define S6SA552_MASK_EID		0xc0  /* byte 0, bits 6-7 */
+#define S6SA552_MASK_TOUCH_STATE	0x07  /* byte 0, bits 0-2 */
+#define S6SA552_MASK_TOUCH_TYPE		0x38  /* byte 0, bits 3-5 */
+
+/* touch states */
+#define S6SA552_TS_NONE			0x00
+#define S6SA552_TS_PRESS		0x01
+#define S6SA552_TS_MOVE			0x02
+#define S6SA552_TS_RELEASE		0x03
+
+#define S6SA552_EVENT_SIZE		8
+#define S6SA552_DEVID_SIZE		3
+#define S6SA552_PANEL_ID_SIZE		11
+#define S6SA552_MAX_FINGERS		10
+
+/*
+ * Hardcoded values, since at least on herolte, the subid register doesn't
+ * read/exist.
+ */
+#define S6SA552_MAX_X			4095
+#define S6SA552_MAX_Y			4095
+#define S6SA552_TX_CHANNELS		16
+
+#define S6SA552_DEV_NAME		"s6sa552"
+
+enum s6sa552_regulators {
+	S6SA552_REGULATOR_VDD,
+	S6SA552_REGULATOR_AVDD,
+};
+
+struct s6sa552_data {
+	struct i2c_client *client;
+	struct regulator_bulk_data regulators[2];
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+
+	u8 data[S6SA552_EVENT_SIZE];
+
+	u16 devid;
+	u8 tx_channel;
+};
+
+static void s6sa552_report_coordinates(struct s6sa552_data *sdata,
+				       u8 *event, u8 tid)
+{
+	u8 major = event[6];
+	u8 minor = event[7];
+	u8 z = event[5];
+	u16 x = (event[2] << 4) | ((event[4] >> 4) & 0x0F);
+	u16 y = (event[3] << 4) | (event[4] & 0x0F);
+
+	input_mt_slot(sdata->input, tid);
+
+	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
+	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
+	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, major);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, minor);
+	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
+
+	input_sync(sdata->input);
+}
+
+static void s6sa552_report_release(struct s6sa552_data *sdata, u8 tid)
+{
+	input_mt_slot(sdata->input, tid);
+	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, false);
+
+	input_sync(sdata->input);
+}
+
+static void s6sa552_handle_coordinates(struct s6sa552_data *sdata, u8 *event)
+{
+	u8 tid;
+	u8 touch_state;
+
+	if (unlikely(!(event[1] & S6SA552_MASK_TID)))
+		return;
+
+	tid = (event[1] & S6SA552_MASK_TID) - 1;
+	touch_state = event[0] & S6SA552_MASK_TOUCH_STATE;
+
+	switch (touch_state) {
+	case S6SA552_TS_PRESS:
+	case S6SA552_TS_MOVE:
+		s6sa552_report_coordinates(sdata, event, tid);
+		break;
+	case S6SA552_TS_RELEASE:
+		s6sa552_report_release(sdata, tid);
+		break;
+	case S6SA552_TS_NONE:
+	default:
+		break;
+	}
+}
+
+static irqreturn_t s6sa552_irq_handler(int irq, void *dev)
+{
+	struct s6sa552_data *sdata = dev;
+	int ret;
+	u8 event_id;
+
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_READ_ONE_EVENT,
+					    S6SA552_EVENT_SIZE,
+					    sdata->data);
+	if (ret < 0) {
+		dev_err(&sdata->client->dev, "failed to read event\n");
+		return IRQ_HANDLED;
+	}
+
+	if (!sdata->data[0])
+		return IRQ_HANDLED;
+
+	event_id = sdata->data[0] >> 6;
+
+	switch (event_id) {
+	case S6SA552_EVENT_ID_COORDINATE:
+		s6sa552_handle_coordinates(sdata, sdata->data);
+		break;
+	case S6SA552_EVENT_ID_STATUS:
+		break;
+	default:
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int s6sa552_input_open(struct input_dev *dev)
+{
+	struct s6sa552_data *sdata = input_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_ON);
+}
+
+static void s6sa552_input_close(struct input_dev *dev)
+{
+	struct s6sa552_data *sdata = input_get_drvdata(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
+	if (ret)
+		dev_err(&sdata->client->dev, "failed to turn off sensing\n");
+}
+
+static ssize_t s6sa552_sysfs_devid(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%#x\n", sdata->devid);
+}
+
+static DEVICE_ATTR(devid, 0444, s6sa552_sysfs_devid, NULL);
+
+static struct attribute *s6sa552_sysfs_attrs[] = {
+	&dev_attr_devid.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(s6sa552_sysfs);
+
+static int s6sa552_power_on(struct s6sa552_data *sdata)
+{
+	u8 buffer[S6SA552_EVENT_SIZE];
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
+				    sdata->regulators);
+	if (ret)
+		return ret;
+
+	msleep(140);
+
+	/* double check whether the touch is functional */
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_READ_ONE_EVENT,
+					    S6SA552_EVENT_SIZE,
+					    buffer);
+	if (ret < 0)
+		return ret;
+
+	if (buffer[0] != S6SA552_EVENT_TYPE_ACK ||
+	    buffer[1] != S6SA552_EVENT_ACK_BOOT) {
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_byte_data(sdata->client, S6SA552_BOOT_STATUS);
+	if (ret < 0)
+		return ret;
+
+	/* for some reasons the device might be stuck in the bootloader */
+	if (ret != S6SA552_BS_APPLICATION)
+		return -ENODEV;
+
+	/* enable touch functionality */
+	ret = i2c_smbus_write_byte_data(sdata->client,
+					S6SA552_TOUCH_FUNCTION, 0x01);
+	if (ret)
+		return ret;
+
+	mdelay(20); /* make sure everything is up */
+
+	return 0;
+}
+
+static int s6sa552_hw_init(struct s6sa552_data *sdata)
+{
+	u8 buffer[S6SA552_DEVID_SIZE];
+	int ret;
+
+	ret = s6sa552_power_on(sdata);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_DEVICE_ID,
+					    S6SA552_DEVID_SIZE,
+					    buffer);
+	if (ret < 0)
+		return ret;
+
+	sdata->devid = get_unaligned_be16(buffer + 1);
+
+	return 0;
+}
+
+static void s6sa552_power_off(void *data)
+{
+	struct s6sa552_data *sdata = data;
+
+	disable_irq(sdata->client->irq);
+	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
+			       sdata->regulators);
+}
+
+static int s6sa552_probe(struct i2c_client *client)
+{
+	struct s6sa552_data *sdata;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+						I2C_FUNC_SMBUS_BYTE_DATA |
+						I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	if (!sdata)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, sdata);
+	sdata->client = client;
+
+	sdata->regulators[S6SA552_REGULATOR_VDD].supply = "vdd";
+	sdata->regulators[S6SA552_REGULATOR_AVDD].supply = "avdd";
+	err = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(sdata->regulators),
+				      sdata->regulators);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(&client->dev, s6sa552_power_off, sdata);
+	if (err)
+		return err;
+
+	err = s6sa552_hw_init(sdata);
+	if (err)
+		return err;
+
+	sdata->input = devm_input_allocate_device(&client->dev);
+	if (!sdata->input)
+		return -ENOMEM;
+
+	sdata->input->name = S6SA552_DEV_NAME;
+	sdata->input->id.bustype = BUS_I2C;
+	sdata->input->open = s6sa552_input_open;
+	sdata->input->close = s6sa552_input_close;
+
+	input_set_abs_params(sdata->input, ABS_MT_POSITION_X, 0, S6SA552_MAX_X,
+			     0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_POSITION_Y, 0, S6SA552_MAX_Y,
+			     0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
+
+	if (!input_abs_get_max(sdata->input, ABS_X) ||
+	    !input_abs_get_max(sdata->input, ABS_Y)) {
+		dev_warn(&client->dev, "the axis have not been set\n");
+	}
+
+	err = input_mt_init_slots(sdata->input, S6SA552_TX_CHANNELS,
+				  INPUT_MT_DIRECT);
+	if (err)
+		return err;
+
+	input_set_drvdata(sdata->input, sdata);
+
+	err = input_register_device(sdata->input);
+	if (err)
+		return err;
+
+	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					s6sa552_irq_handler,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					"s6sa552_irq", sdata);
+	if (err)
+		return err;
+
+	pm_runtime_enable(&client->dev);
+
+	return 0;
+}
+
+static void s6sa552_remove(struct i2c_client *client)
+{
+	pm_runtime_disable(&client->dev);
+}
+
+static int s6sa552_runtime_suspend(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
+}
+
+static int s6sa552_runtime_resume(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_ON);
+}
+
+static int s6sa552_suspend(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	s6sa552_power_off(sdata);
+
+	return 0;
+}
+
+static int s6sa552_resume(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	enable_irq(sdata->client->irq);
+
+	return s6sa552_power_on(sdata);
+}
+
+static const struct dev_pm_ops s6sa552_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(s6sa552_suspend, s6sa552_resume)
+	RUNTIME_PM_OPS(s6sa552_runtime_suspend, s6sa552_runtime_resume, NULL)
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id s6sa552_of_match[] = {
+	{ .compatible = "samsung,s6sa552", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, s6sa552_of_match);
+#endif
+
+static const struct i2c_device_id s6sa552_id[] = {
+	{ "s6sa552" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, s6sa552_id);
+
+static struct i2c_driver s6sa552_driver = {
+	.driver = {
+		.name = S6SA552_DEV_NAME,
+		.dev_groups = s6sa552_sysfs_groups,
+		.of_match_table = of_match_ptr(s6sa552_of_match),
+		.pm = pm_ptr(&s6sa552_pm_ops),
+	},
+	.probe = s6sa552_probe,
+	.remove = s6sa552_remove,
+	.id_table = s6sa552_id,
+};
+
+module_i2c_driver(s6sa552_driver);
+
+MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
+MODULE_DESCRIPTION("Samsung S6SA552 Touch Screen");
+MODULE_LICENSE("GPL");
-- 
2.43.0


