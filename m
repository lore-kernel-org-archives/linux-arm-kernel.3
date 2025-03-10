Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC40C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPurFq/fNhKB6tsK5KqiD0Uogf6Ze1eS/AV3KtY1Z/8=; b=TXkS21nywihd4gLm5b4+6dEngG
	+ClbZu3XARQzJP55X+c2z4BHDwektCxPWRJMPte70kaRU7ZpxGdmhHJ8fvFxFEi4muxm+aeTez82F
	ax2bqZIFum3RENAXIyhYLxwn+UY/dqyWwaP7MLClx/mzgZKeHw08EL98OHTdgx5/t7YqEMeHg0b4x
	iefvW7kGwrtlLuGLqh9YdqGYcJxBQAUz1TWWDtBYK40o4hvvDlE0U+PuhDWklQ7evnuSJYIlbc2wr
	h6L9nuk+GBFUIng/EVJseLCvWoKYEf9QsUELwLk6Q9rtrvfpkm0tx1mUcISLzA/DWDwQRMkUWdIkc
	Grxr9l+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfBT-00000003CHO-0t7D;
	Mon, 10 Mar 2025 15:36:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treE1-00000002wbB-2uPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:35:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224341bbc1dso46892235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617325; x=1742222125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPurFq/fNhKB6tsK5KqiD0Uogf6Ze1eS/AV3KtY1Z/8=;
        b=BB3cD+inPntbyIt7oo7M5FF0fFTMmDIe6bXawjeKXeLMlbUaMRSznjqSrD5AMn21JQ
         vzYQDDnuo4Ikw/1vcC7UWHgtmW3MbI5QI4XYAbMjDanCsa+diuOwViQHgb5aTiGKdTOw
         MtLD2IkbhFmxOFmBiGG77pmXhk5Vv3eDEAkTLn+3bmxXvKpUutH8+XEU/kZJgIB+lKyn
         uSEkwactFOm3/PeTFDZgBcwLx9LUOZwhX6D4o9U1XuEpJgbcntxs5PdHUHo08EeKwRCX
         e2WES5h3wS9paGGr3+x0fg5fIknj/4mNVGgX5ldsOARFH7wXr//h8q2OdwiZIe9BD5bC
         UNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617325; x=1742222125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPurFq/fNhKB6tsK5KqiD0Uogf6Ze1eS/AV3KtY1Z/8=;
        b=bP2q48dSHMpr7P9fwvhhfXMVv/ziNSEghSDDC137pBUZ5WxtxbUAXNHe8EH6PoK1/c
         5z88kWQjiNWajprmqMQSBs9nQoTIK6oMIc9J+n/JglREU9rqLjlIAKK66rxhVPHJ9Num
         5eACXFkjQ5ZMaIGZF3Z8ieHGAz0PQ4J3pwFKm4eZs09SR8MAOqPxiRW9kQELjpflhfrk
         Xk9rgn8uqZUsyUUxWOY2ly8lPZjP8gcr2L9iybhdqcGHA9KgcAby7sxiQ9saDYyAgr5A
         xco72vR1H3F1YfvXQz9XFToyFvLT5rQjZPTiBUw7B/4ExJVXWRgoKu7lBwntifNpmNoC
         MPXg==
X-Forwarded-Encrypted: i=1; AJvYcCV3p3kQh6DfDruziHfCL4JV53aWSQ8I5swNAH9fUT9OFh9vAspzR7yS0A3wkQ3mdHO7x6ujgkgVxAAYMV82Tfry@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkp+irb1QUHBfxOlbMrdz5FIzMZu8KRgO9x+KfJr1lcNflKPSF
	ri+PwR1mqV3j/3SlOAsCbLXKYW+iVw5f8XkPmNbzq2YXTRtE7puu
X-Gm-Gg: ASbGncuYuSRmgfEK+i5Efl4qaxDIRi0UjyYoeKMKQ2jYYRjLPZPtr8ON/wqvx2mc2a/
	EDNeY+7RpZgkRvM+DQ0JKMqu+tVm/85lGRhbRVmyMxCk/qjupuYrBZPITUs0PFaHMxybMoRniNV
	ppjF8E48stIGdwpiC6KD/+ysr6q7rSoQWIs6/7T4TzstmTQtoD+ab/5Kc9t5XOIwtuLdYE1jwwm
	WprTzOvh66dxVh47x/IkJL1v+P4dHChh8A7fqV1LZdugDE69zUX3/bSaekO13eS1DcSZbG4ea15
	oAWZOnp0eUuP8qaTv2XDyJXkvOhiWsNO8kT3YZCjY+5NTYOqcmaB6ynmEJL47YhnoZFC8A==
X-Google-Smtp-Source: AGHT+IFlxn30vbYNMpCGqOkZQC/33f6L8EuwlU4MuG+cJmyHdrmp3tS4C+2fi8L46Nfo+WlDit4hVA==
X-Received: by 2002:a05:6a21:618f:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-1f58cbdd3e9mr5565637.38.1741617324889;
        Mon, 10 Mar 2025 07:35:24 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm7785900a12.30.2025.03.10.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:35:24 -0700 (PDT)
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
Subject: [PATCH v4 4/4] drivers/thermal/exymos: Use guard notation when acquiring mutex
Date: Mon, 10 Mar 2025 20:04:45 +0530
Message-ID: <20250310143450.8276-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310143450.8276-1-linux.amoon@gmail.com>
References: <20250310143450.8276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073525_732420_787043B0 
X-CRM114-Status: GOOD (  17.90  )
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
v4: used DEFINE_GUARD macro to guard exynos_tmu_data structure.
    However, incorporating guard(exynos_tmu_data)(data); results
    in a recursive deadlock with the mutex during initialization, as this
    data structure is common to all the code configurations of Exynos TMU
v3: New patch
---
 drivers/thermal/samsung/exynos_tmu.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a71cde0a4b17e..85f88c5e0f11c 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -199,6 +200,9 @@ struct exynos_tmu_data {
 	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
 };
 
+DEFINE_GUARD(exynos_tmu_data, struct exynos_tmu_data *,
+	     mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
+
 /*
  * TMU treats temperature as a mapped temperature code.
  * The temperature is converted differently depending on the calibration type.
@@ -256,7 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 	unsigned int status;
 	int ret = 0;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 	clk_enable(data->clk_sec);
 
@@ -270,7 +274,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -292,13 +295,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
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
@@ -325,12 +327,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
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
@@ -645,7 +646,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 		 */
 		return -EAGAIN;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	value = data->tmu_read(data);
@@ -655,7 +656,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 		*temp = code_to_temp(data, value) * MCELSIUS;
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -720,11 +720,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
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
@@ -760,14 +759,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 
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
@@ -987,7 +985,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 	clk_enable(data->clk);
 
 	if (low > INT_MIN)
@@ -1000,7 +998,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 		data->tmu_disable_high(data);
 
 	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
 
 	return 0;
 }
-- 
2.48.1


