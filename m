Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234F4C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFhy93n6Rb/y4cA3aaIcOvTxc0gTIiwSK8DV0XBamcA=; b=ZSDCXO/C+CCLnHfhZ4rZsgkp32
	taPwOFv5Z0Mp38/0j9M1mZb1+D8bI5CMfLT7jC6nhvRpB5iIbzpG/Taf/Q1jrlcwHaH7I14npOrLN
	El96OIDOkJSYVbpFRl2sP6a0/LYcgQ/QfIjxcRhbQA3JRNKkXlQ6sDQuyENC3WlFndtA7SwKlrW9q
	D5QrtEYKj/S5CSG/c92qnBtxk6vNxwWRzpHLLh90mvS0gdCxu9eOvmTw0qAaB4Nyk6VC9TmfxmGu+
	xyummitSelojd8lxT3FpxwVGk7RQ2WGFZc5KW2/su29AaEC+69lhFvEbY4ub5VzUxxGhTZuc0+oaw
	AnWV1qtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7T-0000000Egbd-2PF6;
	Thu, 10 Sep 2026 14:51:19 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g7O-0000000EgZ4-0jLA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:51:15 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d7443e0f0bso116061185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051872; x=1789656672; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFhy93n6Rb/y4cA3aaIcOvTxc0gTIiwSK8DV0XBamcA=;
        b=YexqA6HBky04KGSQh4WRp2iFvnnfu9PrTvabCJ7M8evwnDGcaZ8bNG6wP9TULdTP0C
         laeh49nKgk9Nkg5iWt9StvTihqUqxBokXuwwHpyoHdhHXFjkwB6e8MAdbcCEpCZ2ztXt
         gZ97vZrqcC5cc5RbZMQ2oUrq93IJUoGltD2Rtyw8MxsadV5Cych2TeABsFS4Q3tgfGTk
         35G8sVn6Veyf1DF3HIPbGxY0o02dzG9UmBwumFjCMiuHTD3yvrdbbkQ1ZeauQGEd5Pt8
         zNjYHZa/4MvdVQqadG4qNZ8O5CxVQjBJwIgR55SmvQWA8/5ptXFq7zfIOGkDSyVUk614
         pY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051872; x=1789656672;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFhy93n6Rb/y4cA3aaIcOvTxc0gTIiwSK8DV0XBamcA=;
        b=PCmIyTSfUqz2/QwN3Lt1oSQkrV9savixz+ra5Bgs3BfawrhkgHabnBx8M7ZRAaNmaC
         D1qmygaedmCdjFgyZSPxvxMkrUnoBZHWTTVB0X/TCxfencU+HoLhFysDymWdorikN7lw
         izA/c+lrwepIiYAIoLUlAEaiSiphCJcS54Tjh0xIHoqmGEPtNVqAXW8CcPO1c0VRSZYl
         lXi61JG7fOcUBj6QpUzRoLBZvAEgsBamKo5WWOArTDfmR98ybYZSoJw4sHsPz3zTUaCp
         GZ/RHzONOTQkJeQTGn6AxYR3yNDLqoTu97x6jCjZMPpw0L8biQsxIfUzstZkZYO+DFvM
         dkxA==
X-Forwarded-Encrypted: i=1; AKwUvBzUPM6sE+V3PiOG8qV+pt2mFnUgBT4xzbtIneloabZ8Nox1C1PrzyD5o0IkdPNrl2Ge/e6ciQBBDhETFv0ovkVK@lists.infradead.org
X-Gm-Message-State: AFuF++mRCEY6WUJkUX0PjcD+BdfqtO5wDBiRKOjp4p7E8mIDdsh9ZH2X
	fR8X8BuszwAokC98BZ+0DCntkZiwqw9aKagilqk+f+pRPeMbDPZ3ZkRCaSBVM9yC90fTlrq7UEX
	4GyS280AMTCey6wsRfQtZqw==
X-Received: from pllx5.prod.google.com ([2002:a17:902:7c05:b0:2dd:1e7c:bcec])
 (user=ericchancf job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:46cd:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2dd07809f49mr112539965ad.8.1789051872100;
 Thu, 10 Sep 2026 07:51:12 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:51:06 +0000
In-Reply-To: <20260910145107.3640991-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20260910145107.3640991-1-ericchancf@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910145107.3640991-2-ericchancf@google.com>
Subject: [PATCH 1/2] coresight: Add missing dev_pm_ops to AMBA drivers
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
X-CRM114-CacheID: sfid-20260910_075114_214790_6FB36CF4 
X-CRM114-Status: GOOD (  15.33  )
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

When ACPI or MMIO platform driver support was added for TMC, CATU, and
ETM4x, runtime PM support was hooked up for their platform drivers via
respective dev_pm_ops, but setting the .pm pointer in their AMBA drivers
was missed.

As a result, when these devices are probed via the AMBA bus, runtime
power management does not invoke their runtime suspend/resume callbacks,
leaving device clocks (such as atclk and pclk) unmanaged during runtime
PM transitions.

Move the AMBA drivers next to their platform drivers and hook up
dev_pm_ops to their drv.pm pointers across TMC, CATU, and ETM4x.

Fixes: 70750e257aab ("coresight: tmc: Move ACPI support from AMBA driver to platform driver")
Fixes: 23567323857d ("coresight: catu: Move ACPI support from AMBA driver to platform driver")
Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Chan <ericchancf@google.com>
---
 drivers/hwtracing/coresight/coresight-catu.c  | 21 +++++++++--------
 .../coresight/coresight-etm4x-core.c          | 21 +++++++++--------
 .../hwtracing/coresight/coresight-tmc-core.c  | 23 ++++++++++---------
 3 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..d9a12d5e48fa 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -612,16 +612,6 @@ static const struct amba_id catu_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, catu_ids);
 
-static struct amba_driver catu_driver = {
-	.drv = {
-		.name			= "coresight-catu",
-		.suppress_bind_attrs	= true,
-	},
-	.probe				= catu_probe,
-	.remove				= catu_remove,
-	.id_table			= catu_ids,
-};
-
 static int catu_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -702,6 +692,17 @@ static struct platform_driver catu_platform_driver = {
 	},
 };
 
+static struct amba_driver catu_driver = {
+	.drv = {
+		.name			= "coresight-catu",
+		.pm			= &catu_dev_pm_ops,
+		.suppress_bind_attrs	= true,
+	},
+	.probe				= catu_probe,
+	.remove				= catu_remove,
+	.id_table			= catu_ids,
+};
+
 static int __init catu_init(void)
 {
 	int ret;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..ace5e077a10c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2460,16 +2460,6 @@ static const struct amba_id etm4_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, etm4_ids);
 
-static struct amba_driver etm4x_amba_driver = {
-	.drv = {
-		.name   = "coresight-etm4x",
-		.suppress_bind_attrs = true,
-	},
-	.probe		= etm4_probe_amba,
-	.remove         = etm4_remove_amba,
-	.id_table	= etm4_ids,
-};
-
 #ifdef CONFIG_PM
 static int etm4_runtime_suspend(struct device *dev)
 {
@@ -2528,6 +2518,17 @@ static struct platform_driver etm4_platform_driver = {
 	},
 };
 
+static struct amba_driver etm4x_amba_driver = {
+	.drv = {
+		.name   = "coresight-etm4x",
+		.pm	= &etm4_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= etm4_probe_amba,
+	.remove         = etm4_remove_amba,
+	.id_table	= etm4_ids,
+};
+
 static int __init etm4x_init(void)
 {
 	int ret;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ece2e8c9be26 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -953,17 +953,6 @@ static const struct amba_id tmc_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, tmc_ids);
 
-static struct amba_driver tmc_driver = {
-	.drv = {
-		.name   = "coresight-tmc",
-		.suppress_bind_attrs = true,
-	},
-	.probe		= tmc_probe,
-	.shutdown	= tmc_shutdown,
-	.remove		= tmc_remove,
-	.id_table	= tmc_ids,
-};
-
 static int tmc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1044,6 +1033,18 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static struct amba_driver tmc_driver = {
+	.drv = {
+		.name   = "coresight-tmc",
+		.pm	= &tmc_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= tmc_probe,
+	.shutdown	= tmc_shutdown,
+	.remove		= tmc_remove,
+	.id_table	= tmc_ids,
+};
+
 static int __init tmc_init(void)
 {
 	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
-- 
2.55.0.1003.g10538fe699-goog


