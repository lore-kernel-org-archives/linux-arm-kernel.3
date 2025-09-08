Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF5CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5RQZ/QOE9TZDV7pIc1NrwTekYlZsnd5jalWbAXr12tY=; b=jp/Nl3AkwlIRWGNfXBa8t4fXHb
	3g3SEwFOQU5j8iubBmoFLRwNhkdK9lhr3vVb8n9R0PDMlzpJRDStonI0GNkFkhyK94PW3tgvmaEqE
	7PuF2iikZG5IxFbo4st1YUihm2LG8VVafK24QvoiX9eXZw4tDFS+4MtMY8P1kYMxBW0KT2bGpRaJr
	Pl7EZWNSjFgxOB4mUDGgD/hfkMu/c7OpPegWnqiquYubNKT+wOK9qW9SIRtFTyQYrTko33MJ9xvoc
	0p0Ha6BKvbZXxXhofXkU8sYiGXkghxfEFq2BbZQpcgv3vg0DOcyDtFTmr25jCHs5v9nVyTC+IKtm6
	/L5S1+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfP4-000000015bT-48v2;
	Mon, 08 Sep 2025 17:11:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcRc-0000000HZLd-0Olz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:02:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso2831647f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757340126; x=1757944926; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RQZ/QOE9TZDV7pIc1NrwTekYlZsnd5jalWbAXr12tY=;
        b=Ck3bTtx1pXUmy888QAQvhpltdnnWwo2TSPFCrRI1gvliVPvBRj1AjOHgocEz2EXaX2
         g3GL8jNQ0uJSCWBr6zK7xjXPXt+B6xcydu9n1IDGeDWn270uqRDfx0aqmDmgLbBiv/cB
         0piMvk+r79y8YAsUI1OB98EfvA6VoIBKwrJDfdkDBZmSuv+DX8dQxbmKqukkDCJvz0zK
         Y62to3MswJblYC3eZKCQSMjdildY7h1yPtY10/XxhaZK59Zj8MFyoWxKUadWPv3cZz9R
         z+w2MSxbhWVWI32gFKaMEAaayC+5aUgcZEBhh9xA03sITQZrOHIpE5/WUELrkvziZb5B
         /bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340126; x=1757944926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RQZ/QOE9TZDV7pIc1NrwTekYlZsnd5jalWbAXr12tY=;
        b=S8zU1XVZLVXkwSTd+A6q60y16bGAMpVtgTHF4iXDbIiH1emN6Tjp919zp7EkN9bO87
         8uCwCLgy4yvDXIiA4vJEk24KxFjM9GLgwrO9S52BrWf90h3UECCwPh0QTYHv1pGnm/6r
         xKHppj6NspSwTTNhM0EN1tN9QS/MR2NGJ1qP++v3KEYy0K4T12Xi1fv5yap5AQ7q+tba
         Gr9alEBhVJhM6rJ6tGPl0eRpIUjNb+xMJkToRAcKPnZYc9aDl5Y2dTrAGwoMX8XwYPBK
         4eAm5WMrl/9FHQo8LUwSSurPV5+Wz4pYQCuFq5meyN2LaDushwLdq6opFtoW7RIV1cJ7
         wKaw==
X-Forwarded-Encrypted: i=1; AJvYcCXlAGK3PIlSfCAOroyB37HkFjGB471XCONRJfCryj4NtdJUvKz1MOkkPrO9Ckcj6xDYOSNn1yKo1yFfJlZ5hJvs@lists.infradead.org
X-Gm-Message-State: AOJu0YwThIW/OHj0L+hmIozMCjNAoDixHYe92yLIc8lIF197dwoIzhAr
	+cVxMEBpcbIlW31aYbey74fIcwbAfyRJnB6KExSS4MRamgDPn7k7QdBR2bfHyxr1Wu0=
X-Gm-Gg: ASbGncvY8wRVSdCvGbPNRmHDMQ9N7tyOqFYN17cypdaK592KTvqXvXodhK/EvdxulBv
	rPG3X1jXhfYLYSBM10WO6gvcwpbGK2ubl6USD6Rl7ZOW8rbCnZ0nHgleDuoYcUhjR9QytexFe45
	GFa9ywdPNqt1/930ks6ePgnzbS3Rrlw8ytQ7OKJ8nZngIFwbmdbWAea2mCOx0xRmf4acvBozUS+
	dQTX6ukIOe/mtzsujr0KuLiycAWQg5/Twl+jRmY6T/FB/MuKVP8p0eheHq61bve1BB+JBSWXW0t
	+n2hrofMhZHYSWw4dSYjs6MzZG8D69UcWvo0RlcXe1hnrPcfOgXsJYgN6wc+cQs++Ni1CcJRgvM
	HZbQQU3bGlelIGau/wmvUYWVscrpBcfiU4s7exlJa0++tavQc5msiW8nukLTaaExkuGGkCCRPNc
	2BFYvPOx0HoT2iEmEmY6e8Zj4=
X-Google-Smtp-Source: AGHT+IGzcGQ+F2OqmZfoK8PvEKQf84hVehr3slGK6Le4o9R+uV9RGVF4+iDIn2UYKe3BWKulhajCOg==
X-Received: by 2002:a05:6000:2f87:b0:3e4:a51e:5d0d with SMTP id ffacd0b85a97d-3e641e3aaabmr5830362f8f.1.1757340124783;
        Mon, 08 Sep 2025 07:02:04 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm42013031f8f.27.2025.09.08.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:02:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 14:02:00 +0000
Subject: [PATCH v2] firmware: exynos-acpm: fix PMIC returned errno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-pmix-fix-errno-v2-1-bcc537cf3f17@linaro.org>
X-B4-Tracking: v=1; b=H4sIANfhvmgC/22NQQ6CQAxFr0K6toYOAuLKexgWA1RoIjOkY4iGz
 N0dSdy56OL9n/+6QWAVDnDJNlBeJYh3Ccwhg36ybmSUITGY3JT52eRo+2XGZZYX3tOxqvPYmK7
 giqkeqIO0XJRTuVtvbeJJwtPre3+y0jf9+eivbyUkrGuyZVM1hTn114c4q/7odYQ2xvgBemn44
 bcAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757340123; l=3824;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=UPzFrmYlehQ67lOfCOXqNsyB4OmdijU+Qi/kEZAQkKQ=;
 b=sef6R5CI8KayC5IctCl4Gh9igxFmkW38rf9t41t2Ip8vfbeaJX4QKiwtWpHjWvLTVGRyOqsVd
 gXz+n3EAdEsCW05os9o2JYGiSLRvMXvrrWOYgPQ5wySZ7T7i5wZO7eQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_070208_148432_D3E2322E 
X-CRM114-Status: GOOD (  14.30  )
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
Changes in v2:
- remove `enum acpm_pmic_error_codes`. use designated initializers in
  the array instead.
- constify acpm_pmic_linux_errmap
- drop inline from acpm_pmic_to_linux_errno
- s/errno/err
- Link to v1: https://lore.kernel.org/r/20250821-acpm-pmix-fix-errno-v1-1-771a5969324c@linaro.org
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 39b33a356ebd240506b6390163229a70a2d1fe68..961d7599e4224ef6ebe64dfa2fcb441a4dbd78a3 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -4,7 +4,9 @@
  * Copyright 2020 Google LLC.
  * Copyright 2024 Linaro Ltd.
  */
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/errno.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/ktime.h>
 #include <linux/types.h>
@@ -33,6 +35,19 @@ enum exynos_acpm_pmic_func {
 	ACPM_PMIC_BULK_WRITE,
 };
 
+static const int acpm_pmic_linux_errmap[] = {
+	[0] = 0, /* ACPM_PMIC_SUCCESS */
+	[1] = -EACCES, /* Read register can't be accessed or issues to access it. */
+	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
+};
+
+static int acpm_pmic_to_linux_err(int err)
+{
+	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
+		return acpm_pmic_linux_errmap[err];
+	return -EIO;
+}
+
 static inline u32 acpm_pmic_set_bulk(u32 data, unsigned int i)
 {
 	return (data & ACPM_PMIC_BULK_MASK) << (ACPM_PMIC_BULK_SHIFT * i);
@@ -79,7 +94,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 
 	*buf = FIELD_GET(ACPM_PMIC_VALUE, xfer.rxd[1]);
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -110,7 +125,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	ret = acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 	if (ret)
 		return ret;
 
@@ -150,7 +165,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_bulk_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -190,7 +205,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }
 
 static void acpm_pmic_init_update_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
@@ -220,5 +235,5 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	if (ret)
 		return ret;
 
-	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	return acpm_pmic_to_linux_err(FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]));
 }

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250820-acpm-pmix-fix-errno-92b3e6e17d1b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


