Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=; b=1KbZ5OeA+IOGIyNA898Dz3UlM4
	n5SWg7Ah5gCWMBKX+2MJlaKpFGeMQ7zX6foyr4fxxoXXoNjbYz1ZDXh8OXtAohxrhEA0Kqv6lwIqx
	dopWoNU32v1oYGf7+p4gQUy4YywufGNEW8cpJcjrzgd1JLEgtUGbPfRPBiPYkh3NzOt8v2eZNUqBk
	QsYE60vjnT1c9xKeX6bMiDDORbXH6lO5Mb8XHXqf6nvfyx/RU85chM7ssnAR0fTY2aWGtSrezN27o
	6uNjXdNr2XiUXsttJcVbBUDTUgIND58RCsXy3G8ScqFrQQuZ5vtdvSQGw+lhhw99JqyeNJoDpraQ0
	ZgOgV9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpxo-00000000wLR-2ehv;
	Fri, 17 Jan 2025 17:16:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpr6-00000000uWy-13fL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:10:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so4708038a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133798; x=1737738598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=rwN/PWe1/AQVXFFtbNZ2n5th869IGTqxwexSqeO0Tvq/tFrjXJEod5/eCI+KAM34eL
         g+QwfWK9+vg1UmPSlnnL+R97eCmg9yKgWnbA4YnLzN8RpILSmKbU1n77RctZJTF1JoF+
         C5XnWD5nBvnJLz4o9Lxa7CyO6rpNpzKkU4+95couGFprr6EAMXzCVp+c9h4xwDdSW1Y3
         SGTIRnZ67MsWwzw3KaYM2l0tJGIyVwWNKzVtzrU/urGhgppdcJgcz41r24AvOgmfV99o
         LTl5hLvcJdne8q+eA09m2H8h6YWkkq4hdqZ7RGMZvg/Puw15hX8aSweKtaGpR4kwHpcK
         wVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133798; x=1737738598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=uzD6hN8zVl6w/oI6uWF+mLA1FxSYbmrGOmuuAiABP062DChr0nqd8mB4BeI08dprEB
         ldrlehHYLhY7Pl3Tu1RAAot4gFLZ7xpTOYLrUmzEloDfCCDWMUb1FtsM/FpCimJ+XQbZ
         +gJZ8GX8cBuEVv5vBhDfMOM/5U+ZhMCWx6DTBlVP1wi56rAgUXuK/YIX6dlqc6pBc2fo
         vLT8+VPhtpFN+pXpo9escTwx4Dnz7SmGsgKABHtoFJnK5neMCjR6VoUcuj6GtTNEzsZ1
         Sucq3wzQrM3JKQoXDBwOTYmpc7O5xGbMWzBy3sspZO9xGtCgu1e+pbvdWm7VWUZS+Pmx
         qzrA==
X-Forwarded-Encrypted: i=1; AJvYcCWZceR+xycZHPZnoP8bNs9haeUww+FSa3ePhIDam8wDBxQKv7PF2xH1ngrsP90FEdlFyThK0+HTKHCQEUWE+QuX@lists.infradead.org
X-Gm-Message-State: AOJu0YxAwfX0lZ32pNcaaEf698UcEXNGFi/3OB9oj9pE4IS66WL+RTTa
	BKtxUd1HX/g3SSE90y5qjJfcDo29YRuRikH69bkj9Xzd4Dlr3LhJm8F1QrEBA/4=
X-Gm-Gg: ASbGncvwXTkwpQocKtK90KMTSVcC9VySnogMUoeGEehL8CGqnMG1Q++Q2rBgNljbFy3
	HU8hhL4kQVddV3kAIsdZ2zl6CyCh9xvQiS7Nt8bdlz2XSDGCEGlJ2gZv1u2es1c9rgsvc7j9y2u
	h/SYWGvxR+AQkAjMLTg4hmj3sqQBoQODBhfZ9T0qItIu1ZG9cdUNP7XnLOZONXBQDiNrPl0/SfB
	WHDAyi495IcDCQQ1Ku7FTM3z8UgnK2EFz9vsnIUnzsao2r69klKuxrvjw0kA+04EV7DDlrjuXHV
	itypYAsFB05r3R1XiFSLC7lH0dAKmz1RTFxa8EVy
X-Google-Smtp-Source: AGHT+IHFyQYdgqGM488OpiNHw7vcW4pRUxUqyprfrU9ASQpRrjBWSc8OuKo4zMQb49X3a2Y83Biqaw==
X-Received: by 2002:a17:907:7296:b0:ab3:4c32:aa6c with SMTP id a640c23a62f3a-ab38b10cfa4mr328196666b.20.1737133798469;
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:55 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
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
X-CRM114-CacheID: sfid-20250117_091000_292835_13EF4AA5 
X-CRM114-Status: GOOD (  11.77  )
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

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- replace property 'reg' with 'memory-region' and related properties to
  reduce churn in preparation for Pixel 6Pro support
- drop tags due to that
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index e58881c61d53..d3dd411c9bd0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -26,6 +26,16 @@ chosen {
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -69,6 +79,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

-- 
2.48.0.rc2.279.g1de40edade-goog


