Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551A7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CbJi1pFrYlqj/kW6D8vwD8tmizvp4tWiCEb0KBb7cBw=; b=z/VJNyKkC9n1GK
	fPHUL1WpiwNlVFlvJw+rdDVPITpGzxxCO0TVOCF63DBs9TaDYLutYf10HJ9agnpTu1UwZ+59zG2jG
	Jt1Rx5u+ybPEbCD4XhZGEONVnwJj8zkzTWABeykjnNqvxQI3zvsZ574CW+fF29YT/9JZ5TMH/SDdI
	g4ySHC1YDE2Nt0upOqieDWSAZy2qEA3KdctQX79dmFGwVyZ2ZU2zTMT84oe2f6LpZw6v0fKFbUdVp
	sYNsk8aekV9GG2IPwSNyh/v9EX/nVHgZc6YACeJ3TcyVJSP9KeKgSBRXP0rvLBU7y9eisyidqsohL
	9SFEaceABQkVdR2ypovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdoo-000000062Mv-0NF6;
	Tue, 01 Jul 2025 16:26:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcMq-00000005maE-1kTX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:53:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7814D12FC;
	Tue,  1 Jul 2025 07:53:34 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB01F3F66E;
	Tue,  1 Jul 2025 07:53:47 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/28] CoreSight: Address CPU Power Management Issues
Date: Tue, 01 Jul 2025 15:53:25 +0100
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX2Y2gC/x2MWwqAIBAArxL7naD27ioRYrXWfmiiIIF096TPY
 ZjJEDEQRpirDAETRbpdAVlXsF/ancjoKAySy473QjAdrNqj8lYZelRqmGk1ymnbhmMUUDIfsJh
 /uazv+wHSdx1VYgAAAA==
X-Change-ID: 20250611-arm_cs_pm_fix_v3-f4ae29bb7d81
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=6135;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Nq6752uZqNFDKOOcflMmgGb6G8qBK0diZ4EiOD+Inqs=;
 b=m/RXraSsJy6Hl7VyJiDPntiCYLZ9JLMNk1Td7nr3SZFSEzN/n59pzpPI2QXZeZcyBC7P4uCit
 Iu0tSsNimfvBw6IsBK24gLeqVCj8rXm/bobTx84vQNmLowuupQkeo0q
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075352_538395_22759995 
X-CRM114-Status: GOOD (  14.90  )
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

o Patches 11 ~ 28 extend CPU power management to cover activated paths,
  including helpers, links, and sinks. These changes move CPU PM and
  hotplug notifiers from the ETMv4 driver into the CoreSight core layer.

Summary of Changes:

- Patches 01 ~ 03: Fix device mode access in the SMP mode.
- Patch 04       : A minor fix for polling bit.
- Patches 05 ~ 07: Improve the context synchronization based on the ETM
		   specification (IHI0064H.b) and Arm ARM (ARM DDI 0487
		   L.a).
- Patches 08 ~ 10: Refactor the context save/restore flow in the ETMv4
		   driver, in the end, the CPU PM callbacks reuse the
		   normal enabling and disabling flows.
- Patches 11 ~ 17: Move CPU PM code from ETMv4 driver to the core layer.
- Patches 18 ~ 25: Enhance device mode handling in the CTI driver,
		   distinguishes debug mode from trace modes (Perf or
		   SysFS mode). Extend support activated paths during
		   CPU idle. Support save and restore context for
		   per-CPU sink (TRBE).
- Patches 26 ~ 28: Move CPU hotplug notifier from the ETMv4 driver to
		   the core layer. The full path is now managed in CPU
		   hotplug.

Verification:

This series has been verified on the following platforms:
- Hikey960, Juno-r0 and Juno-r2:
  Note that the firmware on Hikey960 and Juno-r0 is unstable. While no
  CoreSight failures were observed, but the CPU hotplug or CPU idle
  itself may fail intermittently.
  Juno-r2 is much stable and can pass 24+ hours stress test.
- FVP RevC: Verified TRBE changes.

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

---
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
Leo Yan (27):
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
      coresight: cti: Properly handle modes in CPU PM notifiers
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
 drivers/hwtracing/coresight/coresight-cti-core.c   |  40 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |   2 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  61 ++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 488 ++++++---------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 ---
 drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
 drivers/hwtracing/coresight/coresight-replicator.c |   1 +
 drivers/hwtracing/coresight/coresight-stm.c        |   1 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  10 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
 drivers/hwtracing/coresight/coresight-trbe.c       |  85 ++++
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  55 ++-
 21 files changed, 665 insertions(+), 487 deletions(-)
---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250611-arm_cs_pm_fix_v3-f4ae29bb7d81

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


