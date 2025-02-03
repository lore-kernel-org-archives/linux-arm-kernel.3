Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5005C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=; b=09mm994Z9q3r0hpX3BaOnRJ0Dc
	wLtiZnIafawQpHnFiSYbYV865UmUff6+QDSdW9bS4GwFT4o+aIgYzPRWcWqae9bPP9P8aQ9k/cbbg
	JMvoZuqtBS24LpX0iuXzS+SvsrrLJED83hwwgd2917CP0M5GGPce4P5LhGeh0Tmhsp9B91ggwyvwR
	ze+0CPsNQXcBCxFOZoSRPkJe2Qmq6HekAqHC3T7MPDlfe7+aiBkiPqYnsUXknNtjhWMruHwjd3w1+
	JW1mXobruNnn+1vIj136E29OOsFt7i/iz2O7IgfXta3nA+/ao5k+wix2PkbRNyFM4/rjF7MC/u3Sv
	Cr70EcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew0H-0000000FRin-0uu2;
	Mon, 03 Feb 2025 12:56:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevse-0000000FPfC-0pF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2156e078563so60883335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586928; x=1739191728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=YCJUciUHBUqRhsPGKJWQq/bW1QEigd8INoPl8Rh7V65eQ9KA6sWPtqGK/K4I2/4Xcl
         u178gclUTryu4bJ39wY7pfin+b92oYyXgKVYPJIvjrvJYKabcNEyDNI6SG9Yx3r73hlT
         KPcC2PhyatigMlLjvLpuxeXAXDZ1QZGjkuHjWHPRpXMYc8qNTwsoG2K0K9MKG5jBIyym
         lcvppHBXh6iYTQQ085ynWB1/g/xHaGFgV1BAeIQJYRZXa5tOSE22ndLxKDUaeOh6c5Vj
         gwfDvEATLx2bmjVawYDrtfuqV9RBUels8CalhVX2tzikoMnJp9RTtrzvAhr/MBE2oP5A
         NRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586928; x=1739191728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=BrX/t0OZe0kIP+UTMBmikJpLQ3q+oZxkanJ6GvYBgpy6a4nQ13d2RrJP9oMrGL8MFk
         2AVFWjWSVJjKhOhvYYl0KWRPUV+yPHRLGQSv7g0nrXGq2/3zlEbMn7Tba7T3BWotBWL+
         PsBz/HEfTa3ays9A9Fy5CrPoGYKxcm1e4RybSYM0DtjuAyLTZNtmV835OzEPDBFUqyrq
         SP4iHU9jA1LT2sl+KK+ESjASIyD89sQDzeuxKzvTENcjGodQtL9WfYGGJan4SulHxDKM
         Z86QD/9ZEX5dLUHqBxFGyc8SFDHkqsbqGvLRpW+bX3MyjZuZWNTACDKa4PaVu6dQAf0Q
         PRjA==
X-Forwarded-Encrypted: i=1; AJvYcCWin2xCiNpxLhR689qV5iwjxUDCjI6I3DSRyzXF748bkk0EbJSCG9fdZF9q2tzdVbMDbZfYSHiYxQ5d3CBFvlC3@lists.infradead.org
X-Gm-Message-State: AOJu0YxYzklxsVDyImY0kMsxy/sisadPi6VjJGb0rZZEBGCy47MDJ7Vp
	xV+ujOluqNyUUn7nYhTxVejfINYvG2OaAhWLgH/kYTy62LRBCdP1
X-Gm-Gg: ASbGnctZ3W4pUKi/hid92ge/Fy+WMwu/qbTV0A9iODQU8rJmp7kZsVmJ+Dr2UTNrlDM
	jFYwI8XLtxU2ux5oG9csp3YbwBcQ6REzoAio/cFuT+JQDsx+f2MYJ6dR+7dWotO4Lxh7gPA52R7
	1GpYBVYa2LOqEq8tTOBBClKi1WXytNOiee1RdIfm8RfW8uOQxi8Amw+0QJFzsh9gesZhIvYQdPQ
	hmqlmo2WKjE4+mfAv71JVUAVdlmjpQ0fct4VHOYHouTnWG/6OFlpmk6CLkijICWfeB1pVEqWcRc
	3XVKon8+lzpAwi0I
X-Google-Smtp-Source: AGHT+IE97aEIk8J5W1tlC12SvmYrsDcjP5pgG5OzlyrxMufGM7t3dgewYKr55GaKek+1e4q6nn56sw==
X-Received: by 2002:a05:6a21:4cc5:b0:1ea:f941:8da0 with SMTP id adf61e73a8af0-1ed7a640c2cmr37123084637.24.1738586927673;
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
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
Subject: [PATCH RESEND 5/9] arm64: dts: apple: s8001: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:44 +0800
Message-ID: <20250203124747.41541-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044848_232437_11F9453A 
X-CRM114-Status: GOOD (  10.88  )
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

Add cpufreq nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..7f7cb8afd3d3 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,62 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <53000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-level = <3>;
+			clock-latency-ns = <18000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-level = <4>;
+			clock-latency-ns = <21000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-level = <5>;
+			clock-latency-ns = <25000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <6>;
+			clock-latency-ns = <33000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <7>;
+			clock-latency-ns = <45000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <8>;
+			clock-latency-ns = <45000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +105,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s8000-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.48.1


