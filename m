Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D743CCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbDtNr9KBpreqzLDwzrUEeQJY0hgEYvul3Hl/ySg5wo=; b=kBcZii5IgYlk0ADu0HkD83PdXI
	oHoQjGCnJB2z1Lhz2tTo2yiBNahsw2DFz9LxwdzYLpKiywxEwH4FZlbR5uvwWvH8abm/LP2L2yQtY
	/4ep7iX7IAV1f4NpbA9pu26BqirnDfFdmOfBwvRfjgnRwrh7BK0sWjy/w07nCPFTzTaREMNMB/e/W
	fQKRNLYeq7yyWjd4fJ6tNJry9v3nK0QEz0I6Lf0KU8W8moHs2yIwdoFIUS0mmP1/Gl5WC70FsipXj
	Kj25RYP75PpB8TJ+x4rFMhgYevngWLMQrRlGIUQtOoEqT9GgicMk262LlB+kduBhTD5soVeJdZrOp
	pH/J3PEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaI-00000007eF4-3m0X;
	Tue, 11 Nov 2025 18:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaG-00000007eE3-1Tee
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 18:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CbDtNr9KBpreqzLDwzrUEeQJY0hgEYvul3Hl/ySg5wo=; b=gjMlcisMBAkc24PoJNrYl+RHWk
	IDh4A4lQSiGZ54Vg5tDNVETSH0SiVoi/5lGeGNEN5+7N6XiX7afZ7isG6QQGdM6WsA3OgWdkwCb7T
	DynVsIMEsKWavSbZVWx09+DqVvQ0pHrfxLOYEH6OdFEIUqrw/rw2LT1npd2m9USBrVXy7f1dIBbhs
	fb4MX/hDws6g3OM4BVlJr+jlq+DFtFvn/Zver2LtCCGARrobmwHlZsYKzPUSaXjnWi3bRp6q+bXA+
	a34hq2pQU2gC8n/aJh9Bv08TWxjlS1bYUgM47LJwID2WnQfzcF59+e8WjK6otVFA9yND/ZX+1N9dj
	AQkuQp1g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsiX-0000000E0mc-3PPn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:03:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAFB1655;
	Tue, 11 Nov 2025 10:59:04 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2593F63F;
	Tue, 11 Nov 2025 10:59:10 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 11 Nov 2025 18:58:36 +0000
Subject: [PATCH v6 02/11] coresight: etm4x: Always set tracer's device mode
 on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm_coresight_power_management_fix-v6-2-f55553b6c8b3@arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=7613;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=5Sd9IahBUahlYiZgSdY1ss0If5Xb2SToak0RDRdyQRE=;
 b=K8Cfd8M9KNQlluodFCgPTh3NIoei5hl5dRzWSmSnxatmDnIbP4HdcNJZEyVUw1NB5S6kDXY2C
 SYzXALvMpd1B8POn2ik8TCCtKhWHVAqaaV+QNlsiNLod3bOzkePDIQN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180346_214092_358D5E61 
X-CRM114-Status: GOOD (  22.19  )
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

When enabling a tracer via SysFS interface, the device mode may be set
by any CPU - not necessarily the target CPU. This can lead to race
condition in SMP, and may result in incorrect mode values being read.

Consider the following example, where CPU0 attempts to enable the tracer
on CPU1 (the target CPU):

 CPU0                                    CPU1
 etm4_enable()
  ` coresight_take_mode(SYSFS)
  ` etm4_enable_sysfs()
     ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
     			                /
                                       /  CPU idle:
                                      /   etm4_cpu_save()
                                     /     ` coresight_get_mode()
	       Failed to enable h/w /         ^^^
  ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode

In this case, CPU0 initiates the operation by taking the SYSFS mode to
avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
configure the tracer registers. If any error occurs during this process,
CPU0 rolls back by setting the mode to DISABLED.

However, if CPU1 enters an idle state during this time, it might read
the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
save and restore tracer context that is actually disabled.

To resolve the issue, this commit moves the device mode setting logic on
the target CPU. This ensures that the device mode is only modified by
the target CPU, eliminating race condition between mode writes and reads
across CPUs.

An additional change introduces the etm4_disable_sysfs_smp_call()
function for SMP calls, which disables the tracer and explicitly set the
mode to DISABLED during SysFS operations. Rename
etm4_disable_hw_smp_call() to etm4_disable_sysfs_smp_call() for naming
consistency.

The flow is updated with this change:

 CPU0                                    CPU1
 etm4_enable()
  ` etm4_enable_sysfs()
     ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
                                          ` coresight_take_mode(SYSFS)
	                                    Failed, set back to DISABLED
                                          ` coresight_set_mode(DISABLED)

                                          CPU idle:
                                          etm4_cpu_save()
                                           ` coresight_get_mode()
                                              ^^^
                                              Read out the DISABLED mode

Fixes: c38a9ec2b2c1 ("coresight: etm4x: moving etm_drvdata::enable to atomic field")
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 60 ++++++++++++++--------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 020f070bf17dc0557dfb3ae4f282b0a0c1778bd8..1324b40d54210078b70a760ac1b084a4b20e8770 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -589,13 +589,26 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	return rc;
 }
 
-static void etm4_enable_hw_smp_call(void *info)
+static void etm4_enable_sysfs_smp_call(void *info)
 {
 	struct etm4_enable_arg *arg = info;
+	struct coresight_device *csdev;
 
 	if (WARN_ON(!arg))
 		return;
+
+	csdev = arg->drvdata->csdev;
+	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
+		/* Someone is already using the tracer */
+		arg->rc = -EBUSY;
+		return;
+	}
+
 	arg->rc = etm4_enable_hw(arg->drvdata);
+
+	/* The tracer didn't start */
+	if (arg->rc)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 /*
@@ -808,13 +821,14 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct perf_event *event,
 			    struct coresight_path *path)
 {
-	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
 
-	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
+		return -EINVAL;
+
+	if (!coresight_take_mode(csdev, CS_MODE_PERF))
+		return -EBUSY;
 
 	/* Configure the tracer based on the session's specifics */
 	ret = etm4_parse_event_config(csdev, event);
@@ -830,6 +844,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	ret = etm4_enable_hw(drvdata);
 
 out:
+	/* Failed to start tracer; roll back to DISABLED mode */
+	if (ret)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	return ret;
 }
 
@@ -861,7 +878,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	 */
 	arg.drvdata = drvdata;
 	ret = smp_call_function_single(drvdata->cpu,
-				       etm4_enable_hw_smp_call, &arg, 1);
+				       etm4_enable_sysfs_smp_call, &arg, 1);
 	if (!ret)
 		ret = arg.rc;
 	if (!ret)
@@ -882,11 +899,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 {
 	int ret;
 
-	if (!coresight_take_mode(csdev, mode)) {
-		/* Someone is already using the tracer */
-		return -EBUSY;
-	}
-
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		ret = etm4_enable_sysfs(csdev, path);
@@ -898,10 +910,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 		ret = -EINVAL;
 	}
 
-	/* The tracer didn't start */
-	if (ret)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-
 	return ret;
 }
 
@@ -953,10 +961,9 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	isb();
 }
 
-static void etm4_disable_hw(void *info)
+static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
-	struct etmv4_drvdata *drvdata = info;
 	struct etmv4_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
@@ -993,6 +1000,15 @@ static void etm4_disable_hw(void *info)
 		"cpu: %d disable smp call done\n", drvdata->cpu);
 }
 
+static void etm4_disable_sysfs_smp_call(void *info)
+{
+	struct etmv4_drvdata *drvdata = info;
+
+	etm4_disable_hw(drvdata);
+
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+}
+
 static int etm4_disable_perf(struct coresight_device *csdev,
 			     struct perf_event *event)
 {
@@ -1022,6 +1038,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+
 	/*
 	 * perf will release trace ids when _free_aux() is
 	 * called at the end of the session.
@@ -1047,7 +1065,8 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
 	 */
-	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
+	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
+				 drvdata, 1);
 
 	raw_spin_unlock(&drvdata->spinlock);
 
@@ -1087,9 +1106,6 @@ static void etm4_disable(struct coresight_device *csdev,
 		etm4_disable_perf(csdev, event);
 		break;
 	}
-
-	if (mode)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static int etm4_resume_perf(struct coresight_device *csdev)

-- 
2.34.1


