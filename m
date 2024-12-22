Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36BE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/0ozbwgqLpSEC7BNfh+14HxpMViab/4nt5SwTR3z10=; b=IVJTDWsHr3j77bmawoDwMCYMeO
	NPURoEeeWbx36LauuUl0x2BMiCz2fxpQ8wx3Ge/9tk6sXPhuQDiw/1LT5JRYYcTh2MuBReY6ronbC
	G44XuBUa5cgIEegHwq9SAib4LzgHRkuyiZcPHWBBslSU079LkHbcn+D37zFpEyRmDHHV92QfHICKq
	IlMUqVtuJC1HKpy9Jq+oI9s22g5+QU2k9W0t5OJ8tIMIfCj2xGLj4QhtNrNv/Z240HTy8Vzx2gV5X
	OHVYYJOazn78skLTHds8fZgNKxHq6osm27NWVJf884x7zSjnFt4pm3eYt0j0gpjeJrZg3NeocI3ET
	iYM6aDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQKu-00000008f8l-0tS3;
	Sun, 22 Dec 2024 18:05:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ9H-00000008drf-1nIn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21675fd60feso41300255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890031; x=1735494831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/0ozbwgqLpSEC7BNfh+14HxpMViab/4nt5SwTR3z10=;
        b=np4lvUqu6isf/LfOk7FrlNDWeLSNhal8SzGPcEU+y9UAPVLjz2B3nG1NuKfGw5B4Ea
         opHys+f9DdZbsBzOQMlg8B6jYiDFa0RgnzIBVRAU4lPAv0vdE6w77zJqwjIVydCeqcy2
         mkNqG5updS1J2OK8BCw5X84NLD4jfFxjQMC3pS4Ofrp6U+2/m3YObkpi86cUjICn9m4u
         pa76/cyiPk7pH9K/34iv9bZ3VvkNc3eBWeudjMqljUNOeh7GfGw6f7mp99UXzvvIEboH
         v/x3DfcNTUAOoiXS+JOPhOvHwfDHY7/3GvMUXPgDlyWa4U5VR5GeFxAVt7plIVm6PZol
         HMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890031; x=1735494831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/0ozbwgqLpSEC7BNfh+14HxpMViab/4nt5SwTR3z10=;
        b=HKMcKCupjni4ceGC4b1ReriDp/zhcOu43X50bDrCm1ZQIgwu4BNZKJwNowGXFTzc7Z
         TM9Bx9r5IwOLkcxtrbDVOnaK9H6JtcLFSLAb2fSCCvf920HzToYEapaekmCl1LUHSb+Z
         lw2SKTW9V3G1/ZjVbtJE85Ay1KwdM+KN0e4Zr2QbZo21FGR3dgnjF6gGBD0lOwftTYhm
         anE2opa8MMRh1NUxCf7Qn8e5GfM9u4/l2PIpQqccfDdzVYZATlfLbVi6MCt1JuNgigQz
         Q4s4HVj8U7L5zrgdBASLSiFa2fG/qf2+oBH/f7YyHtjqpiqdh5QnkIItGI4upMecmlKx
         XyKA==
X-Forwarded-Encrypted: i=1; AJvYcCVopbJemdkpoaGn57GZVybchVdOeudW+6xdHBQY768KbhZTEfbijXDNd1QlHeWGBtFhB6XJ3iph9A9ATzXuMWLf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6xJvgvzuRLR981x/LsfAuEh0VdGM54d7gPsgUP7HUn0Slqc3+
	vfJNdlmj4/BxH/0piEQ12yoJJZxZr218IIUwi/XMsoKkDnC+UsKN
X-Gm-Gg: ASbGncuQKeSehD9eG2+P/QZaWLrtkxmqqpAdjUnOdMKncGvHgR/CakXAVf7idMBSVdH
	9w8au6ZK4DbsdGhzFuidJ76Ew5+xKeuaMLTDvt4wVm3Jh/uLj8CJ9YE/7cPaV/9x7u/3bqfWzjL
	2CMcnZnhvyc+48AQ+SqQ+G659+ql6R9ZGGWp9X7ZTQwO3VZ2r0i9HtbjoKSH0U6fkEvuR8d7C6H
	IQwMGQUUPkd6l2SGoSWlyOGsgA/7ykwZZOePYMPwnp2R7hnXlHbCgXxJA==
X-Google-Smtp-Source: AGHT+IH9Z25ox7c01rsb5rHxjzRde+7TgfHUfkTa1aO2FEH4mP2CeHiSwbC1+asK4GfWKXt5+iT0qg==
X-Received: by 2002:a17:902:da81:b0:216:61d2:46b8 with SMTP id d9443c01a7336-219e6ea1c0cmr148322515ad.23.1734890030784;
        Sun, 22 Dec 2024 09:53:50 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:50 -0800 (PST)
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
Subject: [PATCH 9/9] arm64: dts: apple: t8015: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:09 +0800
Message-ID: <20241222175314.151437-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095351_476251_668C8D89 
X-CRM114-Status: GOOD (  10.57  )
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

Add cpufreq nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 123 +++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 8828d830e5be..f93ce2c8b251 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -58,6 +58,9 @@ cpu_e0: cpu@0 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -66,6 +69,9 @@ cpu_e1: cpu@1 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -74,6 +80,9 @@ cpu_e2: cpu@2 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -82,6 +91,9 @@ cpu_e3: cpu@3 {
 			compatible = "apple,mistral";
 			reg = <0x0 0x3>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_e>;
+			operating-points-v2 = <&mistral_opp>;
+			capacity-dmips-mhz = <633>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -90,6 +102,9 @@ cpu_p0: cpu@10004 {
 			compatible = "apple,monsoon";
 			reg = <0x0 0x10004>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_p>;
+			operating-points-v2 = <&monsoon_opp>;
+			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -98,11 +113,107 @@ cpu_p1: cpu@10005 {
 			compatible = "apple,monsoon";
 			reg = <0x0 0x10005>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq_p>;
+			operating-points-v2 = <&monsoon_opp>;
+			capacity-dmips-mhz = <1024>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	mistral_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <1800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <453000000>;
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <672000000>;
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <972000000>;
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1272000000>;
+			opp-level = <5>;
+			clock-latency-ns = <125000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1572000000>;
+			opp-level = <6>;
+			clock-latency-ns = <135000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp07 {
+			opp-hz = /bits/ 64 <1680000000>;
+			opp-level = <7>;
+			clock-latency-ns = <135000>;
+			turbo-mode;
+		};
+#endif
+	};
+
+	monsoon_opp: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <1400>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <453000000>;
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <853000000>;
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1332000000>;
+			opp-level = <4>;
+			clock-latency-ns = <110000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1812000000>;
+			opp-level = <5>;
+			clock-latency-ns = <125000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <2064000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-level = <7>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2376000000>;
+			opp-level = <8>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -110,6 +221,18 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq_e: performance-controller@208e20000 {
+			compatible = "apple,t8015-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x08e20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
+		cpufreq_p: performance-controller@208ea0000 {
+			compatible = "apple,t8015-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x08ea0000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
-- 
2.47.1


