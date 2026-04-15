Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBEBF41982
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3b8a9yRsPwuBMnRE7k+9xNpDjqVfRCXwrD7bmNetW0=; b=N9ed/7zI4WENzgKrMunIs6OaYC
	aomsn0AwtOYFoG+WIFcVKzk0MBB/P3j/pG8utqnIY4TnVRpUmIN++2sRzHK0xXtsyqRwwscYj/JCP
	TkZ+4mTpM2dMXaYl9Ut8NrNI69EUFt5Y8low5qDUDXgNp+NYIfbW0yMVFLtW154fOMy0sQL9BDI+7
	wvRZdwuZim4hHI6DNteWjodzfoyDOAGnDm+e1buubqPLo3kFus0hqsJN/5CCmvqTBzG/e+W576Yaq
	kd9qZKUP5haK3gknmn8+CeJFJZNNPgDjABe+9tUHsBxXGLNIYl3Abg6tvQYuaK5xrZnoRIv8XyW06
	4z0Em2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwe8-00000000unv-3UHR;
	Wed, 15 Apr 2026 09:34:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwe4-00000000unZ-0xFT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 09:34:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad9a9be502so40088655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1776245688; x=1776850488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3b8a9yRsPwuBMnRE7k+9xNpDjqVfRCXwrD7bmNetW0=;
        b=l7FycanPQF7t78H1VC4vF0Gilb9U+IGIkmLfgxXO2VjkSzDnpScWvJwQRKeVPcu9JE
         UnfZq4Z+yk+dehHBRpyZkkWyFh8wPIiQYulGJDb2Kt8Gb76U84f5kSTkF8osa1fzjDaO
         Qj4Egh+g9DYvBBAb6vZdoUUJg0Etv7THL3/Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245688; x=1776850488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3b8a9yRsPwuBMnRE7k+9xNpDjqVfRCXwrD7bmNetW0=;
        b=doC7gvaMp2tEvvGpKnOsRwfrcHWFyR6rF0du9klyVmHnSqgpv+KBy5JZEu7Tw/hIut
         fCrflkY44jtfcSEijfTgb0CprXYD8F2EYBUX6E+SmmrAGw+DWV5XuAfhGFdK8Ix8l4Vb
         BnqJUBYAsW7adYt6QstO82DLd60lVxm4J/36VdLMtDf2WU90al27qFq9SmSmwtI6F/yR
         ApZjgOGcCUCNRhHvufE2mAI9+k/tZQxxJrrRm2w8pn8d9qgfKQj+UyE8/gPPNVYNpaYh
         P+p0wbM8d7qabwpoVMkSD/sExD3+AxDbQVpCoJYG5vaTn0CXXro5GWXFsLK9puknAJfF
         FLuw==
X-Forwarded-Encrypted: i=1; AFNElJ9kviT7SQ+bphy7N7dqQiIxdkqcDy/l+8As2B77L97vQPr8pm1buwVjx33/J7JzFsW8nbQ9sGGKRMikqxUxtvrz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Di5wAFctA3r8Tg2AOhGP73RKbRJpsnJZaTKnTuDsQry7rTOn
	TQBbSCADyF5reLhQobI2BH2n9+3XeYGhoudzu0oLIPe9kWRATFESw7wZhNVLhyWnWx8=
X-Gm-Gg: AeBDieuQE6nFrEn34dxUKcQStD9nYPQTTZEnif3+9UjAWVtXC96xqY84mrTS4bzQcvS
	wv5ipynaJjriyi55ay9FukKmsAQHYb1j9Q+jZt1Hu2D+cQzZGcojVrPQUHcyHFfHl1e7RFhO9ja
	Dl33cRXIWvIsqWI6X24v2NAfjR/IsgoAjh5yho6fUK3fjSpvxKqUC9VYyCwtzsDIn7UbYuNjYeB
	1l+pHXCmCx9I7D8yrzzS3B5XuI5pDrgS09xGLhxWxkZogLNq9BmymrkhI2kJQzgHzdGVbydyS3W
	JfG8PIF9W8qPRWmtMI+AnzZDEC+b885o3XOqHMYoPOW3UB0UT3D6GhzsgV8zGQ2sReW/nnxLw8/
	/u+AJih56jXGuwsEP9qaGs5OCpxVh6lDnS715RegT9IXN/0FIwlZToppTX7BWhYJaXU3fboVqU8
	SjkcPMmu4+Ynfbxv271dwjtQW9dqEBuTS9dfnR93o/zULeSgQqFYcAP4qPtGFsachpmcUpfyxHg
	rPDW5IH
X-Received: by 2002:a17:902:d507:b0:2b4:5cd0:b6c3 with SMTP id d9443c01a7336-2b45cd0bb63mr148252015ad.29.1776245688376;
        Wed, 15 Apr 2026 02:34:48 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e1b7sm15311575ad.49.2026.04.15.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:34:47 -0700 (PDT)
From: Sangyun Kim <sangyun.kim@snu.ac.kr>
To: ukleinek@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: atmel-tcb: Fix sleeping function called from invalid context
Date: Wed, 15 Apr 2026 18:34:33 +0900
Message-Id: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_023452_627548_21DB2268 
X-CRM114-Status: GOOD (  13.94  )
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

atmel_tcb_pwm_apply() holds tcbpwmc->lock as a spinlock via
guard(spinlock)() and then calls atmel_tcb_pwm_config(), which calls
clk_get_rate() twice. clk_get_rate() acquires clk_prepare_lock (a
mutex), so this is a sleep-in-atomic-context violation.

On CONFIG_DEBUG_ATOMIC_SLEEP kernels every pwm_apply_state() that
enables or reconfigures the PWM triggers a "BUG: sleeping function
called from invalid context" warning.

All callers of tcbpwmc->lock (the .request and .apply callbacks) run in
process context and only need mutual exclusion against each other, so
use a mutex instead of a spinlock and allow the sleeping calls inside
atmel_tcb_pwm_config().

Fixes: 37f7707077f5 ("pwm: atmel-tcb: Fix race condition and convert to guards")
Signed-off-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
---
 drivers/pwm/pwm-atmel-tcb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index f9ff78ba122d..6405e82d9f10 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -17,6 +17,7 @@
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
@@ -47,7 +48,7 @@ struct atmel_tcb_channel {
 };
 
 struct atmel_tcb_pwm_chip {
-	spinlock_t lock;
+	struct mutex lock;
 	u8 channel;
 	u8 width;
 	struct regmap *regmap;
@@ -81,7 +82,7 @@ static int atmel_tcb_pwm_request(struct pwm_chip *chip,
 	tcbpwm->period = 0;
 	tcbpwm->div = 0;
 
-	guard(spinlock)(&tcbpwmc->lock);
+	guard(mutex)(&tcbpwmc->lock);
 
 	regmap_read(tcbpwmc->regmap, ATMEL_TC_REG(tcbpwmc->channel, CMR), &cmr);
 	/*
@@ -335,7 +336,7 @@ static int atmel_tcb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int duty_cycle, period;
 	int ret;
 
-	guard(spinlock)(&tcbpwmc->lock);
+	guard(mutex)(&tcbpwmc->lock);
 
 	if (!state->enabled) {
 		atmel_tcb_pwm_disable(chip, pwm, state->polarity);
@@ -438,7 +439,7 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
 	if (err)
 		goto err_gclk;
 
-	spin_lock_init(&tcbpwmc->lock);
+	mutex_init(&tcbpwmc->lock);
 
 	err = pwmchip_add(chip);
 	if (err < 0)
-- 
2.34.1

