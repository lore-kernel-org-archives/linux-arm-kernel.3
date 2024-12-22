Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7D2M/MnbL5flgWw2rKwlq0CEQX5AIdMs90nrhL6FHw=; b=z9SF730I5ji7Wz7DcE9JdTz00u
	pD7s94rUUAsxzyzWaEHwJPw8u3Bh087CNMrBDszJghEs53Y21tAhcvOC425+VwjjlvEvPWG4GAobQ
	/LGHCmssv06Zitj7GW/9msXIZxnfdNtEvPu6ze1Po2AuqdZI+JknGBLTRFv1lFmq0V3Ifmoqz4LXk
	QslKzUUD7eTW9V3Jodh6fYYK/EJacH2Hmz853VOjr5RszQtarXFz+A9pW1TynMIx0srPBFLHtAZbS
	cF1QTxrDf72TP4ZamTpFYhqMF4FC3HzWwAyCrdtow+q0X83DXo6vLgDMKQX5mJ/dOXBBcWmgSmSnJ
	wQrVpl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQE5-00000008eYm-2wtR;
	Sun, 22 Dec 2024 17:58:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ8w-00000008dk8-33PX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f441791e40so2765846a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890010; x=1735494810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7D2M/MnbL5flgWw2rKwlq0CEQX5AIdMs90nrhL6FHw=;
        b=l4l8mMMeNVpr4D8ClteIKkMHDck9rpeD72GpO9BGz/9lESM7szzs/aI7uywSq7Nina
         W/Mf1xGmdEIBfjudqZQRh5Max/+Hdblbrx93O4bkwc7VbzD1oAm5K6k5MJFZG0ybRz1j
         aWDKAWebf1b3dulzFezWn+9pC+KIDD8mrWpx8ywBZLCUa12+E3ZDY0NwvRB05XCJBn+O
         zsCs97zIJzdEoY3qneNwCpi+gm5J8/TBnSg6l9nKEP3SgwI/a7uQjoynoFiGIrsmWiad
         rjIxrTIBh0Y5MQEz+90BlQsOOXi4DVkpbtKHzYhdNNjyk2oCF5SUJe2I28ret9qlVS8F
         SSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890010; x=1735494810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7D2M/MnbL5flgWw2rKwlq0CEQX5AIdMs90nrhL6FHw=;
        b=na0Ocg8/h5z4ryaMqWtWjzsdbgznfbcGZfEuz3EclWvu2KDRyH1DeM1b91UYk4XWPw
         8liq30igm2AU74Wo/XbPgvRNYkKqydI2vdPExFg9hGIP2dWWCbwxDQlauUEn04ooD565
         WF/5Okj03MgkxcKBZcIfiUPKMQpCQtESWiUFDbOW4odN9gTm0puEdclQCudKgEd8jEP4
         xgZgbqS3nFcmQzyr0vVKWeItHwM5AAy5n6AV6fKNoanAuEyEfSCjTpzjG6Lt1K6hd3vx
         MMbJRtBKW5YDeUo+pmGyTl/0KEI11oRfLAdXs9RKMMH6TFrj3rfwVFjsDBCxQty628by
         L+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/H6BeH+w7NtSKle2B6oIay7Q7D/JlWDke+x0+aFODIeMxMIUlBb7IyBlLUE2AMIr/ZxSB7DkDRF497ajxLtaR@lists.infradead.org
X-Gm-Message-State: AOJu0YysFMuteZSUieSwgM947J+xpHae35r7VE2b7qCVadzjtdZEgEZ3
	okzyZgznC0/JCTTx9DZzuP95z5ObuekN6zWWVH/y1XwdONs23L49
X-Gm-Gg: ASbGncuOu6EKU7ExIShR3HPhHTyQrsEleIksm10zd8qqrnlpeNLKA2n2lZkbA9DYNIG
	K/WA24mRtcf+UrrOYQue1LEAEE4Z/yKmaikCJCus6Ds9dg8gFE97NBXmIxt1Y23QWm+xvnvmZm8
	8hIdEw36Ztf/jfXhKkIRUPYtbqUskra4Fov7PmaB7p6AlIOCpqlnrDZO4Xwo7bYLN8eoQoMCySK
	vF01qXe26P8bZjZV6GISFmino0usiCBZmy6/LXuGzOqszi61uhpI8zv8w==
X-Google-Smtp-Source: AGHT+IGNjqPGyp34z6F4Pa36n3bRrRA3pu+NGo6p5zJv9wwviF9JJ8DZZK9qBdjxFH57nOXjguVXYQ==
X-Received: by 2002:a17:90b:528a:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f452ec3589mr15457101a91.29.1734890010048;
        Sun, 22 Dec 2024 09:53:30 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:01 +0800
Message-ID: <20241222175314.151437-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095330_774257_55C19094 
X-CRM114-Status: GOOD (  15.39  )
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

Add cpufreq nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   | 45 +++++++++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 10 +++++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   | 45 +++++++++++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index 0b16adf07f79..83c0a4deb5ba 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
index 741c5a9f21dd..d88894e0fce7 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8965x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
index b27ef5680626..261b5008a6b4 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
new file mode 100644
index 000000000000..e4d568c4a119
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8960X "A7" SoC, Up to 1296 MHz
+ *
+ * target-type: N51, N53, J85, J86. J87, J85m, J86m, J87m
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <15500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <43000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <26000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <30000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <39500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45500>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 0218ecac1d83..449c69d0d92f 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,6 +43,8 @@ cpu1: cpu@1 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -53,6 +57,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0a0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0a0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
new file mode 100644
index 000000000000..d34dae74a90c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8965X "A7" Rev A SoC, Up to 1392 MHz
+ *
+ * target-type: J71, J72, J73
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <10000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <3>;
+			clock-latency-ns = <30000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <4>;
+			clock-latency-ns = <39500>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <5>;
+			clock-latency-ns = <45500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <46500>;
+		};
+	};
+};
-- 
2.47.1


