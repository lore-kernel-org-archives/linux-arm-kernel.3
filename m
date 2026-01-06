Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5365C47BCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+UDtpL6lM4vuAVk9jto00GRYCIz320bVrU1iTMRz+8I=; b=xuYZFwMMcHRDo9HybfoiFMxxj2
	Pi9F7qKPO4ICFt6GMb+kx05qoj2J1S8Q4XUv4OE9tb9lmBOnj80HLkvXnK0LpKmnqJn4m6PXWeEHv
	7YXcVQfgu9Vk56HJu78zMpZLHVnD+oi+4daC5BnhhCcu3wz1yS1uZWlEPV03cFEKEgEVcla4zJw/K
	6Vl8sXVOVFieXHhm5EXc43F+nh+G+ECXw8arAGGKs5dX83gVl2f4d+QTrifPb30RmsWdDqq4iL9Sq
	TCBnhFQEcvJCv+f2gmqajicumS3KQ9Ns2Jg9mTccrln93XU6SgaOmacHcjQue3sPP0Il7EisCqrCE
	QIpGDq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd31Z-0000000CfJ5-26nd;
	Tue, 06 Jan 2026 09:06:45 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd31V-0000000CfI5-2Qvi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:06:43 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b79af62d36bso141184666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690400; x=1768295200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UDtpL6lM4vuAVk9jto00GRYCIz320bVrU1iTMRz+8I=;
        b=GrBYPWk8D7MxdtljmfiFK8Qf+iOex2GosMkoNaxTqkqXM5A/5yUAC1oCkKy1bNOUEz
         hx7zvP0bAHNo89qQRvA2ZuzMkzbY8Zd80VCInhVxAbMjlm6hjsPBAd/HsXR4IYHLUCJz
         Up9ZA8qWslEkSdL6skLzBlDnhb4LkRowA4uUM4x7mtb5i5I5Boajbj8zHrjJy2894z1S
         xfQRMo6icBjopRH48qPxinlgoeNywH0EWU8GjJX49U2NVELIv1IvbTtDCNLQuq1p9dud
         ws/lOmyRkV8BTKxgDnDYKHJhuQ2Dy6COBPeTuYKrDyuYAUmwf0XIng87dAWtKvW6qUH4
         TOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690400; x=1768295200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UDtpL6lM4vuAVk9jto00GRYCIz320bVrU1iTMRz+8I=;
        b=fYyhPM5JYbsksggkElM/XpekUn3Y4C9K2+CXGMzt+1hgGe5F94HFCzAOJ4E0XJxw6e
         AFS8/rrN3La6uDqV1Xox1oPlKY1IXSLDJfeDJ3ixSphXmz2PW1P9457M5GEEGyvoGC6M
         ot4yRWVWsGLW5FUn3gchsq0gXRwRdr6JoROHtE4uxeo75Ay+lw81hwFelZv03IcIkoVh
         rnb7VNgXUnPVRaGJXEF9Y4j9e3pflegQde1EmvMfQQirCdVoTRl7ar+vYzzJfGk/TPjI
         udmwmjgfRlKijheQ7thwLeQcpFvf7zRc7lMjvBMpc0zjwETxRMEzNUAAJb9PWQRXZQB/
         3/gg==
X-Forwarded-Encrypted: i=1; AJvYcCUkD0LeQx3BI2Gq+KHLNMwtsApHfRdp+3nz9vCSGEo8/7fNIvP0v7Xl+M+CL3Mf2ZkGwBy9Nuq19elPqLbsWry6@lists.infradead.org
X-Gm-Message-State: AOJu0YyQdkhA261QfWKVqdYrf54G94XuUiIlor/CRrfJelVrGIelHYbC
	CPdFP95h/gSAqIzenmgCoywf7OIfloki4Z5SyBqG16mqpC2SJy2WhQa36k/8ZDeY
X-Gm-Gg: AY/fxX6p6Y2SgrNWoySfPY68wOl2xFwPzO12BKWDP0KD5jyKUocKgzlNYRedtcAnhT5
	HyVF2YNuM8HePTcNatInCX6umdgDO0KceDdApoFupcodc1X0MIsLvhwgNfUROM5UhHoHSvZiOmv
	uNnCuGhnLcW3aXy+GfrqwQHMmVYkQuxIeFweOZPNNUknshpTHMuzdHUo6XlhMwZxsTgDcyGm5WI
	w50s7TTauNLbzBi4AdTM5Sne/7LNe7eM4BI4hZC1iwBT586id9tGiGgoQEplT/nr2eIuw6tXwBd
	6SbGTGSV92X2m1/gfiqbs+JdtjzKLu31ZQYycsdkqZXnGoQgSAEko9gSl91kVi/HlAjy9cTVHwK
	Z0e4oJeU29McI4VwjxzqrMABvxZL2tiXAIHhiVTCxPDGm5Lhw2Jp2hKEFEJC38j759YOu8jXIN0
	GCCLmCWgAW0uh5S+HtkOG9i5JUAJzlUc6aq9VX1KGTGox1kj8upD0A7Jfegu3y5t/J7pMI1c1lF
	ZRPp54858be52153xB+ssKL1jpNBXE3IWoa3Il+
X-Google-Smtp-Source: AGHT+IGufrA4+HmaWY1T8YOrH5GAe3yMLur0HN+Q7WGzqdB5vPitA8ejXoYkmTLuoOEtAMMIcBkOnQ==
X-Received: by 2002:a17:907:3c8b:b0:b79:f734:4d66 with SMTP id a640c23a62f3a-b8426a68039mr278873466b.18.1767690399471;
        Tue, 06 Jan 2026 01:06:39 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b127-0700-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b127:700:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a564e05sm176942566b.65.2026.01.06.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:06:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi
Date: Tue,  6 Jan 2026 10:06:24 +0100
Message-ID: <20260106090624.518117-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010642_229929_44E54CC3 
X-CRM114-Status: GOOD (  12.70  )
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

Move the assignment of the CPU clocks and the CPU OPP table(s) from
board.dts to SoC.dtsi to reduce the code duplication.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  8 -------
 .../dts/amlogic/meson-g12a-radxa-zero.dts     |  8 -------
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  8 -------
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  8 -------
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  8 -------
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  8 +++++++
 .../amlogic/meson-g12b-a311d-libretech-cc.dts | 13 ----------
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 24 +++++++++++++++++++
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 12 ----------
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi | 12 ----------
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 12 ----------
 .../amlogic/meson-g12b-odroid-go-ultra.dts    | 12 ----------
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   | 12 ----------
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 12 ----------
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 24 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 12 ----------
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  7 ++++++
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  8 -------
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  8 -------
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  8 -------
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  8 -------
 .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  9 -------
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  8 -------
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  8 +++++++
 24 files changed, 71 insertions(+), 186 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
index d0a3b4b9229c..abf6b63ea0d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -265,26 +265,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index 4353485c6f26..a85f383a1699 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -218,26 +218,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index f39fcabc763f..5b6716aeaae5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -312,26 +312,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index b5bf8ecc91e6..dd9da7a5ec5f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -405,26 +405,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &clkc_audio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5ab460a3e637..015e3c7e3a91 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -261,26 +261,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 1321ad95923d..51317d11f263 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -25,6 +25,8 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu2: cpu@2 {
@@ -55,6 +59,8 @@ cpu2: cpu@2 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu3: cpu@3 {
@@ -70,6 +76,8 @@ cpu3: cpu@3 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		l2: l2-cache0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index 82546b738977..5747acf8f337 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/clock/g12a-clkc.h>
 #include "meson-g12b-a311d.dtsi"
 #include "meson-libretech-cottonwood.dtsi"
 
@@ -74,38 +73,26 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index 8ecb5bd125c1..f15baa708b36 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -109,3 +109,27 @@ opp-2208000000 {
                 };
 	};
 };
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu100 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu101 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu102 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu103 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 39011b645128..7a204d324dd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -153,38 +153,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 1b08303c4282..4321d08d11a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -261,38 +261,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index fc737499f207..b16247e0df9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -49,38 +49,26 @@ vddcpu_b: regulator-vddcpu-b {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index d5938a4a6da3..c81d7fdbe2f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -279,38 +279,26 @@ &arb {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 /* RK817 only supports 12.5mV steps, round up the values */
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 3298d59833b6..88d995006f94 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -225,38 +225,26 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 1e5c6f984945..e95e193eaebc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -257,38 +257,26 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 19cad93a6889..eef98add05c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -99,3 +99,27 @@ opp-1908000000 {
 		};
 	};
 };
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu100 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu101 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu102 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu103 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 9b6d780eada7..4834f418bef5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -211,38 +211,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 9d5e28cf5958..7aff554085e3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -57,6 +57,7 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -73,6 +74,7 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu100: cpu@100 {
@@ -89,6 +91,7 @@ cpu100: cpu@100 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu101: cpu@101 {
@@ -105,6 +108,7 @@ cpu101: cpu@101 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu102: cpu@102 {
@@ -121,6 +125,7 @@ cpu102: cpu@102 {
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu103: cpu@103 {
@@ -137,6 +142,8 @@ cpu103: cpu@103 {
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpub_opp_table_1>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		l2_cache_l: l2-cache-cluster0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index 9be3084b090d..661e454ca673 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -145,26 +145,18 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 5e07f0f9538e..f0e4b168a411 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -183,26 +183,18 @@ &arb {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index a3d9b66b6878..4e1e9a502666 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -49,26 +49,18 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &pwm_AO_cd {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index c4524eb4f099..ad886d446e96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -248,26 +248,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
index 5daadfb170b4..2a16f54332df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/clock/g12a-clkc.h>
 #include "meson-sm1.dtsi"
 #include "meson-libretech-cottonwood.dtsi"
 
@@ -62,24 +61,16 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 024d2eb8e6ee..e275b0f36b09 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -357,26 +357,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index e5db8ce94062..8f5b850b1774 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -63,6 +63,8 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -78,6 +80,8 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU1_CLK>;
 		};
 
 		cpu2: cpu@2 {
@@ -93,6 +97,8 @@ cpu2: cpu@2 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU2_CLK>;
 		};
 
 		cpu3: cpu@3 {
@@ -108,6 +114,8 @@ cpu3: cpu@3 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU3_CLK>;
 		};
 
 		l2: l2-cache0 {
-- 
2.52.0


