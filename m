Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D981E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sM+OHiF90yvvBmEBEkw7PlxOYbfepKOCjoVyVikB5ho=; b=siOLxF3HA2y2wmAScqidbe5z8+
	m/gn1b7IficnRVk8Y6Wgdjo/3pZLYw1FVnFZzJ/l9Fl/yLFi/xzxHYhrpBarj2QXgFItrbmIjkUpd
	jqqqXPJl/R2Ow9Hg4NQl5V7bfkNECO0mfD9lq3tj5vdaDTMMixXFJIsfhiUWAv/Opuh5hwUhFF5RY
	kDeqhsbH4iqRrGp7XNu4CdAqTrDIta9HokmG9co0rF3/i8uPK809Itg6qNGA3WdVT8EqQgB8y21qz
	VX3au6nXeHo6DXidwmEMPIyZUyEK4jkQq4lSfpayksKHRPOLYM0BYMG7Ky5dq6oBoovYLTAhXgHA+
	j6Hn5QcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8tF-00000004Tmq-2Unk;
	Fri, 13 Dec 2024 16:51:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8n5-00000004Rx0-3WF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso20017865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108322; x=1734713122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM+OHiF90yvvBmEBEkw7PlxOYbfepKOCjoVyVikB5ho=;
        b=sj0NBwQg/CNGxMh5WRIiqC9/vT5Aeo8Sf0I36RON7ZxWkGXKni0tVwSj+Qts5cNYZf
         gIGuxLgocdJgWGjTzW7/LBOVVIy4WhGPaSHhPOCHP6ho0o3cua0ssIMJPiO6JEvUbr2c
         d23ahLZLzwzTZrASOQbPUr2tTJ3kzsVIOHRPSXxphE4LoPCoKaomGwRJfXzG7HV82I3W
         TrvrQi4Dd4pp6Jewdhk72POX6WgwvxL8BhC00b10MrUBWuCRW6cxEC8DwjxgpJ4sq93T
         XoslJIJc41uHhiH8oG413+K4j5aAiK8Qp6iUMRrhH7UdLGs6MqXdiBjFxh2mTMw88soh
         23Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108322; x=1734713122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sM+OHiF90yvvBmEBEkw7PlxOYbfepKOCjoVyVikB5ho=;
        b=SsqgBAueWMCjqhaRRXV6p15PVchpIgDSdpKGOSznGaODK6WQYNwrZ89LeavUD88Wic
         hvnZPdivsBa5n7tm7Xqnr6LBeD8whccPahF0Wsaq20bD0WUZkgJjICyYfh7CXZ+J8max
         FtNZT0EKhY88nGuLNdXi2WOZQ4FEqxfpnM6DnNSrFqgdE6Lgh7EeRqsQtAnGnmAEvNTH
         DSrs1zjNvO/Hg/S7qMRhiIxrD9zhAunYUFbwX9w3LLj3Gk21dhi1f8xWk3uAWVCo4tby
         Dhte54DNKqY3tLTn1mM8/APPHrlB129kUQmd/PuJwNATctkHaPHYr6yvCDlTm3mKpTzc
         Ct6A==
X-Forwarded-Encrypted: i=1; AJvYcCWnYHkVis9Ucq26vFtpa0mTW8sHNjbbzKHnbcXhBaMkK0AqkovKcZB01gLHffGtypo5PnizVWu7g/mmS+V4GyTu@lists.infradead.org
X-Gm-Message-State: AOJu0YyRZy88AfGTEt3FdnCOIKIEbaLcNBzxZc+Xfxhp0mfZghLCkATB
	Ks50wovCiyqZxJ1ul9J/RfvJEsizA18zjzbzLithBHJaQkhRasjvLe+riFafEsA=
X-Gm-Gg: ASbGncu9Vm0bT0o8MHiZdiQslTKvb+ertFAvqGbi4xMBoEjrfAzg/GEcfrLhVg0OnJd
	fcpmHPWjkc7Bj6IY0H11pXtwH2l0rgCY2QY0JvWMO9BmpLYWThoYPObC70bPyLqXnkwGFYPwyRc
	eRvvGj1xeXs3wMESDRuiF8GMLfZCwMQZvMaNfVOU69cvVhJ+FC0DpyGXBxXbYbm2m+dFmf01ovL
	t+88IpcavzNaDV3IU6tTTVLVSPJNfkN0FhAM27EcIj3j/MXaAgHnjkcK430LUVtlN8RMc04AGhy
	waM2tPax/A==
X-Google-Smtp-Source: AGHT+IEwmLAcTh89DX5T/LSijU8z8bvHD+aN33QJxTOiFr0brRxcpM8yH/x7cknLvAOziYYAxWsdSg==
X-Received: by 2002:a05:600c:b95:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-4362aa2e5ffmr33344465e9.9.1734108322380;
        Fri, 13 Dec 2024 08:45:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:22 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:41 +0000
Subject: [PATCH 4/4] soc: samsung: exynos-pmu: enable CPU hotplug support
 for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-4-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5667;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Qzt6V7MPTnrrL8I4lVzjSwBYmRktc+/YgSPk/GCVFoM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSarmzwM1kbdivF8IkWxg2Uc0310r8V7M0Y7
 F9SFeH1J0SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmgAKCRDO6LjWAjRy
 uoG8D/9bBAX5wVe3H5FgKq4xkyJL342x5fcHH0eUNITx4oEvi85oYZbJcJWP3iB46a3KONBjUj7
 dCXDBmtd9AetZ0yLookvweoWbgIqfI/+KUHhDlkA1vSeFJ4ejXs4RvL7t/idl8y++7RMTxh+vhZ
 jbGfrge5R7JfmXvtBUv+lktbLMPes7SOiWJup6x8yCtJq8LyasCPXiUboWeL6NXkMNnGQqGLvi0
 MDWdaa3dP56lRP6fXUNnQ4Tc/8Tm/YkNcHZ3GlHT5b7qpIcEPOx7M/+d0Yt/1+uKqYc4MIMXCIT
 2ALjVMttEirUpAoYMHcY8WkmxYUSTLMm2scK5q8TPAEJO/JmX5AAk543cQASubnBzqWh/xLClcF
 iQ6QH9wyJk28grdgFIy0oLMWSWz0FiwD5vjwlYpedOskNG/KZw8jxTm2RFmVp43ynUreKmdE7RJ
 S/S79VW/C7gTDViP9gFXJM2+initDuXXUXk3Aacq5fMA27jJUX8DeC95Aaaz1hC/bkk3J92uv8+
 Xw4gxJU9Fum16kGj535EayF1lxdF36fxxfL6hb+fMhUXcUXi93MiXmzvFAEEbmFBoXwwnMBTeHm
 gJ8x/iIlzeFU0LxlKXNbOp77LHxhzoQ13+goTOzYoqS8/s2677uc4Xlh8AZuogv0bmqQ0Ydaewl
 zqg+w0ooJRexZ4g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084523_883676_65CD8C36 
X-CRM114-Status: GOOD (  22.47  )
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
pmu-intr-gen register region only a warning is issued if the
registers can't be mapped, and the old behaviour is maintained.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 73 ++++++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h | 11 +++++
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d8c53cec7f37..68eb4eb3813b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -6,6 +6,7 @@
 // Exynos - CPU PMU(Power Management Unit) support
 
 #include <linux/arm-smccc.h>
+#include <linux/cpuhotplug.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -32,6 +33,7 @@ struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
+	void __iomem *pmuintrgen_base;
 };
 
 void __iomem *pmu_base_addr;
@@ -221,7 +223,8 @@ static const struct regmap_config regmap_smccfg = {
 };
 
 static const struct exynos_pmu_data gs101_pmu_data = {
-	.pmu_secure = true
+	.pmu_secure = true,
+	.pmu_cpuhp = true,
 };
 
 /*
@@ -325,6 +328,52 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
+/*
+ * CPU_INFORM register hint values which are used by
+ * EL3 firmware (el3mon).
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
+static int cpuhp_pmu_online(unsigned int cpu)
+{
+	void __iomem *base = pmu_context->pmuintrgen_base;
+	u32 reg;
+	u32 mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
+		     CPU_INFORM_CLEAR);
+
+	mask = (1 << cpu);
+
+	writel(((0 << cpu) & mask), base + GS101_GRP2_INTR_BID_ENABLE);
+
+	reg = readl(base + GS101_GRP2_INTR_BID_UPEND) & mask;
+	writel(reg & mask, base + GS101_GRP2_INTR_BID_CLEAR);
+
+	return 0;
+}
+
+static int cpuhp_pmu_offline(unsigned int cpu)
+{
+	void __iomem *base = pmu_context->pmuintrgen_base;
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
+		     CPU_INFORM_C2);
+
+	writel((1 << cpu), base + GS101_GRP2_INTR_BID_ENABLE);
+
+	mask = ((1 << cpu) | (1 << (cpu+8)));
+
+	reg = readl(base + GS101_GRP1_INTR_BID_UPEND) & mask;
+	writel(reg & mask, base + GS101_GRP1_INTR_BID_CLEAR);
+
+	return 0;
+}
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -377,6 +426,28 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+
+		pmu_context->pmuintrgen_base =
+			devm_platform_ioremap_resource_byname(pdev, "pmu-intr-gen");
+		/*
+		 * To maintain support for older DTs that didn't specify pmu-intr-gen
+		 * register region, just issue a warning rather than fail to probe.
+		 */
+		if (IS_ERR(pmu_context->pmuintrgen_base)) {
+			dev_warn(&pdev->dev,
+				 "failed to map pmu-intr-gen registers\n");
+		} else {
+			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
+					"soc/exynos-pmu:prepare",
+					cpuhp_pmu_online, NULL);
+
+			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"soc/exynos-pmu:online",
+					NULL, cpuhp_pmu_offline);
+		}
+	}
+
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 0a49a2c9a08e..0938bb4fe15f 100644
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
index ce1a3790d6fb..0d5a17ea8fb8 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -658,9 +658,20 @@
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
2.47.1.613.gc27f4b7a9f-goog


