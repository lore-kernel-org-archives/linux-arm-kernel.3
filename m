Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FDBFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5OauRSHd3xC4EBGk+Y08SbUQli2Y6pPm8j7dgQwIdk=; b=gcTj+fKnLqx5B0xr5v5e7FhYRI
	OCpZdJkTkqC9jlVM7qASlQD5Knm1HryfqAfuE9fg2+R1Ion76xFjh4DWRQFsf7WLONk3DEM44AIgD
	a489O/5hF3P3GdDJrZN+jiGDdEF8oNTEiErVJCOTvG2ZO3uzMUhu0rHP1cBmdARDYeaM0NRm/m+No
	9yHG52N5lL6ga2hHiy6aJxy/PP4BLdnpMlVZyZfQxss9z9GikGetu79iEaEelFaAtDhTUG9u5rqLM
	l/ZxiDO/t/rJJAChDI4toWj4OozKpgja1oanI3OesXr6kF89XEXtpm+kzxGdlJK2i6bO0FgLw6Efv
	pbDtqifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHrJ-0000000GgEY-3t4x;
	Tue, 05 May 2026 15:38:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHrH-0000000GgDM-1EAT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:38:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso41747115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777995529; x=1778600329; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5OauRSHd3xC4EBGk+Y08SbUQli2Y6pPm8j7dgQwIdk=;
        b=E590ii4SlkLlRc4358Nrm54cL2K7wq69mzW09vzXmFfl1zW8Xp25OrLPT2Ev0xmh+X
         zppkwiXG9df/vqe1IA5UaiKEyGJjQavOntHnW9CCWHbUfvqAGK+ruIObSEF3oRLb0Kjw
         80geM3naHYuI0djkYyOGHOCGC3C51yZePDRhfVQEJp6fEFEsqseUOI7YfGCFXZc3gcrO
         VJPdQ8SCks+Z9NieqTU8tI7U5GaK2bat1OqcKWVkZy17hSadmcpHRCrIoR5mXtc5eLVN
         gMEGPNyJOnd5R5PNmGA4bGSe4GmQm4cUnS6pQp0jKCNmpbbi9OmQSBJ+d8vCUSDMoTYo
         gODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995529; x=1778600329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5OauRSHd3xC4EBGk+Y08SbUQli2Y6pPm8j7dgQwIdk=;
        b=bNfNRNTPC9rt53jljl6tFvTU2FFOV9j/oDTtoKVuSp5kXuqw/yF1mK9eaES0D1VdR2
         GEeF2aTVcI/kXEFEM36SDg2Q2a2NpcgwnhxkRPXZKo0nOh0I93zTUZxrKBoaZ+eiQDTa
         2iKoRr17jK0J8RVjAVl2BLPlzo464z7SWZA0kYNsUB4CJfQIuN7eTEDs62bNFhTB+lxH
         t6Fq0Ot9M6JdKD+VouP2Ye59utKlqLoNBeCdG4koJd9WbZFQ8uemeDFmFUahYUS4u85e
         EzLwPWzNWXTmbSSm8Yol6nHO73/0YDhV2StLEL3/qDWLqfigLPH7rURAqmFdqIeH04ft
         ApGA==
X-Forwarded-Encrypted: i=1; AFNElJ9Tg/+lozyoBwIRQiDW25naFAe4QMPErSe54ax1y4JhnL6yLsQAFk87iEB2JNfbf2N+QDd4Gn+6PPB/ci1cT3Iy@lists.infradead.org
X-Gm-Message-State: AOJu0YwcC4jd80ksA/oYzyyLRDMvpXklbpndQvopFOHspSaU9vPdGYoO
	TcpJUGVUw6y1A03GyR4RvbZWXspqDATvOIiojWtrQ4fKWgqxI5e3nuSbmadjTcO5H3c=
X-Gm-Gg: AeBDiev5JNFzzEPQw8KNCXRIHo8xj+LnC0hyJSjPSnf99L0WAiiptaLECtF+3ZXDyCN
	hJ5R1Kcjlb1rdWpB7p1iOw3EDstc/YBaVU/FMOgN0/6eMEmyaPpUClX235SJEaZdKTqCH4ghSwx
	7yDOuazDTXFaaTbf37zSxJyKSxpqweZs+nJdeJoumSEddqrJEN1nh7TaHLxTEnwQzyCcTrIFTKZ
	zOaqlqdLR37fRIBr5SxlUTstjMLfVXtxW3sMb87JsYAfIE5cAnpyvHZUYH0ObNLc/k59OHeLjgY
	wOw/VcxX0tXc4Dgi5NXsfAuvfm4/EfHs6bM6Nzb62fKdSFVaSSGvMSvODyUmh9SEZHw1d6YCVJm
	2XK80MOv64SfJ36l91PbS7i/Z2ruJpHc7OtU+7SPKUn9olOHvZMsEq2Retflc9b9QKsLZB9Op6d
	SYGOWa9JGAmrxug4e3ZdpuKCXnlgPdEYIuse4cMS/hm10=
X-Received: by 2002:a05:600c:6097:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48d188d5da9mr58933595e9.12.1777995529262;
        Tue, 05 May 2026 08:38:49 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f2487dsm5272365f8f.35.2026.05.05.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:38:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 05 May 2026 16:38:30 +0100
Subject: [PATCH v2] coresight: ete: Always save state on power down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-james-cs-ete-pm_save_enable-v2-1-d39c1f1e0e96@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPUO+mkC/33NQQ6CMBCF4auQWTumlIriynsYQoY6QA20pCWNh
 nB3K4lbl/9bfG+FwN5wgGu2gudognE2hTxkoAeyPaN5pAYpZCmUFPikiQPqgLwwzlMTKHLDltq
 RUXFVKS5O+kEakjB77sxr1+916sGExfn3fhbz7/pzL3/dmKNAfaZKaCo7VbS30Vjy7uh8D/W2b
 R+KlwzexwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083851_371665_3B7477EA 
X-CRM114-Status: GOOD (  20.90  )
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

System register ETMs and ETE are unlikely to be preserved on CPU power
down. The ETE DT binding also never documented
"arm,coresight-loses-context-with-cpu" so nobody would have legitimately
been able to use that binding to fix it and ACPI has no such binding at
all.

Fix it by hard coding the setting for sysreg ETMs (ETE is always sysreg)
or ACPI boots.

This fixes the following error when using Coresight with ACPI on the FVP
which supports CPU PM:

  coresight ete0: External agent took claim tag
  WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117

Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
Signed-off-by: James Clark <james.clark@linaro.org>
---
Fix PM save on ETE, which is an issue that showed up on the FVP when
booted with ACPI and the newly enabled idle states.
---
Changes in v2:
- Expand rule to also save for ACPI and sysreg ETMs. Now module param is
  only read for MMIO ETMs and DT.
- Drop change to save the result in drvdata as the single global is
  simpler.
- Link to v1: https://lore.kernel.org/r/20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 42 +++++++++++++++-------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042..b6b46c2f8ee8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -56,10 +56,14 @@ MODULE_PARM_DESC(boot_enable, "Enable tracing on boot");
 #define PARAM_PM_SAVE_NEVER	  1 /* never save any state */
 #define PARAM_PM_SAVE_SELF_HOSTED 2 /* save self-hosted state only */
 
+/*
+ * Save option for ETM4. ETE, sysreg ETM4s and ACPI boots ignore this option and
+ * will always save.
+ */
 static int pm_save_enable = PARAM_PM_SAVE_FIRMWARE;
 module_param(pm_save_enable, int, 0444);
 MODULE_PARM_DESC(pm_save_enable,
-	"Save/restore state on power down: 1 = never, 2 = self-hosted");
+	"Save/restore state on power down: 1 = never, 2 = self-hosted. MMIO and DT only.");
 
 static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
 static void etm4_set_default_config(struct etmv4_config *config);
@@ -2212,6 +2216,17 @@ static void etm4_pm_clear(void)
 	}
 }
 
+static bool etm4x_always_pm_save(struct device *dev, struct csdev_access *csa)
+{
+	/*
+	 * Only IO mem ETM devices will benefit from skipping PM save and only
+	 * DT has the option to control it, not ACPI. Otherwise system register
+	 * based ETMs and ETEs will always lose context on CPU power down, so
+	 * always save.
+	 */
+	return !csa->io_mem || is_acpi_device_node(dev_fwnode(dev));
+}
+
 static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 {
 	int ret;
@@ -2248,6 +2263,20 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 
 	etm4_set_default(&drvdata->config);
 
+	if (etm4x_always_pm_save(dev, init_arg->csa))
+		pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
+	else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
+		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
+			PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
+
+	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
+		drvdata->save_state = devm_kmalloc(dev,
+						   sizeof(struct etmv4_save_state),
+						   GFP_KERNEL);
+		if (!drvdata->save_state)
+			return -ENOMEM;
+	}
+
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
@@ -2305,17 +2334,6 @@ static int etm4_probe(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
-		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
-			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
-
-	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
-		drvdata->save_state = devm_kmalloc(dev,
-				sizeof(struct etmv4_save_state), GFP_KERNEL);
-		if (!drvdata->save_state)
-			return -ENOMEM;
-	}
-
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	drvdata->cpu = coresight_get_cpu(dev);

---
base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
change-id: 20260420-james-cs-ete-pm_save_enable-4e994e35cdac

Best regards,
-- 
James Clark <james.clark@linaro.org>


