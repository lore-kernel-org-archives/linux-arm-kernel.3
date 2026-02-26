Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA7FD8FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=; b=NWazodXskKy/SV0qiEo2DKWB0z
	FxHYzx7KtNe63+E43LYYI6Ewjf1M9jec3g0pegrg9R0JLtl9HVV72GoJc7/UJr1fV03x0IaaDsnnN
	3s9j9uCkGvFap3+apVOY/ktwJ+qM9JG+EbhvqkchYQYjfmXf3pmFBJIFU/dlI3Iu+0sVAwhHUmziY
	JrfcoLf7zNyNX5JITqah2EB7w305CjbDrgc5KIaAvjrlj8/1glnAqXvzo4bTTIpuA8MIXX5yUkzVV
	rueJIzzCuYyEQ4L0Kp33xS4i0Nwg+TMJ7F/Za8PplhFpXnBea3mEKpndau2rq0H26FWpEIKV45l2+
	Y4vX2pAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaQ-00000006YEU-0Cu6;
	Thu, 26 Feb 2026 15:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-00000006Y5S-3nx1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=; b=LzqYf9DNlR/pAVhDxuYvqnN49N
	C0pqRMUl+g+NeOaRlyAPjouD4s4iFMbHC5weiTR8euLOyeiHtRMyST1hnOOEDrvDbPLe6qAQ4csUt
	ms5/3weqv+GIrnHnR0X4N/P8uBiXPndrB+KFCcgH/tmhD/P8hhku0HghVHwHLDj576edlEycnKdn8
	HBac4GRwbML9zpNRZMRcpOLdJ+dJ8pboAC+wb6HnNpW42JtNYQkvoyMIvfaefSmLpo4hq0XTgBvZW
	nDfvO/PG3SjsZW/iojfOSUNqe1hRnurpm1MGRSZ+Wptl0wOYSwIkBkgkqP4OT2peRN2QyZMR4eCal
	rqdGgXOA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda9-0000000BMzs-1PR2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48375f10628so7149125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120836; x=1772725636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=;
        b=nRl2w1cB3lfUlmHtlCz/aFGeZAvasibeB0rDF1662L+6DUgPVSBpktFy6vzAdp/JS8
         m9VrmRZn8sxow10FbKfW82B24zMxq8W/Y+KYJMuHlxIGLJz+fVWn4LQVL4e1qtizeAqT
         oknZHfGfZOi6U2LrzY3mudWu3M25P7AGTNQHwWfcEnFRgdd/ulgheLkOD2vUFsWirq5E
         Z7seWZRyr+f/xUTQupuGPhmTIWaUzvVQHGYGXo/PoepwLEezvNUIy8780/LWKOksGK6K
         AtWve+Yrfwg7nfl7bY7WdYdgGyxh5aMd9nJ50ulMQJmweCBmBzhd0FQQJtFIQqTxM9Uk
         xiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120836; x=1772725636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=;
        b=Dg0J8HMKVmVzhMyiFbyZRVnrUleLOl+PaNsO94EnoLGItsYVTHJcna5fzrUD7GECCF
         Fw8ycX/Oq+H+cvgi5z1g39f31eBJV4sW1hThb35/b+ztY2nm7/+e7p9TywW/AtpkA8O1
         n2StlW2CLMmAWZcNDjpPwvPdN8zW51Tr/Kw/eAe1dsO0Q6IZ7l0JPrO7lLG1RZqAUJFv
         VUk+rcyw0t5IOtdvKfE8Bkgl8vmHxbsxFlylCFlosTuYucM1gnl84beYP5nCG72l2Shw
         qkq0WSqsEHK3xYLY9fZ9NBBNDImVE7GF3tz6ex6pA2/0Q4dfTJXdOytpaOMaH9VZMaIh
         sJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpjkfeqAj5nTJQMlzzI3b5u0rX3JfU4lebrXI04IcVb01B6y0cKS7ivmYddZPt8KXkG4Iaruj4fW4/7x/aZwO4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1oLUrNwA8Wom3f/ZQAJsxyIH5TJ6eUApEsOJjiZAqfQxD++PK
	5UAmu4gUyDqQdWfXvJN3Q8Dc9tpW955WxFPE5ESHqjBCzG4QSEpCD84UAI6gOKayYn8=
X-Gm-Gg: ATEYQzyp7WtzAj2mC6fhAd50fvvwRXsdW1lYQCBV/3F6XLjj4HcQhBNP+B6vd/DBwlR
	sIWjDVd5dMQpzULXz+msNu27B4AGNRD1VO0am+I9wbo78J2DjGJlTcVw95iTHucGnNidZelTPZu
	admUX/dSXfXIonDcmOohPkhGm686uEcpebvtP+yZzFP/oZ/Sj06BCh1ZEFtBNn/zvrvEN4Tjp31
	o7I778/BgCCbEKv37e5xKYaSeGoLSAUzKNGPJNmYaJ50f6JlbIkCP6rZY6oAx/O2e3x+A3o+FvC
	j2spGG61hbrGuw5xGfqFTMJrKgfdWiJFPsF7gcWM2JkwBUDTVLX9e2ervTzBFLQHvV2Iho3vXIB
	fomJrUjI64JERxfNTjoPQmx/SRYDDGiN5t+2N2peURMPhQc5saGPwJZ7bwzBjvRlWPOxMZWl1qE
	VDr6AwfoJAqeQwJmH8ZmRmvK462nZdtBggBFFCFBKhlYMM29bYdhpTtmge2kHZ7G6HzH7iUKiqs
	h9M8f+HzoxBt74=
X-Received: by 2002:a05:600c:3f14:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-483a95e2563mr324727115e9.22.1772120836160;
        Thu, 26 Feb 2026 07:47:16 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:15 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:12 +0000
Subject: [PATCH RFC 6/8] soc: samsung: exynos-pmu: generalise GS101 PMU
 intr gen for Exynos SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-6-71d7c4063382@linaro.org>
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
X-CRM114-CacheID: sfid-20260226_154717_474237_676877BA 
X-CRM114-Status: GOOD (  15.35  )
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

The GS101 PMU interrupts generation block is not exclusive to Google
GS101 SoCs and is a standard Exynos IP block found in different older
SoCs like Exynos850 and others.
To prepare for the addition of Exynos850 PMU interrupts generation block
and cpu hotplug support we need to generalise (Exynosize or Exynosify)
names and calls related to CPU hotplug and CPU idle.
pmu_context struct has now calls to offline and online procedures which are
SoC specific (and maybe even firmware-specific for any given board),
and one of this set of {offline,online} calls becomes GS101-specific.
This allows adding calls for other boards later.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 92870e6ffc1c..0967fa56708a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -36,6 +36,8 @@ struct exynos_pmu_context {
 	 */
 	raw_spinlock_t cpupm_lock;
 	unsigned long *in_cpuhp;
+	int (*cpu_pmu_offline)(unsigned int cpu);
+	int (*cpu_pmu_online)(unsigned int cpu);
 	bool sys_insuspend;
 	bool sys_inreboot;
 };
@@ -256,7 +258,7 @@ static int __gs101_cpu_pmu_online(unsigned int cpu)
 }
 
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_online(void)
+static int exynos_cpu_pmu_online(void)
 {
 	int cpu;
 
@@ -268,20 +270,20 @@ static int gs101_cpu_pmu_online(void)
 	}
 
 	cpu = smp_processor_id();
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->cpu_pmu_online(cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int exynos_cpuhp_pmu_online(unsigned int cpu)
 {
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
 
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->cpu_pmu_online(cpu);
 	/*
 	 * Mark this CPU as having finished the hotplug.
 	 * This means this CPU can now enter C2 idle state.
@@ -320,7 +322,7 @@ static int __gs101_cpu_pmu_offline(unsigned int cpu)
 }
 
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_offline(void)
+static int exynos_cpu_pmu_offline(void)
 {
 	int cpu;
 
@@ -338,14 +340,14 @@ static int gs101_cpu_pmu_offline(void)
 		return NOTIFY_OK;
 	}
 
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->cpu_pmu_offline(cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int exynos_cpuhp_pmu_offline(unsigned int cpu)
 {
 	unsigned long flags;
 
@@ -355,29 +357,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	 * ACPM the CPU entering hotplug should not enter C2 idle state.
 	 */
 	set_bit(cpu, pmu_context->in_cpuhp);
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->cpu_pmu_offline(cpu);
 
 	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
 
 	return 0;
 }
 
-static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+static int exynos_cpu_pm_notify_callback(struct notifier_block *self,
 					unsigned long action, void *v)
 {
 	switch (action) {
 	case CPU_PM_ENTER:
-		return gs101_cpu_pmu_offline();
+		return exynos_cpu_pmu_offline();
 
 	case CPU_PM_EXIT:
-		return gs101_cpu_pmu_online();
+		return exynos_cpu_pmu_online();
 	}
 
 	return NOTIFY_OK;
 }
 
-static struct notifier_block gs101_cpu_pm_notifier = {
-	.notifier_call = gs101_cpu_pm_notify_callback,
+static struct notifier_block exynos_cpu_pm_notifier = {
+	.notifier_call = exynos_cpu_pm_notify_callback,
 	/*
 	 * We want to be called first, as the ACPM hint and handshake is what
 	 * puts the CPU into C2.
@@ -425,6 +427,9 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		return 0;
 	}
 
+	pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
+	pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+
 	/*
 	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
 	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
@@ -458,17 +463,17 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
 	/* set PMU to power on */
 	for_each_online_cpu(cpu)
-		gs101_cpuhp_pmu_online(cpu);
+		exynos_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
 	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+			  exynos_cpuhp_pmu_online, NULL);
 
 	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
+			  NULL, exynos_cpuhp_pmu_offline);
 
 	/* register CPU PM notifiers for cpuidle */
-	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
 	register_reboot_notifier(&exynos_cpupm_reboot_nb);
 	return 0;
 }

-- 
2.51.0


