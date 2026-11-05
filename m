Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091E606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/LkpGS5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkJA2VS0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cz3hsHoABfHQJbIVOt0JnDILxbqus7gt6vD3k/2YVn0=; b=v/LkpGS5W6BmRk
	0bHpeoUWNKnM8Ne0rwo0fMJZJHiZNOeCGtz56C7b634zgsZgvc5mgd9+siDEkrFijrKRfZyiCyVoE
	HCQpCruZr6btw4MFSqdvo7r7hIEzFn1wKUGZGgd33jdxeP5LFy2we/yLXeBI8IlkufzhRj5FsNm4j
	UYYO42sURp9W5n8J+VTFtoCRmQKd37EOs3Ln4oKvBf4BZfvKcRh4zSKTjI5XvxmZOVAui3rIC991w
	25H1jmpvO3sBtmvN+nj834/q0aWN4CSG2Mdv4vmLD1N1kjnri9FH1sJF3IwzKdam1IMH2C8Ebk9bA
	76f87O9XqU8ntuaQpNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOycT-00000009JT3-0VHQ;
	Thu, 05 Nov 2026 14:39:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOycR-00000009JSc-34Hw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 305E960416;
	Thu,  5 Nov 2026 14:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BAC1F000C1;
	Thu,  5 Nov 2026 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889550;
	bh=Cz3hsHoABfHQJbIVOt0JnDILxbqus7gt6vD3k/2YVn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XkJA2VS0NGDGHcmyWZyMjjgyvEklZ5U1BDW2fKU3a1+2QSPj86fHovI4QOs9zcxuv
	 D9YuSxDd4pnxPeZ7vHPemTMfX9KBgl4cHHcFtWHRR3D/VZmtQGks2SnEBFxWnV1wtI
	 VtRf8W8NeLSeLanr7xxLQc82ys0XJmC49lx7c8bmQ/DXDAD+PtoN7BC4ElkabBQCBx
	 d6Ujx9TZ8Esqq3LiKu9AagDPSv0DUkK2xJttIfJCbj1cT+zo4FAw/3f07TzqamQ5iQ
	 1EcNjog8xQUTT1ftVXuAKMFi2Vip362txfvKI13PEHn+1XzueuE1Y3jo3kDPliB1PH
	 ID013pdQxFHXA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/8] pwm: mxs: Return early when disabling and fix error-path clock leak
Date: Thu,  5 Nov 2026 14:38:04 +0000
Message-ID: <20261105143847.2559586-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105143847.2559586-1-lee@kernel.org>
References: <20261105143847.2559586-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When disabling a PWM channel (!state->enabled), the PWM core permits
state->period to be zero.  mxs_pwm_apply() currently falls through into
the period and duty-cycle calculations even when !state->enabled,
causing do_div(c, state->period) to divide by zero when state->period is
zero.  In addition, if the requested period exceeds the maximum divider
(div >= PERIOD_CDIV_MAX) while the PWM channel is currently disabled,
mxs_pwm_apply() returns -EINVAL without disabling and unpreparing
mxs->clk.

Handle the !state->enabled path upfront and return early, and balance
clk_prepare_enable() on the -EINVAL error path.

Fixes: bf29c2ff82fd ("pwm: mxs: Implement ->apply()")
Closes: https://sashiko.dev/#/bug/linux-710f863f-6964-4e4f-990a-e5043dbc1a87
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pwm/pwm-mxs.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
index e1a3df6549fc..16233764fd3c 100644
--- a/drivers/pwm/pwm-mxs.c
+++ b/drivers/pwm/pwm-mxs.c
@@ -56,6 +56,14 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	unsigned long long c;
 	unsigned int pol_bits;
 
+	if (!state->enabled) {
+		if (pwm_is_enabled(pwm)) {
+			writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
+			clk_disable_unprepare(mxs->clk);
+		}
+		return 0;
+	}
+
 	/*
 	 * If the PWM channel is disabled, make sure to turn on the
 	 * clock before calling clk_get_rate() and writing to the
@@ -67,9 +75,6 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			return ret;
 	}
 
-	if (!state->enabled && pwm_is_enabled(pwm))
-		writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + CLR);
-
 	rate = clk_get_rate(mxs->clk);
 	while (1) {
 		c = rate >> cdiv_shift[div];
@@ -78,8 +83,11 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (c < PERIOD_PERIOD_MAX)
 			break;
 		div++;
-		if (div >= PERIOD_CDIV_MAX)
+		if (div >= PERIOD_CDIV_MAX) {
+			if (!pwm_is_enabled(pwm))
+				clk_disable_unprepare(mxs->clk);
 			return -EINVAL;
+		}
 	}
 
 	period_cycles = c;
@@ -101,16 +109,12 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	writel(PERIOD_PERIOD(period_cycles) | pol_bits | PERIOD_CDIV(div),
 	       mxs->base + PWM_PERIOD0 + pwm->hwpwm * 0x20);
 
-	if (state->enabled) {
-		if (!pwm_is_enabled(pwm)) {
-			/*
-			 * The clock was enabled above. Just enable
-			 * the channel in the control register.
-			 */
-			writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + SET);
-		}
-	} else {
-		clk_disable_unprepare(mxs->clk);
+	if (!pwm_is_enabled(pwm)) {
+		/*
+		 * The clock was enabled above. Just enable
+		 * the channel in the control register.
+		 */
+		writel(1 << pwm->hwpwm, mxs->base + PWM_CTRL + SET);
 	}
 	return 0;
 }
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
-- 
2.56.0.398.g882cbad275-goog


