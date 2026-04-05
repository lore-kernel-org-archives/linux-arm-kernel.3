Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE0DE9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ycNIMP2CGdK0886dy1a4e69JNNO1lDRsJwkBSd82XXA=; b=VZVt70OJgqI9HJ
	9KgBQ5HlPZGRWtXPIQuMMw4zjsEyEsT5Bnr3H6S4xjf34A2xftS7J9rC+nH1hYBk5AQCvXdRzotH7
	f7FsK308wVYtfnpR3m91DFWvag5P+JUefTyu/tWJt7LdkUf/2nHXUy42BOGwpSnVe4xkArXuqNK/M
	LWHRdOgmxtutsJMuq3uqsazHmRBwsiqbY21inpD/7Dmpx3bx074xMWe3kYNFuaQSVOng6SCaJMNY6
	XDYrf+Sng12Nr2vl2xulDurmCWrcHn6UPynkMVeK+u5vBHl8O14S2TvHSkHIavQ9GEyNrn9KJFMYk
	4jvL5e8YOWDesH4EmNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0F-00000004H5t-28E8;
	Sun, 05 Apr 2026 15:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0C-00000004H5H-3Vfq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9354D1758;
	Sun,  5 Apr 2026 08:02:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CAF13F62B;
	Sun,  5 Apr 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401381; bh=8pITdSrW3ljd8/QSjY45HZbpWAoRrRZWvX4r04fHGyU=;
	h=From:Subject:Date:To:Cc:From;
	b=Sxw4hWzlJJgUNPWZN4zSWhgLs5o2FtdRgAp5OMHT3/PtgKXFbuyaSEUD9WVOhvJ5/
	 rPO2ifR6b16m+hU+kAhLaC7rVD5o0X8m4p8PqexJvyVhOCThT7yZ5p7JRvkYQ9ASZ+
	 6nuR0/kDeAS1KwzxS7TAiOut0ouVh9fwgIq8i2nE=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v10 00/20] CoreSight: Refactor power management for
 CoreSight path
Date: Sun, 05 Apr 2026 16:02:36 +0100
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIx50mkC/53QTW6DMBAF4KtEXpdqxvg3q96jqpCNDXgBRgbRV
 hF3r0GqQrIju5lZfO9pbmTyKfiJXC83kvwSphCHvCC8XUjdmaH1RXD5QChQjgisMKmv6pj8FNp
 urkYzd9UYv32qejOY1vd+mKvQjyku+1w4Y5kWolFUAcnqmHwTfvbIz6+8d2GaY/rdGyxsu76et
 bACitIxa42QTIL+yMJ7HXuyJS38oKM+r/OsNwK5KQGNA/uoi39dQAn8vC6y7ptGCu4oonnqLg8
 6hfO63D5DpXOuFJarp+7qqL/QXWVdWtRAPSpg+Kjru84Az+s666DRydIzBpLe9XVd/wDddNlFw
 wIAAA==
X-Change-ID: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=5163;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8pITdSrW3ljd8/QSjY45HZbpWAoRrRZWvX4r04fHGyU=;
 b=+PF/KDQxm4QLq5+4vb4NH5LfGFu+PnSzpVa0ty1UKMZ5fEKf9sGKi55sI7rQr7E/S/cTnlSEb
 iNuzikDt4jtAsMJoleRr4TXhszlnK0EAdcG+OQP650gRsLSJhADs0EX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080305_069977_98BD4EAF 
X-CRM114-Status: GOOD (  14.36  )
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

  Patches 01 - 04: Refactor the CPU ID storing in csdev, later patches
                   consume csdev->cpu.  Move CPU lock to sysfs layer so
		   it is safe for later changes.
  Patches 05 - 09: Refactor the CPU idle flow with moving common code into
                   the CoreSight core layer.
  Patches 10 - 15: Refactor path enabling and disabling with range, add
                   path control during CPU idle.
  Patches 16 - 17: Support the sink (TRBE) control during CPU idle.
  Patches 18 - 20: Move CPU hotplug into the core layer, and fix sysfs
                   mode for hotplug.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).  Built successfully
for armv7 (ARCH=arm).

---
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

Changes in v7:
- Added a flag in coresight_desc to indicate CPU bound device (Suzuki).
- Used coresight_mutex to protect per-CPU source pointer (Suzuki).
- Added a spinlock for exclusive access per-CPU source pointer (Suzuki).
- Dropped .pm_is_needed() callback (Suzuki).
- Supported range in path enabling / disabling (Suzuki).
- Gathered test and review tags (Levi / James).
- Link to v6: https://lore.kernel.org/r/20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (19):
      coresight: Extract device init into coresight_init_device()
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: etm4x: Set per-CPU path on local CPU
      coresight: etm3x: Set per-CPU path on local CPU
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant checks in PM save and restore
      coresight: syscfg: Use IRQ-safe spinlock to protect active variables
      coresight: Move source helper disabling to coresight_disable_path()
      coresight: Control path with range
      coresight: Use helpers to fetch first and last nodes
      coresight: Introduce coresight_enable_source() helper
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for system tracers
      coresight: Move CPU hotplug callbacks to core layer
      coresight: sysfs: Validate CPU online status for per-CPU sources

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 419 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 168 ++-------
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  35 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  50 ++-
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 include/linux/coresight.h                          |  13 +-
 include/linux/cpuhotplug.h                         |   2 +-
 13 files changed, 566 insertions(+), 276 deletions(-)
---
base-commit: ec687ba84000d7d50cf243558041f6729d1d8119
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


