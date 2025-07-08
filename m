Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CBFC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=; b=Jfq4A1hAdsuY9LokyCknoRUwz3
	ipk3RY23mHmvLZtkkPDMEX+5W7MkNowY/QixksMFABx0jKhGFQh/PLQ6GIVGVoihxhvd8noXCVNud
	GN2x2RytIr4TOToF+rWBW2ERsFxwHiA08cSoGlWINOHENPW0fwtwVUSTmPuU+QR9ct+Q3Nw4hYmfP
	/Yo3cwNkimWc5iJS0ZXut+h6QeLmFbG5KWRKeH0NPs9kFxXoGbCjMyeeaO/VIp45RiJ29k35nysri
	sGkrUCOGmCf423JGYBL8RLhD2YvqQjd3JcJQpwrh1JOW5J/i33nEtuJpyt6K/U44wBYopDPFHnuXF
	jLhi84sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCMT-000000069OX-270K;
	Tue, 08 Jul 2025 17:44:09 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByI-0000000666R-3WiA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:11 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0c571f137so898329666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995149; x=1752599949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=;
        b=Fuv734niB9/2lX+wdiifJn8CfcHwouX/U3eNzxn1VHu4LtG57BbTpBrzMuOcVen8D1
         gDkpPy7d/dnz4mkz3j8urYIWUbmE39jJlV2mF+iLF+QxKUc96VkqO568NPadXXUW2Z+x
         DnOZyEUJBhsBPiWR7e+BIfCIXPH5b6e0I4ILhlwH/N2sAn3yAsJT5iaA/Ui+rYjTB24P
         aTNndSI2tfPImoafB06siBt2hQ2++OIB7EVRlOvUhKQUl+SF9LNv3knkhZyuA5TQzEFI
         7+49JsNwl1e+ecKFR0mJSTs/hAFBdYSTeKGUkfTCNDQsxRaju5/mJoC5xe+JL+vLaDub
         98TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995149; x=1752599949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=;
        b=RXGLbyCgqV93VofxF/KjrkJzOXZL0NpxAUNaXytLX/18ijCVM6idpmqtnilN8TcjO1
         1pxFAbezsT6qbAmqAQSpWZitT1n7c6pDjaiIDD0Oby5dFtsyX95zoLG5e3hTTp7QAtS2
         v/VoT06BrfBLFOqiblRhTm0851OjjlUl6U33Ro1zUFRg7+51weeBg10ZBCgmIzvAbGXz
         Jny7uaVqDFWwSLX3VE6aqHGf0tqUfYG8Y4x+n5gOdriNlyiL34WRu8mkAmPqYgHqG4q7
         1ArgUNekT95wpWXQT3nZ7x+MFXWHaU33VK/5Wiq2DAHCz5fs4GdFydl5/+830YCYu5Cx
         yOPA==
X-Forwarded-Encrypted: i=1; AJvYcCWE0rR0DPFrJEgjWAGo6XeYj5rhfIW/M/8N/Tw0Egn1/4LPUlazPpdDy5zM7CY64MNkr7/NGSICFzLZoeVLSPbF@lists.infradead.org
X-Gm-Message-State: AOJu0YwkiA6RntAdS5eHtHGEF/m/Z1r8DEyfts8DNluj0kc8meG1ozS5
	rkaRoVwsXy5X9RrAqu39DCwEHH9fXGcXfS7bZBIsNz1937lJmi8pixRvxGOBQNKH5Ks=
X-Gm-Gg: ASbGncv96DyXOoNcJXzsu8poHqmhcybGxPGF5iUB1TsH1TTp7pegOouH8di0bqiAJdi
	j8mkil2SK9AdbJgbHxIoJB+uyU1wfdr1lsaM+d8Kf6hhJf5Xg+Dl9XgM911kanEqaoDFwCD+ID3
	p6Elna68NlwDFGkhOX0yoHLWSd3LvINpWu8Nzo6wFnissVEf0ssW1KcbUuYySxkWz6OHC/f4Pfo
	TVBzRGDACh4rXE6dULYbMRQc4J5DmWH/wIgRkEX8JwG74qyKMo9iRXy/17+kcuiKVduux1xqHnt
	ZtsJ2obD2xOCtxjWhWKq/wTfvNNBU1W1wg6M3vJbPhk/pdYdQ24txVXNRG84iwdUTnKxJefBCDG
	Tzzo08VdyGVmpK2nwDW5JFYDRJSDP
X-Google-Smtp-Source: AGHT+IGucY9wMs7PPxnmYrtor4bXdxwyYwkd/rVLgKZxlKqD6066rMDLI+nsaWmwtsE5QbvvgbtN8w==
X-Received: by 2002:a17:907:724a:b0:ae0:a245:2fef with SMTP id a640c23a62f3a-ae6b0b755fcmr447729366b.20.1751995148752;
        Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6ac5fd7sm930253266b.103.2025.07.08.10.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/8] pwm: mediatek: Initialize clks when the hardware is enabled at probe time
Date: Tue,  8 Jul 2025 19:18:34 +0200
Message-ID: <b207c0aeb73d0da96736e38363640f8bee226014.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=19ZdI8deIAcCXvNH+gETZCD8gWi46FYY73oPnFFbcmk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhozcoM8P/LqPHVqpflnoI/OLM6kmm8ICr5zcuW/ZF/Y2p bwnX7l2djIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkQVe7H8FH2UtOf57mYvV lL0HHQtzemub64XUj+z4e8w9unDzX5V/70MusK5l39w0beoMj65168x03mak2tTHMMqWLNTqr1i WWavOk/TTsbJok5iFytuYU3Ifxavjatut1wd1dUp79Ilsvbm42uyo05rbFd31d388OW/ZKMvuvb L6lp7D0r+GRf80fSbz3A2qlvloq+tg7uXDe+3XdK/nXz4dWOZ5JclO3S1Uq2jnhVQVvlUbfb422 1lbX6n4tXl6Qtzfb9u+s7Kv7m50cfFYzKEb43bc8GNE8wPWNz+rl7e26HNk6ngHna8/VPagMGHy troFe0qZxV242jSW1G0t/pyi6fSholvzGPMNh3f5unbqAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101910_872984_F797C589 
X-CRM114-Status: GOOD (  15.89  )
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

When a PWM is already configured by the bootloader (e.g. to power a
backlight), the clk enable count must be increased to keep clock usage
balanced. So check which PWMs are enabled during probe and enable the
respective clocks.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 8cc61a835cd5..376d059c47bf 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -228,6 +228,49 @@ static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
 };
 
+static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
+{
+	const struct pwm_mediatek_of_data *soc = pc->soc;
+	unsigned int hwpwm;
+	u32 enabled, handled = 0;
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_top);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(pc->clk_main);
+	if (ret)
+		goto err_enable_main;
+
+	enabled = readl(pc->regs) & GENMASK(soc->num_pwms - 1, 0);
+
+	while (enabled & ~handled) {
+		hwpwm = ilog2(enabled & ~handled);
+
+		ret = pwm_mediatek_clk_enable(pc, hwpwm);
+		if (ret) {
+			while (handled) {
+				hwpwm = ilog2(handled);
+
+				pwm_mediatek_clk_disable(pc, hwpwm);
+				handled &= ~BIT(hwpwm);
+			}
+
+			break;
+		}
+
+		handled |= BIT(hwpwm);
+	}
+
+	clk_disable_unprepare(pc->clk_main);
+err_enable_main:
+
+	clk_disable_unprepare(pc->clk_top);
+
+	return ret;
+}
+
 static int pwm_mediatek_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
@@ -275,6 +318,10 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 					     "Failed to get %s clock\n", name);
 	}
 
+	ret = pwm_mediatek_init_used_clks(pc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
+
 	chip->ops = &pwm_mediatek_ops;
 
 	ret = devm_pwmchip_add(&pdev->dev, chip);
-- 
2.49.0


