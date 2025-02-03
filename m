Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41168C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=; b=Kq8Dvag/XQdkGPY8H06JEReLn1
	3rPf2LzXfoxwkVDtIqNvYD2o/ntdVd7H55gRjb20QEmCiQi5QNkLdQMFRpIDDGSZhMrhGd5SG/338
	OirkhGqwS4vuwQkRA9fi1/Rhxn0JWO0CIMeZMWc79nr1UwSYFAQakQLSMy03Sl61sL1YcYGzAhXWp
	HD/7cCxeod3oMvD+TZ6rG1S0aPmq5mhUhNruafAuG2fW4Jtzgkhowr73PW22rGI1naHldgcNYTb3A
	sg7bTre0HOLyWYqpvYKUypyoLUXJ1s4FRzHlVjVEUyNZnWfBCfUZ1xD0AK5n/QNZtdbYjcy80OFec
	csDTXjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevyy-0000000FRQT-2T9z;
	Mon, 03 Feb 2025 12:55:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsb-0000000FPe1-2Q7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21628b3fe7dso76576545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586925; x=1739191725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=gR8nCANDt/jJKFkE/5HKJLmi24UJ6pJo/z1wY+sdSZJs+QL8lIgMF7eD/+GsfJn9oS
         uWaDkMw2iLdmRxPBts+7wLie9cEux74n6m5Ad9YZd7rJA/0XLA7IraKvzssJFUTB1wU7
         6HJeFIe7o7PksheQl/0ZOjAkCsf3L923m5n6z3HZaE53BGftbtzZWYb6EYl7613Swu9j
         E4B0UomZmhZhjmZQxjpTPtXnJmca+BfO0jlOcUD48bpjtVVkcX7qpFMFNrzlP5eU1Rt3
         IUkSTqdNrI1qmxE/+xDIgGfZir25mMdkgjhG5CdaeMmgQdhx4nu0G8v2I82ddzuDL5zC
         pgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586925; x=1739191725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=trfrZ14N6yM5JVCMgRbQxpduxCWJ7X2+z5e/3KtYz2ekHDUdH3XMsYh1+AMA4H3yIT
         hYbXEdkqXLcRGI6UZG75LiPPwl//mHdhs31aKR+OeEshdKh0vp7MmBV9ifJIPhgs0u6K
         +OF+yY9SRG5aKFp0bo+oGrNqRJn9NqvsaukJnRm7iV1yw2BXK1SQ7h9P6wZv8XZmHnUy
         SMPFNbFISpH3twX+KzRzNPs2wTPIR+kQkMB8RHUkeUFEaT3ZuXZSR1I3NrDGHnQLX51v
         9Qijj9U+72BjuN/o4yyFEEApdSPplyYpOZzTbX62cIxWGEquY5sKvxRHE/thcSlsyLMN
         nYNg==
X-Forwarded-Encrypted: i=1; AJvYcCX2DV+J/mESZjQ61n1IE9OqnYhnarVCIOfumQhxvL3+aFdRgw+A/9s+Byn6M+WOpQmN6LDaZBLL3EOl/T/rSti0@lists.infradead.org
X-Gm-Message-State: AOJu0YxRtM4TyHqeBTcx10ilYJj5zfnA594DwSAGMRAgvBIjzeGhjS/E
	73O0c7LMgTpRq8rsDymcKF5p1GrEcRSl2B3A9Dwacl8jobLhnm9j
X-Gm-Gg: ASbGncsTn7ikfNj8/XEyDuOU2SZbTNN5H4A5ZSCWJPESe8XFHgr6HAVcRT1yK5uyr3m
	0n/GvViMLqsA8C3xTHCGNzidRYYGZHzTKlgBF9RYj4EJmER2gc7fGLI//y1pLbQr3k4sSu28AJh
	bjIXfxgXFpWUpYPVBgevuicgYvtrpsRSAvpPW/L75iecSybfia1UQx+kk+Gz170zVGznSDa6/+1
	6QYU/6HcIJNG5JCsJdZS/pBdhLkzlk2TyszL5DiFDYgpG92YBL8q0ZBCW6cq+f59Y8vMzI3oHbZ
	tNQ/sAGwZm83pbOf
X-Google-Smtp-Source: AGHT+IE6PRgepwkrjqG2OmOZ+7qNJydgJxtUoZkQAYGjXgBZv3DVPV0sBMuXLvPIDiaVI0vvtHLMCg==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1ed7a63866cmr37247460637.19.1738586924881;
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
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
Subject: [PATCH RESEND 4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
Date: Mon,  3 Feb 2025 20:43:43 +0800
Message-ID: <20250203124747.41541-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044845_627374_B0B69ADA 
X-CRM114-Status: GOOD (  14.20  )
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

Add cpufreq nodes for the two variants of Apple A9 SoC. The difference is
that S8000 is slower than S8003 in state transitions.

Change the copyright information in s8000.dtsi and s8003.dtsi as well
since these are now essentially new files with the original content now
being in s800-0-3.dtsi.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 10 +++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 53 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/apple/s8003.dtsi    | 53 ++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 082e5b1733d0..382d7be3f8ce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -52,6 +56,12 @@ soc {
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
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index c7e39abda7e1..72322f5677ab 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Maui"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <650>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <75000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <27000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <58000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <58000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 807e3452f8a7..79df5c783260 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Malta"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <45000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <22000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <25000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <28000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <35000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <38000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <38000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
-- 
2.48.1


