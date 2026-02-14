Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B81EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBz/VS0n7QHhwwTW/twbu0ESsUBq5BIV+GsuXlYuLBc=; b=Cp6s+Qes9riSGPCR0/4RFB23uQ
	0J2m8VZqE1A4ZFjpbHokyCidJPc+GmXOw5qltQpo8HdgppwrTanGatr4i9vgleL39QFSXhZzUwcZB
	VOEzSZhxaxCjeUf/78KigMPTr0mDx9zpnb+MkZNIiJ5KlNXLW/heEVu8iqIECVgPyQL/RRUJsyVCN
	YpYCZtwb3OD9HkvnTqoWJcVsct/SfXhr7qewj44jwfpuDFc3vKMhz1SwdeXDV+wss9NRiC5ilPlvg
	+3luxHZb44BvZx4IlmFsAMtNrmzf3UQIB2V0q7MmD2DIztXW8oTRC5HnYuRufmac7barcsKQIcOeS
	PMNlETsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFB-00000004pu7-0rbm;
	Sat, 14 Feb 2026 18:19:49 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKF9-00000004ptY-2HOP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:19:48 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2a929245b6aso20953975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093186; x=1771697986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBz/VS0n7QHhwwTW/twbu0ESsUBq5BIV+GsuXlYuLBc=;
        b=exzBRoqt6l1c+VuixmKvUqN017jvnmFllv9TLVdU1Dw904EiezQMPgbKiYcmvkRvrd
         ZS9Qpe2mgBtCiOApZBC8tsJJwiLKWP/94XjUnDU7UNANUMNAIXqdgRqXE3cPO8zLYxm5
         +VKRb3gxJ88TSiKYuDcsA7we7o97xX8VfBbdzP/HVLrXYojdAeBdsWUr2+kCA/sPvPgZ
         t5IfKfzws3B7KTxN/GsCrUBcnImjvr5irSBU81q7kPukwEmNEq5VEsmU4qabYw+SI4cu
         rADbqAcW8cCpTBt2ORocA72/W1TSkP18KKYr+KuI0Tn5dQqjyzqe6luOT7X2SkeuTjG9
         yeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093186; x=1771697986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBz/VS0n7QHhwwTW/twbu0ESsUBq5BIV+GsuXlYuLBc=;
        b=oxyT8lVssuyg9rKZxSrtPyCTI1Of6S+DwhmEvlfCFBPcMzORVesas2+BGpM8klJ0W6
         Fu1D8QH7I3if6EghqvfkOvru1ig0Fofg7qt5c9zcuFb91+dsRjFuwP0hWSz1FvwlnIrE
         fpHs17HlwM60XkKXpoix1wcfSI2CV8h6LD3/t0we9kKwFPhbMvW0aPZ45iJLoi6oZjQL
         cwDK3px1ovm0bU2FuDfQwsrB6SmUepPiQwMoiQAYna5GqINPoUEZm1xmUfGqTzRI5OJc
         L0P5gMr+BOsVBrQFNNtcyAcZH9QmXl38qpeW+hxsxK0XHewMOZuXSvo+uV8VK/zasHbS
         6kUg==
X-Forwarded-Encrypted: i=1; AJvYcCWJoU4C/oEuxPJ5RRB7WIF2+ETCKx4OveNJuypBWA8aaaXOwMAAUGmSY+AgNfdERZhKYBOyhll4EEz7iDmjrrVx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Lwm7LBFIAvG2VwFXiTLHK0SyFBGFbRur2d1nBo0rNeXG3yNS
	dcmII+XGCUAUcgKfywP6ExGYtG48tVUny75TamBVkgAYBvkg8FiRLjkg
X-Gm-Gg: AZuq6aKturUYA5EIxjuLHYsKXhjFa0GWf0pHcMSDJmnursGjzhNgZo88Of797OQHQ4n
	UGOSFwHPYeOeee0GHRMfdp9XA5Lv7eXQjA471VTsQrBMJbaXrzDh3xdepOx5MtJdqDrqZdr7ltg
	1V45rXocQZ1CwQhrJoG/P2Oio2mcDi4omlL4tv3ZlKkON0UZJQNqEOWeV0LvYumdYUVB7Gdt9aQ
	KpZ/MEn7sHLRyeJjMfTDjdfGTTXm/xomaMoDmVbPFpMXtIRz3TDdaOTfzs+kLa8k9P2Q0M9Hjdp
	YoWcAMtxqKGYAQF+ZOL5xKwrWia3wAqzDcL5AnuBIjxHtY96aioVgRTIKt0neN7Xwkm+GcfmWUu
	ujVxE5BQfo1CQa46IR3UFN0pRiyRWJP3bcTvgvohhablEkVzS809IfJbKQ+mp6vKFIg0jHBJ7lI
	OcInz86iYxeR8D/p6G/Nw=
X-Received: by 2002:a17:902:e5cc:b0:2a9:db7:446a with SMTP id d9443c01a7336-2ad1743398cmr29145525ad.9.1771093186513;
        Sat, 14 Feb 2026 10:19:46 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:45 -0800 (PST)
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
Subject: [PATCH v8 1/9] thermal/drivers/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Sat, 14 Feb 2026 23:48:58 +0530
Message-ID: <20260214181930.238981-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_101947_586464_31D83B83 
X-CRM114-Status: GOOD (  18.46  )
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
v8: None
v7: None
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
2.50.1


