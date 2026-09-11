Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E8C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7Qx43bG49fe/sQM/Uno0+GUNPMxqPw+3RuQb5XIhZY=; b=oZXQAud4yWeHWyeS2dN9Vkf06o
	it7Zfx6ffb/+SL6QXSF9bjwoi6VSYKz8NVkyguPvJYzp55QqWXYY7B09rwOatAHmpOAosKT2KD08K
	VCpoGves/L19pdX5oVkssQQQzG0H0XySNWFRFemOgrOlPGKRQ5CXT3ELyovUXHhB0bINoY58g9GsQ
	jl2EGqbV/TicZVbTJREJNdOxM0yw0/LX36toRwm1IKZKWwVdIMTAj6V2XFQOOmoDFJX1BcGvyQXfl
	LHXsyK2SuERuGRykib0bGdMG3clHmySsX9v1kEZy6GwydlJ9wbJnZf2pXceO0Y8VSHbf+9W146eF0
	ACj3mAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wLN-0000000G6HG-2kFo;
	Fri, 11 Sep 2026 08:10:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wLL-0000000G6GR-0Gsl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:10:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2dd020a2e44so5970715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789114242; x=1789719042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7Qx43bG49fe/sQM/Uno0+GUNPMxqPw+3RuQb5XIhZY=;
        b=BZ0cwGOO3ipE2D7NGZ+95zZwfdEcW4mDREUIEr59ir08OJWO+zvJI1rOt5zfy3wbbf
         /6Ip34i9tRC/Bl6O95cq7BK4pmv7gpDBbMbG7uO57dMBPyEWLOKaLo+XSCsR8EMWbZLz
         HnYPWEOnkVc/0PsiznrDPO8UES/CL4nas0h/biDAmEY235dF7I716Nh9wxpqaUlVlybh
         bxA3Jauv2kF/IwpxulscApOboDeOtJ4IA98Zj1RU+Thxux3d6+qhWgPk9mJsyHFotsJh
         fLRSSsJ2N2509NAxqE/tmmolbb0qkdxVxPHjyrFsVUyQ9j2sp//qeJSTAhoWYNV0r5OH
         A+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114242; x=1789719042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7Qx43bG49fe/sQM/Uno0+GUNPMxqPw+3RuQb5XIhZY=;
        b=gov8mOb6S9q+5WrsWE9cNUd6K1TDUOnWdBylS8+vvGtz9qoDB01Tk3OT8ISKOlflvd
         mKsJDA612Ww9EWlzbNa/nP1ChoYtaQaM18KYRd9Uf+arV3BMijyu2NLvDf4CUZ6p+mgz
         +D40Mvq5gAmKTw+RoHK33nXVHlJgwOUTalFjrYK4T0GakiOtn7RY0UwOzsts6PIiWPQV
         KkN47hvlyzn7Sd0auUqF/LhfNtXBlp4qbKQS2ES8JiBuYGNk9QZM+tVK6FdfVrew+VBR
         qjWIpPoknAQaTvqwUO7NT+78N1D9z1OUoZblbbhS/FA+x+Ho+eIwGNXHf266Evybvy+M
         HYgA==
X-Forwarded-Encrypted: i=1; AKwUvBxbIJoQRWqIhVuLsh+tFJoQCaimEn1GE1rzhdWIg/l0irazAMiWkOr2gBLHs9kXMQ5nMeVHEA/yG/WMRONVSUQg@lists.infradead.org
X-Gm-Message-State: AFuF++mCpfb11Pa++hd6Au0Zb8tMvOw9KsBy2l1Khfe1ChGxcqPJW0f0
	0y5I9LaDFq1OpktrYX3xUg5pHABAb7vDXzVbc8GbDEq68aBLm0FxmJs=
X-Gm-Gg: AYBFou3p87mvGuG/6YN9QYPtf+WSjc0oUsprmv87IyS6LJ4rcrzLSGCn74pVAxXSBz7
	iRKgKnk0V60lOg/SilJceEc36iS1IitWHMc0sU6x60XFnUTN37Y6jBmJZvOTRXEkcMeRtdzO1cD
	8ADHYJM5Q8JIJTQcmyLfEcQAe5/gY3jxOkEL8eVXkgoNnlzglN+jdDS4GdbEOioK/BK9KnF5GU7
	s01YBhEVAXuBvG8U5luNjUgWy2XRVGdPfNbRG4PMHDW58meiKx3puQc9I3v/XQILAR94tsY4dyh
	INjgiZLlrmBBYmRBfwnKObi0gtLQTAbfMNy6lWFxh1NDpqlB892QPQverGs88JIzPTpD4Xk8v/H
	sGfJ5bHBD3S0dhLWxry4dt6KrTt9+umwsOXffLEdKdDIPkI5PPz0dTBBxgcEp1XxCLB+jNdBvZY
	OIAyNU6UOw4sOBK5fgw909vkZgQQB20GrAgm1I/nBoTToyMtfUlMIB+8TP8pqjwZNPOwbm72qz0
	mbpN9Ix+vez
X-Received: by 2002:a17:90b:3c89:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39d9c35047emr5120013a91.21.1789114241653;
        Fri, 11 Sep 2026 01:10:41 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm3514967a91.8.2026.09.11.01.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:10:40 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2 RESEND] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 11 Sep 2026 15:10:22 +0700
Message-ID: <20260911081022.3475479-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011043_118716_842C49A7 
X-CRM114-Status: GOOD (  15.64  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr().

This allows us to drop the __maybe_unused annotations from PM callbacks.
This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Change commit message prefix from "drivers/mfd: " to "mfd: ".
- Wrap to 75 ish chars for commit messages.

Link to v1: https://lore.kernel.org/all/20260821092508.324787-1-triet.hoang.dev@gmail.com/
Link to v2: https://lore.kernel.org/all/20260829050228.42638-1-triet.hoang.dev@gmail.com/
---
 drivers/mfd/iqs62x.c           | 8 ++++----
 drivers/mfd/max77843.c         | 8 ++++----
 drivers/mfd/mt6360-core.c      | 8 ++++----
 drivers/mfd/rk8xx-i2c.c        | 4 ++--
 drivers/mfd/rn5t618.c          | 8 ++++----
 drivers/mfd/ti_am335x_tscadc.c | 8 ++++----
 drivers/mfd/tps6586x.c         | 8 ++++----
 drivers/mfd/twl-core.c         | 8 ++++----
 8 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
index ee017617d1d1..bea1ebdca9e7 100644
--- a/drivers/mfd/iqs62x.c
+++ b/drivers/mfd/iqs62x.c
@@ -1015,7 +1015,7 @@ static void iqs62x_remove(struct i2c_client *client)
 	wait_for_completion(&iqs62x->fw_done);
 }
 
-static int __maybe_unused iqs62x_suspend(struct device *dev)
+static int iqs62x_suspend(struct device *dev)
 {
 	struct iqs62x_core *iqs62x = dev_get_drvdata(dev);
 	int ret;
@@ -1036,7 +1036,7 @@ static int __maybe_unused iqs62x_suspend(struct device *dev)
 				  IQS62X_PWR_SETTINGS_PWR_MODE_HALT);
 }
 
-static int __maybe_unused iqs62x_resume(struct device *dev)
+static int iqs62x_resume(struct device *dev)
 {
 	struct iqs62x_core *iqs62x = dev_get_drvdata(dev);
 	int ret;
@@ -1051,7 +1051,7 @@ static int __maybe_unused iqs62x_resume(struct device *dev)
 				  IQS62X_PWR_SETTINGS_DIS_AUTO, 0);
 }
 
-static SIMPLE_DEV_PM_OPS(iqs62x_pm, iqs62x_suspend, iqs62x_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(iqs62x_pm, iqs62x_suspend, iqs62x_resume);
 
 static const struct of_device_id iqs62x_of_match[] = {
 	{ .compatible = "azoteq,iqs620a" },
@@ -1067,7 +1067,7 @@ static struct i2c_driver iqs62x_i2c_driver = {
 	.driver = {
 		.name = "iqs62x",
 		.of_match_table = iqs62x_of_match,
-		.pm = &iqs62x_pm,
+		.pm = pm_sleep_ptr(&iqs62x_pm),
 	},
 	.probe = iqs62x_probe,
 	.remove = iqs62x_remove,
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 2a48577b1a79..9ae6715642ae 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -173,7 +173,7 @@ static const struct i2c_device_id max77843_id[] = {
 	{ },
 };
 
-static int __maybe_unused max77843_suspend(struct device *dev)
+static int max77843_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
@@ -185,7 +185,7 @@ static int __maybe_unused max77843_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max77843_resume(struct device *dev)
+static int max77843_resume(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
@@ -197,12 +197,12 @@ static int __maybe_unused max77843_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max77843_pm, max77843_suspend, max77843_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max77843_pm, max77843_suspend, max77843_resume);
 
 static struct i2c_driver max77843_i2c_driver = {
 	.driver	= {
 		.name = "max77843",
-		.pm = &max77843_pm,
+		.pm = pm_sleep_ptr(&max77843_pm),
 		.of_match_table = max77843_dt_match,
 		.suppress_bind_attrs = true,
 	},
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..8a97c30cad3f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -583,7 +583,7 @@ static int mt6360_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mt6360_suspend(struct device *dev)
+static int mt6360_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 
@@ -593,7 +593,7 @@ static int __maybe_unused mt6360_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt6360_resume(struct device *dev)
+static int mt6360_resume(struct device *dev)
 {
 
 	struct i2c_client *i2c = to_i2c_client(dev);
@@ -604,7 +604,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
 static const struct of_device_id __maybe_unused mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
@@ -615,7 +615,7 @@ MODULE_DEVICE_TABLE(of, mt6360_of_id);
 static struct i2c_driver mt6360_driver = {
 	.driver = {
 		.name = "mt6360",
-		.pm = &mt6360_pm_ops,
+		.pm = pm_sleep_ptr(&mt6360_pm_ops),
 		.of_match_table = of_match_ptr(mt6360_of_id),
 	},
 	.probe = mt6360_probe,
diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
index 2951b2911a37..161b25fbe146 100644
--- a/drivers/mfd/rk8xx-i2c.c
+++ b/drivers/mfd/rk8xx-i2c.c
@@ -251,7 +251,7 @@ static void rk8xx_i2c_shutdown(struct i2c_client *client)
 	rk8xx_shutdown(&client->dev);
 }
 
-static SIMPLE_DEV_PM_OPS(rk8xx_i2c_pm_ops, rk8xx_suspend, rk8xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_i2c_pm_ops, rk8xx_suspend, rk8xx_resume);
 
 static const struct of_device_id rk8xx_i2c_of_match[] = {
 	{ .compatible = "rockchip,rk801", .data = &rk801_data },
@@ -270,7 +270,7 @@ static struct i2c_driver rk8xx_i2c_driver = {
 	.driver = {
 		.name = "rk8xx-i2c",
 		.of_match_table = rk8xx_i2c_of_match,
-		.pm = &rk8xx_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&rk8xx_i2c_pm_ops),
 	},
 	.probe = rk8xx_i2c_probe,
 	.shutdown  = rk8xx_i2c_shutdown,
diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 23ca00d2c624..8c68dd16bb9e 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -243,7 +243,7 @@ static void rn5t618_i2c_remove(struct i2c_client *i2c)
 	unregister_restart_handler(&rn5t618_restart_handler);
 }
 
-static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
+static int rn5t618_i2c_suspend(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
 
@@ -253,7 +253,7 @@ static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
+static int rn5t618_i2c_resume(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
 
@@ -263,7 +263,7 @@ static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
 			rn5t618_i2c_suspend,
 			rn5t618_i2c_resume);
 
@@ -271,7 +271,7 @@ static struct i2c_driver rn5t618_i2c_driver = {
 	.driver = {
 		.name = "rn5t618",
 		.of_match_table = rn5t618_of_match,
-		.pm = &rn5t618_i2c_dev_pm_ops,
+		.pm = pm_sleep_ptr(&rn5t618_i2c_dev_pm_ops),
 	},
 	.probe = rn5t618_i2c_probe,
 	.remove = rn5t618_i2c_remove,
diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 068c25401c6c..81f07a1d780c 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -313,7 +313,7 @@ static int __maybe_unused ti_tscadc_can_wakeup(struct device *dev, void *data)
 	return device_may_wakeup(dev);
 }
 
-static int __maybe_unused tscadc_suspend(struct device *dev)
+static int tscadc_suspend(struct device *dev)
 {
 	struct ti_tscadc_dev *tscadc = dev_get_drvdata(dev);
 
@@ -331,7 +331,7 @@ static int __maybe_unused tscadc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tscadc_resume(struct device *dev)
+static int tscadc_resume(struct device *dev)
 {
 	struct ti_tscadc_dev *tscadc = dev_get_drvdata(dev);
 
@@ -345,7 +345,7 @@ static int __maybe_unused tscadc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tscadc_pm_ops, tscadc_suspend, tscadc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tscadc_pm_ops, tscadc_suspend, tscadc_resume);
 
 static const struct ti_tscadc_data tscdata = {
 	.adc_feature_name = "TI-am335x-adc",
@@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, ti_tscadc_dt_ids);
 static struct platform_driver ti_tscadc_driver = {
 	.driver = {
 		.name   = "ti_am3359-tscadc",
-		.pm	= &tscadc_pm_ops,
+		.pm	= pm_sleep_ptr(&tscadc_pm_ops),
 		.of_match_table = ti_tscadc_dt_ids,
 	},
 	.probe	= ti_tscadc_probe,
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 3cfd2f02b62f..600186b1e8cb 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -618,7 +618,7 @@ static void tps6586x_i2c_remove(struct i2c_client *client)
 		free_irq(client->irq, tps6586x);
 }
 
-static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
+static int tps6586x_i2c_suspend(struct device *dev)
 {
 	struct tps6586x *tps6586x = dev_get_drvdata(dev);
 
@@ -628,7 +628,7 @@ static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tps6586x_i2c_resume(struct device *dev)
+static int tps6586x_i2c_resume(struct device *dev)
 {
 	struct tps6586x *tps6586x = dev_get_drvdata(dev);
 
@@ -638,7 +638,7 @@ static int __maybe_unused tps6586x_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
 			 tps6586x_i2c_resume);
 
 static const struct i2c_device_id tps6586x_id_table[] = {
@@ -651,7 +651,7 @@ static struct i2c_driver tps6586x_driver = {
 	.driver	= {
 		.name	= "tps6586x",
 		.of_match_table = of_match_ptr(tps6586x_of_match),
-		.pm	= &tps6586x_pm_ops,
+		.pm	= pm_sleep_ptr(&tps6586x_pm_ops),
 	},
 	.probe		= tps6586x_i2c_probe,
 	.remove		= tps6586x_i2c_remove,
diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c024a28b057e..b7d749208131 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -903,7 +903,7 @@ twl_probe(struct i2c_client *client)
 	return status;
 }
 
-static int __maybe_unused twl_suspend(struct device *dev)
+static int twl_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -913,7 +913,7 @@ static int __maybe_unused twl_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused twl_resume(struct device *dev)
+static int twl_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -923,7 +923,7 @@ static int __maybe_unused twl_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
 
 static const struct i2c_device_id twl_ids[] = {
 	{ "twl4030", TWL4030_VAUX2 },	/* "Triton 2" */
@@ -942,7 +942,7 @@ static const struct i2c_device_id twl_ids[] = {
 /* One Client Driver , 4 Clients */
 static struct i2c_driver twl_driver = {
 	.driver.name	= DRIVER_NAME,
-	.driver.pm	= &twl_dev_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&twl_dev_pm_ops),
 	.id_table	= twl_ids,
 	.probe		= twl_probe,
 	.remove		= twl_remove,
-- 
2.53.0


