Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8AFC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPR+8RLWsIHJc9acjgG1g7ANa3O2x38Ojpgbt/bpoPQ=; b=NT8q/1tF7lhrbht0cOfhIGr2Dx
	XKtWTFdjxkLkZCTQvBZnvDpEtuqMHGBR5DCsLi8s32/tz8nV4kW8BCZNfQfSObFtMXonRNeM82rDE
	qaj288ZTAjNDgkMG1V1MS2KHl6T4a41tRnYltUN+4deouHzqOl1J+30I8YyQSWRYiKEDp+SLcRTct
	uuLscRoM2lGD/IGnnTQRGBmss0PzNJGV+wAp94OIEFLgAbFzjH+llmrDftsH9vLfW3DMKOe/4dhmu
	vSLOwGVWb3/lqVn9H+F/5MUIcbfJi95SyDWkRM9zy5SN22Hz3e60cTz+g5sFOlvPgx1xKVjkVwjX3
	2aHluIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7T-0000000Egbq-2mOG;
	Thu, 10 Sep 2026 14:51:19 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7P-0000000EgZX-1wAS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:51:16 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2dc7337e2a7so33261075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051874; x=1789656674; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPR+8RLWsIHJc9acjgG1g7ANa3O2x38Ojpgbt/bpoPQ=;
        b=phnKwAWYKZDU99YceZjlWrtBLnBpqJoIz5Dx0CpMVqvb8BoBADhjp7fcUdWISOfE/P
         52OvEQrWena0b4n/6kdMqEmpIW9AbqM6xt5K2ZOVRnLgUjoZqQ8XN3473fMreKbgtM6k
         F8JevScnuyCmhXrJGZzFNQJuD0zB2EAjWqVMg63CTD97t9EpH5lRYpufMpRgaz7W+17R
         KbU0zp+rhpOnxbGKTs8lzq1o9pf/9imLHg5M5npK3ssFBE6SMZhPF2RtWhYgLFHMP0JA
         qe8hj5pus+F/Cw+nXwQtP7eqCz5PrwsbKmJxl77k/U0trdPt3VlGIJr/SwRizAoXqjAG
         hSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051874; x=1789656674;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPR+8RLWsIHJc9acjgG1g7ANa3O2x38Ojpgbt/bpoPQ=;
        b=Ezvdr4s4QqpZKTmKQDA20qyiOc0EV5YBDcYgHuX2KV0J6tBI5YxvuD4YSNHO0vCpDa
         Mghm0wz/zS7JA2it5xzXlb0HSFkjewg7kD7xDq3dKJ7sLowHNVSOtchvC1nQPsiG5q25
         Vb/XlAUlYOUpOlaDztk9OV38GQYG9FYvlOXN+z0u5FB5jC+2H+tLYZL3NHXA0NzYKpVK
         lYMGnM2QZjUYBez8Dn6+zDDZg7zLjZuHc9cHdErGgLRhXULgQ9FqfkRotMOICxnHdVPs
         n8mxSS7tPrA83d2MtMzHzuG7sEQzqZDuhljvkvb08bm3dHr2Fg3A4PN+svyI0WnjlCX5
         ZULA==
X-Forwarded-Encrypted: i=1; AKwUvBz1WyLcPHKi5rqVtLKbvemRl3OcfqtkvQu+i3eIdpsRPLD3hhky2KdEIIRJY0cc9mSBTqlIh0ggyQvFfZL50E18@lists.infradead.org
X-Gm-Message-State: AFuF++k7wJac68ePI4I+DgwCiWasd1rVpxvtxC7RTAJWQahFvUhVlKjj
	YxuiHE88Q/xOMmEDypuiVDk7P6VSKUXM/hkXRGNsN1w+cnBP/IGNMXoZtrainTJldvkjiQQANxS
	gBoJRQHZpw/6ZymVxXfpUBQ==
X-Received: from plw20.prod.google.com ([2002:a17:903:45d4:b0:2ca:f1f8:ea00])
 (user=ericchancf job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3804:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2db126d8a54mr668494555ad.10.1789051873909;
 Thu, 10 Sep 2026 07:51:13 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:51:07 +0000
In-Reply-To: <20260910145107.3640991-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20260910145107.3640991-1-ericchancf@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910145107.3640991-3-ericchancf@google.com>
Subject: [PATCH 2/2] coresight: Switch to DEFINE_RUNTIME_DEV_PM_OPS()
From: Eric Chan <ericchancf@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Eric Chan <ericchancf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_075115_525260_161BB802 
X-CRM114-Status: GOOD (  15.21  )
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

According to Documentation/power/runtime_pm.rst and
include/linux/pm_runtime.h, modern drivers are encouraged to use
DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr() to simplify runtime PM ops
definitions and eliminate unnecessary #ifdef CONFIG_PM guards.

Convert the CoreSight TMC, CATU, and ETM4x drivers to use
DEFINE_RUNTIME_DEV_PM_OPS() and replace direct references to their
dev_pm_ops structures with pm_ptr(). This removes the #ifdef CONFIG_PM
blocks around the runtime suspend and resume callbacks, allowing the
compiler to always validate them regardless of CONFIG_PM.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 12 +++++-------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 12 ++++--------
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index d9a12d5e48fa..e3bbfb707f73 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "coresight-catu.h"
@@ -640,7 +641,6 @@ static void catu_platform_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM
 static int catu_runtime_suspend(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -666,11 +666,9 @@ static int catu_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops catu_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(catu_runtime_suspend, catu_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(catu_dev_pm_ops,
+				 catu_runtime_suspend, catu_runtime_resume, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id catu_acpi_ids[] = {
@@ -688,14 +686,14 @@ static struct platform_driver catu_platform_driver = {
 		.name			= "coresight-catu-platform",
 		.acpi_match_table	= ACPI_PTR(catu_acpi_ids),
 		.suppress_bind_attrs	= true,
-		.pm			= &catu_dev_pm_ops,
+		.pm			= pm_ptr(&catu_dev_pm_ops),
 	},
 };
 
 static struct amba_driver catu_driver = {
 	.drv = {
 		.name			= "coresight-catu",
-		.pm			= &catu_dev_pm_ops,
+		.pm			= pm_ptr(&catu_dev_pm_ops),
 		.suppress_bind_attrs	= true,
 	},
 	.probe				= catu_probe,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index ace5e077a10c..ef664a84120f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2460,7 +2460,6 @@ static const struct amba_id etm4_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, etm4_ids);
 
-#ifdef CONFIG_PM
 static int etm4_runtime_suspend(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
@@ -2486,11 +2485,9 @@ static int etm4_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops etm4_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(etm4_runtime_suspend, etm4_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(etm4_dev_pm_ops,
+				 etm4_runtime_suspend, etm4_runtime_resume, NULL);
 
 static const struct of_device_id etm4_sysreg_match[] = {
 	{ .compatible	= "arm,coresight-etm4x-sysreg" },
@@ -2514,14 +2511,14 @@ static struct platform_driver etm4_platform_driver = {
 		.of_match_table		= etm4_sysreg_match,
 		.acpi_match_table	= ACPI_PTR(etm4x_acpi_ids),
 		.suppress_bind_attrs	= true,
-		.pm			= &etm4_dev_pm_ops,
+		.pm			= pm_ptr(&etm4_dev_pm_ops),
 	},
 };
 
 static struct amba_driver etm4x_amba_driver = {
 	.drv = {
 		.name   = "coresight-etm4x",
-		.pm	= &etm4_dev_pm_ops,
+		.pm	= pm_ptr(&etm4_dev_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe		= etm4_probe_amba,
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index ece2e8c9be26..77588d53e1b0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -980,8 +980,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-
-#ifdef CONFIG_PM
 static int tmc_runtime_suspend(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
@@ -1007,11 +1005,9 @@ static int tmc_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops tmc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(tmc_runtime_suspend, tmc_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(tmc_dev_pm_ops,
+				 tmc_runtime_suspend, tmc_runtime_resume, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id tmc_acpi_ids[] = {
@@ -1029,14 +1025,14 @@ static struct platform_driver tmc_platform_driver = {
 		.name			= "coresight-tmc-platform",
 		.acpi_match_table	= ACPI_PTR(tmc_acpi_ids),
 		.suppress_bind_attrs	= true,
-		.pm			= &tmc_dev_pm_ops,
+		.pm			= pm_ptr(&tmc_dev_pm_ops),
 	},
 };
 
 static struct amba_driver tmc_driver = {
 	.drv = {
 		.name   = "coresight-tmc",
-		.pm	= &tmc_dev_pm_ops,
+		.pm	= pm_ptr(&tmc_dev_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe		= tmc_probe,
-- 
2.55.0.1003.g10538fe699-goog


