Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA48CCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBKk546wIa0wyqVvj44lyfAavOv6v2xCxQMd3iPifrk=; b=zAVmds1LTrVw99k4sfcsICKOz2
	YlAW/epOvMhS7YP7OSWmK+AxuvbCEZh/PwGavUEiENdw1Nzosd9wZQpftqZ96QnquFbGJgQvCP9CE
	B1RTLRb/HrWM8V/K5n2VTuthCb+OXZV1IDPfehP2G36x9PzLFF9kSKRlEWWv+pD+Y81RSLNrFItSa
	PobkpBlWCeTggzvyattasqP9Szt1iC2XZ/9qHU/C2HuMnIvPIuSBJiJHz13kZo7mILZIpP2edxODR
	DBIxWePaulm2DlrEggktGZcoa5WvObwEf3ab2I02Lu2ZBb1fYBoyJHiSpfzrR+HXDf14BTFDAbVNw
	nM8qeL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6YP-00000003hKE-1uCU;
	Mon, 15 Sep 2025 10:35:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xj-00000003gNt-3YHV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fBKk546wIa0wyqVvj44lyfAavOv6v2xCxQMd3iPifrk=; b=XjWYdpx4HGLTIXvy4rlg8gR+J8
	V8HQs34dPaa2Zcp1crAKF0v1qr3qHLevJ1IzQp/AowdFevkkLAo7iUbGiLWLY3xseuBrotg4gPGsz
	nfwtnyt9VnejOi+c2ojPkH8U08mm3cCd3CXqWQMNWl9oHmlFws0J8hlT3EUcZlpWtuRlBmlZVF22U
	AZhX0naolGeQT3nu9l+CfzW2gyrFkJ5MtB9kopTORcDyLn2taHQSMe64m2duLRL3b9fP/O1ZC5ZXD
	JM/p500kumDioKPK6TH/tJ2dLb7pfw/edGeFax4TOTgY1ts4UmLxIgN8sIb9has1ez+tOKHeJ9DAF
	tu5cfYeg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xe-00000006vdd-0oCp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25AB81424;
	Mon, 15 Sep 2025 03:34:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC44E3F66E;
	Mon, 15 Sep 2025 03:34:35 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:52 +0100
Subject: [PATCH v3 29/31] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-29-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3393;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=J/gjXWB3YlGT1qEVZQfVCNf4HObK7okmRsI3Zjx8WWw=;
 b=qjka+o2t3uVIpOAcYiSinnGSk/TKCB8pkTiunX8S1kpbYbAOVB2HkJLAJyGgW4ufC25zIRuWx
 B7tdQRbTuPVBc+L+14DWwifbxZYIR6wh72vxv2SvfUFrW7OqB/lZ2S1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113439_270000_2E849BCA 
X-CRM114-Status: GOOD (  17.59  )
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
index 4218cefca63d7b2f3b102e74d7f007ebc7b08861..920c817de8c33751760a1ed7ab1df8437620bb4e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1088,13 +1088,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
@@ -1108,8 +1101,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 
 	cscfg_csdev_disable_active_config(csdev);
 
-	cpus_read_unlock();
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8..a4c5a334703f0bb35db5eeda87ae5a9756f6a453 100644
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


