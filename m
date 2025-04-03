Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKjSO+JBCZWmTR2KI3Lfut4sG9sU0pAz1iqONtK29C8=; b=MS2hfTgmgtPixSAWwmFf1w1NQ9
	t1wZSQKhupOVTvHblktE4soeh+1eABCKkBkGpYZb1FgD3LpVr47++Tw/nF2SlIrebIHoouXyBkTNY
	cscagBA0P/BHXPzWPy1FoypTiRetcrBuBsVhTRLaM7zbB8Dyw9jQsSr/avFPgPfMzIUP6VKRWCIPo
	VLemaIGMO7ICcugu9eAZNWAc6YUkyY8Rm0+JExvp6yN5Uw9MA0Z36BLwTWPyZNojnhRfViJHxs1os
	AvMnq2yHtHhpJT7zqRMO4zqk0TjByOZTth+aK6Cgx6eZtAtguc4G/4FTneZt4+6uH6nytLGInhT82
	Dsbf4eNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HAO-00000008Rrs-1hhk;
	Thu, 03 Apr 2025 09:47:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPu-00000008JpO-0bmo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso1030231a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670757; x=1744275557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKjSO+JBCZWmTR2KI3Lfut4sG9sU0pAz1iqONtK29C8=;
        b=mh699JPTIn1gMeyOXqsZ+B6tleJUcvHNMl8wmRVlHzeILsrrsqCpwDZPyXDrB92zL/
         rYfgjQyLHyayDuvsF+Qh+82rS56LDUOMGEPhvJdraebhyeySZPOwRoNW8afWMJ1ZC7kM
         iM+QqW/7fJrKxPlHyHvaWJTX2HYgP8Ev0AMYl5SvZE0f/rb+Fz/einq9QDXp85v7ifcX
         b5YahqDwU8/e9yB2bVq5q9QpUbMOpI+Twrl/l3WjuSkOrzlzru4x0ZtvieUoLw5Gj0qT
         0zCMla5R4neFuHxo7q9N6YPPQgXy4CWjBEJnRag0gwy0htoDGU2jD0jc+nZ2+621V3aR
         2XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670757; x=1744275557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKjSO+JBCZWmTR2KI3Lfut4sG9sU0pAz1iqONtK29C8=;
        b=NAhodNzfV2N5hS8ztDntcCQHM4WcQWeErgxc35TY1mFnyFZ027EP2tFIAT2ZgNpKvh
         00eRIkKq+BaSyWcZJnXHedqlsBvhZeS8gIDJbPcjXUnQSEHdA9dDLtfUBW6y7W6Rrze5
         OXMqEVeiYqm2+XfsmYVC5iihs63f+X+BOtvcBSakpsrIdOTUxuSrTsmT8vRHHPcBCL5b
         QF6vloCMYjE6rfzw/jOyckzhupvtyFhZj8s/ZA6DMn5iSTrf/UlDLSjCQt3nb/YmqzG8
         VrP+TuuRCHhOS8+o8564IQxWI0YDQxnPAo/Hh5wUP0FD2c2ds7Ij8F9FOj6P4tKokM7+
         nBnw==
X-Forwarded-Encrypted: i=1; AJvYcCWCJTtFMEZ2ihTxFv+UXY1u07Au2gfRAmmdl7x8yipgFVt/fX3dLotHsfs3MabEuxJl8BrDiixa9x8lXy3GD351@lists.infradead.org
X-Gm-Message-State: AOJu0YzbryVnU4lH5ghMDmp5YmpkjuIzHH+BTHur3cXiKVq57JZ0Huoi
	ypEx5Afrn7fkqpK7mxrhdeD0cmlhSz4cXM86YmxWx6Jkc3eJCmbbLJ5G5CK1hgs=
X-Gm-Gg: ASbGncslraZODd8sje90gD/FGsgg9g2OVfwI+iBpajmQkyOlt2kzEfjbHyjlaek+DmT
	5ShluQ1EU+fz/DNF9S3NCImKUcBBhfPCFKYapwT7Uuxazl6cBnLHbP/Kp+o0EL/AI5t5+3USM1h
	oJiieasHBUx5fN4uqO0AiZOgcqjeNZc5vDzrxH7soaceEjmRuBz6xlSKq29wDn9nDtZ9qYV/y97
	+JVwQHB/Bnh9w7mvPg8ZvXAgs4VEbFkQlU7Z24YmManmlQ7WtLhoYVonLO0UeQmnTV68YNHXz7E
	A0H5LXQHXF6FktASCi1GuaFsJgXFvibomtbJ8oZGfsg3mE9ECxNQXM9KwPTPDqVRZ3J5z/t4lA9
	DxL75iYfrOuzMNC7qZMOcT/9oFiRo
X-Google-Smtp-Source: AGHT+IF6fx+pJv4iCabB+Gq0Y1FWCxO1y1Kv+NIBC2jENVtzdFZG3oNJuULm8j69u/Q8i/sO7cV86g==
X-Received: by 2002:a05:6402:3204:b0:5f0:82cd:500b with SMTP id 4fb4d7f45d1cf-5f082cd5216mr2775019a12.19.1743670756751;
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:19 +0100
Subject: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015918_189056_89B2E021 
X-CRM114-Status: GOOD (  20.52  )
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

Add support for Samsung's S2MPG10 PMIC RTC, which is similar to the
existing PMIC RTCs supported by this driver.

S2MPG10 doesn't use I2C, so we expect the core driver to have created a
regmap for us.

Additionally, it can be used for doing a cold-reset. If requested to do
so (via DT), S2MPG10 is programmed with a watchdog configuration that
will perform a full power cycle upon watchdog expiry.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 86ccf666c68059408907c97f2647716ffaad10c6..0d8783577bab4f4ebe61050dbd68387d970773bd 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/bcd.h>
 #include <linux/regmap.h>
+#include <linux/reboot.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/samsung/core.h>
@@ -53,6 +54,7 @@ enum {
  * Device     | Write time | Read time | Write alarm
  * =================================================
  * S5M8767    | UDR + TIME |           | UDR
+ * S2MPG10    | WUDR       | RUDR      | AUDR
  * S2MPS11/14 | WUDR       | RUDR      | WUDR + RUDR
  * S2MPS13    | WUDR       | RUDR      | WUDR + AUDR
  * S2MPS15    | WUDR       | RUDR      | AUDR
@@ -99,6 +101,20 @@ static const struct s5m_rtc_reg_config s5m_rtc_regs = {
 	.write_alarm_udr_mask	= S5M_RTC_UDR_MASK,
 };
 
+/* Register map for S2MPG10 */
+static const struct s5m_rtc_reg_config s2mpg10_rtc_regs = {
+	.regs_count		= 7,
+	.time			= S2MPG10_RTC_SEC,
+	.ctrl			= S2MPG10_RTC_CTRL,
+	.alarm0			= S2MPG10_RTC_A0SEC,
+	.alarm1			= S2MPG10_RTC_A1SEC,
+	.udr_update		= S2MPG10_RTC_UPDATE,
+	.autoclear_udr_mask	= S2MPS15_RTC_WUDR_MASK | S2MPS15_RTC_AUDR_MASK,
+	.read_time_udr_mask	= S2MPS_RTC_RUDR_MASK,
+	.write_time_udr_mask	= S2MPS15_RTC_WUDR_MASK,
+	.write_alarm_udr_mask	= S2MPS15_RTC_AUDR_MASK,
+};
+
 /* Register map for S2MPS13 */
 static const struct s5m_rtc_reg_config s2mps13_rtc_regs = {
 	.regs_count		= 7,
@@ -238,6 +254,7 @@ static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -300,6 +317,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 	case S5M8767X:
 		data &= ~S5M_RTC_TIME_EN_MASK;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -351,6 +369,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -374,6 +393,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -411,6 +431,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -449,6 +470,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -487,6 +509,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -524,6 +547,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -604,6 +628,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
 		break;
 
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -634,6 +659,25 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	return ret;
 }
 
+static int s5m_rtc_restart_s2mpg10(struct sys_off_data *data)
+{
+	struct s5m_rtc_info *info = data->cb_data;
+	int ret;
+
+	if (data->mode != REBOOT_COLD && data->mode != REBOOT_HARD)
+		return NOTIFY_DONE;
+
+	/*
+	 * Arm watchdog with maximum timeout (2 seconds), and perform full reset
+	 * on expiry.
+	 */
+	ret = regmap_set_bits(info->regmap, S2MPG10_RTC_WTSR,
+			      (S2MPG10_WTSR_COLDTIMER | S2MPG10_WTSR_COLDRST
+			       | S2MPG10_WTSR_WTSRT | S2MPG10_WTSR_WTSR_EN));
+
+	return ret ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
@@ -689,6 +733,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		if (IS_ERR(info->regmap))
 			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
 					     "Failed to allocate regmap\n");
+	} else if (id->driver_data == S2MPG10) {
+		info->regs = &s2mpg10_rtc_regs;
+		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %lu\n",
@@ -735,6 +782,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, true);
 	}
 
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&
+	    info->device_type == S2MPG10) {
+		ret = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_RESTART,
+						    SYS_OFF_PRIO_HIGH + 1,
+						    s5m_rtc_restart_s2mpg10,
+						    info);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+				       "Failed to register restart handler\n");
+	}
+
 	return devm_rtc_register_device(info->rtc_dev);
 }
 
@@ -766,6 +825,7 @@ static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_rtc_suspend, s5m_rtc_resume);
 
 static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s5m-rtc",		S5M8767X },
+	{ "s2mpg10-rtc",	S2MPG10 },
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ "s2mps15-rtc",	S2MPS15X },

-- 
2.49.0.472.ge94155a9ec-goog


