Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5230DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=; b=ZOK9xwlWHzCzGUWsb1FhaX6sha
	ru9gy4H6l+QzrURpEl6pxvPLkonYDPzKDNyiEC3O1LvcBla7bbOXGU6TJNj9W1pD7h1TrfOxxOpqe
	ukoQZtRiQyntgVDT1DiJc2uUjU8bXb5VUY4NpflfBpbPS2tF43ALvbsxjN5NOlankTM7FiWqYGn3h
	ZO0WYRb7V5KmoM54C1YxDCWKgmqrl9UA1IEkPxbm50iJhbVq4DbPfMr0hTSoVlNcztDwu0NwxqT+d
	s+xc+7XtVNU+ncVdGrKxY+aZgIPHL55sO2iYKM7IRhZRigILanidHwmS6/LpLZwq9mNLvcNKXOhqj
	QCMXxmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRLa-0000000F4LE-46m3;
	Mon, 28 Jul 2025 17:09:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQHB-0000000EuZh-0oVd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:00:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-adfb562266cso674404966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753718432; x=1754323232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=;
        b=l3Wcqx0j9EOziORrygFsXWi3WREFolrZ6kInjNSl2lP6/8ruc4VhFyowbB2i3FULKT
         0gBek6A6czlyDTeVfNP8rt8KtptOSiqQ6KUt/wZX8odoNUy+8Rl1Z/7PRj7x/6o54I7I
         ylj42YHAWsjaZHfuK+j/ZEv20uQQhLfBVeP5XKc3aQDKEPv2O1B+s0/KgPF0Dyc3hh9p
         N0SixcLG12ItiEe7ITZ604KvoxX6uozmwefbtiPt4FCahodVtCRkzbCyeFyX7dmD6fie
         tdGSrs74+m2HE5/KBtBcAayqABjjIRFMdmecBxS4ia2RXaFurfIjhjp0uzrU/yQUpV2O
         CTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718432; x=1754323232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=;
        b=W4SeKwfT5HPDq9X8Ypisbpr5MJ/AHRtY4MHeIPFH1NIDoaYPixy6j+mGqE7l9XVQxJ
         hVTrqP89wZs/4MT5z5LbRhGBEw+Tu7kGXH9AJkUzvrZyGlsM8bQnTnAhPdm+hnkveW+k
         5WL16551LtbpMO4wX5XPKjm9xDTlFCG3ktA+qUh2dFs6LFiCU4p43SJYPwl4MaxbsIVy
         4RTkfzAJ3Hda/MXw8EWU5JTPsK5H14pq3viI6IM2JQrB/NJGOB/lsGtSqFudmn8FZh7K
         tvdccfZRsJ7AEL0SQbssCKNZV5m70170IEd4NPpcQMUv7qtiUa0rgCyV8s1ogKZiP/Bw
         yDNg==
X-Forwarded-Encrypted: i=1; AJvYcCUOCrHn7H6Ezq7SKJgVX+y/RFHKCD9l+tNTDYKFBOEH29167/YIUrLId8gAUsRBbFv2SBnAaR8NWjAEJmPlep1J@lists.infradead.org
X-Gm-Message-State: AOJu0YyOUzZT0lImquZJPLtDPy3AyT5rWrXmBjFz/q7ItIWQtTkyRmNp
	6UlL2F0743WF5OXv5EqXr1usW0bh0WgnTW8cHUQqYJiMpIkZ8xatDq6QpN5UjiVaFvw=
X-Gm-Gg: ASbGnctf65VPhsJrE34ackvpei+ZxXoLDjB6+hywcfMYZcTnQCHVWC4CREhkpFNLGhA
	oV+6v4XsMW69aoGDIYs1hd8Go5KTDM7kGHzANvRZqa3QFbQyQTBplqpC7wjaBnoZqv5/vq4Eqyk
	zfbf4TwBnTRnuXYWq4DvY1SXx+/C92s+QbyBuNA+lW0CqScjLy1zuJMzoAKs0pcnXKHQr8TpRhP
	tvJvynqS1t98uQH/k8w8ff/34NaEa6ZnNrqq+TLUStfTOx7NL0LW6UyKFFVcXbeO3vT8Qlub8YN
	nHK1c1getiPE2yL+Qx/bEb4OwchFcVWO6khe/tW5HGls1gvv7uSqro3mhRksOcjn/aehZHhjHR7
	Pab90R6f+tqe//NDEPPIZ26Yy6+oJTHyulNF/p82LHVLrfXB2X/Xat2mhllzk6ryq
X-Google-Smtp-Source: AGHT+IEGF1ItvOY6GGrUkAR7Qd0sme7zsV46UvWdWtAr4CkLeiv0GjNYRtz1B5xQhic43rbFMeLbCg==
X-Received: by 2002:a17:907:72ce:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-af61c4bd9damr1504131966b.1.1753718431532;
        Mon, 28 Jul 2025 09:00:31 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af635ad6132sm435214766b.120.2025.07.28.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:00:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] pwm: mediatek: Handle hardware enable and clock enable separately
Date: Mon, 28 Jul 2025 18:00:17 +0200
Message-ID: <55c94fe2917ece152ee1e998f4675642a7716f13.1753717973.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fZtYDGMtNy+jMvHxxhEnc/USL2rISQ+e6krsDxkJqDg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoh56Uj6Oi+9KhddNiomFo+ycjNuYPpvKgaT5At kGuj3HWo4GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIeelAAKCRCPgPtYfRL+ TvClB/4l4gylRaW/aRQaWgzol9iAARH0zJHVFndca9/Pq5xTDTgQRsiu30b6utvGzzraxqc9DeN xloMWp217+IcFSI041/BTbDGDCI46DrsnI3z9ZQ+ElfEPuIjNP0DHwdXWbl/keQiR5XHbXfFI7/ 8gQYBtRon4QMg1f9tAi6Ys7vxusFF1+fLkiGvGFaj4f61DrDrIei0/PG8hEZF43WKjDIM6xnI87 qXgydKJ3fFqyjKTxkh/uEWxnOvvmNkHlYwBA2gPKn1ogNzpHOQKppZWOQWOnZ1QFAsHw/Panrwy vv+1fWTy4sce+smXVZrJrXmdC05lfxp8VGxm8mCQseP/Ee5V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090033_232135_CA886772 
X-CRM114-Status: GOOD (  16.64  )
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

Stop handling the clocks in pwm_mediatek_enable() and
pwm_mediatek_disable(). This is a preparing change for the next commit
that requires that clocks and the enable bit are handled separately.

Also move these two functions a bit further up in the source file to
make them usable in pwm_mediatek_config(), which is needed in the next
commit, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 60 ++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..b6560e52c803 100644
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
@@ -183,35 +203,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -221,8 +212,10 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		if (pwm->state.enabled)
+		if (pwm->state.enabled) {
 			pwm_mediatek_disable(chip, pwm);
+			pwm_mediatek_clk_disable(chip, pwm);
+		}
 
 		return 0;
 	}
@@ -231,8 +224,11 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	if (!pwm->state.enabled)
-		err = pwm_mediatek_enable(chip, pwm);
+	if (!pwm->state.enabled) {
+		err = pwm_mediatek_clk_enable(chip, pwm);
+		if (!err)
+			pwm_mediatek_enable(chip, pwm);
+	}
 
 	return err;
 }
-- 
2.50.0


