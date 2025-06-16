Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20A4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NENnjXNt0wBvePMagFMwcD8o+YQQgij7ItxOPmmF1pQ=; b=ZVETgS3JL1Jwzt0+VZEjbIpuNe
	10hTgyGavsUM3RJf68Pl4X+RYn9wfHT9ZrdRRyD5ZfrAALHZ5HwT3f6WN2lP2Y8xSv9TcbhZxhOE6
	khBErkLxLsY6hmUUnea8+t4FR0sI5XHVMwFI9wfmyWwmsoCE+8Dx9LQwHV130vx2j6nmJEZFAZexe
	0IyP7oHSyp34ir8Xq6BBPqoduehLWD+tGsO+QJB3K4M6nOhRbhyf8ZWdIchsF6ANDfHbZ7Dkgmx0m
	OHWAHq3T757vxeb2Uz0GRFGPsXSYeGvmFw631QFQ/eM/0KX0D4ykwbHAp+dfByyYw4xafqFFgsCI4
	PNYP2A8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaO-00000005EHr-2TZK;
	Mon, 16 Jun 2025 18:29:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCrW-0000000523z-1jYg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:39:11 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3081518a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750091949; x=1750696749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NENnjXNt0wBvePMagFMwcD8o+YQQgij7ItxOPmmF1pQ=;
        b=eTlzb4kMMcfEpRBfInfXFHNUBZDZXbG6g9B1EzHrCBknOJCY9u41z1335Rv8ECUgNB
         xVFdiyXF7fwxSlF3lTq3ii62+qS4hwVFXK2zBRqZg40VaH5VcyYRJai6m1G5L1kRBF8v
         HM4x0J4B3uaqt4b1zRL7U9IxR5nu8dmXZ2EIBiWXuAZjT/MIwYzj7xqTcgMlgbLAo2mm
         YJTgc9655izceKlRnM8v03vpCX1+VJCFclMvuKTAsXoK3ghJO15BNmHIjr1wDEySrc4C
         2UwGVLqSISDWTr9D0vHVftRaLPGTSbl3rUHeM+kI/vSO5r+hwFn35yrvjVWA9/nH10RC
         AtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091949; x=1750696749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NENnjXNt0wBvePMagFMwcD8o+YQQgij7ItxOPmmF1pQ=;
        b=vyaLu7J9We/fGZaRqIvbAVqrCxIVRLyMt080ZIKnAuVyi/v1RZ7KqoCoW25u0k2eH3
         7COCE+L8NmLlXCQ6CtVFMqvZkLLZSsqHWOzJrIcHX79O/rxRUYV87LzAt5iWLd0Zcfhc
         jLcSDoz+zylPTJBVCj5C1WHqNAnKwLkLlRhUbKo5zDZgm/isErBuksuJ6nzrI5QBBeWT
         rR7bLBvA12OxIqDb3DwdBS+7/iV20rKIPOlR7h1kc2wHD2E52nnkFgNadr2UBp/YNPhH
         GIgK0+CYgE8Qz7EAMIatOGFSscE0ziNQX8rrexLlurjowENs5QiEEKZ3HBrc/rHIGqRc
         y/WA==
X-Forwarded-Encrypted: i=1; AJvYcCXIriqco5tKF9JhX6Asy6YF1NUrALmXsVZUqeLU8253Kf7a7Dmz7D6dqFIqMUpu2LdcJrNOVEpVA53AoZdLpVHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzfxOBWcLwNAtEJmV4hk1kcUc7W1ked3B81vM3S3zJQ3BIvfzZ3
	aFkVQKsQElUr9kRhycPRk7mt8yJXro0NrwnI+UVE6jAjiAoTN9bvGH0q
X-Gm-Gg: ASbGncvqBD9XsRReOpiQc6O377/Qft2C+AroJfU9p429Kx974a3LfIDHfIPac1C9m3K
	pPMkR8cwj7oevAV4i0lVwB8ZkkPI0JjLW5v0exhPp1iQoiIMsNzA2NGd30iQwz0f13uBbYwB2TK
	RJDp06O2ifpHsh7RIlVn0tXx78fM2ZqO+V72daSHRRHLBmPFww8KNL3DQQmlFghms+OrYN3el8g
	3wmsDAt4zIY8HPmNBQ/mG3Syw/Y04CLj8BC9js2XhCZdtLwBWPhubD+MCJ7568kqd9oWTCK7/yr
	wsyp9YmjS7nHTwTyZwPI4DubM64sfqJGFKzTL6P0InfVwFTKeblVDwZFYJzNT4W9ur8iYK7Zl28
	JauV4TwrFEA==
X-Google-Smtp-Source: AGHT+IEzKLhcWIZ3LDLciV8dMwLIe97BcGEGz6hip97KqxdgaXHo5SkRpJ0h473Us9HRL34KZAj9pQ==
X-Received: by 2002:a05:6a21:4612:b0:215:db66:2a33 with SMTP id adf61e73a8af0-21fbd4ddb8emr14603050637.16.1750091949552;
        Mon, 16 Jun 2025 09:39:09 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c6asm6067882a12.42.2025.06.16.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:39:08 -0700 (PDT)
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
Subject: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature threshold interrupts and clear corresponding IRQs
Date: Mon, 16 Jun 2025 22:08:23 +0530
Message-ID: <20250616163831.8138-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-1-linux.amoon@gmail.com>
References: <20250616163831.8138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_093910_462330_ECCA8D6E 
X-CRM114-Status: GOOD (  20.85  )
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

As per the Exynos TMU user manual the interrupt status register, maps the
active rising and falling edges of interrupt to the appropriate clear bit,
and writes it to the interrupt clear register to acknowledge and
clear the interrupt. This ensures that only the relevant interrupt
is cleared and allows the system to respond appropriately to thermal
events. As per the comment Exynos4210 doesn't support FALL IRQs at all.
So add the check accordingly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 48 ++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index c625eddcb9f3..b7522b7b1230 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -70,6 +70,20 @@
 #define EXYNOS_EMUL_DATA_MASK	0xFF
 #define EXYNOS_EMUL_ENABLE	0x1
 
+#define INTSTAT_FALL2	BIT(24)
+#define INTSTAT_FALL1	BIT(20)
+#define INTSTAT_FALL0	BIT(16)
+#define INTSTAT_RISE2	BIT(8)
+#define INTSTAT_RISE1	BIT(4)
+#define INTSTAT_RISE0	BIT(0)
+
+#define INTCLEAR_FALL2	BIT(24)
+#define INTCLEAR_FALL1	BIT(20)
+#define INTCLEAR_FALL0	BIT(16)
+#define INTCLEAR_RISE2	BIT(8)
+#define INTCLEAR_RISE1	BIT(4)
+#define INTCLEAR_RISE0	BIT(0)
+
 /* Exynos5260 specific */
 #define EXYNOS5260_TMU_REG_INTEN		0xC0
 #define EXYNOS5260_TMU_REG_INTSTAT		0xC4
@@ -773,7 +787,7 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 
 static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
-	unsigned int val_irq;
+	unsigned int val_irq, clearirq = 0;
 	u32 tmu_intstat, tmu_intclear;
 
 	if (data->soc == SOC_ARCH_EXYNOS5260) {
@@ -791,15 +805,29 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	}
 
 	val_irq = readl(data->base + tmu_intstat);
-	/*
-	 * Clear the interrupts.  Please note that the documentation for
-	 * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
-	 * states that INTCLEAR register has a different placing of bits
-	 * responsible for FALL IRQs than INTSTAT register.  Exynos5420
-	 * and Exynos5440 documentation is correct (Exynos4210 doesn't
-	 * support FALL IRQs at all).
-	 */
-	writel(val_irq, data->base + tmu_intclear);
+
+	if (data->soc == SOC_ARCH_EXYNOS4210) {
+		writel(val_irq, data->base + tmu_intclear);
+		return;
+	}
+
+	/* Map INTSTAT bits to INTCLEAR bits */
+	if (val_irq & INTSTAT_FALL2)
+		clearirq |= INTCLEAR_FALL2;
+	else if (val_irq & INTSTAT_FALL1)
+		clearirq |= INTCLEAR_FALL1;
+	else if (val_irq & INTSTAT_FALL0)
+		clearirq |= INTCLEAR_FALL0;
+	else if (val_irq & INTSTAT_RISE2)
+		clearirq |= INTCLEAR_RISE2;
+	else if (val_irq & INTSTAT_RISE1)
+		clearirq |= INTCLEAR_RISE1;
+	else if (val_irq & INTSTAT_RISE0)
+		clearirq |= INTCLEAR_RISE0;
+
+	/* Perform proper task for decrease temperature */
+	if (clearirq)
+		writel(clearirq, data->base + tmu_intclear);
 }
 
 static const struct of_device_id exynos_tmu_match[] = {
-- 
2.49.0


