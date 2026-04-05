Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1661FE9D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gj9w1pdK3hGyhmGEDNh2cGv4l3vzTihI5FF4g7PAUmo=; b=hdc6+uHenj9cOE6DDr5yn52+He
	IDWAtRWqnodxVBBbjsv9xXOUYAad0gvSn6cGwkDmEB8Qh1zxPelpFRHTlDjS1HHZOBT+A8y+KM5Ux
	oTjSvlU67ZWnnSTjQ1ftpoZA90/jxFtmmrG0gi4AqmDodVi5meiAUrKliUv85j9Um75UWOKzPfe7h
	UolronRWL9ZF4KMh7yGleOD4+/7S8M/UG2wKbKpGmU2Kt5mUUtu20jzNpUW/a2a8re8ILHKCQtdno
	GRg5An2mhJhXhY3KWl3tk0hbWYfkerW6eQ32/Oi2H8KlLm/nZsxRnbkJ4g2p5Z/DkzOPxPlGAoyzA
	PNKRBk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0T-00000004HCr-0z7P;
	Sun, 05 Apr 2026 15:03:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0Q-00000004HAq-09UE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211611758;
	Sun,  5 Apr 2026 08:03:11 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CE703F62B;
	Sun,  5 Apr 2026 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401396; bh=MT1dk/0jPwSmw0bMkT7qbR0UK3rqCqczPzlAyC5ku6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G3jUW6AouUUZapo9OKj6vlICci8vHtLX7d55XeQ0+0jwwPuuG8dR3EuUMhoO0uWmi
	 T1UIWsEMLgB5tWP7VdCH/kOS5f4MeKVMtT6d+WO1+lwu3aJGalJ+x1YSP+RGkbOAJQ
	 hcXdEfbjO4eN+U5YT1WpkQXW1bV/jtQCv+HFXvL8=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:41 +0100
Subject: [PATCH v10 05/20] coresight: etm4x: Set per-CPU path on local CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-5-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=4460;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=MT1dk/0jPwSmw0bMkT7qbR0UK3rqCqczPzlAyC5ku6w=;
 b=h0eYhJr8m2uEgV+oijHFsD7/RCWwEa3EUxU3iAMWSHS9Qeq+pzqS17RXamzdT3WYHMzmKIK3A
 /LZNgrB9CuzBPqgf166y3LtIBiNEKGqTNBsW5IhXvizoUNLdW1CcrxR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080318_162643_E66816E6 
X-CRM114-Status: GOOD (  15.94  )
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

Introduce the coresight_set_percpu_local_path() helper to set the path
pointer on the local CPU.  This helper is used during ETMv4 enable and
disable operations.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 18 +++++++++++++++---
 drivers/hwtracing/coresight/coresight-priv.h       |  1 +
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6907da35ed02fa58f8d30f5576627a6ce3b88362..74c9f0dd43784dd735885249c1e50fc86f610582 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -35,6 +35,8 @@
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
+static DEFINE_PER_CPU(struct coresight_path *, percpu_path);
+
 /**
  * struct coresight_node - elements of a path, from source to sink
  * @csdev:	Address of an element.
@@ -423,6 +425,12 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+void coresight_set_percpu_local_path(struct coresight_path *path)
+{
+	this_cpu_write(percpu_path, path);
+}
+EXPORT_SYMBOL_GPL(coresight_set_percpu_local_path);
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index a776ebb3b2b0360c99a8dadacfde4c2303dd59d6..7b91fab9895d7b2a65ebb1161b117d9d3f5fca1b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -234,6 +234,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -621,8 +622,12 @@ static void etm4_enable_sysfs_smp_call(void *info)
 	arg->rc = etm4_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return;
+	}
+
+	coresight_set_percpu_local_path(arg->path);
 }
 
 /*
@@ -890,9 +895,13 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 out:
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
+	if (ret) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
-	return ret;
+		return ret;
+	}
+
+	coresight_set_percpu_local_path(path);
+	return 0;
 }
 
 static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -922,6 +931,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	 * ensures that register writes occur when cpu is powered.
 	 */
 	arg.drvdata = drvdata;
+	arg.path = path;
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm4_enable_sysfs_smp_call, &arg, 1);
 	if (!ret)
@@ -1063,6 +1073,7 @@ static void etm4_disable_sysfs_smp_call(void *info)
 
 	etm4_disable_hw(drvdata);
 
+	coresight_set_percpu_local_path(NULL);
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1092,6 +1103,7 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	coresight_set_percpu_local_path(NULL);
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd703b2873e41b4ce0c2564d2ce9bbad..ff8a720339deb854ac3b4eb916f49e844f442d34 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -251,5 +251,6 @@ struct coresight_device *coresight_get_percpu_sink(int cpu);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
+void coresight_set_percpu_local_path(struct coresight_path *path);
 
 #endif

-- 
2.34.1


