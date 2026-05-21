Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A41CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 00:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lg+UFUjX2TWBvKvhX5SvfRqht7iHN6Ihdh9sMBKt2/o=; b=1OMMoEm5woLhIpqTyiDTPelTWC
	VakLNVq0dkeAZ8s+2HhbQhNOXDS3aGBU76GBraaDy96Ok9pXvS/PahL3F82Q7ggAllzvrGzsJlWqA
	G0bWVYMamkLMv4YxZUOAhS3wOFaEz/fhfrJN3emBk23TL3IuStthoGUWheaUU8GhDKcWkyEO4V2Ef
	ZNY/8tUMoLrMjnQVrSgB6RgWcyfBZgrJTTqbpHQF2I6hhzHKwzwqYxdSaNJfbvPt0vCP73Og9XsJe
	JCxwZiTRwNaWywALmp8MPlc4f8M2Yl/lS4leO/yoff36s3wxCF+BV9fUxvJKaWQwOqafSmNF1S6cZ
	uMiMcSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqql-00000006Ekq-0GmI;
	Thu, 21 May 2026 00:01:19 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqqh-00000006Ek0-4BDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 00:01:17 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5751136c561so4959511e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779321674; x=1779926474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg+UFUjX2TWBvKvhX5SvfRqht7iHN6Ihdh9sMBKt2/o=;
        b=jLd+mVMsIH8gRZg3KNSbB9A63ldF7w1aGwQl8XV0QonrdDw8v1IXgo5JC22X7KA49o
         Hua53frNAwOLzciCxhcC16a7uisz9/XDD9yCrakI8TGAU7z86y7PPFM6RwlS1mKXjn6P
         KLCCFqtpED9MBU16+kcRoDmsmWU4/G+2AWv1/KIZ7KDXF3Qm4TMvZi90dDxD18CXdEWN
         WtHMW9VC1vAu5oqgSvU133B1rl+rDTvRKp3r/r/KFLBtO06lXIaAvuOPV1DQSQ+Ub0xS
         qfea8qc62ewwPVAz9Eu8XMiAAFf6QyG8G24PF83NNHBTHSJ/ObnoMOqUdtyRJK3aMXad
         iAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321674; x=1779926474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg+UFUjX2TWBvKvhX5SvfRqht7iHN6Ihdh9sMBKt2/o=;
        b=YB9P5hJ2P4GI5Mf4FFxNRTR4QczL+Jhj7Qmz6+8lK1cH0OtmV8R7i+o/0wAq6FuYDG
         PLauRyYEUpVXk6IFrELh24H46kIXKZBX00F2jc9i3ZZhEXjn3TvyKis2WoDO481rkkUm
         QIo8lS4RY2+rblyT9z3FpKxKYpGCc8+n6v1FmCn0eF++Y7TydcXbzpQ/Y87CQl1L+u3h
         oRQ0SB4vjAaWC0ejE3/t+gnCj4++z6PTupFmXDX8IGma/2H5Zijbq6HjUOUKxDWlmv+d
         maTH1k1NFtZtfg2u8+2dRWMwkS2uosDlwX3o62T3/6szptBtKa/QBy3hDNDcsiVMCM2m
         R37Q==
X-Forwarded-Encrypted: i=1; AFNElJ/N8Jx/fVjUccp+bQ6XjTiK//YHbS0R0SNKaOJZtSzs79zHhBqtKOZIWJQnrp5vS9x98smdKL1YpMI0WQS6BXEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwN4etEVjPWHVQXjX/95NhMZprTB+nffTrXTHSeNyjN7vLm07mJ
	W727cPHDTkiB7fUBGzmpq6Foyn/1c1SRnDjPk6o12T4JldPy8hS80+y9eWz97kytoUc=
X-Gm-Gg: Acq92OGXvERA7mnrvC/h0lpzVOLDprSITbWQDFNDNq/GWLQibXO1kJMRzPCEKZ91Zr2
	CCLZbmMizOjKb19w1QskT379FAFgQufLsBW3Q73OlA6y1BkZxpvJfgIPgIq87AEnDnLWwYT68aP
	f33qeQwunvSMk8XvupjiO96rGtm5Y5fyjDrhjLF79MOWgGm/H4L0vFt4pVqEalK38VFoCXaDiKZ
	H6Stv3g39nAu/PdK+J2J+869KtOHpsg6NMekhx+VUTYK2ASkeTfVYP66eJe3BhGk81sK6mdk00e
	VyYj1hidPVtEPPc+TP0z7QcAlfooPiWkWPeA3JKADqoniyEMAL3XsjnpfvFo9JlEPU6CmrrbFoR
	8fbW2va8IyMyMluBkQBccEi5BAaLmwj0INpzy5S2BBQQgYlZjPIWdZsH1CvxDDYToveMtnaq99U
	gK3qWtubGlh7JjVihNETXYUUv+VcYyDiYY9PBLSrjByQ==
X-Received: by 2002:a05:6122:235:b0:575:fa0b:bc23 with SMTP id 71dfb90a1353d-5841b77d3bemr288066e0c.2.1779321673711;
        Wed, 20 May 2026 17:01:13 -0700 (PDT)
Received: from acer-e1.tail6c460f.ts.net ([2804:7f0:7542:7b16:2880:ed6d:f5c:8b9e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2d278a8sm10206321241.6.2026.05.20.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:01:12 -0700 (PDT)
From: Ronaldo Nunez <rnunez@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ronaldo Nunez <rnunez@baylibre.com>
Subject: [PATCH] pwm: imx27: Fix variable truncation in .apply()
Date: Wed, 20 May 2026 21:00:54 -0300
Message-ID: <20260521000054.4790-1-rnunez@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_170116_045106_A6E72C81 
X-CRM114-Status: GOOD (  13.35  )
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

This patch fixes a variable truncation when calculating period in
microseconds as part of the solution for the ERR051198 in .apply()
callback.

The problem was identified when reducing the duty cycle through sysfs,
with enable set to 1. The condition to fix errata ERR051198 for period
smaller than 2us is always being met, due to a truncation on tmp,
variable from .apply() callback, caused by the multiplication of
NSEC_PER_SEC, PWMPR (period register) and the prescaler which can easily
overflow u32. Declaring tmp as u64 makes it large enough to accommodate
larger multiplication results.

Testing:
- Hardware: Udoo Neo Extended with iMX6SoloX SoC
- Tools: Verified with a logic analyzer

Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
 drivers/pwm/pwm-imx27.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index 3d34cdc4a3a5..c8b801fcb525 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -200,7 +200,7 @@ static void pwm_imx27_wait_fifo_slot(struct pwm_chip *chip,
 static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   const struct pwm_state *state)
 {
-	unsigned long period_cycles, duty_cycles, prescale, period_us, tmp;
+	unsigned long period_cycles, duty_cycles, prescale, period_us;
 	struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
 	unsigned long long c;
 	unsigned long long clkrate;
@@ -208,6 +208,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int val;
 	int ret;
 	u32 cr;
+	u64 tmp;
 
 	clkrate = clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
 	c = clkrate * state->period;
@@ -249,6 +250,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	val = readl(imx->mmio_base + MX3_PWMPR);
 	val = val >= MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
 	cr = readl(imx->mmio_base + MX3_PWMCR);
+
+	/*
+	 * tmp stores period in nanoseconds. Result fits in u64 since
+	 * val <= 0xfffe and prescaler in [1, 0x1000].
+	 */
 	tmp = NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
 	tmp = DIV_ROUND_UP_ULL(tmp, clkrate);
 	period_us = DIV_ROUND_UP_ULL(tmp, 1000);
-- 
2.53.0


