Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7626CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uiB0cahIV1Yxwv3/Yp5e9hUqE3ZJJdbygUJdBb1agB8=; b=vwHGsq8x+h0GZRqluvytwcRQAC
	wKyINZZPO7T8763eWOil5qwr9k/StzYmcEn4ESX3lWO60KYF9j6BUDsgKwHEYtgEukgctTf+Mr2Dj
	nYiWVspty8EoqUZM8MDiYW9lAnYIqT2C9xEsxZg2Jlj39HklpOXJAHQypJeN5SI6y/F+tyASGa1IP
	pZmJ1YwecMTPcwMP2r36nL4UTBz8mPI00Jnq1M+ILiYc8HnJxhf0aCxli21pj3qCODe6evFruhK1G
	1viv6g8cK3Pc+CkM4AaWNSTF98nRAImHOIHziWBqTG1mYDSRU4KYcOJFYO6ggHBC3Y+JOYjfS9rcM
	WQd0xAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VN4-0000000E1RG-0Aiu;
	Fri, 18 Sep 2026 09:59:06 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VN1-0000000E1Q4-2EDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:59:04 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so499775a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725542; x=1790330342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiB0cahIV1Yxwv3/Yp5e9hUqE3ZJJdbygUJdBb1agB8=;
        b=md3//iQSBKMACDLAv2gEFqCjM17SApiSLrBJTYNzMw1iSyOe1XnaeCWe08dTtcBZDa
         NxIYtLTsDhqttbRuOFo9pSKm73SyhX5ofkhErCyM3L6ODUfPU3G/DmXQ9qf9yt93jvlF
         TKRcID82Y+suP8gZfL/AdCr47N5NxYhLQ7f6hwf6aUkt5sjyIJMF5Sa1KuhlGex/EEJz
         vnPcB6FREKtm9moTOfKCCTVDsMjQsZvctZcbRfrlAYDS+v5KEOl+quWTyugWpOrIwPIB
         2dFoHZy0Pe450lLE3qTfI/b8ivgzAkEA0doEjtSTi+XQvThODZ+Md4EWy+wbPhxSAdmG
         LFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725542; x=1790330342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiB0cahIV1Yxwv3/Yp5e9hUqE3ZJJdbygUJdBb1agB8=;
        b=JK99bRZwZiwnNUfxc06gk1ZbV54mVV8j+aPgFbBj+rs7g6hR/MSKAPdkehkm4DZMV+
         MwX2EqkkhpfyJiVODiGpoyKEXxdzJ+6mAeyrmWr4wcpuff9IxDcbXQfA42VapVBTRrXO
         8MgZ+TNjSnmN7oua1Ob5kHj2oO3MiTUgy1xSQqDtAUgyxqZ7FhxF/J4TDdRE7iZW8wjl
         WkA0Keep6SomKek/u89SNJUFlA9OPlF5BClQv2qdLIbDQ3kvEzf0zRhPkidNjNc4Tn6D
         +MtKil5U2BMmrpQ++Aebly8p2N26JD1wxpcy3CKYEnKaa16eGtI7Aw0C0VprjNIwIodI
         hRDg==
X-Forwarded-Encrypted: i=1; AKwUvBxYE5h/pyRWXrH1EBvHK18qQk43ooy+UwhZUkJ9d5DEekjHKKBR6jo7uIhPDTjoXH4FyrLVU7Yn8DcqMi4JKXir@lists.infradead.org
X-Gm-Message-State: AFuF++nIFIcCJsLwEAlG6ZbJRccUOI7IN6VtTIecVG2mwzknQsG9a93Y
	6Zubyrl4ijgoepSVLokgnvwjC5AcJHKg+ZHcvWYQ/LPmP6FbxoJKewkc
X-Gm-Gg: AYBFou16MCH0G+zpUlxGu2irwTXc1g8tm78GErGJ2GQ5Zxy2GVMNFsGFjmOvECoCB2l
	oZTqFmAr7KsaS3Yl/gdOaveLF3vKAWv6vYSOX0bi2/bJCjrkiyTObZIVVrvbLN8wBUkXmogdLui
	PMr5QugGUhFKrM0hl7V3QbxqVd7cFyKnkxUKxPJ/QQK0jKwlL+GLbq3IlmdSfHU+0rziiOyPi3N
	UNiBkmqWvwyP13UvalRbDz0WeBSWNZ7R6gwhki1lQfE26d1YmLnD/1dVRHbCpGBrhMPvpU5wiDq
	8/hPFYm3AWLLrS5aeVY8SzVFPpEUdW5hRx+BbdJ5Ywb0MQlwXNuiPQgfrjNd6/c/sSIpjNiiFJT
	1qyexTnaTuo/tSPqJNMkbKL0YnZu8SeatLPAJz2Wn2dHM0H4VEei5EhrE71lD5ya1AcuDwP0V/B
	WycMoqaIRgQk3oyP5PRWd9vrA1WfqX2jwYr0xczcgSF3n44LEGHjFj/GXh0g5tsL4ROI9yaIF/g
	fXlKEGyacoKrEZc
X-Received: by 2002:a17:90b:2ecb:b0:39e:4c81:6c9a with SMTP id 98e67ed59e1d1-39e54fafb06mr5161757a91.32.1789725541791;
        Fri, 18 Sep 2026 02:59:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e59abb3dbsm2567700a91.11.2026.09.18.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:59:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: stm32: fix clock leak on pinctrl probe failure
Date: Fri, 18 Sep 2026 16:58:53 +0700
Message-Id: <20260918095853.1348694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025903_569985_A341FC53 
X-CRM114-Status: GOOD (  13.16  )
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

A failing devm_pinctrl_register_and_init() or pinctrl_enable() in
stm32_rtc_probe() returns directly instead of going through err:,
leaking rtc_ck/pclk -- and since -EPROBE_DEFER is routine here, each
deferred retry leaks another.

Route both through err:, and move the pinctrl setup earlier (right
after stm32_rtc_init(), before the RTC device/IRQ are registered) so
disabling the clocks there doesn't race a still-live IRQ.

Fixes: 16ad2bc09efb ("rtc: stm32: add pinctrl and pinmux interfaces")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914135401.373D91F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Sashiko found that routing the pinctrl failures through err: (as v1
  did) disables the clocks while the still-registered RTC device and
  alarm IRQ are live. Moved the pinctrl setup earlier instead of just
  moving where the leak was plugged.

 drivers/rtc/rtc-stm32.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..457f66663ba5 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1137,6 +1137,20 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	stm32_rtc_clean_outs(rtc);
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+		goto err;
+	}
+
+	ret = pinctrl_enable(pctl);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+		goto err;
+	}
+
 	rtc->irq_alarm = platform_get_irq(pdev, 0);
 	if (rtc->irq_alarm <= 0) {
 		ret = rtc->irq_alarm;
@@ -1172,16 +1186,6 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	stm32_rtc_clean_outs(rtc);
-
-	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
-
-	ret = pinctrl_enable(pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
-
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
 	 * must be initialized
-- 
2.25.1


