Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D09C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpVHF9b+TYLO9CyHvJ3z28yz3dh71Y+srhHA13+SNnY=; b=J9eZxUrE6RPf6MVfq6Jr2Q34cn
	9xdsS5ROlCTGUbE9LSaMqYGEUENR0UmKYKseV1OV6q4fPqMPEz4ZKM7XTDR4DojOeBLgHuhQ6yMTX
	RrfRLF7SzHZi+OVnq1xP60lFdV3QhaId5UakcoCvpxmjTVjYgZkqIYJPSLWfKjsRc8oGFcdtCXxEs
	CqSntLu/OKmvyEro4bhVYKQakm9LEkCXQYbO8pxMuZCi6D/gFLz4J7bKU2YSMSEWsn1wCpPXA/enB
	WgVubb6tj3WV/glkREosmzNjnCPGJc4KCPYkrK3FvOZ4S35Ttcqvc4sgBjNkdw7WlgdatI7pS/7FI
	3YAXmalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaN-00000005EG4-2Uzd;
	Mon, 16 Jun 2025 18:29:35 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCrN-0000000520h-3AN0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:39:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so4346280a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750091941; x=1750696741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpVHF9b+TYLO9CyHvJ3z28yz3dh71Y+srhHA13+SNnY=;
        b=MoG9pk4h0CdvnMUPFDPoqbKWG1sviuYHFrSD/VcF8FciHcoU5h6FZNcNUJbVLgi8FM
         Gej0GJhqqYMjIipTmYxftF9mnKrfTA0g+w07/MlwHXdB1Lc0Bjt/EtBY89PPyyEkxvsY
         BuHNTnjef+OcIOmWdU36wNVpok3aDK9YXFRgVbqKlGFZV4IEvcRVXlgyAm7S/O8vtOH8
         Z/LXLAw3Emde0q4KFKY99ttjvCK/0ytz/OIEl/QDFbgME8/ZIIcbVceFvvOgC8KxUn69
         cJXT8bougQQrNPpTZKgBb90OETwge6wLtk2MjVjVBULrr62PGZ+a97XnJSwnyPB7Tryi
         z5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091941; x=1750696741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpVHF9b+TYLO9CyHvJ3z28yz3dh71Y+srhHA13+SNnY=;
        b=B2gapAF65K4hTVigXwiKIBkpgBrH5w5lPIPKrdfsj2SsDs4Jd1MZMZ4BBoRDcc9lEn
         EpQO9wNy/qWzNpWbhl/bc6FFxD4AKcW6+gc118+99nHFZFZ9eFZy61R6LQIYsJQpmzHs
         vN74nPoEBy4zWb8hc1y7n9aULCmHmYHL+A1D+AXuqhPb8KKOUVYHUpOG4DkhDKJVnZMY
         NSljEVtnEFRp+fj+uTp8mZ9hbe9uE6KvpLGytoeW5QWOqNHS5qmCPRQUDDx46j1prCUp
         q55Lsu5CofXkSCop9AWu+ijMC4yImqbg0asFXeINjevGStRrQzWivJWOZ2RdRLIDBew2
         LguA==
X-Forwarded-Encrypted: i=1; AJvYcCXbILKFVwtkNQeEft5xfHYq35IzMqd+sgr61/up/Pm3UBpcw/rkJy//JiVhnHQ/oaCggb5KcydhyHkqIPoE6Qc3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5UDZlhTDNDLuVoUMnL8OoEiWnlCmNY9EHNButTDaM2LSWPV6Q
	FuV3nqfOU2R/Q7WY426BlF86i/GHfAqU92JQ1zroiOAuStcEoTIrNmAY
X-Gm-Gg: ASbGncvjCx6VBv6waqn/RsADmeWBlARKh9+XuHPw6qx/yzFP/IEMU75IBKmVrtTns/U
	O5sjOWygg99Afh29ul8c7D1S+T9HBOG3+ij4PE9TRNXPqEaKuAgYvDljln7ltcG2Hbjr2dkBCD7
	7ig4mlz8uC6tVxCMPPNOVa1IzSiDjLPg4FiQCAXTlbl45NJpAAdmKGWbtbFbCcusV4CzVxNc3/Y
	uQ6tZXFlNBbeHHFDmd+VyxE3gx6ibMDyT5Y2fPmaeNvUZ02pl9cBKzwmFKINVBlLvgFKRlIPri9
	iymWDzQb+W2GWyhrjTTATH7h+J+h+3fgkZgCHYSFImS1/qmZwkDy4hoQLJxKsgjpij7NtA41x15
	ynqK0B1hUJQ==
X-Google-Smtp-Source: AGHT+IHksnpc6Nrc2cLyvfXLBdusiyK6+4cw/aWIy5ueWnJxdLHpYjX6PbGSrX/CQnj0tbplZYI92Q==
X-Received: by 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr16898139637.40.1750091940932;
        Mon, 16 Jun 2025 09:39:00 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c6asm6067882a12.42.2025.06.16.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:39:00 -0700 (PDT)
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
Subject: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second mapping and references
Date: Mon, 16 Jun 2025 22:08:22 +0530
Message-ID: <20250616163831.8138-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-1-linux.amoon@gmail.com>
References: <20250616163831.8138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_093901_808908_4DD57DF0 
X-CRM114-Status: GOOD (  19.14  )
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

Following change removes the base_second field eliminates its mapping
in exynos_map_dt_data(), and updates the TRIMINFO access logic in
exynos4412_tmu_initialize() to use base for both Exynos5420 and
Exynos5420_TRIMINFO SoCs, as base_second is not used further in
in this code.
This cleanup simplifies the code and reduces unnecessary
memory mapping.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..c625eddcb9f3 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing the gpu clk.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -460,12 +458,11 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	}
 
 	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
+	if (data->soc == SOC_ARCH_EXYNOS5420 ||
+			data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
 		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
-
-	sanitize_temp_error(data, trim_info);
+		sanitize_temp_error(data, trim_info);
+	}
 }
 
 static void exynos5433_tmu_set_low_temp(struct exynos_tmu_data *data, u8 temp)
@@ -964,13 +961,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.49.0


