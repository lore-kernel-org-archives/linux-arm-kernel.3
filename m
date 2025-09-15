Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2929BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MFPThPIbJCsVZzOSgOP8P0f+CrwCfRdBUQOmUeh8Las=; b=RpSRGPhBEQEGbL
	iN2FUrTJ6yHrxWJIgOeC1N8eXG++yzUg65Cxbh3hIEazEgQnuYxBWifEXPzD2E7iQF2Rl90J4hBbQ
	IbBm0aEDk0858IdCKYSNexxvwXh/hub8yVCm7JhDPqH1oXgKJnuZsAksLXGVM1nhBSMZGfJ0zm0T2
	GeeMS2pxUzt1iMxobAYUXNJoQVpAx+V47iUEX3p1TdkXbSQVtcGp5nLMZhMf5k9BwvxuHSbrPZdBb
	s8uhpSYh+d1OgMrW2OFFszXOb4RoYcwtdWIFsQA7ynjaTyg+ArCoswpzw0LpapQqHvT5Mgrqg9O8U
	xMe2Qwn7jjX3RjhDvGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wp-00000003fJA-06i6;
	Mon, 15 Sep 2025 10:33:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wk-00000003fHA-4540
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC1371424;
	Mon, 15 Sep 2025 03:33:33 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FE633F66E;
	Mon, 15 Sep 2025 03:33:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 00/31] CoreSight: Address CPU Power Management Issues
Date: Mon, 15 Sep 2025 11:33:23 +0100
Message-Id: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPrx2gC/x2NQQrDIBQFrxL+uoLVlsZepQSR9MX8hRq+khZC7
 l7pcmYxc1CFMCo9h4MEO1cuuYO9DDSvIUcofncmo81dO+1UkOTnIqgc1+a38oH4FHKISMjNL/x
 VV+vGh13czWCkHtoEXf8nr+k8f80Eno50AAAA
X-Change-ID: 20250909-arm_coresight_power_management_fix-139873f942e8
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=7981;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SvHiBsHk3L/1thSYqpxrsIGnmH56ZpFCQb9nyL7SLZ8=;
 b=Tj9GLbQjI0zZQXQoTYJv/bwrtr+a/U9z+r0TzV3N4wryBH9ndG05xTPfkBXolBX5Y/tpziv2l
 yh4HVn400XcAtrvXwUJTGzNctAZmkoGmZ0M/vL0kkia2z2dQWs0IaiC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033343_098763_89CBDCC1 
X-CRM114-Status: GOOD (  14.77  )
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

This series addresses CPU power management issues in the CoreSight
drivers. For easier review, the patches are organized into two
categories:

o Patches 01 ~ 10 focus on CPU power management within the ETM drivers.
  These patches fix SMP-safe access to the mode, correct context
  synchronization, and refactor the CPU suspend/resume flows.

o Patches 11 ~ 31 extend CPU power management to cover activated paths,
  including helpers, links, and sinks. These changes move CPU PM and
  hotplug notifiers from the ETMv4 driver into the CoreSight core layer.

Summary:

- Patches 01 ~ 03: Fix device mode access in the SMP mode.
- Patch 04       : A minor fix for polling bit.
- Patches 05 ~ 07: Improve the context synchronization based on the ETM
                   specification (IHI0064H.b) and Arm ARM (ARM DDI 0487
                   L.a).
- Patches 08 ~ 10: Refactor the context save/restore flow in the ETMv4
                   driver, in the end, the CPU PM callbacks reuse the
                   normal enabling and disabling flows.
- Patches 11 ~ 17: Move CPU PM code from ETMv4 driver to the core layer.
- Patches 18 ~ 23: Enhance the CTI driver for preparation dynamically
                   controlling CTI devices in PM flows. This includes
                   device mode handling in the CTI driver and
                   distinguishing trace modes (Perf or SysFS). Refactor
                   the PM notifier and improve locking usage (including
                   for syscfg).
- Patches 24 ~ 31: Support save and restore context for TRBE and
                   manages activated paths during CPU idle and
                   CPU hotplug.

Verification:

This series has been verified on Juno-r0 and r2 platform.

  Stress test script:

  #!/usr/bin/bash

  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink

  while true; do
          echo 0 > /sys/devices/system/cpu/cpu2/online;
          echo 1 > /sys/devices/system/cpu/cpu2/online;
  done &

  while true; do
          echo 1 > /sys/bus/coresight/devices/etm2/enable_source;
          echo 0 > /sys/bus/coresight/devices/etm2/enable_source;
  done &

  Test script with kernel module insmod / rmmod:

  #!/bin/bash

  modules=(
          "coresight"
          "coresight_dummy"
          "coresight_replicator"
          "coresight_tpiu"
          "coresight_cpu_debug"
          "coresight_etb10"
          "coresight_stm"
          "coresight_trbe"
          "coresight_tmc"
          "coresight_ctcu"
          "coresight_catu"
          "coresight_etm4x"
          "coresight_cti"
          "coresight_funnel"
          "coresight_tnoc"
  )
  module_dir="/mnt/build/drivers/hwtracing/coresight/"

  if [[ "$1" == "in" ]]; then
          echo "Inserting modules..."
          for mod in "${modules[@]}"; do
                  modprobe $mod && echo "Loaded $mod" || echo "Failed to load $mod"
          done
  elif [[ "$1" == "rm" ]]; then
          echo "Removing modules..."
          # Remove in reverse order to respect dependencies
          for (( idx=${#modules[@]}-1 ; idx>=0 ; idx-- )); do
                  mod="${modules[$idx]}"
                  echo "Removing $mod..."
                  rmmod "$mod" && echo "Removed $mod" || echo "Failed to remove $mod"
          done
  fi

---
Changes in v3:
- Fixed building failure in ETMv3 driver (kernel test robot).
- Refactoring ETMv3 change for checking CPU ID (Levi).
- Fixed NULL pointer issue during CPU idle (James).
- Fixed lockdep complaint for HARDIRQ-safe and HARDIRA-unsafe (James).
- Fixed acquiring mutex in atomic context (James).
- Rebased on the latest coresight-next branch.
- Link to v2: https://lore.kernel.org/r/20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com

Changes in v2:
- Refactored ETMv4 suspend and resume for reusing the normal enabling
  and disabling flows (James).
- Used a per-CPU structure to maintain path pointers (James).
- Supported helpers in CPU PM flows (James).
- Fixed the SMP-safe access to device mode.
- Fixed the context synchronization in ETMv4x driver.
- Link to v1: https://lore.kernel.org/linux-arm-kernel/20250516160742.1200904-1-leo.yan@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (30):
      coresight: Change device mode to atomic type
      coresight: etm4x: Always set tracer's device mode on target CPU
      coresight: etm3x: Always set tracer's device mode on target CPU
      coresight: etm4x: Correct polling IDLE bit
      coresight: etm4x: Ensure context synchronization is not ignored
      coresight: etm4x: Add context synchronization before enabling trace
      coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
      coresight: etm4x: Remove the state_needs_restore flag
      coresight: etm4x: Add flag to control single-shot restart
      coresight: etm4x: Reuse normal enable and disable logic in CPU idle
      coresight: Populate CPU ID into the coresight_device structure
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Set per CPU source pointer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: Add callback to determine if context save/restore is needed
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: cti: Fix race condition by using device mode
      coresight: cti: Introduce CS_MODE_DEBUG mode
      coresight: cti: Register PM notifier after data initialization
      coresight: cti: Properly handle modes in CPU PM notifiers
      coresight: cti: Make spin lock usage consistent
      coresight: syscfg: Use spinlock to protect active variables
      coresight: Add per-CPU path pointer
      coresight: Add 'in_idle' argument to path enable/disable functions
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for percpu sink
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer
      coresight: Manage activated path during CPU hotplug

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   1 +
 drivers/hwtracing/coresight/coresight-core.c       | 337 ++++++++++++--
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   |  69 ++-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |   2 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  55 ++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 491 ++++++---------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 ---
 drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
 drivers/hwtracing/coresight/coresight-replicator.c |   1 +
 drivers/hwtracing/coresight/coresight-stm.c        |   1 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  10 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
 drivers/hwtracing/coresight/coresight-trbe.c       |  85 ++++
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  55 ++-
 23 files changed, 687 insertions(+), 515 deletions(-)
---
base-commit: 559d6c380ea0a27e71d0269410301303515e4179
change-id: 20250909-arm_coresight_power_management_fix-139873f942e8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


