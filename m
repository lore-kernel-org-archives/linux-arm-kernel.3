Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEE8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=48mWq7yftlc2vZzNYlFcYOxh7/kyw84mAVqhv8x+Jlc=; b=h6GauwNKL8sbuQ
	Cf237agU9QTLP+NZn+KCtf7PZ7KQy9g0YZc2sRrKkcL5klLMYQ42KXKQOw/QEEQUU5B8a25czCriJ
	90hUkst37meDYFYkOJHornJWGw7NmCB/ravUrhrQtVc13CTqp4cLXj5V0A9VIeU4NWNAFwaWlUhTQ
	B3dYbAoJS+2v3mqFhRrITghn+P5XwzgLf3/L0fzypJ9mgPUzRyJ7GS7pV8HE0eXv44fksT/R3avqx
	hz4wLn/pHWoxZBop4rduELAOVpKuraIHs+CY6ajW+yeINNCavC8m5npODeB+kFdGLnFrBjIXjQ8HQ
	H7pjMgpAG5gTeG0ZDQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkQ-0000000AITw-1nH8;
	Mon, 03 Nov 2025 16:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkN-0000000AITJ-0aYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:49:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78ABD1D14;
	Mon,  3 Nov 2025 08:49:26 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86B673F694;
	Mon,  3 Nov 2025 08:49:32 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v5 00/11] CoreSight: Refactor power management for ETMv3/4
Date: Mon, 03 Nov 2025 16:49:21 +0000
Message-Id: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHdCGkC/43Nyw7CIBAF0F9pWIvh1Qeu/A9jCMFpywJooEFN0
 3+XNka3Xczi3mTOXVCCaCGhS7WgCNkmG3wJ9alCZtR+AGwfJSNGWE0kkVhHp0yIkOwwzmoKT4j
 Kaa8HcOBn1dsXplx2Le+lYNChAk0RSr2P3O4ljzbNIb73zcy39svT+gifOSYYtJAgKWUCzLU8n
 U1waMOz+IGUMHEIFAVsJIFG6nJt+wfXdf0AOGYw7yMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762188572; l=3067;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3CdgS4qGElsrt8NT+Dn1Uc91mzKjv6/u9Pc0uFN/VQE=;
 b=P48DtaBx4HDEk2IIIwhwSvnYGlVDW2N+HcSYnnHTgweDGX+LODoec5K2MEQGf/T+zjlBLcEW1
 Xq5hrLs1TtSClwVB16U/gFHbr+dHaPUxe0yhyJmVtZ95E+yJkxBGHpd
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084935_322328_14C8D843 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

This series is extracted from the CoreSight power management fixes and
refactoring [1], focusing on ETMv3/4 power management.

This series has been verified on Juno-r2 platform.

[1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/

---
Changes in v5:
- Added more info for removing redundant DSB in
  etm4_{enable|disable}_trace_unit() (Suzuki/Levi).
- Dropped moving isb() out from etm4_{enable|disable}_trace_unit()
  (Suzuki).
- Reordered patches to move fixes earlier.
- Link to v4: https://lore.kernel.org/r/20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com

Changes in v4:
- Added patch 10 for retaining sequencer state in ETMv4 driver (Mike).
- Added Mike's review tags.
- Added James' test tags.
- Link to v3: https://lore.kernel.org/r/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com

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
Leo Yan (11):
      coresight: Change device mode to atomic type
      coresight: etm4x: Always set tracer's device mode on target CPU
      coresight: etm3x: Always set tracer's device mode on target CPU
      coresight: etm4x: Correct polling IDLE bit
      coresight: etm4x: Add context synchronization before enabling trace
      coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
      coresight: etm4x: Remove the redundant DSB
      coresight: etm4x: Remove the state_needs_restore flag
      coresight: etm4x: Add flag to control single-shot restart
      coresight: etm4x: Retain sequencer state
      coresight: etm4x: Reuse normal enable and disable logic in CPU idle

 drivers/hwtracing/coresight/coresight-etm3x-core.c |  59 ++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 347 +++++++--------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 ----
 include/linux/coresight.h                          |  25 +-
 4 files changed, 157 insertions(+), 336 deletions(-)
---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20250909-arm_coresight_power_management_fix-139873f942e8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


