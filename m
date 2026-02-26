Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924EFD8FD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=; b=pjmd0OV66NhKb5IM2mx0SRRFZL
	0I5YtkxL3wFiKwSzuJ8k9oB5Uy6Jm0dUpnCQANi64a2hm9YTk9ab1Yt/oUG8T0gftDf88yxnT00o0
	puqWuP9MF/y/VBIqw/1hTkibgi3eT5sR/r01MsCC7CrKrFXdkkGFHqTHHD87+DVPXDsCIluCMRXJo
	rohrha94uUazmvuMphdZewN/uoa40p7rcrAufhE9kvPs+CkxtpMci+2NOb2h08knDjZQ88tOOQmmm
	CS0OxuCd0ZQciAnV2GbX5sbJVaYAudOpFgWI5Mv6DXyrpAN7si3AxOJv2Q1ausAdLz/3clbjQBlZG
	52XBRljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaQ-00000006YEs-1UBk;
	Thu, 26 Feb 2026 15:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaD-00000006Y6k-3SRc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=; b=U3yX29HlW2/iviOYKGaG7wtumL
	PCSHGN1/ZO/qSh15oEyDgQg5v9KLqfKf9peO4CAJV0tYQ8Wfnp/m/lOowrboa/MBo2Jffgv4L3S92
	ZkkQciFhpwLzxuUpj2W1rmZ1rPLiLkJ9jk21gQ0fBX8YYaqDnO6XnS+AmFDDB3+rkIxWZLuoK1tzv
	8dJY3B0DfvNfpVgoxqixv34b2Enk4GmvdcHDnIhRfsN+e6SDsz4rDm4tiVx7/04vqnWaZkbOOrzX1
	kiJFyyaZ8JzutaJOehBjCVURLUF8kIUBi8p6NPWNVc5QkiaI6RCftrI+vL/A/3bjFUDywNKJAUqPq
	1WBrgntg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaA-0000000BN0I-2IjN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso8577205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120837; x=1772725637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=;
        b=mlfIbCMIsuaywYL2irH3SVoT/NaoQhtHTC3pcyeZODBio9+ucWKJSWsqqp7hTXROvz
         XLvrU2C0dXbvMeIiMmQmRHgWvfu/tw0sVaCSCU5OMQZJRFpuJvn9bSxwYVCVirvJ4GDd
         egP3io87ITgyrxnMTzWCmjyNlI036R6Q9Nod4r0uUY/9dltbkE/lzxeuaCIhvXnO20Dr
         ejx75BOUgeO9FRXvTixrGHmxaz2g+I8/8vk0GclXvZfMmvYAyU8xMpnemm5VgP522T8/
         o1lYMUxX0ofwJb3aZCuP3kNsLY/99hAmM/GEA8LF6KEkEzbHUeTqyOwQCZUqE7CkmOtg
         DvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120837; x=1772725637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=;
        b=DUwXGS/7b9DVm2F0L2Fd26xYizBb9HoEkEsn5Pm5bfm7ta3PsRCRrkfuTb7WXP5w1s
         y74yiQCQvTo2lvZHKUpY1Opp8IyiJEgZnEEMnpt4mC43FNwE1NxTzsowHEq77IDp25Yd
         C6oBsUlUrJNkedpL26OlObK0YzfePBHr6/z38OaCJdUq4nv4046PJrsOuvigRC/u8YsA
         893nUPP4fz4OcjEJBVGRiZmP1ouwrnomkKpDrYBdmeeWa8EvRdEC78IR71H7P4HUVEzF
         2igwOJnNZ4frPPBBaYw3jcFhQkGbbAgCz9EcUBnXPlGrGrnlJ8r5T6MZ0gmA/TmIBCcG
         VoOw==
X-Forwarded-Encrypted: i=1; AJvYcCX/zCWH30oCOkiTWSX6+KvvvfJPzbMjSpoM/MK2YgfEz3VJisk5b4000khoavkJWTHdbTA5RdED1EHzxzqXeAMC@lists.infradead.org
X-Gm-Message-State: AOJu0YyOG9Wynv8r5GSZM7JZKpRqVYjfxl3L5rpart/4xR9m1CM+0Ckj
	bmnmvr/FHHWudeZrNgNVr4k+Pkb/TgHy7CqOLVFci78KF+FpRWIj3gSUn+xkb232hnQ=
X-Gm-Gg: ATEYQzw+kMC2Z+QGqZjCZFbvJslDtxLhzGJz5S1PE0HPSjdD4DJ0GloSTvggFBbs0CE
	Xa+4kww/9SXABcyvL1OfYHpOm/oLGrEnZBNnBVdBDeNpJX8th3yUEhEB589EazuKFT2hVVVJ9kq
	HyURyOcNe7fjKO848Z3BPLFxBjxcPALgezGdGzCv4cm8tc5bvr05fmo/Q2PbIcPNvX9Gd5vRlFi
	4/gnK4OPv7wOpdJued2JHGN3xK44MRClC+x8pw0KcEgO/SweBxH8HEhriy2oK2VQDOBNk0pD/aE
	ZGCuRCJI4XN++0RijmrSrPP9/aArdjz7bmxJUV/pAYqrG0z0Jamfb5QyTY+frYDWrTUyQ5pmKcl
	C4Hjr/Kz2ux1XINwGY9RKkpEHUoat6/1+KgbDCL3xsArvVzNGiUCqZjJy1+wXDQMw6QpnavfXp2
	EY7Lel6OwocBsKLTLbdQSf5fApclyHOGBoWYlsEBMplSsLDLAZNUyPfLBmVgY9YEVrl5ZSbu9Oc
	76HzSguYVS2s74=
X-Received: by 2002:a05:600c:6995:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483c3dc7997mr47608645e9.14.1772120837234;
        Thu, 26 Feb 2026 07:47:17 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:16 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:13 +0000
Subject: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154718_599887_4BFA1F73 
X-CRM114-Status: GOOD (  18.81  )
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

Some Exynos-based SoCs require specific set of writes/updates to PMU
and PMU intr gen blocks in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF.
The same is valid for a reverse procedures like wake-ups or CPU(s)
online. Without these writes/updates the CPU(s) wake-up or online
fails.
Add support for Exynos850-based SoCs for PMU and PMU intr gen write/update
sequences.
While at this, also add description of Exynos850 PMU registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 86 +++++++++++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 2 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 0967fa56708a..7b9b8e22d91b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr = {
 	.use_raw_spinlock = true,
 };
 
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+};
+
 /*
  * PMU platform driver and devicetree bindings.
  */
@@ -151,6 +155,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
@@ -229,6 +234,65 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
+static int __exynos850_cpu_pmu_online(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 0 << 3);
+	return 0;
+}
+
+static int __exynos850_cpu_pmu_offline(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 1 << 3);
+	return 0;
+}
+
 /*
  * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
  * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
@@ -416,8 +480,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
+	intr_gen_node = of_parse_phandle(dev->of_node, "samsung,pmu-intr-gen-syscon", 0);
+
+	/* Fall back to the google pmu intr gen property for older DTBs */
+	if (!intr_gen_node)
+		intr_gen_node = of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
+
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -427,9 +495,19 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		return 0;
 	}
 
-	pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
-	pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+	if (of_machine_is_compatible("google,gs101")) {
+		pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
+		pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+	}
+
+	if (of_machine_is_compatible("samsung,exynos850")) {
+		pmu_context->cpu_pmu_online = __exynos850_cpu_pmu_online;
+		pmu_context->cpu_pmu_offline = __exynos850_cpu_pmu_offline;
 
+	} else {
+		dev_err(dev, "pmu-intr-gen is present but machine is not supported\n");
+		return -ENODEV;
+	}
 	/*
 	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
 	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..93c4d724c8ea 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0


