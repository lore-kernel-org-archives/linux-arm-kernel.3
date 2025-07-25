Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A0EC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naH0zBfJIyOjDeXHISo3GWSZjSEthCAmEqnzdT+LFjw=; b=okZoUH2PXWFvfw1wuGUonrUCq2
	eFELW67kFx9H80jSSq4Dgf0n187LT9ulgssiJ4HPy9G+QaCCTnj8Xvu5RICKK2WB2BKExdFtiNkH2
	eMIeUvj09nrbOW0Ea9zit3I42H1aby32zjkv3DnsOPXkqGQnWMhRiRd3eVfR9KJUfemGiTrvxAFHp
	6BOxYk/H3kIL7Ge8/0emU7Ge552MLgSPiQInpYLNkgD+/zO+/+kDj2Ib4VK7QCwxGR6aB72MfO3RI
	BIYG1ZK/Sh7w0S5Q+fmeRIu95+evZVHRuk8NroNP2ftaQP9oPtahdMV9rx/M/q50QELLDoo4ES/GM
	rpEu9y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKyv-0000000AB7w-1ZZR;
	Fri, 25 Jul 2025 16:09:13 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcM-0000000A8ag-1MIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:55 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45611a6a706so11467015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458352; x=1754063152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naH0zBfJIyOjDeXHISo3GWSZjSEthCAmEqnzdT+LFjw=;
        b=U6BhLWTq27IR/OuaC2rKqcMiS9E4ce08vzj4ZPNoERvvTg7gELrxximQYVlpU4oDdq
         6YOm1z8ztY2fzW8+PNMbFXOSrxMmTPDdHcHzUQZ4zH1aGPukec6DbRDOdwHHDUAQvP7O
         +Km35sxUCtY/q4Z5VdGFA2m5IvGyiMLdUtZUaRPA0lpHGEuN8JiEna7grjLFm2B1PsdN
         MQtu4ymtGS+M6Mjtgqu9JfYQSEb+ZQIbkiYk9wlr+f7WWm1fIpH2MDP975aeDfIHuOkb
         WDSwwWaC7P75Q6xhucZ76/LYQfl6Aj9fc4qOhnnK+Th71LXUT2cHK88pkm4vLTfazLXI
         zEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458352; x=1754063152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naH0zBfJIyOjDeXHISo3GWSZjSEthCAmEqnzdT+LFjw=;
        b=typ0f6lUElveFXSYDN0p6sCs3uj6kRLmHjUL0U+f3jBWLURc1DAWL9iroZNskr5Ln+
         IdAEjpCPEOmZYMZrWNNf0ehfWoWK51ZJf3UddHEcnMc1c/i0URxuMPoYVY3kWL7sZEBk
         cDmEysaesnijogJWfLWBfnQLJ7eJmhyot76ywiJ0Gc+aXl+ywv9qqx8kn63u0ydCYL2K
         Ee//CX6HqKTUI0TqaU+lWcwSNEdbM8uKQfy9jJQLjawW0IwvIpP/QOP2SzgMzlgYUBpH
         oIVyfaLsyuCPafdmuOPNX09LWvtByRG/2h+Bs/DKi3hWdseNasOvK/2UwjIvoSqqT6Mv
         Y/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZpxhQRQnyL+Bq5mFBvEWuNsSBzVzCNfM1uoodSffz0RMNf3KXiV3ggXxOuwx0ItECQC8p4uO5zaB9hRl4bv/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpu9FjSDk96Hhf4QakHuCoyzzwDfP8+BdsJShfoE635HeFqPhY
	zwzBVDKfBxFS36Hjvy4Pp45fZfKKGmQTyr5sfShgy2KdiK+EnpJbRocQHLtE8HelLVs=
X-Gm-Gg: ASbGncuGfsLkbPSguzolI1QEKMjh1O1rAUlrUeo87F0wsENSCFsJBEDAiM48ScQv+rU
	KabtDsB7b3uhBxTk1yWc62hKQwZPSVQWWGHq4prMJc9YQ+qToX4FpCty8pM+YUJKwmJWqAWD6ae
	v+iTgM/VqpFwhMkI5HwTWTk+F01Bx0nttvBuwIPhvoYiuf4VBKVghzm840Xl0f9/hh9ugTzM92I
	0EhsGVQA4xEb9bHaaENcNQJPCpDw+2PgQdER+gTrnSnoXd7TpMKQ+1Hl4NJnzpcR+ahtpyUSO/Y
	GE0UMnWHu/4n3DgCqleN/tAMgYwmcD10XeM0gtQTNroX2DbU8wd4fxWYorQGkJj1ACM2S0k0J1e
	qIMzMlzfbd6+lsL1CGAgyZOC+vj9xVPyvug6j8coRlHL4/bYnliMZrEylyfyGqkGQ
X-Google-Smtp-Source: AGHT+IEu8ytExD33oY8pDlifvvoC9Uw4+3MTOanmfCvAAGoz6TXxb9utudI1/HDDkQ0BFNyvOatJtw==
X-Received: by 2002:a05:600c:4f87:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-4587644278emr27146735e9.17.1753458352317;
        Fri, 25 Jul 2025 08:45:52 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f0c2d8sm217740f8f.59.2025.07.25.08.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 8/8] pwm: mediatek: Convert to waveform API
Date: Fri, 25 Jul 2025 17:45:12 +0200
Message-ID: <20250725154506.2610172-18-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11070; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=JVTMa1u9uKOzTEr4zF5qVt0q2p6fcHsxcxX+/IcWAvo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aYnbWwK1WCYiQ3Y4ZhcAgzh73Cq5IQthP54 ezkCFDJX8aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmmAAKCRCPgPtYfRL+ TrWIB/sEWcWCZgK8EaNr/3uB1XUq1mHUFi+V7SaMzsEzr1JKVcFnK2jxMwaqdEXxjIUdyXgD9vg CVmN9Eef0UqFsuxVNRLcZBr9w9+MBTqiir6tGQTZGGvIaKMeyh0KMCV9cTr1OVebd/GkdvCZpKm O+cbD4n+KNf1CmTrWn+gHQQI/wWJ9juV8j661yZa0tq8zVffwLg/wNzz3+9sZnDVfoeF/PrAwgc altyxw0AIrqWYmAtCUxc71+w3SJp76MsIojD+BNLU2DCbyragZ6m0To8/2tMflJDfjJY2+x4Skn 5Ezd9DKCvtxxidp/BN+H0sqI/92AN0k6Zk5zTYKsAvgj6itR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084554_381263_C806DF75 
X-CRM114-Status: GOOD (  27.19  )
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

Implement the new waveform callbacks which makes the usage of this
hardware more flexible and allows to use it via the pwm character
device.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 283 +++++++++++++++++++++----------------
 1 file changed, 164 insertions(+), 119 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index e3db54995f7b..8ad289b06352 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -135,50 +135,53 @@ static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
 		     num * chip->soc->chanreg_width + offset);
 }
 
-static void pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-
-	value = readl(pc->regs);
-	value |= BIT(pwm->hwpwm);
-	writel(value, pc->regs);
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
-}
-
-static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       u64 duty_ns, u64 period_ns)
+struct pwm_mediatek_waveform {
+	u32 enable;
+	u32 con;
+	u32 width;
+	u32 thres;
+};
+
+static int pwm_mediatek_round_waveform_tohw(struct pwm_chip *chip, struct pwm_device *pwm,
+					    const struct pwm_waveform *wf, void *_wfhw)
 {
+	struct pwm_mediatek_waveform *wfhw = _wfhw;
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	u32 clkdiv, enable;
-	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
 	u64 cnt_period, cnt_duty;
 	unsigned long clk_rate;
-	int ret;
+	int ret = 0;
 
-	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-	if (ret < 0)
-		return ret;
+	if (wf->period_length_ns == 0) {
+		*wfhw = (typeof(*wfhw)){
+			.con = 0,
+		};
+
+		return 0;
+	}
+
+	if (!pc->clk_pwms[pwm->hwpwm].rate) {
+		struct clk *clk = pc->clk_pwms[pwm->hwpwm].clk;
+
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+
+		pc->clk_pwms[pwm->hwpwm].rate = clk_get_rate(clk);
+
+		clk_disable_unprepare(clk);
+
+		if (pc->clk_pwms[pwm->hwpwm].rate == 0 ||
+		    pc->clk_pwms[pwm->hwpwm].rate > 1000000000)
+			return -EINVAL;
+	}
 
 	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
 
-	/* Make sure we use the bus clock and not the 26MHz clock */
-	if (pc->soc->pwm_ck_26m_sel_reg)
-		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
-
-	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
+	cnt_period = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
 	if (cnt_period == 0) {
-		ret = -ERANGE;
-		goto out;
+		cnt_period = 1;
+		ret = 1;
 	}
 
 	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD) + 1) {
@@ -193,7 +196,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		clkdiv = 0;
 	}
 
-	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	cnt_duty = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
 	if (cnt_duty > cnt_period)
 		cnt_duty = cnt_period;
 
@@ -206,123 +209,165 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	cnt_period -= 1;
 
-	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CON: %x, PERIOD: %llx, DUTY: %llx\n",
-		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
+	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> ENABLE: %x, CON: %x, PERIOD: %llx, DUTY: %llx\n",
+		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, clk_rate,
+		enable, clkdiv, cnt_period, cnt_duty);
 
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
-		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
-		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
-	}
-
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-
-	if (enable) {
-		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
-		pwm_mediatek_enable(chip, pwm);
-	} else {
-		pwm_mediatek_disable(chip, pwm);
-	}
-
-	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+	*wfhw = (typeof(*wfhw)){
+		.enable = enable,
+		.con = clkdiv,
+		.width = cnt_period,
+		.thres = cnt_duty,
+	};
 
 	return ret;
 }
 
-static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			      const struct pwm_state *state)
+static int pwm_mediatek_round_waveform_fromhw(struct pwm_chip *chip, struct pwm_device *pwm,
+					      const void *_wfhw, struct pwm_waveform *wf)
 {
+	const struct pwm_mediatek_waveform *wfhw = _wfhw;
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	int err;
+	u32 clkdiv, cnt_period, cnt_duty;
+	unsigned long clk_rate;
 
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
+	/*
+	 * When _wfhw was populated, the clock was on, so .rate is
+	 * already set appropriately.
+	 */
+	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
 
-	if (!state->enabled) {
-		if (pwm->state.enabled) {
-			pwm_mediatek_disable(chip, pwm);
-			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
-		}
+	clkdiv = FIELD_GET(PWMCON_CLKDIV, wfhw->con);
+	cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, wfhw->width);
+	cnt_duty = FIELD_GET(PWMTHRES_DUTY, wfhw->thres);
 
-		return 0;
-	}
+	/*
+	 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
+	 * and clkdiv is less than 8, so the multiplication doesn't
+	 * overflow an u64.
+	 */
+	*wf = (typeof(*wf)){
+		.period_length_ns =
+			DIV_ROUND_UP_ULL((u64)(cnt_period + 1) * NSEC_PER_SEC << clkdiv, clk_rate),
+		.duty_length_ns =
+			wfhw->enable ?
+			DIV_ROUND_UP_ULL((u64)(cnt_duty + 1) * NSEC_PER_SEC << clkdiv, clk_rate) : 0,
+		.duty_offset_ns = 0,
+	};
+	dev_dbg(&chip->dev, "pwm#%u: ENABLE: %x, CLKDIV: %x, PERIOD: %x, DUTY: %x @%lu -> %lld/%lld\n",
+		pwm->hwpwm, wfhw->enable, clkdiv, cnt_period, cnt_duty, clk_rate,
+		wf->duty_length_ns, wf->period_length_ns);
 
-	err = pwm_mediatek_config(chip, pwm, state->duty_cycle, state->period);
-	if (err)
-		return err;
-
-	if (!pwm->state.enabled) {
-		err = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-		if (err < 0)
-			return err;
-	}
-
-	return err;
+	return 0;
 }
 
-static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
+static int pwm_mediatek_read_waveform(struct pwm_chip *chip,
+				      struct pwm_device *pwm, void *_wfhw)
 {
+	struct pwm_mediatek_waveform *wfhw = _wfhw;
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	int ret;
-	u32 enable;
+	u32 enable, clkdiv, cnt_period, cnt_duty;
 	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
-
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
-		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
-		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
-	}
+	int ret;
 
 	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
 	enable = readl(pc->regs);
-	if (enable & BIT(pwm->hwpwm)) {
-		u32 clkdiv, cnt_period, cnt_duty;
-		unsigned long clk_rate;
-
-		clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
-
-		state->enabled = true;
-		state->polarity = PWM_POLARITY_NORMAL;
-
-		clkdiv = FIELD_GET(PWMCON_CLKDIV,
-				   pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
-		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD,
-				       pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
-		cnt_duty = FIELD_GET(PWMTHRES_DUTY,
-				     pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
 
+	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
-		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
-		 * and clkdiv is less than 8, so the multiplication doesn't
-		 * overflow an u64.
+		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+		 * from the other PWMs on MT7623.
 		 */
-		state->period =
-			DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate);
-		state->duty_cycle =
-			DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate);
-	} else {
-		state->enabled = false;
+		reg_width = PWM45DWIDTH_FIXUP;
+		reg_thres = PWM45THRES_FIXUP;
 	}
 
+	clkdiv = FIELD_GET(PWMCON_CLKDIV, pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
+	cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
+	cnt_duty = FIELD_GET(PWMTHRES_DUTY, pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
+
+	*wfhw = (typeof(*wfhw)){
+		.enable = enable & BIT(pwm->hwpwm),
+		.con = BIT(15) | clkdiv,
+		.width = cnt_period,
+		.thres = cnt_duty,
+	};
+
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+
+	return ret;
+}
+
+static int pwm_mediatek_write_waveform(struct pwm_chip *chip,
+				       struct pwm_device *pwm, const void *_wfhw)
+{
+	const struct pwm_mediatek_waveform *wfhw = _wfhw;
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 ctrl;
+	int ret;
+
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+	if (ret < 0)
+		return ret;
+
+	ctrl = readl(pc->regs);
+
+	if (wfhw->con & BIT(15)) {
+		u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+
+		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+			/*
+			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+			 * from the other PWMs on MT7623.
+			 */
+			reg_width = PWM45DWIDTH_FIXUP;
+			reg_thres = PWM45THRES_FIXUP;
+		}
+
+		if (!(ctrl & BIT(pwm->hwpwm))) {
+			ctrl |= BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+
+			/*
+			 * The clks are already on, just increasing the usage
+			 * counter doesn't fail.
+			 */
+			ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+			if (unlikely(ret < 0))
+				goto out;
+		}
+
+		/* Make sure we use the bus clock and not the 26MHz clock */
+		if (pc->soc->pwm_ck_26m_sel_reg)
+			writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
+
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, wfhw->con);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, wfhw->width);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, wfhw->thres);
+	} else {
+		if (ctrl & BIT(pwm->hwpwm)) {
+			ctrl &= ~BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+
+			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+		}
+	}
+
+out:
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
 }
 
 static const struct pwm_ops pwm_mediatek_ops = {
-	.apply = pwm_mediatek_apply,
-	.get_state = pwm_mediatek_get_state,
+	.sizeof_wfhw = sizeof(struct pwm_mediatek_waveform),
+	.round_waveform_tohw = pwm_mediatek_round_waveform_tohw,
+	.round_waveform_fromhw = pwm_mediatek_round_waveform_fromhw,
+	.read_waveform = pwm_mediatek_read_waveform,
+	.write_waveform = pwm_mediatek_write_waveform,
 };
 
 static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
-- 
2.50.0


