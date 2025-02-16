Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6323C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNDUgkHOvW2TQ9tKHoRawdYQbA3LIUTfvAXYbhOHBfQ=; b=C246E0qUauu5txkKBo00EXa8pp
	6DiN3k4h71C8qeYiL9rqoooESLHKcw4jSXz+oUrwKu3CwiSK3lr0mMWjd1eP52YbJ1Xgo3axS0/RK
	LZOTiFfVw4yymPJrvtg6m/PwpM/tR7/mg8teGmnRnWD4eEALoaPm4ZrrB8A6aKRiE2HRWiQefk6Ze
	CrixtQVfibcZaPHrqdYkfqIhtd7mc+lrjQXMJi6zNBirdZuPVF8JrzhT2xZfQBgdkyogA6gCL33Qf
	62/7JCcYMatFhJcdvBoECobmLKME34ppvDtf6cpXQimxwDsN8RkvgApWfu8okmfnOLifGng5zMe6f
	ySDo6pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkrY-00000002W91-0eWK;
	Sun, 16 Feb 2025 20:03:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjknT-00000002VWF-3qOe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 19:59:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-219f8263ae0so64030275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 11:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735963; x=1740340763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNDUgkHOvW2TQ9tKHoRawdYQbA3LIUTfvAXYbhOHBfQ=;
        b=Lesjuj/8zoxx0SETHLgynbQ7Q0Ir+IXDHnpsIUu/YE0JPGfSj89TgHthG6dUvVfz0h
         q6cwzLykdxflpDM4TKs/UaZBbf02LKL4NrYDEFG2rk2m5JI6w7SagmjA0iJTkspzdknb
         IZ9TRjQ7PRDxsZffWmXAXU/JGT8A1qXYaMORs4Zyx7sP/8ktjVBpE8ryzC50CgCvC8/5
         4AVk8SBwSkrXCP4F8kvRSpKdN2PiH3xzNA0invcZPeRbTs0GclulCmY1SwVJw6mDDR5Y
         cGHJXSWSTzjUaR/ECJeJicSh2PxZNhHqgSnqygNqxg67KOe9F3pu4oBLEetF9naLXOpR
         Na0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735963; x=1740340763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNDUgkHOvW2TQ9tKHoRawdYQbA3LIUTfvAXYbhOHBfQ=;
        b=ZKCUWliEYeg2k8jzQ3SevKlo6t15QK1yE7jDtCiXEMjpG3IwZi2qC0qJCRa+Na1P82
         smbYyhfTk8Wacf8o5EM/qSTZkP46tPyzwxda0nCzM0kYQKAe3NOAQOZbCf9Rx3WgyeAd
         tAh4McLW1o0kjVcY9HjU65dhVZ3N1XxYqZYI7qvgxA0NsNeRKdR4zHzKPfm4Pndum0hF
         onHRIvJfeqwJyajFfSH+u7xOAdntdpLKnZc5kC6fiFrdvXqwm+mYVI2+4wD8mo3J87pn
         8KTITpCc4aIzcKYNSKNdrna4a4NklPtzuhUv89f2NpfCkMHLITCAAA/CN4OLez20ku8v
         gO9A==
X-Forwarded-Encrypted: i=1; AJvYcCUA0cJEyE8IPfF0HzLxu7+ZQoVx/BKuOx5WauJC415ggJ5hsQlTtRbpo//lL8dHnvzg3qxyK1IYAzUmDEF4lnzS@lists.infradead.org
X-Gm-Message-State: AOJu0YxJF+KJgCyITtnRJYTuArucdQR2zl/z2eBtM39uJuxOpwtBhAP+
	9AmKqyzg+/5ixMTzOxhk472BA+HvzjNk/f4wjExsMP5Lcl7hWrJ4
X-Gm-Gg: ASbGnctF73un8/jKXDIAKP7YnnQw1k/5gxVWrtSchHODlfVWqwBE+dzecHoSN+Bv92E
	zDIV8PYhghvZzVPaTpSSq5PMA08hblWkz+Vo8UmD7PtIReAuhAG/C4y6eqX+QWw6X3dyzY3jshJ
	ZWq5xfkamO7xE9NsW9UDXzf4oLHkxwCf2rmaZoS6fPkGEluoJPuR4pnouMh962Uy0jnmiLmxq9l
	lyyNAHPQhMRDDjWf3hS6CCfWoIs8ywHApmrReKlfbrCDYdNojV0adCNsW+YQGx4JNJQDPh1vTEy
	vS6lsm+6N1eI/y9emkoBlrbhpebF3Q==
X-Google-Smtp-Source: AGHT+IEUSK/sL4gi2aLg69L2RvsgLCz1QQ9HQlsi/sHzB48lrdXXIwILZrddPrIHBAHT6tkw84447w==
X-Received: by 2002:a05:6a00:2d95:b0:730:7600:aeab with SMTP id d2e1a72fcca58-732617dfc60mr9838175b3a.13.1739735963046;
        Sun, 16 Feb 2025 11:59:23 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265098570sm3023559b3a.22.2025.02.16.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 11:59:21 -0800 (PST)
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
Subject: [PATCH v3 2/4] drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Mon, 17 Feb 2025 01:28:35 +0530
Message-ID: <20250216195850.5352-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216195850.5352-1-linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115923_951244_B6CFB4E0 
X-CRM114-Status: GOOD (  14.34  )
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: improve the commit message
---
 drivers/thermal/samsung/exynos_tmu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 9c138772d380..8d26000c73aa 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
@@ -1115,8 +1113,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 err_clk:
 	clk_unprepare(data->clk);
 err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 	return ret;
 }
 
@@ -1128,8 +1125,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.48.1


