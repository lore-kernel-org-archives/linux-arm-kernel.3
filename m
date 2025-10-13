Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6E7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UwZgCMsbKFhyY8C1ZcHJPHPhH55ArZTag8wi1FftflU=; b=Lma1ek0GYcAdC4zPgJoEZzE+e/
	8tep+V1M9XDj8YBLSah+AzSiPCWIECfVHk0z5/OoXmnu/gR1sfukkuTpVDlFNiNeaSQb2dfdRw1sj
	KnO1+JnUmYIAAqope9o47dYqILA0G6BlpJ5dwgr+ZZQBQJW/vlazXEE1B4GJeSBoesZA8Q2j51kUT
	s+tXUt7OdcLWhZae3yE+Y824Y3bPw8ZIdxUzxG5zPClYXNd70TW/hl1U27OKGt1dOgmdbelUPMgHW
	RBBksT15867tSgx14L/fGhEIRKyWqBKA24uSX93o7akrHPcYTkmP9tiyccQXc33RQKsMEbL8ujH9n
	c8avH2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GxU-0000000D2KZ-2Bwd;
	Mon, 13 Oct 2025 11:43:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GxQ-0000000D2Jq-3a55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:43:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3279362f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760355794; x=1760960594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwZgCMsbKFhyY8C1ZcHJPHPhH55ArZTag8wi1FftflU=;
        b=KBclOfDE8Yw9lKhUSY2r0EE1stQGXOV7D70GAxY9XBRdjmzSX4Pg1xl6G4RpRbHVXa
         5SFLQ2A/m87HpMXqIhu+HpZDoA836dGZqzZXH1vJYHlBCr1j9g6NwmnO4jh4KmZLUuBJ
         C20CWKH2SBqqvxHszbx81GKp86QQWDnAsQzy6gwVNlfD4oyQClWUJ0S91f7inQIyQMS5
         RM944q3QFyVwDN/ugSluLX2acFop1zH5i08449C6+IPHOUznIxiMckwas1/zjDARV891
         nxL7NkxU/uc58cS+xWTonnLdBDqOJcMR9i2tYTXV4BB0sHAVGvp6UmQg6Y8alLK4n1QH
         vQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355794; x=1760960594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwZgCMsbKFhyY8C1ZcHJPHPhH55ArZTag8wi1FftflU=;
        b=oBryv2RDgn8tbIiUSPl3PIystYqcLxXBCdmtZAjShjesYPMZsb6qChHn8TQBa8/7U2
         /Z+WH2DPhOZ0pIH9CAwEbHesnfC4rnhUyfZWrHzB9hh0qslM4nFVjvXENlROUlVtZhJn
         LfW3kMux6v2rdsp7ggg8IeShA0RVxkurS+2LqNUaNbs7tM2NtRSVBVeiFZGyHbFlziv0
         YTRAbxuKndM/B2XrwN0ZPImSYut27/cd7Z/7U3S870F06HIHqRp3PlwvcuLTwZimlfA3
         bAGbhHL/gihIPfVufmP+GL9UGnPibFz1gYr0SKvAOcsbHwYp4EkjU+LdEUhYWff8Tz1l
         00Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV7nP2BSc4UVw1Aga2I/muybWutCgAWm0IFOVNyxngwzG1YdC+usC2WW+PGq5mKPCklaZKPzAC/WkEdo7TDACcL@lists.infradead.org
X-Gm-Message-State: AOJu0YwNHqgv7WVfrddVIJ1KagWt/+awh0tydr+OWMD+p6RQMySVWqPr
	xRCuIDx0jd1U0gArXJGdgfhR8QCB0qhNaJnlVakbfCYp4XUBpOA5JqN0yZWpxKJ6I44=
X-Gm-Gg: ASbGncsFuKi5k40nX7IZrfLwOBWumNX2cz+JF3oEYYcjLBorQKVxMWV0oQa44DBiAvf
	o/ZqzAq1m5G+C063b1nqGvzOwA4k8YuQNrVleNSMp5MXl9uV2/B3TW1XULf7txEyaYzCPWrK9tO
	eziBCHHE2Ked24ywJFUpguY3oYKta2g5DP0kkVGB6Zgl7RqqfZu7cygKQQusnZMndgCFX5Ja69u
	gvAj6Gm/zd5AqS8FnvQBauevLf2bcOVOSQouyv8Mv9Ufy7GkPaulFjOeX9jPle8cLbweV5Jp4jM
	/t1N6FndDz6q0exnaOqDUO8eS3br6gM9reECj/3U4oTzh8M7ObVXbkIzgPvrVFDp7S1g343D9Ca
	jkFXj9ScIN33QRwZ7XDz24f1nmsGk5xRkAbgNFwqeBopjp1BK2xzZ3qFG5TX+hIX1NIHJ5oTgxf
	Ri5p07aoc=
X-Google-Smtp-Source: AGHT+IGjSCjPiJs9mXqOseioPNw55apzKxB5zlFAmvWHudzXdbSATr///6BVGI5p2h07FHCXT+VZfw==
X-Received: by 2002:a5d:5d02:0:b0:425:7c1b:9344 with SMTP id ffacd0b85a97d-42666ab87c3mr12529771f8f.15.1760355794546;
        Mon, 13 Oct 2025 04:43:14 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e0a03sm18034437f8f.37.2025.10.13.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:43:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] pwm: mediatek: Convert to waveform API
Date: Mon, 13 Oct 2025 13:42:56 +0200
Message-ID: <20251013114258.149260-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12751; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Dt9FNFXiyJv9YXV1n2ZADoFp6pwf1aT4B2QAj6ID+W8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBo7OXCuoDtYGTLNwcM7PfHRKuC0fC9/pQaVfcOa NX7jtGgRZWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaOzlwgAKCRCPgPtYfRL+ TvDiB/9YpYwgV0Rq9uKBXd/tnTCObg638gZ/uZNxSb8KS1u4TX97lri9vWIukUcRvlvYP+Zfl+W AD8dMSDSWQeAliyAf5Vmpl8HV7Rcyynz28iS0lOjMSz210DL5y4KnYxNs1EOXeRpJHyZXHw7SIH /03iFgvmgynfob00xKlx1vf604AsExw33sLXioH7nKUFPX3f5P4Ko5zUaJU5VA/DPar4OzYEvsO xhAaYeZ254mMCf1qk6MnDWImoNuENoB/uaBd8XyiD/svHPk6yxUAsvZOprNe4dVd0F9SFZCgB1D DW9BXDe/2tAgl7+TPn3juWJJo/VItPvQHp/bVr84iw8uNgIH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_044317_199687_6E667F18 
X-CRM114-Status: GOOD (  29.06  )
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
Hello,

this patch was part of a series before, find v2 at
https://lore.kernel.org/linux-pwm/20250725154506.2610172-10-u.kleine-koenig@baylibre.com
. All patches apart from this one was applied back then.

The problem here was, that the driver didn't properly work with the
newly added GPIO support (see commit v6.18-rc1~169^2~19 = e7c9b66b1069
("pwm: Provide a gpio device for waveform drivers")).

This is fixed here. The changes in detail are:

 - Rebase over
	ed5902a24648 pwm: mediatek: Lock and cache clock rate
	849b064c1697 pwm: mediatek: Fix various issues in the .apply() callback
 - Improve clk handling (don't only fail once for invalid clock rates)
 - report minimal period for a disabled PWM in .round_waveform_fromhw()
   (this fixes the above mentioned problem)

Best regards
Uwe

 drivers/pwm/pwm-mediatek.c | 335 ++++++++++++++++++++++---------------
 1 file changed, 201 insertions(+), 134 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4291072a13a7..f2c918c0d26a 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -135,50 +135,51 @@ static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
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
+			.enable = 0,
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
+	}
 
 	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
+	if (clk_rate == 0 || clk_rate > 1000000000)
+		return -EINVAL;
 
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
@@ -193,7 +194,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		clkdiv = 0;
 	}
 
-	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	cnt_duty = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
 	if (cnt_duty > cnt_period)
 		cnt_duty = cnt_period;
 
@@ -206,26 +207,173 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	cnt_period -= 1;
 
-	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CON: %x, PERIOD: %llx, DUTY: %llx\n",
-		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
+	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> ENABLE: %x, CON: %x, PERIOD: %llx, DUTY: %llx\n",
+		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, clk_rate,
+		enable, clkdiv, cnt_period, cnt_duty);
+
+	*wfhw = (typeof(*wfhw)){
+		.enable = enable,
+		.con = clkdiv,
+		.width = cnt_period,
+		.thres = cnt_duty,
+	};
+
+	return ret;
+}
+
+static int pwm_mediatek_round_waveform_fromhw(struct pwm_chip *chip, struct pwm_device *pwm,
+					      const void *_wfhw, struct pwm_waveform *wf)
+{
+	const struct pwm_mediatek_waveform *wfhw = _wfhw;
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 clkdiv, cnt_period, cnt_duty;
+	unsigned long clk_rate;
+
+	/*
+	 * When _wfhw was populated, the clock was on, so .rate is
+	 * already set appropriately.
+	 */
+	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
+
+	if (wfhw->enable) {
+		clkdiv = FIELD_GET(PWMCON_CLKDIV, wfhw->con);
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, wfhw->width);
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY, wfhw->thres);
 
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
+		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
+		 * and clkdiv is less than 8, so the multiplication doesn't
+		 * overflow an u64.
 		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
-	}
+		*wf = (typeof(*wf)){
+			.period_length_ns =
+				DIV_ROUND_UP_ULL((u64)(cnt_period + 1) * NSEC_PER_SEC << clkdiv, clk_rate),
+			.duty_length_ns =
+				DIV_ROUND_UP_ULL((u64)(cnt_duty + 1) * NSEC_PER_SEC << clkdiv, clk_rate),
+		};
+	} else {
+		clkdiv = 0;
+		cnt_period = 0;
+		cnt_duty = 0;
 
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
+		/*
+		 * .enable = 0 is also used for too small duty_cycle values, so
+		 * report the HW as being enabled to communicate the minimal
+		 * period.
+		 */
+		*wf = (typeof(*wf)){
+			.period_length_ns =
+				DIV_ROUND_UP_ULL(NSEC_PER_SEC, clk_rate),
+			.duty_length_ns = 0,
+		};
+	};
+
+	dev_dbg(&chip->dev, "pwm#%u: ENABLE: %x, CLKDIV: %x, PERIOD: %x, DUTY: %x @%lu -> %lld/%lld\n",
+		pwm->hwpwm, wfhw->enable, clkdiv, cnt_period, cnt_duty, clk_rate,
+		wf->duty_length_ns, wf->period_length_ns);
+
+	return 0;
+}
+
+static int pwm_mediatek_read_waveform(struct pwm_chip *chip,
+				      struct pwm_device *pwm, void *_wfhw)
+{
+	struct pwm_mediatek_waveform *wfhw = _wfhw;
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 enable, clkdiv, cnt_period, cnt_duty;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+	int ret;
+
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+	if (ret < 0)
+		return ret;
+
+	enable = readl(pc->regs) & BIT(pwm->hwpwm);
 
 	if (enable) {
-		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
-		pwm_mediatek_enable(chip, pwm);
+		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+			/*
+			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+			 * from the other PWMs on MT7623.
+			 */
+			reg_width = PWM45DWIDTH_FIXUP;
+			reg_thres = PWM45THRES_FIXUP;
+		}
+
+		clkdiv = FIELD_GET(PWMCON_CLKDIV, pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY, pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
+
+		*wfhw = (typeof(*wfhw)){
+			.enable = enable,
+			.con = BIT(15) | clkdiv,
+			.width = cnt_period,
+			.thres = cnt_duty,
+		};
 	} else {
-		pwm_mediatek_disable(chip, pwm);
+		*wfhw = (typeof(*wfhw)){
+			.enable = 0,
+		};
+	}
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
+	if (wfhw->enable) {
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
+			/*
+			 * The clks are already on, just increasing the usage
+			 * counter doesn't fail.
+			 */
+			ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+			if (unlikely(ret < 0))
+				goto out;
+
+			ctrl |= BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+		}
+
+		/* Make sure we use the bus clock and not the 26MHz clock */
+		if (pc->soc->pwm_ck_26m_sel_reg)
+			writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
+
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | wfhw->con);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, wfhw->width);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, wfhw->thres);
+	} else {
+		if (ctrl & BIT(pwm->hwpwm)) {
+			ctrl &= ~BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+
+			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+		}
 	}
 
 out:
@@ -234,93 +382,12 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			      const struct pwm_state *state)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	int err;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
-
-	if (!state->enabled) {
-		if (pwm->state.enabled) {
-			pwm_mediatek_disable(chip, pwm);
-			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
-		}
-
-		return 0;
-	}
-
-	err = pwm_mediatek_config(chip, pwm, state->duty_cycle, state->period);
-	if (err)
-		return err;
-
-	if (!pwm->state.enabled)
-		err = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-
-	return err;
-}
-
-static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	int ret;
-	u32 enable;
-	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
-
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
-		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
-		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
-	}
-
-	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-	if (ret < 0)
-		return ret;
-
-	enable = readl(pc->regs);
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
-
-		/*
-		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
-		 * and clkdiv is less than 8, so the multiplication doesn't
-		 * overflow an u64.
-		 */
-		state->period =
-			DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate);
-		state->duty_cycle =
-			DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate);
-	} else {
-		state->enabled = false;
-	}
-
-	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
-
-	return ret;
-}
-
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

base-commit: d80df3e4bc3504eb959d1ea227ff1abe9073fc3f
prerequisite-patch-id: c502c97e7ce053cec32133df9b8d32adfdcb34fb
-- 
2.51.0


