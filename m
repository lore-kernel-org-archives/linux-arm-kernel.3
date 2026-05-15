Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB/01rJSuruqyjiIu2rnzBU1MPHprmcbMYuSgZB1DWM=; b=N+jpRPahOn3m6pUT2I98VAuxKX
	g4C09gGnZweuFGsNCQtUWHChV5Kha6TPcsl+AlObLhbWeVsPIhFrptZNOGVNNC+pLFV9kOuCIp/w8
	hPHtpy6u5T6Vxo8tE6gaZXvpaGu6abVd+ju9qckmh4mfGn1UgJAOa7CrdmxkqU+4z+cAx6O1WCehx
	gkdQYRgLe/AKIPvYVejY8cvNFopF+9xlmEBsBak6Vbl79MZhtUyGZYzwVx2U4d9Sv5GBUZ6zl+fUd
	LgCZnYL8Y18phos6p/OtzQr2mVHK+XWkg7WtrHiDgW7aU9iyvGhBNjHUcseOfY5MxHNzFNMQGcJ5z
	Mv7DZVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqf-00000009JNW-1EuY;
	Fri, 15 May 2026 20:09:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqX-00000009JGX-3trc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3683735DE;
	Fri, 15 May 2026 13:09:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98AF13F836;
	Fri, 15 May 2026 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875761; bh=/97r9BgHQjtGXQGquhQOHm9lF1MSkVbCGAKJivzTMSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=chdo7+K/eQxUstCeNaTW7tOr+U2fYl1s+M9WIPnULnsxdJ9apf4qHuc2PqJYftD/5
	 obsIqmur48g2X18POAFl3ctphSBC+aL5Yw7Q/a9R0D0Q+E9O/TxkMIw0ZbuSWrpulA
	 NFE2ppQtbUi94fCm8AIuEhMHJpOXN3tSsf/8cHhk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:25 +0100
Subject: [PATCH v14 18/28] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-18-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=4297;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/97r9BgHQjtGXQGquhQOHm9lF1MSkVbCGAKJivzTMSs=;
 b=t8FcN5mfjky20vTkpG+ECCxG1zWcphtSXCLWkcWdFw2BVNiT6Kdiz5gAxBIb8KcrJ22qxP0F6
 KIrqFC3NQcNBx9UKYJCoGwVHcOB9sH/7RzoT4KNXoZPwML2w6cPmyqo
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130922_044690_08003099 
X-CRM114-Status: GOOD (  15.66  )
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
index 61ae7b6c7a836caafaf87787af91a1f5326c16ec..f833b73ebc168b2b039e5f0900594d0bde5ff916 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -479,11 +479,25 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
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
index 89b99c3caedbc34da57f406797701425d36a1333..09b21a711a8764ea429d712890265c84648e889e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -593,7 +593,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(source)->enable(source, event, CS_MODE_PERF, path))
+	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 808d1546f568278d62fe72d871b6af82eb830074..dddac946659fcc63799d4b009f1c7ccd9f1809b6 100644
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
index 682500b7296c20453edd0290e1dc44124e0c3228..9ec112b457bbdc85f807eccc6944bf39e5e363e1 100644
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


