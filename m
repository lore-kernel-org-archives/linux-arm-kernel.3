Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BF7CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6k6peshkzDruYGvM6ivPIebIUYOwdZHXQlCcSUwwSw=; b=dpJbOadcmc8hu65E8NtwaYua1o
	2RHwO2xj3Wn+amGp2Kkq7U638aPEeBHg+KqS+JiF+eAjOooGyCmqyS4+xImaVIi1KRj3wH48BsBr5
	6O52euGX/Ix4x5d/BGrdJE2xqrpzIPzWFbWeeL4y8URV0uOXP3xDW2U+3WWl9tqBH/PEHzH63CvNP
	0d5h9N8Myyh5oL/rvNutC/ko+HEBNhq4rP9kFuXPE1n4gGZYgaLHU2QVe5dVshM5LzQjzmklJVtBN
	AHOEI7CsFHmWQDBZMIRgakW40giTo7U4uqrlMX2Xd3qML0coAXiDIKw+MzmtGKRyX/4+uzm5hxc8D
	xGPfOtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXm-0000000DEw4-1cpH;
	Mon, 11 May 2026 11:11:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXj-0000000DErd-0ERO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662D816F8;
	Mon, 11 May 2026 04:11:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E54D03F85F;
	Mon, 11 May 2026 04:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497881; bh=FmdKYTNrPnTY0HupDgr6JlxlBr2rH6UpNXJW0vEIUng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8b7uyNTuTywmOSZGEExAhHtyL1+XEoG6rS0rzhfOAwjhdt/YL8AxNCmLsNVWhu5/
	 qyWne5aGt43vOdCWFTgW+pPaBj53rNrf4E1J+lOUx4U2uTUvTpQCX8CDcdbW383but
	 La5u44vvwEgDrdKhENaDuq2fPvP3XXMBLyBIca7k=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:50 +0100
Subject: [PATCH v12 06/28] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-6-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4755;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=FmdKYTNrPnTY0HupDgr6JlxlBr2rH6UpNXJW0vEIUng=;
 b=OaQzRnBGYEelpgdb+vwN7Lq5gcjXMEI9Wl7zKoXjTEB/gLqY6ku4d5kMwYqfqxvbKVED0pjM4
 HQEDFDhOoS/Dr+GhkDuvwMTqnJdko2RoUpfpyPkoaQ6GvaxXIX2L5SW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041123_223075_39F0E276 
X-CRM114-Status: GOOD (  17.77  )
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
index 3087de9e1c12a66ea15a73f92564d623d75d68ec..b24b0d08a462cbe992cf26e03b47693b2cf5f8e9 100644
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


