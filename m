Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91962C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=weznhsdlOq6RIl6RLEBM2onzEOR0sehn1VqOBbe70/Q=; b=uVAD9Atdoa7hAmvFONv0HSPliP
	rY+KEcZugMhxtabgahjeuAhhQdfdaFvwBqx5v/8mPP1M/XBc7X64/Jda1DoJ3PnFRm3FzYHf8iv6O
	1rZ3TKfhrPYwSan86Hpch5kRsPc2m5bghkGhob3jwG+jIBk7NR9u6/VINhFH0mbzS+6oc3pBdZxQE
	OE6C1mRoO+uglqw782pA41ISbsu7NC2/KBQQ/4jKASXaXrRl59avsi2HxahB6c6YPB5W0y9prhRk7
	0//Y8MKy1T0PQg9EOJ1p/gi5NlOzuACzWxEnQOqEdo/gioGqJx8x3+Sp5zPnwWbEGn/jFsJ6zcknY
	0Lg6IaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZrK-00000009uqw-14Vo;
	Thu, 24 Sep 2026 03:10:54 +0000
Received: from mail-oa2-x09.google.com ([2607:f8b0:4864:30::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZrH-00000009ups-31Fc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 03:10:53 +0000
Received: by mail-oa2-x09.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so740006fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219450; x=1790824250; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=weznhsdlOq6RIl6RLEBM2onzEOR0sehn1VqOBbe70/Q=;
        b=hIqaHFl8tp+tW2oTYpeimt1q57KcFh8eg9D4SP/ChRpIfSgK28kz8p7cCNlWycCs+N
         Qwe6kddWgLMZGwKcfBrvkxfz4X7OninvgoyudJ63g6S9h5xwvcdACb4sZD+P1zdiviW4
         sIukXMYVT9vzrxIv/ZVQLxxOzxzShWj68oRYRi6KPhMTFEf8kx7kOvDlsjaaudbFbZRV
         DshpGi0wVh1STUKklFmid1OgO+kTnSeRvr9Zlnt340DxqNEo58+qvFTqugpuXz9ehhNc
         mYkjtQboV1orLPyZAMyshDH8+1TFi2CfFJEVLBF5+/0ZbubTIKcpl5mAl00RrmmfDkxx
         OFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219450; x=1790824250;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=weznhsdlOq6RIl6RLEBM2onzEOR0sehn1VqOBbe70/Q=;
        b=Oi7vmem8FRIZY4jmyIUlliQh2sufgB/2hzD+Lpifnwy3cWWJRZPvn3zkDKsY1V+ZQM
         90Ai15jMDlyMEmsrGu95cIOcmUnhtnCVbBjJSu1BQqm0EYV4a9+ww9Jhf+PT/hr1pIHS
         TKQ4/OLG/VfYN6RN5NcrYXwTUhKSbTtVwGISPS6kJxoNNpge+SSU01sJvcmSizA/08WD
         bzkBVdXJOwmM1lf9nT/qcA256fEKRClWlyz3BoISzOPZnmqx0VuZ3ASEvrH2uG6/LE5z
         mDRqMk2t2Wdj0RNYEjR/QSpV/XYHi+mojGHnEXieWVhEp7a8YMM1ks5NmmmMQWjPIfiI
         hg9g==
X-Forwarded-Encrypted: i=1; AKwUvBwKd3as9dnOCAr2Qz4Edv3o8lv801zkVCv8hiKdu5VIcAFcpZcfaNqC1qZpxUqR+ItQ0wqByjtc0Zhs1LWQe+7b@lists.infradead.org
X-Gm-Message-State: AFuF++mJYhExFHi2/BQDcfnSUL3Fjj+GzGTmnicAKp3XzsExYxz8tppd
	UnkULwJkalhX5kLoxUs41wgvjLYhGLz2JsA+95wVLFFeZJSVXbNtoLn5
X-Gm-Gg: AYBFou1bO1cUW6HJ3otG44xW9uNzWwd17H16ilIHamOs+oE3B9Bxs1a7u0tPojxSlJo
	MjDQolVxAPFuDyOdyViFTx5n1VVOZVVIgoZQSP+r4UeXCJFSTKAEfGJVVTMDTu4IUGTJ4ffJx89
	TzMgnycMnLt8Mv+ODFrX0UIPVZ07OhfR+z7AVEXxUFzwWBwZwqccrcq9THgRC7VtIH2FcLOUqpC
	nqzH7L2Caz+NoUGGFXFyXcpt8k1Zf5bNjsHiYoV8GhpNhGsjsAnAyGv1XrXbhoa7sqUS21b27ut
	0bg+m1gwsyF/q9i03Byg2flQ0VRj2cgr9e+HYWRb1tqvm3w+87AJ8J8dFJn9kfOXC9I95wdhcRX
	KZjaBW2nX3lrSTTfdDyVTeVwxQEeQ4HkIE2V9fi8Y1VwmMih11OCoKEgHmwYv+tjJvVGd1hUYii
	hzQqVcuYXRQnWyYcpd5yewl/I4kwqZv4k32SFYk3nBSpnx7ERRTMi4DhvKYA5suGXA5Q==
X-Received: by 2002:a05:6808:c187:b0:4b9:e6ab:d07a with SMTP id 5614622812f47-4d72cb39b25mr1219299b6e.26.1790219449792;
        Wed, 23 Sep 2026 20:10:49 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4bf8e14sm3893842b6e.14.2026.09.23.20.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:10:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 23 Sep 2026 22:10:41 -0500
Subject: [PATCH] watchdog: mediatek: Apply the driver's mode to a watchdog
 left running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBA0auQWTsJ1kipVzEsih1woi1kplUj4
 e42Lt/m/w2UhEnh0mwg9GLlJVUcDw3c7j7NhByqwbSma505oYxSCLXQF8uqWchHTjPG/MB3yBi
 Kf2JcAmFnzz3ZsbduclBzq9DEn//qOuz7D4S6ytZ6AAAA
X-Change-ID: 20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-6758e7b879f9
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "freddy.hsin" <freddy.hsin@mediatek.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790219446; l=4049;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Wv/Q/eibR9/8UNWYWEXMi5HVbkom6Ngkl4aD5jL1RW8=;
 b=u/GAfKCmgfS6yqJtSJBYgi0CdZm5MqDZ1SAsZGK9ZcrBpAZEMAT3l9eouuHXlc8qWODTBEB1Q
 XFRXWn46T0VArMVB7GfAKkxDnqc11EQrfVB1wPFyafDxWf9KgzaTvYJ
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_201051_778019_0D0E9640 
X-CRM114-Status: GOOD (  19.83  )
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

When the bootloader leaves the watchdog enabled, probe only marks it
running and sets the timeout, so WDT_MODE keeps whatever the bootloader
wrote. The Amazon Fire HD 10 (2017) bootloader leaves dual mode with the
bark IRQ enabled, and no pretimeout is configured, so each timeout only
raises the IRQ and restarts the count: with the 20 s timeout systemd
sets, a hung system was reset after 37.95-39.76 s, and after 18.25-20.92 s
once IRQ_EN was cleared by hand.

Program the mode as mtk_wdt_start() does, which also applies
mediatek,disable-extrst and mediatek,reset-by-toprgu to a running
watchdog; read those two properties first.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on an Amazon Fire HD 10 (2017), an MT8173 board that is not upstream
yet. Its watchdog node has no interrupt, so no pretimeout is set up. The
timings in the commit message were taken from the host side of the USB
link; with this patch a hung reboot resets after 18.35-18.45 s (n=3).

It is based on v7.3-rc4 but it also applies cleanly to watchdog-next,
where "watchdog: mediatek: acknowledge pretimeout interrupt" moves
spin_lock_init() ahead of mtk_wdt_init(), so calling mtk_wdt_start() from
there is safe on both.
---
 drivers/watchdog/mtk_wdt.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..b12ea113b63e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -285,19 +285,6 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
-static void mtk_wdt_init(struct watchdog_device *wdt_dev)
-{
-	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
-	void __iomem *wdt_base;
-
-	wdt_base = mtk_wdt->wdt_base;
-
-	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
-		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
-		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
-	}
-}
-
 static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
@@ -338,6 +325,24 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static void mtk_wdt_init(struct watchdog_device *wdt_dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base;
+
+	wdt_base = mtk_wdt->wdt_base;
+
+	/*
+	 * The bootloader may have left it in dual mode, where a timeout only
+	 * raises the bark IRQ and the reset comes one timeout later. Apply
+	 * this driver's mode instead, as mtk_wdt_start() does.
+	 */
+	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
+		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+		mtk_wdt_start(wdt_dev);
+	}
+}
+
 static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
@@ -440,6 +445,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
 
+	mtk_wdt->disable_wdt_extrst =
+		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
+
+	mtk_wdt->reset_by_toprgu =
+		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
+
 	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
@@ -460,12 +471,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
-	mtk_wdt->disable_wdt_extrst =
-		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
-
-	mtk_wdt->reset_by_toprgu =
-		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
-
 	return 0;
 }
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-6758e7b879f9

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


