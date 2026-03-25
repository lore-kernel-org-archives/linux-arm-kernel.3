Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E936109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nl3djrnVfV/I+MpZUu878yXZFBVYrge6oq2ik2WgXEg=; b=Q5T50v46OwuLZ+
	bddedclKjlZSfHG6uxt9b+kcrfCPLNJaRD/wldC7QWGvNAtD6Shm9swbumdhrnvZB2YP+bJnFxWWY
	K++zA9Cxep/qEk72tq7cI/xOxEft/hA0uqoAZ+FrlNsG6nM0ll+Ix+x2JAB/3ZAhok2+B8k37Jo/h
	sAlhTBPhUFmZVWHugCHFPIEUFZ67f2JLFB4RaDuzUS3Hvjl6CfhGrGeedKImb3FAv/F6QQoWtVCnh
	7x2BYAucBPjKiZjE37PJ6aGJq4ADTgQBbXujKyRCScaWiz2nJJcWesowGMmbsJl/3eGWv4fvGvV0U
	5hx1aqjjkOaS3tYO191A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCS-00000003ZcA-0sIs;
	Wed, 25 Mar 2026 14:27:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCH-00000003ZXv-3lPm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A9D1F02;
	Wed, 25 Mar 2026 07:26:53 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49E563F836;
	Wed, 25 Mar 2026 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448819; bh=rZfL6rk8JrF28lOVt7kuephQCmWHaiCG9h6rw/nxhy4=;
	h=From:Subject:Date:To:Cc:From;
	b=oZSEJZEBwY841d7e9pfRYu/bnFrp7dhY/85yLoUNfSk3ePeLVr7fXjuCNEpuNOEDt
	 WOUvr7BNgcncbWyDP3ksYE60Wm5i7iDyqqiedLvxOpGXFh9N/uy2qVfXuGsZ4EOEdR
	 K3W9AX2fv848hUW5BK28Gm50LbHNinxqSeYefHEc=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v8 00/23] CoreSight: Refactor power management for
 CoreSight path
Date: Wed, 25 Mar 2026 14:26:37 +0000
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3ww2kC/53QzW6EIBQF4FeZsC7NBfnRrvoezYSAgLJQDBg6z
 cR3L5o0sd3ZHecuvnPCE2WXgsvo7fZEyZWQQ5xraF9uqB/1PDgcbM2IAuWEAMM6TaqPyeUwjKt
 a9DqqJX66pCY968FNbl5VmJYUy/HGVhvWCeFb2gKq6pKcD4+j8eNe8xjyGtPXMaCw/fr/rsIw4
 MYyY7SQTEL3XoXXPk5obyr8pJPuus6r7gXhugGiLZjfuvjRBTTAr+ui6s57KbilhOg/2+VJp3B
 dl/vPUGmtbYTh7Wn7tm3fJpU5hwYCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=4457;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rZfL6rk8JrF28lOVt7kuephQCmWHaiCG9h6rw/nxhy4=;
 b=Y2YYqUwl7ED6u3aL1Ep4M2WLYHyz7ouKUQUmE8Qa41kYosLjKL/wLhUYA99ZREphdn7nPr9CJ
 TmKS3lBbdcCCC8Udlcg1s/W53Vl7M6fF5ubJoWFiq0RJkiyJkIeuhL7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072702_019276_E6557CE0 
X-CRM114-Status: GOOD (  13.49  )
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

  Patches 01 - 08: Refactor the CPU idle flow with moving common code into
                   the CoreSight core layer.
  Patches 09 - 18: Refactor path enabling and disabling with range, add
                   path control during CPU idle.
  Patches 19 - 20: Support the sink (TRBE) control during CPU idle.
  Patches 21 - 23: Move the CPU hotplug flow into the coresight core layer
                   and simplify the code.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 (ETM + ETR) and FVP RevC (ETE + TRBE).

---
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

Changes in v6:
- Rebase on the latest coresight-next branch.
- Always save and restore TRBE context during idle (Will).
- Use get_cpu() / put_cpu() when set the per CPU source pointer.
- Link to v5: https://lore.kernel.org/r/20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (22):
      coresight: Extract device init into coresight_init_dev()
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Move per-CPU source pointer to core layer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: syscfg: Use spinlock to protect active variables
      coresight: Move source helper disabling to coresight_disable_path()
      coresight: Control path with range
      coresight: Use helpers to fetch first and last nodes
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for system tracers
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 428 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  25 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 154 ++------
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  21 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 126 ++----
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 include/linux/coresight.h                          |  15 +-
 12 files changed, 570 insertions(+), 350 deletions(-)
---
base-commit: a90863095f84f6d17c49716e4e2212d28a6b25b5
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


