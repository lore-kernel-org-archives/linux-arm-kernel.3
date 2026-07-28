Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A924C53209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FCOP69TPCNrGBnhvWYc5AWzDXdjWfSA97RAp2UWvhJs=; b=GToZavT5nYL9I5euNHkKUpBEyr
	TO3Now7DSkWhczkzvtFdql0dFbQ8+w8j7jskgAIEX0EYkS92vhdhGN9cBtiQk3lfyJgH5TKWSnwwc
	YP/G9EViCBNlPCd8Q4Kg1rjIZT+xBI4i39FSdau8etwW/Kk08kjWAAf7ehPffe8AKC6UrkYr2oRAf
	S+A5gpOy6I9ktj3lH1drrw1egFTLLT/8MjP0EnfDYzPedqiFCHBFD+ODhnDwqiwEmnk3tiRMlrKXE
	/AwN1GlWfzPVz0ZUe1kGIG0gRr1SE8gtLi67fZGauEejuxvX6Yfh+2VVo9gKA1dyROlAOPrb9LxYu
	4JA94Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woW4D-000000049pF-1D72;
	Tue, 28 Jul 2026 00:53:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woW4B-000000049oq-03kI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 00:53:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad4170e8eso50265215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 17:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785199986; x=1785804786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCOP69TPCNrGBnhvWYc5AWzDXdjWfSA97RAp2UWvhJs=;
        b=mHQjwROynAozgLWf6aqk0RPUgN0ElMnpBCPlakDjai6mxu/DtC1itG8FTtGQQiwvu0
         VcSd7F+UJFL5k15ZUFn/gAXKZIRTR+fBBWjnphj+i3wgGLZ+lQ3UYpAASAeGRtvU9Su2
         qfHtFk8T2B9VH7hpW/OZdwmvYwWYr4iZtmXGb62RX39bNev2LESzkVQ9lvV+zPhMHmnf
         2LudREFhk13nC2wIsiDjRM8AqxfFyB/jcITLv2YbQD55YuTbTIG4DqsHZINkowknbMtC
         VxiqSNhQPF2KhzfGDmQmZwyEW/eVwLvuGQ5u0D758EnUHI/JgublKN/9gzEn42InHTRs
         Kcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199986; x=1785804786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCOP69TPCNrGBnhvWYc5AWzDXdjWfSA97RAp2UWvhJs=;
        b=dTOS92F+jxrf1iJl82U4GEwwi20YMNyB7/4feIH/D+yxf63lPxZ4ClQvJUTFcBjja+
         N/LIkSkcQ8Np9G7YWmerAPQZdBUS3FLOzZpryEmlgB8KBZU0MNZycjoPCvwSQgmpU8yE
         neKG3BftNpeEhuG6LjLXPdBUl1LJ5vgPVrXY4u+CsDcZwUOMfS6yePaeeSUik+WM1/96
         tw5plv7YS3o81S6eB9hr4xMv6ak3ZqSvGzG2YTpsz14SB2YtDa4kY6tuVwfjhmWGmW/s
         d+7WxqtHVdO/7pmeaxBO14JuX7/ocO3nfc8c1Ij9TYDClT7hMQ4dIXrcWm9LHFF3qEvn
         yQ2g==
X-Forwarded-Encrypted: i=1; AHgh+Roqo8S7XlmPefgR2sAIcfndC85O6Ut7k2jjkv72HzZqd0Dn+ELwcEEkJDM7IxGnF9fhD+5uH3fvvLndgw2TBGiG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+qLkzIEdBUAXDsL+t4xhMSAEd8MJu509C5aqq/RyN5++hDjVJ
	Tflszz0rulAhbq92IbFuyxAIjuP6QnKsWuDPvKR+xUFuGjDJLkNvXHRm
X-Gm-Gg: AR+sD12cYL5I5gwvUcFcG3AwuH8wW3xlCfE1AAkld3oQRrgpeiFryQTaob7XzJj6RWO
	QObtCSOL6ZKD50NyPSooShUcKloWHuR/w1kgF378ErIt+cjcDnC8DjaabStkue2JQ8eR5zZxqgY
	ND03zfxFhAj3uhWTQGmEoOuKO/jSSxXcsYtklnKba04MoVpxoKd2bn3r5Du3S5UoGjEYUozjxqL
	2bS9gpuMaflC5UmVqerIlP+RD7wOr8uB9LQXmCWxUeHH8DyJurf4n1eKnOPRY49insxQxHPnatt
	vG83fljZemKd68QCLxu++sQZpD9QPRZMOVOEwbBvt2YobqitgEbTtiwhFayVYLBKq0APCO8HXkx
	7KHP7Sa+TcrA7b/X0Pp2PwfokT8ZXX3u/OrPNCsJJjNnBqdOCObaa9hxn6sdLsqtFjeHCaeRAxW
	xMQ2IqUuZmNsVcHtGJ1jZG8G5L5CX9vqeJqIgxdnVIhsNbFMcWrIwNEl7hYd3r5TqCarT4Gj2t+
	iqFp1F+L2IT4s6VkIMTog/xCs7712c0kro+7HIUWmIqcgLfe1oXlJM=
X-Received: by 2002:a17:902:d487:b0:2cf:9f0b:b562 with SMTP id d9443c01a7336-2d015c37bfcmr2283295ad.22.1785199985971;
        Mon, 27 Jul 2026 17:53:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e86ccsm42283435ad.33.2026.07.27.17.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:53:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Mon, 27 Jul 2026 17:53:03 -0700
Message-ID: <20260728005303.574936-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_175307_087251_BFA5960D 
X-CRM114-Status: GOOD (  15.34  )
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

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Remove irq_alarm from private struct. It's only used in _probe. Also add
check for platform_get_irq() errors.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add platform_get_irq error check
 drivers/rtc/rtc-stmp3xxx.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..e789458ba96a 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -56,7 +56,6 @@
 struct stmp3xxx_rtc_data {
 	struct rtc_device *rtc;
 	void __iomem *io;
-	int irq_alarm;
 };
 
 #if IS_ENABLED(CONFIG_STMP3XXX_RTC_WATCHDOG)
@@ -245,29 +244,25 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
 	int err;
 
+	irq_alarm = platform_get_irq(pdev, 0);
+	if (irq_alarm < 0)
+		return irq_alarm;
+
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
-	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
+	rtc_data->io = io;
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
 	if (!(rtc_stat & STMP3XXX_RTC_STAT_RTC_PRESENT)) {
@@ -354,13 +349,10 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc_data->rtc))
 		return PTR_ERR(rtc_data->rtc);
 
-	err = devm_request_irq(&pdev->dev, rtc_data->irq_alarm,
+	err = devm_request_irq(&pdev->dev, irq_alarm,
 			stmp3xxx_rtc_interrupt, 0, "RTC alarm", &pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot claim IRQ%d\n",
-			rtc_data->irq_alarm);
+	if (err)
 		return err;
-	}
 
 	rtc_data->rtc->ops = &stmp3xxx_rtc_ops;
 	rtc_data->rtc->range_max = U32_MAX;
-- 
2.55.0


