Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ush7CURThlYuZwLUlg+NY49Bwo1vYDShrEN3JXm0200=; b=RXRpSE0tRP4gU7NTlMU67pa5Dp
	3YNHnqKUryIK0xaTJmP717RazDTEUNKvRwGeAWy0YVHU5ppx3HRKdZpZ8kycjbvSnWe74eF9Jbiue
	iWpm7pgoYAONVt4KS/c8pt8Gt4a2V5pKy1e+d2P9Kit7037fGpTKjFuceTSssea8HKYC+T9co83Wg
	cWzbBvXc9A5Fiu3tvTW97B0z4/ulEdcdW5fmW/29yi5Li68V3kFpOowPyQq+HMoqDBxfzzofeZyIx
	zl7b2ed9zSzFdlOniB6qPuIji03yWMHZ8qhbWEQR69STXzgZqQXMqZPDgeC1hZVCqVTU6deNjZhgP
	qM+DcH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybSF-0000000FQg4-3nhP;
	Sat, 29 Mar 2025 19:02:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybOp-0000000FPxM-26lC;
	Sat, 29 Mar 2025 18:59:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac25d2b2354so523265866b.1;
        Sat, 29 Mar 2025 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274758; x=1743879558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ush7CURThlYuZwLUlg+NY49Bwo1vYDShrEN3JXm0200=;
        b=T7wyTQHIhb1gxO/iSjz7+CjSDXk3srkLU34lpmC+bjCwctwZGZGJisiEZ8txov3scn
         AjUmVfj9ETWgvxJth5i0lPBHKuWJw0RuEnSiHpEt1KpIyLut5pnAd59fxwsd5b4kFKAX
         dBCK/l7W0t8aoIOGHhPLS8fcMdOxaXTelJXYb01ge3Yni1oIc7gnVIW+qCGqqrhPv3Nv
         BZYfeZLfkpGhCjIsL/TVaRNpY/Yr5hNz0es1yWZ/bM8RBK6nUwv2wsW4x7VJryizygZf
         J3cF7XZqWKkCsyWJXGg135JGjyo/XJBvKTOGQd3HlArGkSYqwVYt66uJJ/wk4gPc26Ku
         viJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274758; x=1743879558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ush7CURThlYuZwLUlg+NY49Bwo1vYDShrEN3JXm0200=;
        b=NOG5oqYxlwX+4zzqc7FGSEZW+LzPJqklGXNYElICfjFbiMlCvM4wmwL/CX7gzK+PJM
         q6fAX53mZie0iWXl2sthQtwtBkfEL7xSLn2ZNcUGDOkX73AHaegzgjYNanOcnpJ4g5J7
         /DR3BW7GBHtKEBgiZktWzBlweHa3IQ8dJCKTMk0YenCatEKY8tavMSs4In5SQGqABS0e
         nzkO7Kf0woEwP3aj9Mn/2c750jSaWv3me7SqTKXKjbZCU+xuGMXq3BiQO8I5I2tT0Foq
         WBqSNqxg8+Kplee5KtGMoW0xEYLqWr5LIIusQ7FZggP7A42WEjLBeR0CpXY+yRbnrU9L
         LfqQ==
X-Gm-Message-State: AOJu0YyDh/z1ptCBYP8LIzx52Yi+djwFUGQwF6Kz7/3cFcYR6ZczB4Jc
	5oBFSvB9QwScAmS35WiG+WbhzNGMRLe3hGSmURs1+mBjP+BuSI2lJ8qL5w==
X-Gm-Gg: ASbGncuaUuF3jbMQ+ebzkMSsIZCwh2W+FdWrlRwifpNuBVjdGC6uFSSkCpAG8svjXoN
	xUpFWkl7Vw+yexvCRrk4efTvSr5U3V9UBIYAKEnuuswBNAn/K6CJQ8k32zivjV720bo0ej4ayPU
	udTTOBAt5H+8yM4rFyAxoZVGCFqikSQUeHQUZ2B8tZanuY2b0vCe+vN+halBUObNjOvgtr8n6f6
	JIVANjR8uoK55exCHYEudrjWv8AVrehxkqMB87VNppFsmORrRCAFoHEyogveKbB767WkXW1AR0B
	FFp7fjQdtPDLm/LusPLL+Q1g0uBsrGglvLB4v9nZ/YbTkueMBbi38YECrfynyedyteyT3DS4R/E
	1ibxnBUW7DgUWcFxFsJt8FGVVvBakXIh56+fIidqDGjAXvkOLndx+Opi2hCn9fsIQZgat20KBsT
	kMDjA3
X-Google-Smtp-Source: AGHT+IEXb3J1hhW+1cZ1cYh8Q+cmXWkp3blDzIk1DGjEmxuRwDiL3dqD3dHsbMWJI2zigPWKrKeiQw==
X-Received: by 2002:a17:907:9693:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-ac73895f8b0mr304556366b.8.1743274757593;
        Sat, 29 Mar 2025 11:59:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/7] ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:49 +0100
Message-ID: <20250329185855.854186-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115919_539416_1D458D08 
X-CRM114-Status: GOOD (  14.05  )
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

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 847f7b1f1e96..7fe0c7d3ee6e 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -398,7 +398,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -567,7 +567,7 @@ mux {
 				groups = "uart_tx_a1",
 				       "uart_rx_a1";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0


