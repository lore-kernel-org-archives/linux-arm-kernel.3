Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D7BC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQv5+pAc4L4C91UEGWLn8BUX0WiW4pl4M8ey8WEjjO4=; b=U2LOGW80dKcggHCw5eN/yfNvad
	cyDFXVFRjUQxiTS4s40TH00swhCVZ+dcQjU4YQ0ad/DXhpScsxax8oYz8hfPKtIj2RnPSvUc7A10X
	n+wXfY2Z3Ob47mjrZhhJEmMuXaqobD3dBRyDJsiqihpiIfzSFtcEbH7pYZQWDDf8wlEfVD7zpL6uU
	RdrGWrad4oc8XX1IZ37V+UZGiCzdk+FzEruP/SZJUXHJhvHUTqAe41WNmX4OwRAze2NRaV24WsGp0
	k4F0a064e8Aei/eUCBcDiqe7K4mWnCoA+TR0WgeZ96HFgvnec7rBvdA01FBXcsM0nV8ToSwo8SJV0
	aHfN8SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLM-000000054tV-331L;
	Mon, 16 Jun 2025 17:10:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBXn-00000004o7V-496S;
	Mon, 16 Jun 2025 15:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750086872; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EvU5d9TIxEm+JTfOsqIQGCWFN48GYRO4qI9vxqtfzku9NXfP+NJQtipldDMLMRyyrI6hB2BIn/BZst5A5A8V34I6mkRqneV8vqnfDEacGvrgzJnfy+ZKPz1yVvjdYocOGtA+QnmdURRPLn3/kNqf3nFi7XFubUzf5/Jvzdlqfk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750086872; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tQv5+pAc4L4C91UEGWLn8BUX0WiW4pl4M8ey8WEjjO4=; 
	b=hdesGNgliCkoICR0FlF/XaOZd31CUpqr1r95kW5mgm6GFIWKJM4fUwNpz8faMJ8ZoR8GFwW3BskHe7BlXkHy9wqAHPLdRrfi1skB+dh2eBDwLWILqbqlJbyC4zv+hcboJOrKAYQMhWSpAGX1txVHYYrOi7Dk4lA6Las2nLBmsdQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750086872;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=tQv5+pAc4L4C91UEGWLn8BUX0WiW4pl4M8ey8WEjjO4=;
	b=cWd0mtWm0NDl0awihGP9/lf5IfA27beVvuEe1KbSF2KWuz3wAqFAAswkp39qcSH2
	O1Ul+PJqaxw7nUp4ITeWFuhLguGOqoSjiek89cQLU3uBfQ1keYeqS6X8o4MvTQljcCP
	vtgC+Zx7pTbksuz25YjuXWe3ekTL42GN1aIbFKDY=
Received: by mx.zohomail.com with SMTPS id 1750086870650857.0304431538276;
	Mon, 16 Jun 2025 08:14:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Jun 2025 17:14:17 +0200
Subject: [PATCH v2] pwm: rockchip: round period/duty down on apply, up on
 get
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rockchip-pwm-rounding-fix-v2-1-a9c65acad7b6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMg0UGgC/42OTQ6CMBCFr0Jm7Zi2pvVn5T2Mi1JGmCgttogYw
 t2tcAGX30ve+94EiSJTglMxQaSBEwefQW0KcI31NSFXmUEJpYVWCmNwd9dwh927zfDyFfsabzz
 i8WB3RrijoIOE3O8i5XjZvlxXjvR8ZUW/hlDaROhC23J/KjyNPS4aIw38Cg2nPsTP8m2QS+OPG
 4NEiaWWxlZ7Y5W2ZxceD1uGaLfZBdd5nr9jf1WW9wAAAA==
X-Change-ID: 20250522-rockchip-pwm-rounding-fix-98a360c90e81
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@collabora.com, linux-pwm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_081444_104390_AFDF2874 
X-CRM114-Status: GOOD (  18.07  )
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

With CONFIG_PWM_DEBUG=y, the rockchip PWM driver produces warnings like
this:

  rockchip-pwm fd8b0010.pwm: .apply is supposed to round down
  duty_cycle (requested: 23529/50000, applied: 23542/50000)

This is because the driver chooses ROUND_CLOSEST for purported
idempotency reasons. However, it's possible to keep idempotency while
always rounding down in .apply.

Do this by making get_state always round up, and making apply always
round down. This is done with u64 maths, and setting both period and
duty to U32_MAX (the biggest the hardware can support) if they would
exceed their 32 bits confines.

Fixes: 12f9ce4a5198 ("pwm: rockchip: Fix period and duty cycle approximation")
Fixes: 1ebb74cf3537 ("pwm: rockchip: Add support for hardware readout")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
This fix may need some careful testing from others before definitely
being applied and backported. While I did test it myself of course,
making sure to try a combination of periods and duty cycles, I really
don't want to accidentally undo someone else's fix.

Some of the u64 math is a bit overkill, but I don't want to assume
prescalers will never get larger than 4, which is where we start needing
the 64-bit prescaled NSECS_PER_SEC value. clk_rate could also
comfortably fit within u32 for any expected clock rate, but unsigned
long can fit more depending on architecture, even if nobody is running
the PWM hardware at 4.294967296 GHz.
---
Changes in v2:
- rename "period" and "duty" to "period_ticks" and "duty_ticks" as per
  ukleinek's review
- slightly modify commit message to add "purported", in order to make it
  clearer that ROUND_CLOSEST and idempotency are orthogonal things and
  that it worked out in this case was happenstance
- Link to v1: https://lore.kernel.org/r/20250522-rockchip-pwm-rounding-fix-v1-1-b516ad76a25a@collabora.com
---
 drivers/pwm/pwm-rockchip.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index c5f50e5eaf41ac7539f59fa03f427eee6263ca90..67b85bdb491b13cedb67c52de614f4ad9be427c5 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -8,6 +8,8 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -61,6 +63,7 @@ static int rockchip_pwm_get_state(struct pwm_chip *chip,
 				  struct pwm_state *state)
 {
 	struct rockchip_pwm_chip *pc = to_rockchip_pwm_chip(chip);
+	u64 prescaled_ns = (u64)pc->data->prescaler * NSEC_PER_SEC;
 	u32 enable_conf = pc->data->enable_conf;
 	unsigned long clk_rate;
 	u64 tmp;
@@ -78,12 +81,12 @@ static int rockchip_pwm_get_state(struct pwm_chip *chip,
 	clk_rate = clk_get_rate(pc->clk);
 
 	tmp = readl_relaxed(pc->base + pc->data->regs.period);
-	tmp *= pc->data->prescaler * NSEC_PER_SEC;
-	state->period = DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
+	tmp *= prescaled_ns;
+	state->period = DIV_U64_ROUND_UP(tmp, clk_rate);
 
 	tmp = readl_relaxed(pc->base + pc->data->regs.duty);
-	tmp *= pc->data->prescaler * NSEC_PER_SEC;
-	state->duty_cycle =  DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
+	tmp *= prescaled_ns;
+	state->duty_cycle =  DIV_U64_ROUND_UP(tmp, clk_rate);
 
 	val = readl_relaxed(pc->base + pc->data->regs.ctrl);
 	state->enabled = (val & enable_conf) == enable_conf;
@@ -103,8 +106,9 @@ static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       const struct pwm_state *state)
 {
 	struct rockchip_pwm_chip *pc = to_rockchip_pwm_chip(chip);
-	unsigned long period, duty;
-	u64 clk_rate, div;
+	u64 prescaled_ns = (u64)pc->data->prescaler * NSEC_PER_SEC;
+	u64 clk_rate, tmp;
+	u32 period_ticks, duty_ticks;
 	u32 ctrl;
 
 	clk_rate = clk_get_rate(pc->clk);
@@ -114,12 +118,15 @@ static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * bits, every possible input period can be obtained using the
 	 * default prescaler value for all practical clock rate values.
 	 */
-	div = clk_rate * state->period;
-	period = DIV_ROUND_CLOSEST_ULL(div,
-				       pc->data->prescaler * NSEC_PER_SEC);
+	tmp = mul_u64_u64_div_u64(clk_rate, state->period, prescaled_ns);
+	if (tmp > U32_MAX)
+		tmp = U32_MAX;
+	period_ticks = tmp;
 
-	div = clk_rate * state->duty_cycle;
-	duty = DIV_ROUND_CLOSEST_ULL(div, pc->data->prescaler * NSEC_PER_SEC);
+	tmp = mul_u64_u64_div_u64(clk_rate, state->duty_cycle, prescaled_ns);
+	if (tmp > U32_MAX)
+		tmp = U32_MAX;
+	duty_ticks = tmp;
 
 	/*
 	 * Lock the period and duty of previous configuration, then
@@ -131,8 +138,8 @@ static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		writel_relaxed(ctrl, pc->base + pc->data->regs.ctrl);
 	}
 
-	writel(period, pc->base + pc->data->regs.period);
-	writel(duty, pc->base + pc->data->regs.duty);
+	writel(period_ticks, pc->base + pc->data->regs.period);
+	writel(duty_ticks, pc->base + pc->data->regs.duty);
 
 	if (pc->data->supports_polarity) {
 		ctrl &= ~PWM_POLARITY_MASK;

---
base-commit: 67a08d8299798b4748f0194002566abc14c0cb23
change-id: 20250522-rockchip-pwm-rounding-fix-98a360c90e81

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


