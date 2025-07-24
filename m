Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B032FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xPCtqIfSr2XyV23/N7+gLkr99UKT0q7DSJYMRI6ogM=; b=4/EVGTguht9x0lAGpw8bur/Foo
	721tcxW6HF67gR59C94xxFY0D/jirBdCbBIni8rLqzmOlcgVmVYvJGmvC6lIkgEvrj7jSZLRyes6R
	0IrQi8btPb9rP86camikB8RbaM6D4sygVTw/mmC4yZmZupzuLHMkcaLSW7B4EbM2ePpHjtI+tGDes
	PhgPYMdpuwm+g+zY+YQXAZaMj+bDpkPLgKWE422Sz8A0XpgiF8pZNZZC3/9UT4JjVhKCXJaqk1/5/
	k/os5MwXOg+jB4HiO1qaDpx+3yd34h2yf6+Jd14SKnvzj/E/LHgV5BSdp8zhIqnQAOL0D7ENqdaLQ
	b1kEQ38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf364-00000008RpH-43v5;
	Thu, 24 Jul 2025 21:03:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf33d-00000008RiP-1FMg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:00:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso2548395a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753390851; x=1753995651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xPCtqIfSr2XyV23/N7+gLkr99UKT0q7DSJYMRI6ogM=;
        b=3Yj2I25lUZNYVkXUitrxo+/CmvURoEbm4XNkO8Xbmg2SRe4y1gmsS3ZCoepC81HyJH
         Wgl9664+1kfS3BDgtPLLP963hmeDpn0TphT1XE4f2nf+KXeSIFLbxyvjdl4yB9eBe+OO
         7ZukxnUgJSE1jw0Wy7VRESk63LPSR6jsaxI1rN0AX6BCnLKa6U9QcLxsp5FkTLcbQcuM
         yD1lobfSz27UzbNMgr/nqwtaeD39gg9klQb0KuQKxD5vYUSF25L8IV+Qyy9cNT2nL4Dj
         nsCCJtvhkJqHkGvm63VqeCkquPv9r7xR+d+H510pJnV6dCB5+fmhh5JkNOagfPZL64J/
         q+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753390851; x=1753995651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xPCtqIfSr2XyV23/N7+gLkr99UKT0q7DSJYMRI6ogM=;
        b=pZW8w99tY378frww/QyysnW1jf3V5JKlNWSldvF+bOzqXTAhgYs4qnf3zU3yRa1BqF
         s7SWXXnJhdMck/S7OH7Ml+Gv+RrKM5QjdJbH9vC6N0p5+LBifSXYqoVcp0/jNwGxGPqF
         qNPZDiKlpQ7E3a6KGPHnQLO9tBc0R1LbJ3UTnrAXrCvoxHIYelQgv8SZisaDBR5hgWMW
         iO4lSE/HrROWJsOtSwi+arjCyllbIreNVtR5L/7wNp4+IAgaFHZFDQ+ZT/96QL2AcdoJ
         yxhlRuN4kPeBWwrUecPyW1zR7uNeV/4Ei+5DwIef6yechdq3BAOwT/AmbSdeYXrO2lF0
         36kw==
X-Forwarded-Encrypted: i=1; AJvYcCXdFMzy4QXRfkki6J+jfDVm/JHJnXGr6yPtbtjgaEk1hEtmCik2XLJP8JdldDiuoLxCz7xwdVF/28B57qLb8oEw@lists.infradead.org
X-Gm-Message-State: AOJu0YyGV6qVrlbke3dtN+DXtioD39OxCiU57eFDVlzZWMdh+5Ti2y1T
	TXXvalvHuB35+I0dvKu5tJxs4r72T1I17qNUKXxeI9MoWOS82+TmBHrHe/ZbmBI+FI8=
X-Gm-Gg: ASbGncsZDNBgYtur2+oiAVOeIGRdnDANuFuXtcveVCqWO1yLpMoHFCOdS3FEGBrPnO2
	VCJ7qwIObtlVSqHxQvnG3TLfE1znLkv1D+Xq7OUu7wq5hih5FZKUQjAq7YQT93DbNOelzzsSMkd
	cUhMjKFutArqV7pAr2J+jMUjgp4JLVitvaz5qjxh0Gq4qleQgZlDzZYS07zuB60L6P8AsIuPR/G
	iFjyGT7YfOJiQT47eG1SKU0d9ZFwgVG7sFczm97efE3vgYolXJp9EFAPIT8KC1NoYK1qOTWMw3/
	hHNT2dLXLELJMuFF3RaFIxTn3FWDiRmqTovWbhASJUEHVoSd9AuGRM6k2bawJgsfq9aLDdQk2Cm
	JIMxrs28hd5e43Y7lQ+Ua4O4UaCK5RGfbkxRtNw==
X-Google-Smtp-Source: AGHT+IEZuY7f15rGOKM3HvtvPUuX5++kJiRoaL2Bas2BgZ0IihvpCrXTSETkdjV6BlKAgBCSWD3W+w==
X-Received: by 2002:a17:906:fe4d:b0:ae3:7c8c:351d with SMTP id a640c23a62f3a-af2f927b043mr869343866b.56.1753390850866;
        Thu, 24 Jul 2025 14:00:50 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af47c496eefsm162080166b.25.2025.07.24.14.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:00:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] pwm: mediatek: Fix duty and period setting
Date: Thu, 24 Jul 2025 23:00:42 +0200
Message-ID: <20250724210041.2513590-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4935; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=u/COFpILtxMU50fQ37820EdrCCDB7Kx/tpvicZGMpUo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBogp76/5Y3j1DqbR8NG5ev3MILN2GEJtJqSGxPz O65Ll6UeO6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIKe+gAKCRCPgPtYfRL+ TsMMCAChbXNFn4tXrA9yspNC+kYupFpxX9nJ95SXw8tY89vKB6FXN3nh4+lC/dbsWAMytRshg1n tkbrix3dxa6+EbEnr1sKuxYQq1L/3RGN1OiEJ35VDrbas5Oh+RwC7AkA7ZtHbHpPuBxRAIOVr3Z RI/QpZBtUc5NI9YbFN2e4fATy8n9Ls9gyMG5FeZjR1kyHmWUGZgjtWlbS/6Da+bUuu4vH05jjrf G5OkisJR5ycLuUCCImRbsiRHwb1/jstC3uo1grs0+Ce546YqSEjeJQLDGetkx9y1ZTtdSXjLg44 zHhQyFi7HJrgp8T0C+NG6sSIrzbuimU4/N+npSx/oabuxCNy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_140053_570311_F5F341BC 
X-CRM114-Status: GOOD (  18.90  )
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

The period generated by the hardware is

	(PWMDWIDTH + 1) << CLKDIV) / freq

according to my tests with a signal analyser and also the documentation.

The current algorithm doesn't consider the `+ 1` part and so configures
slightly too high periods. The same issue exists for the duty cycle
setting. So subtract 1 from both the register values for period and
duty cycle. If period is 0, bail out, if duty_cycle is 0, just disable
the PWM which results in a constant low output.

Note that clk handling is dropped from pwm_mediatek_{en,dis}able to
handle duty_cycle = 0, so the calls in pwm_mediatek_apply() have to be
modified to do clk handling, too.

Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1,
https://lore.kernel.org/linux-pwm/20250710163705.2095418-2-u.kleine-koenig@baylibre.com/:

 - Drop superflous parenthesis from commit log
 - To implement drop the enable register instead of bit 15 in the CON
   register, adapt commit log accordingly.

Best regards
Uwe

 drivers/pwm/pwm-mediatek.c | 76 ++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..4460bbca2582 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -121,6 +121,26 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 	writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
 }
 
+static void pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 value;
+
+	value = readl(pc->regs);
+	value |= BIT(pwm->hwpwm);
+	writel(value, pc->regs);
+}
+
+static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 value;
+
+	value = readl(pc->regs);
+	value &= ~BIT(pwm->hwpwm);
+	writel(value, pc->regs);
+}
+
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       int duty_ns, int period_ns)
 {
@@ -150,7 +170,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	if (!cnt_period)
+		return -EINVAL;
+
+	while (cnt_period > 8192) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
@@ -173,9 +196,16 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
+
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
+	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+
+	if (cnt_duty) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+		pwm_mediatek_enable(chip, pwm);
+	} else {
+		pwm_mediatek_disable(chip, pwm);
+	}
 
 out:
 	pwm_mediatek_clk_disable(chip, pwm);
@@ -183,35 +213,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-	int ret;
-
-	ret = pwm_mediatek_clk_enable(chip, pwm);
-	if (ret < 0)
-		return ret;
-
-	value = readl(pc->regs);
-	value |= BIT(pwm->hwpwm);
-	writel(value, pc->regs);
-
-	return 0;
-}
-
-static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-
-	value = readl(pc->regs);
-	value &= ~BIT(pwm->hwpwm);
-	writel(value, pc->regs);
-
-	pwm_mediatek_clk_disable(chip, pwm);
-}
-
 static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
@@ -221,8 +222,10 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		if (pwm->state.enabled)
+		if (pwm->state.enabled) {
 			pwm_mediatek_disable(chip, pwm);
+			pwm_mediatek_clk_disable(chip, pwm);
+		}
 
 		return 0;
 	}
@@ -231,8 +234,11 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	if (!pwm->state.enabled)
-		err = pwm_mediatek_enable(chip, pwm);
+	if (!pwm->state.enabled) {
+		err = pwm_mediatek_clk_enable(chip, pwm);
+		if (err < 0)
+			return err;
+	}
 
 	return err;
 }

base-commit: a02b105fe9f2b82cbd13b13a98c2b9ffae4a7c27
-- 
2.50.0


