Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DADC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7chlsLty0Lpa7lAJqauh8CHAEbBBaJTQJHxpJ2xXoRo=; b=rXg9rcM6sGm0g/hZJOSIDjoaQE
	erckoEtrHa/a2e2IY9x/NL5Nct4jg4tMQ9NEKLbZFCdFNWEpinRVf0oHes6xhDUUElpO72zeG97ky
	dT3ox7mhSY7Idx/ew5ZDPk1iKrIIgND0IOWWeDyev5Gl9g01EIzL7g2X5SOp56Vc1/M7AYVxF07vz
	iUVucJwQHYv0iPHVyy8g90V9aGFlFuh+aBCcfd/l2RehftFTjQ3VS42ObQ3e+xTdWzwzw5VxkXgqz
	HQCe7hJH3j4ydF7UiLCdmiOIu1GkNYLWeXfjaz9a5SqTinG9VaHMbrOqSZbt+6Cujf6RnPq9eWP7L
	f7W2fHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5xu-00000000sQj-32BY;
	Thu, 20 Feb 2025 12:47:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zg-00000000led-23AF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220c8f38febso15627045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054160; x=1740658960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7chlsLty0Lpa7lAJqauh8CHAEbBBaJTQJHxpJ2xXoRo=;
        b=D+LnbRuhPuPvq75S+o3/TNlwhZLD0KnHc/7rl8qLW5EsmkFmkh1qkcK51I2F76TzJ8
         ztSFdHAGvgsrKgRvU4TunOU7z3x4n8Vpa2i35lDd3TXJd7ihOQv/CMtqsvxpai36N1b1
         a7FewoRXrpNti4WAc00k8fErNPGNFXOeo6Uqq5srTEFYOZ3nSGgYNTlmPVJci392Jxg6
         zYkBBz+/LSgyBJRrUPBtGtHWx71syxK5G6OV1we8J0rwAEq8Jc5miUpzQJjd3RjM1/jY
         mhOtmFhggS5dOVer2NTf1q7OZqaHolVpToDs9XsSyP8VyUeSWtD1WMEDslWjaRC1XB8G
         4yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054160; x=1740658960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7chlsLty0Lpa7lAJqauh8CHAEbBBaJTQJHxpJ2xXoRo=;
        b=t9qUiUL2lwXIk6gGqeFIu5NZY9Lp/Xw0b87I90HKtQY36cbml39nHh7Q5+0EAR6RNH
         +qBNx7GxvYk9LCleU/2fFXvQ+98yfCIOOIr7aq2HooWy89jxtJ55tBxXiDlMnBJ96N+r
         /ZT7GG6UpeU5mQ9D7Zgupu+Pg5QA5beY79rCWrxRsVlc9Fr4TCfnymv6C6YbfijvbOHt
         iaI4Q3dYVXHaiY488MlwhGrXDdBIeMGYC1uJc40HCHbUU/9iO2w5pFlZXamz5j8PJgOQ
         arCu+kWCP7Y2hkCEeefLmv8kJdlnZwPsKRrVdknB27w8tuBu0AZxOowuHE3dUx5dEQY7
         J0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhtzOMfRbWljGcrzWMgOu2JWf2X1nO0+3CSe1WVYR7ogju9tOHo8H150Tu2rtEQ1HRJvZrVCiy5z0vHcPXM+x4@lists.infradead.org
X-Gm-Message-State: AOJu0YyCOHZeHpkq6W6RpnF5TzPPyRG7LiCAiLs6RDshHpuA9+2pHVUK
	BU/Ve7SHz+a5aqfyBaiY/XqdvWxm3Npk13lJ1I0U4wmXfBWKFR7v
X-Gm-Gg: ASbGncs2MGKudxi6xplhl+xT+j2paDqsMNpIAQHkOb1W6ZBS++TggPJbON+o6WRjYNZ
	pQp5sS+s7VCCgl70AyIanY01ojDRxJMiulf/YzdtrbZfAH0jmiXXPJdGlqEcxeatudaEfR/eyDG
	Xz1BXg5U71FV+rIY2WLVGufkcguPqALVkHR3qLF5xMlibTwfx1o6bWouRXWKKC+nXg/AOrhiham
	uznApgMmHqMoMIWopGb/ISeMKeuLSTTWReJWh0/LBOeAmQuCRe7LkNc0x219kZ1kbPqdYGLDOi0
	lY88VruuMi+fUZbOxQ==
X-Google-Smtp-Source: AGHT+IGn28HCvIx9WJAp2s2tdPFeSijrFvqwGRpoloAKTjGl2JNSmwjJVADce8Yn4bnaEnt7kaxqTg==
X-Received: by 2002:a05:6a21:7011:b0:1e1:b60c:5bcf with SMTP id adf61e73a8af0-1eee5d68ba3mr5323432637.32.1740054159908;
        Thu, 20 Feb 2025 04:22:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:46 +0800
Subject: [PATCH 5/9] arm64: dts: apple: s8001: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-5-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iKAQVbN6H8LNJ4L0t5TJAQywaYEBuG3C40azpKpmjE4=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+NPjeURwiNzAzZwx+4KYBipsYXVdqfZo8J
 bphtR8GE3eJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JO22D/49OTwRyfjXN0ZLwJOwuqVuNXrhFrd/9B7/xmgUAgstIWuD72YkGK6u+jBzquNjMxCCBaa
 rofULIp28eH/iRTKp/KwVLZLPR1QvbgMR3wHzb7k+mCfM03uwH8+0Z0cWkoBsEonT5gNI378NWG
 EoNCrFK/318jyMX7qDJm+zAFiQYeQOcMs13xcXvROY4o3kXajsPlBO1o4PklMsatD50v6Zpq5G3
 MpqKprgUxia7SGQZw4N/6B6cTBf7eoPQ1ZYeKJmtL3r6nIxTNMU+S35wQG3rUcXzVGzKaF7rhNi
 TpztKyGuVIvvlRRPLP+MRzptCCKujaLGWFqA3QHsA6bnKjWWCQQJrhVVAq6E/o9UORfe2bY2JiP
 amz4gpRMhLt8YU6qJJAntdHZj+tpeEwDKpN6IUTmuTyck+nlZKJD4GfDBTD5up5/Pfp04CDv7ox
 /bMRH1mX0duXQVtPVWaV9jGfATYfB/mvqSftktheaOm2l+vEJW+1ELqPU6cUkoR6n4Pqi8AT+Yi
 Uo8d3oK6YSMIBX/ykn3+wdQXLGiaROOm1TJrtM1i1tWR5c5j7F7Uyeo2yHsrFKwF/Q6oaED2xZW
 r88pwbxAvHO5/1dUchprQRWGQJWbfmlo8OwuFVOwUyFJFikZOQe2w/zh3VuChlOf/TdgxrKS1AM
 P3eyhYJrjvKfpzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042240_534268_1C635013 
X-CRM114-Status: GOOD (  10.28  )
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

Add information about CPU caches in Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..fee3507658948a9b4db6a185665fdff9f5acc446 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
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
+			cache-size = <0x300000>;
 		};
 	};
 

-- 
2.48.1


