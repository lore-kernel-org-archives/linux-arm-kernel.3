Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D751099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t78sF+h3NHuwrZpMWJEJuzcWo+6gr+FTUJ6jVUfHaWQ=; b=2aovmeiVl1tiZV
	w51dUSpf758IJDkMXR4yECiV3iv8ofLZto3i8eK3sUnmZtws1mVxK4rWzatqFdwbWp1D3XfCYInMh
	kdEJU3Mu0t7pU6nNKXsdaoRn51c3Q7bKdIZj8QmqxWJDtRbD/dc+2cKfZEoK01Btaf/BydQ9h+KDJ
	ZOpqQPQDGnmXjRa1H8sJ/3SCBGBihb9aUTE9OTSoHSLOza8BRl0sjioOBuuwJd2EB7kw/C72+/j/y
	33FweTbzWra2/mWn3Q/dPeqzcdHel+QAf1FvviqZz6E5+qjkyi+dIPzXPzRvJx2uTER0ax/6oAC6h
	kbGVf2WFLwlgxhOdHngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsK-0000000DHkN-3DxO;
	Fri, 20 Mar 2026 17:43:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsI-0000000DHjb-2S8k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E071596;
	Fri, 20 Mar 2026 10:42:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A80383FA1F;
	Fri, 20 Mar 2026 10:43:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 00/20] CoreSight: Refactor power management for
 CoreSight path
Date: Fri, 20 Mar 2026 17:42:42 +0000
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOHvWkC/53OQW7DIBAF0KtErEs12IDjrHqPqkJjM9gsMBZYJ
 FXku5dYqpQu0938Wbz/7yxT8pTZ5XRniYrPPi41dG8nNs64TMS9rZk10CghQHJMwYwxUfbTvJk
 Vt9ms8UrJBFxwokDLZnxYUyzHzS0OstfanZszsKquiZy/HY2fXzXPPm8xfR8Dinx8/99VJAfeW
 jkMqDvZQf9RhfcxBvZoKupJF/3ruqq600JhCwItDH91/atraEG9ruuqk3OdVrYRAp+27/v+Axu
 EwduoAQAA
X-Change-ID: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=4322;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SYVjHHt8Mf/r3rASy5Rz/OV+66R9UH2Rf4/e6Fhqmf0=;
 b=Uilq/vZ3coHLKW2O/aWaz1nIfMOqRqDgiJrqn+He+kUVDjkjlg0ZZ3N6B6QDQ1TBFmzYDrAF5
 HDHsZ2UnkukB0DRHCkFpERBLBQ8lvptFoDO3kmd/xNIqflf2yI8+1Hh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104306_714199_17FF5372 
X-CRM114-Status: GOOD (  12.62  )
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

  Patches 01~07: Refactor the CPU idle flow with moving common code into
                 the CoreSight core layer.
  Patches 08~15: Refactor path enabling and disabling with range, add
                 path control during CPU idle.
  Patches 16~17: Support the sink (TRBE) control during CPU idle.
  Patches 18~20: Move the CPU hotplug flow into the coresight core layer
                 and simplify the code.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).

---
Changes in v7:
- Added a flag in coresight_desc to indicate CPU bound device (Suzuki).
- Used coresight_mutex to protect per-CPU source pointer (Suzuki).
- Added a spinlock for exclusive access per-CPU source pointer (Suzuki).
- Dropped .pm_is_needed() callback (Suzuki).
- Supported range in path enabling / disabling (Suzuki).
- Gathered test and review tags (Levi / James).
- Link to v6: https://lore.kernel.org/r/20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com

Changes in v6:
- Rebase on the latest coresight-next branch.
- Always save and restore TRBE context during idle (Will).
- Use get_cpu() / put_cpu() when set the per CPU source pointer.
- Link to v5: https://lore.kernel.org/r/20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com

Changes in v5:
- Set the per-CPU source pointer on target CPU (Suzuki).
- Reused existed enable/disable buffer functions in TRBE callbacks
  (James).
- Refactored refcount for source devices in SysFS mode.
- Released path in cpu-hotplug off flow to avoid memory leak.
- Updated ETMv3 driver when move common code into core layer.
- Rebased on the latest coresight-next branch.
- Link to v4: https://lore.kernel.org/r/20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (19):
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Move per-CPU source pointer to core layer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: syscfg: Use spinlock to protect active variables
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Control path with range
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for system tracers
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 377 +++++++++++++++++++--
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  25 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 154 ++-------
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  21 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 126 +++----
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 +++-
 include/linux/coresight.h                          |  15 +-
 12 files changed, 546 insertions(+), 323 deletions(-)
---
base-commit: a90863095f84f6d17c49716e4e2212d28a6b25b5
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


