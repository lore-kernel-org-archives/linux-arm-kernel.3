Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB4FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HO4vKlD6tNCPtkuVgbWkA6ubwQYE8g7AVmr9ium5BE=; b=sThDw4Q8w2bTEAMtRHb/QdKF67
	MN74KUjXDHoUDKrPdadkpwTUg6luvGn723YZafHJnRumwZtG+lyb8E73TYoUJB+csVU0CUTZEPdiv
	8wAQW4uSkCf1+0jZT+xuriccerX1r0IrVSKgsf+gBCY0SCyYGPLtWti1K52K2m40DJmv7gmRsqosR
	Q2yJ6J2c2xNlJ5HgxJgYCF+MjwEGZcvlz3i17sL9dZ/JDXY7Pop0zRNJaa6MJ3FFTxkiEvz/nJa1R
	HVeor3yA0qJ/uhsRKINoQsWHtOChvfgzD+OavNtL5ji9Rxe3HwTHETtZf734ijrakdwbmutZvUoFl
	BozRS8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4J4-0000000C6vX-2dr6;
	Wed, 15 Jan 2025 14:23:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4E1-0000000C5pG-1RmT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:18:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43623f0c574so48541845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950708; x=1737555508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HO4vKlD6tNCPtkuVgbWkA6ubwQYE8g7AVmr9ium5BE=;
        b=XPv8kIy4uWIm8g5/82gESgtl8ZBDtejqcXcD/unjIHbsnrAKbqsXqMSj+zQMvHcAyF
         Rd0QDfmsEGfFV2OxDUIdgqBV8qO+p7NHxJ7jTM6dUOMywraPEC+GfqxjFAJ0RCJJH/7i
         WLQqxoIpLrKTkwN3ustVlLmWoXugB4yEXhrV+Ag3sDR19ECRkEZ6qVHcIewhX22tc/C7
         C8x32/KSzEyUdPKvC+CHAA81VEtuuVOEPdP4l5FWdKdyBbytoVYGenojbA8+t+mUDaKC
         Drkdb+HjE9iJxPpMX8BzsBocs5VxcHtRW7FXlDUDJPNOEen3b/CtAc45GHSfhdEN8lA5
         unww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950708; x=1737555508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HO4vKlD6tNCPtkuVgbWkA6ubwQYE8g7AVmr9ium5BE=;
        b=Bak7jq+hEwFdNRDHleLwUZ0E20EUDNFldqYXubv1vNfhRzMSDjxz/+eIwGOYkT4OEC
         XNLxQUjJmh/4GDlFGFtJG8BBMc/200MjQ/sNe3m2PcUGTisVgM5Yok2TuWdZb32QAGbu
         zbl/w1ZdXYVep6BLesKd56/658JKQx76IzxzFEfy9ipTqwONwWT5DYy9MmutS3nn6fn9
         sSaZ+Y8lPluP+4m7AxyRQFX8G4l12PKup3II21RdLt0qMZ8H3FH0aYWWq9CLhMUH8A9w
         XmJNYo37A8oJbIwg0lT5AU3mKEUYO07tYlMPncFoIkLLfZ2/2xL/hQKAqm1uoFZP7q9L
         ySMw==
X-Forwarded-Encrypted: i=1; AJvYcCUH+QFKmSfHBkYZR693jbB1wwEzAbNXRnFh6Mbws9M216HHjpfPNwkx1R3RRhtkUeNCERn22NpDqA9HcAcmtgru@lists.infradead.org
X-Gm-Message-State: AOJu0YzByjJ7T9JprF+95J2fC+5mAOM4zIrlFwYABKmMH6YaAilbPOTQ
	oAVY1GzOH4ykZYjVH3i9KA3UJlhreP/xpzEMc5ycffh0vyo8ywS8/hP3jOS5y0E=
X-Gm-Gg: ASbGncsaz3XettzJ5W6VIYh88XersqmEmk/CqO8OpEfs7ilK1yN2n3qkhiXUup2J3y/
	ZGc3zHXxZRUhIzudYBm+SUAfeXmH+Ghu4JrezzB+pZMID7NbTGrg/8JU8FpaVSn8AVQp4nlse9k
	YofWbAzMECNJK6d4bP9ub4/vFDfcT4avc39eD1PYEkXcFGYN2eXE1nZsJMC/+trv3pXHRBH26oc
	cy5pRKe4kBvPKsZ/O4/d4ZGEOrg3fMDuED7zH/AH9lhUEdQlyD14rp0zq0o8Ac/9NFPlH7+nfl4
	nEXHmiXGay02hKFX/aUe3MvGpqxjqqL+f2xP
X-Google-Smtp-Source: AGHT+IEqKXJJbnn3/1vrwEtWmevXHNqUju7YBJtvyvj3cj5u+nYmT0ONw6A52GmWC58UAHN28vy5fA==
X-Received: by 2002:a05:600c:35c1:b0:436:a3a3:a70c with SMTP id 5b1f17b1804b1-436e26ef06cmr220817945e9.28.1736950707824;
        Wed, 15 Jan 2025 06:18:27 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 15 Jan 2025 14:18:16 +0000
Subject: [PATCH v7 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-3-948e09fcb5f2@linaro.org>
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=1338;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cvoRnokHeZzQ8VRShaM52NdG4d55CGIYxo5phUWuECU=;
 b=0aWQkFROnDt3ngWIx381mdcLAcbZApevkQbElAx12vy+BlWgFaRDh89nZsR0/9mv2HawEKvjC
 tyS3q9kEstgBSc7lvjrckxx1b0ySb/qAlqQh8J+vp2+hHZL+VT3G2E5
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_061829_384627_16C71271 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Add entry for the Samsung Exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..20163d8a8d90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3020,6 +3020,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/linux/mailbox/exynos-message.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.48.0.rc2.279.g1de40edade-goog


