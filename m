Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2796C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTteZauPNy6vSlRahT0l3anygq+qMXyNmxkONLZYlOk=; b=iqZaXi8RK3XLPKnR0YMkCqJJIv
	u1spkVSvhmM0WvM3DswaWREpQupZYYdoBaQJdCdmTX3u5DQz48dDfrD0heYzQppTDU2bOeyzHn801
	WWkMGY4iivLod90NhKkmtWbgMXSPh4adjvJP0Dj2TPrHtR7m0QD18jADIA+qaIy636EZTjZE9cHTX
	nFZrlo0q4uKIm+NTa55nSWCBs9u6KoTQWXodd02mH2nTfKxhR04JQWxUfSlf1g1CddsEblJ/tBz/I
	+Tw8ZSArYy84n6Tim5c04lXSuPv+S0M/ITpgrbTSjBTvyRoLwMqoba2hNrNN5DdqQaOS6kH5+d6ap
	+GugdfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5tW-00000000rSa-2zD0;
	Thu, 20 Feb 2025 12:43:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5ZY-00000000lZz-2nBS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220c8eb195aso16441295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054152; x=1740658952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTteZauPNy6vSlRahT0l3anygq+qMXyNmxkONLZYlOk=;
        b=AHl1FKM4XnUIkR4hN8ptceDkhFxR2nD7ShAse7e4HO7sEM+cVBYX46TC60VMiDpSic
         gzpu/FiLtmTQuD2R6/whMrN5iGYDXa2REtGQwQ7u9Yp3JV9FbpBIuvYgPNo+acD6yDKB
         0h/+s2eeo6dgGn+BAKw9owAnH7T5Dqe1of4Qovrm6eKuimIUGaFCL/BE1yhN7EEZipqd
         EPEOJ/zSbRk8fHIYzVk+icMkHucTgnDTlfsdWq8MLaZbDLTnWj+fdw8zd96RAYfxyxPO
         hY4ttr76wTWjMxmeybJNeMswvTvsqsaZQbNaqCLlNm9jdA9nNRBDaHd7AgmrLcez0Taj
         2n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054152; x=1740658952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTteZauPNy6vSlRahT0l3anygq+qMXyNmxkONLZYlOk=;
        b=je8rbAzpGVuNCC6vc53CxQinaFr9aWDCPrhlDu1MU9OFSSqQy3M7beRxYAb/YuVYkJ
         5trA/RpvzJPI4pnwT8L9OhywJ7aGmIK47sdMF4niMzOv0EiR1r/eU+4McxfmGq/Hf3LG
         A+zkHL04Al6uWq7mjtJkytxGadXcAI+jVjGhKjBTyLtgxv3PDMhwYcF2S/Usn2AEz1eH
         3JD+Q4SH3tdQGwX6wEKvBjfGzzrthWRPBf0A9436OqPJByxDDkEWuOp6KHivPh61Ds82
         xGRsjq0hj5UblIVCbZGe3d3bS9lScuCV+D78K+Wgz2KaDrWYoZppFXz9X2IZN+MFXjud
         P4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjz1BzBYCTMqaOatdsFVqA1fERU0siWgsarVWpUT/2aBu6PT6ZQTDGdqA/lzlpsuvrUs/JweYuIOymP3BL9GJE@lists.infradead.org
X-Gm-Message-State: AOJu0YygOwe9D5lxqVVUdLBMRJs+weUZNfWc+lU1pNVsBxqsx9TtGRE1
	DAMPAoZOCWWI9/01l2QU6RfFFCd4Du+ZFuqZThkjJZiMdZZAM2Zh
X-Gm-Gg: ASbGncsxkttW0gzcizlukabbJ7dPa292qmfqYbEA6+bJJAdiXmLXq9dQ4HeUtwduFWc
	UT0+SfM8ZZyGX138xzsrG72oSGWCxyx0hPtMumMbC7jKtsX6mkTdsZBkPPsnZFvdHwYnKwL0K4a
	3iST45+YZoNN7a+InsREmgN++m7sXvn3CrV4chCH5xT5Bfv9KZdgUUXi7nk+9G/nkRSaJtihcSU
	/wlNsm8f78qrfPmgi/KvjgyfL3nGz8ozKt8ttlD0XXYEFVZ4i9L5sqRRgr2sbupyFPcfoEhFrZI
	0uF/ZO8IaurJVsHaJA==
X-Google-Smtp-Source: AGHT+IHbidj5ZO18Td1QTyEmiRAdi45GlrXUu2QGtSYq+K2SCUDB/E/xSTypUJeAm5+h+BQ1uKj1Zg==
X-Received: by 2002:a05:6a00:3d0d:b0:730:9a85:c940 with SMTP id d2e1a72fcca58-7329df59b5fmr13027683b3a.20.1740054151736;
        Thu, 20 Feb 2025 04:22:31 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:31 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:43 +0800
Subject: [PATCH 2/9] arm64: dts: apple: t7000: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-2-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZoFAboTTORCIiwfMRZBtk/4gIxbXbV5LowBP1mj/Ne0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+LCgvVTDgoUd0iBlRyUgpGAbBux2045I4f
 yesRBGCmreJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JEF9D/kBf5LvSkslGuNWkshtevt+gtvr6PpA6VRTGq61xc8YW2hC1gZJ+Rn4wjN2tLU0eCAFZpz
 WO98sKNPxSTADYzQFT14pDlMM9lx50sXJcmES2LUOJQ6UOkE9daYhheIS1kC5L++RNy6E6IUZB2
 /JqxIUtYiJGjneJU4c2jrViqdEzIG2sgctmLjGoxoIjsh59sW3ZO5Q4Tawn92HakkLIW+rYOuE2
 sqWCs9IQlDssCcZ6LCAWKQbGo0CajB/axd4mfDrax7vwM6bZD8H9p6oIjEL9GgZv8bO98O9Z3bd
 /dmqLiDZzYxRDqvifYw596GiSPbo8T8bqkO/mkwIUmwGlx3rzDV3p8kjQzi2MeANS3dYF0jatR4
 BmCepz1bTt1gjVq+v2AZW8xx/OgpeoWlDRV1R+7azeqdqMZhc9ICHaYWepQKqDVGfvxJhN3BFMK
 I53O8lpFOf29VsO70pKUZLDhTAZrWjeQBqqxoRQL6QDBmIHnLXkopzos9VczWwLTFpgGezRturI
 k5l3fPHGzbm6aa71sIQIW3m+EbylfAtqO14xw2c+PH5S38fI5BWi9NOqgqh3vwIR0bbcmOBPnB9
 rm8oecdlwZ96L8wpnm4M+4RXVI7guU0mX2L1YjkEzyd0wiFSLCD1LklfeeOvWAnNfO8Tm/MtLuC
 6eRDePdEEAEhWRA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042232_707531_5BAB59DD 
X-CRM114-Status: GOOD (  10.07  )
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

Add information about CPU caches in Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..229ebd78c9d14609c30cdd011d1ec59847c846f8 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -37,6 +37,9 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -47,6 +50,16 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
 		};
 	};
 

-- 
2.48.1


