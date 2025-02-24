Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C52C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDvEBdyqb+LCUK8JJ/EhfQ/X2vzVVFCo3S0RnsiF8pI=; b=zYBN8FDg9F0mWnj+7laKiLabig
	duaYtU09nSujEOrms0iK/iaIjgjOBNLSltsgPn8g7Q8ofVkHd5f7gvmzW0UxlR8BIRc2X9vvVooXH
	JylW5oMtK+Q77bwyREzTJRhWOJDZm4Cj7dJrtCkpTCRudnCwh+dKATqqvpA8zNoF8+e/3UQfM+RPz
	IE/OEe5/9hVn9rwv3npwq/gKUARFiKjP8Q8S+0b8DPwfg8Qrw+SdUZFGm83/L/q8xA4FXQUBPn2v1
	P4hMARYBbcxls3Tf+omWEQeFd8uLg8xn5AgMDsnuI+rlw6gMvRwRffSds2KtSnUxRPZAviSm/72pb
	X64xU4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTSD-0000000Cch6-02e5;
	Mon, 24 Feb 2025 08:04:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTPB-0000000CcKD-295j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:01:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so25741525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384092; x=1740988892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDvEBdyqb+LCUK8JJ/EhfQ/X2vzVVFCo3S0RnsiF8pI=;
        b=Z5dpCVH49CJPKlgfSiUtyHBZqNHlNcxSRH9j3dqF4dcw8fpzk7qUKLhOwXX5HnFoN0
         +wxFrrrOlg53uou2S+Z97iEcD4gAjjkJzY6l4ar7joqRAN8jDaKgYnAh4Z9tgJvRkZUf
         eAOROnhcdoF+EBmC3pk1LyZecoSBuBCMNxJwd9s4/Fznu5yPmCxVMMwT+gbFYcFUvYLz
         yW8xxHrJ2svI+c67u21yHeVeKfEAO2ISe5IIhrE6qiXY1ruohR5+YaIv382wEfg3lMIN
         kV6dH5726CLqC0DWlOOB5X2MbzBeJ8mEGQLNvjwHasYzlZOoO3PR8pM+n9+4riftE/+O
         4Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384092; x=1740988892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDvEBdyqb+LCUK8JJ/EhfQ/X2vzVVFCo3S0RnsiF8pI=;
        b=mNc9OhfaDMOk6nO6RQAmr3TrCItjcedsQRFhDA9YZ2ypY86Ex+CHekVZ3m2rc8IkKp
         +CX12gMJATaBukzLbf/8oYbbEhoioO2W0sXyUIP1xXbm435KUhxIu2NNjG5I5pp4prFw
         jAYS+4i7PiEIt9D4zIs27kLYBH25W6u6JvlCkwwmEPGJnkPBfBxwG/L6hxdnCn1bkrHk
         gP2IUBLfzo9NAG2UAmoM+8mH5xFtqvNR5KLECnSHmRxJExKF7UaKmPtz4Dc/8qo3/pZK
         Hkp99kzqKdQCcs9vMaBCRzi4oeswPVJMCGFRh8mWPdlzint+sKuYXUYfeY81G/8v20Aq
         eyng==
X-Forwarded-Encrypted: i=1; AJvYcCVZM9bRtnMdZLG/66bhJ9/6Al+DaH1Mqc93mctP3SH9dF8jrpbOOWwmg8nQqki/IRdbGIzLFOSZzevNAqOv9znt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ugeWu6iEzlMYs91ZgkgOJEnvNI2x5oeQBTJ0rwPC62TxlHRR
	Bonx0r6WBeNdy2uvDJP4RJXTpbVgBf9LAadQ43JRQvmcve0YOMezL5RqNB39z3Q=
X-Gm-Gg: ASbGncvzcAkrBa2/3W4CvSRHm+xJwfJ/ig3GPQ4u6NlLyCgN+O6mn+4Mh6JpbSBwAIH
	EOUaH7+kV+xkdUSHSiHHDMTHx8aw33MzBy+rXGshybFFg/f9yKAFX8BBZi5EX1EBGzmnHgvt83v
	B6sIjp9Rj3z5CmjnA7jdqyBmzVLt7wJ62S+BYA0SP2D1hLD6E2iZ4wFoiB1u9Teybe0CWBT/R3J
	BNOUek2WtDeEiNFYpKf74StXey6QZRfoRxvVMCjQKrxSk5yjuPUr+Wh3sT8AxQjm2XXcbjfkhol
	O2+ITA70RjHNee1bM1Rz0mWfMgvcwsMqK5+GbLqdGPY9dzeLAOTTp/aZ80emOAZJ2iSxMha4JE/
	3KHs1+Q==
X-Google-Smtp-Source: AGHT+IE4ZDfn8IZlrI1hvBZaxOYiDGG0nYOPyFk3VkBXJ9hbsd17nkiDUQ2UUuMCC3IuQ80wYzn30w==
X-Received: by 2002:a05:600c:4f92:b0:439:9377:fa22 with SMTP id 5b1f17b1804b1-439aeb3453dmr95707715e9.18.1740384091916;
        Mon, 24 Feb 2025 00:01:31 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:31 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 24 Feb 2025 08:01:22 +0000
Subject: [PATCH 1/3] firmware: exynos-acpm: rename exynos-acpm.h to
 exynos-acpm-xfer.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-acpm-debugfs-v1-1-2418a3ea1b17@linaro.org>
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
In-Reply-To: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=2304;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fLnEiSETJ8+PZ13rLV26ADkS/jCTNTqwXysxo5sNB1Y=;
 b=3T+7vTI0DjoqdFOzA1ETT/a2YAOdtQrNmTHKgkHboovpHfmPcXLCAGDs1fKlPZGN1M4U2WRzg
 ZwS4rhbBJLnDhj8MJEGz0gLckLiY937y7lH/k1/+7pa1o+7yd1Nce7y
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_000133_558762_F2E31D5E 
X-CRM114-Status: GOOD (  12.97  )
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

Rename header file to better indicate what it is used for.
This is a preparation patch, as exynos-acpm.h will be later on
introduced and included between the core driver and its debugfs
logging feature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c                    | 2 +-
 drivers/firmware/samsung/{exynos-acpm.h => exynos-acpm-xfer.h} | 6 +++---
 drivers/firmware/samsung/exynos-acpm.c                         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 85e90d236da2..9ad4cb82fae1 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -9,7 +9,7 @@
 #include <linux/ktime.h>
 #include <linux/types.h>
 
-#include "exynos-acpm.h"
+#include "exynos-acpm-xfer.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PMIC_CHANNEL		GENMASK(15, 12)
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm-xfer.h
similarity index 79%
rename from drivers/firmware/samsung/exynos-acpm.h
rename to drivers/firmware/samsung/exynos-acpm-xfer.h
index 2d14cb58f98c..0b76a270b773 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm-xfer.h
@@ -4,8 +4,8 @@
  * Copyright 2020 Google LLC.
  * Copyright 2024 Linaro Ltd.
  */
-#ifndef __EXYNOS_ACPM_H__
-#define __EXYNOS_ACPM_H__
+#ifndef __EXYNOS_ACPM_XFER_H__
+#define __EXYNOS_ACPM_XFER_H__
 
 struct acpm_xfer {
 	const u32 *txd;
@@ -20,4 +20,4 @@ struct acpm_handle;
 int acpm_do_xfer(const struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 
-#endif /* __EXYNOS_ACPM_H__ */
+#endif /* __EXYNOS_ACPM_XFER_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0..3c14afc89fd7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -27,7 +27,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "exynos-acpm.h"
+#include "exynos-acpm-xfer.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)

-- 
2.48.1.601.g30ceb7b040-goog


