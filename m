Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F91CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ntITPX/yKgnZ1Q6Dq8rTG0b/dRN6+Si7W2upKYFSU0=; b=bwy0hhe16VDz33o/dXgcfKzpDF
	qmsbkEt7zLFmO4vu1czX0+rMNTgVXdJJMneV04Wejt6nh7qJuhvfBQ2jU5GpJGf7mSPy4p8GfXBTG
	rhNtBRnGfv0A9nOEm2eQFPNNRJI4T1DqvpkbGZV+fGXOrsS75aeQLsZESYBXCmfP4YLHN9g5RioJc
	1oX4ryDkCQJwM4UmiWp4w1TcvXTR2gMkqkgZJ98wk2qNMqeiR+jD6EFf2E5zoUExO4pLr5ARk3pMS
	GJXnTebJe5e+50oY+lamiG6un8EHmP21S9Yg/ejo3AX22B3y8zC0IJk3Ah2VtJ3ZFV9LUz6M8jiRn
	UTpJY1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphm9-00000003zRP-2fb6;
	Sat, 23 Aug 2025 06:30:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcm-00000002b2y-29Rq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DC4240443;
	Fri, 22 Aug 2025 13:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE105C113D0;
	Fri, 22 Aug 2025 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868568;
	bh=Z4N7E/ATatKbH4cDH2pW0yLzLs+JwnGudzv9sEzmXkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u9qqJqF8cxZ+yFm28exnxYClwNlCvshsNwzS1xiCidbwyZoVkRRzZvSevHaF8YOmh
	 sR6bx5S/N7uXWz6G3HjIIXI7Qi7zE3vUhQ9vHZVcXurFBb6vn8YE9ZzEy6yiiuCnQp
	 AthcgRTahTHUS2Pw5Nav8zyJ+BqRmZ70gMbpc4CAjjF2CLHE0jlJasdqlowrU+PNun
	 X51QbgWaT1DGE5MKOvcjqA3WvhBPeOddaAcreT6vVjdLhHYIBcgP8dJbE2uxeIxe7u
	 Xf3dVMnlHlbO6uvKILUzZv3oC34639BIeey/PhcKuhGj0HoOmnb7kP2c6H0AQW+1NU
	 HycDVuyq1jDNw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:30 +0200
Message-Id: <20250822131531.1366437-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061608_596926_459D09B2 
X-CRM114-Status: GOOD (  18.43  )
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

The on-board uC on the SMARC-sAM67 board is compatible with the older
CPLD implementation on the SMARC-sAL28 board, but has different sensors,
namely two voltage sensors and one temperature sensor. Add support for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/hwmon/sl28cpld-hwmon.c | 76 ++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sl28cpld-hwmon.c b/drivers/hwmon/sl28cpld-hwmon.c
index 454cc844fb9d..670308d9b72f 100644
--- a/drivers/hwmon/sl28cpld-hwmon.c
+++ b/drivers/hwmon/sl28cpld-hwmon.c
@@ -18,6 +18,9 @@
 #define   FAN_SCALE_X8		BIT(7)
 #define   FAN_VALUE_MASK	GENMASK(6, 0)
 
+#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
+#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
+
 struct sl28cpld_hwmon {
 	struct regmap *regmap;
 	u32 offset;
@@ -75,8 +78,71 @@ static const struct hwmon_chip_info sl28cpld_hwmon_chip_info = {
 	.info = sl28cpld_hwmon_info,
 };
 
+static int sa67mcu_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type, u32 attr,
+			      int channel, long *input)
+{
+	struct sl28cpld_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int offset;
+	u8 reg[2];
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			offset = hwmon->offset + SA67MCU_TEMP(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Reading the low byte will capture the value */
+	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
+	if (ret)
+		return ret;
+
+	*input = reg[1] << 8 | reg[0];
+
+	/* Temperatures are s16 and in 0.1degC steps. */
+	if (type == hwmon_temp)
+		*input = sign_extend32(*input, 15) * 100;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops sa67mcu_hwmon_ops = {
+	.visible = 0444,
+	.read = sa67mcu_hwmon_read,
+};
+
+static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
+	.ops = &sa67mcu_hwmon_ops,
+	.info = sa67mcu_hwmon_info,
+};
+
 static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 {
+	const struct hwmon_chip_info *chip_info;
 	struct sl28cpld_hwmon *hwmon;
 	struct device *hwmon_dev;
 	int ret;
@@ -84,6 +150,10 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 	if (!pdev->dev.parent)
 		return -ENODEV;
 
+	chip_info = device_get_match_data(&pdev->dev);
+	if (!chip_info)
+		return -EINVAL;
+
 	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
@@ -97,8 +167,7 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-				"sl28cpld_hwmon", hwmon,
-				&sl28cpld_hwmon_chip_info, NULL);
+				"sl28cpld_hwmon", hwmon, chip_info, NULL);
 	if (IS_ERR(hwmon_dev))
 		dev_err(&pdev->dev, "failed to register as hwmon device");
 
@@ -106,7 +175,8 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sl28cpld_hwmon_of_match[] = {
-	{ .compatible = "kontron,sl28cpld-fan" },
+	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
+	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sl28cpld_hwmon_of_match);
-- 
2.39.5


