Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD6C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=; b=mp9Sbwdt78/IAnxs89M3J5druo
	G7c1OPCSubt+bhi3T+omKaUdFdCWtjAzBcJvCSccvBPU1sGbA/xfIZ/dXJAM0jnmrM4F+I/df8SVq
	xi5EfD8IrZFfQBKphsPloNF8iAGFYyFfl+WYj0evIzRpFCO5A+khUwP4EscaYJRg0InyTugV4GaSb
	nB7TM7+bhPsG+iveP20iNTxJilhW+Y+NOLXNdamC6pzpNTNvA/y+vZBhRoZKAeofhtvN40xEeFDfd
	j6AAhGpe4LHgKzjn0HO0e/SGLARsSZMrcV/xtvGDrSKNzmLcV2T1Mlqh37y6N8bC26MNItyufDIrC
	4Kkgjw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVP-00000006rqu-1Ls2;
	Fri, 03 Jul 2026 11:56:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVM-00000006rnc-4BGM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caa57a41cdso4802615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079784; x=1783684584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=KJtc85R+Yh1VXlJb3Se0mBaqW408bSUxIolAg4OZwrF+1AOHN7wuNmLMEXsY/C/fYn
         XIQ84UXHJqzKivc5KKonIkn79OzpxK+vyqh/CZkXteIe4dgKgji8rm/0EdvcBnXVee4c
         HH1lbWDLE7jdLnLCeRBoZHqahahVLmoNKa8/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079784; x=1783684584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=outxFoMQ/2aeiCtG14rONiSnYd/x11yyvU46rEWjpyVNcBnydJfMiLfK2tIRz7WQ/q
         Q0fC7TZOOYn5jY3/1BmR8cro5xWgwpIhOwruqrWjyMcRrQDSe3gCA7z8eSA5ZxgR+qGZ
         XIENaEffVJJhLOcpsm+z1SOqgHtI9jwHhtiqE0eVtdL945HuZ3ASLUcylD7iqS/YNtGL
         rYgyOV5ZB600gcZWJSHsk/3VQr4+FiooO0S9ueIUsRtD3cevVSgb74kc7JiVbUxD/h6Z
         0cK/fjk4deQaphy5G4J7CzkSj3L/UrgxXC4kp4/8I6jOp1LXH/AYK8RBci75hOXzUvRG
         /cBw==
X-Forwarded-Encrypted: i=1; AFNElJ/u4xcyDaQXvibtuxb86JaWkpVFIvN3aMEajG5bjvzQkuzINo0fXxPCGvLomseO3Hl2sK2xe/J2JwAUxin9eZqn@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJVpJ/ni3zWGq8Iqfx37ziCujMt4oBDYT+n3QDPzp4kuvuR2+
	Z0QWQtaketqVLDbcpVVrc6aj0mD/UW3FevpwTgYC9rkvtOsesUFHXeL9LC4GLAJvLUqG0U657W4
	TCws=
X-Gm-Gg: AfdE7cm3sqr32aK5QGVb9EHF2C+JxIDVb8umV67/vrUygsiPK5sFl+hTERIJIAIgMOK
	qVB5JY9OPFpzeg5x78zEkCSpJ7qxhkVn+5pKJyAydki3UZ3jOsDRBDkJdiKzKTFIx/wmvCXtY0+
	/27fA2RY65NT1gTaeo2azWOsCvTnaXbl9aRXeaXXid1JwaRRsoZkyK794H2RmmUQTJGYmeJTKsI
	Z/idV9tkK+3NQEgK2omB9+wjKeuVsCAwbAvYOi0Y8l3btD6I8z1/172KB8QFQ8DICHOIM/jwtD0
	VvlVuu6ChWTJO8f4Eu4fqocuhUi0e17sBmhtmB0I4d773GNk872uT0XkawXfnzhfnbVsOHSeBSL
	+Trg1huB30FiF6osg2RP0VN82BwaSY6LBaqIoB3avlRlAA8+tjh7x2QQRobk9zKDdRA7s+RXYZw
	fuX2rSqMzK50Qh4jYOLZRc8Lbah908F/v/bbAeUBOSLLn21Ho5Hw8ty+hsYs3YP+m7RWHbYA==
X-Received: by 2002:a05:6a20:1449:b0:3b4:888f:b3f7 with SMTP id adf61e73a8af0-3bfed474d94mr12242560637.42.1783079783900;
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Fri,  3 Jul 2026 19:55:57 +0800
Message-ID: <20260703115601.1323491-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045625_038280_0F5AFAE7 
X-CRM114-Status: GOOD (  20.65  )
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

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Wait a bit of time before dropping the enable refcount on our end so
that the actual driver has the opportunity to catch and increase the
refcount on their end. The 100 ms delay was arbitrarily chosen.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f274e260353c..17495125467e 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -243,11 +243,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -364,7 +376,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -409,7 +421,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.rc0.799.gd6f94ed593-goog


