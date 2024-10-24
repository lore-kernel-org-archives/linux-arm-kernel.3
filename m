Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6AD0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT2yILJv6RLvkUgpzAoVckbLuv8XMCf6BywVXl+6c/I=; b=FxQUN2Eja6fCeBMgopilBGoatm
	InLnh2A2EUHsOxk2aU6bJm6EcSmTue/OmoZcTswnj3KUqYu09UiD5hZLPvLykWd1uAcLyqJMsD4JK
	y/0bRtxkdtKV3+tSIuZ8UVQBI2jlWS8jjpBxL87VjPRdSkHvXj0CxA32bxzKyXgXBg2IYOF1gsO3A
	70NpChZRxYAGMxVfBMhv3zIUQWfTlI+VB6RvdNgNbhOYcXZTNWCc82OAV5rNo8jhWrlmTQ5gTPe2r
	ps3oJUs1aEBI8h7nrnXEQCmNWuF9D6Ra6jVOSsz9V/kO2BVg/+joBMtcq+Je0azd5R3cZh3fqXbCk
	iq2C/lRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sII-0000000H68g-3fKH;
	Thu, 24 Oct 2024 07:30:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s4b-0000000H3j5-2eYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:15:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 24 Oct
 2024 15:15:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 24 Oct 2024 15:15:48 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ukleinek@kernel.org>,
	<billy_tsai@aspeedtech.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v1 2/2] hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload
Date: Thu, 24 Oct 2024 15:15:48 +0800
Message-ID: <20241024071548.3370363-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001557_759330_D9A98F29 
X-CRM114-Status: GOOD (  17.71  )
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

Use the DTS property #pwm-cells to determine if the PWM controller needs
to enable the WDT reload feature, which changes the duty cycle to a
preprogrammed value after a WDT/EXTRST#. When #pwm-cells = <4>, the
feature will be enabled, and the PWM consumer can use the 4th argument to
set the reload duty cycle [0-255].

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Change-Id: Ided520f73220581e3b37819a106ec81ebf9bb5a6
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 49 ++++++++++++++++++++++++++++++
 drivers/pwm/core.c                 |  6 ++--
 include/linux/pwm.h                | 10 ++++++
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 75eadda738ab..df47f9aa8ee6 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -56,6 +56,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <linux/reset.h>
 #include <linux/sysfs.h>
 
@@ -452,6 +453,51 @@ static void aspeed_pwm_tach_reset_assert(void *data)
 	reset_control_assert(rst);
 }
 
+static void aspeed_pwm_set_wdt_reload(struct pwm_chip *chip,
+				      struct pwm_device *pwm,
+				      u64 reload_duty_cycle)
+{
+	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
+	u32 hwpwm = pwm->hwpwm, val;
+
+	val = readl(priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+	val &= ~PWM_ASPEED_DUTY_CYCLE_POINT_AS_WDT;
+	val |= FIELD_PREP(PWM_ASPEED_DUTY_CYCLE_POINT_AS_WDT,
+			  reload_duty_cycle);
+	writel(val, priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+
+	val = readl(priv->base + PWM_ASPEED_CTRL(hwpwm));
+	val |= PWM_ASPEED_CTRL_DUTY_LOAD_AS_WDT_ENABLE;
+	writel(val, priv->base + PWM_ASPEED_CTRL(hwpwm));
+}
+
+static struct pwm_device *
+aspeed_pwm_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
+{
+	struct pwm_device *pwm;
+
+	/* flags in the fourth cell are optional */
+	if (args->args_count < 3)
+		return ERR_PTR(-EINVAL);
+
+	if (args->args[0] >= chip->npwm)
+		return ERR_PTR(-EINVAL);
+
+	pwm = pwm_request_from_chip(chip, args->args[0], NULL);
+	if (IS_ERR(pwm))
+		return pwm;
+
+	pwm->args.period = args->args[1];
+	pwm->args.polarity = PWM_POLARITY_NORMAL;
+	if (args->args[2] & PWM_POLARITY_INVERTED)
+		pwm->args.polarity = PWM_POLARITY_INVERSED;
+
+	if (args->args_count > 3 && args->args[3] < U8_MAX)
+		aspeed_pwm_set_wdt_reload(chip, pwm, args->args[3]);
+
+	return pwm;
+}
+
 static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev, *hwmon;
@@ -493,6 +539,9 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	pwmchip_set_drvdata(chip, priv);
 	chip->ops = &aspeed_pwm_ops;
 
+	if (IS_ENABLED(CONFIG_OF))
+		chip->of_xlate = aspeed_pwm_xlate;
+
 	ret = devm_pwmchip_add(dev, chip);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 6e752e148b98..8251f7b361ab 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -422,9 +422,8 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
  * chip. A negative error code is returned if the index is not valid for the
  * specified PWM chip or if the PWM device cannot be requested.
  */
-static struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
-						unsigned int index,
-						const char *label)
+struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
+					 unsigned int index, const char *label)
 {
 	struct pwm_device *pwm;
 	int err;
@@ -442,6 +441,7 @@ static struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
 
 	return pwm;
 }
+EXPORT_SYMBOL_GPL(pwm_request_from_chip);
 
 struct pwm_device *
 of_pwm_xlate_with_flags(struct pwm_chip *chip, const struct of_phandle_args *args)
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8acd60b53f58..95ae885f65c3 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -405,6 +405,8 @@ void pwmchip_remove(struct pwm_chip *chip);
 int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
 #define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
 
+struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
+					 unsigned int index, const char *label);
 struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *chip,
 		const struct of_phandle_args *args);
 struct pwm_device *of_pwm_single_xlate(struct pwm_chip *chip,
@@ -504,6 +506,14 @@ static inline void pwm_put(struct pwm_device *pwm)
 	might_sleep();
 }
 
+static inline struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
+						       unsigned int index,
+						       const char *label)
+{
+	might_sleep();
+	return ERR_PTR(-ENODEV);
+}
+
 static inline struct pwm_device *devm_pwm_get(struct device *dev,
 					      const char *consumer)
 {
-- 
2.25.1


