Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F78C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5763eRzYt1jege0RTd8JYUTEayhCQNbQrkkrycefYs=; b=K4hr2yNxG9ZtssvDjbePaMuqmD
	93AeNO09H0fUM1kL2Q1+xXb7K9gXXSg3msxzOUliJr33/QAV+c5dOpJwcEL3I2Uw5cjh76p5zHgiW
	F4odR36B2K3pbHOI1SRl/NB8phc+PHfm2FVkl5B0GbC4si8Z2ZTt9rtnxoxKTl3MJ9DWM5Dkh8MKu
	O8w3G/xeTeppHFTiV6PWzPpumOrQnECkHD24v0xPeRp6tfyjpdwqiZXnXp4CkXshw6R87KU1o5vxt
	lK311oybQrNM3XN33e90BzQyGmYM1n50X30Vq7jwyyhfiSc6anPq+TOGY6A82l5aVHMZMM6pF1b77
	OslV9pfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lti-00000009SHi-1qkX;
	Thu, 10 Apr 2025 07:00:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lYI-00000009OWk-0Nam
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:38:19 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so339235a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267097; x=1744871897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5763eRzYt1jege0RTd8JYUTEayhCQNbQrkkrycefYs=;
        b=IvEBfGRaHwWyHPB0B00D/Y4tZ79CKOR34dfMXZX7qG7hqrI6ax8ScisJxlMR3U8Y9c
         7mXphBjOt6hldneB9GUJak156LZTnGUp2DmvwkAzyWGzVNj0gBKrToKPLQYyzS+/Cwe/
         zDfWMXOpa+GYpl5whVE/PD6Y8I7vX68LPEp1soehvgdPxBC7EY2GCp33KYegPZhToSfr
         uLrRq9eyL7kyz5PD/CILHy2X+rupyc+VxuhiP2zuRNZp76XX+3noraQ3O/tk5YlN0KKA
         jjcqxgeDGihJ3RTyQ3ITKNqjyptUCzj/wkWwqct1F06uuWVrSvl0ai1lK2y7Hvm/hRd9
         IHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267097; x=1744871897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5763eRzYt1jege0RTd8JYUTEayhCQNbQrkkrycefYs=;
        b=GIPd1AewhROz8QoLeB2yh8G8nVy6Wk+On0MMWDKzWgHISBcQEjbPG+iA6ZW53h0rNA
         Osi4274BCwY2VaiQ5BHY137+fk3ycIv1HrbJtuW89wTN9K9AmoChZRfZpJ99t5598sa+
         9njLRm/XM5Q8CWqaM7c4WIxlyj1HjVEMDhH4QcBHL3VIpTNbLU+wUV0e3EPAYMMPobdE
         25/ghk011M6mni45XVdckpcPuu7TkkRmlErlSU5fWeLfwEfsMX7vLFC0B6FMtUMIisEh
         HVGBo9ARAeliXRjujNaxY0L0ZaJy4jPLmqUGopCunC77N2oCHLKLIoMyQA96Rc6kpf41
         U29g==
X-Forwarded-Encrypted: i=1; AJvYcCUMG3BVfzLCp037+dunZWAsB3VUkBMpc7iBsS3JNJ+j31viijm/GRd8j7/AiNJgv1+gImGb6KRmSFaaMAAQh5J6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0jGqulTRQSa7Y1JPsZdZySszm5NicJROqX7sAyr6shV7SU4jr
	yWJJrVMSrAaxuACovjuFk5vySc5N5BfVG6OlnPMs5kgjcqeotPyd
X-Gm-Gg: ASbGncu9XfYGBIBJTKr7ghM3DDt/oHBxarjIXYEdc2yNAtAsGP7jI0a1DBoFMBjcP+6
	h8pG6pSi+EIk57eGmzoRao4QyNkEHMLLDjJrLwA+0qrDsSvxN0paCkP0oIkGAWpCi/Y7zhrDL0l
	YxFNR0reI3uPKERcROQC6j9IZQ05UxdH+Zt3bp4nBi0bcMmqHw2LlNvaxB6FLc8m1hqI1x3NYpN
	Muri4xjPgFj/vjRXTRBtgIaTQmH2upvyaQQrm3B9iQWSdTJSxbxBn4CHhkPR8sNqSsvQ0xqSF/k
	10gaWJ0vd0ieiVL1uy76C0e6UiyUhMNobcYuQkxIT88gfU1dM4WtRaCCRSyN7syafA==
X-Google-Smtp-Source: AGHT+IFitF6h5bRSdwbPKPWR+Ues28TptvWHWuXicvpvF1hdtwOY+l5uGQZAnwPkm7WTvTojhw5pzQ==
X-Received: by 2002:a17:90a:d64b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30718b75cebmr3246029a91.14.1744267097017;
        Wed, 09 Apr 2025 23:38:17 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:16 -0700 (PDT)
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
Subject: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Thu, 10 Apr 2025 12:07:48 +0530
Message-ID: <20250410063754.5483-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410063754.5483-1-linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233818_136314_297650DD 
X-CRM114-Status: GOOD (  19.22  )
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
v5: None
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..3657920de000 100644
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
2.49.0


