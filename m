Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNLnVR9vGF1ncRzwJjWhsdEqfpo2sCMhV9fziN1rC3U=; b=Pgf8m94a+OPtI/3tqANHH0iAE+
	oZrrHMaoRIxsbwUwcA0PsiAGgeEQ+bGY7FlwZLnvPPy0Puu41D2PtHAWgx4VCWbJLsdjpSYPUqCH6
	Y7yb5xSUm0oqeqjR5+3sIIVruHoZjNoQOeJdc+SHGL2BastHR4NfYDkVxFOx5CWjygxw1++Q7DZin
	0U+iwy+sUiyE/vA9z+mObOw7u4yJINTFKOQ/mnaCuzJ9d7HNM/HwANw8wcD5nePGIcqowLklCba2s
	T9fePiOhdVpl+mWFcgx6MCYKFcS0WhgmVFBQaGz9IurDZD57cYra79xVqOtHV7F6FtUq2cUyOCSA+
	dgyQl8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQP6h-0000000DgIe-0shU;
	Wed, 25 Dec 2024 10:59:15 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQP4Z-0000000DfxG-1Hun;
	Wed, 25 Dec 2024 10:57:07 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6A0CF12002A;
	Wed, 25 Dec 2024 13:56:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6A0CF12002A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735124212;
	bh=uNLnVR9vGF1ncRzwJjWhsdEqfpo2sCMhV9fziN1rC3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Tw+qhIqhtXZKVdYg+E3R4KbFilIeYTsn0Jn83YP9bKnGS7GQM6/BHzX5e64dVGSm2
	 qUvtu43CMTcl6b3FDC/GMPpdKiWQGpAggLtStgtoLCtbLjz01xOToNJ8DZzf/VAAdI
	 ItkXS8orYrEaYPzeq32SWCwMCsgx3+AfWfOf4NU1bTGfa6MOnGvuwtuBMp6k4SBg/P
	 HLlGB5l/uuDqVNMJn+A1JPnMN9ZsHhSPwacGqyv/zr4/H1X9Hpm9TyomehbSNRyLup
	 cuCDH6Q8XTiU1wGfuGzobRJRliuHiA1GY5t89IBVb0PJMmF78Pcf5YyPRtrf7gSGSV
	 E2ICJbVVv2UhA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Dec 2024 13:56:52 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH 1/2] pwm: meson: Simplify meson_pwm_cnt_to_ns()
Date: Wed, 25 Dec 2024 13:56:38 +0300
Message-ID: <20241225105639.1787237-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241225105639.1787237-1-gnstark@salutedevices.com>
References: <20241225105639.1787237-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [176.57.76.93]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190053 [Dec 25 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/25 07:56:00 #26914998
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_025704_179481_9163BD8B 
X-CRM114-Status: GOOD (  13.62  )
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

meson_pwm_cnt_to_ns() uses clock rate got from clk_get_rate(). clk object
is getting from driver's private data thru several steps. Since
meson_pwm_cnt_to_ns() is called several times from a single scope it's
easier to get clock rate once and pass it as parameter.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 806e06c2b92e..8c6bf3d49753 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -331,21 +331,9 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static u64 meson_pwm_cnt_to_ns(struct pwm_chip *chip, struct pwm_device *pwm,
-			       u32 cnt)
+static u64 meson_pwm_cnt_to_ns(unsigned long fin_freq, u32 cnt)
 {
-	struct meson_pwm *meson = to_meson_pwm(chip);
-	struct meson_pwm_channel *channel;
-	unsigned long fin_freq;
-
-	/* to_meson_pwm() can only be used after .get_state() is called */
-	channel = &meson->channels[pwm->hwpwm];
-
-	fin_freq = clk_get_rate(channel->clk);
-	if (fin_freq == 0)
-		return 0;
-
-	return div64_ul(NSEC_PER_SEC * (u64)cnt, fin_freq);
+	return fin_freq ? div64_ul(NSEC_PER_SEC * (u64)cnt, fin_freq) : 0;
 }
 
 static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -353,10 +341,12 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
+	unsigned long fin_freq;
 	unsigned int hi, lo;
 	u32 value;
 
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
+	fin_freq = clk_get_rate(meson->channels[pwm->hwpwm].clk);
 
 	value = readl(meson->base + REG_MISC_AB);
 	state->enabled = value & channel_data->pwm_en_mask;
@@ -370,8 +360,8 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	lo = FIELD_GET(PWM_LOW_MASK, value);
 	hi = FIELD_GET(PWM_HIGH_MASK, value);
 
-	state->period = meson_pwm_cnt_to_ns(chip, pwm, lo + hi);
-	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, hi);
+	state->period = meson_pwm_cnt_to_ns(fin_freq, lo + hi);
+	state->duty_cycle = meson_pwm_cnt_to_ns(fin_freq, hi);
 
 	return 0;
 }
-- 
2.25.1


