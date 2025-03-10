Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094C2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3PCN1rM0WbHIM2gIVr2uSVcfKomlI7ImWzVGLtI+Ys=; b=v4zckaClmT0YRc/h/Lj2Q/PuCU
	fD8zS42UOEg9nQP9d2B8vkQgHgP+kHPYf7SfLYqnQsLRXP60tClmZvCd2N6PFScx2hh6ehIHy2eMo
	Ab4xvI7AdY24BenZS8RQUdoQCiw7MrOvbmSerAh/6UUVnqFRPlb2HpEnNQk7cx5+9mDSJBLRL92vC
	+06ddaKUau5Bz7AdhIl5JWcGwtWwUbCVF4FMtNnpNohfz2DYhsZHZDGJeBh7u5brea/H9CLhrQCGw
	yay0HsevHi23cZS8wbS6NODxm6cZCSICCjb28eOUpyRndEdHzuYHn+dx0M9i1C8ZeP0IIUXdwVfeS
	SS+c04nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trf6e-00000003BXu-0tMv;
	Mon, 10 Mar 2025 15:31:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treDo-00000002wY0-0YgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:35:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22355618fd9so77687975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617311; x=1742222111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3PCN1rM0WbHIM2gIVr2uSVcfKomlI7ImWzVGLtI+Ys=;
        b=Ydv/nFsHUrtdDalI1Oi1Z4bNLGvepxS5yhnDu73ApS8epAHdnNMccg7PU3ma+Ancct
         8Gdkg1j+IALAEM6HoNBzBc6KNMNlLN9ZwqmaH95buUYHJ7qGacR88CntfXNctBw8DfpQ
         sg3f/aXODHqjOn+wejLc3Z6CXk25sl8R3EiuQotQ0FPegads6+DOpqSINVpQRa12/WsX
         uC5YnYg/vNGVq3fAh4BrbeVN12DDmPX1r6aQLDu3RjJy+hwK4s0oxaPzcx8uassu5XHH
         bN3W9d/waflx4MhAuJEm7ljF1GJa4bNNeneTojcfaeJ2vE60cE5s4+l3lb4QF2zf/pvd
         hH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617311; x=1742222111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3PCN1rM0WbHIM2gIVr2uSVcfKomlI7ImWzVGLtI+Ys=;
        b=el3mar7RTXZvadsw3Bs4NHgXAdMvwu9xFzooUeog4Lfl7PvzLtllyt1f4prrbh084s
         j6eMLxJJSLQPbmPoOEJLGgLO73ZxGH4z2rq8Qw8WZDC8xrm6FistIiqSPf8Lu/hq/1hA
         6QjpcsKgqjudW1l6/7PTRNiOmcqMOS1yjJ+VDAKwPzXSCvz2/CYwuHviE9Hhv/d/hOPj
         WB27+INiT1TpStm6+Z9VDXjOFL6Lujzm55fsQ0YTTkp0TKeBJgUnPNGC8FYTfbF53led
         yY/lvV9TUIV955my0erWC0VbazL8LvUZ16CxepllOAO+mtcrXcmdgGslT9YydL0ZY9Aw
         JmCA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Pr2Gc9rigHb4ToUiCMKjPDjvZ7vrWIKrEynIwOxl1ERYnkBTzuTy2nUETajzk2JHJm6AR+ObGo3fpSN2Fi8w@lists.infradead.org
X-Gm-Message-State: AOJu0YyBQLS/+Cotwzf3muRc3rrt4QpmwaAchjQZ6jOpqopqmyqilvML
	Zww6sskMf/bldqwstvztoJ4DRz8dGvnFbNVYNQ/F6MG3KgGnEDYy
X-Gm-Gg: ASbGncvzgjGaV/3FVweIDA6s0xMgVMIaKiNhDTFTCgEyVi7qZ3LtTIYj9dTysYfFrPX
	4mQX70ukjtsWIynpOdQjtsOVGfth9XQk9qjkKo9J2WhUos/KzW8VrGAuRUnwxz4ftR1/7F9cQb0
	qUyd+BAQOYS66rXH/EwMyr2NlPN/A6cE0qklk9sptx3BM6PevCHaQQCnmlEWpk25luTy02JEfFF
	cxinFGycP+M2ZCpiTRs6BvRk5+JRQcuiNYm11Jmxwj7zPMW3sEoE9zE3cWbiWh2gXrTv+AbS8EC
	dqyTk/6H3zfkQiqPmnucry4163CEIHqz3RfryCqkYC8Felv0zjPMyZZU5Yc=
X-Google-Smtp-Source: AGHT+IGRjAcGVcNUlBufVXhtdKF6feTENZiruX3FJiNFzexU5+dfH+syt6bCsQK3e8kMsxDHJZJ4HQ==
X-Received: by 2002:a05:6a21:46c4:b0:1f5:6d00:ba05 with SMTP id adf61e73a8af0-1f58cbefa96mr2309637.38.1741617309689;
        Mon, 10 Mar 2025 07:35:09 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm7785900a12.30.2025.03.10.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:35:09 -0700 (PDT)
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
Subject: [PATCH v4 1/4] drivers/thermal/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Mon, 10 Mar 2025 20:04:42 +0530
Message-ID: <20250310143450.8276-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310143450.8276-1-linux.amoon@gmail.com>
References: <20250310143450.8276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073512_174545_7E46BE8A 
X-CRM114-Status: GOOD (  19.59  )
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

Refactor the initialization of the clk_sec clock to be inside the
SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
is only initialized for the specified SOC and not for other SOCs,
thereby simplifying the code. The clk_sec clock is used by the TMU
for GPU on the Exynos 542x platform.

Removed redundant IS_ERR() checks for the clk_sec clock since error
handling is already managed internally by clk_unprepare() functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c53958..3657920de0004 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		return ret;
 
 	data->clk = devm_clk_get(dev, "tmu_apbif");
-	if (IS_ERR(data->clk))
+	if (IS_ERR(data->clk)) {
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
 	} else {
-		ret = clk_prepare(data->clk_sec);
+		ret = clk_prepare(data->clk);
 		if (ret) {
 			dev_err(dev, "Failed to get clock\n");
 			return ret;
 		}
 	}
 
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
-
 	switch (data->soc) {
+	case SOC_ARCH_EXYNOS5420_TRIMINFO:
+		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec)) {
+			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					    "Failed to get clk_sec clock\n");
+			goto err_clk;
+		}
+		ret = clk_prepare(data->clk_sec);
+		if (ret) {
+			dev_err(dev, "Failed to prepare clk_sec clock\n");
+			goto err_clk_sec;
+		}
+		break;
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
 		data->sclk = devm_clk_get(dev, "tmu_sclk");
@@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 err_sclk:
 	clk_disable_unprepare(data->sclk);
+err_clk_sec:
+	clk_unprepare(data->clk_sec);
 err_clk:
 	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 	return ret;
 }
 
@@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.48.1


