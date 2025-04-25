Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2560AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh3JAPmeTO24JV8tjKnvmXJ0A5D+UdZwLETNKz5WYnM=; b=2UJc/ULCn90ZSw+PcL1vJ8uuU0
	rASIQmCcYTy8KOxLM3HCDW57MwPV6658wRFMS9Rb0msXu/T3mm3c/dPX3XoFMc9gRLua1We4WRQTs
	2IlRONIyDcH6no5CyF0sehSWU2qIupiPhyoX4ujK0nvN3Capr+HNivE+vf8qySqDXzgtxeovFqrjb
	LmCT8hoF/d3FtYcstddJpCmZWpoDnbnrpeYbPgsQY5/It2XQBtNM7lJZ/CU3CEo+VlRBFeatuGQCk
	6vB+oaGGmpgkyS0CX3qhh5Fb7R+orOSBbKkkT3wWssjJtP7yeVodAytmG14dHQpWQoQRhl7ydbBlf
	aZyHHTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Mj0-00000000N84-1GZf;
	Fri, 25 Apr 2025 17:20:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lrc-00000000CaP-0PLs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so10892285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598319; x=1746203119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh3JAPmeTO24JV8tjKnvmXJ0A5D+UdZwLETNKz5WYnM=;
        b=h09VzP35+1ARO0nAr6DuO162Ciq5VEsU/hE5Ard++nE+XxbWcDJCLa+k/NCJoqybWa
         KWGBEID2AdiBRdCs+rJtLVxjy+7fIZR/c+9eZ+QP5pR2ZW0D69nI0Ku2Tca8B8WfJfA+
         UejyEU4atg4bKZ/AQuV/iY9Yga5LUzbyML+bFvnoVzoBoO7ZAqhnsEPQA2VQgig0BdKu
         KR00JYxDiPSOUxSFKm5iJ0qVb3MapEkNx1I7YjboTTZS4NP6Jj7CnuZuJGe137Rx3Sdo
         b1ZdqxkfaTkD4XLcTzOmlKHu74PoHbFL84uK2MP21xCGYXtRbRliLS0ZcgmpU69mz6jA
         SlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598319; x=1746203119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh3JAPmeTO24JV8tjKnvmXJ0A5D+UdZwLETNKz5WYnM=;
        b=t7uVhAj12t3Ol2MpW1MEGERXhuCu6vBtbkDdvsXfvrYr6/9O9t2r8hnOJ6SHITKn29
         hc6Xd6gnfTN3VFf4g1lu83Be55wN/37uj8SeChkal+diIQbA7fk3ACHaSiDhI0NVR8ri
         ryTEjCPHl3coX3gV+fEqHFijCMQT8SUHlZprIXpMqjR2Ok4bcd2Ie2SPvZ682LsY5yg2
         IAUO8dhcMXepZPzI4fSdAFn1UItpAluNUsLm1UcQPBBGG74k//CsDG4c+5i5ZiMp6UKx
         DKGrYbdrA5gpPZDRg6L5BC132on3em8jpjnda6fSGpF/zcmNB4Iv0VqrAK2oZ4GNf1zO
         vXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrpxWtND7GsuB3zi0spitCqiRNbv5Z2Ct8kebZ38CVwKGzziDuablO8OwlvPTKAagjWDzme8F48DdT8mpcCzay@lists.infradead.org
X-Gm-Message-State: AOJu0YwQNKa1DtySzV58PKd5EGuH0Zt6vCMFGJ05g/Ur11/WIWKsaM6Q
	wX7pCzxQYy5EZEShiZtjGi+XSxqXyNQ/yDo48oGTW2pTFCqaNK0OWiYAv/r0a9c=
X-Gm-Gg: ASbGnct5W5yPK6bl6sniRfE0Ahiy7sAOY7KZFS4frbpMHoC9TXt09O+xgsrTI0e0UgF
	j3+BIu+xW7mshRAEGiN5iu4WnosTvnp+lJRvzugK2c7Z+KsJo7XFFtKt7Q1UjGWYwk3l637jR81
	aDrzJO9sU6i0JwxhlSJV6CrEULWhqnSUnixs+p16Yn+WHmznTq0lK5BHwb0DA0yCmqzbd1Txsk7
	OnxppxPXcFtJ3bVV2NnLDdbWlnX7O0USeAbh2Tk8cwxrKeLPs0sC2aY4Q/D++oIh56LGVnKUoJo
	UC7LFDoKlPqLeQdIoYH8yPn6FGPWj7m6awnhPjs9cSqQ45y/FSalOnmdaM40AHEdC9itvVxx
X-Google-Smtp-Source: AGHT+IFKKvFedp6Nrba9Tngbgf9SpS1hGHaYNhfmKqEeSci33u8z8xgydesf80nn0Tm7MAyxNYwdNg==
X-Received: by 2002:a05:600c:c05:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-440ab8487ecmr49275e9.20.1745598318756;
        Fri, 25 Apr 2025 09:25:18 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:09 +0100
Subject: [PATCH v2 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-5-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6366;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=PZeXIXkDDcpmQgKJeZih41sAPSvK23P8CuuqnIIfAAo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dmq3oTJNUSVcZNMDgal+g8VsnBj6q0mRp9y
 MIZcwsVuYWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZgAKCRDO6LjWAjRy
 urpHD/9YGmcsS5Hssr8QD/JYGFbcjtShr4T5lX2zBlVMTiOutjINyF2YxIgkyfxDB5lfiYvleHR
 f8ui92mF12LzOFxs4rKwSDnT/AZ0DfZS8UocWPFI7IvdAD5BuxK1QKnw8jYzKyOXNVcT2EgYsSP
 TY3fr8+PywCMDi1V73HoShuocmZzX1OlXqmD56m/ZxCWJVM+k1kgaPBga9OhpFABcfY8uwhkFPw
 fRAgs8LE4WzYkZMyOwmR96DLYgAa3aU2J/c26NMZdN8zPuBJN/v/tVM0zUgxocOpu2YgRCJjxcV
 dGcgRBdoTFhSKwhugSIVPyJJd12RxH/y4rF8WZiFiCPDD3jBUrfrHdozlNW25B05HkZ3+Lss1wq
 obpCTgZC9AW5SgPpyCmJE7bE76qUQ2gGPDHhsfXwW1gTqetT2UCbO6aCos8blko81E0712Q9lit
 xxZmen0uqN1EsY0jBce1P3LjpQ59XtAH7XTMxxj4yiQmSIPgdaznmrqC0JZ6BGCVAZYToc+fGOK
 HoUTdBv2s1I78sIRdacdm0zi9XTwvbGuctb1VGgwI8u3WOYAjrEKVg9jrAOTI2lzjnvU6uj2V4A
 wLK2aSHNsnusNAQJjWy90qgCp/xPPk9c4vd/u6A2rfaITq7oIwwBlmJNWGhBnjdDh2fTIu7w0hC
 EFlucqqdtARVPkA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_092520_171598_45D25316 
X-CRM114-Status: GOOD (  22.51  )
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
2.49.0.850.g28803427d3-goog


