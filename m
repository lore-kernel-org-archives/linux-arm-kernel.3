Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B861CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0yxG0zXdk7r1+vfGjZGqqrFGTovMPDmklAlD/sL2QA=; b=Vmw8kYtu4HrOv3cQRqY9p7eHCp
	jgXgX1BMRzoqaj7E5TJjgiUoHS1FPgl2svEu7lAaFOjicuKmzF/BrRASfw/yKMn7B474rrArjXA5D
	P/iEJlde5WkLcBohKkegRLxXM6ZM93e7f37Q7XxVGjCsLhIg6sboOmzDIEebsVTQlI51krQa1H9y9
	RzOrMtJ8VojQZP4YpQWdwm1Cf0SNpp5ox+Ba5j3/f+Zi4Os7uShxNb4Da9z1HmyDRa3/HcQGVTF0/
	mCQqd+isCXIv9wFf5ZWwaOOq2ylMmMZe8REPJy1KUmtnQE6s/LpIv1hg0d+b8NnLdM4dn+SJlAot0
	T/+8BIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0b-000000019gZ-2QYf;
	Fri, 05 Jun 2026 20:19:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0Y-000000019fF-1NYe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:19:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso13864555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690748; x=1781295548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0yxG0zXdk7r1+vfGjZGqqrFGTovMPDmklAlD/sL2QA=;
        b=rHBvpFHq4yKCDD0ZUloYoQbAF2kE30ARDBbii7xbdcvXvHSgvpTi0GcSYyhkrN/kse
         VrGOo483mSZ0iEMQ2PmCUdXCreJ49dJLDQKPbx2vtJegO8brO7uj1GGYsZKPMMPm3kRS
         EMLKkIs4ZwCB9elBVqfGE9+q5oP+fTWelFYNaoMBK3eornf1AA1c2Py1HZBeC8igSrgL
         ZElAlkt1WDUYFKS6cenlRXLJheyL+4YSwvciVkJGDM4+otQ0c5Umb8AoMF/NaDtW0l7I
         /zlSWXPhr4YZtrsQodeBBqKbQbx2K79FkKWaf8/8R5QcqA2SmnSif+bRmcLQnUc2IB/+
         Yw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690748; x=1781295548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0yxG0zXdk7r1+vfGjZGqqrFGTovMPDmklAlD/sL2QA=;
        b=JLZauWLC0qVkpfBPRUwIF5CXY8i+MNCwiwU/p8g1nTCkX96PxrZS9SwJp5kpIse06v
         zGhbJXuHl6UUD4hITYaBS/5OoLTn6N26mk+/pRfoXoI8xVRhliDyTW/+IsB0NEo5UjsN
         RvYi+9wx2Dzd+9mM18I7ZtCMcmJ5Wtf0czoZ2A64dXLEVfYcphC+Z1a4LhjSi3Zful9D
         +OaV4RYXcjQN/XvS8+PxDd5TMJQxdqAPYdJSvJIImD7QhHDOr15gyTmY3s7qA/FIJj4y
         duLrQh+oEXhb1+kYpineOD4vrQY3bcE7EjUaJ/wbbOujo/51BCYkOwlp8g81rYij/cG9
         ReLw==
X-Forwarded-Encrypted: i=1; AFNElJ/qottr6c+mjbUuSZmtfcHsglS8k9/cXkJOMl5aKoJuzpIxUzDFsDDx3tkRvNwQ33xgZwX0ORE6h5rYBcXkfUY5@lists.infradead.org
X-Gm-Message-State: AOJu0YzNQbz8HDI68vI3icyM7wsWFb12vBkv/OB/cgTzYwHyZFjO+m6L
	9VIZoyfpTRFbhiI/F9MwO7IyVbGuvCVpkZjSyDQMDMQmYw4qRjkmIe/TkA3aQH0/blc=
X-Gm-Gg: Acq92OENrLi8CSGgCE56ulqppFjbUkY4kDStMHmFVRFKzIuQONT0yalEgyFywX5IyIk
	oHgEjZ57z3SJifZoMiK4EXcoea3AuJlHQpwTL0audW0JQsSzM+2VUrT3sZ+5EvfhaLdaYIgBlKi
	PHZAUFZZcnp3K6UeLn++amewnAIoLi3BD1aVfyz4hG2is7efDN+j1adCmuixZoqS3uwNgW149KP
	FNYuvXabnmU7K+TyPGi3ZC/2FU0TNW89ofHuyU0nblYxyOhV9aheKkwipg1ZXUSuVKdA9IpuW5u
	Lpne6zmZiOZC46yvc1WEESpUSHpsuJTKPkswwET6+NAAmrKhtUr0nvF5BPiMhc27GYGYDjzKBui
	AWB2vc8ZxRySy1U77oMIURmqP2QGJjLuUOadCNEegpcPz3Bn+EA9mdoG/bxm67qZDS9Y/nUJclH
	XLD80Lqbm8AvMpH5uBh7QGYivliNpDYEbHuKRBSAIZfsCyxx9YOkavAUUK+OO2gq6Ob4Af3b/aG
	gRe8LO3NIbQCXBoUqf/0fT+kN4=
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490c25e1104mr89266485e9.19.1780690748518;
        Fri, 05 Jun 2026 13:19:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:08 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 05 Jun 2026 21:18:50 +0100
Subject: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_131910_388217_71B5EFE1 
X-CRM114-Status: GOOD (  14.80  )
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

The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
__gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
determine the target register offset for the CPU inform hints. This may
be fine for cpuidle flow but broken for cpu hotplug where the target
cpu is passed as an argument and could be different from cpu where
that is executing (e.g. CPU 0 offlining CPU 1), meaning that
smp_processor_id() returns the id of local CPU but hotplug flow
deals with another CPU core undergoing the transition.

This causes the pmu driver to write power down and power on configuration
hints to the wrong hardware registers, messing up the power state of active
cores and failing to configure the target core. Fix this by removing the
cpuhint variable entirely and utilizing the target 'cpu' argument passed
to the callbacks by the hotplug core infrastructure.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..6e635872247a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 static int __gs101_cpu_pmu_online(unsigned int cpu)
 	__must_hold(&pmu_context->cpupm_lock)
 {
-	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
 
 	/* clear cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
 		     CPU_INFORM_CLEAR);
 
 	mask = BIT(cpu);
@@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 static int __gs101_cpu_pmu_offline(unsigned int cpu)
 	__must_hold(&pmu_context->cpupm_lock)
 {
-	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
 
 	/* set cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
-		     CPU_INFORM_C2);
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
 
 	mask = BIT(cpu);
 	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,

-- 
2.51.0


