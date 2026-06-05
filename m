Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66EACD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POfwTOxPePIR+bzQ/YWTWSHHwFIOZT4YImIC9EJ68WE=; b=3FkQWudJiWp9WAgIUMZNhzmpf/
	gPSwzVJTTG4ZyfgL3WjMoqrCpkj4ubnmzeofMrgrTMYbTyn+6oODohK8NTmyIIA87lzy00SFgm/7Z
	/t8CKkYYWMr+lOowgdZtfKKJVnKJjBTV55H4mZfU7aLiF6LYJ2kU8OkMJcWQsF95J4NYhhrMBMDve
	CSd8VpqqBScqo4YC5GRVb8tUoJACSO+6qWT3TjQkdf+YM0rXWsfRtAPw6O+hnOn0XqYnQ2zqKSucd
	DbbO08QtTAqxWslaWDJeEVbN3wR+l7GZ0lcOcCfDVKXcVZu/nT99yCI31F3jn2ZWHOyn7AsURKQ/D
	Q/7JvXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0e-000000019hu-3FlM;
	Fri, 05 Jun 2026 20:19:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0b-000000019g6-17vd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:19:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso13864795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690752; x=1781295552; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POfwTOxPePIR+bzQ/YWTWSHHwFIOZT4YImIC9EJ68WE=;
        b=k6tPwbag6Hgg2mRcBpA2FY3wp6nr230Z7dWto8+tvUeM4ZUpNcCcZXJU1TFKsDyfXd
         3kTRPpGrdMyle9Buz0XW9K35h6gV4139ornTWE5OWV+yhjS8MeOw4joAETVa6wqsPShX
         TNIH13Mb3q8PbZkmYGeZdDVZtHSOHGyYRdbajKMbVxos9zQ7t7eXgsVhZftv37NNdK10
         iTgTz8TDNRtinuhCI+nl2YOoKDA6RzUDuGY4HEG88a8Xd/S/2Q5SaKWOs3WRINU5NYd6
         /rLql/O04L79TRGkmSsp1HQP261wHYVJUM6Wy3gYmh3qYrIdha16Pd+RaipLamSMO6tU
         dGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690752; x=1781295552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POfwTOxPePIR+bzQ/YWTWSHHwFIOZT4YImIC9EJ68WE=;
        b=d2StL6p+0ROCtKBG5t8ctxWPrDKRv3fdTcfsdJt/F/HvqzKbr2yuYKFGvAdEcKI3p2
         8BuB5O4F0pxMV5bhg29+v9hfFNFBLJ1Kr4v9umY+yFheQBTWnEpYhAnpSwrfD0z6QpVW
         q/6MOJrvYUSff6VNJYjyNAnwtqy1j7erej19me17XmvDix0ssEJ0eXK2lRZephA3JIWA
         xWAaOLKZ7ahO6PEUhrnu4XKgs4iNBBZovBzRnx9P5QcCUr3WNT7o325QoGU+GHYh41My
         8v21q7Gpn/KJLyOQ1iouKCs1VY/9g70j4VkjQQdv1+jA9MPh3xq4i7s11neaO9I5SiCA
         XuJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k+9sik6p1aAOHi8drbZWtK+1kQ9yj9xqivb7SCovwFN0jikgqMxD662rnk5Y8p7IbMMXB74Uc+6aUiaQPe+LO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3lnVzv7xo76yl3LnUq2a1p2t54CnhskMqeQRCq2lA4vqQjDXN
	AwtekXLJC7Ll+nBrXECae7sLY9ZA3WeasBI0sDtqex120QdVza82YQOteYBmwDVfpmw=
X-Gm-Gg: Acq92OF1pezklDIhHFFQq/8fYRTpOxImjcuvNFaQ6L3dZF6837WBbEY7fJkjhS9pl2p
	8BrSmAWPuVzNSNc1tRFQL0wGW0yeIe+OcpH63rTaeiawTzdf13WgGdcFw68SoaT+6hqilv6LewX
	TmFc5n0ZOUWUJ5M23HP3lK2QFOBdkLxn9EYRm8NcFy3ckdUZvBIwStpCryD+DRlxI1xkrqc/T8j
	DZXv7VijgGPTKUZVKAATPvDKiGsHOzPfaZpRzMLCvgIZK7VbG/Nvr/GLHEZFJuG+lpVML2/eFb+
	vCyuXMyO3P2jRj8X75NCTN6XpQLCjIXZJhfmDetlEyQoj8ED4IQJtFtTLcA6YDmqK+ZFNmKjmYX
	YiLhG0AgD1RUhYwXEnL2h1i2/GwoGBGt9bzW3NfRNY0IlmbHLvMRwedVU8wqRVdNFyuU5sgV7NA
	Ku2i5bKqIdQ4A6sBCMU20hZpCz7Y9ENnOiVmCJJpnwM6AjzQHrpGfD2xaqgC3ADHTUyhEAczbeB
	l16dmq3t47QbIeG9XqnSwcgyAw=
X-Received: by 2002:a05:600c:8705:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-490c25898efmr107486035e9.5.1780690751755;
        Fri, 05 Jun 2026 13:19:11 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:10 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 05 Jun 2026 21:18:52 +0100
Subject: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
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
X-CRM114-CacheID: sfid-20260605_131913_340272_0B6AB886 
X-CRM114-Status: GOOD (  17.22  )
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

The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
register_reboot_notifier(). If any of these registrations fail during
probe() routine, the driver returns 0, leaving the driver partially
configured.

Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe()
routine, for instance devm_mfd_add_devices(), the probe() lacks an error
path and leaves notifiers and cpu hotplug states registered.

Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
struct, that should be initialised to CPUHP_INVALID by default. Check all
return codes in setup_cpuhp_and_cpuidle(), and add an error path to remove
registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
helper to safely tear down notifiers and cpu hotplug states.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 57 ++++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9636287f6794..846313a28e9a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -38,6 +38,8 @@ struct exynos_pmu_context {
 	unsigned long *in_cpuhp;
 	bool sys_insuspend;
 	bool sys_inreboot;
+	int cpuhp_prepare_state;
+	int cpuhp_online_state;
 };
 
 void __iomem *pmu_base_addr;
@@ -404,6 +406,17 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 	.notifier_call = exynos_cpupm_reboot_notifier,
 };
 
+static void destroy_cpuhp_and_cpuidle(void)
+{
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
+
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+}
+
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
 	struct device_node *intr_gen_node;
@@ -465,16 +478,42 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		gs101_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
-	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	pmu_context->cpuhp_online_state = CPUHP_INVALID;
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
+	ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
+				gs101_cpuhp_pmu_online, NULL);
+	if (ret < 0)
+		return ret;
+
+	pmu_context->cpuhp_prepare_state = ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
+				NULL, gs101_cpuhp_pmu_offline);
+	if (ret < 0)
+		goto clean_cpuhp_states;
+
+	pmu_context->cpuhp_online_state = ret;
 
 	/* register CPU PM notifiers for cpuidle */
-	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
-	register_reboot_notifier(&exynos_cpupm_reboot_nb);
-	return 0;
+	ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	if (ret)
+		goto clean_cpuhp_states;
+
+	ret = register_reboot_notifier(&exynos_cpupm_reboot_nb);
+	if (!ret)
+		/* Success */
+		return ret;
+
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+
+clean_cpuhp_states:
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+
+	return ret;
 }
 
 static int exynos_pmu_probe(struct platform_device *pdev)
@@ -548,8 +587,10 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
 				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
-	if (ret)
+	if (ret) {
+		destroy_cpuhp_and_cpuidle();
 		return ret;
+	}
 
 	if (devm_of_platform_populate(dev))
 		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");

-- 
2.51.0


