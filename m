Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B9C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpN965PXtFApJwEIkCDxa4SlX4t9L4NYatiQcXWo3sM=; b=Ic1lJ+0kalXQed1Y8/vGYhctjp
	KRI6PptIGrTUjtSic4WF5pTw/G7/ab7na36O8fOzvJH10Zd2BJ3smhKjHrnl6emjSTWEfdKC4ka4V
	5MZHy3zTMDjpK79yyEqASrvGpjXFcIGk/5UNP2KSmRtkxa36cquSifbuYLbUeZw/3+cbvilJpjoK9
	udh90pL8JzseHuPhjAM3kS3pemLdczyvkqmIiE3wrEWT9kMim/Ke2ZtwfcZAscCkMxhVkzCTrNN3l
	x+Mavrj+rKTBmFkDPeYzX7evNTtSXv+XsE/4wBT+/wshiwzdMzbFlAUYA57B42uCXZIPgmgQk5zuU
	2GQHeVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjSR-00000005SYI-2g4h;
	Sat, 24 May 2025 07:38:15 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjLK-00000005R9Q-1Rny
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 07:30:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a375888197so318616f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748071853; x=1748676653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpN965PXtFApJwEIkCDxa4SlX4t9L4NYatiQcXWo3sM=;
        b=sUF7lHpqrTqAXRHeD49Thq5IL0G5ndHz6gQQ0t+d6W3DH1Q6OurUg0dGnIprlh4oPq
         F2aBKJ2tLALP2cNvKDWQ+fOQprVfSgsG43Vzc/NHNKv9ozVIx7ibwjbZ6ZQ6ChVRKTty
         mjX0q66SVNJzcfcYj//zFyZFVsSSwLsPOwzLjzwXKrmIUfXUFCBwZ9sLVCf7tqp6h6Gp
         PyQd4fy3/GlEhreOW4NTNThJrKLd5Xo4nrtj3mwr+ri1lxVWJTRI6HmQR9s+/KSavsNN
         PBHzMdPWwFfv5hVuYSS+elMSs/+uYXeNqzoA8gDK+XLqEcYM0DEEBpVilsggQ7ofDQXY
         pujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071853; x=1748676653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpN965PXtFApJwEIkCDxa4SlX4t9L4NYatiQcXWo3sM=;
        b=OLwevVtqQEvHExhM/qdl0KSMdGzQWj8aqz9g/DuBh/horRe3E/gC0CjfM46m+xF/73
         affudq/qCS47nPGaIvAjxIDwLdMcCAQ3iODEgA+zoptXfLTfHl4H1/0brB8IZwE7Klsi
         Nl8f8STATj2rfIGue/ln4p4J9QzXHqGpGgX5wJydTPdmuz3z1BxvLgFs2Ax4AVBfGU2L
         Osr31mZJk+akDwR5E/5D101FWXi9fyqNt9CKP5g5xw2/HhTRDMJ6rYuocTSdjm2kEb2x
         f4W7N3Fq1Y91p7rcwCiKnfNqdnj0eryIqCGU6j297OwFopZ5Cog3zqJYczHfG+Peegl/
         oITg==
X-Forwarded-Encrypted: i=1; AJvYcCVa/Fz8Cuj1BaVqN/wCjMKjj5Ve1EycqWHt+gfgxs8ZaF3bRv5LawxQrH7tVUMQUEXKubTa9WiEhD4v+yIwzWqx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1INzRyUnFxMu0pL5vcB4CF9LUy+4iwYthf1vEWHSEoy+7iAfq
	+GLrXxlvOyeYl39YBNRsjh0eNwHrgGBeQj3I5Di03aaMHxf5+vNJnqPweIUZO79hfk4=
X-Gm-Gg: ASbGnctVBulJAvwyA7U1Dq4HPcYDh5Yds+BtV5Cv+I54WLwUGGrkoqB4YKVzpTbJF0p
	IXY4qX9IXea2+6cd0giDyhNV/b7LD3aLDpKJzL3m76qbZ5lS/HmnXzJwdnZw9LOFD23hi+2qxc/
	sUzvqEZSFT/ltWufw1C/gWTXCKsTeEIMepS2Va0USvo731pKNMGVSZRpPaUQeYJRrezsDqXpubO
	lb+VLagbxGnIKGxW+ALp4xdHNMN5IOh06NpbAoMMqTji7MxMMUHlpBlNjA2fJnou6KhOj+GjwSL
	+dUkkOWzMu++vVmGtvSIXd9P7WvytJg8eEohjMdbzQAKaAcZVbNBXC3LGOrKrcjwUyQoCQ+Fyyi
	yYPea3AY=
X-Google-Smtp-Source: AGHT+IF0wVjcuoZd4VTJ0sGnuwAU+9jQIdeBlKfJuU5uEJZ08QXI5uRMh7/aqwevs21KvTC+SndKRA==
X-Received: by 2002:a05:6000:2890:b0:391:23de:b19a with SMTP id ffacd0b85a97d-3a4cb464885mr1858085f8f.31.1748071852553;
        Sat, 24 May 2025 00:30:52 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm10924273f8f.2.2025.05.24.00.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:30:52 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 24 May 2025 08:30:30 +0100
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>
References: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
In-Reply-To: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6895;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7U9tlCoZc/rOj7EH40BDPDvRFAVAP6sWxjfHvLHGmLE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoMXWmtDVOeQQo+H2c8AvBH76fkztXnDVtGuqHJ
 H/MOqEBp7iJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaDF1pgAKCRDO6LjWAjRy
 uvt+D/0bEVtxwCaxiKJJL5LsmcMbQ09zGgPLJNXhqcCbb4XRLAVXkYKJnwc/7SC54L78zeTcBmS
 sVdtvXO2LLihhhB4gE/dZrdoL6DFKdfv+p7EWTWY39yAluPT8Ws9dyu60bmSnwtETaB5TvRORLr
 CVpi1KXEZFqcLRd76WdwhOC3TfZGZdKTlfSQoVISIYZY30N1svryxaDJ0jtyVJ9yq4bmGGg6yNb
 r6LsXie6JJH/SL2iCEDXGj6JoNT+cbicc5ezR22b+edZqR16pQufrH1sDH1jDTnmmboNUHnYDzC
 fSI3li6BxlMIgZ4Tge/XxCGIQ1OcK1G3+nV9hoxZM0AkQ65EQ/mY14m1e1zYl7rVHXTC4UAqIce
 ab9dpeA/rDq/7AXDV05Rt8Qrp60mvG//C+R7tp+MyEv/cofB6mydmzHb2H/PdlZwhk7a2I1fMY0
 kf15KNkn87hfj9rZZmqXMAdMORi5G44moutqZKAJ4ZR9vuXN4to1tTl2QoccSM7w0eMK3lnMH8U
 4lvxY++hVNk6J9uWZd5nmql7NqnfqaXKRXU72FRvSsoOS0tN6Uvlc2PuAkXpNx83FbV8obI6J+V
 Bgqtlt24gLXBORP35mOAIFPwUyshxgEdlzr8g5+QrqtFVNSjwWEONlnxDPG1lwRG7N2h9W2Z2ub
 fXQSh7iXFNUrK4Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_003054_394340_F5619537 
X-CRM114-Status: GOOD (  24.78  )
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

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn
program the ACPM hint. This is required to actually
enter the idle state.

A couple of corner cases are handled, namely when the
system is rebooting or suspending we ignore the request.
Additionally the request is ignored if the CPU is in
CPU hot plug.

Note: this patch has a runtime dependency on adding
'local-timer-stop' dt property to the CPU nodes. This
informs the time framework to switch to a broadcast timer
as the local timer will be shutdown. Without that DT
property specified the system hangs in early boot with
this patch applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 135 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..314f543d46b82dc3e991a5928fea50b81d4f92b7 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
 #include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -15,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
@@ -35,6 +37,10 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	spinlock_t cpupm_lock;	/* serialization lock */
+	bool __percpu *hotplug_ing;
+	atomic_t sys_suspended;
+	atomic_t sys_rebooting;
 };
 
 void __iomem *pmu_base_addr;
@@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int gs101_cpu_pmu_online(unsigned int cpu)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+	gs101_cpu_pmu_online(cpu);
+
+	/*
+	 * Mark this CPU as having finished the hotplug.
+	 * This means this CPU can now enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;
+
+	return 0;
+}
+
+static int gs101_cpu_pmu_offline(unsigned int cpu)
 {
 	u32 reg, mask;
-	unsigned int cpuhint = smp_processor_id();
+	unsigned int cpuhint;
+
+	spin_lock(&pmu_context->cpupm_lock);
+	cpuhint	= smp_processor_id();
 
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
@@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
 	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
+
+	spin_unlock(&pmu_context->cpupm_lock);
+	return 0;
+}
+
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	/*
+	 * Mark this CPU as entering hotplug. So as not to confuse
+	 * ACPM the CPU entering hotplug should not enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
+
+	gs101_cpu_pmu_offline(cpu);
+
 	return 0;
 }
 
+static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+					unsigned long action, void *v)
+{
+	int cpu = smp_processor_id();
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		/*
+		 * Ignore CPU_PM_ENTER event in reboot or
+		 * suspend sequence.
+		 */
+
+		if (atomic_read(&pmu_context->sys_suspended) ||
+		    atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
+			return NOTIFY_BAD;
+
+		gs101_cpu_pmu_offline(cpu);
+
+		break;
+	case CPU_PM_EXIT:
+
+		if (atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		gs101_cpu_pmu_online(cpu);
+
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block gs101_cpu_pm_notifier = {
+	.notifier_call = gs101_cpu_pm_notify_callback,
+	.priority = INT_MAX	/* we want to be called first */
+};
+
+static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
+					unsigned long event, void *v)
+{
+	switch (event) {
+	case SYS_POWER_OFF:
+	case SYS_RESTART:
+		atomic_set(&pmu_context->sys_rebooting, 1);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block exynos_cpupm_reboot_nb = {
+	.priority = INT_MAX,
+	.notifier_call = exynos_cpupm_reboot_notifier,
+};
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap_config pmu_regmcfg;
 	struct regmap *regmap;
 	struct resource *res;
-	int ret;
+	int ret, cpu;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
@@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			 */
 			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
 		} else {
+			pmu_context->hotplug_ing = alloc_percpu(bool);
+
+			/* set PMU to power on */
+			for_each_online_cpu(cpu)
+				gs101_cpuhp_pmu_online(cpu);
+
 			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
 					  "soc/exynos-pmu:prepare",
 					  gs101_cpuhp_pmu_online, NULL);
@@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 					  "soc/exynos-pmu:online",
 					  NULL, gs101_cpuhp_pmu_offline);
+
+			cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+			spin_lock_init(&pmu_context->cpupm_lock);
+			atomic_set(&pmu_context->sys_rebooting, 0);
+			atomic_set(&pmu_context->sys_suspended, 0);
+			register_reboot_notifier(&exynos_cpupm_reboot_nb);
 		}
 	}
 
@@ -471,10 +578,30 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int exynos_cpupm_suspend_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 1);
+	return 0;
+}
+
+static int exynos_cpupm_resume_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 0);
+	return 0;
+}
+
+static const struct dev_pm_ops cpupm_pm_ops = {
+	.suspend_noirq = exynos_cpupm_suspend_noirq,
+	.resume_noirq = exynos_cpupm_resume_noirq,
+};
+
 static struct platform_driver exynos_pmu_driver = {
 	.driver  = {
 		.name   = "exynos-pmu",
 		.of_match_table = exynos_pmu_of_device_ids,
+#ifdef CONFIG_PM_SLEEP
+		.pm = &cpupm_pm_ops,
+#endif
 	},
 	.probe = exynos_pmu_probe,
 };

-- 
2.49.0.1151.ga128411c76-goog


