Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7364BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/KAd6ZG61rvLfDgYI7Mlxb/svbdRtzyfwFEiO6AV1E=; b=tQcAdSy3EhifQAabZE3UdNcaAC
	jlBuZPlRuRPU24bBiiSlFmlw13WjI1g1Bb6cuxhVl7yh5cp5/fqIp/9JcvsceF4aFV9BZK7pwjcQj
	v4PHRJb4dd0FnoT4VtKl7JjGXhvG9UxqiH7l4INAMv2HiZUXNZ4RiVCn8zNwJO06TpJZjopQl5Xm6
	8RnkO8Vfy61QdxLEsJMU9LqSo5H/Q2/SKJeL61Eknvsqo2qW3OzDIbJIINRM6L0uIeKJ4uxmsPqsR
	aDnEFvBb9lYizIgHsWsf1dMT+bIdRES+19HzeBRosybYHZZfaUBHffijg1JFiwnsQPfLxhXxQmcwL
	4Bn2KMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQIc-00000008ex5-2yIy;
	Sun, 22 Dec 2024 18:03:30 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQ9C-00000008dpi-2hWT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:53:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so3134774a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734890026; x=1735494826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/KAd6ZG61rvLfDgYI7Mlxb/svbdRtzyfwFEiO6AV1E=;
        b=TPMjCaCd7v2MNYHN1LKaTuKMv4iNAeAVH+tw3rB6CU6dRHy5nk8KkOmmQUXEhhNX31
         fkU/WEkpF/nIC38kHwHFcxAKeIDvt4bUleVazXmaoVyYCo2nFQC4BWYKmN7A4UOE+7zY
         gzNUELRvG32gyVK3mH9SO/r+kZ248S8PMkVu+D4KmgaGhRCJOFQrVN0Byqj5s8yy7tnN
         6mFcblwPOopQ2oSugf74c3eL6Co7RAqYNWlzkI1yOxyDVuCQQrbmZ4pmuMkRw8g8QHFu
         L/uuwKoSa3wIPCP3Uw9JekkBgmNsK7iYxfhijLV4bxM9SjCSI8hSfrFmzmZdn7Fo8pg8
         0zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734890026; x=1735494826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/KAd6ZG61rvLfDgYI7Mlxb/svbdRtzyfwFEiO6AV1E=;
        b=ZjO5gitQV4E6OXamfGHQut9UgnubuVYsqU35T/wAQl0EAwpUpVN/nPrDLopX+qIOos
         dEBip5lEtDmxMQhOto7WevOFby/TZOJPCN6ELPzmhWskFNXq0VdQKrOmC99bVLmK14rI
         Ndo/Hfp5hPEHWhduiIUrav7DgjvTcpFIb/z3fotdrIxZtaNMOI8CZTwjgSeOAoGu7KH1
         BeDKBzV/3/L7ULYJjeFBRd0IX8IcqL2G84BuPXyklIzPAw5o2Mhojp4Bc+xULfxt9Kpb
         VQOD7PqHJ6GH/po7LcM8mDlCfNQ6Bb/gKxmzF/fQE2v9RJ94zZ/k5VYlFKFsu3yh8Ndc
         CG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW50ycdRML2YrtmKaUt9ZvRC53vyXb3mTr1S5Xs2ojkEAkDOFxc3CQuzysuMMJFKsSBuGtgeYj+MbmM0NArtMSH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2aKXN5DyzHYO95YSplMQl+LSzOFPXA1w+Au/6qUGtNe7DDHu5
	SZGpuIUgvGj1u2gJsQIfgmoHQ5jiNtzh0iXof3lJm8CYKT3lUSQu
X-Gm-Gg: ASbGncu6YmlBMyu10nVvPjMZ4d+9qligHn+gqzd8pfwpa5HvJxMj+D0DwDOAp7qVDZ6
	7CCVkicR2Av//ZYz/33ntSrdr5BzJlEZ9sDz9mX+nJmLTAHh0AY5LJLVSUWHUHZsvHGCbyaXcUl
	qgmh4yazdLJB+5d0nFn5eVepJZ12+4ngoiLD/OzeCck8He/yL0xLM/fNrXgHoeODMT1X9/cr/v7
	3Bs6iXDJqasp9A7RLkORhIJ9ZdmVooEmHSQbVI2sI/q+Z1LSugmNH2pzA==
X-Google-Smtp-Source: AGHT+IH9tlB/rmfezrDSl76YkabU54LtEQtOU5kl6hHg06X9hhNLuJNfsi6jeaPgR5oNfIdZXyn2Bg==
X-Received: by 2002:a17:90a:f94d:b0:2ea:4a6b:79d1 with SMTP id 98e67ed59e1d1-2f452e149bbmr15214572a91.11.1734890025758;
        Sun, 22 Dec 2024 09:53:45 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca04c33sm59503685ad.247.2024.12.22.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:53:45 -0800 (PST)
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
Subject: [PATCH 7/9] arm64: dts: apple: t8011: Add cpufreq nodes
Date: Mon, 23 Dec 2024 01:52:07 +0800
Message-ID: <20241222175314.151437-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222175314.151437-1-towinchenmi@gmail.com>
References: <20241222175314.151437-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_095346_682160_71B9CCAA 
X-CRM114-Status: GOOD (  12.21  )
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
 arch/arm64/boot/dts/apple/t8011.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 6c4ed9dc4a50..3a3d5b615a6a 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -48,11 +52,80 @@ cpu2: cpu@2 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x2>;
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
+		 * Apple Fusion Architecture: Hardwired big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <12000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <135000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <448000000>; /* 768 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <662000000>; /* 1152 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <804000000>;
+			opp-level = <5>;
+			clock-latency-ns = <122000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1140000000>;
+			opp-level = <6>;
+			clock-latency-ns = <120000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1548000000>;
+			opp-level = <7>;
+			clock-latency-ns = <125000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1956000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <2316000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp10 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-level = <10>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -60,6 +133,12 @@ soc {
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


