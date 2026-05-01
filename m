Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB2CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDoY5B4tRqi0wU6YQ86S+X7pylmUXZ91DyPWTeQUGtM=; b=px0trQfA1b/SgwV2BSZeTLuy3g
	B7Vcbpg5SjHt4Cdo8XtvCFRhRU2Kj3YzX99e+FotVfcpp9ycmpsvMeHsifm5wIcRgxggYDW49Pchs
	kKrhfl2bRJP46SKuknMEHCkJoRgxurw9PzevJ18CIvcv7dwGfAkFb3ESyNTnJz0qCQkW9s0XpDval
	b73/Fj5UfM2Q76YhFhSY06qLTqZt48K1zmR2CvNLU3f0YxGVbjVRV5ngXjhhxXly3GV7X+NgE9+Bq
	omGpaWw1Lk9lPpMDWbGnBg1te77SLs4/u6XHournKID8pIJeBHkgWwjL0qW5nrFqKW9cER9BUVDqP
	hpNeb+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr30-00000007Rie-0B4l;
	Fri, 01 May 2026 16:49:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2y-00000007RgK-2iEY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WDoY5B4tRqi0wU6YQ86S+X7pylmUXZ91DyPWTeQUGtM=; b=c/St8HbORAF3xMAg4oCRqroiUV
	tfSTkeXCzca5H/sC3484HH7aLFl27+kbAsvQE6gi6SazQSaU2u06r2UMH9Xum4GYptbegiYAlhT8+
	f/E+ZsNd2ZeB1y1bS86ZE4kIfEjZ/3aeKE2qIhGLOdebVXcTSVMb4oxB3075NTAyUsm0VQ8uC6MxQ
	IlbCAFvtKNGFRNM3PNXYMh21gdNb3GxEbyNEij+7o1TpPlq+XKzbmc2/WXRGJW77PQfF67zzXxEUU
	gFEMxAQiAlG1g/CfWF4B0dpzpMaB98zysEjsFvRYB20aTNArx5tbl2oCRKmIBf19DpGMB+Ti9bUgw
	heRMs/mg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2v-00000009B6B-2dwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 677461692;
	Fri,  1 May 2026 09:48:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 573BC3F7B4;
	Fri,  1 May 2026 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654136; bh=41VrH63oA77PTvJCyC+23ISZK1ixrwb0+2qNQeGVxi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKQ7cVs+o2BhbaYU5ugu5+lFqdrKaE8a0fR4oG/mDAeGzzgAC5wQ+7aaImRADMRXy
	 Hx44KVfRkHzyJ7+jOf4H1yrOEIRirCcIULpQz9nrHePkNqH3apQKoqPG4B3FdMAbZV
	 Aww1ZlyBguWq6ZHUQ4bvWn/fDSco+KEo7qXa2ijg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:58 +0100
Subject: [PATCH v11 17/27] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-17-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=4297;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=41VrH63oA77PTvJCyC+23ISZK1ixrwb0+2qNQeGVxi0=;
 b=o/1FOFUUh1Q5KcAw8HAFS0sddDDeGxegb8//muXE/Y7c5j9okZpBQN5pjGM+Y0EhiriOz9/Y6
 TCIIV1vZog/ChvsquKSqQwQAw7/t8TagQ8jBCmg8DzYk/nX8Hl2NRIx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174858_092306_8CD41B73 
X-CRM114-Status: GOOD (  15.65  )
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

Introduce the coresight_enable_source() helper for enabling source
device.

Add validation to ensure the device is a source before proceeding with
further operations.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 18 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7ca142b77186143aeaf5b9903475e21559b7b2fa..308282d2d4611997834bd39dc2de271bfa568ee0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -470,11 +470,25 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
 }
 
 /*
- * coresight_disable_source() only disables the source, but do nothing for
- * the associated helpers, which are controlled as part of the path.
+ * coresight_enable_source() and coresight_disable_source() only enable and
+ * disable the source, but do nothing for the associated helpers, which are
+ * controlled as part of the path.
  */
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path)
+{
+	if (!coresight_is_device_source(csdev))
+		return -EINVAL;
+
+	return source_ops(csdev)->enable(csdev, event, mode, path);
+}
+
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
+	if (!coresight_is_device_source(csdev))
+		return;
+
 	source_ops(csdev)->disable(csdev, data);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 9950ad481f29eed3bfac8fe4ae3a593b53830617..87e3245fbbe9c73df6e5bb3d24a912cbd1dc1e57 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -588,7 +588,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(source)->enable(source, event, CS_MODE_PERF, path))
+	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a1aab67e23db7fdea5139100312b3eb7cd31df51..456c53ba5d4c87bf33490383eb59b6a1710bbdf7 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -251,6 +251,9 @@ struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_source(struct coresight_path *path);
 struct coresight_device *coresight_get_percpu_source_ref(int cpu);
 void coresight_put_percpu_source_ref(struct coresight_device *csdev);
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index f398dbfbcb8de0c5a873837c19b3fdcf97b64abe..9449de66ba3941614928924086100866f3c88a54 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -66,7 +66,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 	 */
 	lockdep_assert_held(&coresight_mutex);
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
-		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
+		ret = coresight_enable_source(csdev, NULL, mode, path);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


