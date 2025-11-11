Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA0CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0CPqhqkeH98Jehar5zRbbVvK5ZUTsPuofvVgneKo834=; b=cWC7EGgOukKhN+
	zZzkAAyqUQJuccr/yBzfXl+94XEjgi4FG8Toxt9PRpmYuFVJ9DDBSAToBdFfT5+WDZMIcDAWIpPbz
	H1SOZP+z+1lZpqaynnpMrtfu4qSiOY6mf9u4HSj+pCnLnkJpgGkNqTw3RplRZDwD0vSyj47pm9d8R
	CgFFbU2UgSOZn5+H/TSQOjrQHYp946gM+prqnMCCqe2i6FbSAR8TLU9x379mmw/JC+F5HldhBYEdA
	bS31knXHTgH6pXq/ZJFRrXtWVJ0nozbwTykkxQ7xLoC5tidBOLU87cN/hHhk2763RhJjrAub/dSLb
	TLgn9La3EdEX/VjINEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaE-00000007eDh-1Mv6;
	Tue, 11 Nov 2025 18:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaC-00000007eCw-015k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA133497;
	Tue, 11 Nov 2025 10:59:00 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8B0A3F63F;
	Tue, 11 Nov 2025 10:59:06 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 00/11] CoreSight: Refactor power management for ETMv3/4
Date: Tue, 11 Nov 2025 18:58:34 +0000
Message-Id: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqHE2kC/43NTQrCMBAF4KtI1kby23ZceQ+REuK0zaKNJKUq0
 rs7LaK462IW78F878UypoCZHXcvlnAKOcSBQrHfMd+5oUUerpSZEsoKEMBd6msfE+bQdmN9i3d
 Mde8G12KPw1g34cGlhqrUDRiFFSPolpDqdeR8odyFPMb0XDcnvbQfXtot/KS54OgMIEipDPoTP
 R187NmCT+YLSqHMJtAQWIDAAhxdWf6D9gdKoTeBlsCmEtpLcE5a/QPneX4D+N/VHHQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=3431;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=AUa+cLtfupPZJoe9CMwSusOUgRHSghEhl0mCfbu4mbg=;
 b=2huf4Jjn09c/N699ywsS4CS/Kx0hr1+PTlERuJNM30uNmTjcOq3sN3rt6GaKWqGw5zLD/HSAB
 7AbvTv9n0TABT7m4HrFjS7S7s0QBixNggwDDu7JNvABE1A3U5pL7ZXC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_105912_169978_51F6986A 
X-CRM114-Status: UNSURE (   8.56  )
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
Changes in v6:
- Added a 'retain_ss_status' flag to indicate if need to restain
  single-shot status (Suzuki).
- Introduced __etm4_disable_hw() without calling
  etm4_cs_{unlock|lock}() pairs, which is convenient for the save
  callback (Suzuki).
- Link to v5: https://lore.kernel.org/r/20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com

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
      coresight: etm4x: Add flag to retain single-shot status
      coresight: etm4x: Retain sequencer state
      coresight: etm4x: Reuse normal enable and disable logic in CPU idle

 drivers/hwtracing/coresight/coresight-etm3x-core.c |  59 ++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 358 +++++++--------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  64 +---
 include/linux/coresight.h                          |  25 +-
 4 files changed, 172 insertions(+), 334 deletions(-)
---
base-commit: b139702a889692ec30702534ebb1ae2b11ed1cbf
change-id: 20250909-arm_coresight_power_management_fix-139873f942e8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


