Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CECC109B497
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D84sg5DEvgep1l1NYTpSRNmV90AYfAB2C1ZXry14ag=; b=V1mKC1qMUPCY9TY3JwDyTARAaX
	qeAAjoxU1E2EsQtriJ57DtoUf1w77elIhU/PTCJXGqhzYU8rvomxrJrnMKT52/TvkZduPmYVlSiFS
	F5BOgkI3hzmq8RkkXpkxmAA8JhRcAuE7Nfgr9OINK7r85gGoW5khtCgV4TtXeogaQ+tpTbhEnrug6
	Ny/6yZh9Z6kHk+zeC+wOZZiM9RQPN1JsZ545R5XG2MsKC/xBb4i2wXdW+Porii4SQA/rWnsHQmAxp
	hYawaiyYiq0vWxQRNsDHYYSk+62iGSaSLRYjdK2A5uqID1jjy7ZEhdKZwriuZSrwQxenER+B3SQzu
	xPX+5c8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx3-0000000FuZb-3DGg;
	Wed, 01 Apr 2026 18:06:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx0-0000000FuVi-2VQU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0D84sg5DEvgep1l1NYTpSRNmV90AYfAB2C1ZXry14ag=; b=ShLMHPEwlUvGdj4G5G4yqzVkbh
	nDuuLQ69/YrFhBFeRpKaAJJZTmvBbE2sv++1iAHxlBKtW/VvBQaeU0eHnNPx5HU9Mhjn8BswfIoRr
	DKsLr0mw5GJr1e7MXYyBqYW/+lQriPFesnO84p09x5iCPsqEa9Uwte+LB/nDkNC1uy0BO3NlFOSAC
	SbFGmpLxT1P6Fmp06Yo4Th+lw+VZ5rRbnLzj1hoTmzHUrN8+qr6Y3unIZ4NqO0eWWAKV97D5k2VFT
	+T955sAjcLTLplOGkN/PvlOOu+ETLde88JqRmHwixrfjYvB4dQ+i/xDxDDz3XiONa7onu02u+fSDu
	lQCg0U+w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zwx-000000014VT-1R8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:05:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F5AE1A25;
	Wed,  1 Apr 2026 11:05:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24EF73F7D8;
	Wed,  1 Apr 2026 11:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066754; bh=x5jIUxZLaQYikh/SVlaxrAj2zETN6kq+TlgshPKEwXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PO4BRl6eyHojvKH/M7FzJ1i+NhXBqITgobsVLGOA/nqO3S9jj6HncVQCwbmoXxnoV
	 5II/OPDHOC1FnVp4dd0/zdSyCXsDnamqJPLi00OtQRRPhLKbKmfgUWwB1DxqHsXT9f
	 fA2qffmna4ZkJmkPvk4slHrAnLZwJnUAR02hdQTE=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:33 +0100
Subject: [PATCH v9 04/20] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-4-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=4708;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=x5jIUxZLaQYikh/SVlaxrAj2zETN6kq+TlgshPKEwXo=;
 b=ciJbo0qGXYXPHUEpLKNbPQzVxmF+gPBhgnmE9NTUYKJFzAEbPOVG1uaS7OMjtx+RrKwo3+ndJ
 J4ekX2wE7oWC5kSnvzYuNSu21e9zee83Wc9dKavd5lShqhdA2hn1qvG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190555_804208_CD9C45A4 
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
index 66a8058098376264d3f8c5815763a75ebffb352e..a776ebb3b2b0360c99a8dadacfde4c2303dd59d6 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1106,13 +1106,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
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
@@ -1126,8 +1119,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 
 	cscfg_csdev_disable_active_config(csdev);
 
-	cpus_read_unlock();
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 3b1e7152dd108408d837c404ce607ba511ca14a6..f398dbfbcb8de0c5a873837c19b3fdcf97b64abe 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -360,6 +360,13 @@ static ssize_t enable_source_store(struct device *dev,
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


