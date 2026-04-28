Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDC8FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vLs6lQ43LLvofmoYOFin5kLufD/aLjPw9JJrWzlSmA=; b=Ws9KsEIPKCm6Cq4anDjrfPnGZp
	6Rj5xCTl+SFu9SqyyBHpbatZv2f+t3b5oAkr/b8mIwman9rmoZ2XbOixtUznutc90POAaTOpvXToK
	fzWRmuajOphpiO98t8sprPC/g53jX8eSpfSQAW3fR8LRrf4v5bMziBGEqEX8L8+9Z/witBT7qs22z
	yabX2fEg7Sx/+ByQs2TaH0ZtEnLMm5PrHe5cjBb3WKOf09mlmNEQAMMhAuPw95BK9/cUuF/o6u26L
	Glq7KGs8zyjCsEBwztQZhEhcMIs1wkrdjXsYz6POUj0UzzhM86N0i7Dfiy6ss0PYtja+QcfCGgax3
	r+JbiXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOx-00000001Pmz-2t0N;
	Tue, 28 Apr 2026 12:18:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOs-00000001PjZ-13YH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:18:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso84974395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777378728; x=1777983528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vLs6lQ43LLvofmoYOFin5kLufD/aLjPw9JJrWzlSmA=;
        b=BiyQdb5w04jrMuh2HQcB7X6UqoUrSoOPhTy4rI9sQLlkx1xgEQ+UDY3/igW+SvqBNv
         v9+VyXQkg4WIrtXnSp3eA2dZPhApyhbHDujJ9RV3Z7Oa2omc/tEkDTPcEujMdaKU4iLE
         FJkE2KI61Ty8rJA4T+RzJIIIVxjlEYpq3YdidF2BepFGAY2ADNeapIHlgCSJesoKrtK3
         Csp2wWceF83UZXDpYr99m6yJpUDRcG4OPt2rDVKQr1x2MGeJ7SMPfxqepDR7QPkzcamx
         VIraS9pahFIqifCzdt1hfynx3e7UFFu3X5X8PPHGleKmSGeLY2ph8Cqz66YAIatK4orh
         QcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378728; x=1777983528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vLs6lQ43LLvofmoYOFin5kLufD/aLjPw9JJrWzlSmA=;
        b=SEejU3GfLFnhN+7KdpGsZ2yd6L+vjg/CK38A26hbqVQrmq8Cd/kU3t+PH318Iff9ML
         0ejc0X1n58awMlsIsnJtNkwQf78Yh5gY17pftlsRsz1kwDygPUAEjHo6NRDBNs2bQli9
         TplKwjYNlweKemMuCU4rDTO+aQIhsz3ItaO5cAAum/15fuVBqMwy6no02GgAa2qZFx11
         9pEsv7Zuj9yg0ZwFKr7S5hNUhAm0V8B3DXALXS4zQ39zv/s2dKMrojxWKeNC0j72jqGV
         9Q0/AtZzP2BYfSgo4R6xDpuCw9fbgZk2c2a2CYVexayqb4jujxV4b4KfyZ+h1q4t7d/V
         wqHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CRq6+CM+CmIJobbiOgJMaxz0LodMThUZUzMvJ2nX0nbmJp+y3RKapaXvVy6HnCLVLcNnTlnRhj2YFSoFnsGN7@lists.infradead.org
X-Gm-Message-State: AOJu0Yza3BXUGOFGHzD+u68db832Kx+2MjK4Yf5RswRfgZ2v4Ava/3nf
	+d+o7yfSvefmc2fEHDdHrIaeUj4uc8YS7D5Ba1hqSAQs35pPjnahUPS9ilXG5LRReTo=
X-Gm-Gg: AeBDieu/X/0RHYkaxEF5GqtgGP9KgEmImNzfBNJB3mRCcTxGuRGIV9kNUNwdZm94N3T
	YoKLqNfHSoTeATfKRDf+3TdOCgHXZzhSrude7ohBUjEW6TR8wB/lHrQMCEe5IRnC6jjksy6BpRo
	3THHFXKMQEghydscxisNGN5zltgqpKv1Rt4kXUxtYvy9D2GLQ4qzHHca/dkUBu616JGl9Yeppoc
	iM6rurGBIZmNwaJQ0ZAPebfq1zIUfdI9K6+AEKVy7iQUJ0gmTsKnGrbEcR8JwrkJGlBx0O4EAFz
	ySK3+MNT0HTgk+8JL76xE0lSEU00UemKG6L3f1BL/Cq2HM4AdvovGjrxIFqJ7xTBqMEiLQJvcmB
	lsDJfYH6Rc6JaAuJhkdQeFiW61WdBKOpCurpGn0hxyVGNyjkEOflHyrBnX/G8NPFDzzjYWCPT8b
	pZc5ntBVa8j3/zrvGFfTorpcVM/Kxd/JoJW2pe3v0=
X-Received: by 2002:a05:600c:3541:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48a77b19c77mr45784075e9.14.1777378728223;
        Tue, 28 Apr 2026 05:18:48 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748e622sm17851125e9.1.2026.04.28.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:18:47 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Apr 2026 13:18:11 +0100
Subject: [PATCH 1/2] coresight: ete: Always save state on power down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
In-Reply-To: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051850_328180_D5C88C6B 
X-CRM114-Status: GOOD (  20.27  )
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

ETE registers are always system registers so it's highly unlikely there
will be an implementation that preserves them on CPU power down. Also
the ETE DT binding never documented
"arm,coresight-loses-context-with-cpu" so nobody would have legitimately
been able to use that binding to fix it.

Fix it by hard coding the setting for ETE and add a warning if the user
tried to use the module parameter. Don't add a warning if
loses-context-with-cpu is present in the DT as it's not a documented
binding anyway. etm4_init_pm_save() needs to happen after drvdata is
initialised so etm4x_is_ete() can be called.

This fixes the following error when using Coresight with ACPI on the FVP
which supports CPU PM:

  coresight ete0: External agent took claim tag
  WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117

Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++++++++++++++-------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042..a7fb680dd383 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -56,10 +56,11 @@ MODULE_PARM_DESC(boot_enable, "Enable tracing on boot");
 #define PARAM_PM_SAVE_NEVER	  1 /* never save any state */
 #define PARAM_PM_SAVE_SELF_HOSTED 2 /* save self-hosted state only */
 
+/* Save option for ETM4. ETE ignores this option and always saves */
 static int pm_save_enable = PARAM_PM_SAVE_FIRMWARE;
 module_param(pm_save_enable, int, 0444);
 MODULE_PARM_DESC(pm_save_enable,
-	"Save/restore state on power down: 1 = never, 2 = self-hosted");
+	"Save/restore state on power down: 1 = never, 2 = self-hosted. ETM4 only.");
 
 static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
 static void etm4_set_default_config(struct etmv4_config *config);
@@ -1365,6 +1366,30 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
 	}
 }
 
+static int etm4_init_pm_save(struct device *dev, struct etmv4_drvdata *drvdata)
+{
+	if (etm4x_is_ete(drvdata)) {
+		/*
+		 * Always do PM save for ETE. It always uses system registers
+		 * which will be lost on CPU power down.
+		 */
+		pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
+	} else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE) {
+		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
+			PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
+	}
+
+	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
+		drvdata->save_state = devm_kmalloc(dev,
+						   sizeof(struct etmv4_save_state),
+						   GFP_KERNEL);
+		if (!drvdata->save_state)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static void etm4_init_arch_data(void *info)
 {
 	u32 etmidr0;
@@ -2247,6 +2272,9 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 		return -ENOMEM;
 
 	etm4_set_default(&drvdata->config);
+	ret = etm4_init_pm_save(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
@@ -2305,17 +2333,6 @@ static int etm4_probe(struct device *dev)
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

-- 
2.34.1


