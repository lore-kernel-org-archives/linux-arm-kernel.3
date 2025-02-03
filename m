Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lIMfLDS7ciYVJaacV/5/yNLSo2GoGCnILtlvH/Xs18=; b=n2z/WtyK9vublzEqLaUF7hp31b
	0WK3Gi1vG7PeTgLh+Df5PUZGf3JQAuIasK7o/1+Ire0QVADmzvniiQpQEYk2QX42rUCs2IfwDvIzy
	qaF4dTqWTIlxTwVLjdQXmPhopNz/MGK9pIx6cnGkxxP9MCIu2pP+TNZKppkMAPWA5G24qB7tZ+Nba
	9cGWIPNzg+Ru491gxgzLUWzkEYv6XS08uc2y6naN6AGpsn/Aq0IWVDW72IqtbOSBQaCOsN8VG++T2
	d7kmwODmEjeGvqwkaQQenoB+W9SU2jGZyDGZ4zV0pajO/nV5YDvgf3CFylK90J4D20Q45VcBn1D21
	axH/iVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew4A-0000000FSKv-0uoK;
	Mon, 03 Feb 2025 13:00:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsm-0000000FPiz-31fx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21628b3fe7dso76580275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586936; x=1739191736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lIMfLDS7ciYVJaacV/5/yNLSo2GoGCnILtlvH/Xs18=;
        b=m6QR/SFyXkU8RCUTeO43sBmg+Y4SwjEvTW+BZFqZ+PA8AdjajSAO3E3jxaR+C3cRpb
         VavNE9igwbzq3FvaLhS3u9jnkThMfX9B4UXIFDpXEf1QaQ0fmM3F1pBrf73DqxZ7ae7F
         oQaRiTcYw7BWuWuAz0lR9kNcErkfHxJ7zFcWVQBxUWWEZOwVxGF9cD7LJStTSX8iaM56
         yisWXjGky7oJ65S8AbZdMKIKnEZeEd8uYFUKuyomOXLgTDfERRYdn7LDALf/n6Qajepn
         RC4BVRkQYS4LQ/IM0Dbptkn1QggsiDDNMDzlRZat/iuz1ljTaU9rnDZ5f0TzicvHXMJl
         J3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586936; x=1739191736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lIMfLDS7ciYVJaacV/5/yNLSo2GoGCnILtlvH/Xs18=;
        b=Uzyxq9SV32S5CoN3IvzdoQS+WEv1q+EpWPdttfDAFaTgV38dQP0Ztxx5mzXQRtRKNQ
         slwZxdlc2tAvU7xSarD9amv+F1h1FyVci1yfj4MlW6bDnRTKnE49cV4GxXva0DvmuZz5
         hGJR55dxvr+1LzDH+xy3GgHzsG8etrBSr08P98AIFYH7iC6sWmsan3yO+B9Q1GhLnF5S
         pO8oYKwMoRnKegH3iFXE0++pRYzFNnsbFEwOyraNrswEohZrhQZYvdrtvhNjxT3VC4if
         EQknEGZ4MYXfF9o+ZoPwCh4t2LPZMib7/Y3VXy8jg3BkHNdmXgFVwkmMW7g361linVSh
         0x5A==
X-Forwarded-Encrypted: i=1; AJvYcCWfyi3nO5SVtqijmtb140p3K+tVgRET2mqTkHfNXTOdbKqo8EAnp3F7nSNnqUCD/kywzZO8NzifMjf52MH0vkMR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxed08/YjfNV1qXnF4eVC0hu/FUE1ENpJQ4r/zlTbT0QzZtuJjN
	A6+f03shliPLu6LZHh/38Fdw+O6AlPtNBJoh2fxdWrIZPces9qDs
X-Gm-Gg: ASbGncsW2owe+JGeYfIzDO6noVzuGsfmoN1MLL6PZueGO+IjPlNIbxY2uSolnS2LxMt
	QnrmhJMdL0/5GQyuRIa0OM4LH8iggpvIgcdude3Wfs6Z8fsQ+gJULVNeOBrcENb9Ul45M9yLRD+
	6YpcBhKZGj6yrndbvvL/CH3ohTwMMY+1ciqvLEr2YQ712oUF/raYO1/dL+22OcgV2Wz/m2OGe5l
	9SER7SF7lMSjNnBSyukSakF3sNGt6NRd78Vbp0oOF29BzcV7lvPxroLjcaaA/pojCIVX39diDne
	l4u6MYiZ//MGRrgg
X-Google-Smtp-Source: AGHT+IE5O/mt84A13nB307MWJ2yfB1DTRAXfmTvFWwSh6qD7FLx3uNUv+6iuiz/FJYYQN/49HMcc7Q==
X-Received: by 2002:a05:6a00:3a19:b0:727:d55e:4bee with SMTP id d2e1a72fcca58-72fd0bcdb7fmr27092002b3a.1.1738586935972;
        Mon, 03 Feb 2025 04:48:55 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:55 -0800 (PST)
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
Subject: [PATCH RESEND 8/9] arm64: dts: apple: t8012: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:47 +0800
Message-ID: <20250203124747.41541-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044856_757570_09038A58 
X-CRM114-Status: GOOD (  12.86  )
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
 arch/arm64/boot/dts/apple/t8012.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 45d24ca091b0..0a3d5a6bd047 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@10000 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10000>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,86 @@ cpu1: cpu@10001 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10001>;
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
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <130000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <130000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <130000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <150000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <150000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +129,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a600000 0x0 0x4000>;
-- 
2.48.1


