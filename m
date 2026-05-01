Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8F3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdbTlPkYuLQPt6VClzH9m4XYzpIIuYfP6V8mSDhDDBU=; b=ZtdkeKisBJBWNROi4ls1xnWZ3s
	xd2yXZs7QZ9QhJFjb9c4gPM75OmlKBZylHtRqysx5UgMLO0aJIfs8RQ5k4uUuBYMACeYaHQZIzcPJ
	d631GJDYWD0T02j2oBihWGLCuO5EeHonKIOiL/pSZigU4f5Z601tHFHV0KmqDm8spmvJW4iMHe1et
	DtPt0TwiBjKYGYnVONOoQmfranBt4ZAvLDqIY7btJ9260hfEW8hV2yqQ8Z36slzZ6ZWlIE0b+9Ewl
	yfm/RVxUwVjStv3Pu+HBMQ1mRnl/96vZo4sn3GKpM/Ze3P9qwcAI+MYwVmyKiyzam7q1IuyLWypvg
	5jTTKZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr35-00000007Rqu-3wO9;
	Fri, 01 May 2026 16:49:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr34-00000007RoD-2jw8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KdbTlPkYuLQPt6VClzH9m4XYzpIIuYfP6V8mSDhDDBU=; b=mkVf23igJAik6z48dkgNK086fG
	eKQd2eSYFYnppJLDaomp/Jx1kkT0g9PXVcH4pxXnhtBGYsrOkP/wYgtjlrFPI91fq7ug+n+XuBfCE
	lwMuBVUo9qL5tFg1oalCAfNJNnSTOj3+T08M5NWNqGJyBEIePek5Uc0/3RghqJ22QtSr7/qnxVY0q
	VmIRUGYbArMeQMLTHDqgh8kw9/Oz4bwo2EhCqU8ON12Mlbkn2tU9IudKkiHI5rFJMc9eBhwzm2Cl3
	DoammC68e1FB82vpql4OpE2/WqcjY6Nby5lOgTLhHir59mrhZTqD5NQqkKtddeiqtSUqMhynl0ORq
	MBkQQA7g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr31-00000009B94-2O5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 194931692;
	Fri,  1 May 2026 09:48:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0608E3F7B4;
	Fri,  1 May 2026 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654142; bh=bEqjFy39tdrLVSXyNjBfqPWs9W0CJjSOiUXkrPWHIU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2UiCwtIWeICssqgD1D8w8BA1h9YQvfjb+u3ilA+GAs9CNK6bM5qYk1M4LPZgg0uQ
	 /xxZ0Ut/UVU4xMi1HzbkE3P2skLH0cufpcEjlyDfP2HSfD6Kv8hcKy3ti0lemsGB9j
	 HHHlu9sO3KNRM21umqCkcVcMJ4owP3ZZ2UtcHd5w=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:00 +0100
Subject: [PATCH v11 19/27] coresight: etm4x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-19-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=2553;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=bEqjFy39tdrLVSXyNjBfqPWs9W0CJjSOiUXkrPWHIU8=;
 b=psxEA6skqYgGqCF/TKnPU3ozA9vYgDLhvGFgorAhxSi5wC1H1Xcqf8gYxeGmfB6yNj6j0ie0k
 MumQhAIbOgrDD1miNKPzK0yo3Assosdzm3MACqQr1Hu0K5q3p9M4jBz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174903_922478_E5F53380 
X-CRM114-Status: GOOD (  14.09  )
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

Set the path pointer on the target CPU during ETM enable and disable.

This ensures the device mode and path pointer are updated together and
observed atomically by the CPU PM notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index bf29ecf487a6c57c67a31004a9911fffeba929f8..7c9e0af2f24556e27f6c1bcbb22044c52f13de12 100644
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
+	csdev->path = arg->path;
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
+	csdev->path = path;
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
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1092,6 +1103,7 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


