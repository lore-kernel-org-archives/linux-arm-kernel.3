Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4E5C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xntQcSlXFoGkTWBw240rIz1TyOhM7eOdWY/eEvFx0ZM=; b=eCT2ukIEcijg05ZIsJsJZydOV9
	x2PTgCc3ZdcAjTWc7wYwrU24i+wjAuChEP+JBkr51NQl7Yhg3kAw15mgGyv9xpcAPL3dFKkPYidQj
	eQxhAe00RwzxZ9hrin3bXVWayKIeq12oj/0CRu6ZFhFw+BjBHLrM+luNdyKnb9zOlHxgWfSviCCUY
	Sz1ypUjJl0HGsM+xjwPCGeuvAmUooI1U3IoVpI4hvKVszHPoH6EeGnrMuLCoambAQh2/YQ/cuuR7W
	dyGYWvosxhuG+Ytxb7wStwzWdY+VsAyofmw6+7x3sXJfAcrCIAYP1ZjgPIJ4IcZgSPMoUhK7MCmBf
	MSXv5lpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQVj-0000000F5o8-0ZYH;
	Thu, 16 Jan 2025 14:06:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQQg-0000000F4lp-0zp1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:01:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso818004f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737036061; x=1737640861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xntQcSlXFoGkTWBw240rIz1TyOhM7eOdWY/eEvFx0ZM=;
        b=QtqEYjiFSK+O3g8wVEHgkczljNfmbyaWUsSPYdEsJQ8PQq6FE0YDHpNSEJzYQbGcbQ
         to5Z08zJTNt+szdNP/FDEOiPkVobcfkNBdBzei80L+7s5TpBQlZa/i5Z2uaytjMpgWJR
         xz2R3nF250OCN0e97cywwc6R41KGAmTCRz5hKFf3HT2+xxpKoXB7zDiSQrVUyeTeAfyB
         Y6fdtP3b9d17xIFkFAFCz64CNXh3uez7Obx2HNJAGsrUVnisMuOEAmuuLRbktQEwU17k
         LUzO8kHPuUdkyJ7kLbXfq7/ST7Mr4cc6PDPk3WF4AXD6MaHloRUuTDAMI29Ksdg1pRap
         7aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036061; x=1737640861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xntQcSlXFoGkTWBw240rIz1TyOhM7eOdWY/eEvFx0ZM=;
        b=aSvKEqH7CwZeNI+gIvWK4e79lVEzv4khSOVzOeFIdwI3+GA9SZK1kZNxDZIp/azwFv
         T9Sfgrd8GBv5qrDh/3kGO1CEwbNzaGiKPujO3M0ujWQ2X1UTHAq6TTGVqtkb/+S8xkFt
         ZrZQvy9fShbGRju1q8qvd8LKLhkAESQ/AhvESq6i/Y6lI+xBQ+fonrAXYci9p9luNuTL
         e4m91+rj8iy+wLZvcKBI5J5qKr6He8NEl34s0pTU/OtU0JKB2pt9uu8xYeyHSEX5TMa0
         cKQ7rQL8PxGtBFFxjZ1aWy+3+wGlJR5bZB5GRKSMwO4eQTgbUGEzd08X4PALUf2i7Vmq
         C2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVYgq7elfY0o7DQjJhEtJLX4OErcRgDyoydeBx+3DvuHaDHByy8BrDpOIQk236OT1Vxd3+rv8j0qDNIIg6j7FR8@lists.infradead.org
X-Gm-Message-State: AOJu0YxEAhFX52orLjkdUZMX0Z4eZWgOrDw0R6rTJBnlnLCUiVpi4Lsn
	6adzNXNDi/GA7LOBA5rPM5M+Xcg9nsMhzxdZcW1uaZ+cDSsWr40HQhSySkI0czE=
X-Gm-Gg: ASbGncsL0ILCfID4Ba89LhqN7nLyzqsdxLWarO2bGgeKX6cmOt8rcSggpqs4B805d7w
	+Uq5tckXNCm75dgdwb2d/OPhbgKR7BM740ovXfO7Jgk0TibkFcy5t1Da7SSeyzCbk1pH9vdYlQF
	vipqWi7cp/Q/2lA6PhwfZ1nsXdGgblGvjtAQ6pg/eUeQPPj98x1EPs8HszDHJPBxxyBm1sVEU57
	F9eNU251kpOXcp7HYDnwYWmPluTpEKjs+eDWyOplxLY2FJH+NRUhMPQHacdSQEs3pdgum878+W9
	/GYL5s6iNkK4hJtBG1wDTeqAEq5yWyOowSSA
X-Google-Smtp-Source: AGHT+IH2SRtN9CpGsM4C0gXP+NC1NsKyk8FPQPBWXyMNGGxLW/xtgSq5XKpAgQPM584oCI/o9tArVA==
X-Received: by 2002:a05:6000:178a:b0:385:e35e:9da8 with SMTP id ffacd0b85a97d-38a872de3f3mr28972194f8f.18.1737036060360;
        Thu, 16 Jan 2025 06:01:00 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1f2esm20608846f8f.98.2025.01.16.06.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:00:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:00:49 +0000
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-gs101-acpm-v6-3-e3a2e1a3007c@linaro.org>
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
In-Reply-To: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737036057; l=1248;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RVUbs2WR3PHq/FjGa280/jrnw/yUQ7RV9eVzPoYZlyo=;
 b=/dukyhHyfsKWdjtkSkZop2IDZ3HvxK1tioPonZJyQLtUs4LUPlSzEJbp/JpVvOWr0Q9XMbs+2
 q9v7KT5kMo4AE1OKZJtJac4vvHgcL/rGRjdCtp1ocQPAwA4xGxkwdmg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_060102_286216_90E2DEEF 
X-CRM114-Status: UNSURE (   9.28  )
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

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..076b6c1677c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3020,6 +3020,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.48.0.rc2.279.g1de40edade-goog


