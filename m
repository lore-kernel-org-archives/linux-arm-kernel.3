Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD35C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06j6RtBWf/SB9XKP5erUkzRtmNKED/ygWJtIdZVtIY8=; b=gJaFFfQkUGsVKts+RkNjhAuSib
	sYA73tyhIFd++JhYpC3xIWYE0rmMadCY31z/6/Y1zxOT4hAoN8N29JqG7BkBZqWqagummpwuGxlc2
	Mq6ghYEjHvWpklqk+vgSeqm3GSYXFI0VqAgypyMArL0Gcbd9sPodbZTlQ84cRpc3qwQnwdzsRNbDY
	+iD7o2fyebT7BIVzkvxn9F40vkG1VQNWuhNe5R6XnPfA3XY6TLUo/NfmxAPvQyTBEthHJBDwr7M/w
	gJ5RbMnSRwhNbGj1EswwT7Rn3iLfEDO7ap+M6AY8uiCbkNr3WCzLYAN43GediADjJ5fldLAgdT01X
	A5Kemobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl60q-00000000tGJ-0KNm;
	Thu, 20 Feb 2025 12:50:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zm-00000000lhs-1HWa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220d39a5627so12217675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054165; x=1740658965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06j6RtBWf/SB9XKP5erUkzRtmNKED/ygWJtIdZVtIY8=;
        b=Z+AF6qLBkjls/UdP5Bc4HdIO9rXrXvM1SXYG/zPj/LKaXU6P6NjISHkKoUUydZ0lzA
         e6EFMIfsLQgELNBYxxSmX4+FoUdlLtaCe00PsTqv8m6SBhbALcoqijcVtz9MIsHv6F4m
         u8AIgeirwerc+s8hhFgv3hQgKdlaX0IBhrCigaWrZ7e1mrNTOrTSTe53HcOebo2JBRAB
         Ur1lLKsgL6y4R9rjCq2gzsGs22ojqU15+bTvQlVckyJAw93LWsAzq8Z6jB2MehyQU9pV
         qvN3qAPeXPKfx7KxgbQwYzJjL4KZq+y1BCBZfLXwCs7Fk41f28e6dp93TZydEoNQCB/R
         ftCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054165; x=1740658965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06j6RtBWf/SB9XKP5erUkzRtmNKED/ygWJtIdZVtIY8=;
        b=EG7w1U4vRIC4BIy1r2JT6WIjnCvy0WJdLHuS62FJpn5M5tTQw9S4P4AYJ2SzjITpxK
         dxXn5X/UnoKZ7SPRGdnoDgto/bOK/iBulT3Ml/tGfQqtdGcOL3jYRdSoH4pFL2Pb0p1D
         0/B5oPg/EUpMK1QoYDEAO8rAdvlbyzcOTc/OHjwAubEZuk33tTM0XqZX48rERNntLk1N
         0u49HT93oqsDOk9T6xM2Wn+TgvhdsBOMKIVr8D7xAl/1jNDaW0JJAOyXf656J2+7enTR
         gf1BzvWBUNc7sghsXUDPggTM1SNu/zNbP3joVH81p6XTXE9yyHs1cmJ5LetNIhE3D1qS
         lfXw==
X-Forwarded-Encrypted: i=1; AJvYcCVAT/iBPUnuhFMbf64seG/MslavCmSek0/Gn7Ak9WzNMto/f8SIcuSH4NM8nI9Nt69cGAcVdoh7k/zmPAPoJSpr@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTPpMiBApIuVuT9pVuOa4PnbkY7G86bkif8/Sbu3i+JFUOUe3
	22GG1+GZ8dI/215u5tva2gW28f/xbG47EJwhwGCv8FMs6K4eUxvN
X-Gm-Gg: ASbGncswlVew+DoarIPEg4JCV7oQ5OylAcHkp+2eXg14AtS6/xx56Oq64FBFNxTwu6a
	GenNaYWo/M3EdUf86ADNf60e/0dnNSBEv/M1THoFYl8fjNelUWBP7qgikc+4F4H6+cYZ5cQWKCf
	yMC5k/YytOmaMSwX4wkTJ+HkuKl1oJYhYVkXpAaSbMRiHcWrbXN0w4YT6G0L9GOj+ZkmjJTIvvj
	VLAT6ECmnE305LH3C31R6gI0IiIYntHHeOuBriYzB+CbO1p1djoR24CStW2550xllsRgMJlATyH
	mWXqV5thl41+KY/djg==
X-Google-Smtp-Source: AGHT+IHX6zQc8fZnaNaePdFLlfV/v0LorrLqzr3llooSCuG/RxxUTULc9mi7JINEeUMKLM90DGF+1w==
X-Received: by 2002:a05:6a00:190e:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-73417248c3emr3713491b3a.4.1740054165339;
        Thu, 20 Feb 2025 04:22:45 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:48 +0800
Subject: [PATCH 7/9] arm64: dts: apple: t8011: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-7-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=zI2mU3THGBI/qZwjr8HPXhOqtbnEjJ7My15CsvuB0w8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/AKj5vauHYhz3DfFfIX2pH9PD+H337k4Uk
 5uSEa5+wZqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JLuhD/wM4qvX5zEl3VWs0aFrwG2bhjCQ4fsHzRIbMX4t/QUJiSFPMj4aZzuijF356s9GNDgoDKn
 EZ5g9VoT8Dg+98rBT6uqeHXj2L6bHTcyTiy9t4xY/NhaGE4ypIyshyoNL7DiUsC6fy1YGWi5rcV
 McmYeWDyZo5ViKj7VYF30kYsHNSUTArkp7AdtInWMs5AKNbryuLtLsqDAQhDxVV7r5/IKlDHWB7
 7502iVR24IfrXOjvIhvCn07cvdTVFMXOtXWTkO8KwI7BagcMRBp+R5mSjvD5n3kadAe1KM5CoZk
 LdlYuMnzi2WEJ2SD8ITlgPNpmxbRMGtn6UDc7zAUn0WehYWBKImzKTbfha7a5140/utSUhgl9Zp
 ctahKcWyNgZcP2i15R6XNk+K98qnNc6Fq+QGlv0g4RsgLyQPPZt7WGdgMxTuNiRxkYvlkLt8r4m
 JiNtxJ2Tiy24xVvz00Av9kuXL5prj87h0s+4jqVB6ipQYpbyK/PlgfISQwBkZmxB1n1pYktm8Ck
 K1/1xOEE+YEDxlu/nDUXDQwjsi/KMePbGRLq31s8deKjKMxTm+zYyCyQbpFVj9DEh/2XoUXVo3k
 1xwujG1l5vIIYbNrqcVuuqRLTs0pBohjQbv0NPnsJad4wv/9+zN1NwWxsAZsfj4MeK1pF4xY6Ob
 Q7UxJoG4IhI/Q5Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042246_346217_39B6B2A8 
X-CRM114-Status: GOOD (  10.46  )
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

Add information about CPU caches in the P-cluster of Apple A10X SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..974f78cc77cfe28d3c26a52a292b643172d8f5bd 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,9 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu2: cpu@2 {
@@ -56,6 +62,16 @@ cpu2: cpu@2 {
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
+			cache-size = <0x800000>; /* P-cluster */
 		};
 	};
 

-- 
2.48.1


