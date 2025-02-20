Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEF2C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12zqbyR053JAU8mkDwPrvzWGvMGsApTV6DX35umkTV0=; b=emKLMlsi86Z6YTlfpx1WNfnMKN
	KazSYnXLwFcJVufUjzfRNArkxwZ3fBVb4w13S20eqP2fwAE2/yc+tBr/jIyhIbKqtCaQa7jYA1ZAV
	gZjwLGJ4d1YkK2sN3j7kHHq9ByZJ+z3V1LtBWuR3yDQW4oH4NzMpbQcWU3treZLwJMROp+lBp4ZTX
	GHrSBO5d+MSkNeuwuorWKUxdSTwZ0bEpvfxAaFN301RymGI47+HrG2Quy8PjhTvCtZTsf7IDEyQXf
	mNb0DShXVh9y5aXvG9kczvPtxunvLjM/zL716iZMZnr+dErl+LiXBS5rkKsDBgt9UyXOxFAcyItYM
	wZZ3m/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl63l-00000000txq-1gVA;
	Thu, 20 Feb 2025 12:53:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zr-00000000lkn-1nxV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22113560c57so15739285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054171; x=1740658971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12zqbyR053JAU8mkDwPrvzWGvMGsApTV6DX35umkTV0=;
        b=VcVOAqfaktthrwn288q/utX2l5nUe1ot0VuBQf91oDHhFIrQZ+BL2DOH8jVOnQJI3D
         1dr0rMoFYSXtS6fyP/W+jeHC9tPrTon3JL0orUudsgZTwf9gIoa0RykbcWK8cnFAZXTo
         +f0GRMk7sJNqFRUZJKqR/jn6ojNvaEkF7CwrOZYqHz0vYSVp90271T3jbnCzJbZz3QT3
         CQbxJAcfM1ygVJ5JzMVet/MEbPR3rtA2GWbg6UupWd6ZUl62BPqzkv7zoT+Slg71gPae
         laiaR3j7tgY7bCbY+eRwy8a9D5lmpCKARX5hkiYeH4MXkT4yhwE5CudeORpx9Ia8l/Y2
         El0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054171; x=1740658971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12zqbyR053JAU8mkDwPrvzWGvMGsApTV6DX35umkTV0=;
        b=J5HiGr1wpo0lnbmk6v+DfhMsbhC1PfKd5DvM/csBlnrWbThEgWJdwy4Spr6YBcob/W
         2eeP0N/d41TiFwVTNv/y7o6uKcQxO4DnCxt1x0bO4h2y2eavQDaMrrUINUI9CtWGnM5o
         +dJ1if/071l/rV6SZiPRRa/Cx0aB5GuT+Utvw32u/xFfKuxFswcTwqnDFGGuPO7MJYU0
         U5kWtUqXOWjZV0a1HbXyQe706ZzWdzQD+CzXbryf1mWOHx87QStMc55plDlqOkvESkGQ
         Ija75sht5Cs2k/BpA3wuwDX+Ug1nczolGn9LW1TGy3ckT0MqrZAbVgQ5f7S8ZrD5T8aC
         lSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKr8dmywf6/BMJ2C62immRiR0SdaD+PGjIndJn9/zX+WaHVjIS/ZQu6d788GVtVx86VqQmGt3l/ml+MRRGvpFz@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ7RLPaTkHEsXqR2IavIRRxkrVgsAsqwelXaIlTyTJvkLZpUA3
	P0zlL3noDmUgzwZYl0L/bPCawtTBOY8Zf0Av6ceIvx+88tSK6K29
X-Gm-Gg: ASbGncva3x6uYRw1WDM8lqOgmtmmWR5BmsC0WXYad8w7iQgkIeXpMvg556KR+COwBaS
	zQGzRSbuL8BG60LYiFpF4f+rn7iNTEH0yTArUGmFFFd+Q0bY0JeUO1pgdg+5/Jleu48DiuyqKFM
	XC/nGvqaRx0MzK+sb6laxUDr6kDFgR7tzHRyD1JKEbUELGJJzzL+Z3enmnDt7xux3ZO/rO3d5XC
	fDCFOl/hVIikTHIyena5JNJKlQBUNKaqJZl7zcbc5UvnAj1HZf88aG07/eW7GMSTwde8L2SpqrN
	aKiP+TEGQ86n+uSHCg==
X-Google-Smtp-Source: AGHT+IHecW5Y8kLOhZQX6jvzcxU97SSW2l2zlY2HIPmfrm2xzYaS1crMHnLcc7ZONqRqQQAfBj/B6Q==
X-Received: by 2002:a05:6a00:2195:b0:730:8f7a:27f4 with SMTP id d2e1a72fcca58-732617a4a79mr30414248b3a.9.1740054170797;
        Thu, 20 Feb 2025 04:22:50 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:50 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:50 +0800
Subject: [PATCH 9/9] arm64: dts: apple: t8015: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-9-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6VGsP5C1mUSlactoow//Nl59ChZ/SauVCkyBSv3d3Es=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/a+YVG+deJ0Nr2fwotL1kKLBzPkzU5tQy/
 qTpx6SuLeiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JJ4HD/90gXqkkbacSqy5KnE+w1N1e31n0JOSxIazQ6ex4qCut08tkl4/4KKfQDTqLWx1bRmC6Ro
 BmJ72nqMXNsP6M12MwndhaKXtHVKtcsIWpufScOZGpnV7BK4MvF/fM1E+EomxRJJ95oDr705j3v
 JSsQCHYKgbBOoZnFdvrwIOLAZPgnEsGptOFsYmC1cqvi5OiLLs1woYnHJxahOGmEFZzXvTUBxby
 /PrxQp1Hbu0gW6U9zfU5a6QXh89b0uhBcZ5zeHN7jv3ndXBZzLYsyhGk8Ic0+qXtJ95VxPuZ4u1
 1rJPybeizYGSW+ST6G2QZ2hV/5bExjrdN/nBMlqX0oU+xpLNyzXiGJEvgtR0UzmIq37wYsk9MWn
 3s3N1AP6X7EDFTHNzyB2ighs9yEbCw/eLU0bMnD1xBZmE2OhDPETVqR7bqRRXuSPdLaOMRA6pgf
 HXT5FXDhki0kb2nNMQ84RNR2sBzxpkmWz4uHGC/uoHN/49fVrNU6x3f41xvxD6Gy38vbVZNkEQN
 ocUA/F3Ij1urqV8xYarinY23Z6KMcUjrAn8WYHP/GkoXI8j0fCUBalljbFeRg7tVdrgeXokUbRp
 3BJpcctT9Pv3GSoINdIB6YMreZMtr/3S1Svw+v3/a9y5CtF+IOViydTL+qlyZwgu1AB4RXYUNJJ
 tnjIMwLFCCG3Zgg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042251_472488_84DEC90A 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Add information about CPU caches in Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..138073dbac3c5a3ec495b078b3714cf800b471dd 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -63,6 +63,9 @@ cpu_e0: cpu@0 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e1: cpu@1 {
@@ -74,6 +77,9 @@ cpu_e1: cpu@1 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e2: cpu@2 {
@@ -85,6 +91,9 @@ cpu_e2: cpu@2 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_e3: cpu@3 {
@@ -96,6 +105,9 @@ cpu_e3: cpu@3 {
 			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_0>;
+			i-cache-size = <0x8000>;
+			d-cache-size = <0x8000>;
 		};
 
 		cpu_p0: cpu@10004 {
@@ -107,6 +119,9 @@ cpu_p0: cpu@10004 {
 			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu_p1: cpu@10005 {
@@ -118,6 +133,23 @@ cpu_p1: cpu@10005 {
 			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache_1>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache_0: l2-cache-0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
+		};
+
+		l2_cache_1: l2-cache-1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x800000>;
 		};
 	};
 

-- 
2.48.1


