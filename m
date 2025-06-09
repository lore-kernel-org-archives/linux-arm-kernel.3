Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15883C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yqcEEOAQcWPPqFO8IzDJn8NddnWwA6BoEtCGNsWg+ns=; b=wvmwlYgQHqrZtw
	qgcZU4J/2NDb6La0ygAf0g9OWD2i9B7YplKoKzEOWQDDeXHaZImFbUn+2pdtEIrTBt5QNDUcN83mq
	mL5QJupxYQlG5fpXFrS1+QM/jj4os63z5XDKsh3eAhtCGh+FZRpBaRMq35APxAxAvyM1oYqU3umpd
	NcbnJ6I0oA5RPMCVjdNDdd1vwNSgNZOqHBFpd1aEXbHkAgVijBeHbWQ5A5EBAwYCU3iaAbCCa8wHL
	7hRq4gRQYUucK3S+79vk1j/Q/x4EZW+6YPNQMOLbamAtbyo232lPxEccylpYNT+iWvVZwhAnjupwv
	v/vC8pitpnZj27hli7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfVe-00000004hZD-2tXf;
	Mon, 09 Jun 2025 16:38:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOew0-00000004bDM-2sEx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:01:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6380414BF;
	Mon,  9 Jun 2025 09:00:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBB8B3F673;
	Mon,  9 Jun 2025 09:01:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 0/9] coresight: Fix and improve clock usage
Date: Mon, 09 Jun 2025 17:00:34 +0100
Message-Id: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMFR2gC/x3M3QpAQBBA4VfRXNvalhVeRZoYg8lvu9mUvLvN5
 Ven84BnJ+yhTh5wHMTLsUdkaQI0d/vESoZoMNpYXehKdW5D8jjKjbQetGDI8Lz6VUgNNi+47Ec
 qrYE4OB3H7J837ft+k3ZMA2wAAAA=
X-Change-ID: 20250609-arm_cs_fix_clock_v3_public-d546e8bfc852
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749484873; l=3578;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=t5j4Ai09hZm5vRb0LjOQkEvkDfaAXZzl1f7rimtfa1I=;
 b=SfufAVdE1lYKpK8gYp9453iCD+3IFR2z4Swyw2S1UNPQ/sjiMjjFCTZFjt5e4c2bZHN2QZV6r
 KAwrcBANWSCAYEBlOcACTl0830pdLRqLdLqvnA+gh+uFg2YLGEpmXqe
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_090116_821919_985F03F1 
X-CRM114-Status: GOOD (  12.84  )
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
some CoreSight modules, but support is absent.  In most cases, the issue
is hidden because the atclk clock is shared by multiple CoreSight
modules and the clock is enabled anyway by other drivers.  The first
three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, the drivers needs to manually disable
and release clocks for errors and for normal module exit.  However, the
drivers miss to disable clocks during module exit.  The atclk may also
not be disabled in CoreSight drivers during module exit.  By using devm
APIs, patches 04 and 05 fix clock disabling issues.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers. This is fixed in
patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 consolidats
the clock initialization into a central place.  Patch 08 makes the
clock enabling sequence consistent.  Patch 09 removes redundant
condition checks and adds error handling in runtime PM.

This series has been verified on Arm64 Hikey960 and Juno platforms.

Changes from v2:
- Updated subjects for patches 04 and 05 (Anshuman).
- Refined condition checking "if (dev_is_amba(dev))" in patch 07
  (Anshuman).

Changes from v1:
- Moved the coresight_get_enable_clocks() function into CoreSight core
  layer (James).
- Added comments for clock naming "apb_pclk" and "apb" (James).
- Re-ordered patches for easier understanding (Anshuman).
- Minor improvement for commit log in patch 01 (Anshuman).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (9):
      coresight: tmc: Support atclk
      coresight: catu: Support atclk
      coresight: etm4x: Support atclk
      coresight: Appropriately disable programming clocks
      coresight: Appropriately disable trace bus clocks
      coresight: Avoid enable programming clock duplicately
      coresight: Consolidate clock enabling
      coresight: Make clock sequence consistent
      coresight: Refactor runtime PM

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++---------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-core.c       | 45 +++++++++++++++
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
 include/linux/coresight.h                          | 30 +---------
 16 files changed, 225 insertions(+), 289 deletions(-)
---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250609-arm_cs_fix_clock_v3_public-d546e8bfc852

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


