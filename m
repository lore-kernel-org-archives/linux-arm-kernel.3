Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16859C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZa735fH/TMPXiLLbcp+s5ZBvlVgx4jayqrOGdHzhjg=; b=ivw0CCRoXhLmG6cFZmd9eZmHeV
	QUNlOuR6EcziIudYKC92CHTP1EDJggxAWRR31kAaL0aBACnaIhBjkfGKRpOg0jRXBicNkZ8avNbIy
	/RY/Ker6tb0uzxRhO9k+2RJSHmrns8eh5mCJ8nV5gclK/JlYZYshgFmwMa5ZXzCyphtczsDxxtP36
	lD65VCdGwL3Hk62iji4kOxUTPDmiYEtjRhg0jRHxuLXaGGB5edTtofyXluBqWXPROzZncDnyF2r22
	7Hm0FCzQNmKF1f5Y78ogqMoJ/cSb3tAJSVJGjG6YtnTTQl1uVTkdKhLHsSjubcxebuvoL3FGhNTA0
	BswksZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToOy-00000003ysS-34zk;
	Mon, 23 Jun 2025 21:08:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjmg-00000003NG2-01SW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:12:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3609458b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695157; x=1751299957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZa735fH/TMPXiLLbcp+s5ZBvlVgx4jayqrOGdHzhjg=;
        b=epJUwMAKbwtLJGrjWiPU5c0TznNpgcbjCbumNphN2NM0J6qd0JNBcakWNWR39po7B+
         Uc32nNAhR9VMw2K0sfwZ1H2o25psiVM9QCN3sPhsh7lJtVR+qUObkqpI6r+pwoLnMkk/
         viEdCflV3/8b2XweEJPh8T6TgSpR+s6GbVdRORMOLvbaoxQr9GADts34DAIN1sv/ybfw
         h+f97nBkidgLRwViLsXQ1OnChieVM+k8ReRsRi/LnBJT+8n33yX8ONdc8pV6cqnpzAXE
         O7QgFGgRoeeSiE3QweIBu2yIUnwAC4ox3HPk/y4NmaEpM8fWj8r/X9xjbZ9Lc1EKB48d
         BeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695157; x=1751299957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZa735fH/TMPXiLLbcp+s5ZBvlVgx4jayqrOGdHzhjg=;
        b=S1gGmW16tc9kTmddsuGZO0a0+8LtHxU5vcVMD6C8YPaw/c9Up691uBKdst313DTJGh
         g6eSgxXigmjbEv4dNnt9X7h1Vd0q5VfvHck9JbWlhQ8Za8aH5UExggKPH8zLOov2WNDW
         TRlijm1GPpbhfpDLLguo/W0VP4vXczmvCX0wutub3msdJjBCYkl/ajJDrLWYZ1NQzbLD
         0uqEva/jg+/11dJ9WB1rClgMV/jZbTfWcqeMWVa3HYw+F0AN6gnkc3rYgG0rqSsnHm8l
         klMvoPdHmA3XmoWP1NqsB0jliJs/8Zai1EFUd5nCVWN05s67YXSvnXqW00mG/TzQhG1J
         pyrw==
X-Gm-Message-State: AOJu0Yz/EzIoPz91Uav8/Sb0zNPvzwMsPSB2HgAdAa1bjLNbmIwPqCm3
	a6VUk0w53uFCOTfIxChbjB+EuALT9JmH62pkQrOm1F0eMLMFEZ5c2iYf
X-Gm-Gg: ASbGncsttVAPioXsRXN7jtRGiUdojUVHSGs4n+NrcDfdn18xoVphfsMCYmSpJcJ9iEP
	1e3fjP8CpsqXu6bcLciHqdcH6V3VsglPwLteGddH+e7pe7WD7foFKNGEoyLJIytXyg4QS6OrxIL
	YrVR/e95gJBNQOmXgE1Oyo94mRKM9p6PsY6x70h6jyA/SxfZN/zFHB8mP3yIJwVB8djXtMdvCrd
	O/M7TWAUw+xUuMnloU+b8OG6T0tU6bw2Pqm13kGmpDr8sgb3Len4lfJsLpihf6Acm47j1Xn+50y
	6GZYYnmr7oPewOCil8fcZlwVC2vRRhfUrUphZVZtcdjMh0kTYHu4G76pMDQf9NnkIyekgR+v0rY
	veNou+McV6Ja5KaI=
X-Google-Smtp-Source: AGHT+IHbIPvjsHfg7Sb2eO5LgYj4ARuy56pLEb/egTFxA2oVO4ufvqtUM5hYA7WL45ggD7zMTd5CVg==
X-Received: by 2002:a05:6a21:4d8f:b0:21f:54e0:b09a with SMTP id adf61e73a8af0-22026e933dcmr21976430637.15.1750695157151;
        Mon, 23 Jun 2025 09:12:37 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:36 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Mon, 23 Jun 2025 13:12:26 -0300
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p-j722s: Enable freq throttling
 on thermal alert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-1-cc185ba5843d@toradex.com>
References: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
In-Reply-To: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_091238_049975_E2F224C7 
X-CRM114-Status: GOOD (  11.80  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable throttling down the CPU frequency when an alert temperature
threshold is reached before the critical temperature for shutdown.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi              |  4 ++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  4 ++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
index c7486fb2a5b45cfa2bd7798eb4746ad2af8c390a..138b9c395be4bf7bd6c1941d752871af8cc9b1b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
@@ -12,12 +12,29 @@ main0_thermal: main0-thermal {
 		thermal-sensors = <&wkup_vtm0 0>;
 
 		trips {
+			main0_alert: main0-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main0_crit: main0-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main0_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main1_thermal: main1-thermal {
@@ -26,12 +43,29 @@ main1_thermal: main1-thermal {
 		thermal-sensors = <&wkup_vtm0 1>;
 
 		trips {
+			main1_alert: main1-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main1_crit: main1-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main1_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main2_thermal: main2-thermal {
@@ -40,11 +74,28 @@ main2_thermal: main2-thermal {
 	       thermal-sensors = <&wkup_vtm0 2>;
 
 		trips {
+			main2_alert: main2-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main2_crit: main2-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main2_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
index 140587d02e88e9d391c41001643ec715d41bf262..202378d9d5cfdc8eced935117398bcf859088d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
@@ -49,6 +49,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +66,7 @@ cpu1: cpu@1 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -81,6 +83,7 @@ cpu2: cpu@2 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -97,6 +100,7 @@ cpu3: cpu@3 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
+			#cooling-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 14c6c6a332ef2f118e483744e97222865560e6ac..cdc8570e54b29d068aab4e2788a8b36dfa539cfa 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -56,6 +56,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 135 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -71,6 +72,7 @@ cpu1: cpu@1 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 136 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -86,6 +88,7 @@ cpu2: cpu@2 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 137 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,6 +104,7 @@ cpu3: cpu@3 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 138 0>;
+			#cooling-cells = <2>;
 		};
 	};
 

-- 
2.43.0


