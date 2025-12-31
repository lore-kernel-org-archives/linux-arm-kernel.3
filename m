Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049D4EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkVbLY7WKxeFV6FL/1HrmcQC5sHa2aQeDppOR22AFY4=; b=r4xToVDpz7ywR/a++rPbqO9MSV
	ASeOMFF0aaXl4D0J2ccYtXErleU1GUbK7dBjeIhaBy4tJAsqgMJYfV3ViAXMsYtkAUE8BjJbfROWk
	4q7VWmUvVtTeCjXQdJ5Q2UOx7O5yWdOS3agzbhDcL0LcLMIvzf4WCDiAXjcVwKDGzd+fxPG1hRVOm
	5wxq5TrPuViObIEQYfAaH/W3FTNLLVLAOt+kS8fDUM/qt6Lfq39C+nqf5IWdGFYWso6eiXd6A+vpa
	kSvaR9iKZOasPGRGytL5YsH4VedX3XQguToeko5bADcj46cAhosFpRoIRpI1nbsXO+xB34Jzc6CW4
	SD2ZfO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN9-00000005bQ1-0CDI;
	Wed, 31 Dec 2025 02:55:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN3-00000005bNy-0CpR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a2ea96930cso120823005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149732; x=1767754532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkVbLY7WKxeFV6FL/1HrmcQC5sHa2aQeDppOR22AFY4=;
        b=fHjIEkxW2jGyu2gNDfWuJ7eDWDgcKjDp7jH29VezlxAoDH1l3jM1N8TnWsnt4biqvY
         1tmPb4IsLbX6jSegFbRngX/jx8t9yLm1jmxtyGxPiELAt4iC1p+e2aORc2eM1px4osIB
         okQWSCR/MbMew32kbwXkMMBIICmNLrDsUYt80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149732; x=1767754532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkVbLY7WKxeFV6FL/1HrmcQC5sHa2aQeDppOR22AFY4=;
        b=u/+sWUtoVQ4r1wG1y3lP7aqTD4QjrrS6QLavpyHEgF+hqDHaBHpzdxF7IMxQNs71Vv
         YFPkla1ZdOW30OzpD6hWS4kh9sz1YMu2ncC0XVdtlcjH94z6LyxXR6wy+O8El4du3qNr
         xbuOncvtxF1N5AcWwQXV7IhjVLKdAqrYemb52blfvngGphzJEAk3b82SpUW+g1UMfdKz
         8BRfLx6/QbsuTXrticyui9xZOPfrdEltQfScr7N4yoabsbnFR572J/LtyX8VkSEQunqQ
         byUKVHat7Ns1NVPvclwOjAgrKKEFaDcr/7PTCQGc14+EJW4cpHP+QnEK5JS6kiqZvLUn
         Ll0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLMZeZEJIkE4/OwCaMV6Z9hBdxqh+koooU1FCAH0zY/nrFbbVFSq1ARiXx1Jxou6mVwdl250HdgHW23Yy2WKTk@lists.infradead.org
X-Gm-Message-State: AOJu0YwzENi1BtWIgq4zrtPOFQvlRpqPzKBSvUT3ACk9UsGaC0SP+nTK
	fe2a8U8souA+8fkZ7YjGd6HgbmoPCDF6e9POa+7VHxhEHOh5dK6YqRWqD0kJKi61KL6g3ohz/YS
	uOx6W
X-Gm-Gg: AY/fxX7JlELVwlwtBIExtKFKO8SODmubl6R0y/HGFEqFd8ExT4uqfwX6mC8br+2xkfz
	+zVDrAiMLHmoYVfiqb2v6ByZpgZlZlHFOq0k4YT5KmXQaZUKrC9ERehzXGsroeLjlxBKQ4wjrCA
	btHzGEfRd8eSKGbyX7srFWyvXPtZaZ6cCisO1ggEJIh33h3CQfvXV+J+XdPACkdt4242WhohWNw
	gU5FjEBXgGgQaU+FTseKTAjugn1+qm9FAgtyFD/aA7mryTy5KrkDJzfUGbjCJC5J4EnMtt4jrSU
	Q55xr077FxnEyJcwpRHfBaZEJKCEBcOhpiWUCg+Nf7S6oDCmpJofNB1m8yruyft+bNKXb9SM2UJ
	fEjs1m3JRPduuz1nupULFZyQdemtsqacwTHfBIckMTqOb9m+eSityTUOZL48+SIEE8ndawZQ6wT
	QoX0ljHITQHblNfsybHuq8L1+iFbx4exuRUvepw4HPPa9O/dhXhHpB
X-Google-Smtp-Source: AGHT+IHG5Gi2hONkaKklkpa2PlYBR8Fgmr1o/L9fFONMqPgmMHSqOlvGJlmlQ4t1chHXQOHGi6o/dA==
X-Received: by 2002:a17:903:284:b0:299:e215:f62d with SMTP id d9443c01a7336-2a2f2202faamr370860135ad.5.1767149732109;
        Tue, 30 Dec 2025 18:55:32 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:31 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/5] arm: dts: mstar: breadbee: Correct regulator names
Date: Wed, 31 Dec 2025 11:54:58 +0900
Message-ID: <20251231025502.1139168-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185533_085974_38A80068 
X-CRM114-Status: GOOD (  12.43  )
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

The regulator names had a "@<n>" in them so the dt validation
stuff wanted a reg property. Fix the names to match what the regulator
is for and remove the "@<n>" bit.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
index 507ff2fba837..aedea0fbbce6 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	vcc_core: fixedregulator@0 {
+	vcc_core: reg-core {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_core";
 		regulator-min-microvolt = <1000000>;
@@ -15,7 +15,7 @@ vcc_core: fixedregulator@0 {
 		regulator-boot-on;
 	};
 
-	vcc_dram: fixedregulator@1 {
+	vcc_dram: reg-dram {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_dram";
 		regulator-min-microvolt = <1800000>;
@@ -23,7 +23,7 @@ vcc_dram: fixedregulator@1 {
 		regulator-boot-on;
 	};
 
-	vcc_io: fixedregulator@2 {
+	vcc_io: reg-io {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_io";
 		regulator-min-microvolt = <3300000>;
-- 
2.51.0


