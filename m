Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A43CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2Fg+BLfeWI0DUCqG+ksq3OssrQlj4dFdwqZq2zDHqE=; b=ORHP3TIFEwh0sZ
	/cXvx1odYVmqm6OVunxLl6RnN73h8xQLs8fdzb4nguxe0wBsSr7gF5/08lYeE3+MPkW8Tqu21YjPy
	jXgT6c83Au9SqCwxaAemFHIWIpmBysiClJ0+24YpTCkIZb9uC0UQQkG0eY0wOIiczdLmENtKkZpys
	C1gKwGDsoV3N9GWkiyzEAxAZrGlYC3F5IMMk/a8c91eBiRvz/YgIf/arvo86KrgZhLGe3LXR7XL59
	K8VNoFrPFMS5UwyGRkVA0ZSfesmUNKuGqOoGmNs2wm/XgWAdOGk+K3dHusYCXJtiMm3AS1LoMJgRj
	Sr9cfYOx9BYb9YQhhbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2D-00000007Qnw-2kRN;
	Fri, 01 May 2026 16:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2B-00000007QmJ-0cfe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F241692;
	Fri,  1 May 2026 09:48:03 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430903F7B4;
	Fri,  1 May 2026 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654088; bh=VE3fAU9GsOccnReasOwALVKHFC9wx2rXk3jhPrJ1rnA=;
	h=From:Subject:Date:To:Cc:From;
	b=uVt2wBwvuh5X3BBjvoubHFLDx4BdCnpZhAYqU+quHyacEyl9noQr2RpIDJeSVSj8X
	 X0AVvXmAlsqGKHcskbABlj1Edb27Qf5VI1co/qqgNzzsNPHOorV7xyz+pN4cB1KBYE
	 JBxkFJTDzgfZa+/1IBfoENTC4rBtqSB7nHsd5u/8=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v11 00/27] CoreSight: Refactor power management for
 CoreSight path
Date: Fri, 01 May 2026 17:47:41 +0100
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3Z9GkC/53SS26EMAwG4KuMsi6VHfLsqveoKpRMzJAFDwVEW
 424ewNSVWZ2sIu9+PzLzp2NlCKN7O1yZ4nmOMa+ywXiy4VdG9fdqIghNxgHLhFBFC611bVPNMZ
 bM1WDm5pq6L8oVa3r3I1a6qYqtkPq5+1dBOeFVao23ADL6pCojt/byI/PXDdxnPr0syWYxdo9P
 2sWBRRlEN47pYUG+56F12vfsnXSLHc62uO6zHqtULoS0AXwj7r60xWUII/rKutU11rJwBHdU3a
 90zkc1/W6Ga5DCKXy0jxlN3v9RHaTde3RAic0IPBRt/+6ADyu26yDxaBLEgI0f9QR9vyJ8Jj1A
 kuyQkvhjKcnH3c+P/EpEbPvjSUEzMcVu90vy/ILz1JrgYMDAAA=
X-Change-ID: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=5800;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VE3fAU9GsOccnReasOwALVKHFC9wx2rXk3jhPrJ1rnA=;
 b=jVAibNDnZSwJfGRPEMyJZ93NDMQ1GzlloEmsSdPyHRZyrj9SxKZ0LPkTIrkvHHKoS8DR8QOqx
 OOw1n15DU6pDKR8STyzS8nVFExwgBU+Mj9S7JSSFe/NpHIRzY5Nv8Ed
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094811_271870_D17B7496 
X-CRM114-Status: GOOD (  15.56  )
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

This series focuses on CoreSight path power management.  The changes can
be divided into four parts for review:

  Patches 01 - 09: Preparison for CPU PM:
                   Fix helper enable failure handling.
                   Refactor CPU ID stored in csdev.
                   Move CPU lock to sysfs layer.
		   Move per-CPU source pointer from etm-perf to core layer.
		   Refactor etm-perf to retrieve source via per-CPU's event
		   data for lockless and get source reference during AUX
		   setup.
  Patches 10 - 12: Refactor CPU idle flow managed in the CoreSight core
                   layer.
  Patches 13 - 22: Refactor path enable / disable with range, control path
                   during CPU idle.
  Patches 23 - 24: Support the sink (TRBE) control during CPU idle.
  Patches 25 - 27: Move CPU hotplug into the core layer, and fix sysfs
                   mode for hotplug.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).  Built successfully
for armv7 (ARCH=arm).

---
Changes in v11:
- Moved per-CPU source pointer from etm-perf to core (Suzuki).
- Added grabbing/ungrabbing csdev for device reference (Suzuki).
- Minor refine for error handling and logs in CPU PM (James).
- Refactored etm-perf with fetching path/source from event data (Suzuki).
- Fixed Helper error handling (sashiko).
- Added Jie's test tag (thanks!).
- Minor improvement for comments and commit logs.
- Link to v10: https://lore.kernel.org/r/20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com

Changes in v10:
- Removed redundant checks in ETMv4 PM callbacks (sashiko).
- Added a new const structure etm4_cs_pm_ops (sashiko).
- Used fine-grained spinlock on sysfs_active_config (sashiko).
- Blocked notification after failures in save / restore to avoid lockups.
- Changed Change CPUHP_AP_ARM_CORESIGHT_STARTING to
  CPUHP_AP_ARM_CORESIGHT_ONLINE so that the CPU hotplug callback runs in
  the thread context (sashiko).
- Link to v9: https://lore.kernel.org/r/20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com

Changes in v9:
- Changed to use per-CPU path pointer with lockless access.
- Removed the change for adding csdev->path, the related refactoring
  will be sent separately.
- Re-orged patches to avoid intermediate breakage (sashiko).
- Link to v8: https://lore.kernel.org/r/20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com

Changes in v8:
- Moved the "cpu" field in coresight_device for better pack with new
  patch 01 (Suzuki).
- Added check if not set CPU for per_cpu_source/per_cpu_sink (Suzuki).
- Renamed spinlock name in syscfg (Suzuki).
- Refactored paired enable and disable path with new patches
  10 and 12 (Suzuki).
- Link to v7: https://lore.kernel.org/r/20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (26):
      coresight: Handle helper enable failure properly
      coresight: Extract device init into coresight_init_device()
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: perf: Retrieve path and source from event data
      coresight: Take a reference on csdev
      coresight: Move per-CPU source pointer to core layer
      coresight: Grab per-CPU source device during AUX setup
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant checks in PM save and restore
      coresight: syscfg: Use IRQ-safe spinlock to protect active variables
      coresight: Move source helper disabling to coresight_disable_path()
      coresight: Control path with range
      coresight: Use helpers to fetch first and last nodes
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for system tracers
      coresight: Move CPU hotplug callbacks to core layer
      coresight: sysfs: Validate CPU online status for per-CPU sources

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 530 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 268 ++++++-----
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 166 ++-----
 drivers/hwtracing/coresight/coresight-priv.h       |   6 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  38 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 133 ++----
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 include/linux/coresight.h                          |  15 +-
 include/linux/cpuhotplug.h                         |   2 +-
 13 files changed, 833 insertions(+), 472 deletions(-)
---
base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


