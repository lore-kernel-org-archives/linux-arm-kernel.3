Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FBDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=; b=cq2N9Bj//kgT7lkZKOooHph7+o
	kpnB8hKm/7SAx4yXVvvE1WT6AcF44yM5mfq1KbcZEyLlBcD4Ri+FMMCUdkUq13ZWMgtPNP5RgojJ7
	xLYjyeCefi5XOR/IxqmX5cUWZWywtP/Obr8snJWwbubwnwjTKR0t/xfABuQDpB8PdICzYfkNYj8l8
	5GA6kLgOwemfce0spfVWpcYtNNfZoeQ3fshr/r8P4nuvE4QKFnmJImbCLcBzebFFs4a8a9m4+4qxl
	znIsOQNRmfbV+TCr0TZ5nqyDtOOpeLJZnFAV5jLV3sqYWKconvVq7ZdmC9xhm9minCK64tXdfKic2
	wIUtxYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5s1p-000000005aR-03gT;
	Fri, 18 Apr 2025 20:09:37 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rsO-000000003vw-2F8K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:59:53 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2d522f699bcso512884fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006391; x=1745611191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
        b=psiJlePMHDRRI9Ms4rMh1nRpQmUNcvcFva1r1rocV6NlVos8KP1LYQGeAK+KERM4Qm
         stA/4e3MZrY37OGFvTKeJpFgI+TOo6lBh+bQ/IxpieghH/c7gRwr+C8MACe0fNQKIewI
         goj/Cb5mNzpR4FIS+atvlaGgCTedYsToevJxK2xoT7y4/I5xzbRRL3lWm51rYIv3Pyih
         YIS17mqetEmGZRSjTHZKu5XVGxE5S9U9Hqaw5uTNMNe09Y773jrHcqi8AM7oOvn3d7qp
         BuIMp73E54r08xqjXIQTKOGoIR0yk4lrTALq3r5i/oXpiBHtOH8qyPoOWPGrKaU0u/gi
         HOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006391; x=1745611191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
        b=CCr8yDBdIuVhb3CwC0NjveWK0Wf+fz635lHZzhWMYRn3G6SIzQDD635pD7R7kD8H50
         VAWo9kvSbQxrPEj7tzBkl3RN5sP4zeY9PTkr7kNgdFCngPplbZGr72N11o2KFn59oDwJ
         HH05BaQmIQcKBSqPudpbU2GAdAAjhFVun7YYAohVM6ryimDm58HBDrGMkMpSTUuNbBHb
         cQrSu3j1db/8+DE/RrJ8jo1iDHXp903UiBUZim7qY3dnSm+xyv3B3DLhI4YNZ/cNtKgf
         Xzu48VYENsNnVVhJk3FL9khaiGuNpxpuLARAoHASwIwKm8049FpM9ycn3j5W0h4gNuyy
         AQOw==
X-Forwarded-Encrypted: i=1; AJvYcCXctg8jIC+z9leqbVWKNEyt1KrusPvQe3LLsCgNcDy29KM+KnK+XRTTIYufZU2ADYrvR+vQKYZATHmeL6pOZOn6@lists.infradead.org
X-Gm-Message-State: AOJu0YzkuFck3CHCab0xEaHQaCTh8VZzNlaQbKiXuQyqAmI+kaUoWN+/
	51v9B1icNXlVcppyGQB2E6IgsnUfzBAampGXT6lS1M+gVMS4VTZ46uju0tX5KrU=
X-Gm-Gg: ASbGncthB9727rHRyCwgUQnd6euyo4KyJuA6AcFwG6oAyT1CPVmfxCzC3keYflVVCXY
	deLpnzPkQMk/9rA6aHUgLNv8SfEPDhs/D7/FZ8D7hwyBW+fMd/4FG7Z8aM3fHy1dk3n98x3L5l7
	K6OYMh8P/tOsJUMHx1a0prClHBwKH9mptFT1NF01pRP6Dkmvrf1kjIVlJH5yjtT7iFxyjWM/xP2
	KAWebEYxze8LjRdSApNUoebgi6bB1OzcIwD7AUX/6ahgdkzx6h61Lp0JGY4pl5hS73cFRL7OLLy
	yImVUv6A6FZl4EaludJL8kIOh5zWpWfZYSJfCrQWGQQrjDs=
X-Google-Smtp-Source: AGHT+IGTd+UcoiQqg98qqmDzGZdASpO+rjK08cJZPLUbdLs/qVHjgA1d1/DCHAAtJdt7FeGJ2N7IOw==
X-Received: by 2002:a05:6871:20c3:b0:2d4:ea06:b11 with SMTP id 586e51a60fabf-2d526974c88mr2268314fac.7.1745006391551;
        Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:23 -0500
Subject: [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct with aligned_s64
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iRPzfo7zOSrCZBlrpd/I0/sbvP0TP23KOBXM/qSN7Jw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq79D0iiaEJ7LNLOItStpJpxJqxn63IdcoEt/
 O8MZKI+HdOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu/QAKCRDCzCAB/wGP
 wFryCACU4cYnN65V5Ne/n/6z/OCfHfoj4mdaoDqdml74vivWqgwTQqSV08oOzwAmNdPjVpxHSXD
 0nV50P/Y20VUEYVHpoJpuUArnFK3lj7jB0SBcX1rOuNCiqtNyuYHA1oH7V+l8/ctZyprtDBzN+k
 gK/IXGShh2E9A4LnYDTDmcfYOS8PHX4JG2NLolVn1LtspWso3m0L/YQH3GfD4+YmyH04/gl4e90
 s36RYJHqALm6OosMFi88MgyyV+9swKXmDAnPnEwmPidTyoIw8bCSdq43K+35GA+BJhDJof0YEmY
 2jSaIuf0L/a+vzPf70hFBbjXqtsIsUHiJSzg6uij9QXSqVg3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_125952_578923_798B3932 
X-CRM114-Status: GOOD (  13.80  )
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mxs-lradc-adc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 92baf3f5f5601b863c694eb03b6d8f287e4fe6ab..73e42f0ebcaeaaa437ba5c64ecdd7759a1191e6c 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -116,7 +116,10 @@ struct mxs_lradc_adc {
 
 	void __iomem		*base;
 	/* Maximum of 8 channels + 8 byte ts */
-	u32			buffer[10] __aligned(8);
+	struct {
+		u32 data[8];
+		aligned_u64 ts;
+	} buffer;
 	struct iio_trigger	*trig;
 	struct completion	completion;
 	spinlock_t		lock;
@@ -418,14 +421,14 @@ static irqreturn_t mxs_lradc_adc_trigger_handler(int irq, void *p)
 	unsigned int i, j = 0;
 
 	for_each_set_bit(i, iio->active_scan_mask, LRADC_MAX_TOTAL_CHANS) {
-		adc->buffer[j] = readl(adc->base + LRADC_CH(j));
+		adc->buffer.data[j] = readl(adc->base + LRADC_CH(j));
 		writel(chan_value, adc->base + LRADC_CH(j));
-		adc->buffer[j] &= LRADC_CH_VALUE_MASK;
-		adc->buffer[j] /= LRADC_DELAY_TIMER_LOOP;
+		adc->buffer.data[j] &= LRADC_CH_VALUE_MASK;
+		adc->buffer.data[j] /= LRADC_DELAY_TIMER_LOOP;
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(iio, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(iio, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 
 	iio_trigger_notify_done(iio->trig);

-- 
2.43.0


