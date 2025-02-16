Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B551C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 20:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHP5M3yeaCi7IF7vXp1agOw6DIq9vLMPFGh0uk4OOmc=; b=lkI7l0Ai/JutbMz45sL0JD1LUL
	ElotBLEttHGRJHGuOBbwExAgHCqp/DFLuDbJ2HLFf2F8E1VLigTgG26GD7pYRKAs3+f6yrkVPCGvq
	0mAs9LeLqKCrfvJw+DqTzKqFpUj5XnDF+SlJk/BGbKVBjA5lCbZQpbM8D3MA6rxAqtApv3H/12jRV
	SRrhdo6B2lZRbm+eZ7+91Wtp3YUnNoIcesa0sYTA1CbtYnD3LeRQg0YM6p24tAZO6rCHq4ROs8xVS
	x+PE68d7ScBsD9ErzWpJUI9DVnce5YA0lmf049dHH+XOM5IbBzjG/loXNjC6vFPe70X/rzBowo2HO
	MWVh6XHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkuO-00000002WRJ-25zp;
	Sun, 16 Feb 2025 20:06:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkng-00000002VZD-3CEM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 19:59:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so6942786a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735976; x=1740340776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHP5M3yeaCi7IF7vXp1agOw6DIq9vLMPFGh0uk4OOmc=;
        b=lhBSQiBBYBQWzatCAgadxW7XmR0U14U57/ar4PuO33TSQOMZUT2BySOolcjmWZR7vu
         lGe14nflLL8SPr+sVwDYQtLE3TjsUb7HwZRFUpVK8j7VIVBS+m0vKVktIaNsQLpsKTjv
         rFM4EJgDYfzp1oDy6fPvjhGWTxW+de2nNrb723jBxtEY3oa0o6O/bJ5KbuoWg/Ok/zpS
         Hp0r1rAWKI5rWdohqOOYn9KHggzp8a73LvnkfV8sJ3IK1COlmzhWukc/5Uxs0YvNnbmD
         kOi/DeITfQRPI8Nc2cYfqsxi+58CM/0LcvDVnXrfFQw8vzFEKMquLUXIrCAJPA7FlPjh
         XARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735976; x=1740340776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHP5M3yeaCi7IF7vXp1agOw6DIq9vLMPFGh0uk4OOmc=;
        b=SqvCxPZ3DVluX2UAc00ysycTkicp/782Nzqn/j4oAR/W0Xx5JMpBpi7aWsdl7+9J7v
         fSFgUkN53lTS1eeFxmVc4zXTn/r0oSVq4yenyig/dUCzYKwuHf8rrPAW1RRdSStJ1Rkz
         e1DQaPO949tv2xk1shtXOCxBt1Ph8/fqB9tzr+28SoxZk6VHeeiyG7Th36qk7HjP0Y59
         G6S49NsaP74VA3iyoINcL9qwCDrDh4DECcYsqKQnwulBgOZW+TpPmyzaxqG8nuCLkPD3
         0VDvqbc7kRJIJyLqIGh6Av73j0rHHaUobQur/te/ksYSUa1CCHXkJjkCFyPdBUSWwdNL
         vsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZDfgqQxPIG8Oe8Oi2SGBJ8/07+z5MLUCq6sLMs3j8cRlRvd7KhijEy4IL1co86qS/TzX8BAt8xFWhTFK2BETx@lists.infradead.org
X-Gm-Message-State: AOJu0YyZyCH4BNdhxnQb9SjPSX2EOWUBYTtDO76a0dCUOaHWXmvcdbaR
	Ijy0FsfZrAncjhfzVP7Z2xvynzzp1ZaikKHIxTVGbh7RVVgqr1LH
X-Gm-Gg: ASbGnctz2/9HMPe0nyq+/13ilrDPbyFWxWdJUPOjx1DPjy1RcSryQH3tQd1leMqcCAV
	6Q7egjciG2riEiARiwt0LfkeeSEpIGC0zmNatkTckn2h0O904gs0Cm5INVof+7hEumgrQPdGBmh
	4xR109prD3cvROq3XBPu8XeVDOH167PBUdXAcP6vUTccHZd2UrL49fm84XuE0+f185sIdHNdjWZ
	RhJco5xXgE03wKD7xt4+4ew9gU9Y7kPzpZgCLjDouONc73XlD61ajR4GtFg16tas65tC2WqjY73
	G1oe8iu24mp924oHG47ZR3RQuvzJaw==
X-Google-Smtp-Source: AGHT+IHBlw/ULOY6wy1JfyENVCkx1GmwQZMDVZZdLPpzLlvKhW8EBtZbG/71OUMbBtVJDDU3RGHmAA==
X-Received: by 2002:a05:6a00:2d0b:b0:72a:9ddf:55ab with SMTP id d2e1a72fcca58-732617b5545mr9505891b3a.10.1739735975841;
        Sun, 16 Feb 2025 11:59:35 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265098570sm3023559b3a.22.2025.02.16.11.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 11:59:35 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 4/4] drivers/thermal/exymos: Use guard notation when acquiring mutex
Date: Mon, 17 Feb 2025 01:28:37 +0530
Message-ID: <20250216195850.5352-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216195850.5352-1-linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115936_799024_1A97AA97 
X-CRM114-Status: GOOD (  13.98  )
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

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: new patch
---
 drivers/thermal/samsung/exynos_tmu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index fe090c1a93ab..a34ba3858d64 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -256,7 +256,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 	unsigned int status;
 	int ret = 0;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 	clk_enable(data->clk_sec);
 
@@ -270,7 +270,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -292,13 +291,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 		return ret;
 	}
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	data->tmu_set_crit_temp(data, temp / MCELSIUS);
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return 0;
 }
@@ -325,12 +323,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 	data->tmu_control(pdev, on);
 	data->enabled = on;
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 }
 
 static void exynos_tmu_update_bit(struct exynos_tmu_data *data, int reg_off,
@@ -645,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 		 */
 		return -EAGAIN;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	value = data->tmu_read(data);
@@ -655,7 +652,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 		*temp = code_to_temp(data, value) * MCELSIUS;
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -720,11 +716,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 	if (temp && temp < MCELSIUS)
 		goto out;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 	data->tmu_set_emulation(data, temp);
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 	return 0;
 out:
 	return ret;
@@ -760,14 +755,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 
 	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	/* TODO: take action based on particular interrupt */
 	data->tmu_clear_irqs(data);
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return IRQ_HANDLED;
 }
@@ -987,7 +981,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	if (low > INT_MIN)
@@ -1000,7 +994,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 		data->tmu_disable_high(data);
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return 0;
 }
-- 
2.48.1


