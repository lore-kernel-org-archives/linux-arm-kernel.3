Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF192E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=; b=Z8v98z20zSw4La4AiNCrnT/2wi
	7N6iV63utE3nNX8ZtXztqw75it7Tkge4w2XX2yxR4CY8L6Sp24KTAPudR0sSfQcRpNEfs1ZevlDXu
	58q6kkSRpwIYEIObVV2t7LQShXmiMWwOReSev7KaOTjeGsltVHnG/+X8G4lG3U6UXHPlzYGBc0NB2
	BUBM7cIuOY0OYKrXRbLKCvCQ2D+5CGGXhR7xhVQMlsNfE9jZMZyq3e9dVmJl749vQ7AogigeuISv7
	s7tQDYBPlCTJHHkxrf55pRU4ALwzwL9TxoeAIPKok51urbhlR/TtMwLWN91ULhIIyO0kXZdX53tWz
	t0y4xC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgf2-00000001Hcx-2cWW;
	Sat, 11 Jan 2025 18:56:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgca-00000001H85-3Grg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:54:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso2910085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621647; x=1737226447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
        b=F6WJBFge9AEyi9TJeU4iSQcgThuUI5HkJ1wgElf5t2Po6/NUIpAB0Lg4XutY784daq
         wRz0heSPsYouD5nTxL4fxxmEKi5lHJqwvvMrNE8XsV9AAmNJh0VWKUgXGQSoeKLn34DP
         69mZ8iI3/jIY4cgXbIo7rPf6+jDpcFYXrRH0U5PrO0arp/lkma5EPJ5LkjS8prKsH+DF
         FizvuHQZGl9sdYqFmfa6JzqCod2QGH5oLOfxcAuj8qFkpNTEc2ZLksPAywr7i23kmVmR
         vp21I0nc0JGfw/DVFCJ+3ONJNjU8pwCSFa3+nboxMkXsEn8+fPXRjM7ZD2X8jTPiBeTZ
         B97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621647; x=1737226447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
        b=F6RCsTEoa30VUD1my0JklXtdAu2ExEROYzjQ97+2RC4IwEJV+w/aCn0DPOjpfTGEco
         a5myvAzoz8G6kZNXYbyLomrbdk1D4T4aOQ0M2Lk72tJkLTh37I5bslg7z0ljLdMyxFlo
         7W7Ac/9jBj7+SY4cuI+7pg8e1OH0uTffc7b7pwdLe4fn/F/RjckM7XO1ZaI8ZrJ19Zm6
         vn074eim7gyTh3NUMGmemQDQFE/RH6bGm7eYYn+PRYtmS4QIrE3CaEdd419g8lJK/7GC
         eehAQ2Vy/3ZUvvmNxd9WwJh+IyNQMeY6GuKWOhBjnHCUFnOfQB8yfvgbrxfHrRE6c2+Y
         tYfw==
X-Forwarded-Encrypted: i=1; AJvYcCUBEx+ReBqYl7hQOqxww/EkuW9zSlrwbXiQtXSE1dwHIIoTTOL492EPiHTLWPBxP46tzNY+yi++Yuy9HSIgW613@lists.infradead.org
X-Gm-Message-State: AOJu0YwVEvTFeaGTnHCRdaS6mto64UspudQK5UIJC9sMFRAH8Z6J+6ml
	DkDBaArUJcW7mlFiD7KHZPrj4I2JJCFs2fDmqdTMu2q/18aYPH7UtV8yagDi5tf555seDIkAYw7
	5
X-Gm-Gg: ASbGnctjWhGKU/ZXYJZmP352WuB2uJnrV/1bGaRLBJEOQjk9+HIzmpANj5d2DYgFPbD
	dWX0Y5PJ7z866065exAYwbNT/1tDmbfjkfPWzB4W/UHRxi+gc612kpwrLB588E9XMT50kIEdRsZ
	OJPRS0FyYaaE/IcLN0j/mm5XOY4b8qrVEpW2R5vO/b50mkHzr1tNRzzd3tGyG7dOOP0SM3SmcOp
	re7EYar6RXxn1Zpia4EjtKWPSF10cQvXBg+70IYLcAFygJVMyzqoWU46dUfFwEXQdhsXIo=
X-Google-Smtp-Source: AGHT+IGKMCNZ9lSIpKE90rRk19Kureh0VeUXVKcP8mbMQG8DavWdzbFmeA+Vz1ozm2bjDyjv4IITPQ==
X-Received: by 2002:adf:e3c4:0:b0:38a:888c:6785 with SMTP id ffacd0b85a97d-38a888c69bcmr4077895f8f.6.1736621647135;
        Sat, 11 Jan 2025 10:54:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a9fcb7a11sm2315556f8f.75.2025.01.11.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:05 +0100
Message-ID: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_105408_819253_D07D6098 
X-CRM114-Status: GOOD (  11.41  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-stm32.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 9f1a019ec8af..a0564d443569 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1074,26 +1074,18 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	regs = &rtc->data->regs;
 
 	if (rtc->data->need_dbp) {
-		rtc->dbp = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							   "st,syscfg");
+		unsigned int args[2];
+
+		rtc->dbp = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+								"st,syscfg",
+								2, args);
 		if (IS_ERR(rtc->dbp)) {
 			dev_err(&pdev->dev, "no st,syscfg\n");
 			return PTR_ERR(rtc->dbp);
 		}
 
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 1, &rtc->dbp_reg);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register offset\n");
-			return ret;
-		}
-
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 2, &rtc->dbp_mask);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register mask\n");
-			return ret;
-		}
+		rtc->dbp_reg = args[0];
+		rtc->dbp_mask = args[1];
 	}
 
 	if (!rtc->data->has_pclk) {
-- 
2.43.0


