Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D99C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKkfbO1BiF+QlXbqBxEEyljYmITDjKlUPtvMrkXYk1M=; b=Y5fzrm5soOGOyOm1XtPMSyLGsW
	zyFFvs/Q1i+y2er/xuf3ClD26oujnN3yWEhBDU/xf7qm9tNZe8ddwjNY8P5n5BFra3UPzPObwVQpo
	+Ck4SedI9bPBgfCWjn/fcavwMC9cvJoY4Ly3KrAsilMgfyM8058cmt2u6THEAAIGxsQxdFiPGiim/
	5Eo9m2XI2NIQGpU5dSh5iClgbGzyY05Fpk2FmEYUtyY8OGnBAIKtiQERj6s3QGztArR47dyY7GBrI
	Gqf56RzHD7Y9RbSZY1lIfLGtsF4Qj0AWXqedHfXRgA0JEu6o6Om2rK+QlhXWoMc7snE37qe+o/1pY
	syIhhGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybVf-0000000FQyu-0tYD;
	Sat, 29 Mar 2025 19:06:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybOv-0000000FPyr-34FU;
	Sat, 29 Mar 2025 18:59:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso489574966b.1;
        Sat, 29 Mar 2025 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274764; x=1743879564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKkfbO1BiF+QlXbqBxEEyljYmITDjKlUPtvMrkXYk1M=;
        b=Ti3rPXa0cNjKtf403FNHQGOa1qs+UGkbkbpus5MJv0qdacD3cD4vk/+B+I0XENoDpk
         HmnyLodziUmi29Unqon26kF6CNrUXwVPpyM017zmO9xPWYni/7IiGmk70FHIWm3QcNC+
         86NMqHqXPlC8QJRBB4BRiVZylSjp6iYc5DqOlXwj/pXenF4EbMVL/imuA2n7mgcKJnQd
         5GnUhGcU1ecSQGwF8h1yzIiSVD2Izt3OM96zp3jVQZOQVOtKIxFSwxNeKMzjsqC4XI7B
         Zvso0pKLwVPBpQ0mOMEt0iC5Nkkhs1AWOYX1MmNx+xWTkRln1ztxYRjhEuEfIq+K121s
         lVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274764; x=1743879564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKkfbO1BiF+QlXbqBxEEyljYmITDjKlUPtvMrkXYk1M=;
        b=krPZMjSpkn68O47191nvgtUkGn0j2tNnoDPVZJ0041rIZ9wiRjJHBFdYBGlFJJySUb
         r7cHazi5q2foBRsYPqQV4JL029LffzLR+TPhDtCIBoe0cvQvlxhvIomnRff0x4DslbMx
         eSenKAKRLA+WDnJxJdXyJ5vA8vwnej0FMWG3OZ/puHu+p0ggMqttSeD6uKPK+lVpTQa0
         uopZEalQ0Br8voHG5ZYpiPKiTSRF2UMmEAcnpDlhhFTBbXq/FizS9F10aZ8b9mPupShM
         7rTGzqeSYAPEwTWJFfC0SQHMlW5jHcolwyc0BUCNV5wxfo1o0unChC4wrD35wBH5ge2S
         xPmw==
X-Gm-Message-State: AOJu0Yzaka5fVow2uoJC8oWPw9Q49WCWXEDaTfq4pGEkdWNHmgeJeLHR
	MqdXnAu1trugVP1ABog9ZyVaFjSqRCrL4fzbOKQC3MX4teejrlGd+zGAKA==
X-Gm-Gg: ASbGncusMpPEkM1mNO6HSjoDkZCDCw4Og4hmDGwIoLjp2iyS5UiMIO7U/h/AA9TqXLt
	cERK06CJ7f0QRQuOrg7Mv4/vXJwRD4GRh2t3l12iJ6mSV7j0+8Vzp9a5mn5zqRyOSwptsBhSRpK
	ffbINMXiZsbHUFAEtRWXgZuoM6rlLPPsXYJ+lt2/+Fn8WqWRd2StmWqAnEbFE1tImh7oWcFPSsw
	4mFR71GnWS+S4q9dX8AtbphGRPBoCBIaAdDOqFnTWpnIm0SFpCQIzxfD67GfYlGKzr3hbMdb6NU
	sL2PxxnqZs1chi3NLM2CDw4Oh4aswvm0Q7vDrBzgdaOBic8ROslEDoLL71jKSGUkIvo9RY4Z/c+
	7pljNJbwwXkB3u57MSwHtFKW5pU2k0AZaXkPUO9oeGItKvOQGCrq4kY7NGml1NE+kiw21/lu0Gz
	Hnt8Ok
X-Google-Smtp-Source: AGHT+IE5q4K7Ef6k7rcJl7ZBvAtJqJkvDsSBkJ2ZbFVfGwP8BH9jLRx/9uvMrwpU0vICOl+FUBSWnQ==
X-Received: by 2002:a17:907:7d8c:b0:ac3:8790:ce75 with SMTP id a640c23a62f3a-ac7389ea3a2mr289697566b.10.1743274763406;
        Sat, 29 Mar 2025 11:59:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:22 -0700 (PDT)
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
Subject: [PATCH 3/7] arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:51 +0100
Message-ID: <20250329185855.854186-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115925_768065_3AEF88F6 
X-CRM114-Status: GOOD (  13.65  )
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
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 8ebce7114a60..c4a9f855e5de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -105,7 +105,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -122,7 +122,7 @@ uart_ao_b_pins: uart_ao_b {
 			mux {
 				groups = "uart_tx_ao_b", "uart_rx_ao_b";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -520,7 +520,7 @@ mux {
 				groups = "uart_tx_a",
 				       "uart_rx_a";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -538,7 +538,7 @@ mux {
 				groups = "uart_tx_b",
 				       "uart_rx_b";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -556,7 +556,7 @@ mux {
 				groups = "uart_tx_c",
 				       "uart_rx_c";
 				function = "uart_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0


