Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00FAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=; b=jue5PUDhmvY5G/qJFz7usi69lq
	uTTBTb2JEea9tdQx3Z0t3328TuIfk/xwkxlvnqb3i1ihk+Q0JS4F5aUfMdowylrt4SZ8xr3ycvFO/
	h3Ikhp/zRC1V2NXMFGlD+gjAPVr2nrSn2kdF7L196cEUGAgp6UmSCbThMgGe2Hlb9E0rybNUczAUE
	yc3w95yjV708+sGdESBrJ0X3UvFwQ5ACQWx4q3mmr8yrathdUrkGvpCGHkq7pUb2uEZDv1Uvxfisb
	TdkizKypc48WJuNuA8+qtVk8wimxsHSnpkfquiJn47iKr2TRZivU7HD5h5Ybv3QaF9mjUq4NXlfnT
	kftFaILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2coZ-00000008YjY-0cKs;
	Wed, 09 Apr 2025 21:18:31 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB4-00000008Sg8-1MZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:43 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac297cbe017so220789366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=ARD4x6c5cxO3HkXl9s+FBK+SVy7hNSI21Gz3XDdgLB2pcuHy4xfQmCFTpqkgDDvuVG
         EFHFhR09GsSLgQ9Gq4372cRpzdEaON48qOsscG5O+3PPT+uQgiVz+jNaJ7Mp3AKiDeJ8
         16jxojGaAkhmjkmuxYEQUgzN68rAZ6T8RoZYYNxdTfuOZ+8qU7R1LJloC43K2K8VAg56
         qi3Qnsq/IPI9EEb0udZwNeaP7X5n451gcZiPbbtVb6karZUeXG2S8la2H6ZCbqoUCOIC
         4Kr1mIUl/vMw8DL90jq0lAZJ6so9rxO2FyF7Ki+NgwjELIzJIhoM3zIrwqpuef/Et1BL
         Prlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=tzrULqF66FUlWjIrbLfMynsnNjq6Ari0mzYZWfZoAn4sfr/3o7ywJm5jHXI8Y4pSdJ
         b91lsWAXnV/nYi31NX0Wd8CKDm0TTcqE1R+pd3NOwfcxIX6I/t2qMZfQ4+fMoA4ra+IA
         NPYbitJMgqRWRgArPsEVD8Cpm8aA9M89n87iL+Ap7fq7/xlYA7JuwcBZJyfC3QrTui5/
         kkQF8f6RuQluNfsyrNPu+cy3SULYvgpUqWrUFcW0pvQ0j5mQk4eE0982t5ZNaB/GddLN
         iA1Mj9ef9v/npauHLWTROHtcu1skIGwedBPnAbhollR+Rr+Lt5ICPWTRUf4GcBPqgCjn
         7d4g==
X-Forwarded-Encrypted: i=1; AJvYcCXfiCMpP3t70kCZiM5a44Wd0hoDdSoORS7TIxIVqdyA5uVB0wiXoVAZjcqoisdDvBQpF04Itbd72m1tGakuh5AB@lists.infradead.org
X-Gm-Message-State: AOJu0YzBY5AL9vK28MyEku4LukkB5yHBzoqGtRYs51jan1EnrdQCtdGo
	mkYynDrkzm164IzXjL4CXnAocBuE8zqaX7a7RscT4W6BJmDNsdckFgtzt9fdQ/E=
X-Gm-Gg: ASbGncs/tHm1Ej/T0vSk/s8Ayh8ctCjUqvcxoU4v+zxulHjwOVF8O2oTagEKK7/x9AF
	2OM+rwMZu1eCt02myEEnq9o/DrVFSsnDYEZNzpUBZLqomdUCKW/tVd/TrZyMzbSHYaBkN7QL8ul
	3BQIMk3ym3N48zH7bVZMDGK3bqzLrcpn9c8ack5Y+Pv+dhdez/AQzLRxC7tuYysIg/7eHFrOvSa
	qA39qqnJOaVlLdCS+fyR7QpF+NEGiOKWW11ph+lch7VGoxTZ27n3Pqy8rc6esq8JR1cZip9i+9R
	2YycsIsu7iQq0cg6Gddj0k/ODHLkQ8MvmHF1aAM7VHAUzWbhikDR4biJxi5TaYjYR16eaK6cKcr
	ynqJ/xSJv8epUxvxwbOC5IxrQk5o=
X-Google-Smtp-Source: AGHT+IEEu5frM78xjaYtfvJpOfPA05D1eB7ySMJAK47y8ri2kTuUJkGDYBSO/DNVkH448CBSxwwKIQ==
X-Received: by 2002:a17:906:dc8d:b0:aca:b45a:7c85 with SMTP id a640c23a62f3a-acabd39ea82mr7993866b.19.1744231060332;
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:42 +0100
Subject: [PATCH v4 21/32] mfd: sec-common: Convert to using MFD_CELL macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-21-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133742_364475_511E83DC 
X-CRM114-Status: GOOD (  12.31  )
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.604.gff1f9ca942-goog


