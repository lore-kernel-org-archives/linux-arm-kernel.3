Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE28E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8quqDbvIzDjRV3soAXIobPs9f6LGdQx6F8kthQIS+s=; b=23WKDuk73/t7fjxeO5ddHFdo9N
	MxgXnBFfD1Wyq8oBAIOC9z61ztVLryZOo5Ut6mQJqkLZauw6RY/qI5So+fIc4qnCh5/e+IX2LqyOo
	a5Car+pdhz9V+VudI6UBs0MNn/hJ8AkLl4rTR3KlpbD0asnhyfgh5gyTtLeIb7kfRovK2SxI1vBtk
	ca3gmrFGavUpaiALO2O4FBAU3G4pDsCYE0gm8ANNMqCKn/Mo8SgX9GlMoz6QX8rZ6N4mIfNQSeWda
	BQNGQLCsiP0ocncLhzHpUYdx29XT5FthRh9jE8pLQ+PnODobtJnxwloc87wtiHbuVNcGqLW43wuFN
	NXGri+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQHU-00000008erK-47zR;
	Sun, 22 Dec 2024 18:02:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ9A-00000008dof-0puY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21631789fcdso29805585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890023; x=1735494823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8quqDbvIzDjRV3soAXIobPs9f6LGdQx6F8kthQIS+s=;
        b=ibJppf5/eB1zxM+0gWVIhCl3Csn2t+aNe0s+lJP1iFv0t12fctt8a0te0gDNyWNlG/
         7kfvTyFncFiKluJOeXaUDYgDEHfqzVE52SOgTQNKpSEUw6zofDpCKvFKbljUwLyGdNEc
         sVXzrQKMEM+9Iz0hKvmHM1Nj8NyXwT9s5le50SFNFO2WFrUuNGYTMxW9qbYrGYssIfCG
         9kkl9TYjdVVX0K2w27cqiWgjAi5d7ZhFAIRO2flWX6u45fi2/VfYI15vmT17GeEc7TmC
         99OI9MNSUXQzvTzegeLMkaCYY0sR3Ze0FeHzm9qsDUYHWw6+hlTbrXK1v66BJXOmkayN
         W9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890023; x=1735494823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8quqDbvIzDjRV3soAXIobPs9f6LGdQx6F8kthQIS+s=;
        b=V7mZ1AAu84eaSbKUmzP3nTXauqkmhVrM5ENJWvdMgwiGh+XQ4Pzew4eXoMhsdSc1j6
         cuCFGZvD0js/hksfrBeLnXgzhmDjk4PKM7r5pNPGd9qXXdwWD2DoPPNTZuzF7tKKZ+3j
         zINOi0ESMq7N7Cthf+y6CfeiNsptjyQBBAx1vX7vibJ4pf0wEx7HQapkrxSoQLX593wR
         FxVxh8w15UNAhFmCK+/Y8khGouimKnv1BJ3c07XbXhJeHne0AgKPuIrbeImJpKlImAm4
         m+ckMI7sHQ3Brv+/8lK1cTFpBJWdIycI1mbpW5OFN/NO3XCLw+67vbtDpB7Y9EV2xpzJ
         yDuA==
X-Forwarded-Encrypted: i=1; AJvYcCVDXZ6YBMiHlz40fVa5IL+Z9qsNmfTmDvu1JzO91Mcx3aHZEksrxPLU2/aivf+NCr2RCMouS5f4rNXozC/0W2lY@lists.infradead.org
X-Gm-Message-State: AOJu0YwcltFLCa2Y2iShG9x6BELujVyfQQo5jnEla/0Pd8i1f3lcEIBd
	lVDroiCoVSYi41mVEbuUXuWy/wFIkfOb2BCWCUFmQuvgVrmFUpwM
X-Gm-Gg: ASbGnctm0am+hkAUmBi/o3+9py1ZUiA0vzXCuW4qJPa3jH4xLuq75jd0J64ifmsJI7I
	llxW1U6UTQ41n+z9PhQ6UgIi7Kla/8qUCUQcYxecsqRQrnTPlhy12n7J3vJ14p7xTJN9ooSV0AM
	yzW0VU5jzvhi3m+GEOHlKaSF0bVVR18lCiJoLICp4/zQ7SlY+pCa1NjQiqskCDhss1+30hMBySK
	61brkBHrAFQtSu7ODS7wwoVUTASJ1wKyB+RXDfNiUrOsgikedRThPQ9PA==
X-Google-Smtp-Source: AGHT+IGpgvTOHhq2hImZ/rSPNRXBsdgUbRBZyxdR2JAx10GDpZz4KoEJX4OK0tyh8MQs0GsB982i4g==
X-Received: by 2002:a17:902:d50c:b0:215:9c06:272a with SMTP id d9443c01a7336-219da7ff40bmr204906785ad.24.1734890023267;
        Sun, 22 Dec 2024 09:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:42 -0800 (PST)
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
Subject: [PATCH 6/9] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:06 +0800
Message-ID: <20241222175314.151437-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095344_241068_1F10E98D 
X-CRM114-Status: GOOD (  13.46  )
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

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |  8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |  8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi       | 86 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
index 1332fd73f50f..919e067ef073 100644
--- a/arch/arm64/boot/dts/apple/t8010-7.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -41,3 +41,11 @@ switch-mute {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
index 81696c6e302c..4ea8cf12e430 100644
--- a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -42,3 +42,11 @@ button-volup {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index e3d6a8354103..2547e8c60cad 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,89 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	fusion_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * Apple Fusion Architecture: Hardware big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 * Only one type of core can be active at a given time.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <11000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <13000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <18000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <31000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <37000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <39500>;
+		};
+		hurricane_opp09: opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <46000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+		hurricane_opp10: opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <56000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		hurricane_opp11: opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <56000>;
+			turbo-mode;
+			status = "disabled"; /* Not available on N112 */
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +132,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.47.1


