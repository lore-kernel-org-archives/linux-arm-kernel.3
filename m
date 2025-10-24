Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE3BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X7IZXhvIDj/W+D1gIQEAgoTNTahaPQFugZ1MfUL5228=; b=glppKFXFtb4FU6
	XkSm80jFQ/sYKo9ZSqmH6o2JGEYJ9UZSS2GTa5JQhnNBf8AL/omi15iYULzsRYZs2zURlDaNnOK77
	1PxYc2IH4/j52OgNaMV8j621kRqySXB5FNm+/jHiG+Fipy+hXG+uhT5uj3Rx5AwDXfdiuxCmzP0vK
	TEddaAoGjil0efCbYsLf7EBIeOQSd05zNsa3C7wS+sWHCCNodfpIZ6S2JE9M2/vnzJAgQ2aMDeTFs
	PQ1rS94XncGKfKG+ebZwu4w387Sa8U4h9Lcl2sR5Ir95TUNMqwoYSKJATpXktl/RvGHRpME0J5rGa
	1FiRP1bnyiZdYVWdbxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvt-0000000A0og-3WLP;
	Fri, 24 Oct 2025 16:46:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvq-0000000A0mV-3DHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEB0175A;
	Fri, 24 Oct 2025 09:46:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9AE83F66E;
	Fri, 24 Oct 2025 09:46:21 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/11] CoreSight: Refactor power management for ETMv3/4
Date: Fri, 24 Oct 2025 17:45:48 +0100
Message-Id: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADyt+2gC/42NSwrCMBRFt1Le2Eh+xcaR+5ASQnxtM0hSXkpVS
 vduLC7A4Tlwz92gIAUscG02IFxDCTlV0KcG/OTSiCw8KoPksuWGG+YoWp8JSxinxc75iWSjS27
 EiGmxQ3gxoUx3UYPREjuooZmw6uPk3leeQlkyvY/PVX3tLy/af/KrYpyh0waNEFKjv9XR2ecI/
 b7vH6cOnv3SAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=2996;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=v2twuYXG+/3NDpCUxYNOeH7MKLTh4SP2uo5QFgLwyqc=;
 b=Klr6XLGKNPEuBBNbbR/b1JkCdZmww3rNfqfEnAGJLmTCKKxONDhvuClZogITKopSjnsvjLz+f
 DgXf2XWTE3TBRM0wf5Q9VplYPzJsAJGRd/LxhhnFLGjLk2A7FJiCW30
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094626_933453_A3F363CA 
X-CRM114-Status: GOOD (  11.03  )
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
refactoring [1], focusing on ETMv3/4 power management.  The remaining
parts will be sent out separately. Hopefully, this makes things easier
for us to review and merge.

Compared to the previous version, only one new patch has been added — to
retain the sequencer state for ETMv4. No other changes are included.

This series has been verified on Juno-r2 platform.

[1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/

---
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
      coresight: etm4x: Ensure context synchronization is not ignored
      coresight: etm4x: Add context synchronization before enabling trace
      coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
      coresight: etm4x: Remove the state_needs_restore flag
      coresight: etm4x: Add flag to control single-shot restart
      coresight: etm4x: Retain sequencer state
      coresight: etm4x: Reuse normal enable and disable logic in CPU idle

 drivers/hwtracing/coresight/coresight-etm3x-core.c |  59 ++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 372 +++++++--------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 ----
 include/linux/coresight.h                          |  25 +-
 4 files changed, 175 insertions(+), 343 deletions(-)
---
base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
change-id: 20250909-arm_coresight_power_management_fix-139873f942e8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


