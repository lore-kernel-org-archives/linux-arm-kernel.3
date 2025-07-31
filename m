Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4091DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZj2jMGgStLIQV50LJGdMYPxPlXaGok6+N5/QHRDFTo=; b=Rt7I2OBMH7jBJK
	RquGibViiqGxlOQqtQAEmMAFkqXU9AUFTwwLaN6BHhrtE2CDWHVr4XuxptR3h1B5mv+EPDea2l2WT
	VhR8kD/nd2GUQUWZJN8hEEUi0XaLAK7TAw1I4uZKSvxAHFqTQdhvxHMm0CmRpvqtaHr79uVbdfUrh
	97RAOB1IbdumXBHkzLQj71Y66B98BqDPCLh1zcKMe2xraitqRFlbr47Vu5ZZHt386t6gfiuiSUCGF
	zfaxJq+TNxSGoEXwM78aZehQEDY9TBz8PaNH6lm9Cupjrun1rN5IYHxW6n6OoL/TSUp1Xguy5nOLQ
	Rok6BC/GpuoSpSPF/LnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSRJ-00000003atF-1Bzp;
	Thu, 31 Jul 2025 12:31:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSK8-00000003ZGN-3Zlq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:23:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC441D13;
	Thu, 31 Jul 2025 05:23:44 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 961AD3F673;
	Thu, 31 Jul 2025 05:23:50 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 00/10] coresight: Fix and improve clock usage
Date: Thu, 31 Jul 2025 13:23:36 +0100
Message-Id: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhgi2gC/33NSw6CMBAG4KuYrq0ZSinFlfcwpsEylUahpjWNh
 nB3BzZsjMls/nl8M7GE0WNix93EImaffBgpqP2O2b4db8h9R5kJEBUoUfM2DsYm4/zb2Eewd5M
 lRyGvBRZONwIYXT4j0nxVzxfKvU+vED/rkyyX7n+PCjhYBIDGltrpE20dbBjYouVqE2ohfwsVC
 ap0SuquRRDFJszz/AWhtjaA9gAAAA==
X-Change-ID: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753964630; l=4075;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0N4/UcZGlpKfMNYPPMVZGAeFZcrW4w1eiHheYBGfg98=;
 b=oghc8hKq3Mr+SsKl2ihMcTvE/kZKPzQEzLvLxtivVo2yM7fhxeMEOwdi1W6tLN/Ac1b3Pqdh7
 mpe08WruKR1B7huNMBDy0YRxXNm4oSDcQ+1syImrOdRoOuzAgAE9TaN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_052352_974772_8D137125 
X-CRM114-Status: GOOD (  13.60  )
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

Also tested on Hikey960 for emulating static funnel and replicator
without clock nodes. Mark kindly tested on imx8mp board.

---
Changes in v6:
- Changed to devm_clk_get_optional_enabled() for pclk, for fixing the
  clock initialization failure reported by Mark.
- Added James test tags as no change for ACPI.
- Link to v5: https://lore.kernel.org/r/20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com

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


