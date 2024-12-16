Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C372E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jHSn691OHBL23f0kkrBermuRwglSVSSGPFSIcJ/qrU=; b=l6tu/6cjX0Ly/JLfQbqI/tY5uv
	0SpJFsvA6EDZ1pF5Kmq6YOqsM9YyRGceryV2FYOmG0NSGkkZfX7Uz6huiy/63/Jsh1AeXFB+1jFXb
	z03in0E7vJUs6lr0uChRZWaqwKgTWAAuXinPhe3Tb2gCoFiIwmDeB/7waRpQ2kMgjYUEQN/CYEgKb
	Ir24TamWCnW3H09vh+hYHlw1HITJ/oQhw3INnNFtW4sj6ZY5hoJqXb7c/PuvF7epsUN8o7iyA3d16
	DGSvsoj9BYg0jUNxuzZhrwg/YkWRHNKhJVtlKEX48uo0grA+fMxkCpEKT9RIH9gFJjuCMeeFQdMGc
	3Oc2yopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAuH-0000000A4Lf-2FCi;
	Mon, 16 Dec 2024 13:13:06 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnw-0000000A2vW-0cVJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:06:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so37073961fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354390; x=1734959190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jHSn691OHBL23f0kkrBermuRwglSVSSGPFSIcJ/qrU=;
        b=gZUOJrxxjxTpx8g25/BPoPEYppigOxAlbQ8TjjrPJu/jZtdyGzVUbIyrvAbtFRrpZn
         2aIuxsPxJp8I07N4nVPlhrU6N6z1a2hcZ9KT0r0i/WKNwzIrKuj8szvECi60oOaZsZGB
         auEJW0aN2aM/50lOJjKm9b+8WQ/NLZi3bKsaOYlM2APCOdIyIRhq6nd7WPnOavQBtRZR
         EqTOu2Pmf6emZrwOu3632lI4pwtEjBhbuZWbZ2m+fjuidS8RSW+agUc73n8wVBKqSGwj
         kFT4iY6lgIBhvGQFlvq6tiIORYTy+M7OTrNDhR9uov14DTnRKNzWsDXtjrzDd4roLNBV
         eW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354390; x=1734959190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jHSn691OHBL23f0kkrBermuRwglSVSSGPFSIcJ/qrU=;
        b=lP4efBCe//rjGcAMhH3Pric7YpYubwC9ym3phbP1dYQqTKkXvpbUcICzUF7nRKrht3
         SBZxKAHqRqLP1s040lh4VhFcnHiJDzeTf/Uv8p+Du8aM5d5mPFHCZnFC7NcZCGElUgUj
         uH9CxMkiInf5cZQNE5FqeGBhtYn9O3wknLxkLg590sFvHZ26/PzpGXMFdeFZnzaj2t6I
         zbSUOLxQiU8c9lYHxtMTo26wRcnYC5p/Oytyv4wTRlC8vnrIkQ0zvzk9OVy9XvGmuZUq
         7mEa9hjghppPHD3DwepmIBCnGKQs2GFXFIvqrG//oZAPGGp3LruN+6D5h6XiYUtaM5Vm
         6RFA==
X-Forwarded-Encrypted: i=1; AJvYcCU179jgHvFzqvWTCiQk+k6ryDiinnEeycCT57V4R5tuOUv0cD8ps9pYVRuvMMD36YQE5Sd2ATOlV2zyjg/iIqZK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7pkPvCw/xr4uBtTU7mfWXDTeVJ0w2qTJbxydK/DdflehrayYV
	tG6OSZFU/FVvB71eETVOchApBX+MUnqqfT7P3JqakuqE7p0KWWeu8vZ0grXPvnl/JL9j/Mn/fGP
	y2HI=
X-Gm-Gg: ASbGnctnEsNnERja13z/bFuVaBfTj9w68nJvmxuWK0fkz1Tt+e9rW0XMaRj0iS+pAGx
	ep8n60z6I0f5HXNGxrKP+IPmBtqrdHNZna7kT/t0GiFrNwu5RhqDxtxmzrO03oT2V/bE8gB3nQ3
	MrjC0oOyMlgEhrqRR2ACPPbQ1S7Qavu7e+mvcTeX6aDjCS35/odGEkALUAI3EkLNWZR6JU2GMOS
	B8bmDBf7PTJKXZnujGX4FZQGJqCKHYHdF5rDt8e03RlNFcpiYsnLWvjLm56DNYcOSmn0WC/ZFdv
	CJ5MtBFcvW7aEwRBmzSyev/i9sjAxJE8YMP919kD
X-Google-Smtp-Source: AGHT+IHNVHPL9gCv6JsuwH0i+Iexhp279Myp4zBY3rnTq/iQAV9yBxFHBzZcKLky1N6tgEJkpPmDvg==
X-Received: by 2002:a2e:a58e:0:b0:300:ef4b:d820 with SMTP id 38308e7fff4ca-302544e3930mr46051511fa.38.1734354388504;
        Mon, 16 Dec 2024 05:06:28 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:29 +0000
Subject: [PATCH 4/4] arm64: dts: exynos: gs101-raven: add new board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050632_187548_8A4111F9 
X-CRM114-Status: GOOD (  13.14  )
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

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..7385f82b03c9 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -2,3 +2,4 @@
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	gs101-oriole.dtb \
+	gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
new file mode 100644
index 000000000000..75fd34797fa9
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2024 Linaro Ltd
+ */
+
+/dts-v1/;
+
+#include "gs101-raviole.dtsi"
+
+/ {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101";
+};
+
+&framebuffer0 {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+};
+
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+};

-- 
2.47.1.613.gc27f4b7a9f-goog


