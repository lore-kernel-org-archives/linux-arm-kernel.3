Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD794C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHRlpPPsSJqGzltMuOf+ZTof6Jgch8QpoTOiopbtkF4=; b=IX1OzJlQ3ByIUdA+v//0FWfylF
	jboyCD5XuSkhQ5DTfV/+yi/ho7g3VZ/Ne+l5IfbTkOU7ixehZyFR0m7cji+okQqdIzlH82DNaOQBn
	A21o61R4EshiRcv7bE3KJIeIthJ+dJkAVELin2KUpmlpxhvnetsLQlAq38e2Kxk+4vZT3Wr/BPrj8
	sws75Q7ad2sKrDnNcYvkFkuOQMcZ2RyPCLag76nJ6S0oIuvGdWxVaQrDKXdoyfNLpzRnqrDT7WfXq
	S5ePjM6WorCmZcNDO0gQDCrcKPRKHra7cNGsNlliEdZ5MUnierKG796ab2L1T/Ez8HI8KbytZPo/F
	SGWsBVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUb5-0000000DvPm-0H1u;
	Wed, 07 May 2025 02:33:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMI-0000000DORB-2pqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4063071f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565065; x=1747169865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHRlpPPsSJqGzltMuOf+ZTof6Jgch8QpoTOiopbtkF4=;
        b=tlz7gf1E4kTsNFX4V/C4MwVsqoVSFpu9gTCDZuRYoz2PvyYzXi8ZswU7RRSK9tNa17
         zTLTDFk21JUQziVhhKJWKVpRWVj3VUMQPDuW6smb/2mjKPGDiZazARAqR2qNnyyAX+mt
         xo2KyXCflXC3vML781NNyN1Ci2xgQ8yQ1ZTd6A+tC+Qde4LVAYbexi4uheJgDvpTIsxB
         M58MIiCoAH1GuXUQX80uPrr3lYZvIHcu72HSha4inGUHHSbBEij1jjDmvMIuZQ8V0UXd
         gjqDasi7+RlDXlX4TXqEgqOmCZ0LyCq42FgxZS3FTgHtw/Vy0ddz3/8CliLy17PWkn0V
         QyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565065; x=1747169865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHRlpPPsSJqGzltMuOf+ZTof6Jgch8QpoTOiopbtkF4=;
        b=HxnTPEx3TxhVPPwToNSDY0JR0x5LnB81gCRGB4xp0VIu+oYdog3rcZ7K9iGa/6TFc9
         q4EVb82QoYQi6kfrzmo0Y/gCUyItoaVVwbJiJO0dm51LpQ1EjvOmm9wQv8hTsZ2nhY/Z
         bwfTJvHcGUZZep/ehy4yq2OmdqKiBao1DBez92oc8EMEFOBM3Udtysfb8V0TRDm9DOJh
         u/e3FPtff0E0dcvYOu2/ru7t8bLnBSU0rV37uwORjR+Gq5WQ9H4yvWwmlsXhhZKIvAtG
         DkBul7uip1akvqMiVwaIfZ0sIhVTCzzeyTRa3FZDwAFOEFcvkJVQuPXkQ8h7uViYrLKo
         RqcA==
X-Forwarded-Encrypted: i=1; AJvYcCWuyZrHpUYBE8AYxoVma3KZB3l5+2KgvP3KqM0iaXL2N1bPj8aACg93Epz1Y7C5xwkTRsrl3dmKptLUS/JQIn4y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3xq2jxg0HKT22dIH55Ai9DgkAKjXb05LmmA2vaDguy2447KF2
	HkvjsJXL3xEtw3WHa75Pdx016j1PNoraeOW0fzPsUBCXIPHXNiZYk2gpOxm7GXrMQt1hyKtReJp
	x
X-Gm-Gg: ASbGncsRMYmudO1hCeMAdUktASyalRIVtpbugFDp42yk/T1BcLHuq4FCrMEt/GiWmwa
	am0wkl+6dLPg6cuZ52Y+hRiJC15zMI+MtZIHR1n2bd1JYISbbaIZGjQ/PKnH7FmuRyYBAE43A1c
	usbNCreSsKwxV63JlOk3i5SY+Y99u6sGlk2KjUl8HofKOzknTVU2fdk3HmDdsMS7R87XHETYeQj
	qzldv4iiPQMhN9DKDd1dqPNeNQ+Z7lFmaQwR39TBH2N+LUHcxRBJL3AQiKM2TkDn8XYyk9PV3It
	q79d2wa+lbMhaMN3BfjjiJ4hI5SyME/WtXtQo+ChKrkCZEksEgu2n/w5AHDNHpI6NgfID6E=
X-Google-Smtp-Source: AGHT+IGulLrYWlG+kZCMXnnKSTODIHE+4aud4nyijHDirTc+a1jg1d1OEehyINhIG/PQqFXnGWHJpg==
X-Received: by 2002:a05:6000:4310:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-3a0b4a0554emr651550f8f.36.1746565065379;
        Tue, 06 May 2025 13:57:45 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:44 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:31 +0100
Subject: [PATCH v4 5/5] soc: samsung: exynos-pmu: enable CPU hotplug
 support for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-5-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=DmhgKVwxaPjv1roKDXteW3FTL4oH33qlI5LJtEP83bI=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne/lbKw4I26t2kad3YPe6N0+D1U9nwWjSbiV
 qxfSIyClViJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vwAKCRDO6LjWAjRy
 uvkwD/40C6kd/hz8G7/BRCna/loJnrlliDpXug9hRYnua7k0DIzUhdhVt6G5eWj5vbfW026Vel9
 yi76dDm9N4DsM9VxevSVpl3qaUr3Q21qF7Tvl06e/EtiBLKJUwas3SLgiwaGo90dlsyECKjYjYE
 FNvdOu5u3ep+ZE5r2XrPiEVeyONHR1Jrc25AW0Au6lokRTQoVPNZXx4R1I0iWAAM8Uu7lVyhmal
 Kps/mBJZSBesMIcZnUR0IYgIgmLUccqlmXEPcS8E2OmmcN0hdKSY8jHcdYFqmKID/X78Wx4Jp+y
 +QPkpBTIfREDs22QEeKfYIz+EJmRSfOSpgmCB+t556edtpWW9Zhi/Cu/DTMVuZVMAM81XbgbP07
 eG+rGtanTx2ezj3ZGpHcTkRMzjn7E5UiCQ9RQL8RB0lA3Ra8CnkXw0kQTa+m1FybTzn1lrxMstL
 ko0FZ2rMoUuEj+eMG5XaVoIsLAqxsbF3TtJhv8atgDEcqchqxmIENWV8CptTcii0zogpF9AdGlN
 8cBbG9VePfp8tx3nb+Q40eZPwtQTrVzTMrrcVj8P1Xi6cHTqef290wsFTV4sBQn8LOZqYzPeFaZ
 JbgC3J0ZJIDgKGOO2/HAYe8h1ZNsMOQNJQskzv4J7hYOlnAS3dgA7xnLOhjzxALWcG6MRj1TtEo
 BbBnvwlnAiPhGjw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135746_746250_DB9B5906 
X-CRM114-Status: GOOD (  22.77  )
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

Changes in v4:
* Fix typo with GS101_GRP1_INTR_BID_CLEAR in gs101_cpuhp_pmu_offline() (Peter)

Changes in v2:
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
index c40313886a012304b3f345d5d7369f15713eb857..0915b2457be7f473f09b6030923ba80c2f963427 100644
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
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu+8));
+	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
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
2.49.0.967.g6a0df3ecc3-goog


