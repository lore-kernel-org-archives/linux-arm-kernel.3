Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA0C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=; b=M7kO4/71N5qWT5yay+DnjNMdjz
	SIstktYf5Evg7YznPWbAQjEcSKQ8WblAfeVAEnR1Ur/E8ZvGWcPk6kW4l9tOeXnXIXeIB1Ec72J5g
	3g38HM3J6nczxfDWjvkuTqinz7J5puThEMLBd+a0OjKC5zp9PFaKbUVglD8i+vNtP3hCEe2oCpCj+
	SlrC0JXArTUvbap8ypvUTYJwVnOn+gWbussxI63dHoa2u1tzRdfSjLqwbGSaKPsV/loMU1787p3kq
	gF1FqX4uyc9hYK1D504asETQAaBv9GP/bIMHVPI45gZ9vTLf5ifgHSwaqIl01Ee6v7EHLn0J109yd
	FyMX82Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYQc-000000068JO-23sq;
	Tue, 04 Mar 2025 19:59:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViJ-00000005YHX-2eN9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=; b=o10Zj/sVM8UMTO6ahPhjFH1xrl
	zRR36Gmq7lg38uwhtu7lyNPLDtDPUibLU+5bvgKO3eURiqYVm+DfpNqpGifzx5LJL/FlWS7xSTohI
	U4XTbaaToqvachUzuw6TBYUjTc/BQKpxtW7Py1A3GKg71JJ7aOX/ivzV4gfcP8VZ468Ri6I/c7wfz
	A4RHc7iDxWwyFOx8hhDnpKLZzYdNsLpJ0X1VAZqGENtXNJLlgTA9qzOVMgRZHkeErL4k9Osbn40ZL
	3p6OU/B8W3GC01WDxgiZLzy22fQL6q+TeZK9aboZhotdzt/VafDtnVarAfxP3MByOGZ5zzOihgbof
	BjM/pNmg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi6-00000002Cy2-055V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab771575040so1214217066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=D2IHIbWXDPORjcb/qb+xsCxCoeS/0og4zCVqNBN+7G2HcnMs0iY/LKiu+ct5kzsNcC
         r0JJtmjgmelZaOFMflOXuB0a0YlGUq3GuKTPXHagDctR44wK5Nm0D+dxfWDfA7Vu53gU
         gxRxKx/a1ucDelKcxtX0CG6ccbLHIHUjjf7GWq7PpZbW5Vb95zX6BCh+0c0cfIcqw6TE
         SbhCVIp+bUAnmQd4dAsERfaSzYpvajCrgG8E0kLkFN/suQwiIRYsSKNQop35MtNse9d5
         yJeoIUoXysT5KETflPZAKBpZ31ldsMuXSRjw+xw4/8c8onTt0gubwNAOQElOfd64si/T
         FG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=WvjRdCumoOF+N/2VBsiustMOGBua2ss0etg7gGPyQgFJp5bUSAlJ/fYIV3Iq/i1h7d
         vU88Qpsu/2Y5D+JRW/QbDRfGooIkJ+LLfDbNW5jybzIAhQUbGzzN5GbzghPHAeZBUU6B
         PWIIofQw4BgVGgJc2lbbvPDMT8GjXEDZ+gctHXMaMtMGGNDxSy66kUwpzbsXW/++lyYC
         tcrZl5XSWxKAAscCnNqHWn/FoVHbbt7eI46aR+jRxHBBLOHtUaGfzwqKq2lu3BYx5yJg
         7mKcJFaJYUirSBX//92twSZNaUPT8z+PHEVfz850qdXRJNP/ye8/er/t/zyRPSD6LWyP
         EsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrFozpC6mP2WABwWRE/WQJiRHgwkWHLHTjibkucjXSpdg1ge2Hoj5gkZOuUP0TmxWXmeO7tfE9FnLb3gzwbsat@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl3zjIUv+w5q44SK6Lr92zg044lndUEnG43Peu42GkuoxK5vWg
	o88qP5TP87i/xwOW43fctF3iYMl4Yr4vHPS8va+2Ge7unfriapsJaH0yZffb3Cg=
X-Gm-Gg: ASbGnctotFKfWaFiFJyYygm/HyCtlf35Iywm+mmC0vpt5J+xxcN/v8S+1y9QiK1QaCM
	0GEFiVZbgCk48w6zf964cIsiYnl0h50JE0N/YokBJ5UI7cr0bBG3deLJrUDS/wptJkA1pNcM6m/
	QQ2JUS8zVkYsVRKdokMsd+MnfzsfOC4r3vyMHpIdM6uSkY2r8ZkjfrC87PKw1KVVsfVnWcKpCLI
	iMZuXrbKnsYzf7vUj+KJ9rjSz5i9qGlQ3KTXkttcmGi+XUxdj+1Dgv+pCsw+JPvUYqsl/+wCO/l
	MGpKZwGmgvTl+hUIgHcEFZshzFY5Qqvg6Axq46LPOGOodquwvkJl+m9dxqm6pb5O2hcGFPiz6ZK
	vvhZWrNmlcItxep1LIA0bxWhyQdrr
X-Google-Smtp-Source: AGHT+IEctYzZlVVwQPucj8CUHKEVuZPV8n583Yq6QohmEvkW8JU3S9SRTA4/uuDakASHnMKJ8bAleA==
X-Received: by 2002:a17:906:3814:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac1f11e6c1dmr291303166b.21.1741107935167;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:34 +0000
Subject: [PATCH v2 06/16] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-6-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170538_174166_DC27198D 
X-CRM114-Status: GOOD (  12.90  )
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

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ftrtc010.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index cb4a5d101f537e20a685bb022e6f6516b0df8271..02608d3784958e69ec0ecbdb9fcc8b333b19e7cc 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -28,7 +28,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
 
 struct ftrtc010_rtc {
-	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base;
 	int			rtc_irq;
 	struct clk		*pclk;
@@ -113,6 +112,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct rtc_device *rtc_dev;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -160,29 +160,28 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev->ops = &ftrtc010_rtc_ops;
+	rtc_dev->ops = &ftrtc010_rtc_ops;
 
 	sec  = readl(rtc->rtc_base + FTRTC010_RTC_SECOND);
 	min  = readl(rtc->rtc_base + FTRTC010_RTC_MINUTE);
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	rtc->rtc_dev->range_min = (u64)days * 86400 + hour * 3600 +
-				  min * 60 + sec;
-	rtc->rtc_dev->range_max = U32_MAX + rtc->rtc_dev->range_min;
+	rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
+	rtc_dev->range_max = U32_MAX + rtc_dev->range_min;
 
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);

-- 
2.48.1.711.g2feabab25a-goog


