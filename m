Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF36C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ff33WQ4GQXy7iOXr07oKwZiyvNoomCN0lMUIfbK3JYQ=; b=ZjsaeCAb+srh9Q8IUo6ts0oVgW
	Z2f8ROUoWOrVkn9+EZRr0TDQThRb6QETAJM4IKJYDRKGzPN2+NYioZ/EZsBGx7zEQtix4pUNLIEqV
	+hWYT9OWxXAju2gFTBiiJdyk7L023b3sG3StBotBXge3wjN4yBRZO0peO0RD/f0MByYyBW2RH4xGf
	0Q9rBzfqFHA31lKJ4qRKPKMVHrYDrzGmV374X7CDY6CjqNzoofqQRpjCcs2pLHkzuw1hP7AguUUE3
	rrPh+7ghrgg+lF3FCoFLz1V4jno/gA8yqZnfD51v5QWKOfg96Augx+y1EN71rVt8S3nPs/nUGVE/L
	d12PlVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd15Z-0000000CUVi-3yA3;
	Tue, 06 Jan 2026 07:02:45 +0000
Received: from mail-106111.protonmail.ch ([79.135.106.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd15X-0000000CUVE-16E9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767682957; x=1767942157;
	bh=Ff33WQ4GQXy7iOXr07oKwZiyvNoomCN0lMUIfbK3JYQ=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KY24gprEBSRLNs4XwnP8ztibL8SJvCsGaIRZl5Luww9RJVgq2f1n7OooViBUZ4eoD
	 3F6SaU6rkt2Z8FKkDtCYGMXd54dsXinZA1/si92Lu22j0PqlHo6y936qjXCIRIiS7P
	 p2vYjFs4YRnMcmlR436AYZv+GH3MqaCL0KEjWv6rBnB2fQaUZRm1+wX9tc5RIIhve7
	 KsVZPYm2uGvLXnlYv/h78+W4ciQEraJ0pZaBmWJgIG5616aNBv3B0J7tLa0Yf80/qY
	 wlkpmcClHRROnnmb+0JHb6WYCyrOfKTpRiGvUrKAtF5zY/qcKxv5DEWfsr5Ah2eeAh
	 HIJA8EEJ5uclw==
X-Pm-Submission-Id: 4dlhv00m80z1DFFx
From: Sean Nyekjaer <sean@geanix.com>
Date: Tue, 06 Jan 2026 08:01:57 +0100
Subject: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
X-B4-Tracking: v=1; b=H4sIAGSzXGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNT3eKSXGMj3YLyXF1Lw+QkCxNjMwuDNBMloPqCotS0zAqwWdGxtbU
 AIJCvw1sAAAA=
X-Change-ID: 20260105-stm32-pwm-91cb843680f4
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sean Nyekjaer <sean@geanix.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_230244_358689_F051D0B6 
X-CRM114-Status: GOOD (  12.48  )
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

After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
ignored by the hardware when the master output is enabled via the
TIMx_BDTR MOE bit.

Handle polarity changes by temporarily disabling the PWM when required,
in line with apply() implementations used by other PWM drivers.

Fixes: 7346e7a058a2 ("pwm: stm32: Always do lazy disabling")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
This patch is only applicable for stable tree's <= 6.12
How to explicitly state that and what is the procedure?
---
 drivers/pwm/pwm-stm32.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index eb24054f9729734da21eb96f2e37af03339e3440..d5f79e87a0653e1710d46e6bf9268a59638943fe 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -452,15 +452,23 @@ static int stm32_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	enabled = pwm->state.enabled;
 
+	if (state->polarity != pwm->state.polarity) {
+		if (enabled) {
+			stm32_pwm_disable(priv, pwm->hwpwm);
+			enabled = false;
+		}
+
+		ret = stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
+		if (ret)
+			return ret;
+	}
+
 	if (!state->enabled) {
 		if (enabled)
 			stm32_pwm_disable(priv, pwm->hwpwm);
 		return 0;
 	}
 
-	if (state->polarity != pwm->state.polarity)
-		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
-
 	ret = stm32_pwm_config(priv, pwm->hwpwm,
 			       state->duty_cycle, state->period);
 	if (ret)

---
base-commit: eb18504ca5cf1e6a76a752b73daf0ef51de3551b
change-id: 20260105-stm32-pwm-91cb843680f4

Best regards,
-- 
Sean Nyekjaer <sean@geanix.com>


