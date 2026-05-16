Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A657BCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHW/BI9GDTwQbV2hvJZT0LsNh5n9BJgFdfYTJRCI8qk=; b=gF64KO43onw3S32TvXGRYZtpfB
	EKVGAvFuxp5PsLOqeeGf4eToXAWJjPq4xyJp1LcmKLE7Ksv64M54/Bm5YY9FNnHQ2I/OUFU1kdV+G
	LcGyT7rMa9KR5mowfARjS+wopy6hp7OG6y5fmnjephG+7KtcLLGOmBZfvJSr10QrxW8W1aeMlOYbu
	Jj12cfiJ5UaKODj/BZa4TO2bRtt96aQU8hRcVr/Ejl8TQ2aYhSB2PYyub1vO4uoBxdF71DChs85uz
	xvjq4AEqCWtLlWUrgiopJwzAgMAE93Y6UhTkvUebG/QiRPO7zNruxUYYJUDgVZC80gfqT/tPL69yK
	E+aBr/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOI7s-0000000B2sn-3Cyn;
	Sat, 16 May 2026 16:44:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOI7i-0000000B2pD-2d49
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 16:44:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so352433b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949862; x=1779554662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHW/BI9GDTwQbV2hvJZT0LsNh5n9BJgFdfYTJRCI8qk=;
        b=OO68FTi5HB5MjxMQRJbAhoipVfQ/bEQ3CUKU04FJvlZOYGh25BGS7Ol4CyvrZU8KY6
         PA3dcun521yB+5TDq36jmXN7wSMYRBuDvU7CplF0tdM0OMR6j+x2WrkTea1fz2eWyI98
         t9p0UKZc8Hm6mcRah91L2OieC2ydt4zekm6S0DYBxj/kdjhA8EBc8o6regfc/47yEoGo
         AgKv65zH3FifkYrqBN3nqjsDuyYDHdVl4YT0ICvAnhNJcT384dGac/eXvn6RjLDM0EWt
         YJV2K3CgQqJvqR5QpFYoCXHox5sglA42CE2jGo36jHJeCe2wknYvAj4V4MJUKrFEJ1Rc
         qa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949862; x=1779554662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHW/BI9GDTwQbV2hvJZT0LsNh5n9BJgFdfYTJRCI8qk=;
        b=NyMPGEZr7Al3i8PDDFNe8KyqUBdfbfyv9XTj1CPzr7WLjADo/J4JYnq39YFVpzScbD
         Zhwom9FwMbiVNfHEncth9CqZs/ZebGjF+rkmujxmGzKxhkd/2rsN4nH+cMeRo1YmjeI5
         DGF0kXN4G+blgz2ymrnHdPNYtbMKPvcgDJ72BXQqTtvY/m9TC1jbemVLaSmxizvPHfok
         AEKrPrehD1RYRC0yiKsmeQidYyDl1Vr0HoS2AL9jub73HJwIK1FKAjMDSIO0pu8eWHiW
         NtXD+cOceo4g2cwcQUJ9GtwmsrSEcfTOwp3W4uczSrAo9EmqprrezWBmi2SlSbiBMrYT
         aOtw==
X-Forwarded-Encrypted: i=1; AFNElJ+G1c6W49apJPlh5Wgtjivh+e9cCkXLTwD/j4mips//oGSuS00E3cgkj+NfwqzMKHQ9n1o81IPA+qW4hPr3Vqmr@lists.infradead.org
X-Gm-Message-State: AOJu0YwU4Mbb8MG4fYliZ0s5C9TE9IL+cj28YAddonpy7SYs3Gty/ALP
	CubE0PgwuJ4XT52Wv0ctyqA3dYN7QqV4tjBteD6QVry2VkS1vvexmBiW
X-Gm-Gg: Acq92OFUfUeU9Q6agpuBlcx29Rd02JED+Fc9zRCWJAKS5rQk6dQsuKpKuirAGLRFBDq
	RwHzCIO9+o8QnR3iiDLIWRMlxITT4ra1SDAB7L2T2fLxLHvYe5gURdmN49GKrt6LaftUJ32HP1N
	6OZr/koXHEqAf68H7YwcDndo2615E572E3qPCv8pFE2/6QNC+OpFRPpw6/asOk4mpDQVltI/4+g
	K245SOqrpYXP1ASUulqKVuFVIxiza/G/463Oy8tNtEGC/Pwa6vXgYntS12qQIoV0dzpG+Szj5O1
	QXiiJbbEoT9Qs2FcEDVeI96HpvYt80b3ot7hY5FjbJq/llWbDI/QTimV56TNUVC+q/8iIPRSrp9
	Jb12mIXf7yNEpLXp7JVLQWtinwFA3y7dodE3Jw9yQ7JKgg9SyKH41Ee9olrZDIWuiTsHGDasrIp
	1+OcR060xorSxmWYrC0ib+Yk/lqrCVH3d+7OL/9DIFX6aZmXF7JSxIR0DKcA==
X-Received: by 2002:a05:6a00:e1a:b0:835:6bdf:c888 with SMTP id d2e1a72fcca58-83f33c329d8mr9642858b3a.2.1778949861637;
        Sat, 16 May 2026 09:44:21 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm9562564b3a.1.2026.05.16.09.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:44:21 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: raspberrypi: Add voltage input support
Date: Sat, 16 May 2026 22:14:06 +0530
Message-ID: <20260516164407.25255-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_094422_673747_3F70DBDC 
X-CRM114-Status: GOOD (  19.51  )
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

The existing undervoltage sticky alarm handling is preserved and
associated with the first voltage channel.

Tested in -
- Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
  Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/hwmon/raspberrypi-hwmon.c | 112 +++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index a2938881ccd2..c73a970db025 100644
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
@@ -18,6 +19,11 @@
 
 #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
 
+struct rpi_firmware_get_value {
+	__le32 id;
+	__le32 val;
+} __packed;
+
 struct rpi_hwmon_data {
 	struct device *hwmon_dev;
 	struct rpi_firmware *fw;
@@ -56,6 +62,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
 	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }
 
+static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
+				    long *val)
+{
+	struct rpi_firmware_get_value packet;
+	int ret;
+
+	packet.id = cpu_to_le32(id);
+	packet.val = 0;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
+				    &packet, sizeof(packet));
+	if (ret)
+		return ret;
+
+	*val = le32_to_cpu(packet.val) / 1000;
+	return 0;
+}
+
 static void get_values_poll(struct work_struct *work)
 {
 	struct rpi_hwmon_data *data;
@@ -77,19 +100,101 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
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
+		switch (channel) {
+		case 0:
+			*str = "core";
+			return 0;
+		case 1:
+			*str = "sdram_c";
+			return 0;
+		case 2:
+			*str = "sdram_i";
+			return 0;
+		case 3:
+			*str = "sdram_p";
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
+			      u32 attr, int channel)
+{
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_label:
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
@@ -159,6 +264,7 @@ static struct platform_driver rpi_hwmon_driver = {
 module_platform_driver(rpi_hwmon_driver);
 
 MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
 MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:raspberrypi-hwmon");
-- 
2.54.0


