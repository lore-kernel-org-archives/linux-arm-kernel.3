Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE2FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnIvJ5GkQdTsudX8kCSNJ/vtno+O1kFQRgoOLI7QT+E=; b=if0qoRVVGFkEqxDaQac6IDZgIz
	1fkvDdsB3uo9/z1WjLQLWZs4XN1Gf7Gx5ivyQpVV3CGLDQSu3qE4hn3Vukjm2JLXHdHWn0rcRk1vM
	DKf9hnj5uBf0C5co4Qb3cHWbbh7KVcd+vWEIRItn6F9mJbgWrSWLez75Simjai00DG+WlpuLPWOjk
	oTum0uBWHAGBuMK9SuPbV1zzIm6QbJefwvZH8Mgdvo5jVr2iqqqAirv3A3n4ihYfZE3ssnIbqhcWK
	tx9r2eBY31fusAfe9wFuxN+pq5XtpB8Ykto47ydjhJmFrk9AhOvOoP/hwWbcd0uMDXpAxXqGeJpsu
	WPIG/jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybTx-0000000FQpK-45Zc;
	Sat, 29 Mar 2025 19:04:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybOt-0000000FPyB-3IxM;
	Sat, 29 Mar 2025 18:59:24 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so581125866b.3;
        Sat, 29 Mar 2025 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274762; x=1743879562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnIvJ5GkQdTsudX8kCSNJ/vtno+O1kFQRgoOLI7QT+E=;
        b=RR+YJ1dExpwMVhPcZQohXNiBg69XC8yGvJ6BED4dLVTFbxyqwX1SyS1yVqQ7vubh+X
         Juyi2XcPj8DfC53AQaFdh0RZ0DWVPimb4t6LQYy0rsVBZ0JKCvkJ8m+EpNFzwS6CH/OF
         N1gEDyBZA4UUTZsecsuG/avf9GBdkkTRt647z88nH+LvewR2nc7tRmafB7w0RT8uW5Fz
         cGYx6H0LrdXb2UCWeCG9LCZ1F46pQ3kFiPPVZbYPGeKNf+Egc2IKfVRAIBg1y2MS09TA
         Ut59nvRrHy5+tKasuo30qD4kDoDtCHBfw5fI6nwTMRjRq+kvg7q0yklN6Y9zRO5jsZt7
         vQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274762; x=1743879562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnIvJ5GkQdTsudX8kCSNJ/vtno+O1kFQRgoOLI7QT+E=;
        b=GIeakpND8T0QcQamArfPuY5FdI8HWABmoLsbMukH+XWYtCyjAe3xBmsqeiXJNlqrI6
         k8bEIcUioVzkDTZM5m63NH3LtST4b63UWvh0O/0pEwbi4Q2cHnAhRO6hgOd5hQYB0d+u
         eUs8UOgYtJF+TAlLj5XkAhLLXWsKck+GOA3ooXT7mUUIQJHnyOqgQre9b0zmmcHsttZm
         U7V5oF8AaoGSmH0ByWNe/Ot0tUvy24If3hWcFsjTZggC5nq9Rps7r6NL5wbkXibeqLoa
         f50L5Y2AbXjqsU/8AV4vbfzFw/jAoM6zViD9D9oYmObTgMdsLdKjEmV0jJqN0BfRjFDA
         mXjg==
X-Gm-Message-State: AOJu0YxJCI4bQcYVKMy0L4X5Pg8AZei2Up84tEogCctm05kmPRyYwjaM
	h+ErZFnlp53cXQMvHAK0k+h1nk7x716ZqIf6xL3IO9Au1GyKScQbF7VUTA==
X-Gm-Gg: ASbGncvIxNuJx67kA/AuLXVM7LUTVf0CTVGQO2DZLA58S292K/9PqWaZq/WIqcKv/8r
	IEQyupwOZ32uEBwlR0Rz9ABHyvgsGuwBMKygmPw+hsUyECofRareL2QmsdzW9PigzSqVwr5qW5O
	/a5wnt8G1WZiL61N05fHPUYII7JYs3jnyYmy+IZxjZbnCxUesc6c88P2mpEkU9d1z9OXuofUSk5
	tfiEmIiHGpNJVr/9nfiU1FKRk+6gZJ5GRsLYW+2WL4b1gc3OU1GcthyXEAinrEaK/jPhIS04Wy/
	eEFXzc38QaLjTl0kEjZFD900ouE6Ml3jPINq7qlKC6EVP1Mhu3Uj4rfbphrLGkuHdP8AsE9/3aF
	XgIsC2KScH1AmULk0N1lovMuKFnlAcDtQI1EBzJH9+oNR5psoyCaJHC2HMGbb6uFbSEQifg==
X-Google-Smtp-Source: AGHT+IFESawv1sch0Xh3dWQk//nDyTPFLIdKhU+1BsFulW/LDtgKGmqIj+1y+Hbo1pfEDL+B/1he2g==
X-Received: by 2002:a17:907:868e:b0:ac3:aff6:817f with SMTP id a640c23a62f3a-ac738a5aa6fmr362758366b.13.1743274761496;
        Sat, 29 Mar 2025 11:59:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:20 -0700 (PDT)
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
Subject: [PATCH 2/7] ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:50 +0100
Message-ID: <20250329185855.854186-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115923_830395_35A263A5 
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
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 0876611ce26a..faf09f77c605 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -368,7 +368,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -521,7 +521,7 @@ mux {
 				groups = "uart_tx_b0",
 				       "uart_rx_b0";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0


