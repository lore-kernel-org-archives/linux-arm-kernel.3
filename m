Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C8FEA7192
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 08:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkh8bldvZTdSRdXrrl3UK2Fj0kWohJXGFNjSq2Nw4w4=; b=25mZ48mK95n+E7cfL2TLXiTe3I
	JZf8pxhCR/SUffJArPjhDBGeBpgUg2AP511egETIy8VT2jMwe006ph/0tG0g3uwImtjy1FKPZ/Wad
	zllsWw9EhssokTKYdZ8OAZLV+KqqIr7CrvPXqnW8VOBqUTYmbh/On7cOM/CV3uCPCTfJXn17+7D4Z
	L+T0/wgJdwJ/TwfG/Vw/hQTcSOSHUNthXnzQ+Ea0feMgqrjlfvDG1e2IFyHSGIRHhLFm7dQVMOu4q
	G/CYHiv+f+WBj4sBzFQWCn8NhKeH3V2t3M7Nzmn2SDSxeB2hce1bppLbIfOSHLk2jIf4wo05Rv1JZ
	X/rdfpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEND6-00000005dU2-34uF;
	Sun, 19 Apr 2026 08:08:56 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEND2-00000005dTh-1jc8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 08:08:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c76b6abdb73so1314049a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1776586129; x=1777190929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkh8bldvZTdSRdXrrl3UK2Fj0kWohJXGFNjSq2Nw4w4=;
        b=tY5Yo3tbh/VC3KVEde7mu5WLAypm3pWg8I1y2/jIlFmY2uNTG61IeaN0qw63k43YeS
         2HZ90/oE9VES1se+zG8g85g3JalvvR95pfbM1EYwbqypO9r8ezIfQo9eIOI22Z14Ka/8
         Ui+S9ScBySH+4ckEgsMDYX75CoMi9Z2HapHfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776586129; x=1777190929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkh8bldvZTdSRdXrrl3UK2Fj0kWohJXGFNjSq2Nw4w4=;
        b=agB/7mYppOMueWfvseP3ZtLhnbsk+3s7mZ31nz7LqU8dLDK8k1K8LZrREvASmI6+LE
         9jygloQEHzZeEjtANPm5c18NEyrhO0HVflshFW1CcGBxchrrqzYFVB9sfwL7gTGSP9kS
         02VlIPQ/0fPpFIR/xhuwNeS4nx+FhcXwPXP/QpSrdPplXvZEZGFNoMwdS544HZdw673c
         u5UNYlMwCkAVlS/oHXUMu0y4bPzMW2smqZJ1gsY5xNS/76Vu2FwLgbVjC/uitZD370J+
         /7rKgSEK9IVzrNn3Ttq6GUUFb7H5jaE3f0Nes+yaCr5wiHmoVCeJETH/6O/fmd6G38sx
         Qe5g==
X-Forwarded-Encrypted: i=1; AFNElJ8VrlvuNGvjwS1maxYwReuFdSEEEruoAhcjEkTc9Uf1dehQSnV4ToYHGt+ygE/C5ctg4IMMhHk7KSju/aTECZNN@lists.infradead.org
X-Gm-Message-State: AOJu0YyyFzT2Jq9n8aRRAEtuhmgOHJDgh2QD+rHtBo6IuDrWPVtwDI9+
	Qw/x1lL0hWWcKTnZzmu9AYU6O0VUh1ACd3u1iosqsvVAY/deYCLZPbw9/HLWEn0BYDY=
X-Gm-Gg: AeBDies+dCiqRcST3YQn26A3LmizUxN4hNClJIwZtWZ5A0/bV/rj+UbxdO8SA+xQO5S
	8IeeyLMTvKatS3HzlkugwMtQ/RqnVHzRbMrgfrOvrY8qgsXp1sjksrCUEcEqV3nilRhR/yljFwC
	BE/t32qBIPZ+uIs3MwthAGvhIkHhyhl2oMm6cR9Ej2DJpXhoZNPbwFgHD4hS8eVIphECzeHfYg3
	Fe7T1U9lg8gpm68vfWjToKGMYqqnLlky+lDm1a1esecu2HKi3NUmyuIVSQsotan8nKse+7tVvO5
	jV1rEjs9w15dHixQLn7IOPDxDABTcmyDR1sZtbN0ubefRE3Rb9TQ/v4w8TiIb7A2bVoL2mjSiJJ
	ocnVoaFxdPNP5DwQLvBYBxQcc4nOJSCB7BnYdsb1uKCbjSRlvHTlakPkbjPQHoK8tfobvicQCjP
	l/jP5opQAu23zAJAKCNg5D6nfNKE5fKBye21UeE7p/Wxc4KifwXSVmBpeWXwDXV0O6JSOqww==
X-Received: by 2002:a05:6a20:6a20:b0:39f:24ad:ad00 with SMTP id adf61e73a8af0-3a08d68d780mr10535341637.7.1776586128576;
        Sun, 19 Apr 2026 01:08:48 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3f31sm8583735b3a.37.2026.04.19.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 01:08:48 -0700 (PDT)
From: Sangyun Kim <sangyun.kim@snu.ac.kr>
To: ukleinek@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pwm: atmel-tcb: Cache clock rates and mark chip as atomic
Date: Sun, 19 Apr 2026 17:08:38 +0900
Message-Id: <20260419080838.3192357-1-sangyun.kim@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
References: <20260415093433.2359955-1-sangyun.kim@snu.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_010852_803707_67CB00E1 
X-CRM114-Status: GOOD (  18.14  )
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

Acquire exclusive control over the clock rates with
clk_rate_exclusive_get() at probe time and cache the rates in struct
atmel_tcb_pwm_chip, then read the cached rates from
atmel_tcb_pwm_config(). This keeps the spinlock-based mutual exclusion
introduced in commit 37f7707077f5 ("pwm: atmel-tcb: Fix race condition
and convert to guards") and removes the sleeping calls from the atomic
section.

With no sleeping calls left in .apply() and the regmap-mmio bus already
running with fast_io=true, also mark the chip as atomic so consumers
can use pwm_apply_atomic() from atomic context.

Fixes: 37f7707077f5 ("pwm: atmel-tcb: Fix race condition and convert to guards")
Signed-off-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
---
Hi Uwe,

Thanks for the review! "Sangyun" is the right form to address me, no
worries.

Changes in v2:
 - Keep the spinlock instead of converting tcbpwmc->lock to a mutex.
 - Cache clk and slow_clk rates at probe via clk_rate_exclusive_get()
   so the .apply() path no longer calls clk_get_rate() under the
   spinlock.
 - Mark the chip as atomic now that .apply() has no sleeping calls.

Thanks,
Sangyun

 drivers/pwm/pwm-atmel-tcb.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index f9a9c12cbcdd..8d46ce28f736 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -50,6 +50,8 @@ struct atmel_tcb_pwm_chip {
 	spinlock_t lock;
 	u8 channel;
 	u8 width;
+	unsigned long rate;
+	unsigned long slow_rate;
 	struct regmap *regmap;
 	struct clk *clk;
 	struct clk *gclk;
@@ -266,7 +268,7 @@ static int atmel_tcb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	int slowclk = 0;
 	unsigned period;
 	unsigned duty;
-	unsigned rate = clk_get_rate(tcbpwmc->clk);
+	unsigned long rate = tcbpwmc->rate;
 	unsigned long long min;
 	unsigned long long max;
 
@@ -294,7 +296,7 @@ static int atmel_tcb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 */
 	if (i == ARRAY_SIZE(atmel_tcb_divisors)) {
 		i = slowclk;
-		rate = clk_get_rate(tcbpwmc->slow_clk);
+		rate = tcbpwmc->slow_rate;
 		min = div_u64(NSEC_PER_SEC, rate);
 		max = min << tcbpwmc->width;
 
@@ -431,6 +433,7 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
 	}
 
 	chip->ops = &atmel_tcb_pwm_ops;
+	chip->atomic = true;
 	tcbpwmc->channel = channel;
 	tcbpwmc->width = config->counter_width;
 
@@ -438,16 +441,33 @@ static int atmel_tcb_pwm_probe(struct platform_device *pdev)
 	if (err)
 		goto err_gclk;
 
+	err = clk_rate_exclusive_get(tcbpwmc->clk);
+	if (err)
+		goto err_disable_clk;
+
+	err = clk_rate_exclusive_get(tcbpwmc->slow_clk);
+	if (err)
+		goto err_clk_unlock;
+
+	tcbpwmc->rate = clk_get_rate(tcbpwmc->clk);
+	tcbpwmc->slow_rate = clk_get_rate(tcbpwmc->slow_clk);
+
 	spin_lock_init(&tcbpwmc->lock);
 
 	err = pwmchip_add(chip);
 	if (err < 0)
-		goto err_disable_clk;
+		goto err_slow_clk_unlock;
 
 	platform_set_drvdata(pdev, chip);
 
 	return 0;
 
+err_slow_clk_unlock:
+	clk_rate_exclusive_put(tcbpwmc->slow_clk);
+
+err_clk_unlock:
+	clk_rate_exclusive_put(tcbpwmc->clk);
+
 err_disable_clk:
 	clk_disable_unprepare(tcbpwmc->slow_clk);
 
@@ -470,6 +490,8 @@ static void atmel_tcb_pwm_remove(struct platform_device *pdev)
 
 	pwmchip_remove(chip);
 
+	clk_rate_exclusive_put(tcbpwmc->slow_clk);
+	clk_rate_exclusive_put(tcbpwmc->clk);
 	clk_disable_unprepare(tcbpwmc->slow_clk);
 	clk_put(tcbpwmc->gclk);
 	clk_put(tcbpwmc->clk);
-- 
2.34.1


