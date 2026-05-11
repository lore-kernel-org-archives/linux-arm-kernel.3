Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DFECD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EdNxn8nwicTlL80kBj2Sz73YSDODYC1K8nB+ISwqKgQ=; b=wTQDW1X5NneK2B
	hxs8GknEeYNpx05we6qeAbqBWlUyKwYwLGz6Eg89IeIx2MOqgKVboPIktr5tAoyxRNGlxV+qjm/iM
	uNwPylea/wA9+JzdhozUQChsRjxMEWHfgQRPapoi8QMPxwq5WEtcPQrqNXEk++LGpDADqJ/ImC7Kj
	Kd8X2btRjSrq3+iR2kTKVTYvmuMr4ai4S1J2lKelROLB/3xFJqm/+55NSuCcyWyWlpBeoBwzVr6iu
	5t+Y5PFC76tpjMRwIYbfmMmso4i4Xh1gsjR27G5MEVx45Rz+Ai0Yzzm6gVe5vB0vmM7+bAu5QawLX
	wbFDTM1ussebaFGapiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXV-0000000DEjI-3KHH;
	Mon, 11 May 2026 11:11:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXR-0000000DEiM-0AbA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D2E716F8;
	Mon, 11 May 2026 04:10:58 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C33903F85F;
	Mon, 11 May 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497863; bh=/pPcHBSo82ak6wi79zFzVWMYlBPy4tI/zzqBvkyc5AI=;
	h=From:Subject:Date:To:Cc:From;
	b=f3QNAqKdlThDL/7CixBCFhajS3XmyvLnkMDNCGDOh+Zo7AwR/6PcNXnSFt3wLyaTY
	 yKcuAOQKrL+qPLMQgRmA8b3KkrYtkOo+36D+jRhRdqgx9V8HWcB5lMn+4eaa17GnBE
	 Tf7Uud/IKpxs5QFs2gxHQ6FFJzo0H58hsEzoXO8c=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v12 00/28] CoreSight: Refactor power management for
 CoreSight path
Date: Mon, 11 May 2026 12:10:44 +0100
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW5AWoC/53SzW6DMAwH8FepOI/JDvncae8xTSghTsmBDwXEN
 lV996VMU2lvcIt9+PkvO5diohRpKt5OlyLREqc49LlA9nIqmtb2Zyqjz42CAROIwEuburoZEk3
 x3M71aOe2HocvSnVne3umjvq5jt2YhmV9l946bqQMmmkosjomCvF7Hfnxmes2TvOQftYEC791j
 89aeAll5blzViquwLxn4bUZuuI2aREbHc1+XWQ9SBS2ArQe3KMu/3UJFYj9usw6haCk8AzRPmV
 XG53Bfl3dNsOU976STuin7HqrH8ius64cGmCEGjg+6uauc8D9usk6GPSqIs5BsUcdYcsfCI9ZL
 7Eiw5XgVjt68nHjswOfEjH7ThtCwHxcft/9y+mPFUe2srKhUcEZL2zA5h77er3+AmXfVb7aAwA
 A
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=5645;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/pPcHBSo82ak6wi79zFzVWMYlBPy4tI/zzqBvkyc5AI=;
 b=knkYKTxwvNo3WWZKJHKmdW9ZsweudVDSVLqYQvq/CLlKPABDu7Tib8EG2Xq6ioBqJK+8gU9ox
 XR65G5cEyqODzJP9dBj8dKCiTfk6dAL17xQfQuysBz835xs6RbbbS4p
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041105_292175_ED66627E 
X-CRM114-Status: GOOD (  15.20  )
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

  Patches 01 - 10: Preparison for CPU PM:
                   Fix source disabling on idr_alloc failure.
                   Fix helper enable failure handling.
                   Refactor CPU ID stored in csdev.
                   Move CPU lock to sysfs layer.
		   Move per-CPU source pointer from etm-perf to core layer.
		   Refactor etm-perf to retrieve source via per-CPU's event
		   data for lockless and get source reference during AUX
		   setup.
  Patches 11 - 13: Refactor CPU idle flow managed in the CoreSight core
                   layer.
  Patches 14 - 23: Refactor path enable / disable with range, control path
                   during CPU idle.
  Patches 24 - 25: Support the sink (TRBE) control during CPU idle.
  Patches 26 - 28: Move CPU hotplug into the core layer, and fix sysfs
                   mode for hotplug.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).  Built successfully
for armv7 (ARCH=arm).

---
Changes in v12:
- Added comments on coresight_{get|put)_percpu_source_ref (Suzuki).
- Refined failure handling in path enable (Suzuki).
- Added coresight_is_software_source() helper (Suzuki).
- Reordered taking ref on csdev and its parent in patch 07.
- Define the enum mode with bit flags.
- Minor improvements on commit logs.
- Rebased on lastest coresight-next.
- Link to v11: https://lore.kernel.org/r/20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com

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

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Jie Gan (1):
      coresight: Fix source not disabled on idr_alloc_u32 failure

Leo Yan (26):
      coresight: Handle helper enable failure properly
      coresight: Extract device init into coresight_init_device()
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: perf: Retrieve path and source from event data
      coresight: Take a reference on csdev
      coresight: Move per-CPU source pointer to core layer
      coresight: Take per-CPU source reference during AUX setup
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant checks in PM save and restore
      coresight: syscfg: Use IRQ-safe spinlock to protect active variables
      coresight: Disable source helpers in coresight_disable_path()
      coresight: Control path with range
      coresight: Use helpers to fetch first and last nodes
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for software source
      coresight: Move CPU hotplug callbacks to core layer
      coresight: sysfs: Validate CPU online status for per-CPU sources

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 548 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 285 ++++++-----
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 166 ++-----
 drivers/hwtracing/coresight/coresight-priv.h       |   6 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  38 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 131 ++---
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 include/linux/coresight.h                          |  27 +-
 include/linux/cpuhotplug.h                         |   2 +-
 13 files changed, 870 insertions(+), 480 deletions(-)
---
base-commit: 0ec0a8785d21f63db520bd9d2a67c55e855d36a8
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


