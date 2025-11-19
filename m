Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332FDCF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oh/JPScsRWgtlxzW5g3pR1KgdaU4jqTvrLESkIvUkpk=; b=pjwbUf2Ci6Ghvs
	GOOamfSpb/9K5VJ9xClUA+6rC36ulP3qTIBzPFDGV/aPMSt6Z63y/v5HvdZCmJSxZNVieUb71xdXC
	Eqre1lp+3BEAXNZOBAHy0vZ+n/IVozqgo1yJdxSb/hfvwW3sTeHcZbQIVefoM+Vyxgdq6lJyn3RV7
	spPCwqKjFhBCNBX19JexQ+DyfeD0hIQx8ekOJbpY6AKV4H3C4/C3DEbJEBwjc5b0uVf5AVMsIFMis
	wm6poPbFP2lgjG6Y8z+j4x+yCyP1kYrvenub1/yqtJEDGmChSBB3DmxYNgOddC51dvrijTJHvDvmt
	cqy6WPAgsbbaJntFBZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR0-00000003Yje-02kx;
	Wed, 19 Nov 2025 15:49:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkQw-00000003YiR-3bUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A60F0FEC;
	Wed, 19 Nov 2025 07:49:17 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D8853F66E;
	Wed, 19 Nov 2025 07:49:23 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v5 00/19] CoreSight: Refactor power management for
 CoreSight path
Date: Wed, 19 Nov 2025 15:48:58 +0000
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOrmHWkC/52OTQ6DIBSEr2JYlwYt/nXVezSGoD7lLRDyILSN8
 e6lHqG7+WbxzewsACEEdi92RpAwoNsy1JeCTUZvK3CcM7NKVHVZCsk1WTU5goCricrraJR3LyB
 l9aZXsLBFhdaTS2fmsx5l3zRLV3WCZasnWPB9Lj6HzAZDdPQ5DyT5a//fSpILfpvlOOqmla3oH
 9lwnZxlw3EcXyiQLTPsAAAA
X-Change-ID: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=4513;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=muFzuakzQYEInWSEc4moA3tLt8KWe8C1TyUN2XkCjSc=;
 b=kdaLg9EhiTnncqN1pJ2pWYATHbuDsY5TC/ZG5Il50ssL9+g8e+ExELbIxtsOKfAfrpbidT8nL
 qw0BRRW9RS6CcJwPSOtXOGOe7ypr2NfX+lZY8RQUMBw631xZk3pSUkW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074927_019443_BF0E92F5 
X-CRM114-Status: GOOD (  13.61  )
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

  Patches 01~06: Refactor the CPU idle flow with moving common code into
                 the CoreSight core layer.
  Patches 07~14: Add link control during CPU idle.
  Patches 15~16: Support the sink (TRBE) control during CPU idle.
  Patches 17~19: Move the CPU hotplug flow into the coresight core layer
                 and simplify the code.

This series is rebased on the coresight-next branch and has been verified
on Juno-r2 and FVP RevC.

---
Changes in v5:
- Set the per-CPU source pointer on target CPU (Suzuki).
- Reused existed enable/disable buffer functions in TRBE callbacks
  (James).
- Refactored refcount for source devices in SysFS mode.
- Released path in cpu-hotplug off flow to avoid memory leak.
- Updated ETMv3 driver when move common code into core layer.
- Rebased on the latest coresight-next branch.
- Link to v4: https://lore.kernel.org/r/20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com

Changes in v4:
- Changed to store path pointer in coresight_device, this is easier for
  fetching path pointer based on source device (Mike).
- Dropped changes in CTI driver.
- Only disabled path for CPU hot-plugged off but not enable path for
  hot-plugged in.
- Removed James' test tags for modified patches.
- Link to v3: https://lore.kernel.org/r/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com

Signed-off-by: Leo Yan <leo.yan@arm.com>

---
Leo Yan (18):
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Set per-CPU source pointer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: Add callback to determine if PM is needed
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: syscfg: Use spinlock to protect active variables
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Add 'in_idle' argument to path
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for system tracers
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   1 +
 drivers/hwtracing/coresight/coresight-core.c       | 242 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   2 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  65 ++----
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 153 +++----------
 drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +
 drivers/hwtracing/coresight/coresight-replicator.c |   1 +
 drivers/hwtracing/coresight/coresight-stm.c        |   1 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 126 ++++-------
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +
 drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
 drivers/hwtracing/coresight/coresight-trbe.c       |  62 +++++-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  11 +
 24 files changed, 429 insertions(+), 274 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


