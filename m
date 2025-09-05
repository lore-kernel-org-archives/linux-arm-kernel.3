Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869A3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVxRCVFvOJzT3t1Nwg2lUVttPj3xxid9CGLZKoZfprg=; b=bMZTLV48OVHDN2lzYaDedkf4l/
	06IVWjiraqw4M94hvpti7Hr1TCeO4xazcJD1Nrb3uX6pl7SsHwj/zoEjaco5mgPhjqkuQKIdAsaM3
	joVX1j1zNWYSAHZ0kevk8oXh8+kq8/rVW76ycvzqWPUU22i0sje6L2X8iAs+nSBG5Gh2CV4Qu9Yi6
	oaFM0ABQx/DzgpfYwPFXYNR40qiXwfaO72yCNh+lmgZL+o5EmLqLwpRic2L6nZJ5r+30D4VDSfhur
	ibSmzwWjljdKc1N+I2VmRB+5/8Ss6WbFS/e8+4yaxgzV6VTMhJ+/p/oznEvROvpJGF1GiGnRzqQVn
	vjXomGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYbI-00000002qiI-1XzB;
	Fri, 05 Sep 2025 15:43:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6q-00000001XLW-1hcL;
	Fri, 05 Sep 2025 12:00:05 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32bb1132c11so828323a91.0;
        Fri, 05 Sep 2025 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073604; x=1757678404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVxRCVFvOJzT3t1Nwg2lUVttPj3xxid9CGLZKoZfprg=;
        b=SiRs0n1OgnksBHncqZhush6+2YNK4jCPgc70cPsXhtyRgZNpQ9hXA276hOi6FseCJV
         hRFlofs39RbHA+jNynjaot1q0BloV10QL/FSJGxWwVHZ5BIbcg5Jc2sOS5SDXAQJSGue
         2T6amZq8ztGmCL7aXIvhbRC19osKLznUHs9OGwRA1ZsswJZbPTj0FIX0HZMDRxOf51+4
         42O0/eopDW3VskK7IyyXopvSjRq+7UyysIwO/FARTdUDRxCu6QFISjCHAmkgu1Laa5oa
         lKTaeVCKz9XwZk7G1t9LroJNk0E/WWamSs4o/A8/EXLKinBPlQl6NBqibsPlefBJ2OVj
         HRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073604; x=1757678404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVxRCVFvOJzT3t1Nwg2lUVttPj3xxid9CGLZKoZfprg=;
        b=ryOhkIMXq9Kdkr1V8lIgDKdu9mNG9W4gdKrcslqEJE4o6ZzMmk/Mi8tv8wfFePzkCV
         t0sHXV5o7Ep/Afbnyk4pJoQbJLAxz68rIdMlzC43+SkhR8QidY34MSDsNMMWJvBUA0+V
         ZZvsisc/MuGpjO9mNP+pHzvVkUCUb9cxa89n43luxPLWwwz4gm+TLRsEp3uL6aSIr5FT
         wMR46J0eoUy5+AsSGySPEusGWBO0ths747nk0nj9edryqubMhDJJyoNqIbtL3i7vwPjw
         C/4TY5FjgrhRbK/GJf+Svt76KSgZcQcBI1/fKYrNGn+yNqPmGP/VMs04s+Y5dWHXeFzA
         fU9w==
X-Forwarded-Encrypted: i=1; AJvYcCUlMRBbRiLHyBYsBNKHrYUkM81KjrDfFUqu3I0gyhtFqkYyLxXG+ajHulUZNcmOsOnZ8bT/nqFvJ/H8mRIZCJZEnQ==@lists.infradead.org, AJvYcCXgnCpfSztlSUbdwjsCGrcldJVGfH1+31MJyea+zu+dlndntPowL7nMuLKN/1uayt+60fNl6qqXlu03rxmR@lists.infradead.org
X-Gm-Message-State: AOJu0YxvfCxKr3XcNMwh59YmBRo5ZQO6R1ccAfcFQNKbSqZlMNuSsRtg
	lEkIX9nH6m/YsLLSV0+I2xcEnQTWSFksseCDvmywapKZgkgGwUupqRw+
X-Gm-Gg: ASbGncvlgMfJA6IboGccXXGuC5wjczypTVYuIkR3REBumJ33eivaiTi/+mHk2/NxNNU
	QK1PALYeRXxkZd/EymGzLb+i0v4vFpeuU2jU4DRQPPElSWI0lPN8uUW7xKeOBPXRSwdv20exbdE
	2YsNluQHmMg9grpDuG1OjgErNLSOrr6N81AEIVMbbuH+kg9BynJrYb4mbVOMJcdnkjRRDydvb9r
	+xrfeR8BHbZjbWHYqb7YZ4Zk5D1EM+qJLW76twyodUiqgp/KZ4Xw1yfkCnM2jNRFTptbN85L5mF
	Gl7qA1pOP4Dci7Ppq6EYdY+htpV3SAKagandg9Ro966p/qANrAqzhuYrjRHWyUQd/pKvnQz0hIC
	e01kQtxb53GnHxfCcB2GEdUdpyD0TaCc=
X-Google-Smtp-Source: AGHT+IGY5TeOBBLsD3Cq48stKZ7qkYVc+vwv84x6vovwpGRju1eJ3HiOc73XVMc6AcKN9NGG9nv4lA==
X-Received: by 2002:a17:90b:2d8d:b0:32b:baaa:2a93 with SMTP id 98e67ed59e1d1-32bbcb945e0mr3464777a91.2.1757073603453;
        Fri, 05 Sep 2025 05:00:03 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:00:02 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
Date: Fri,  5 Sep 2025 17:27:41 +0530
Message-ID: <20250905115836.7549-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_050004_446571_C39EC281 
X-CRM114-Status: GOOD (  11.44  )
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

As per S922X datasheet add missing cache information to the Amlogic
S922X SoC.

- Each Cortex-A53 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A73 core has 64 KB of L1 instruction cache and
	64 KB of L1 data cache available.
- The little (A53) cluster has 256 KB of unified L2 cache available.
- The big (A73) cluster has 1 MB of unified L2 cache available.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 62 ++++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 86e6ceb31d5e2..f04efa8282561 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -49,7 +49,13 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -59,7 +65,13 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -69,7 +81,13 @@ cpu100: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -79,7 +97,13 @@ cpu101: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -89,7 +113,13 @@ cpu102: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -99,14 +129,32 @@ cpu103: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
-		l2: l2-cache0 {
+		l2_cache_l: l2-cache-cluster0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x40000>;  /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>; /* L2. 1MB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 };
-- 
2.50.1


