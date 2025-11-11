Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imIwJUQw0bI9H7QFTurPbNC+Bd5DwsLxwxGR/tUh3uE=; b=OagPIB+lnWYg50MrGT54lRzwGa
	js5q0QtAVovQzPOimBFipWM7x0FHSVLEyNDRcWUR97f+Xmcm618kJMJ8ta5b67Mi2KqnHWS0k/U+/
	htUOYbw0zcbdW4DqNtDgy4IGhdpzKCSJk0q8jZV3p5xb5vWXXIX3gfMoWHrdIfhNLIdhMd7ujwC6k
	MDFG7ZqlMzXBK5VU7LcfblfoAwXSDPorMvV7yKwjyQ/Ry2ZKSSqDnXD4u6yRY/5CSG56e5DmT0TvZ
	owElg3G0bEYOkfqF6JabLjxvqyTWmjIzDl5Ge819/nBqMg3hO76oHf+sZv3HS90zfFq7Lw6ptsc81
	ZfNtHE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu10-00000007gTn-3EZ5;
	Tue, 11 Nov 2025 19:26:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0s-00000007gQN-1Pxh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:26:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso34651a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 11:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889205; x=1763494005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imIwJUQw0bI9H7QFTurPbNC+Bd5DwsLxwxGR/tUh3uE=;
        b=e714UbN1OU5Ca/jRt3NyJOrRazukIi72iM+cAmFsQxHNcDfoWkljlqjrffVSjt39gX
         DP/DZVZBepqgCyH5Osy2LGaU066U0lOIz4Y5GnLjqnVMt6xYW509yXV6u15OvLZ/lA6C
         YTMIMYUlhp2HHMi7tOesdhnSb/B5Om38LSCKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889205; x=1763494005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imIwJUQw0bI9H7QFTurPbNC+Bd5DwsLxwxGR/tUh3uE=;
        b=xHbDEyLBRXBnY/wy/g/qGKhRndWEl5WVuV9KyN9MJZaRnfSDzatFm/3s814clvkvqa
         TGaYv1ovyoFHzbLCSjQM9wQvAgjt2Iy4+R3OEW/ZFrgXgm0IVIWvGEcA1ar1S3lBzIe+
         dF7M6I0OOM9/OYMa+8Rc4pV/TV2mjA8WKhXLMCy2fEzz7DRK98JGSImd6f7EoleLWRGL
         zACIvMnTjGFaudoALpIZHKEWzArYVdehI/U12m5SLgRqU4aACNOfRK1plR+piORpmMmh
         XsAl1TvVbhOBk96oNf/hTDDz5hf2RnfUR4bATQ3rvhvqANSOcp4FWrZQCMed4FEs/xyx
         dwtw==
X-Forwarded-Encrypted: i=1; AJvYcCUkS6jqySRKgWvrHYRpBHhuaAv8LG+s7M2sQOqCuOmTnp7vDlvF9Zmci0P2EdB+I+D6O1Ma+NYK9u8+Bps5p3k6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx20CSpyztYu3cvA2BVCWd/wnRhRR13w4MRLcjFRWFubF06lCpE
	2us9RVWJI1NOYW14uFDeO7k1Y1VjRNhBy6QHgbADSLhiPeMTRUTzWHxdDP6W0JuHgA==
X-Gm-Gg: ASbGncsME7vnD/zaolGSk55ILun5NY1QH7yMKts3Zjs7ku4yr/tR2FA2QqTSWm9ojU3
	nI6HZdCSKK8DmPhbC8XUpQHBeZKZVfl3RLT/s9XN6ur63D1zPOI/YWMRip5LF/Nb7m2wo5zPI3L
	TExYCzxP0bPS+WyugWk4zPRHKkn4grpgVZonx//wstt0iZRp08s/z+PuTP5oprYwdVbjaMc9vrh
	FPNKcIXSS3Kd5sAAmZHOvFOCAgRA6e74F0YDnSJZJjXfexQ6rdJEGZKZjrdaGVoZs2Ftr/qV0k/
	6jWLuiKKhnX6O1lQM6aj2l7rUgEQtjcqN/E89ozQtqgkJ7eSM6/phNrJULLlUmPZUK44DxqLdbL
	MzaiCSSzrsjrfDJHvQtTtKd7z3L1Np+8BoP3Qr3DzW5rcHnpuLhXJ/qDchI8Rqltm/ea0EeAq6u
	moAu4V9vFdnQirVT6H7IQeEIf+gLr8gHaxRO36K2IoBBl4BVAOXdIT38sbXZmN1Oq+FUQYCw==
X-Google-Smtp-Source: AGHT+IGjCOd+4ejNkIaM3IgSSrfNJ+dmBJ/8y2etg+UINkDzARyyHRj4mxQVKfiW2P/glN4METLcKw==
X-Received: by 2002:a17:902:e88c:b0:297:d697:41e with SMTP id d9443c01a7336-2984edaab98mr5869605ad.37.1762889205543;
        Tue, 11 Nov 2025 11:26:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:43 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 3/4] arm64: dts: google: Add dts directory for Google-designed silicon
Date: Tue, 11 Nov 2025 11:22:06 -0800
Message-ID: <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_112646_388749_78173476 
X-CRM114-Status: GOOD (  17.05  )
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

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 6 ++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..f73a247ec61c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10606,6 +10606,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d..044af9a3b45f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -138,6 +138,12 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor chips starting at the
+	  Google Tensor G5.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index b0844404eda1..b4b5023d61d2 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -17,6 +17,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..a6b187e2d631
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-- 
2.51.2.1041.gc1ab5b90ca-goog


