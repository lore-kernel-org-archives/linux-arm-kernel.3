Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF49CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEi2/PQdoB49OMbTqw0F1qOk8kSvaGQNIH9qtvm23Bk=; b=xykeTxdZdbd/nUUr55HKyTqZjz
	9Zscc8uUOv9bSmGOYIS+uBz54yR7Tv79rhWaGBqlDAA7PJlUvt4Ho9JQgsboC8XXyGyx5teVahpRd
	TxXyzSn/RphIv/wn0SfESaLmZRgMG2u6blk7wabfL8RzEM+svTnMwb36nSZlieDcLbmDeiXmnAVrA
	vAuDYT4URqv95gUY7y/uBjV3vFhydnJlyiDpgCLBY2yXzrzJ6MBkph0zOAJh1L46i1UDsI82vL2GB
	qviETUk73y6R0sJP/R3FFzxQB3NkeDKQFAe6mMzEhjVBbWu1xCcPhul0j+cc4UXyOZ0Wct52qLjdL
	RoxzmaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsxg-00000007QTo-3CiC;
	Wed, 03 Sep 2025 19:16:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoPi-00000006j72-0sgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:24:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso32371715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909481; x=1757514281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEi2/PQdoB49OMbTqw0F1qOk8kSvaGQNIH9qtvm23Bk=;
        b=nAx3kWcroPGmpEC7zpTxyOJ2vUUKtjUiRB5CDS+yvEw3V6FL3d2wbfZg9vwuYrDP+z
         6ilfhivM+c8VjVinBmiu3B3SekS2aVs2DkU6M1t248nPAs2fE/nAnVQmentdJrJWpHC5
         qQ5+DDgzcwUEBChBimkSwNKlNXKlu5G3w7QV+SUOGekX+ddn+ZLZS0OYI1nx4YqFiG0x
         II3tBlw3dWZdAC707m1PVG5Bv4lo+ZNsK+Jo90BP7hwocs+9CkoPb+QxRRvhfZla1GO0
         KqZtd+gK3ndjIZ4O7qHi6G9/6HRH/VpMCIUSo0RXv4bhDJxvBKRZPB0kqJnd7eE+AMqA
         VPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909481; x=1757514281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEi2/PQdoB49OMbTqw0F1qOk8kSvaGQNIH9qtvm23Bk=;
        b=KnZsN7Bp34CTAAheF5oAONOG88w7nvoPpyU7qvHCdzk5BpntiGh78bvRMojLU+QHwp
         q6IpzMpZtKD3i9dKD2SIA5HvswOOi/RvcSjGvqiPP918aEug8L3UlcG8EjNkGJcq7ixt
         +CSGj6Hklj2QCtJzmN/9JQoAa0DQYBx2rn1cz92KISMzezOwlVE5UI4huPkQzew3dEcO
         FhEIDA9MB3njY6reOKbkLh1/i+I5I2os2fRzyxCmO1Wo9AWoHX76C4rjDhPeCFK355ui
         5lw5OB8iz343WeGAha3sL5qkApC83gaVi84WYHgIysaVY/RpXphvm3f/rZ0i7gaxV9no
         gb9g==
X-Gm-Message-State: AOJu0YzCxGUJI+DBudz8v/cTX71v6VwlsfQuxWzqeFihp0JFxfH+Vb0t
	pqgAknHp/Cuv5F73GiiCnULHKeXKcP1HpjtT8s4wN9TgLMawyVR0AC3a6MedJguvjpM=
X-Gm-Gg: ASbGncuQm5yrSJnlJTctosv8P7lV85yyPQN+vz1GPA5U41cguZj2QgrdcZlNiiixvdY
	nGVyp/Y7GTIVrORIhR3KBiB++Q1WZK4JC/5i2xmYxECaG+bE8nBFL2L2p4zWcOe0dS+B57Ihgh8
	Zqr+mgdHA5o8V5vfI/7g0LAYVe1Fv573KVjn0MjFBOh1Q+rYbPVGOkOn3V+Fr0vb3ruz7N9X9x9
	V5Q+8P1KC4VOKW8OFeueQcHhzd+cDm+D99Sch6S9XN+i5jsKhzykREtAwH+IlSmCWLDcAHQepvP
	yCN2h7Ln6i1Kj5mztXXO/+AxZ/xlhE4RF8N/W1ADOLtuvW+XVtIa/mNO0NEGOz9896ax38vCZPo
	SjyDFTY47cnXcqGkN4Ny6dCZNd8IHYDMQGkEUR7CuT5zguJUFw1wQnJ/MUBtNvm0+GQc8RVh0WT
	p0Cp8PjFgPnymf
X-Google-Smtp-Source: AGHT+IGrRziJjTMwT25c2OkVilDIuZjFn9L5MCkwO866+qwMljC5rb2HmLajCHH5hfA9aOIzCWZjeQ==
X-Received: by 2002:a05:600c:3143:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-45b8555d6fbmr141415125e9.10.1756909480609;
        Wed, 03 Sep 2025 07:24:40 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm3996035f8f.33.2025.09.03.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:24:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 14:24:36 +0000
Subject: [PATCH v3 2/3] arm64: dts: exynos: gs101: add CPU clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-dvfs-dt-v3-2-f24059e5cd95@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756909477; l=3055;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DvCybsMaaovaYrXT+kGukCydj98f0jObaOksmSKLE7g=;
 b=pVxjq+o735XuRTrAp24zmkgSEQyM98WPeI5CRx0F32McSQr5++j2fb9E7h3fx6kzQhtnAPJ9Z
 MQlithbin71DJfR1JpELcCBTH3/EWVBxgk3BV+R9iKiPVX/zygYfDLi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_072442_254720_467E7EEA 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Add the GS101 CPU clocks exposed through the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f00754692bbac39fd828ebd4ef7c269f746f2522..e355fafe2276fdfbcb573600474cbdd26a654e7c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/google,gs101.h>
+#include <dt-bindings/clock/google,gs101-acpm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
@@ -72,6 +73,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +84,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +95,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +106,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +117,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +128,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +139,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +150,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.338.gd7d06c2dae-goog


