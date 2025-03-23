Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8z5p12enI9RZw66rCmwLiYXfJvqOoZz3UAG+lMt/bw=; b=OX54zahcJDqpsB6IMnEmOwfT/c
	DzC8C+V3zrxmBt5f8XqfigtufXWood2mP0U/jTTcVP/3gvTGhleFSu1ZqUhqQPwwJc3E+IoWBrFa1
	3b/IQ/ZaZRji3DjuHr2kR0RRTifuMEnsVdEX6fGSRDgJ8H3kQ6m5Hq6as5L/FVl/ltejSBc4/GiiO
	C6jVuDwqt1SlsnCAhSL+vwMp36xR0BfzDUTI6J6ww419VEmt4q+Af2WHgBIV3nRTGmYuKp4OkI65e
	x/8N6yXXWT6ArDB0NleXQEGiP0oeFW4+O57VCXRbLGnchZ6isNeQjIYc4e/lxzjLIIqNWVHVFDZ3b
	w+Uf8oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUSz-00000001t5f-0uCH;
	Sun, 23 Mar 2025 23:10:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyi-00000001p9W-2tm1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so552638166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769575; x=1743374375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8z5p12enI9RZw66rCmwLiYXfJvqOoZz3UAG+lMt/bw=;
        b=mI2NNnIjjPc4oazSHKcUYeOK6GhKGhVJ3GRH1dJ2dNkxSelfQQJIoUPOJGypb7vpv/
         YymvZfZpz0dHTrJdK5cWpFnSGCYF1s+NJxqkH4Yjt0KKT6PuAucnMPhAGnTE6c6DFQ1+
         atZ/ynYuQSVZsPksGP4ySh5pvyWajP9ABkA++VYN+7+NF66q5O8tL75g9FbJnIj4J/yM
         kO0ziF6AMM0lYp7wXIwHzy/armvnybgiSCTsGeL1W1sEJ0ywN1c/+oSdwl9lqKgSRR8C
         r/W4pmEo3P1PBTkNZTH9dtq/58LftPUf1dUtzy+f8q3NzfM+b2+2D0Yg13djCJ32bdxw
         yUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769575; x=1743374375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8z5p12enI9RZw66rCmwLiYXfJvqOoZz3UAG+lMt/bw=;
        b=FA4N07U81uiV9k6Ywt5iChAGJf1snju6q36gZK3ehBfeMkqjU4lvwLUDfVf+f+ZRNw
         B5LE41qwSY4zcKS34fBMJ3tgJ7VbqN6dZPEDiqiDdh5K+6/b929UCYNfH+AwWoDqlRup
         tKOMtcsCc62F9mBm+tY+9BOjmaHd7iik8WAascFX8Yu4VZvooPnuh9eyuWOUkgt5KA5u
         qfAWZwBiwCgwVP42T3lHd2jC9urkogkBKY4mXtMlMnVIWWR6CgKYyVck0YWn6xK07M6M
         QZCiWdbAQ6SELGkYXVNSI6hHaa8wLXxd4j6PGlqC8/0/0NTNNXkejkuHsahwMM+w6egg
         It7w==
X-Forwarded-Encrypted: i=1; AJvYcCV67y5FEUlkyzrXQJT9Q/AyzR+WbYt0v62doZdXo8dBFjlLguKqLk1UQDraldF+fiQwUARS34MKDwbURmTjCvCM@lists.infradead.org
X-Gm-Message-State: AOJu0YwYN+CuFxGeoZNhkreMdpWeptMEEb8yXuxaJ52QpBbpkePEOY4p
	kkvEsAhfLWKnGuxjkiX3Y+VoWYg7v+3CZxGifyCVw7I88RiUexnQtTnk5KzLwho=
X-Gm-Gg: ASbGncvajHfFQvxRnud+gYY1Yn511qE420XTi1fnGyREbVdxQT/Rr8Ije6+r2LY5afo
	oIuU3QV/m/PdFl/NUbCHVuAYNeKTDS7ooog2FnY9+uD6MaRa1ViGyqGcUlkex1RZ+XCa9Pj+Wqu
	05JdKHXBO/2Smspn9I1CLG3te0nOqiWn8y1a7qvAtTSvtYNG0Pgobs0WR87L9A0x4cOpEvdjW5k
	wjNOe8ONeH8SSRqP/2xHB5KeoFycRLSa71VIP97+l77s331ONVJNN8IZ/ECqQE4muliYdW+3UaM
	zbD3YzspRrywjdM/4Rb1saD4t1vtsGfky0wH/rTVafdAly+Bf1EQvhegDKlfgLbKAynNs7esy59
	3/nXTzx0OHXHX0VcHi7t4fCFd6LVj
X-Google-Smtp-Source: AGHT+IGe5qmoAcXMWbaWHDRmab3UauFteJoVt09a7sGbTlNJP0cYBqQFxBHjhU8bkTv1Ztr/PWxw0A==
X-Received: by 2002:a17:907:bac2:b0:ac2:e059:dc03 with SMTP id a640c23a62f3a-ac3f26aee3dmr1087374966b.38.1742769574917;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:35 +0000
Subject: [PATCH 19/34] mfd: sec: don't ignore errors from sec_irq_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-19-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153936_725040_774FB57B 
X-CRM114-Status: GOOD (  11.46  )
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

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 5e084e2c389ea6d509393be93f7e2d39a795a60c..bec8f93a03f7fd794beade563d73610534cb96b2 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -165,7 +165,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		pdata->disable_wrstbi = probedata->disable_wrstbi;
 	}
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.395.g12beb8f557-goog


