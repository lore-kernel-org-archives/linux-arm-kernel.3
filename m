Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877D9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=; b=wcpe3kPLvTrS6FvAVMnuMc2xNB
	fdJ/GXwNr9vzRpKhQArwtAPNeT9IFHkkkqYNCtKkKTzO+n6Nq3GK3NqD8aXIh6fQFsX1/EVc0oAyM
	1Iy+SFNkz3/cdRbKIzYRcpwLn9s5A516hgvgqbXsWeerZyk80+uXPhkDMCzDRbToKBvHEOfVQWkp+
	PuB4gXUos9hx+iLoYqVvU7kgrmZaeqfCAXVotYV2KcUJQBJNKyC2oJLR2/o1nHFnqbA8CrfpvgXnW
	FwK2xc8jWdoPPIfJ0812EwDascHDj4VfWpCQGsn6tOAN+cxpptjGMmUcY+okIntCAMdD6Hrfw9O6p
	po92jPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwfn-0000000Cmep-0M6p;
	Thu, 10 Jul 2025 19:11:11 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuGq-0000000CTUq-16un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:37:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso484468866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752165434; x=1752770234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=;
        b=sZWQrf9ZV69p5AVoYKZjpsSnLGGki4Qifa1S4+zRO8GqDOsP0ZtC2r39uBjP+No+6N
         pVfqIKtkas/P90U4gEeP9NHdTwv0z3znSpqemGrdiXDFh85w2Ny7XI8CMS7wHBejBlz+
         ia3SCMwpkL/JrG7KdyWXs7yK1f8g8U/PEUBuKDXisFcMqy8BSIT96o51QUCJEc0eMDiJ
         JLILfeYr7A+R5gjhbff+5W80xvwICWUAuEOdzCPBefjWjqlpSpcwyvmBUshdaoXrPF6v
         21CZEmGaoLz1Z3Hxrldd3hb0PO/6zyPboBxvO+tsiECIeI7Ty96nQTe5N7XnWrRt76Qa
         PoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165434; x=1752770234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=;
        b=wMkglPwwjgVdsNONG1TOkO/Zxeij9M9rff9L6FEuqZCCn/cW3PIgUaS1VzT4U5iF1E
         pmvwz+T6taICugQqRNgV/R48I1Lb4ppUPZ4ANtwWw6oXnyLa+pnhZh2j1QvXTXtV9uOO
         yq5b8n6cQOR9xAOIiOXm6CxR83FNjmquFYIhEiD4ApsCYLMvUed5v2fQIiXT5gpJMFKn
         CKTeH5DK2DnwFOuy3rZBb/NfzpJu3w3gKdnGRc5X+6h69ZTzuSzvEvVOh//gJkalR7Xz
         Ds5MlDeKTl5b3Ld3Z55Osoz+rvYtPETC+6u+6yM7OxsXHRwIr+ebV4DpaxR9foKzDH+Q
         W4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUyOlXCITNKAPg6d6BLqtv307Sb2ExQf0fg1HZDmWMRymQGINyQMruDTqx+f1wgjC2vDsU1Ic6Gtju0MPZLFSLa@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKRrmqKv8meZPlrX9p3mMWU9tx5MZXJCwNIu2z7F/D2UextMX
	i6mdVPc2EBGmafuD0sE3hA3fY5guoyHMfI7RgmGVVDu7Bjq51Bl3gkgMzLmN1Vl7AlP0o3S3StO
	0CaIW
X-Gm-Gg: ASbGncsj07cMeTLRM7vuUWwmYKd5urgvkPOlz06kOIg9AeRngx7OZSGCLsjFWagn+On
	lmUkKzrm3pFZgEpsBa9dmXDqAmS7S7lvuzxekKwGwRWqyakzfoWcNVSie3lqYM6QCGsn6fTnps5
	S+W3o/2bek+zlo+7NVp3wiEmuHffBuwzr0AM8fZaHCmxGH4RQR3fAfQYldIg6QrU5e//6zCfSPf
	9BybYXqyDttCnUv86ctXKtipWZssf5ZOTWl08UAfi4jPR0bzQWL/VPC6iboNfZk3yq47LkOvMUc
	bwVP+MC09O8hrwPd1TLIh3fWfRMOFk7c4VUAxz2+uofGdS+73XugyC94wEunBdRLZE90yiMVKL3
	5ToKh+PAvlkab9YCdar/DxBv1Ww85
X-Google-Smtp-Source: AGHT+IELCUQ3D7o2E5fa6UZqXD1pU9+ZigPXm/NvY6HpZba0l8NVyN/8SJFdzxrZo+ZkOm2dFqnVfg==
X-Received: by 2002:a17:907:84a:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-ae6e241e145mr464296066b.19.1752165434105;
        Thu, 10 Jul 2025 09:37:14 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae6e82646a5sm159267166b.90.2025.07.10.09.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:37:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: Fix duty and period setting
Date: Thu, 10 Jul 2025 18:37:04 +0200
Message-ID: <20250710163705.2095418-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=jOMELxbdXu94+iU1SXke2q4/fB9rAtm8W7mQtcZVjSc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBob+wxnYMcBKyG/Wij6Oow0CKXmGRmtySGPvJB9 Ogiq55xVeyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG/sMQAKCRCPgPtYfRL+ TqNfCACtwiv10W+Q7wOKif88ZIoxirsO+zClSsoYXkMw4ui3aWkEWGIEHio7LkX3Xx4MXI7yhj6 U+VvShsnQpqAq1+QKAxxxFYZ3HqI6/KjTXMf+vN37DMZrQNP8Ulvr3eiPOtQ8Sx4a4TNJMC1Yc2 aamAnmOd8eCg166EpsBGABrOaSw6oWa0kjmv593gDCcF+uHn6fMd0j9S2MIrMCF1sELwKMp0g6k PVbr0pGUHUv6lTuJ7Ngdm/nHSOYMKlpBAYKrC4uYt37YKV2H5HDD//3WAl162g0CuPQes69OFGH ZeVRLJyWMgOXqjanoT58DURN2ijBnhHuV7fNKzl/sHYRu7Ba
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_093716_311626_EACAA1FD 
X-CRM114-Status: GOOD (  18.68  )
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

The period generated by the hardware is

	((PWMDWIDTH + 1) << CLKDIV) / freq)

according to my tests with a signal analyser and also the documentation.

The current algorithm doesn't consider the `+ 1` part and so configures
slightly too high periods. The same issue exists for the duty cycle
setting. So subtract 1 from both the register values for period and
duty cycle. If period is 0, bail out, if duty_cycle is 0, just don't set
bit 15 in the CON register.

Note that the handling for duty_cycle == 0 is only based on
experimentation; I don't have access to the documentation and so not
setting bit 15 is just a guess that seems to work in practise.

Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given this problem is more than 8 years old, I won't bother Linus with
this patch before v6.16, but still add a Cc: for stable when committing.
Would be great to get some feedback from people who have access to the
documentation to confirm that the bit 15 handling is sane (or propose a
better alternative).

Best regards
Uwe

 drivers/pwm/pwm-mediatek.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..80e322f02512 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -150,7 +150,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	if (!cnt_period)
+		return -EINVAL;
+
+	while (cnt_period > 8192) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
@@ -173,9 +176,16 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
+
+	if (cnt_duty) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+	} else {
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, clkdiv);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, 0);
+	}
 
 out:
 	pwm_mediatek_clk_disable(chip, pwm);

base-commit: a582469541a3f39bed452c50c5d2744620b6db02
-- 
2.49.0


