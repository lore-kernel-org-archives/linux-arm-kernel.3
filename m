Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6A1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO7hL05gHPsjicT09z2ftgRnjd8ep0Gy7CAsyY6Cbxo=; b=x8hO1k44CKwZ0c/emT5TyyUNXo
	S+HS6kKFCSLYnCvZzNHNxCQLvQ29uMmA9s8eImafIqE8VvcGl9sEz8GI0kIKDWFmKSW+pZk3M86Pf
	FNOEcaaGRomEmWd0+X2fXYgXxpMGK4BNcXa2AlbNV+fwCPwNd35wnhOhoPmQpCTG/J05o4h0WKVDA
	BH3qIrW352iEwi2tX23LFuX6oWjodAnS42q6A/+lNrFrE6SvR9OmOkqRhQew9IeE3ZV8ZNRHh/g7K
	AHvy3BNVr5i4/8H1+KjswbN4OMJ2Bdhj43KU/FSzOe1HWwKticYDdRyhUJM/FkAfKIkQZvTu4G2v4
	nzb1ZM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxwC-000000041Gg-1cZr;
	Fri, 16 May 2025 16:29:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbE-00000003yOs-0aVI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C48EE169C;
	Fri, 16 May 2025 09:07:39 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A934A3F63F;
	Fri, 16 May 2025 09:07:50 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 02/11] coresight: Set per CPU source pointer
Date: Fri, 16 May 2025 17:07:33 +0100
Message-Id: <20250516160742.1200904-3-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090752_268203_859EAB55 
X-CRM114-Status: GOOD (  10.51  )
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

Introduce coresight_set_percpu_source() for setting CPU source device. The
sources are maintained in a per CPU structure 'csdev_source'.

The coresight_register() function cannot be used for setting CPU source
device as it is absent info for CPU ID.  So this commit uses the ETM3 and
ETM4 drivers to set and clear CPU sources in probing and removal,
respectively.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 7 +++++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 2 ++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
 drivers/hwtracing/coresight/coresight-priv.h       | 1 +
 4 files changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..1503037662f2 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -32,6 +32,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -77,6 +78,12 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
+{
+	per_cpu(csdev_source, cpu) = csdev;
+}
+EXPORT_SYMBOL_GPL(coresight_set_percpu_source);
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 1c6204e14422..de62a0bb7faf 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -879,6 +879,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	etmdrvdata[drvdata->cpu] = drvdata;
+	coresight_set_percpu_source(drvdata->cpu, drvdata->csdev);
 
 	pm_runtime_put(&adev->dev);
 	dev_info(&drvdata->csdev->dev,
@@ -902,6 +903,7 @@ static void etm_remove(struct amba_device *adev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 
+	coresight_set_percpu_source(drvdata->cpu, NULL);
 	etm_perf_symlink(drvdata->csdev, false);
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b12d59b89a49..fede0be5cd43 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2203,6 +2203,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	}
 
 	etmdrvdata[drvdata->cpu] = drvdata;
+	coresight_set_percpu_source(drvdata->cpu, drvdata->csdev);
 
 	dev_info(&drvdata->csdev->dev, "CPU%d: %s v%d.%d initialized\n",
 		 drvdata->cpu, type_name, major, minor);
@@ -2402,6 +2403,7 @@ static void etm4_remove_dev(struct etmv4_drvdata *drvdata)
 	cpus_read_unlock();
 
 	if (!had_delayed_probe) {
+		coresight_set_percpu_source(drvdata->cpu, NULL);
 		etm_perf_symlink(drvdata->csdev, false);
 		cscfg_unregister_csdev(drvdata->csdev);
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..59f9ec9cc260 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -250,6 +250,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
+void coresight_set_percpu_source(int cpu, struct coresight_device *csdev);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
-- 
2.34.1


