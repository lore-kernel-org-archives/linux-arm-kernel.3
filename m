Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5133CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lf55HjdhhKhvLLEeAhmoJNEvXS6+XdwBwTK225CdBtY=; b=hTzMYZdOxbJm6tM6gjrsApp07c
	c56MtMb3lIsQaPry+XmCDxmGQvFhkW4PDFhVaSJBAtKvgToLBL0kQT34ulB8JFo801mT8sFf9s42X
	jT3aWRtqist60gRUOxdW4IAE2UAN6xfsULHecpOzMFbLgCyWyInV7te0L3kiVvfQyROj3fc+KusD7
	QMipSjaN7AyPKjcMSu4ykE+j3UvABMWQCWl1irGwUZ/ZRIIh/fcWxeeOqAU3sPhH3TJjvx5aKpdNG
	BlUkLnNDHmHc3pDdqhKbkYsh5Oioa1VtN8XI6z1XiFEk1Xkr98jMbio4lKqw3jcn7HT7ipJTAe2ia
	0oI64y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6gk-0000000CqaU-2sFR;
	Wed, 30 Apr 2025 12:37:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6d3-0000000Cpze-3t94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:33:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso8931596b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016413; x=1746621213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf55HjdhhKhvLLEeAhmoJNEvXS6+XdwBwTK225CdBtY=;
        b=QXxemK6ZreupkSqoLxuDKnsIRgl1NTY7Doc8gWMUCMHnJ0+MMyNDeO6n35u4taGzrR
         5dfycZ3Ak7KdBa0KzWps/2kurOwIH0iSvfDuBYnFSfca0x4O07W5Ey74phVBvmjiIeyo
         x94N/fjXpkfVYfHd6pftNheDR/ZBeQq+fP7dW7niHT9GeR2UB5VcouEpns5wyScPiyy9
         AR2k6SNzwp7WcJdhV6R5OT4gwUGR0Pz7emS0aqZztjvlUGHQ44VcBqJlYYMPfTNMIjYf
         253zL+OpT/E66Z9sQ4yGqpph7Mq+c1+5spltFbGopGF6sRrxR0piLRhS+2Fu6JFACmUo
         dT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016413; x=1746621213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf55HjdhhKhvLLEeAhmoJNEvXS6+XdwBwTK225CdBtY=;
        b=jmV4vaitIrIzf6HqVW0sJCvveyb/GQbN3ezlGXWCh9OYJaEKz0tbtWgVOUA2Dw+BK5
         BbxfE5bUPipmxNaE31/M/TTF1vBuThVTeLDUZ2tzAdXocrFnO2nSNokLvK91g1F2rj27
         oCErnis36i3nmPK8Hc4qLhe0giveaOD1vNITdb7KQvXwzDP77r+9p2innIUIil0kyXBa
         fHSmwtQs7FLP/ICZ2LrhVRQHVgAE9AxetMC/Ot7s+I5csJNmsvBOZyCYiIf2IM7DSg9e
         ywAasfKcgEynNUd/LHzrk0z80GRbm3N8fDJ+66BhzBTxp6f+Qiv/w7/l/2BthT4YI38/
         lSHA==
X-Forwarded-Encrypted: i=1; AJvYcCVpnIzw653yxVQS4xBph41gDgqfSbrO8K/jd/bA4rQ56EvbhQ8WqYfrcaIeQvmOcUj4AmJqBFcHWxF1OyMoX807@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+i9MmxPeQKN5Y+FQJIDOAA8GEuQhnGTwn4vk+9bWbX3JbDRp
	mPP6Ut+j+1TERhieCZWe7mdtkXR3Z4JpIXh0/jI8uYIZy/sgNSc/
X-Gm-Gg: ASbGncuJE3niBwPJw3hqUcMrn74puxZXVfFGw6S9ZFjqHmQXVoOmIFvGVAwRwjWKAJh
	NIzKHJ7sqqVi/4EqU1jVj2MoGEqRRalMPCHCN65XXcw90qZrTo8xfRUmi1iR0z865vZS3LiafVN
	6m8sfzkDNTvWebIWBZQLWGkTVrCle1g55JGhW85UshddHhVFK7CTndZ/lEqWd0tSMbwgT5eAvcO
	ykb2EV6jZNpK2b4RoVVXs53DHDW8osdj1L+v4M9dSO6t7/KhDyuAfw54m0SAvr+SmELCjUM4llO
	5+wxaeKHVc9DU3WWRHudzWdeOVDG3NpIARE9uQVeCOHbulEV/WBM2A==
X-Google-Smtp-Source: AGHT+IEXIBRnItsxJgHarmeNLTYGAGyI0xDlMc36p/yim3EbyhEaIx8/EJ3h3jrPHK0gWcrJ56Volg==
X-Received: by 2002:a05:6a00:2405:b0:73e:b65:bc47 with SMTP id d2e1a72fcca58-74038a8762amr4013535b3a.17.1746016412720;
        Wed, 30 Apr 2025 05:33:32 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:32 -0700 (PDT)
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
Subject: [PATCH v6 1/4] thermal/drivers/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Wed, 30 Apr 2025 18:02:57 +0530
Message-ID: <20250430123306.15072-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_053333_963676_EFD69486 
X-CRM114-Status: GOOD (  19.85  )
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

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb Lukasz and try to address Daniel review coments.
v5: None
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 36 +++++++++++++---------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..04517d52afbd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1040,26 +1040,26 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
 	ret = clk_prepare(data->clk);
 	if (ret) {
 		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
+		return ret;
 	}
 
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
@@ -1112,11 +1112,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
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
 
@@ -1128,8 +1127,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.49.0


