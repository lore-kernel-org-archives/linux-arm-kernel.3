Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47234C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FBJDFl46Br4UIHge0fkQSE1NCFOGXt0RvYZaKTEEEio=; b=VGRCQVVGMmxB6y
	OgzkfISgmv3pRPzedEIPxDL3t/WVBekYZyd9H5EHXKbUpKQx+pQc/klYGavukUssqKml6C5lhT6hR
	G1GdIu91hb6D1frX7kuEvjgqFGLn0U2imtIcL8rJ88cwlc2h1gwxWQkUA+Nhd4F4yfQzc20oV8bHd
	ZiWE5U85/dLNOlRfx40H2AkfE0st3AFUTEwrocSNPae3dMm0MJUp06txIH0Ej2Ff1hnWVy45AgzHW
	OjZM+NTo7a3VDLD6p7Sg6DvEiIeWtUA4TbTNBbCPMAs58a+rTF3De3pnwjxsM5QAdZRloEJksyhrd
	KI7YW3DIV5tt/GwJ0smA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezO4-000000083po-22IU;
	Thu, 24 Jul 2025 17:05:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexmT-00000007pev-0BOF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 15:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE9231A00;
	Thu, 24 Jul 2025 08:22:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A7233F6A8;
	Thu, 24 Jul 2025 08:22:46 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v5 00/10] coresight: Fix and improve clock usage
Date: Thu, 24 Jul 2025 16:22:30 +0100
Message-Id: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZPgmgC/32N0QrCMAxFf2Xk2UpWO9188j9klBlTV3SrtFKU0
 X837gOEvJzcm5MFEkfPCY7VApGzTz7MAs2mAhqH+cbKX4VBo25wrw9qiJOlZJ1/W3oEuttsFGt
 zqbl2bacR5PIZWfLVeu6FR59eIX7WJ9n8tv99MqiQGBE72rWuPUlrS2GCvpTyBQjWqbK0AAAA
X-Change-ID: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370566; l=3664;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=F7T9nvv0uLffYhCRh87EZr0EoG1kA4a/EwoD/IwlL6A=;
 b=9Th4KNs/INGYG9r1I/3sSGrUqCwEhs2YCEhlfVXn5x/5bFlIVFfmsHk3j8CO/Gtqnc+lRi48p
 T3QnZZqmu70CmsUSSJIhmQDhYd9mYuXl7W1TonNdYjtzd5yLSCO7z5n
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082249_182509_4B4D1C81 
X-CRM114-Status: GOOD (  12.52  )
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

This series fixes and improves clock usage in the Arm CoreSight drivers.

Based on the DT binding documents, the trace clock (atclk) is defined in
some CoreSight modules, but support is absent. In most cases, the issue
is hidden because the atclk clock is shared by multiple CoreSight
modules and the clock is enabled anyway by other drivers. The first
three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, the drivers needs to manually disable
and release clocks for errors and for normal module exit.  However, the
drivers miss to disable clocks during module exit. The atclk may also
not be disabled in CoreSight drivers during module exit. By using devm
APIs, patches 04 and 05 fix clock disabling issues.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers. This is fixed in
patch 06.

Patches 07 to 10 refactor the clock related code. Patch 07 consolidates
the clock initialization into a central place. Patch 08 polishes driver
data allocation. Patch 09 makes the clock enabling sequence consistent.
Patch 09 removes redundant condition checks and adds error handling in
runtime PM.

This series has been verified on Arm64 Juno platform, for both DT and
ACPI modes.

---
Changes in v5:
- Skip clock management for ACPI devices (Suzuki).
- Link to v4: https://lore.kernel.org/r/20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com

Changes in v4:
- Separated patch 07 into two patches, one is for clock consolidation
  and another is for polishing driver data allocation (Anshuman).

Changes in v3:
- Updated subjects for patches 04 and 05 (Anshuman).
- Refined condition checking "if (dev_is_amba(dev))" in patch 07
  (Anshuman).

---
Leo Yan (10):
      coresight: tmc: Support atclk
      coresight: catu: Support atclk
      coresight: etm4x: Support atclk
      coresight: Appropriately disable programming clocks
      coresight: Appropriately disable trace bus clocks
      coresight: Avoid enable programming clock duplicately
      coresight: Consolidate clock enabling
      coresight: Refactor driver data allocation
      coresight: Make clock sequence consistent
      coresight: Refactor runtime PM

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++---------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-core.c       | 48 ++++++++++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++---------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++-----
 drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++----
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++----
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 66 ++++++++--------------
 drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++-------------
 drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 ++++++++--------
 drivers/hwtracing/coresight/coresight-tmc.h        |  2 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 36 +++++-------
 include/linux/coresight.h                          | 31 +---------
 16 files changed, 228 insertions(+), 290 deletions(-)
---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


