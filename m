Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FAEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jmpxBMmEPk/hDGZYt5vcaNwz+hoDqezVHu8V6ZILUc=; b=jirA+Fz5VetL2gIRUe/a2X54zZ
	BZCMeQ8MWJANAAMgEwvgqFR+FSqgTzZ74dCc4fEVaRo+iEwl/VwGD73pRD7NFvVJ732jel7JPN1ZF
	43+HsFWgV3IngajY7rHfGddIANyVtL6WdrZJZmfRBKQaZt7vOACfnh9i207sgQL7XDcRu/Lx2dHc+
	YVNBVrFBXhtj8dPB6KEfpc7tP0QKTjU9S3bgCc4xmgO7GrzprZ9/g+uZqHXwulHATmh7s5gTfZLlP
	rXErNQEWVu2B2YMl5kUqS4Mt/WXD+dn+MCJY5awb4AJsr+o78/AjFwhooxsec5QdxAcZ9baSE9oe0
	ZXoURuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlXW-00000000qFi-3aCy;
	Thu, 12 Dec 2024 15:55:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlMB-00000000neI-33Ge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:44:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361ecebc4dso5618655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018242; x=1734623042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jmpxBMmEPk/hDGZYt5vcaNwz+hoDqezVHu8V6ZILUc=;
        b=uvMPGo4nMoI/aoRdYIUJyuEHCFk0muMC70vwgqp2o/vW62yCYrORIZCbjM3fSz8MB6
         buWH02pwqyuwLGa9hkOkQfGRqJc+6ApgqFQsHDXbsA+M9cYZHnlDJBlRf0i071nMYe+F
         TCX37hwRjzVJhROOAdZFfGG2AOgWnnTGKFJjTCY9bKt81FjdSpnh9OzaoNZLPzxFUG+Y
         UDu62Uq5wMyYjyhBcvIQzJFbesZ2aCDUIbqf+9+5OIjvVkU8CHMutrwNdnjgXAipfNfK
         me+5d6r9o5PO5s/weG/oe91wuBcCaOqAWgT3Hnllat5p02aoZcwIydDxIgYUDF6jS2rh
         WP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018242; x=1734623042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jmpxBMmEPk/hDGZYt5vcaNwz+hoDqezVHu8V6ZILUc=;
        b=XYu8oDtfxLXkurAPuSpONRR541PcMRYmvu5SE+h9xu3+RwUzTYOXuB5fpfMRKGMRTZ
         NSECMzI8J0c8/My3biq434Jmaeixu1lc38c6ihQl8hW34kB7xfhSXJjRpfdkIAbuqyYc
         iF7Z3a81bZvQhX5s8qIjb5+PFyTehp68FJWBzRacomUQeL/84MonHVfYBngkbl8DyUmS
         GHcsy+joe5onosSWvDOFb9Fy4ahuR2daJvbmRL57Twm5DZ5AcZ78EL5xeQWtAUG/bMYz
         rlRfipw9eiD0Ou67NGPjwiISnGRhyOcGQq8WMVlteZFC3QgyiJXxjPbkvo5CD/dPBi9Q
         SkRg==
X-Forwarded-Encrypted: i=1; AJvYcCWi/bcrBO/Zm/BT547ClrznVeCnqkZSxRGyn3RgdShHtIUnsihQq70/rszU82ZYpH21IWu3M6RQUpLqS9JC1BQw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr5UbaMcy7c895/oXOe9hLGKu8aS/XGYCqnBIvaF5ZHz3wVHr+
	o2ejuR/pM5x4V4tKwjewjQWgwqdtSn8SGUjA3CB6flgDcTzPWNSwLBLwCWTj/No=
X-Gm-Gg: ASbGncuPsfCChKEsYqfDxS4jmfcGJHD9/dC4eKcKyNUOIUthHEYEIJ+124PClV3hPuk
	ohZ2AlmRZaXGy2s+2ijjhrPdlZOM9wPawG3Y5UTOxnvZ1DlSdnQHO1KbZpxKuMgU1lbw02FEUMv
	l8zpj9hmDyGXJSZN8/Z3wsOHgzNbVrpLZg0PJFMq0zWZX76yRPMg7f39fu08MyKwW4WQGDLNPeM
	N3zRhCPabHI5KQBPi2NslKFrkZuS7HD3hcbK6cdsz6w43AiRiN7TUG4w4mJ16gtX2VYnQGsRNpb
	xWYJwicHWMDsAk1Sn4h+20iAXUbkYARfKA==
X-Google-Smtp-Source: AGHT+IHcg+gCbENXrOnWdym/CCFPs4XNPvTW5TwhNoQhFdCZwrQBeC1rscXUkfAVw1V8vMafB1xEDw==
X-Received: by 2002:a05:600c:3d1b:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-436228236bfmr33478765e9.5.1734018241710;
        Thu, 12 Dec 2024 07:44:01 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm19992375e9.9.2024.12.12.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:44:01 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:43:47 +0000
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-acpm-v4-upstream-mbox-v4-3-02f8de92cfaf@linaro.org>
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
In-Reply-To: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018238; l=1216;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=8mV9HZFeUbw3Rtv6RCuQBzzPvwJEiDZDgZep1nTSp4k=;
 b=yeuoS/sNPk65uWseJnVuPuzWQtD58gzxjfTW1Kw/0dd1iXCyllusrv6nI04K9dKfxAk86WG2E
 olThScAHX1mBffXV+8E8qd53mstn3yY00cjPYRoq6hqenWh0IjLvpyL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074403_772566_2C28E099 
X-CRM114-Status: UNSURE (   9.39  )
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
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..b3b472771476 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20715,6 +20716,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/dt-bindings/mailbox/google,gs101.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.0.338.g60cca15819-goog


