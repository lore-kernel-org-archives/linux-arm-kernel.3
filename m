Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5EACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCKAo/jf8xEPgNkV5gsPWnBJjgGBXqxhdGGblYeVH98=; b=aP69n69zR/KUxTZ9Oh0LjECPTN
	p/3hwupv5M/DiNL3+jRndr4ab1MCJGwspSY1mU0nWvr2Xfcx0AKWbAZMcFKmpw5HFBW2GcsBg3fTJ
	bwPpQWrZRKOmaHXmLHZTm16xUGIq8aHAl2QJ72J578K/mqDyDcE/Pkhzjvi2N+fpnIBC7ESiwJrd7
	iEfEB1bUOcHLJVouHgtKP3HrZ9R2K2Zv0vRsLwAdQpjGJSUNz2toK4E3eUyDVlmMJcwZTMfPe0FlW
	HNdbCQzbgW6aPUuRMrWEmHar+bK9ceWXgIa0wrgWZjsL6OvfeNU6j6+xyhOfqkgtRbzt2cI++DW7H
	f0g4VaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUt-0000000CL73-1vB3;
	Sun, 17 May 2026 08:05:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUq-0000000CL5X-36ED
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 08:05:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ba856db1c0so9814115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005112; x=1779609912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCKAo/jf8xEPgNkV5gsPWnBJjgGBXqxhdGGblYeVH98=;
        b=SrBbCcHirH46bGtARozmVObsACfWxohish+5nVDXRLzfHAH6E0U1JOHUrGI4WAjnEE
         7K/nHp4/kocJU+jAP03/LFHqXMGvgJfcqZGexv7lvY0ooHIYfIVzypNsork36QeKsGEw
         EGBlDWiNZ3kulOLK2PE5bf2cs6Oe7Y68/f0uBrT6Ky81vkZyhNpxllmCkNpMug7Fifi+
         i+BIdoOIz9OVLdHcwGhKEfTV6xEpVeBgQuDecMHJ94e9xg1CYIjeRnzvPeZNmIl9F6gF
         gTsX6IzaZO4ZuwXyI6rIw4mEIjrj9m3pY5AIMAoki8J3eGJ7npbnN5wz/vS+LMIdJI4l
         wFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005112; x=1779609912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCKAo/jf8xEPgNkV5gsPWnBJjgGBXqxhdGGblYeVH98=;
        b=YLeW/GkClUBr5MX3NYZHQe8qo+KQ8x3WBwBcRo4ODogiifaTZgJdEgOPON7hrmUWOG
         vuPDQfrTEGnNOLTsiupw4kLF7PU5z7ZxEeOqatOrSmbJXbvQToUkG7k84i7QEVPSpE1z
         +Wq6/Ahqs7aLwMBw8pQuU2CO3CzodyZ9tFFLXQ/s9aX0yj84x/qm99HrYVnVzpStx/vW
         LAZE58V580tnHM139aIuKdc2+pmjDS+2PTSSQtU6u2RxgRGfdjve+JhH2UdNm7NipcEK
         sY7syNA02f9U4nBNqfay9LY452p1duIZVpW3ky7c83eY/p+uCZfSlJhUBGuUsnWlZSlb
         SYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e0mnp1ad7NnUMrIiG6eJOiik2q0CGPT4sL9ycGeqTr7MQBEmWlw6w+vU08K9Ot7teRRUfZmoqToeS+Fvufv53@lists.infradead.org
X-Gm-Message-State: AOJu0YxCyE6Rv9/XVmSjq77QdgZrF+xu2wtvWNJnN6oUlNDFJppq+0D7
	qsadrFcMNp36sShjkWCQ7QpOgEKekjkH+hG2czWrvCAw72yYfill+n1W
X-Gm-Gg: Acq92OEKszhkiwf9GgqWrFea1fdVPxO2RpHBeGh0j3K5LjExKrlx1vnBvuxfFSpGGrC
	q2tp92UuY0ULbFcLGHROAGaaFrAYMl7ng2AlArQw+qWsy5j/a1ZgKvC7vQ7xAose4lyXCoXYQAC
	rNM97CIMPbRqbVSK0MD9xSNM+0JGa3xBU+4DCcERuUQxr5tOkVufaZnrM0jOYueQw3D3F2oJkx7
	ufjArs6sYwd1Gur7iYGvAMdTRq0ZzfU3GpIJsNQSUMda8e7XVs21bcdWDGiWN51XnEE0/VJCSME
	Lpzb9zYnbUIbw3u4XjYK2U9JONt+pJwpsDC69c65QpNxRpUum0SgODA4rrSIEUPVR96QlMawd6g
	EjqqC7kSUM5DWUBaj54PX7xO38vp3laowL7+ZlRf3mC9/R/inSsv4i26rrI7JHYv9CY20r4UHRj
	g9JJttJe23Cb6i1EfpH7uq9NHC1wvuJymoyjUb5zEtVQ5o1+fysimDc86P6d9jmAWxvechVBY=
X-Received: by 2002:a17:902:b090:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd7e77a4ccmr84321965ad.4.1779005112119;
        Sun, 17 May 2026 01:05:12 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:11 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
Date: Sun, 17 May 2026 13:34:44 +0530
Message-ID: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_010512_792517_4AFCCE5E 
X-CRM114-Status: GOOD (  22.36  )
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

Extend the raspberrypi-hwmon driver to expose firmware-provided
voltage measurements through the hwmon subsystem.

The driver now exports the following voltage inputs:

  - in0_input (core)
  - in1_input (sdram_c)
  - in2_input (sdram_i)
  - in3_input (sdram_p)

Voltage values returned by firmware are converted from microvolts
to millivolts as expected by the hwmon subsystem.

Update the documentation related to it.

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c         | 127 +++++++++++++++++++++-
 2 files changed, 137 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
index 8038ade36490..db315184b861 100644
--- a/Documentation/hwmon/raspberrypi-hwmon.rst
+++ b/Documentation/hwmon/raspberrypi-hwmon.rst
@@ -20,6 +20,17 @@ undervoltage conditions.
 Sysfs entries
 -------------
 
-======================= ==================
+======================= ======================================================
+in0_input		Core voltage in millivolts
+in1_input		SDRAM controller voltage in millivolts
+in2_input		SDRAM I/O voltage in millivolts
+in3_input		SDRAM PHY voltage in millivolts
+in0_label		"core"
+in1_label		"sdram_c"
+in2_label		"sdram_i"
+in3_label		"sdram_p"
 in0_lcrit_alarm		Undervoltage alarm
-======================= ==================
+======================= ======================================================
+
+The voltage inputs and labels are only exposed if the firmware reports support
+for the corresponding voltage ID.
diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..8ce6dacc19b0 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -5,6 +5,7 @@
  * Based on firmware/raspberrypi.c by Noralf Trønnes
  *
  * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
+ * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
 #include <linux/devm-helpers.h>
@@ -21,10 +22,18 @@
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
+	u32 valid_inputs;
 	u32 last_throttled;
 	struct delayed_work get_values_poll_work;
 };
 
+static const char * const rpi_hwmon_labels[] = {
+	"core",
+	"sdram_c",
+	"sdram_i",
+	"sdram_p",
+};
+
 static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 {
 	u32 new_uv, old_uv, value;
@@ -56,6 +65,21 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_voltage_request packet =
+		RPI_FIRMWARE_GET_VOLTAGE_REQUEST(id);
+	int ret;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.value) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +101,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
 
-	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+			switch (channel) {
+			case 0:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_CORE,
+						val);
+			case 1:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+						val);
+			case 2:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+						val);
+			case 3:
+				return rpi_firmware_get_voltage(data,
+						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+						val);
+			default:
+				return -EOPNOTSUPP;
+			}
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0) {
+				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
+				return 0;
+			}
+			return -EOPNOTSUPP;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
+			return -EOPNOTSUPP;
+
+		*str = rpi_hwmon_labels[channel];
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	const struct rpi_hwmon_data *data = _data;
+
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
+			if (!(data->valid_inputs & BIT(channel)))
+				return 0;
+			return 0444;
+		case hwmon_in_lcrit_alarm:
+			if (channel == 0)
+				return 0444;
+			return 0;
+		default:
+			return 0;
+		}
+	}
+
 	return 0;
 }
 
 static const struct hwmon_channel_info * const rpi_info[] = {
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_LCRIT_ALARM),
+			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
 	NULL
 };
 
 static const struct hwmon_ops rpi_hwmon_ops = {
-	.visible = 0444,
+	.is_visible = rpi_is_visible,
 	.read = rpi_read,
+	.read_string = rpi_read_string,
 };
 
 static const struct hwmon_chip_info rpi_chip_info = {
@@ -101,6 +200,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_hwmon_data *data;
+	long voltage;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -110,6 +210,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	/* Parent driver assure that firmware is correct */
 	data->fw = dev_get_drvdata(dev->parent);
 
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(0);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(1);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(2);
+
+	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
+				       &voltage);
+	if (!ret)
+		data->valid_inputs |= BIT(3);
+
 	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
 							       data,
 							       &rpi_chip_info,
@@ -159,6 +279,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0


