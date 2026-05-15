Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739C0CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqkFK6lN5Euw4YdxWCahq8Dwojaor8ZzNv3h9KA+bxY=; b=DghWr6nR3O7DssWQMnycmtNdw0
	ymNhaKOJkLp1152WjQ7pGTLGMU5r3+sxDlhbAK8P7U7mtkRVZm2jfVHHU8hVByIKrhu/+5Y5cnEWr
	0m5DPXLaU+qUH7AedHKALIrmr56b67JCz4zx0oedd1vrrL1rhkxt+oO3+0KtdQtz11F769/ARCT21
	NdAH52J6x4v3dNbHxuMPcv6W+f6HDbkHX2nO1BXkN+4gKp79FprWwy+H7wSQ6QzMi0M6dC7ae9WyC
	fVVsEXbKDr4ZIBzaVedB7HLb5ddRu+T1hq6apMqg6jORO797q09e/v9ubiRqtT8rcuPvCWTqeMWjM
	14vc/cLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdq-000000097uT-0h1Z;
	Fri, 15 May 2026 18:52:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdg-000000097ne-3kfc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7983927D3;
	Fri, 15 May 2026 11:51:54 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC36F3F836;
	Fri, 15 May 2026 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871119; bh=PxsK5/rFy7Kf63XUdwgL21pvBtzt71Kl2anWcGHOPSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tOp12n7Lfzv2zQXQ0dUU1xItQXoxOYBR32i+QpEzsLJtLmlX0/MrBmFBQNUn83xXk
	 6p2gJq0Bv28TACJ3BAtjF39Wq/X7Dki1q67JQebHqOXLn5jfy20+U0xC54NeoVvqwL
	 YvsJndke0ODS59dAbAqw0xdRrpZD0zkw5kWfpejs=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:29 +0100
Subject: [PATCH v13 06/28] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-6-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=4755;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=PxsK5/rFy7Kf63XUdwgL21pvBtzt71Kl2anWcGHOPSg=;
 b=Z14oOqtbVBgvdNpTYz8HHrfame0ZmLtB2F2W+VE1vgazt0ic4v4yh08aNRXxRVVztK496AxmC
 UvXfaWAfJlICTOHc/bdLQa6do1J7PqGl2DV0yDXGgkDuuQWxquop0TB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115204_884094_4D39B09C 
X-CRM114-Status: GOOD (  17.92  )
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

The hotplug lock is acquired and released in etm{3|4}_disable_sysfs(),
which are low-level functions.  This prevents us from a new solution for
hotplug.

Firstly, hotplug callbacks cannot invoke etm{3|4}_disable_sysfs() to
disable the source; otherwise, a deadlock issue occurs.  The reason is
that, in the hotplug flow, the kernel acquires the hotplug lock before
calling callbacks.  Subsequently, if coresight_disable_source() is
invoked and it calls etm{3|4}_disable_sysfs(), the hotplug lock will be
acquired twice, leading to a double lock issue.

Secondly, when hotplugging a CPU on or off, if we want to manipulate all
components on a path attached to the CPU, we need to maintain atomicity
for the entire path.  Otherwise, a race condition may occur with users
setting the same path via the Sysfs knobs, ultimately causing mess
states in CoreSight components.

This patch moves the hotplug locking from etm{3|4}_disable_sysfs() into
enable_source_store().  As a result, when users control the Sysfs knobs,
the whole flow is protected by hotplug locking, ensuring it is mutual
exclusive with hotplug callbacks.

Note, the paired function etm{3|4}_enable_sysfs() does not use hotplug
locking, which is why this patch does not modify it.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 8 --------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 9 ---------
 drivers/hwtracing/coresight/coresight-sysfs.c      | 7 +++++++
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index ab47f69e923fb191b48b82367dce465c79b3a93d..aeeb284abdbe4b6a0960da45baa1138e203f3e3c 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -620,13 +620,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	/*
-	 * Taking hotplug lock here protects from clocks getting disabled
-	 * with tracing being left on (crash scenario) if user disable occurs
-	 * after cpu online mask indicates the cpu is offline but before the
-	 * DYING hotplug callback is serviced by the ETM driver.
-	 */
-	cpus_read_lock();
 	spin_lock(&drvdata->spinlock);
 
 	/*
@@ -637,7 +630,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 				 drvdata, 1);
 
 	spin_unlock(&drvdata->spinlock);
-	cpus_read_unlock();
 
 	/*
 	 * we only release trace IDs when resetting sysfs.
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index b7312570a7ae1f0355c01b6f7a54ea2dd8891097..7011a20d20042cfbeaac51797cd8592275bbf1ca 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1110,13 +1110,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	/*
-	 * Taking hotplug lock here protects from clocks getting disabled
-	 * with tracing being left on (crash scenario) if user disable occurs
-	 * after cpu online mask indicates the cpu is offline but before the
-	 * DYING hotplug callback is serviced by the ETM driver.
-	 */
-	cpus_read_lock();
 	raw_spin_lock(&drvdata->spinlock);
 
 	/*
@@ -1130,8 +1123,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 
 	cscfg_csdev_disable_active_config(csdev);
 
-	cpus_read_unlock();
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 905c973e99cea884e242eab460b31544c49378ad..682500b7296c20453edd0290e1dc44124e0c3228 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -362,6 +362,13 @@ static ssize_t enable_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	/*
+	 * CoreSight hotplug callbacks in core layer control a activated path
+	 * from its source to sink. Taking hotplug lock here protects a race
+	 * condition with hotplug callbacks.
+	 */
+	guard(cpus_read_lock)();
+
 	if (val) {
 		ret = coresight_enable_sysfs(csdev);
 		if (ret)

-- 
2.34.1


