Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEF0C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pPkPkgzwh7OR3QLmRpEkbwB8adYmbJspMBYICok07c=; b=lRMZbBzjMeq6vhCi1mPkVcBSL+
	qI+CLw7jP27XIm+6L6B1oa9ZXQDP5FtlahUyuj1XowH799OV3AtsJRqE9dBSA2hYZPGc8gzeJOZOe
	wNcmNC97+7Wx+fHldykPB/UDJd/wZQsED9K4rHmllUW1WZCoVcVi/yw17zbHYLdgoEzRROSS3n2Nd
	XrhXV+AfYJVRPbnkjzMtcfclDwvjldVBc21nrOrGVklSDd1R+MIRxsKbVHHqz6WEclVcyW4Ya1tx3
	6TVCEO9RQNOWbyQAP3x3dFylOt4m198EwDbeQiASEwzTr7yjz/cTojs2gJiElIqc2HnffyGVbWT6j
	wvHONDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl62I-00000000tgo-3FbS;
	Thu, 20 Feb 2025 12:52:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zo-00000000ljh-2RyS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c665ef4cso12168895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054168; x=1740658968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pPkPkgzwh7OR3QLmRpEkbwB8adYmbJspMBYICok07c=;
        b=KhbP95UzypdWramP37PybjkIn26bCVzU7IUumrWhszNKY9QJr7FWOKT5QTKDpDooW+
         GUnLfs1MxV9CcvriviNraoRTAtLPyP0U8mzC/VX5nAk+wX1MBAR60wNE6j1/iysFYe9/
         VqVzbCW4gxw6kn+pBspPUp6QsOeMvv+P2txVzTFzf1Hij2tiL4roHHZAHcg840rJYt6V
         WPkzjJIoBVBrbZ461OJr5CAWjvehtZQ2bIfsQ6ZyILyO9yCVcew4zsKFwairhLgTN7ge
         TTMOgznFGT0AAfKsrY9N+7wFl6IP2WFTXCIHJX45dR8eSJ5NZIm2d78gFnMrH3FfskgM
         GiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054168; x=1740658968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pPkPkgzwh7OR3QLmRpEkbwB8adYmbJspMBYICok07c=;
        b=J7KOep4J9QGlNrk5jv9fS1aazCdDXG5LGRG5zpm3H+0NUbcRVFY/92buakAL48Mrn6
         jgXei8CbYcMcMplB7WZwJQVAPffKTSZE4TCjWHPFOy7NE+3MqOaST1+pw7IqJViooncH
         DWwX8BK8e1T9f8w08aKsJF6HtmHQ1ZR2cSadgmojJcG57S1Q0zLFqhOmEuE8efDDE95t
         G3aIzAhs7QrnXipxkCMr2L3Y7V4kzMO6Pn9T8EnVvzEzxXq2l18Kk6rJZPT6zNMLXzop
         VQoPp3WcfKc6jmjgcPriJWjnaIFJQy60s6GK9eaf9Eq6IwNibYWyvqZQq/DiAcKp6jOX
         /0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcPB5eUAohUQQHe5YzSGl3ePYrFNX1c/g/RD8YkQ5eVKIOUivO4O+8gODBatqa7cpJKCph3qLD3g9ktHPUWnC8@lists.infradead.org
X-Gm-Message-State: AOJu0YzOow88LPGY7vTIymsi6tf3GOczm8ru/wJ5Drb20QW+qkyKmNfS
	Q7vLbr981nKhNEaWkP2AGk4OehP9wwir7glpYzMYPzdW4vsvH7qN
X-Gm-Gg: ASbGncsagtNtFrpRnYkZ6R319kvDDcy6pWY0Buvc2pcOMUo9rwAqw+x0OyWxnQGJu/1
	dN2w42azz5TvpFIcVpT1KlYtl0ABQXqo8WLH7ock9j6qaM51alA3x9LkzQx1cl1kMGFlAHiDTvw
	E8az2sy4taWOouF+CzVSKaMi13t74oVe9JfhfkaGPbhPGxukQ99O9/ybGnkRcs8Tvs9hzQ3zjze
	wdLAys0rU0dmPcKmMi5dItmwJg+fQo3vle0kKh2qC7xz+4292UlPtiiUMj4XrxMpgSJOLAPP68q
	xG4zsfZ0+RBnGTg1ww==
X-Google-Smtp-Source: AGHT+IG85l5eWD/ehvahhU8yOCbGoLnCSNPdVSu3+J6g3K5WKnhM9iZZ/yg1bN3TtK4C9Qa6bRevFQ==
X-Received: by 2002:a05:6a20:2d23:b0:1ee:e439:1929 with SMTP id adf61e73a8af0-1eee5d68e2amr4689789637.30.1740054168046;
        Thu, 20 Feb 2025 04:22:48 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:47 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:49 +0800
Subject: [PATCH 8/9] arm64: dts: apple: t8012: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-8-2c7011097768@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=G+mx3kaje+P3ZyUO/ditIxszcN7HViLpZE3JAiY3KS8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5/L3429r7pYcCYbI4Ok83LdV+FbS1dAwtua
 kdgMttCz3+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefwAKCRABygi3psUI
 JPnTD/99BMzSdUN1zSDmpMt9J6sLssoVIIAofLDDFZqY3AmmImgCPmW7/4gTCH+RCSjCoA1unC/
 DqcO8Lnz0OgD26lYrPdJeRc6O6lUVNP+YQSD1P9HN6VLxf5X5sP2F4mCKCG5HOCmcziKY8VeuHh
 oPT/rwbRPyLePLHNW2jmRFlIIq8c1o23oYqeyONp8lGuorFuR8ePgu+hZfnEh+mBM1LazZXZbVE
 uR7mJURz+Lf0DS+EjKq08ORExS+L5PBtDq5OpSzhiPAB/A2iOTHBeDqfYBhDHz17WIU8IvjNj9O
 siP8Gjd9U3HyM6r2268VUNM1KrXIh+HCXi2LjCLdLrBLQfTTKRg1PBGY5JthVAP9W047OGdVc9X
 SIotScz2fOpfG9KFcAwnHzVnTtO5gHClX/afXr0VVceter2NR7O0vuMsGcgHGYbPKdeJUAmr/ZD
 wCKG0+RtsFRIy3Voil3yojqW6mAsamyzGLvS9h/FYwy+B9fANXJ0/vQW2kvZesQ8AZqiuRvQnJD
 pV6p3042PGur6NR4zljlyXgnPXJOI511rlsZTYRgP9ZCzghQnV60fJ1TIY8r91EErCrLtjBfIE6
 xoaqB9RrVcULQ9AgtHxxIgo6Du6gjBHBcsq1quAwEWei9SNEE2KB+ttkBl0ChRhuKmrMhBd9uTW
 FBcsHjWvsE5DOVQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042248_646164_CAF6D530 
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

Add information about CPU caches in the P-cluster of Apple T2 SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..a259e5735d938cfa5b29cee6c754c7a3c0aaae08 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@10000 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@10001 {
@@ -46,6 +49,16 @@ cpu1: cpu@10001 {
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


