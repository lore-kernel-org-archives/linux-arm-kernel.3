Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8995FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cFOxlmgrHFRh5b7c9s/7e3CdnNG1mfP3sI5WdJh8q18=; b=kIB9MjNc5J1t7no8EAWvrp4sz2
	R24LySzZc4gDrDbMxIJmOw4T+4doYB2kg0jqM85Frpn/HL4zTzkg8t0FiZxBmoWCirQ7E9NwWDlNM
	YYdaekWgeagi71we5nFVMNPQBE9CGoEKJ2PH2cagReBDUPSB8EtUgXnb8X9Wj+POBVZg2S/r8vmp7
	1WXf/wLkhXqSoOwZfPobuWDclXbmUbr9tpAWttuzeRWS92UIV81mxJjshaD/xqZ/2T0b37IlcT/Tt
	EeUGwEGlSRgoPYgTvb5XhbNwFQX7ucyRLR2gxe3TslKvrI2A++PffhwPHR4l8O8vik3telvtbBYQv
	FxfDaRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIzj-0000000GxLJ-49Tq;
	Tue, 05 May 2026 16:51:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIzf-0000000GxKM-3Z28
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:51:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so53101215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777999894; x=1778604694; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFOxlmgrHFRh5b7c9s/7e3CdnNG1mfP3sI5WdJh8q18=;
        b=irE0syH/Lb76uBQKGOXE1l6BMdRuK/PleA5zothG/FBxgaKeO1VVHCvrtXFZNsVUN7
         vMKS2v3WJnSBK+SH+u/B05dA3XKwviVIirryTpIKhI42yHs5j22K2zYU7B5B+egA040w
         0A9r6q5iOITMVFWgrqllDrd6E44Q6CHf7n3VNhT6lbqkPUOkWT+qEN9R1/jUSTcyH9C8
         xDV9Z330qYDbRIfdQgHcG3KpIn0Gy4l9e/o/oLcCFp8qiAGe33crQxXDhyRT40xS1q/9
         xH93aJS9xU4X6TE72ijcHX0+aTbAPNfSIW0wt7DfF5+knEU5C5Deb2ro2jwmxWkzOm8W
         tpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999894; x=1778604694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFOxlmgrHFRh5b7c9s/7e3CdnNG1mfP3sI5WdJh8q18=;
        b=h26Ht1RembSJwCW/TFdDV1WORgunfJToVPZ0RbeCAty7Jy38xi5j6sHhzW3gCMQnma
         3+B5m4x3tT95pO/Y/GJ/3Tz7rwmW5TlBHsl7hvxml1TVTZ7+/KozSsFAETua6ZR2aBkr
         MxoQC5LbTEM5q75T86DHgBWRBZ/H1TrN31DbDIhI4kcwOk02zTEQDkPOXTra0oHQVkNA
         jZpc6ptorBCTKcrh62GIHkqx++EGh9MYFug5ky0KPPVCZvxOr4/LlHZ+TgxdjYkiEgBX
         AsHvNZhepG+gD33Jl5hsYaKts5ZlvziqZsXM95rjhnAnq0cYdPUzc7I9TXR09l1UDxK2
         mCbg==
X-Forwarded-Encrypted: i=1; AFNElJ+nFrhhi09dWQ/bueU3rOJ7NqWsXP7BlpVPjrWnbkx5wR81QPBxBtvkGKVlvh9CnAuVDGXHZhwFngbUiyKMK3Fg@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPT1GCKM8RW1IM3xRBZEsbQgE70KIeUW2nL/9L/CNAypFFPoG
	bYmKMMsWwIHnoks3zFradNXSfuhKFbbFs0BGYDSbbfQnjQsgDJcJADAlmpRKTGPXOnBCDN5ka+/
	BJ2/c+i0=
X-Gm-Gg: AeBDiet5YJQcCoOQiWzX9JHF0Y9wAU8vP3/MXjyQ+33W0PggdOFbBRpofvosGNJqmEf
	iJtEC0YlDBZakECe6chlWYcqVRBC0IfPNhNtfZ49A8DXV2gUFqCj2XBEgFw6RQlNf5SY2aXThXy
	czSBFijK8fuw/bGaCG4OF0GlQV98/OUIZkBPncInhXySa1cJ5yECFEDsWIsu0l8Cyri4g/6CuHi
	uoZplpkUcoTA+9wzGScaJC2Vt0ZsgddceSNJxinCIOD/FZ0nWiZvubSOaRlnLXSVvDrYK85g3rS
	mWRP7mG4prIAw0k0FPOmz9Hv9orVOrPXOPba1L4qy/HtfnL596WQ+hi12oKVfM2XPPaBUs/uFJb
	4UsfJk3XN96Nt5ire4jJ4VtJK+jAndwh+mR0BM2bF7dpFlZ2B8r7F8YW8TeNscHAhBtgGbxeG09
	iMnklF1cdWd2s5eqKHvIesx/89vxG3kErDCcU/lhWjXL0rLo8V1O+kLA==
X-Received: by 2002:a05:600c:3b17:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48e51e1f0b2mr701835e9.12.1777999893963;
        Tue, 05 May 2026 09:51:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149f1a77sm23721885e9.4.2026.05.05.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:51:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 05 May 2026 17:51:25 +0100
Subject: [PATCH v3] coresight: ete: Always save state on power down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-james-cs-ete-pm_save_enable-v3-1-485d21dd79b8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAwg+mkC/33NSw6CMBSF4a2Qjr2mD0DryH0YQ0q5QI20pCWNh
 rB3C4kxThj+Z/CdmQT0BgO5ZDPxGE0wzqYQh4zoXtkOwTSpCae8pDmn8FADBtABcEIYhyqoiBV
 aVT8RcpQyR1HoRmmShNFja16bfrun7k2YnH9vZ5Gt69c977qRAQV9UpJqVba5qK9PY5V3R+c7s
 sKR/7CCFvsYBwaNkJq1DCnK8g9bluUDBeEjERQBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_095135_923364_097448EF 
X-CRM114-Status: GOOD (  23.86  )
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
or ACPI boots. Use a local variable when setting up save_state so that
it's immune to concurrent probing when devices have different
configurations which is an issue with modifying the global.

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
Changes in v3:
- Setup using a local variable and then check drvdata->save_state
  at runtime so it's immune to concurrent probing with different
  configs.
- Link to v2: https://lore.kernel.org/r/20260505-james-cs-ete-pm_save_enable-v2-1-d39c1f1e0e96@linaro.org

Changes in v2:
- Expand rule to also save for ACPI and sysreg ETMs. Now module param is
  only read for MMIO ETMs and DT.
- Drop change to save the result in drvdata as the single global is
  simpler.
- Link to v1: https://lore.kernel.org/r/20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 48 +++++++++++++++-------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042..591dfe0bc635 100644
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
@@ -2012,7 +2016,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	if (!drvdata->save_state)
 		return 0;
 
 	/*
@@ -2127,7 +2131,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	if (!drvdata->save_state)
 		return;
 
 	if (coresight_get_mode(drvdata->csdev))
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
@@ -2221,6 +2236,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	struct coresight_desc desc = { 0 };
 	u8 major, minor;
 	char *type_name;
+	bool pm_save;
 
 	if (!drvdata)
 		return -EINVAL;
@@ -2248,6 +2264,21 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 
 	etm4_set_default(&drvdata->config);
 
+	if (etm4x_always_pm_save(dev, init_arg->csa))
+		pm_save = true;
+	else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
+		pm_save = coresight_loses_context_with_cpu(dev);
+	else
+		pm_save = pm_save_enable != PARAM_PM_SAVE_NEVER;
+
+	if (pm_save) {
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
@@ -2305,17 +2336,6 @@ static int etm4_probe(struct device *dev)
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


