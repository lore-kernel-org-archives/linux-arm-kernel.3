Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46ABC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEJ19k6VFkGLeF0T3A8fZtY496MybQptAygVYIkcbbY=; b=nxrOPTRd6q2wiYnWpZ0X6dvLaf
	Ppo+9Mt+k45dNvzsUooFlHh9QhqRVKJQpQQ61rRS++d44U2L0tvIKySb74fveqO5vpavDaSKAmco4
	wcbq6e4bE61Ywj9I+vk4sP5i5+s/9ZGsTgVe9mr8MrUE9WG89vk8QSzI7AQHHn06WjQKa+MgJBRZs
	AMVOEMOF2r2+/yr2kCZpTZLTyvI6MDC0LrjJCkl12WUHMgxeySMC48XgvllFxBrm4WhyhVcVhUCQM
	aislD5WCDlwutnPTD2r7d/3zI/RDXTITs85DDLYGNuPjEq0gdIP/wF7eDPyCMTNAffHiyoDLHiz/J
	m5aeYXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpH0-000000059mS-3h1O;
	Fri, 28 Aug 2026 05:37:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpGs-000000059kT-2mWz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:37:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso457000f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895417; x=1788500217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEJ19k6VFkGLeF0T3A8fZtY496MybQptAygVYIkcbbY=;
        b=LuwECfGxJHP+O1m3dPfHQe7BuGoTYu2gyhzMANv8+DylqNhu/in55wPKHAHkctXo8f
         55SllaqrKzVbQXkTIQdWB3AfmrpOcsf3Oi9e9ylEXkCmoXM14TTnjFzM1xRMcVF4biNJ
         IUywqs9i6IpwsejGqF1U+YHlVxO8uKcZMejlMaMEan7ddPgs2+FLmp0zZ7eRmpnTUrBF
         zR6pQOGcT3PkLzjJMHEKltJx3jvdKBHUcRiJGtraooY2nd+DUfeOZ/Tvof8tbRehs4UN
         5r3DCHDvQQodggYkXSk5dUwFQxRLHzMMsqm1stXTluB/156L+m1PBTVg3hdGgqNoyGaX
         H65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895417; x=1788500217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEJ19k6VFkGLeF0T3A8fZtY496MybQptAygVYIkcbbY=;
        b=jPyhvQZY86keiSXZkUGhqR0Lju4C0DtkkqqBgqLEDRCQ6YJMrE8zHPhNHDCgqMm4wS
         uHoPDnjqNFkTzep1I1eBt4x09A/vFgYXJ6TcMw9+Ad9fhS99LlhKHQ8TBv/XUNoHrgul
         ir8DTMFh8sqqmAc8ksfIwreNR9cBcAupPQoQqzCd8nuMHhQwqqwVXvfd8HP2uj1GRRTj
         62AGzuRLxeeLvDZtsoqzpoXqgqGDoTZy/nwgoHLzw7JP4q4WHDZi9g6nWpX/c/RsXFa+
         dGe9L1q7XNjAdAgtT+V2DbkMvVhWFE9/Zlf+IPU9T9VN38U6PAvnFR63DsJOhyuw9tXi
         mL1w==
X-Forwarded-Encrypted: i=1; AHgh+RrxHh2IIQ0+45v6q7C3Cdm4p/dVuUNHMuO11lTalh5ptsj1H7sp3F5Ax+JXU54Nfu6BCkKWDWXuxqsHg0ILPbC3@lists.infradead.org
X-Gm-Message-State: AFuF++kSVZK4GyXfu6DaAkBuj2yYQux1cLekZypxSXJH+VskALl2FQdh
	ccy76ayXL7M2FtevL08JAOftHcFZE3PuEvKuQ+ktDSeRvzG0cmpMOIRFcXzmDEdJWic=
X-Gm-Gg: AR+sD120+oImLs6duAjWdtuuPKzw/1sJgt63pkYg86y4f0K4/FeD82Le2i+sy8sGRIO
	VuIb8VoD6geAQ4yqVbcfFUhEhNZDUBTrQJd1g4DL5R1hamZzZx08LogbMtjZVO7uGvSv9TvnjGT
	HuTpumayIvoo9zcLLY1aZvBEb6TzVMC8fNDNi7rmDgiPCp4D/+zcZti+4yUlFGkmK80jhBDk3XI
	Dx6yHkGlCtL8TLDTi9iFrhWog2DVTmg6zXkim2kP7EvXk7D6YPpUkFyQvuNuCbqYXUQ8QYs+obj
	+ccktUE8Q4/hFt9P725YhNgRB2Y2dQ/iBtajsD0czz7ty668tkQcOovP5GECiJVWjDnUhArifUQ
	jzPabr02obMxAFCK6cXIe2O2lZ3p8FKh8eEMSCKSZgdheDBYZOSxawaIXZ47gzjcI27Odgp2ycp
	X4kEoQzhXuuMj4p8jFytAHuuM2vcfEEzZPh0GtjqG4/psoFwmQLCOUb32GboGF2Upx5rzuaGDVy
	I34KaYJDth8YMH58k20HZozUVjzLODVjhlT/P0jEncygAKjwlMQ
X-Received: by 2002:a5d:5f50:0:b0:482:e263:2c7e with SMTP id ffacd0b85a97d-482f79b351cmr6273357f8f.13.1787895413969;
        Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 28 Aug 2026 06:36:47 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-2-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_223658_738450_F5DE5BCA 
X-CRM114-Status: GOOD (  18.60  )
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
 drivers/soc/samsung/exynos-pmu.c | 63 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index efccdd63e40e..fce922d5ab92 100644
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
@@ -407,6 +409,17 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
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
 	struct device_node *intr_gen_node __free(device_node) =
@@ -458,16 +471,46 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		gs101_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
-	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	pmu_context->cpuhp_online_state = CPUHP_INVALID;
+
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
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
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
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID) {
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+		pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	}
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID) {
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+		pmu_context->cpuhp_online_state = CPUHP_INVALID;
+	}
+
+	return ret;
 }
 
 static int exynos_pmu_probe(struct platform_device *pdev)
@@ -541,8 +584,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
 				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
-	if (ret)
+	if (ret) {
+		if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp)
+			destroy_cpuhp_and_cpuidle();
+
 		return ret;
+	}
 
 	if (devm_of_platform_populate(dev))
 		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");

-- 
2.51.0


