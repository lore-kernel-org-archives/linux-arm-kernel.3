Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F371C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=; b=w3gYtI+guN7J/Ow7M4lQ2JL7LB
	r022ekxpvPb/yKS+2g9fELZe93Pp/xc/onsq+65M9WbPJoUlFupfcHfPlb56JHOtc9lHZ9gIG2mUE
	sHki4c5RPTEK6o42cvF4betzQgB92/d9OHzzlFruSjdsSL/8h8hj0cKOtidwAQ6vO3s2BwPx+90Oj
	okz+BDhBljQr/YH+i+t95Gy6ssBb6WRBc3JM5SQFV6lcaKNFXwTo5+0AZYJ6flGPDge0vvD1GI9/8
	215H4Woalfoi+kVGeuXrmUwAFTUBkZD6xRzoDPclgYRu4RUJu2BtvrzUEzSoVnQhCzdQ97Gg8NRos
	kt+ADNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eWO-00000008aMJ-38u0;
	Tue, 29 Apr 2025 06:32:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJw-00000008XUW-3EEn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 06:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=; b=VX/xi1BLV7EgSw+AG0HN6HBRC4
	6erVh25BRK0J+jLP6FnbzvmC95vxP/oJDivW3TI/+R2G9bLP1mMUQg1SiHH32V3oQspG6al0EAxai
	bayWaSUlpXl9WHD2H/QRBCVq7l2QGKDlQB+d95NXLYYS7L6H8AxhQGXK4WTxl2ifp4hjN0z7QhrW6
	jyj1sdDkNtsH5HtArvu38jOKGK1Ksc4gj33SSt5mbVXTd68FXhgkhXDEYsvoFK9nNg2dCzHdkbjLI
	kru7U+kS89KTdsRaBI1Dk7HPfXqJhOdrn/bDyf/aAKWRx38oqzM7ww6eN5Geac1iNYf/vmyBFbaX7
	NJzpp2Rg==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9eJr-0000000DD6G-3BX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so1551433f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907588; x=1746512388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=;
        b=m2/KFJ0zfYJq3EoRFF0cH0qbd6ygVuA9LlzdpSDAEwpDwiqAHL2pIu4dHWR6ylZ/e3
         2OOa5VZaTSTyUsNlruaEUXJKW/4ha3mX3sZ7Dui+QZjBnv77gt8RZJQlKm75UrGZqfqL
         xsaLEeMwS5j8B8/z0KakLjJbWK12T6IpEUg3At8qAl/ShLq1Gn1rCNN61OyeF2aKsq+4
         pweKF2Hc3X1FCkjKDU+yxJHWsoq0sXS/+XadGi8Bk/AJrRFBoNZz/U4my9WMIgr6PqLr
         Uz/SyNDBpKgJb8duWj+9TXI/ReC0KdiMaQRXi9Veu250sRaNJ6ceIZJ3LH+sjzW4NPrd
         vvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907588; x=1746512388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvSL5A3NEbhnwLKxo5uX4gVOmn//DTx9o8Z+/6mMK9I=;
        b=ciRIOhcqjKOPs1ZuRtHztt7am+zFdYMaREvvZQC6DEKyI4jQo8kQMvNt+bozaALWaJ
         TsVDLAqsDb1Ub5fRv4Ruw2Y6yEiznj4vdv+Ohy85JJOAMSxwq1zc3poiuAh8sbpelX6m
         SxmRHYwLY6KeuisZc43i06Mu0K/1dL65yyfbD+kF2W9k4ns+TPQVOTC5jgTq1nFon8NN
         lwDC9zYQGv7SOfqoqZb1YFuwYGqzKpyZzXUo+HTnTDzUvjuw53q5s071rf80NzYkhJ+D
         bX0yXCJ16QwY+KLyNg1wcj+Hw2VWy/uXiAPI6PkGojOsfVMGrHxowKazdVbJ3Sz/fOwW
         mQvw==
X-Forwarded-Encrypted: i=1; AJvYcCXVclh+Ad2DHC8RtdqoiP25ljN0UPXFfAelimj9hFia0Q5XB5B0BPEHkT0KW8B2cnDhmOp9+5he1Emz3ONfC4cA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1kR+bzANY+QOTC8x6xh+fRI03+q900BjEmzqRMKhUNaHdAwt
	f7CGpfLTy3c+uEyBcSr31jtEIwjIvBisuudJ9I24rX6/PGd1QLDLq/AGIPU4K6c=
X-Gm-Gg: ASbGncsKoRswOmnMlW5H3yty6TsXiPiakodMyhN2JTA9z0Q5zQnqNjr7deahc925FIn
	2HI8RadfR18NzZM0AqhUSER3RZCPMWSBcvvRG0u+g+H25jvPWXxQiwKTqQq6AYOAza7Z1A3GgDt
	J8rKjvRAKDx6pX9G+GV+xbfBhWYf76t0IwLOKMgwA6r4nBcsMVxhZtoRZhkZuO9kq2V01dX3+6A
	oakeXdKKRYfkqn4TMlRnAsrcgvaRy8mNaymkFSplVfNTld2BkqY8lD5+y16Stq2Mk2o71RcWtYN
	gTBCzuqt6PFeWlSjQBdWkmsJe3Bskz6RNaS2MclxlwUmZ5aO9aGd8AiwvCDTcx3ODQCzT1P5NL4
	Axdh7qA==
X-Google-Smtp-Source: AGHT+IEcKdG2wRSBuyM964cxTaQZshEIOKScbmwqkmDiGlGNlBV7TvAlb1MWRX0R+pVT/zg3VHmYyg==
X-Received: by 2002:a05:6000:b08:b0:391:253b:405d with SMTP id ffacd0b85a97d-3a08949feeamr1569115f8f.41.1745907587765;
        Mon, 28 Apr 2025 23:19:47 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:47 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:41 +0100
Subject: [PATCH v3 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-5-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=4lERTfOpiwQeYax1gfqq6qrY9EVnhKNheexOA0mzRzo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG99ncYW10Ircah1ax1HNpv/FjFikU/IRkMln
 bdyQiFvafyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvfQAKCRDO6LjWAjRy
 uos1D/9jmKnhe3CYlNEwh7yXAxDCImGNlTw6cTUunZUPcN2wZ9DIWuCRcKxKGuTnksOPcoFTWmp
 pyfIEO6irv/DPj8EqRwVINYRAOB+Nbfiei59d5xIQ5JbxszVSBtxLPWB48cLWxz51YX5MQvKggu
 oq3O5a+MvfdjJq7ziTwEPKNSZWDvWzFIdBqdzFZkZmrZR8hYqIIcKfogCbGr1Z8Z89ZJXZUAtJd
 felfmEdAieo/8ANqYyfbUNWiyOB9ltmmeE9a6vN+eJlkTMTCb4EAzPgT0RigCUWZcYe3Mx3OLDY
 IOVUADKvkmy5Lspe+5NloAfOMk6ykXiGkie35xyOMp1B2sg21ofViavTs4X3JCZqdlu7hnKwlcs
 WIh/MZCYkHPgK5LCowAq6aKlpr7VFfHcEZcuGQAYAMNP+s6VsdN7qVjt127tC9JYzpjg7TYBlEo
 DRPr4MHdfogDykdyxKDNsxvUxb8/xLhKHgNyZeWdPDeMH+k7y1XeAyZvSREaEzWbw/m5Ysh0C2w
 7go/XpGglUAF3wO6z7LJIhH9xsvlsR3B3uOQM8r++XIfTPbelascCioSbygRRIWezYPYa/aIGeS
 /DEppxx6uaDGQU9oLl1qw+KfEeoBqYC5xMyjaiNp3TLFsBSVPdX2zcA0zpWzOo/TUaNq31eSqXB
 on5R1JS4J634ycA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_071952_051471_4FC2267D 
X-CRM114-Status: GOOD (  22.81  )
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

Some additional register writes are required when hotplugging CPUs
on gs101, without these the system hangs when hotplugging.

Specifically a CPU_INFORM register needs to be programmed with
a hint value which is used by the EL3 firmware (el3mon) and the
pmu-intr-gen registers need to be programmed.

With this patch applied, and corresponding DT update CPU hotplug
now works as expected. e.g.

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online

Note: to maintain compatibility with older DTs that didn't specify
pmu-intr-gen phandle only a warning is issued if the syscon can't
be obtained.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes since v1:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmuintrgen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor number (Peter)
---
 drivers/soc/samsung/exynos-pmu.c            | 80 ++++++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h | 11 ++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index c40313886a012304b3f345d5d7369f15713eb857..41955ec2ccdb955b2d0b969651fad1a344628f1b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
+#include <linux/cpuhotplug.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -33,6 +34,7 @@ struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
+	struct regmap *pmuintrgen;
 };
 
 void __iomem *pmu_base_addr;
@@ -222,7 +224,8 @@ static const struct regmap_config regmap_smccfg = {
 };
 
 static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
 };
 
 /*
@@ -326,6 +329,60 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
+/*
+ * CPU_INFORM register hint values which are used by
+ * EL3 firmware (el3mon).
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+		     CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+
+	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	return 0;
+}
+
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	u32 reg, mask;
+	unsigned int cpuhint = smp_processor_id();
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+		     CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu+8));
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+	return 0;
+}
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -378,6 +435,27 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+
+		pmu_context->pmuintrgen = syscon_regmap_lookup_by_phandle(dev->of_node,
+							"google,pmu-intr-gen-syscon");
+		if (IS_ERR(pmu_context->pmuintrgen)) {
+			/*
+			 * To maintain support for older DTs that didn't specify syscon phandle
+			 * just issue a warning rather than fail to probe.
+			 */
+			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
+		} else {
+			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
+					"soc/exynos-pmu:prepare",
+					gs101_cpuhp_pmu_online, NULL);
+
+			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"soc/exynos-pmu:online",
+					NULL, gs101_cpuhp_pmu_offline);
+		}
+	}
+
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0a49a2c9a08ef5bc75670551bdbf6d0a2d3e8ae9..0938bb4fe15f439e2d8bddeec51b6077e79a7e84 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -22,6 +22,7 @@ struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
 	const struct exynos_pmu_conf *pmu_config_extra;
 	bool pmu_secure;
+	bool pmu_cpuhp;
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index cde299a85384a70d04dae49ee9a4e2daa88fbbf6..c82b40035e9fa8fe6a673b829a75a50a707afb1b 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -660,9 +660,20 @@
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
 /* For Tensor GS101 */
+/* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)
+#define GS101_CPU0_INFORM					(0x860)
+#define GS101_CPU_INFORM(cpu)	\
+			(GS101_CPU0_INFORM + (cpu*4))
 #define GS101_SYSTEM_CONFIGURATION				(0x3A00)
 #define GS101_PHY_CTRL_USB20					(0x3EB0)
 #define GS101_PHY_CTRL_USBDP					(0x3EB4)
 
+/* PMU INTR GEN */
+#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
+#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
+#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
+#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
+#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */

-- 
2.49.0.901.g37484f566f-goog


