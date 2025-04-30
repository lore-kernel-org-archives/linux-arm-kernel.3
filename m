Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8EDC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3SNFYqaM9t1VFZcOe3OuDknXKerjgLDw3YgF3gLBg0=; b=WgENwapDGLkQZl6KTHbZPSS4SF
	1EU70ng0mnZM1oEbHMiLl+pEONr+05AH5/IwGvPxo0Lh3bTEidO8bQwszQEq+WSzgWHtPUYnux5kC
	xfL1uelSf0oepdJPx85ilN6wsOM4SKwtjDOLK1E/RgPW+GGXzy8o8hyFSNS76FiAbpA9bv18AvkrB
	PslpFLhkQrh4UZFTYa+06ygW+uGxXnzAmuNuVRgnLxW/AqjK6T03Xp38Ye89Fmi45HuTfXCtQe3Gj
	zWPyliTt6Qb3FXI818ESQzrdwyv8mVaK7PUbkzhvcxAgkhSuKUdR/EG8c4YGCPYKpg++4IXXoGRL8
	3jNoSnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6ka-0000000Cr0W-0TVb;
	Wed, 30 Apr 2025 12:41:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6dG-0000000Cq22-3ik1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:33:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7396f13b750so7939545b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016426; x=1746621226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3SNFYqaM9t1VFZcOe3OuDknXKerjgLDw3YgF3gLBg0=;
        b=h1EelaOgKfgk6SfJVySvFKXiE2IM8F2D15csQ2K2r2C6/8Ja6Wzz9iybScVOim2zDH
         iXxz28JZRYoCCn7EWSJA7RT0ROml/K0Kflbe2Vs04vqknGND2dXeAgDyULlEb9KK32vs
         h+8tM3Aal1iq9pUD0tPBOqbVlZmSJadC//7JXVq2cRU6naPqIeGFr8MOEPxq46bJlaze
         Z2gMElc773mm+iywegfKE90ud1iX87AGXap3w86E5zgo1TOVMOcNUycr/g1yDw0Xbd75
         bW4WXRN6Xi5weefz1SXyBpBmzVysQ46L7w/r6O4ASvSdGlolNYYWcWe4VDdDc8LgiKf2
         39Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016426; x=1746621226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3SNFYqaM9t1VFZcOe3OuDknXKerjgLDw3YgF3gLBg0=;
        b=XkD/BXKFGqA23nWq6asbvRB9p8dppN728n/r+SEaSNdeTbU+rGYIgPa9dnTjOdagVn
         BwL1dLiMCStoUJk8nMiiYsreVkdR6nMBXwPSpinAul/W06wWILl/E0ledBvWY7SEhy5r
         O+8+AfceRswQTEBtOHhTk0yvIveCxHmwucSi5kbfLmzJo5YUlskt+ibudxMv13/sKO8M
         fKiorSyZ/Ug9b5HA2HI9mgzFb2rySVIy5/JjC1bnLG1ZsknIIUD3dw5h2pW2yW6deUO1
         BeX1zYqa5Tz8b8KN5IX8W9VtAjjvcggZKBo6qC7UkszH3SljFspzL8j2KehbB5S0Ji5v
         Hp8w==
X-Forwarded-Encrypted: i=1; AJvYcCVU1eAJys2D3YmOlhdwiW6RD6tQ5DEQ3vYIR5hD6T3RMDIqvItel/yrcYlF/Nm7S/0rQaXw2D34tYt9CJ3Evqot@lists.infradead.org
X-Gm-Message-State: AOJu0YyQAFrmRg7zY6oXCMI0Pr5YAJLJ0AfkRyZuvJ6IDDKc1tFh8RAG
	IBK9Jxf/uT/TE+qTe0urhv36vm7BGyzHGRAbO8IfR+0F2GT+fWaY
X-Gm-Gg: ASbGncu4lchsL+e8zApxcnjcfQVVOxTv2izX6IiPv24Gv1FKXQUwvvmOnupvHZ+58HB
	QPfBZ/KkacYaq3LEZtH9adCD/iSsCI0SyuWtHpxzwouqT1L/DNkd8FajG334LpEv31SVLeNh7QN
	DamgMxzlw5QriQAN1oxMEYsXoASjgjnzi5ZLUVxpnhn56OAX+NqokdPiQ1+mnJlAfeq+f3/8E/u
	ONxpoji5aKCQZl72KnxU5TMgHJWajXdvTKVQvyB5hWaIjzYLBVlPw+mmJ/KEQq/ZcjFPnNWEdOJ
	8a2IHHuWkjqjcvNc5sHGHBmeAL0LZnisA1Ghfc3vQ0f/Fb/CdyUxCg==
X-Google-Smtp-Source: AGHT+IF2qnBTKenZ1AypOYLHMpucMP9SRa5u9iFuGqy1ut0HTtqxttm3kMbnkZczvm/vAv3TieOZ8g==
X-Received: by 2002:a05:6a20:d50b:b0:1f5:709d:e0cb with SMTP id adf61e73a8af0-20a8980fb29mr4306826637.39.1746016426310;
        Wed, 30 Apr 2025 05:33:46 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v6 3/4] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Wed, 30 Apr 2025 18:02:59 +0530
Message-ID: <20250430123306.15072-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_053346_923629_0AC49997 
X-CRM114-Status: GOOD (  15.53  )
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

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb - Lukasz and Fix the typo in the subject
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index aa0726b33c84..5f017a78f437 100644
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
 
-- 
2.49.0


