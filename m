Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB0CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 23:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWOGcG3v4AgHUs+7mYFR/bdBwHYxuCY2aIESRfZ3+nQ=; b=RCbQsbLB0Fld0/dWfiTIe1A39Y
	50F9elVP4W+6wkqaAQfpZfar9XkB/wVgM3M8BThJPJ+J6g615JK09Uqe8v7+YIZXoLdBx3Bk8uPsg
	ZhW6slSP0o7T4AKQVcpW0TmitUHncxi9zqBiMB0eX440P1LEayfJTg0Y0+iB4siWy4F/GIP0fYI8Z
	dcxVDz4b6TX6PK1Yv2IDAjWCEcQenXRvF6+lgr3YHtR78y4W/E0f2E8DHztn9diYXsngjHSb5JRp+
	QXSCME3GaVaRbuN+kTFX6qx8CMWTmHcRYQfSpu3Kd832tc14AYzIIyV/95LDuB5as3OVcoxwk+Z1w
	ovAy1kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhau-00000004mSz-0pWb;
	Tue, 29 Sep 2026 23:50:44 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhas-00000004mST-0ZV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 23:50:43 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48881a62e09so2922807f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790725840; x=1791330640; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hWOGcG3v4AgHUs+7mYFR/bdBwHYxuCY2aIESRfZ3+nQ=;
        b=nuDaKkUXh5BAP9yzcyIu1M4KpyZUeOU1lwCL10r2ODMSkTLk4l6W6ugvN7ESUMVnkM
         EJLVvx9TQKt7YZFBFVvIyZC7bDdb2h/zSy3elYaTpz1kS5DZ4bJyyOVnuCfpJgpBWS6U
         CeMP9FmzTngCBCvsTC24WGZZdvIQp4laW4U9VX3dJiu5SW67rLP3yhCq2aT2nlOmQreM
         5crKcaT4qjLL35ocnIcIqEQKGHSx8Yzg5kQsCA8gjmCj4rEF5dVwfgw3bCSX7LOLthXn
         yVLLH3aHEQEr3YevOzS8g/gKeZTg5LJMU6/ywBMm8awh46RP0jFAoWts6ORG5Fa/0h7g
         pVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790725840; x=1791330640;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hWOGcG3v4AgHUs+7mYFR/bdBwHYxuCY2aIESRfZ3+nQ=;
        b=AeM7UjE2G5q38Aoo4nt4CbXGB/OrkNkoMkqlInAPx+xbssobv2wLkXjh1R+fI4wmcZ
         fGhNM3fha01vLP7YV8uR/E3mveGcT1jM7XrxvBD+xkOT58U/cmG4RF966IPlAe7eMskT
         HHsdzar+OgthDTU/GKuNlRsXhY+I/2UH62ylxzYGBYN3XkxaXEebKb0sZmYiHbq2FTG3
         xrVebsLuRzZKIn2vNjmhgdYmNR1wXq1qFo0xthHGBTVFWcDlNQvQSwgVPCtXJUMSd6yx
         b4m2YAmGS7CBSFXDg8y50LP2oUyY48+lxBabIqIK33kP9gMEqco8CosKBUjDLnsy9Ioa
         kxkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYSH1a/JR7qUDU+sgpLUbc0uuYy9BP/33YejQQU4n35JqVv42ruWsSUBRP4wBfI6vE+aUU5TgiqYu4iVfEa7KT@lists.infradead.org
X-Gm-Message-State: AFq9FYKmWLmW3SrwWs+acCts1hgLitDYQeZzgvB5ubP79uSHwCwVZQCQ
	vQwklh/W+zhg3fwSHWMnCw+DsNfI0MgOb9vedTdaBWG140yaKXrtwg4HfqMl8CsGaG8jaGGUKh3
	gr1rUuh4=
X-Gm-Gg: AYBFou1QWuLNcleFcoXT02lXpfVJbq1GPH5fxBwdFMVlEJhsC3wpOPxsMFiNgRKV6Dm
	bVQ/v97TcQEqTMvm0RLkCEAiJU6tIT1cLvxC8ithlMm54/nbGudB+3vFBzMXaSRAdcjlK2CDC3y
	oH8XFjW8/FujGX+AuijPFxAMIFWOcSSOSgMnv2Uu3Oc41BRKghPGn62s9vEib4+5h3waWnePqFs
	TQX0fkBH8O96y6waUoRCIDkqSdVVrREgyoEhn26iHPpawtkrbNLuX+OlANCCYejabIkhyLWCmAM
	kA63a9futPj14pSQvDsVY9/Zap4x8pJOdLp93BbEbdX2pnEvOHzG15oN8G4LBFCvQYbVrw1ymOI
	7LwScNLjy1w0Ve4KKelJEAnlkmF7mcbGvhmSuZBRNMLq0iQ1v+MZLEN7nNhummSDicfqURU29VR
	Ad5wK0Vp1iJ9/rsMoiQhGgqy0UDOdbR5Fzcg7KMaJxNfzRDh5gO1ibRSwpAHut4IyHgdtJD4uOS
	NblfWf9veMuQdYDZ9CyDl3ivWJWqiuseZAp/wL7Joj+E07QnkOodEB0rJYJ0Q==
X-Received: by 2002:a05:6000:2206:b0:487:9a9:6d24 with SMTP id ffacd0b85a97d-48afe799017mr1378259f8f.19.1790725839746;
        Tue, 29 Sep 2026 16:50:39 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe68056dsm1939443f8f.13.2026.09.29.16.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:50:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 00:50:31 +0100
Subject: [PATCH v3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMZOvGoC/43NQQ6DIBCF4as0rDsNYETsqvdoulAYlcQCgUo0x
 rsX3TTdNF3+85JvVhIxGIzkelpJwGSicTZHcT4RNTS2RzA6N+GUCypoCTgv1kXwzwmUnwaf9xG
 hMzNGKHhXoq5ULeqOZMEHPIYM3B+5BxNfLizHs8T2639uYkCBKk1LJVkjub6NxjbBXVzoyQ4n/
 sEkl78xvmOiVSgYrVotvrBt2949j/A4FAEAAA==
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165042_227524_78247343 
X-CRM114-Status: GOOD (  21.13  )
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
This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug support and cpuidle for
gs101-based SoCs.

In this third version only one patch remains and it was reworked according
Krzysztof suggestions.
Tested on exynos850 e850-96 board with sequential series that implements
hotplug. I don't see any regressions but testing from others will be
appreciated.
---
Changes in v3:
- drop the patch 1/2 that was accepted;
- moved destroy_cpuhp_and_cpuidle() after setup_cpuhp_and_cpuidle()
  as suggested by Krzysztof;
- reworked error path as suggested by Krzysztof, added label
  clean_cpuhp_state_prepare to clean only one hotplug state;
- re-tested;
- Link to v2: https://lore.kernel.org/r/20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org

Changes in v2:
- destroy_cpuhp_and_cpuidle() is called only if
  (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) == true
  (as suggested by Peter) (second patch in this series);
- in clean_cpuhp_states error path the cpuhp states variables are now
  reset to CPUHP_INVALID;
- re-implemented "soc: samsung: exynos-pmu: fix use-after-free of interrupt
  generator node" -- used __free(device_node) at declaration;
  (as suggested by Peter);
- drop "[PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
  callbacks". If we get some information about CPUx_INFORM registers usage
  then we may fix it later, but for now it was decided to keep it
  consistent with downstream implementation;
- Link to v1: https://lore.kernel.org/r/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org
---
 drivers/soc/samsung/exynos-pmu.c | 61 ++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index efccdd63e40e..c764f35fbfc2 100644
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
@@ -458,16 +460,55 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
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
+		goto clean_cpuhp_state_prepare;
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
+	cpuhp_remove_state(pmu_context->cpuhp_online_state);
+	pmu_context->cpuhp_online_state = CPUHP_INVALID;
+
+clean_cpuhp_state_prepare:
+	cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+
+	return ret;
+}
+
+static void destroy_cpuhp_and_cpuidle(void)
+{
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
+
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
 }
 
 static int exynos_pmu_probe(struct platform_device *pdev)
@@ -541,8 +582,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
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

---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


