Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYOobTdeVvBQEcklmUZtQ/nTyy5cKNm1JGVJ6HGQd8s=; b=2njp8FOFwTkEJyf5mVEiOkva2M
	2j+dgn30PSX35FzUzG9N/6nnd5/tR0fp9UztmWojR4Wu0XyMUR9FU5UflZK5DKQGjMcaa88pPkvw9
	5VmnFiTVp5QqwK11i0ZTMoMg1Y4uo354a1DWZsA1ooZupfgJ/Uc4Fz2Gdlf1u6rlcXd7jtMnIAHXL
	RQqMn5BrEJ2c7LMh5cw8BUEzdBHHF1cKw8Rp8+rrxDnWoVVWSgnFm81L9+doZ1ORetki9B2DmSOnC
	BrPw06fC628NTR1mDAjVJeFz+nQtdqrdEPn5FzODHhj3m/mnxYL1C6WHoSNoMKe3uELm8Ki4Fmtkw
	CoahW+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevv4-0000000FQYv-2JjE;
	Mon, 03 Feb 2025 12:51:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsT-0000000FPcX-1HpW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163b0c09afso72768215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586916; x=1739191716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYOobTdeVvBQEcklmUZtQ/nTyy5cKNm1JGVJ6HGQd8s=;
        b=FGz67+qgxoUOJqj0cp43Q9TAeA8y+5X7t4gJknYmBIt0lPJywAocb7cQQRvFogTt6g
         9KDCkAJlGZc4UrUVphC/HSPak/1NMWgSEQQcvk9KIgPGpOdrWNvBSJeaNDQIX0iBLNxD
         KauIBld8+F9nRPu4zMPe29ksJxZMhQqyiZ0rbcp862xb8ss86Kj1p+N4Q7FkxI9eCUu6
         9dxaLRdNCYMeEJuKBcuoSGl0zVSXN9z8s4rDsskzdjEGXaRneU5n/JHrGErcf5+L+yVq
         3z9rwGVlLMKdQmK1PdbCQg1FyfVGUWU/u/HgK4HBH1EGvQNLkYVO+cNhUOUWz6klqlft
         1EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586916; x=1739191716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYOobTdeVvBQEcklmUZtQ/nTyy5cKNm1JGVJ6HGQd8s=;
        b=e3Ar3bYvgCl0EFHidUa3Fg1Fmn0SZTdLAeB9hKaRrsL59wsvlqbA8w7MSx+E2DCH2C
         d9bYwdYm/oVF1sVlZZuUdA4wEUxAuhlGFp3h4Gv1BFxoFGVSJelWicyu9Rn/bmdLcs7T
         M9pHn0aQG+s+zI/TxjpNPoTdIqH9lgx++rVFBHNfekFtiASqH3bOydtGTrwGE1TL0d0I
         GTmLDX6HhQCRt9GEbY9le3mXh8s4UOHYIqjmRrvM/iMOPymwBNaDIPrqrF/FiQcTUVhA
         FpnyEzJ0ELRSal1murUKIpU4XQLbqpm0386Ud8EJOxesEW6CwrJjACQm4sG1xuOwVO7s
         O4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXtI5rciEaXOM0F3pWnLf4nFt5PgGJhdi316by4DOL1kGAe0Bz72P2MMgSTwswEd6hKXKJsfNbNHQx57Mq84egk@lists.infradead.org
X-Gm-Message-State: AOJu0YzdTw2dCxwwDj/hCRNrhRq50dfbRL0vmUjk1JvTBaKN8DcwjpWq
	m7q3TalEMmbzYa/XtVP/2yHVg5dy590NCJ3PKTkKWV3z9Oo6sjiN
X-Gm-Gg: ASbGnctpz4O5TLgXetwTra9N4hDlCnjk4sw1G8S0ElnwyfUf2uz2soMqIyN/a+qQf/H
	npW5iTCKzDvgqH8z+kxTdR7sGsnkmLqd7E2Szu+0Optk8sSVYRRPNv3G2IbXt3BYgPKL80yLjvz
	bJW7812sAGAqabyjNPBlnFiCeGrEv6xUMp/2Fsmc9JJrncn/dFPht03nxWbIWqdgLJTh+TUCXbx
	k0EaVPv580jWXDwUU5d160JXGOTdpDzrX0C98u8ovqbJ7bnMocyTH+w9cqk8u8pH9Sm5rmrre/T
	FHNZkwHOetQ9MI9f
X-Google-Smtp-Source: AGHT+IHNxiz6QozzdjMZnbxINSYc1bgjbCbDWy4u2OcKc7sDsAQ2D/vBYRoNRl5irV8KJMRowGeBUw==
X-Received: by 2002:a05:6a20:748c:b0:1ea:e81c:60fa with SMTP id adf61e73a8af0-1ed7a638a2dmr35595806637.20.1738586916570;
        Mon, 03 Feb 2025 04:48:36 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:36 -0800 (PST)
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
Subject: [PATCH RESEND 1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:40 +0800
Message-ID: <20250203124747.41541-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044837_342154_2ED7DACE 
X-CRM114-Status: GOOD (  15.74  )
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
2.48.1


