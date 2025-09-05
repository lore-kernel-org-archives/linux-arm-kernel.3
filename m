Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbHadlRPNZHf4QM7oZmMpzNXcctgtaP/Xq2UPJ6KP14=; b=cqrLQiuv3JutlWyICXQGmv4XAQ
	2RPGu02wCfA2HLI2qBCAs8rmZnqCxHyeTCJS9p4BXU20xfhZp3+QYP1GoSCh9eJ3TW2tinckOpGTD
	lex+Apqbck2iJ8i4CUgaAuNmeSMdX0AXMgLkW1BC8Yi8DTdpEbIO01tg52Sf6c27k8/ogdQrPWGzB
	1M/XPF6TufmV6JFNgc4s/ebLMrQK4WgllNxttp2r5YwoXF9uKokaJ+Fqmh03TwlCjaYZ8+nK2OZNi
	Epq7P2JjJaxFIklP9FwcBg9luy3KB9Q3X9Lue9QZ0sE+Rl/M2pVeNT6NMUdAV0BREsCqpA7NBr9hN
	WDLJ8cjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYe7-00000002rv4-2ufq;
	Fri, 05 Sep 2025 15:46:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6y-00000001XQC-1KmQ;
	Fri, 05 Sep 2025 12:00:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77256200f1bso2119457b3a.3;
        Fri, 05 Sep 2025 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073611; x=1757678411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbHadlRPNZHf4QM7oZmMpzNXcctgtaP/Xq2UPJ6KP14=;
        b=JBah71Ay9qpYn6UnHoztM5ejQFc8XUyLQUjRc4O+g5keK2QtJRs3LIuVxgHlfBgMMx
         pVLnxIhJLtNXEuWBkg3AR73afWKzErkpXuShWGHfS5HebePFGo6u2BCMCAlnjBWOtM3N
         twapWckXYVQkYxTo+T94aSvcA7/eEN6jSACN/RN7AUAsAilUF0P0JboyuvsNHEWSvg9S
         nYYTEziDDQ1nt2bfyALrLWpbWsf3du37dMiju/pws0lQ8NK5MjCoHnIw5GMyzuYMlFch
         +hikeok7ieIDUzdcA3W8zm5bGGPmEiO+sKuA1c6q+/J0mmCmk4A6AKmA9KTzQQAC/szD
         ZCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073611; x=1757678411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbHadlRPNZHf4QM7oZmMpzNXcctgtaP/Xq2UPJ6KP14=;
        b=g5o1JbW15RJtUpLGTEW81i42X+32J04pGrdeIE9KRcwMUrl14I2RagC8yVCpughabh
         kqjqFM64Qg9Gp0jdwFrp6DxVvc+Q8k0LJpXYBTLmQw29ARNV5Y5u2d4dtzQUtSUQzNtw
         t0ktAMdBLBtVi8yXgQNBHQVGRRjl23QwCFjuEVsaVVc6+h33NsjiogYJnA3QV87SN4SL
         YAdKH1D9A87ETuIRkmhf9JpNoRuAnPiuRnLPGk5vLvUZ9Ddr1GTIYpe/95tWgRHn4gfo
         CHXVhwWC8Zl1lQTbRxzjvdrS/fOE9eu935ptHTIujahAoHw4tMhsrO03CEqSBIBQWX2e
         vOTA==
X-Forwarded-Encrypted: i=1; AJvYcCUU9p/6y0f8vMJqXBP3VNy4rZlbnedMyAiz5fIuFHrzlWO1jXMN+Q/zo8ySSRCMsfbow6uyNH/M45jvtWv0pHItqA==@lists.infradead.org, AJvYcCW5iC62L1cQmF0uf6s8xkJO+msOYmZz3WmIFqgJHVMFJZlzXnF0D8Ludqc76U5DuZ2QLaV9t0ZzTZKOz2Je@lists.infradead.org
X-Gm-Message-State: AOJu0YyGQ95yEsscINiOihxjRu/aVgih63b8RA4Z69sOIf/sQfNpGg1T
	BzidqtzBHBmLYAbY+yuS7jbSi1KhAd8mnEU/6RiPVfmc+Y1jZWxsAH1S
X-Gm-Gg: ASbGncuEL1/iQVE6QBIMhiVU2SMSQS/afPl8nAgd85oinPqaQx2HWMlooakiZj+Io4d
	CX+xzG1iu666i9NmqRVCxsyOnb4HsW9a794iXtqHrNzDcyU1an5CcIcwp1/SbOkb8D2Rxyce12j
	Df1JinBoGJKqrraT0iQNWuTNPUPbRdeM66KhlnGsvSDmVTh/qnvn0UV+VMSTeNKxPDVALYKv+22
	J/Nm+TC1PoJpYaM/ka5d1s08+yBRcW4DuF0iN9lKR2dCPKZZpE14I2A5vNCx+g475kS1gCNhsg6
	ejykHKWcfPeLlFJK7cQstLSQkPTjasz2IJ90RcMtXeKTw4HSYRM0ZHqT/FtaZYr/PQ+1xpuM7Ly
	JHaJ436/ixXP/OI4IFrXy6cnRx6AM1Ww=
X-Google-Smtp-Source: AGHT+IEHzTd/Vu5HIqp5Obu47X3pNPJVxl9wP0t91OrOXzNkFGFINMn4lFyMzbYJuqchoSIRXpB1mA==
X-Received: by 2002:a05:6a20:7f8d:b0:243:c081:b4a7 with SMTP id adf61e73a8af0-243d6f85b56mr31346449637.59.1757073611194;
        Fri, 05 Sep 2025 05:00:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:00:10 -0700 (PDT)
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
Subject: [PATCH v3 11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
Date: Fri,  5 Sep 2025 17:27:42 +0530
Message-ID: <20250905115836.7549-12-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_050012_357480_C0D3D468 
X-CRM114-Status: GOOD (  10.93  )
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

As per T7 datasheet add missing cache information to the Amlogic T7 SoC.

- Each Cortex-A53 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A73 core has 64 KB of L1 instruction cache and
	64 KB of L1 data cache available.
- The little (A53) cluster has 256 KB of unified L2 cache available.
- The big (A73) cluster has 1 MB of unified L2 cache available.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index ec743cad57dbf..6510068bcff92 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -53,6 +53,13 @@ cpu100: cpu@100 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu101: cpu@101 {
@@ -60,6 +67,13 @@ cpu101: cpu@101 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu102: cpu@102 {
@@ -67,6 +81,13 @@ cpu102: cpu@102 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu103: cpu@103 {
@@ -74,6 +95,13 @@ cpu103: cpu@103 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu0: cpu@0 {
@@ -81,6 +109,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu1: cpu@1 {
@@ -88,6 +123,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu2: cpu@2 {
@@ -95,6 +137,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +151,31 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
+		};
+
+		l2_cache_l: l2-cache-cluster0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;  /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>; /* L2. 1 Mb */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


