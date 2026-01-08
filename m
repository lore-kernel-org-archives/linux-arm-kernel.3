Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00059D185ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLc1ABNGDOubKMqJjdyEE2rUDJu3+cw3hXTWYt1I64k=; b=axjIDi9dA5RgxmeY3AyGSqQX72
	fsHt/C/oBg/h1KYRGS4YJhJAAhC2rp4nzV7sLQjfvwPmnrwPGD2WiCfAgTKCgxDLmV1Tl71lAozpD
	lrj1tFmoh8C8vMJIjVpcRjcdZ6FtQpxNYCbmpaztob6iIWqQn9uuFvs9Nzp2CNS4jcd5DZIEEgSW5
	oEZvkfDmx8p4fZR4Vl2wpWGRYFWzA2U5lxciPD+mEc7Fgdrdn7MhVRAx0mGmipvXp9v76QjvlP+wT
	TpzqW+cF+QnLN3ztbctNsuQMKtkbPrSPzDjvdDlLmU1T0JB0V+sX9pVgJUnkVPz2BKttXiiYj5gHB
	izhP/XUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpOW-0000000H35I-0LS7;
	Thu, 08 Jan 2026 12:45:40 +0000
Received: from mail-106113.protonmail.ch ([79.135.106.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpOS-0000000H34P-2mCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 12:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767876332; x=1768135532;
	bh=aLc1ABNGDOubKMqJjdyEE2rUDJu3+cw3hXTWYt1I64k=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lyOmVC6eOUwGhcHBO5Eb3462sjFxqRvWZvq2Tnb1kiC0M83ZmLC0cGE15QPCn0EMK
	 kF1laGjM9ulpW5X22nlxzMJ85BP/dhI7K6CWlDtnKld6FfPTWSR6zdv03ndr4j9NU0
	 Ss/4Guj/HI1LBft19+e9PmHrG+KRRO93IF1DGv3PUieuC+syUKAKulF+7GR/KaNubo
	 rSujErEg5+imTtlN4P9JxaF+q7AsQKKt35FTBBrIMYq2GRHE5SgO12fWaPNKBy+jWn
	 pWPn+Ojc2VX2jb9s/f57BlvSiBYPBr5QSGNKGcWchPAUuBNNwDVezVFpSCX5lzuqNc
	 asTVPIsgl8NHw==
X-Pm-Submission-Id: 4dn4Pk0Vvcz1DLbC
From: Sean Nyekjaer <sean@geanix.com>
Date: Thu, 08 Jan 2026 13:45:23 +0100
Subject: [PATCH v2] pwm: stm32: Always program polarity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
X-B4-Tracking: v=1; b=H4sIAOKmX2kC/03MSwrCMBSF4a2UOzaSRw2NI/chHcR4095B05KUW
 CnZu7EgOPwPh2+HhJEwwbXZIWKmRHOoIU8NuNGGARk9a4PkUnPBLyytk5JseU3MCPfoWqU77lu
 o/yWip+2w7n3tkdI6x/dBZ/Fdf4r+U7JggimFBjtrvFPqNqANtJ3dPEFfSvkAjw/CIKMAAAA=
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
X-CRM114-CacheID: sfid-20260108_044537_320900_165311BB 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling") triggered a
regression where PWM polarity changes could be ignored.

stm32_pwm_set_polarity() was skipped due to a mismatch between the
cached pwm->state.polarity and the actual hardware state, leaving the
hardware polarity unchanged.

Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
Cc: stable@vger.kernel.org # <= 6.12
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Co-developed-by: Uwe Kleine-König <ukleinek@kernel.org>
---
This patch is only applicable for stable tree's <= 6.12
---
Changes in v2:
- Taken patch improvements for Uwe
- Link to v1: https://lore.kernel.org/r/20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com
---
 drivers/pwm/pwm-stm32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index eb24054f9729734da21eb96f2e37af03339e3440..86e6eb7396f67990249509dd347cb5a60c9ccf16 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -458,8 +458,7 @@ static int stm32_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return 0;
 	}
 
-	if (state->polarity != pwm->state.polarity)
-		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
+	stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
 
 	ret = stm32_pwm_config(priv, pwm->hwpwm,
 			       state->duty_cycle, state->period);

---
base-commit: eb18504ca5cf1e6a76a752b73daf0ef51de3551b
change-id: 20260105-stm32-pwm-91cb843680f4

Best regards,
-- 
Sean Nyekjaer <sean@geanix.com>


