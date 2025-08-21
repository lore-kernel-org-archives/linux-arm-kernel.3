Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8T31mCfWW90OKBE5TgdxVP07GBpIWXUZaFTrUQ7T0g=; b=3CS0no84dIqpok5VFwWQiW/xcG
	qq+LYbl3cEwj0PbpuXDWLXbi3e8bxTcccLHsb75n6VeKnppt/fCaxG+mFIeNRYCMTHa1YldOI0PSH
	8sK+uSWWjy+3b+WJKSchJB/Qa50Z2ttMU3SRW6F91PRNhO7z2MDSqEz/d8KI4hCTggb5EthOnsyph
	0o2WIaHeFbRLw5xG67ajDEqSj+o+gJIdu1v7ObswkS9iD7h5U/+dckSE8PbNVs9O1kZEzJivcaeI0
	FqxoKmqacfcSki6O6FSjCI7FPOkV0/eytJbPhfr8EGFGRWLK7L5nefDRrFDfs26052djhyGN4Uts2
	zSrz6LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhh-00000000EIK-0Sh6;
	Thu, 21 Aug 2025 19:12:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5L5-0000000H3JL-3Uxe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:28:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso564607f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755782902; x=1756387702; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8T31mCfWW90OKBE5TgdxVP07GBpIWXUZaFTrUQ7T0g=;
        b=cGlhoU5BTNyXtLMGwgVDv8haQgLidopCR0D4jNckMhnqqmZj0uIMJmcvaR24586vZe
         jnjZ5Tg2cTqbaBjh77N7YM4asTTn83s/BIwq5nhGpUYcGnuwv0ztP7mGG/hvB99mfWOI
         lPC4n5UxGHe1VQMb6EPHicSd6TLAs3izyc/nik4TFq89OTz0imgwy4Gqzi1Xuhzadios
         IxDOvcB8LUmf1PjH3oBR3V1rMCoNr/uszYmUEQN1SS/l8HCrEpj0CbdHhZZXjSvbsafv
         bVedKvqmeNTPqwy+W7Cbf0eszJOz7i/MCjtTYlSWPGcs4zKHsPAmzEYimr6C6oBpRKWS
         6cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782902; x=1756387702;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8T31mCfWW90OKBE5TgdxVP07GBpIWXUZaFTrUQ7T0g=;
        b=Mq6PeQjuojgW22RdDYYQrMJokQuLKWgF3rAN3364U2Uo+PO6f37lo4T8ZgwnT+nu/S
         L6Khr500VI4A/ZR4zpdGLj91r0P0UayJDgOvK0WZ480rsmoQHt0lg3N63/Coh7vzAWc0
         XVzf4GwFfufxcFsZiWOqo+3BOh1rOByQILWhZpXo2T1v27GaVic6YCK3ipyxev831RHe
         Irn2SIt5rfnqpRzG4alcRH7LUZJIdS3D52AJlyUaVLW4x3rJsZFP81o5VPrl46H0ra61
         Z4h55SX8Tcu4MbVdFpWrFpu5A6E1gF3H9i7BHGivi8rEPq5fLFyIJJrE2RvQk++g00RJ
         9+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUtFRdnrQPk/rULGiyJXa2vX0A3mMod73qasE9aYQ5HnHHaiHQpwHWUTmjTVmvU+xM8ohQy+AVR6uN9rbRDW/gM@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrCDHDged2V2qW+vQJSJvIM/4Lm3hLzzs9yJ4aP11G+w874xt
	o/tZ59vZ/FRf01Sn5NHYVJ41VB9Q9o0aUOd5o6zswGXFCox16RPZXUQXemD/5jvF/xA=
X-Gm-Gg: ASbGncsMpdzdb47sghE7tJ8s/0n2Q3jqTMq8tb7Codtpud8DZQ8sOc/JtVFPdk4X9qa
	77YYLkVy6T6XJj3lajreiDqFUJq2IGO6gw6VszKUGfFXavEoUxYV0xo43GqDvzg5nUZ0Jlg7I5m
	TUpX+BE5xKH3sXl/PxdjQq6ypqMvEx3ygGMkbjxBaNZ6QMX+l5WI75HtYOVaim3dInATSzrU/58
	CjTbufzgBE3aQdmnhO3ILPzKPclDr5sGdmFBs7Ez40Inl0OgGFHRcWng/HNjzEJgtnh/3g1K7sG
	+R5ZPhYtXcrHFm8Td4ozlpxplXHQUF7Z6Izzm8e2XvVIFiR70LA0q/rpbrdfhvXkQ2CWfIM/4B/
	bqI7WSQ2Wn6CHbi39v7kD+J3vBMdpYocQ/QAvcaVT/FiRKPCa8RetM5si7HPbQ3Kqgz6zaC//1q
	E1dFlvGgTGpo9T
X-Google-Smtp-Source: AGHT+IHOk+jQ+Wc1ajIsPeOQSauihlXX1jqWqmrDAgPp4glmc0IjdS3XEeisSeIe/xP/WO4p4q+GUw==
X-Received: by 2002:a05:6000:4382:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3c49452a39dmr2007478f8f.21.1755782901781;
        Thu, 21 Aug 2025 06:28:21 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db1be3csm31540135e9.1.2025.08.21.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:28:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 21 Aug 2025 13:28:19 +0000
Subject: [PATCH] firmware: exynos-acpm: fix PMIC returned errno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-acpm-pmix-fix-errno-v1-1-771a5969324c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPMep2gC/x2MSwqAMAwFryJZG2grfq8iLrSNmoW1pCCCeHeDi
 1kMw3sPZBKmDEPxgNDFmc+oYssC/D7HjZCDOjjjatM5g7NPB6aDb1wVEokn9m6pqCHbBruALpO
 Qxv91nN73AxVDRlplAAAA
X-Change-ID: 20250820-acpm-pmix-fix-errno-92b3e6e17d1b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755782901; l=3666;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uBtIogbSOsIbkE4R4niciJeJE+S7iTtvZxRDaPAge9A=;
 b=1nMwO7SPbvVV2Ic1y0bLWWFDpBvHQZlBekOmTvTQEbZx+2RjXPdcqhD6YnT+0MGs1ddVLnyky
 J4OcImc4x67CzaIkz3H3GahGRXSxX7N+V5IUctoqE+OAraYZLLQo/Yc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_062823_879839_0FE0C550 
X-CRM114-Status: GOOD (  13.46  )
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

ACPM PMIC command handlers returned a u8 value when they should
have returned either zero or negative error codes.
Translate the APM PMIC errno to linux errno.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-input/aElHlTApXj-W_o1r@stanley.mountain/
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 36 +++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 39b33a356ebd240506b6390163229a70a2d1fe68..a355ee194027c09431f275f0fd296f45652af536 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -5,6 +5,7 @@
  * Copyright 2024 Linaro Ltd.
  */
 #include <linux/bitfield.h>
+#include <linux/errno.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/ktime.h>
 #include <linux/types.h>
@@ -33,6 +34,26 @@ enum exynos_acpm_pmic_func {
 	ACPM_PMIC_BULK_WRITE,
 };
 
+enum acpm_pmic_error_codes {
+	ACPM_PMIC_SUCCESS = 0,
+	ACPM_PMIC_ERR_READ = 1,
+	ACPM_PMIC_ERR_WRITE = 2,
+	ACPM_PMIC_ERR_MAX
+};
+
+static int acpm_pmic_linux_errmap[ACPM_PMIC_ERR_MAX] = {
+	0, /* ACPM_PMIC_SUCCESS */
+	-EACCES, /* Read register can't be accessed or issues to access it. */
+	-EACCES, /* Write register can't be accessed or issues to access it. */
+};
+
+static inline int acpm_pmic_to_linux_errno(int errno)
+{
+	if (errno >= ACPM_PMIC_SUCCESS && errno < ACPM_PMIC_ERR_MAX)
+		return acpm_pmic_linux_errmap[errno];
+	return -EIO;
+}
+
 static inline u32 acpm_pmic_set_bulk(u32 data, unsigned int i)
 {
 	return (data & ACPM_PMIC_BULK_MASK) << (ACPM_PMIC_BULK_SHIFT * i);
@@ -79,7 +100,8 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 
 	*buf = FIELD_GET(ACPM_PMIC_VALUE, xfer.rxd[1]);
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_errno(FIELD_GET(ACPM_PMIC_RETURN,
+						  xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -110,7 +132,8 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	ret = acpm_pmic_to_linux_errno(FIELD_GET(ACPM_PMIC_RETURN,
+						 xfer.rxd[1]));
 	if (ret)
 		return ret;
 
@@ -150,7 +173,8 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_errno(FIELD_GET(ACPM_PMIC_RETURN,
+						  xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -190,7 +214,8 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_errno(FIELD_GET(ACPM_PMIC_RETURN,
+						  xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_update_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -220,5 +245,6 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_errno(FIELD_GET(ACPM_PMIC_RETURN,
+						  xfer.rxd[1]));
 }

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250820-acpm-pmix-fix-errno-92b3e6e17d1b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


