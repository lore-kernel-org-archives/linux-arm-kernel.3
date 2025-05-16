Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D15C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U6ZO07bVSgP4KFgbYTJ+/8+3hSMZ3ksA68KfXvg2SE=; b=2ODB++bPUnB+GsTpIE8MmPQ6q6
	gExTKD5H6Pt8qK5T6AQ7UnSzItM5Eja4wOdCTmnC2K2BZGqz7FwXd9fu+PLY8xjsVIhHPbXEgYtPQ
	cK5BCkjPbf6MdOII2XgSwT9TKPJFDrQUu18ixezv9JdVPsiNyjdQkwFMxw2HTAR5TWCaZgZSfjxW3
	d28EPYWAuALeBF1FouqEDVdmZbY3CKPAKRsW8zSlcaYeZyNQUUvz9E5L1YBdETMuKeXjMrhMBkDM6
	MXO0R6xwHbYYJVUXKjpsK9bgHVebjffOeopgLFyNkiLTCy78UQPwpVsdqzOjcRofwf9QiRo8ZTcX6
	XHzEqshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyAF-000000042k5-1p5s;
	Fri, 16 May 2025 16:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbO-00000003yPd-04FZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:08:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F5B1BF7;
	Fri, 16 May 2025 09:07:49 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 786C43F63F;
	Fri, 16 May 2025 09:08:00 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 09/11] coresight: Take hotplug lock in enable_source_store() for Sysfs mode
Date: Fri, 16 May 2025 17:07:40 +0100
Message-Id: <20250516160742.1200904-10-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090802_190615_BD82C6EB 
X-CRM114-Status: GOOD (  18.46  )
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

The hotplug lock is acquired and released in the etm4_disable_sysfs()
function, which is a low-level function located in the ETM4 driver.
This prevents us from a new solution for hotplug.

Firstly, hotplug callbacks cannot invoke etm4_disable_sysfs() to disable
the source; otherwise, a deadlock issue occurs.  The reason is that, in
the hotplug flow, the kernel acquires the hotplug lock before calling
callbacks.  Subsequently, if coresight_disable_source() is invoked and
it calls etm4_disable_sysfs(), the hotplug lock will be acquired twice,
leading to a double lock issue.

Secondly, when hotplugging a CPU on or off, if we want to manipulate all
components on a path attached to the CPU, we need to maintain atomicity
for the entire path.  Otherwise, a race condition may occur with users
setting the same path via the Sysfs knobs, ultimately causing mess
states in CoreSight components.

This patch moves the hotplug locking from etm4_disable_sysfs() into
enable_source_store().  As a result, when users control the Sysfs knobs,
the whole flow is protected by hotplug locking, ensuring it is mutual
exclusive with hotplug callbacks.

Note, the paired function etm4_enable_sysfs() does not use hotplug
locking, which is why this patch does not modify it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  8 --------
 drivers/hwtracing/coresight/coresight-sysfs.c      | 12 +++++++++++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d5fd9e58a962..e5a7c0dd7f8e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1032,13 +1032,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
@@ -1048,7 +1041,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
 
 	raw_spin_unlock(&drvdata->spinlock);
-	cpus_read_unlock();
 
 	/*
 	 * we only release trace IDs when resetting sysfs.
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b53..ea839a5e601b 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -359,14 +359,24 @@ static ssize_t enable_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	/*
+	 * CoreSight hotplug callbacks in core layer control a activated path
+	 * from its source to sink. Taking hotplug lock here protects a race
+	 * condition with hotplug callbacks.
+	 */
+	cpus_read_lock();
+
 	if (val) {
 		ret = coresight_enable_sysfs(csdev);
-		if (ret)
+		if (ret) {
+			cpus_read_unlock();
 			return ret;
+		}
 	} else {
 		coresight_disable_sysfs(csdev);
 	}
 
+	cpus_read_unlock();
 	return size;
 }
 static DEVICE_ATTR_RW(enable_source);
-- 
2.34.1


