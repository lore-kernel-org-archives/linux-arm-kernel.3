Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D12C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=; b=EXtF1T1mmUTxXhVHIQY7BO0V3O
	+l3mbnmUBuM0/K/GSjelcw/nn2T9p6L9Abfq8xFyZAk6BYgbbjxDtg0SL/ew5BWdDkN7+tkqB9h1V
	fkYyAKY6zt/HklTp4tzuMBeCU4klvKVthUUAg2r0oJoJQcdNycKQCexxWRd9gHpXPhJ2tm/myqCqh
	9AnRbusfm3a6+1UxNJj2bQtUTDT67lRFdJ9fQo+buDjqpwokHY36iLrkl0artpjPkQYG+IdO3+z8M
	OE/6mxje33fnvI2pysVJq9sQblPzDczfaGf6d7JCGlbElqNvAhpOYPnx0jkKGg/LGqOC/7uVzlXcu
	V6O5jmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCFR-000000068PZ-1Eyt;
	Tue, 08 Jul 2025 17:36:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByF-00000006658-3QIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so783044866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995146; x=1752599946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=;
        b=M6psstaXTi65YafPuYqJ3/bNeOpqLJYvclP2KbAAWTBTdNujZvHnjAxLtcm3U7MGXB
         yHKtiOwJ/yQ5crpYTrxKr1qQhVL8kd6g5k4mU+JEFI8obun/qYY0z/+8OPCYadEH1KeK
         5H3tCFP8P19eOg65OWwPnEgtvhagPd3R+foTuogily22UM75hGMu8bcYsc+pD35HMIgy
         Gw59BndluowH8DtX++ackltX7/n2uhydBMt/3v3mLf7AQilBodTTflMhvudcgp8FsU9M
         YtSqBx+gsvnxmIjUligVAZDSNoopZgoDHTnvWQqsvp80HTYPcWf6Ea90g16rCVV/xEuq
         iuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995146; x=1752599946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=;
        b=rrJwcGzcnSm8igh9ldoBOcL/urXdnSuYH2ZWkgWUwUD1Pafgzc1x2FtZ/0VGo1ROny
         onQ7iLnmPVXWZkK8M+G4nzs55wPi3rKrlphtqTnNpsZfl4loDTnf6aDCln2dHFJ5NuNE
         aAbHGHEkCkCdlisjeHJxIxSM1gUGHihZDjWs5B8Za4VegKLa+hIgiES+idosULJdS607
         pWNsUj9w9TgkO9XmTXilW1Djwj4nL10J2pBwADQG9ZHjgcP2bjqMisDqjPpOHdvaPqIB
         /D5juiN+6SyAvFW+zfndp4+wsPD2Jqklc02yYO3KKcxgxgWAYhoV5H2Q9iF7RO0ekq79
         qCTA==
X-Forwarded-Encrypted: i=1; AJvYcCUAxftY0JNEynreys0StlvzR5zcLF61r77UwQgpnTuweXjfLDr63/KOBAfAvXiVYWCEcYeBiD2FjlTr5EXeRn0B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0IOCgt6OIV0SyQoUzCUWY2oy7CBBNK4Q7Ks6b2S9yXODeHuoh
	cqqlFFgB3yYz6hSleqLZKywW/C+vee74HjYQMbIbGlYWAAAVysuYzFm9MUkzli1fG5E=
X-Gm-Gg: ASbGncs/mUmUKlBJOr9Vi6xRtYKUf+9eLw6M0TdeCyPED7hE+x5YPD3yrj5thbVFrtS
	Ts7tlbOrsl6AnY24wZmi7uG6ti3AKSeNQPsWsq5Tvq+0njAAj1fm4kdr8f/v8IMdH+f/5RoQNaQ
	DJWgL63JC0d78PqrnCkwcCkES4Qy5uyCEa2NXDEBWItSvwlKNTMH36LInrBIYytdOdc39bK/6Sc
	FOyaeG7pIDnUzAj2KyhtyEqHIQR5DZ760kMvwmsPxLz0yI0iYK2xU7XRE1xYcAwti15/urzHRX/
	+t8dVMAhXcfZ/FN3uxarLRF7KXFMZRdUhxwiFrq44prbq/ZVtC+QoxlZQ1XW1+in8SjA2L5Xh5h
	MUwa08XDJQVXMiPitVqSNvvvLxzhc
X-Google-Smtp-Source: AGHT+IE5OIeIZ5QR1ZssvGG6cwfSQTYFY8oEnTXJsjzZL/KNsWCagxV2uvWNHzT/jpCoBE+QF2QW+w==
X-Received: by 2002:a17:907:724d:b0:ae3:60fb:1b3b with SMTP id a640c23a62f3a-ae3fe82f933mr596168966b.58.1751995146037;
        Tue, 08 Jul 2025 10:19:06 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b5e7d5sm925568566b.151.2025.07.08.10.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/8] pwm: mediatek: Introduce and use a few more register defines
Date: Tue,  8 Jul 2025 19:18:32 +0200
Message-ID: <1f1078375a1c7ef97d7b4fa3d1c59a16465ce535.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=T2A0/9nlYAI6voHfpJH7Rb1hXChRfttt5tHMxIzKo0Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLu4yyc4ZEXE2Flt1EFiMsFvTCqvJ8gMPVO1 FCTHsNA6muJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S7gAKCRCPgPtYfRL+ TpkoCACy5J6jHwSO9DH+RD0l/OD8lEXDGK8YCOAIDTeaMsT7FeKoFSG2MyJlXwnLli3dQW3ZvyL VoOXPJCCJ0aJkzeVN7Ewln2X0lgZFKeLGV/nFbrTnMZd5YCZWTp5p0JzeTgkhNdYigCmoMpU++s 3LLDBYXcIjaQy2whOrRWaOrkBQncTwlk7HQUI+ml+UWU2maQd4h7JoPFqK2D/no6yZA0MvQ7eXk 65Ui3cG2q2xXZZLaS41bGK5mQon9EZm/zdbSNIEURuA1mgX3hAgX7WQNpmL9eIc2UD03ve2gSOX Ji5bTPbbhK+/e+Bc0eCXs8EFSs/bMvnaHGcOfe6CSKNDcPTi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101907_854961_6F3BDB5C 
X-CRM114-Status: GOOD (  13.83  )
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

Instead of using a magic constant for bound checking, derive the numbers
from appropriate register defines.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index a816f136f39d..4e2a27b02c80 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -21,19 +22,19 @@
 
 /* PWM registers and bits definitions */
 #define PWMCON			0x00
+#define PWMCON_CLKDIV			GENMASK(2, 0)
 #define PWMHDUR			0x04
 #define PWMLDUR			0x08
 #define PWMGDUR			0x0c
 #define PWMWAVENUM		0x28
 #define PWMDWIDTH		0x2c
+#define PWMDWIDTH_PERIOD		GENMASK(12, 0)
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
 #define PWM45THRES_FIXUP	0x34
 #define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
 
-#define PWM_CLK_DIV_MAX		7
-
 struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
@@ -139,14 +140,14 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	while (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD)) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
 						   resolution);
 	}
 
-	if (clkdiv > PWM_CLK_DIV_MAX) {
+	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
 		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
 		ret = -EINVAL;
 		goto out;
-- 
2.49.0


