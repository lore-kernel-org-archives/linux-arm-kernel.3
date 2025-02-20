Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4F4C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9SN5Eoig0xDKhvB9KRORQRZL5RX1Z+GyDwaupX8zwI=; b=ZUeq2sV9d8p2QGg2IzXzxmSVMt
	8wDQN5cgI/JVIr6O9FGnTCKpgxHFzMtQdmOgWdkgl3xFiaHt1mXYGTS1ZJ14z50U4umRozo+lZyU9
	OVwsRfQE8rGtoTiyAQSTUGKUw+V9Mka4OvNreNKYXP6sBtko4qoBlYks4fnReQtgw7P0Omc9+LIXp
	Lm2NmAtdl21OuxyFkcuebcKpnspyZjgeN+5TmtEd60Tw3sm+NTmkL9IqMWUqmYGImoZhStv3ynhVC
	4VvYcHeFiTfue1URU9fYUNutBAF2Rnwo554YCL6N1kHvZO12RpCSndAutSmigsw4FtliJbvrHp3Sx
	RQp9WZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5zN-00000000spJ-1Ykf;
	Thu, 20 Feb 2025 12:49:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zj-00000000lgc-2871
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22128b7d587so14387965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054163; x=1740658963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9SN5Eoig0xDKhvB9KRORQRZL5RX1Z+GyDwaupX8zwI=;
        b=jEGFrQOsZMkdCTzul+cL0nEm3TeW3n1YyXusEQvGfqpH/PjvoO2NFyNiygHdIn6S6R
         W1b7vTLpyQnSUasWVh2322bxjftV7WT59WO5YnE50n19xPJd92ovEHOW1tPrabWhCvbJ
         wZrPLoMkMUcageIkQTBMOlsWR3onHSyr7VSR06jNNSPGXBMHvAA9hDlgzIO7YZpI8kZm
         4os0lNuCsq4FgkbBZwFXTubQCB4uyi4f+sPLTXdanFKlPaVj1zRIHqYvB+wPNVstwlM1
         HP3Impy8mXQVF5wRKNPoptbD7VuACWIOoPPDJGDwEyrKRGKi/ohUGtpC3y0XHi5eXnp1
         XxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054163; x=1740658963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9SN5Eoig0xDKhvB9KRORQRZL5RX1Z+GyDwaupX8zwI=;
        b=i3U8a71itmGQF6YsEXQoqhysiRI9W4E+d1NUFH71HqiaxxJ25wkjGZLMznlY9Qs4B7
         LG/+sF4n7QtHRdGIKxdCvOMxBZ6S+k8fEx3K7L2EB0H3XDRavdGbZQHXCzBVlzOLjnFS
         TFQnFMRBr+fdIsmD6cDDfj9alboPt/4yiaW4uEpATSSEnTABXwy1A1htHmXNus4ZKflh
         wyYify9K9RIJbwNPVAKwNZYKWaRhMmZIaOwY4hilTHtIhetwL5EDqHOoC8IbmhqLk4ps
         7Q6VkwgFmcGSpKQhSxuM20aHEYD+q5OD4QnGvDDVI681CAW5Yl6KdgEEVADQKBnd1ZOo
         FxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/w/doBSyUWt1NqKNmn6TvPTGwLnARGfLYa9E2knmeM1GtByyaPbSDiCHkJ+3cBhX4cbRyg4FxaFGXXLqJ78gL@lists.infradead.org
X-Gm-Message-State: AOJu0YysIHqGDd7XIEK9V0odPmkpiddeVzz+r+54vVWvjo3OQDNiki4L
	oX8jRbK/nUbS7kxvwQAJwT7THvHUk8y2WEKJdB7il4KuV9sHalnI
X-Gm-Gg: ASbGncsfN9PEp8EvfyFpjwIRjLkDeLwg6gQXQIkJjpQRMy0WX1HB46VG+c0ppQCyz1K
	sl2Xlup1Y3a+a8OEoh500RDx6rgkiqBjO8iMNtGf3i5sc+Wv4eTY0QaWKImWY1UH4rUVF4CaS2w
	Cg9s9qZe5IS/I/Juf874oP3mg0NKGvYC1+7zu49M6/PY26Hy4mVlR+QOAPZE1zt6sIdg64zkfQH
	yII7/FZsCmCsXMOEfQpIo7m5wUuEd5P16cvsn01CjCU7/EvbcmLs7kQSzLsmNtRZgGUUkKFoLq4
	MQaV0g5bNi0zmzm77A==
X-Google-Smtp-Source: AGHT+IFxQ4Ivq08K8LrxIkk5hOu/VGJU5dDZWvlSYladnojjeQ5WKVi4wfPpJBQPRW5j1JaNBUrmfw==
X-Received: by 2002:a05:6a00:1405:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-7329de89652mr10240013b3a.13.1740054162588;
        Thu, 20 Feb 2025 04:22:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:47 +0800
Subject: [PATCH 6/9] arm64: dts: apple: t8010: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-6-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Dfmhksd4L1Rm6h/PJVjQgqmA7UT/Za+zMY19qrFBfHE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+wn0P0SXuQNu2JS2xVr8rjG8vCoLlcQzwi
 opsrQdgCAWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JEL4EACAPtlVi56MJnkSWjiiuqtsp4bsgyC2CktAZL/zOwsaKSd2Dn90xh3+V1FfNcE5TYiQAQF
 yiA+2GxSaYsRXwLtppeOcOy7c4kRz786SjO0P0IVCCvZdSH2M5v1p5E0qV2i/FYCjUFrKoEdu6p
 VqHZ7kyEkGYsP/kC3k8IjyTX/qGkbY9rADnqCTkbhsVXIPXxqh5g2H62JHzGBzre6Z+K4A2HwWX
 oDNeff1Ii1L/VKU6OUrWw3v0K7TLsTM5Y/4oEumBJIhQ52csRqK1RJRBVCQgOga1sU392gi8gJr
 CbqEOhJn6lJwWPEvfktgbcJZ0Gjl/CqokvZS5/1R2b6Q3MqWV8A26pX6L8sB0WqePolyLE10f+f
 brZvtDdDkpKWZjP5UiksQarH+u1XHUlOn0QHVsviZss08665e6Jro5RNqzwOJTgVKpbwcpGoJdu
 GEEJ4zH/MUWOWf6wt/iTN4aHb8Ut6T2cBwFA1ZB1JAxut6guaBAOou+KcjcB8FHw54ho9XvkPUQ
 a3WKAzu5ZuzLRu6kc8wOny/DtET/ytishoRxnhn9QuHqh1SRHkLWyTeJZAL6jgaSlQXCFr0xh9O
 6H7FrEKfXjcOVUbq+aKNPitMObxHRsG9GIIwnfpM50orSS7+WptaB6olYcmA+J5Pxn8YBofQY6h
 KMQ044wHohMUA/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042243_547923_553581B3 
X-CRM114-Status: GOOD (  10.92  )
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

Add information about CPU caches in the P-cluster of Apple A10 SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..5d24da52cf255b6ad211d2ac40aad75a6194d595 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x300000>; /* P-cluster */
 		};
 	};
 

-- 
2.48.1


