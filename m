Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1017CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MH65Y4Qlv5+yAPCv0rUtck+DoTMzMhWmQp7zLk8Sxo=; b=taRcAyp0ko/HgLDjDkY47rruTi
	lMtkflbsaktBE4/Xxem2Y8TbDe9lue3n9eG3A95KebByWj9e2w1zDVX2c74kw5HToW7dJguUns7e9
	9JZlMYVmCryoxsYx8SWmCENBzNGmwMXRb+/Dzejkhw7GLFMtjDmM5Xs59jpbUuX2u8ee8qVQyMWwn
	63VVlpYABq5yBJ3aWDilL6/rzmYKcWKB+8SKtIEEsfwFT07QdYm4leR0hJLa9u4mN0RM2lVS2LgnH
	1I3x7gM2WSqVxa6LzxwrMe6VX1H49w939Me8DCRVAiiw1v09gOXGcAB3+z+pGICZt75dIjO+2sSCZ
	fAXdw4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFV-00000002BFJ-0d5S;
	Tue, 29 Sep 2026 03:11:21 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFD-00000002BA7-0ljD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:11:04 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso22667745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651461; x=1791256261; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MH65Y4Qlv5+yAPCv0rUtck+DoTMzMhWmQp7zLk8Sxo=;
        b=fo+TA5J5qd+H3cC8A7JMtyxdw6zowB7l1+gCz1fbnA3DIIxuyAW6LVRydT35H2V1fC
         DcmNuO3jr08MB36HffA1UfsbSEeKoaBATvS9CrXpOtwrXYLgeb+kHALB7PCW2HtYR10G
         gLda/rFc108q+8CXCFNwjrywpWeGPa6ifR/3X5LPn0xdoSISUGM2wP3H4kqaW1acA8kT
         kD3IM0ySCA/x23oqTf1vccIo4ZeX1v1vcsWek7xhVKbeEUx/20TT/Oa7Z3JAyZkNVY+P
         +RG/7mgxkYZwMTYRWiIj6O2nH9YxirXnq2AQJ01C9oeOnfBmZrMsoFHfQx3JZAVn21FA
         2rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651461; x=1791256261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MH65Y4Qlv5+yAPCv0rUtck+DoTMzMhWmQp7zLk8Sxo=;
        b=m4W/o/0mzlzdZNWpjLeCpOdSM8wio5TNHklUPeDQ8U4NUGXNT9NmnOafzH/D2J+HZx
         CbH8Mk/horrfgRYKarZsY3tAoAJPmZGHq/skhTwUAoWW9B/0FcCifW/UJ+K7d/JNOJUw
         /v5xA0ZsjL4zQGTjnyoKgyWA8T350yL6nmTpdW1SbxdQcPIKG88OjVQMXcRsqwPM5l91
         RtIDmTEjc+ETCGy6/++6DtReuU7NSWqpGwd7rgzcXQ5hm2uhwluHqvEMQtWSWqDp+bpk
         akC8PIs6YhyeJyV6z5jXd3U57fBLYIA6XK4+oUXhLQoKtcnLmdqKGOsVJ9BFopXC4ns4
         hMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj19iT17laNsW+nE0OfG4lz+evvtP/wBJKnLQV7gmU+BO7Ig+cyHlWJYkphJAMSGUNtO/iP/GV98XyNfPQwIz4@lists.infradead.org
X-Gm-Message-State: AFuF++lJCCWP/SLvzOXWjokcEzdIntVDb3znrBphaXnfosrjsnN3t3II
	k5hwZZQB/pLmi+bBgB6FLmXEdXTqqvyt9VBmY2GlXecaRNaPVAj/TNOuW7nvjO4DAjY=
X-Gm-Gg: AYBFou07YK/Bor7ei9DowGc/e6uQeiMEuXs7uk4l3d5hlO1WQ56BPGdY9nNM+zYAaMo
	8n5PxmKkYsqUvsuKl5dVcWq+kS3JRgLHW0aE7C5r0GSUP2CktOndNVNb3K+hoM/5+Sz6051OBP7
	sdfhHV/nUOcVssBmhRvpvG05FTyeZj4bkiNHn7ZwrXVZCmp8WkvKJrrIcD3MYXLhjuaEvb4ThNK
	blyIizFzlEz369D7vgdCEVOMyF6F0sFiHsXP+YXvovP8m2OFFQCNQ0M3i7NUZ1its20ejUvwWZ+
	18pXMfVVg0vZSd7UDVpkCOS2VHNDxp8LgHf2ixZcAb55KARhUugaZ3smIL3ps9rlgwB/iJAbYvk
	3JmnNFTRTijAPhu6M+/3Er/xfjAMuax8tY9QvTFMLjcJJ6Q8l0KNKGHILstYLUEl44//n98di4J
	TiTal+xZaby3jBtQXnjcK4ldQNdfSvS+JgasXuKrjEIWivPp6M/ohkP9erNoOlpr3TLtD94o68J
	xjSEy34AgUVUZ5ZI75C4Iid9WK0bJMuXpMXWWbBD2uOo9UAjLkqjgFXp0bfNw==
X-Received: by 2002:a05:600c:1907:b0:4a0:f8b:e871 with SMTP id 5b1f17b1804b1-4a010221dfdmr4502565e9.35.1790651461535;
        Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:48 +0100
Subject: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201103_271159_BD96259D 
X-CRM114-Status: GOOD (  13.65  )
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

Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
identical for both clusters.
Add OPPs for both clusters and replace cpu clocks with ACPM
EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.

The maximum nominal frequency should be 2.002 Ghz but at this point the
following OPP is not added here:

	opp-2002000000 {
		opp-hz = /bits/ 64 <2002000000>;
		opp-microvolt = <1050000>;
		clock-latency-ns = <500000>;
	};

due to stability issues. Testing on a fully loaded system with CPU-bound
tasks triggers data aborts and illegal instruction errors at 2.002 GHz
after 1-2 hours of such stress testing.
Running the same workload overnight on a CPUs fixed at previous OPP didn't
lead to any issues so opp-1846000000 is currentlly the highest one as it is
considered safe.

Higher OPPs can be re-evaluated once thermal support is implemented.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 91c6cee8f483..36501e5903f8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -100,8 +100,9 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
-			clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
-			clock-names = "cluster0_clk";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			clock-names = "cpucl0";
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu1: cpu@1 {
@@ -109,6 +110,8 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a55";
 			reg = <0x1>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu2: cpu@2 {
@@ -116,6 +119,8 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a55";
 			reg = <0x2>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu3: cpu@3 {
@@ -123,6 +128,8 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a55";
 			reg = <0x3>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu4: cpu@100 {
@@ -130,8 +137,9 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
-			clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
-			clock-names = "cluster1_clk";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			clock-names = "cpucl1";
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu5: cpu@101 {
@@ -139,6 +147,8 @@ cpu5: cpu@101 {
 			compatible = "arm,cortex-a55";
 			reg = <0x101>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu6: cpu@102 {
@@ -146,6 +156,8 @@ cpu6: cpu@102 {
 			compatible = "arm,cortex-a55";
 			reg = <0x102>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu7: cpu@103 {
@@ -153,6 +165,210 @@ cpu7: cpu@103 {
 			compatible = "arm,cortex-a55";
 			reg = <0x103>;
 			enable-method = "psci";
+			clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
+			operating-points-v2 = <&cpucl1_opp_table>;
+		};
+	};
+
+	cpucl0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-130000000 {
+			opp-hz = /bits/ 64 <130000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-182000000 {
+			opp-hz = /bits/ 64 <182000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-247000000 {
+			opp-hz = /bits/ 64 <247000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-351000000 {
+			opp-hz = /bits/ 64 <351000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-442000000 {
+			opp-hz = /bits/ 64 <442000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-546000000 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-806000000 {
+			opp-hz = /bits/ 64 <806000000>;
+			opp-microvolt = <656250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-949000000 {
+			opp-hz = /bits/ 64 <949000000>;
+			opp-microvolt = <681250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1053000000 {
+			opp-hz = /bits/ 64 <1053000000>;
+			opp-microvolt = <706250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1157000000 {
+			opp-hz = /bits/ 64 <1157000000>;
+			opp-microvolt = <737500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1456000000 {
+			opp-hz = /bits/ 64 <1456000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <875000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1742000000 {
+			opp-hz = /bits/ 64 <1742000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <981250>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
+	cpucl1_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-130000000 {
+			opp-hz = /bits/ 64 <130000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-182000000 {
+			opp-hz = /bits/ 64 <182000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-247000000 {
+			opp-hz = /bits/ 64 <247000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-351000000 {
+			opp-hz = /bits/ 64 <351000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-442000000 {
+			opp-hz = /bits/ 64 <442000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-546000000 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-806000000 {
+			opp-hz = /bits/ 64 <806000000>;
+			opp-microvolt = <656250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-949000000 {
+			opp-hz = /bits/ 64 <949000000>;
+			opp-microvolt = <681250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1053000000 {
+			opp-hz = /bits/ 64 <1053000000>;
+			opp-microvolt = <706250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1157000000 {
+			opp-hz = /bits/ 64 <1157000000>;
+			opp-microvolt = <737500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1456000000 {
+			opp-hz = /bits/ 64 <1456000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1586000000 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <875000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1742000000 {
+			opp-hz = /bits/ 64 <1742000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp-1846000000 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <981250>;
+			clock-latency-ns = <500000>;
 		};
 	};
 

-- 
2.51.0


