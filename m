Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rd2iXqcobE9TLoxH1kOiG5XkPL8WAYRyCcPFE3hgWKM=; b=P6OZwI9mO1KQjG
	BKs6QYeEhdHmnli9p/Jy03JgLtPmh40XbGqnhyXS3qDjAacbnGvV7AZ4V7psUNCgogm6Cj7/0tRnU
	MJyWBGw0uuBlDVFzWMZqYhDu687YRZOP9hmTJrR2l+yExFUo2ap1IS1lHvEmUf6jzvUbG0MRsv6ql
	yEQ74lGIzW/JQUfXyvgkghVFl9Ae7y4j8ZS/jM5ZkNoZAPyftvz0lGQD6WE6xDV01HSjZPCAScJ6K
	LNb6xXmVbxNV/HKxB+hZ6yKjQuQHZwA1qN/5/fUsUI+vHZMtWF/LyVsxVQ/d4aaGudDo+N0ku1cuD
	0r4SnWtHuROw0P9LLa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypf-00000009IYS-2VWx;
	Fri, 15 May 2026 20:08:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypd-00000009IXv-2mQc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:08:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D032938;
	Fri, 15 May 2026 13:08:18 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A37F3F836;
	Fri, 15 May 2026 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875704; bh=HFWJf5P6CgjC+Ikp/PnRXfBm78jptfcsMyD5D3y28pM=;
	h=From:Subject:Date:To:Cc:From;
	b=ULPjV1aWsCKQWenDQ8eIauZcCe+OMrzsmvQTTf5orGLgv+YmQEsMeJDwnVqw9Dvb/
	 lqd+Civn5Mx2RAyNv7K9O2qD77s9kT2maBLrwddu9BxLAqPwW5UhLVh/a/TNLqKrl9
	 lfE2ITIMiG1NNS3ggyja9ewtO8JA2yqSuWCqbUYQ=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v14 00/28] CoreSight: Refactor power management for
 CoreSight path
Date: Fri, 15 May 2026 21:08:07 +0100
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACh9B2oC/53SSW6EMBAF0Ku0WIeoynjMKveIIuSh3LBgECCSq
 NV3jyGKmmYHO9uLV1/fdctGGmoas7fLLRtorse6a9MF+csl85Vtr5TXIT1kDJhABJ7boSl9N9B
 YX6up7O1UlX33RUPZ2NZeqaF2KuumH7p5PefBOm6kjJppyJLaDxTr73Xkx2e6V/U4dcPPmmDmy
 +v5WTPPIS8Cd85KxRWY9yS8+q7Jlkmz2Ohojusi6VGisAWgDeCedfmvSyhAHNdl0ilGJUVgiHa
 XXW10Bsd1tTTDVAihkE7oXXa91U9k10lXDg0wQg0cn3Xz0Dngcd0kHQwGVRDnoNizjrDlT4THp
 OdYkOFKcKsd7Xzc+OzEUiIm32lDCJg+lz+6f7n8seJMKysbvYrOBGEj+l1s9oid9v2Ez5ZavAn
 eYSDtdwuJxdY/U3uRfBOiF0JTkGJT+/1+/wUGmeD5mgQAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=6111;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HFWJf5P6CgjC+Ikp/PnRXfBm78jptfcsMyD5D3y28pM=;
 b=he0P817sUzBwSagJxY5FoIlaqdxRuqwmXBh/a/AX2DRHWebiYgMoH8yGgPz4BVQziw3ASzT1a
 5w2GJEhUNv9CqTbZUPR5dsd0Z7MfhoAZm4VjxzH4cMxRlUiUANwc0Xq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130825_851712_3530E5EA 
X-CRM114-Status: GOOD (  15.11  )
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
Changes in v14:
- Fixed percpu_pm_failed write with per_cpu(percpu_pm_faile, cpu).
- Link to v13: https://lore.kernel.org/r/20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com

Changes in v13:
- Cleared percpu_pm_failed flag when source is unregistered (Suzuki).
- Rebased on latest coresight-next.
- Link to v12: https://lore.kernel.org/r/20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com

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
 drivers/hwtracing/coresight/coresight-core.c       | 551 +++++++++++++++++++--
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 288 ++++++-----
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 166 ++-----
 drivers/hwtracing/coresight/coresight-priv.h       |   6 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  38 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 131 ++---
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 include/linux/coresight.h                          |  27 +-
 include/linux/cpuhotplug.h                         |   2 +-
 13 files changed, 874 insertions(+), 482 deletions(-)
---
base-commit: f4526ffee6ff9f5845b430957417149eded74bf3
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


