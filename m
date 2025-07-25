Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3575FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYlIflW5mvs0UFEIFJba2iAQLX3R1DBfhqm0wXgNnuQ=; b=DKp/CF8/QZdFDDcyYQE2sXvIXA
	MJSz+niyZjtVNcR0lM8rz2Fk2wzoVav8NGzknMRayGUU9GFBVZ8BEJHi+x3iKZFN8aVzblkGH0FoF
	XJXrPR3tAy3DN+lvq6nK8i5/XjFODPaRwzlhMMB9Wb41BkC1/gVMTql/SGn1x+fagR8yVwCTerA23
	FimBVblqG43aexjdwR5JkK8V8/2VFql0Nevc1sHoYRM5OR6qyTGlxsSjQqXqvPB1o0lKCnYVt4NZY
	shwD4ol50s994v4Z0XK8oTL0S83pH3czQcVtDekjGJ6Obu7GDz8q2/weZYpc3G2e5UT7du10hWfAo
	ei4e3qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKrb-0000000AAgI-0nIF;
	Fri, 25 Jul 2025 16:01:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcG-0000000A8Wz-1xBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1644836f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458347; x=1754063147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYlIflW5mvs0UFEIFJba2iAQLX3R1DBfhqm0wXgNnuQ=;
        b=TQzM3g8/vsU+qLIlaLoZtvs8pEPQdJQpE6/7+QHP/ddDbLRHuOfftuB8WOOBcgESX1
         1lIFz68tJniMYsZMd9oRxzM7neD4DdKuNSmx3+/fDpH9huRXjstG07jLkNLxrq7KdVdx
         P38D3ci0ZIGnNLBVMpVKPpfJOgXj1cwuJtbQoF5XYWQI6IoE/VgcMgsIMiD7PdE1AsLp
         MWW18c6+AHThm5/TQYZhDX4dGgi4DeAs9qncpp1nJ7eKVid3nNtOR9JaU8dpwDf8qkmm
         U2G6Q3VP3pXzEprISi8LTzbwHTl/qVtXeWHvlfMKH+icQfgbB6zi3S4tkukc85KA151u
         naiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458347; x=1754063147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYlIflW5mvs0UFEIFJba2iAQLX3R1DBfhqm0wXgNnuQ=;
        b=rnXqU2+oexHGYVIr1GiL8R+A8ptI/7g1PctVATYzJqpjhSD1l9CFmbcTwWe14JmudN
         6glkr5gbF17Fk69hObvVvd5Frer6UGfGxs/+rzzuOoIu2UXcRBN02ydLy8UDOekJX/Gl
         bqM84SA6V9Qz0snEPvja/WhuHbdlorRnyR2/eaUIEawCoKpbkzTM5wS0/CoRfydbHrDs
         G4bV+cSchtUJZfAmteOPJMlC/vt9lrcDaleAFQCRz17mPuPuezKkJXrj8bTh/jgXxMl8
         v+BC3ALr0KdkU71KGWpWcsq3hcjdZtv/Z8G6x/0LY8y33iFJGk3OGV6j7bEa0ohMrHGG
         ROiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk+LUWq05Y6aq+LVUYiJyLYKTUS5UY+uC5DyMYh74l8gf/1/wuzzwX+sz1zMxkn5g6UUNcMFBf7qhCNjL1YwdC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1V4Fzxq7FUvTC0Maqwwjsk9oJjrwSRaSsIiF6HmuFpeYcsKfV
	c5WY+eVJSjf3guxLdy2Rch9MhzqmnvVQ1yZYC3JMGb73XqctKyCw3yVJCEFyAzPa57w=
X-Gm-Gg: ASbGnculdbwzd/rs26l2zCi/D973Xzz5DR7SJ2BCROhwyNNuarVm1YpTQJVEAk9/rJT
	1ZycHce/Utl/sUwxN5QAXlKY/mbXOAuk7d/njBSvNqP2kaECNoQVeg3ZHJP9JkAbZAdUDzpPijz
	0qggOtUgIjAK1S22wptm1treb2a4yOnEHLNuofFa2iN1HPZH6lG0IYOOzSUaP74RhiRnYaWQycR
	GBNl9LI9f2fYvA9VKY9e2MTIPw8UeL1S/EF5osYU4yoaue4sLEqbWw1aWVNSdM7olmSu9CiGuXh
	YDGQ9ZJdAVag5sAUT3DAQ1iUw4Wo85AacYuYonqk6C3gFGGlqn0zZ1SMRAa3QTs/hxSQEBwNG/I
	QYiZJ3HC8RzHtGdsvvV2G37EyKXyugqIimOW5Epn8Yu31kfIdeQGeMStnEYczfppF
X-Google-Smtp-Source: AGHT+IGowIlSkKw5ZzZZdWP+ydqqTiOhlwErsI/LyHjZ9eAmji8YiDyEbd4SmQnr4FCIgMmyEZUdfw==
X-Received: by 2002:a05:6000:2013:b0:3a4:eef9:818a with SMTP id ffacd0b85a97d-3b776645908mr2258005f8f.27.1753458346798;
        Fri, 25 Jul 2025 08:45:46 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778eb2779sm249038f8f.15.2025.07.25.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/8] pwm: mediatek: Implement .get_state() callback
Date: Fri, 25 Jul 2025 17:45:09 +0200
Message-ID: <20250725154506.2610172-15-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3468; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CgxDKiGIOk5/DJiW6ZyvTBtPHuWR1BwYQvTWRkSTQw8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aQ33zONElPxjZ4ALhMQd0DOuzGO2NKTOZXb mtJniR1ocaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmkAAKCRCPgPtYfRL+ TrpQB/9Ik6Qzx21eI6DYqkiOeUDeQuwH9crnOd10V0aDbGnzsezDdRP92c7DUMl4F7G8nNl+J8U 3Eq2uzAHL5uiyC6VZlJweJH2vqXiKuA32h05/qggi3tm48E7zchtLZkp6+xkRIo++5Duz6z8fuy Q9cIpGHRe3i1l7C0Nl3zgZOYwifAQhyIa0PzO2HjZ0yriOZduMuq3cmRYgx+44t3YTeW52Zmzs7 WXIZvGKALMpqd4gyXfJ8ctGCws6y0PHnOaPbFkeX8rU7dI1Cqo1p8ZpeUSXwnHghCp9ZB2GxAf2 93cjWMTr3NEPIYnJojwcjhSN824TxfNto0AZB95wRbrvX7mW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084548_501984_8EF668B6 
X-CRM114-Status: GOOD (  17.85  )
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

The registers can be read out just fine on an MT8365. In the assumption
that this works on all supported devices, a .get_state() callback can be
implemented. This enables consumers to make use of pwm_get_state_hw() and
improves the usefulness of /sys/kernel/debug/pwm.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 7d0a6f41d671..05263a17d55d 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -31,6 +31,7 @@
 #define PWMDWIDTH_PERIOD		GENMASK(12, 0)
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
+#define PWMTHRES_DUTY			GENMASK(12, 0)
 #define PWM45THRES_FIXUP	0x34
 #define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
@@ -108,6 +109,13 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 	       num * chip->soc->chanreg_width + offset);
 }
 
+static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
+				     unsigned int num, unsigned int offset)
+{
+	return readl(chip->regs + chip->soc->chanreg_base +
+		     num * chip->soc->chanreg_width + offset);
+}
+
 static void pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
@@ -231,8 +239,70 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return err;
 }
 
+static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				  struct pwm_state *state)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	int ret;
+	u32 enable;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+
+	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+		/*
+		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+		 * from the other PWMs on MT7623.
+		 */
+		reg_width = PWM45DWIDTH_FIXUP;
+		reg_thres = PWM45THRES_FIXUP;
+	}
+
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+	if (ret < 0)
+		return ret;
+
+	enable = readl(pc->regs);
+	if (enable & BIT(pwm->hwpwm)) {
+		u32 clkdiv, cnt_period, cnt_duty;
+		unsigned long clk_rate;
+
+		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
+		if (!clk_rate) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		state->enabled = true;
+		state->polarity = PWM_POLARITY_NORMAL;
+
+		clkdiv = FIELD_GET(PWMCON_CLKDIV,
+				   pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD,
+				       pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY,
+				     pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
+
+		/*
+		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
+		 * and clkdiv is less than 8, so the multiplication doesn't
+		 * overflow an u64.
+		 */
+		state->period =
+			DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate);
+		state->duty_cycle =
+			DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate);
+	} else {
+		state->enabled = false;
+	}
+
+out:
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+
+	return ret;
+}
+
 static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
+	.get_state = pwm_mediatek_get_state,
 };
 
 static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
-- 
2.50.0


