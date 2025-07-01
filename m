Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F86C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj5u2xuzGRQKjE92yfS7zVWTyLF5L5YFCmHheaH1rGM=; b=2lNm07pW3oa+Ty7GiQ4zVnzkyR
	vsMROgg61+cvxCjBu3RNrFSmsfriDccBYF3Ud3NaG6O0QUxUB+4OvmzVTTH/x42AQ08HEmbf6xQO5
	iRvG51ZeX5D5DlTBK+e49w19VnbBpaW5HKJUf/Ps1quHmtDMpyD+WeZEkwOzE12SaVOUII755Itme
	2plCqVPdo7rJh8BsYso4Jc70ERxVOXdOS5Uq6pzv9KOUoCjpbYWTi+UkXUgwcokURAI8LedXf1gwx
	ap2QHbgGfWHTX3hyaoaLgni0IZ07Qn+PKBrwFCmk1c3CfuuqO9UNO0jBftf5hXpQTXmM+tbXVDrbk
	yjBYUbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWemr-00000006DiE-1L1M;
	Tue, 01 Jul 2025 17:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNn-00000005n86-1RsH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E13712FC;
	Tue,  1 Jul 2025 07:54:35 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3F5E3F66E;
	Tue,  1 Jul 2025 07:54:48 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:51 +0100
Subject: [PATCH v2 26/28] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-26-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3393;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=imLCN5pbBZ69KZmy+sPaCR6UsA2UHcAU0iRo6B1qUgE=;
 b=+7xn+ZOvu0O7TNyGTQ20tw+4IT75NM/CS3bcOneran7FjGcw41X5o76x0KFOBvx/QaQrkElbI
 GzjgdbU93/1DcT0EYztZdMtntTS+wlIRINpBznSbT5wQGvuDCIdiTqh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075451_515689_69CD06C8 
X-CRM114-Status: GOOD (  17.70  )
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
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 9 ---------
 drivers/hwtracing/coresight/coresight-sysfs.c      | 7 +++++++
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 93ae8590ae2459db317f6367b6cffbf658b0e2f2..f99a48511850cd6e9682533880b22a3b8fc43135 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1086,13 +1086,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
@@ -1106,8 +1099,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 
 	cscfg_csdev_disable_active_config(csdev);
 
-	cpus_read_unlock();
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 14ee15297b98115122068cbe932f0b2ce004b77e..e89ea98d680be8d363674c1d46675e46565f210d 100644
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


