Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89755C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS1K9x+4Zn/shvVhPm7Zn9q2gjfD6cEoR0irdxrqpfI=; b=o11kpItyOEDzzIRibJpArqA038
	XoVoNxEelMy331AqBzUWXG0Slak7uuiaTkCyE1oU5vYtLkh/SMAJKC25CbfDvwefVsFU/h7qCL4mm
	IjzhfmmI+9db9mkougi5iqEtihz2wlDhFjooTZPBfSu26JXTSlNZUIzy6Pm8Ur+PwOA159GHNoKEO
	RchA+u535OqmtWH5V15O358TXULEcTYX7iLgntDHVN2tqWEvQQ5k5x35K+7L18iYck5luj8kLKB99
	1bCua0Z9PaIGlbXqultd0+dtFkZ6yEUPPEzYJhG+640WnXgR46gZV58n9tH4xz6DX/CwatR8cPVS8
	+BKVAMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trf8F-00000003Bh5-3cNa;
	Mon, 10 Mar 2025 15:33:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treDt-00000002wYm-0sKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:35:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223378e2b0dso61671905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617316; x=1742222116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS1K9x+4Zn/shvVhPm7Zn9q2gjfD6cEoR0irdxrqpfI=;
        b=STKw6KWBOVg5b+zOzR9OwSedHk1tn8afQT/ftDd1lA12MRw6PgeO240C9bjSrn2P0t
         AKlRvbeQgy+WVFy6NmeE+xCG9gF5HbWhkQqZHub/5w612BCICw8xF1fBVD9TErTrTRho
         WDWPkKwcfu6UZSuzLkdkDv6N521tczpoEgyuQ1JsdvrzUQTnicwto8MTbkJAQEZRLn2E
         t76zsmOcFLxjY5bnT0cBq8efVFfOLUWWI2DtW+eaYNIq53Ej46dXx4bRQpppMFEx1PWF
         qy5DxKIxexkMiQ3FG4dV5CPm74ymXmmmPBrvDgxeNdlKMLXU2HaQj9caL7iKD3Ob58fb
         lUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617316; x=1742222116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IS1K9x+4Zn/shvVhPm7Zn9q2gjfD6cEoR0irdxrqpfI=;
        b=wm8BIGmbFetHJ+yulhDftBMB6Lqe4tf1BHMbSCHDiz17vnes0DuA6TDEyFFfPUpv5O
         8MroZVu2If4bx79an+429vKtlnjew6SzVqeecV272BKnbFtDNCa0pBOvudITjzdyNtIe
         70kyvU9gM+biWzAiFiz9ctff7NzP3Qu1rhXhntWkBIHijMXw24BTS7FGZUh5v6IhTOGT
         GO3lyxkwT+0MjyRidHcgb4PNUgkpZbmF1SlZNC2FScBnejwdu0rPnlV20/0oisfgsSkw
         Aw3wU5bXOmKZX2327cx/oC+0SZHpgLu77tAzY0bAU5e7BueexHx3oqngnm2cJ4M0zslA
         W/vw==
X-Forwarded-Encrypted: i=1; AJvYcCWVw/3+MYpyXIw7bnBntb5HSDDt3CIrX5UehKXA7OCNpowOhoVHQh/KNyv7bkNKK5MatrKwTGO2RPwKngZXRvcm@lists.infradead.org
X-Gm-Message-State: AOJu0YwONIoY134669uN4giO7pNmyEqjcPxj8j0MPcHdXTfo2C9h6yNx
	QBNxpxanAEGdYqhJzvbNw32ukuXVdznlEFDuBHAix/XZ0ldVRCUpqEJikw==
X-Gm-Gg: ASbGncuJ0kmk8XZSmejpVEwtFlUyHoBSr9EDS0ZzzQ7y2QvhvnPzk0bizcOjWOnQJKR
	pr8Ma57iz8Ft3IQc7Va+vr/AONGoeuRTr+FjfmDf6KS7dq65cfrci9FfAOIYuMdJzS3VplxKVss
	IxP1hLIvlJkmI1pNGl7YR90bdpMm58HCFiz8TaYuLoRqj0P3QiuefvFbvogvNXuaKnSiuEc4rry
	kjujYiLowoaAf3U86kXsD5ki4zPHIib/3uCPfRTFjvr+p4mufdtt6zSje9Yz3g8hBbcW455qEr+
	XjBzYpA81Bt6tVibxnoCZlZUjeyF861zTYVqUNXKWV9sFuNVm2wl0yJPrzIcg4uo+rfFMA==
X-Google-Smtp-Source: AGHT+IFRMb8MSt+/SKP7XgvmW56LuHP+OiQQ8mAEyZvr5wqugDw0pMOjRJfiVrvAK9l7JjHXCjXQqQ==
X-Received: by 2002:a05:6a00:2e17:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-736aa9c1b4cmr20983288b3a.2.1741617314745;
        Mon, 10 Mar 2025 07:35:14 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm7785900a12.30.2025.03.10.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:35:14 -0700 (PDT)
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
Subject: [PATCH v4 2/4] drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Mon, 10 Mar 2025 20:04:43 +0530
Message-ID: <20250310143450.8276-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310143450.8276-1-linux.amoon@gmail.com>
References: <20250310143450.8276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073517_245378_0CB4B7DE 
X-CRM114-Status: GOOD (  14.78  )
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
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3657920de0004..ac3b9d2c900ca 100644
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
2.48.1


