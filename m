Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=; b=VDTaUsHQjYq+wKfPwFfwB0vH7T
	MFMxI6pLBVkn6agCeLoH1K3qhCuY6SnD2oxbS959EF5JJ39D/nfyXIX7wqjjMpwbgYel/rI0mLaoN
	M0adIUMXjy9OVVBbkr528eSLse55VQ6uosfyqumDAus7huF1mKfHB9zxnKhurtXrJRNn3AVZ1arGd
	GDPRnjhCI8CtmP1LlpgquppjsKRwVAWepIlt8mM1thSRXdPvocDio+G39QnAxA0wS5fWl5Z5Arfke
	35h7M8II5OZC6WiZwWubZh5oXM3riMY/mKt6h5A/fOHxcW0ZAzAdch/bU0xvp/qEQDnoCQMgSgVo6
	HupTLXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirD-000000008Mx-3V98;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir8-000000008IG-3F2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3408462a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632430; x=1788237230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=FIWVfFyZMm7ZCFtyLOnx2wR/EHrq7zDwUMLQV8ybkWKII0bbYSfz0M8zUhkoeZ0Rks
         ZY48moS3+AJjR/g2GEEUv5bHltHNhhpt25Q2fwxcMPB7vXm9fG0XHtN0IH+mQkJiRCn2
         lki5+JFG2er/Poio0/GB8A2p9NqlayoY7HwEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632430; x=1788237230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=Vv9CnBCE1nlesb+JlSpHlIFjuaBpQVQ/1J6HfXzkrIHePVNxU5RHN6/ttM2GveyBh7
         My8n/Vh7sbnPQUriV2CZAeIP25DfPSH4y5zHQyHsLQQB5gqCjbafjBQcO1kllkngn6u+
         A3Wg9TVZdJfY7nUN3LX59ePBqmCsW3PwR4RGGOAXoO6Ceioh4S5VW6CfgrrbtIjEgCB0
         OUAsXLapuWxA9/q5PpDPNRX5s8fzVrYnhrQk2cKANShPdylKklFDkon2M4ZtRFBA+HNm
         rBDv59hAcKF3ZeoN8TPUJrTfsBbojYBp4k+A2mTuzgUQHtfPX1q9UFA5a19SI3gLxXcN
         o36g==
X-Forwarded-Encrypted: i=1; AHgh+RoyTNA/8xYk3KdJwdTAgBODmuaXInUY6DNKiMZnYBlwfMPAI9wJkaikSyudUFADlNJ8X7VYhaM6gwm03MCRLhbd@lists.infradead.org
X-Gm-Message-State: AFuF++l9EoT2VUo137Hcr/Sht4A49oIGtl6aDxH207yKVs7oNOQICebE
	ajT1eSmkZT/TyXt5hyki+Z6evfB2cfa3Fiv9lkm9spBn4tdW3djFhArCYh4/wmbvuA==
X-Gm-Gg: AR+sD10VfvVmFqAKzDDcYmrrPZDfw/QsJMBMd06vIbfbUpbZz/Sj0+vofaxJCSAf7Si
	m5hufEfd41sh4RvVonTqVH7kxXEhZG1V36ocOl5lE5bXoAnE7CkqFi86VrDCI/lKbX36mDSt/xw
	zh92+B00Bo6tVcGCgYuLV+0H1q+mnZzu17ud2MnPuWIcpEtpMfGko8/0f7B7+R48oUIf7vd6YxU
	pjluHtEDSTfVClOnnwVkzhvIOix1+A2JTlbLTrrfFsSBcKrL/PSxxwIOUYPx7/2Szs+R68CQKes
	l2fjPtVLzevvHYaNyoj9Mq5+vuHBjquhIqNaVfFb+y1yr8AI3VWbNnk5ctmIlKoPewq/gVy3fJM
	IEeeeRf1WTBqTL4M9OtUgzM9/BBxwPN2upWvBSw1B7km3xcVv/hjESNHx+RSzh07u5YvFgLk7+g
	mEahbFSVkc/kjdn61cGKqXhAAlmBTQE7LE4DYMHJO3qH45uAkK6f+bpwUIHCEypuzSwx5MrP9h3
	04VOELnyHLZwi4i1h6zbvLZ7POI/1HKHcg2lbGgd9I6BHQ=
X-Received: by 2002:a17:90b:280a:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-395dee56103mr48478004a91.1.1787632429764;
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 25 Aug 2026 12:16:23 +0800
Message-ID: <20260825041628.988369-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213352_345851_A7EA051F 
X-CRM114-Status: GOOD (  22.50  )
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

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..68c929b16b06 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -235,11 +235,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
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
@@ -356,7 +368,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -401,7 +413,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.860.g4b6b3295ed-goog


