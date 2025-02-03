Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2CCC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByLWdj9po7I8QCmIxQThyezzisERxr+NIkivv2+pP3U=; b=UJqxOQywXIdzQVnJiulOxZTGca
	EfCqArm/TFg5BKQ5Yk2h2xaITVowef4nMKAp3WgADvIV3GhQdtq3La9VRpw5R7QHxD/AvmbtDpJLg
	GXUYc/+BT/+fWir3FswLeg6w2rvK1KeOVi3WvQquWAchtwK/mPmcEHnLWCR5HWtNH21VoZlaMzlui
	eyuSNP/bjEJMEE1tpPWWSRPX9rUEDSGRW/+rJEFtjhFcz7e4Y6YzUQygpQMCPiIoSHXYW5FjJY0T6
	4lfpU9M+DWuJRnpk0KNJxy1hxjrhzOMUEdfYsHu+rbY880KNcWH7oL1YeQSweqBRfzodw0VXRpVMV
	TvomKxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew5S-0000000FSaA-3Uf1;
	Mon, 03 Feb 2025 13:02:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsp-0000000FPjy-1Qk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:49:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2166360285dso69734045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586939; x=1739191739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByLWdj9po7I8QCmIxQThyezzisERxr+NIkivv2+pP3U=;
        b=FVcZdLtdcbdaLRPIDfksCsd0q8i+lJbGDgGdOATX6FZJClcPPJXJHEg2q/CUTbPFUV
         uIh38b0ybKoj3fXQo51CwXOkX61UHoBgTV8Vgc6LY8cSGb9zkqMKwS5HvDlwI/6K1KxF
         QTunmfNb7FF6xDLCPGag4MsVgrXao6Y3Ej9Bb1NxgmL7FsYJu32W4zm0gdidg99qMDkN
         BCQ9L8sQTDi+wDEKbFfymIdqenhOH3Osini7eGq4PL4L6QgT4O+7S/QJ2QF9opYXFcSx
         +GS9Z8+utttcFgi+zHSHIIJbXIWlqM6l/D3y6eToCCXG6RXaS5ScSsMcRljH2Psckhvj
         9x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586939; x=1739191739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByLWdj9po7I8QCmIxQThyezzisERxr+NIkivv2+pP3U=;
        b=f6f4DC3zlgZ1JTRLQ4pK5RKQmHTJuA3S8ACUBabl2/GK15Jztko3CgmRYSWy3DG3Fx
         qB55lnmhPYTf9LewrL5Cus1FM7ZkGyhaqWo5ajrvMckJNXgKsr33Dtvk52jiRQ8s4+n1
         7i32ofK050LH4KXpsvCN/soHcWw5cNI0YZ6klUwQF6poOoZtcen0cPsKCLmTPvoC9vP5
         /gzNc4NmNoDfN/ML542yJ4lcGpuJrTqbUrkOuBdEmYG4nN3gNQZh/JEHM7VF1TmDhib7
         GfeUQXOr4L53ihjdVLcclPJ/zMU8Xt9bt/X2bUfemCJX7pwa4div7wQHpMfnTs2orpGP
         crLg==
X-Forwarded-Encrypted: i=1; AJvYcCVclnHeOSRbSeL8nzr1mKPFkdkGnZ54u4Uvq3pgNAzP0GEYVFH/J94fR/0VrPBYE/FiB7xqQMe3gps1X7JYdNi9@lists.infradead.org
X-Gm-Message-State: AOJu0YxSvBsrLv7/EpRW2Qhd6/nolWM7vwtqCaFlLhCVX4cYb+3U3/Tk
	mw24sDxJMOcFaVI1UGwMFKv3sI55OlKMUY2mwdUyAcphvKcnU2ob
X-Gm-Gg: ASbGnctswJprBx140ONoPqLqEwwnccDUgqMVODHljsK2itqE4sAonXpWvQ8iEhoPWtV
	416anZx018R8M31mWnfxXhCVSsZv8gBWXrfchb2TCMHd2tSrj4VNfA64+7rlc9nHt57ekyVtkpG
	U0RCRm7d4GUh0JShfLGr8TOx51QRjKcUmzs/0GOwBG6AnGfwj42iOyuIUqsSDsK2tcjPGTsnhjf
	ph+4YPHltU0t4KCtv0+tYMgVYF4APrYrZ1EJDZvkmbdTvLJZ1rZs7OwCwbAwkV6IFk/6z8MUxYo
	rNrrvOZvBG0Kcn14
X-Google-Smtp-Source: AGHT+IE+t0KDXYMwTSpBWi+pdAH/0ma6AXc8iXrbj2Cn/KnYaFBskDaPtkynAvbjwmSIRdQbgXHSCg==
X-Received: by 2002:a05:6a20:6a1a:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1ed7a6b78a2mr35007064637.27.1738586938754;
        Mon, 03 Feb 2025 04:48:58 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:58 -0800 (PST)
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
Subject: [PATCH RESEND 9/9] arm64: dts: apple: t8015: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:48 +0800
Message-ID: <20250203124747.41541-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044859_378374_43924228 
X-CRM114-Status: GOOD (  10.82  )
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
2.48.1


