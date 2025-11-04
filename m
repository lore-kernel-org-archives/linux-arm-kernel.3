Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5585CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=778v4NmWPa3PgkoilE68pcMDsz6/RM9xJbpFZ7RKFb8=; b=uC77HQJyZ7oAsUHF8aEFXADIRo
	Ypy1n0sVNk4uOu9rJZ1Il7RmXOs/c3kiRaTA12vMU4ixxe6UQdtFijP4mOtxnJxy2Y4p3RqiDX/30
	Nic18ZXtwWh3fKTR7NpHPSPhWObNpZJtD8GUOpa9ekpWtkvQmP/aWOaNih184KGF50xfBcfaVhn0o
	c4PhaLWVVof1Rezyfa7hnhsvDFEr5OskRym3DSeX2wCrusgX5g1k3WXAotch3DFXPR3MTKaFoabPb
	PaRAOKrbCVbvrPnlD1weg0LqnN2lYeG/4Dwc20RpFBq56B3QuktgqUEk4Yu9iZWtwgn9LP4doyR12
	1CE7ubYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIsF-0000000C4Za-2tFl;
	Tue, 04 Nov 2025 15:23:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIsC-0000000C4V5-2oTi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 15:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=778v4NmWPa3PgkoilE68pcMDsz6/RM9xJbpFZ7RKFb8=; b=mHo2fK0iou2/xlblHmq7nl0GjY
	pb6s9Zs0unVqncmVhWdg7X2L/fwj17TzKiu6RqQ6BTdh5crShtZ/tCPXeGlXB5TDwPgfGGDRFkDTl
	Pvo+U817f/H/pveE5bm12jDFcqN4qeoB7YTVbO7+xJoBxqRpiAcSTfhxR9FSWvjqSRibrw2RCsWYW
	jmSqjrNJv96kbNwTfnsdQg5D+a2buEzJgCIYYq2XZOeE0rwOHFVV6/9HjjjHfJwbLIxQWQaRj2Ayi
	4L7eMr8cADRm41eUv0vxgsZjGYUTjRra4lToumismlIX2X8ZNWCpe+28kcCTnukHC8iK6jmq1Vd3l
	nnmOTRaQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI0R-00000000IQx-2vHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:27:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6503F2C41;
	Tue,  4 Nov 2025 07:22:51 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA673F66E;
	Tue,  4 Nov 2025 07:22:57 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:58 +0000
Subject: [PATCH v4 14/15] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-14-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=3442;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=F6tjhTQxWCJyErifaPxvwP9MA3ZhuW5tv5QMSckSvbk=;
 b=R88fFRi6yjPGByjcmTwJsWvJlFSh2SLAAvXtBAczvJ4x8G5Y0RV5gHRzrAxLReNUwHJOVCAzG
 G1XNhbzazwaCKBC+Dbx54GNcd/Hey1fieTnj+vk25v5/wI3EJ9xQ1GE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142732_114781_19143412 
X-CRM114-Status: GOOD (  17.35  )
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 9 ---------
 drivers/hwtracing/coresight/coresight-sysfs.c      | 7 +++++++
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index af2793cdb983c85f883efe10d7633f9cf718a44f..7bea3d2c6f49a2169b8e3de1cb07cc22147aae3a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1090,13 +1090,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
@@ -1110,8 +1103,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 
 	cscfg_csdev_disable_active_config(csdev);
 
-	cpus_read_unlock();
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 72e9607fc6aea4663abf7d1f7f03f247ea060b83..781290d8ecd63ef7d568d8045d422d87c6221e6b 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -363,6 +363,13 @@ static ssize_t enable_source_store(struct device *dev,
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


