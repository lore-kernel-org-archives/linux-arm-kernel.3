Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1279BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sybkNcaKp8e8dS80IlC8Dc7DmxMhv6jtD1re5XJji50=; b=2heziJOFZ3lqS4
	7FtFqsgp4D2IOgIGiEjEhMz2ia+uhqWO9bDZToIrvhQ3QDPHRR8LiROL5rlyt+Zk4mkw4fIQghCKG
	vxeaXSNE71M+tvoZYBx7pXMDZaue6OASRE/0HmiQRMcCmcnN65lS4Mbt6QTRqS/un8KIFxHyprGNI
	qPC+LkQONHwGeu57u/8GAepXhLOf1RHS7wL5YMWnQXCwiiG/2Bsz+pRGl5zAv+CCL2KSJyndxx9EL
	w19Jf/0/g/D9Fj7NXEr2XQ61xFs77LCqcllCrCq8+DB73hzriQgdQ+Wt5zk1LpQS1lM3Wx48otGDJ
	4v0vbz373fyf4yFEd/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrl-0000000C3wY-03Pm;
	Tue, 04 Nov 2025 15:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIri-0000000C3vW-3aV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A801CE0;
	Tue,  4 Nov 2025 07:22:24 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B553F3F66E;
	Tue,  4 Nov 2025 07:22:30 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/15] CoreSight: Refactor power management for
 CoreSight path
Date: Tue, 04 Nov 2025 15:21:44 +0000
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgaCmkC/x2NywrDIBAAfyXsuYIRG9L+SimyTTa6Bx+skhZC/
 r2S28xl5oBKwlThORwgtHPlnLrY2wBLwORJ8dodjDb3cdRWoUS3ZKHKPjRXsAVX8pfERUzoKVJ
 qjmORvF+sVvzYxzRts5k19GoR2vh3HV/v8/wDXPCn24EAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=4709;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hRbLG4tQHaiaP/01QXYsWfChMvQn1CVFL9GPKjZHc5w=;
 b=OZqpuP3HYGry8h8FxuIFRaX9tOKzEx7b7zz+TDFWgkmcobYc1ea24H/VSJ02FMEQ5b0H+BFtX
 Eh//j0rVH0gDh+sz0MH6ntgeprfI+lbgWxIV77g6Vt5WmtvQcq3Q74f
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072234_982370_F5A79E18 
X-CRM114-Status: GOOD (  15.71  )
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

This series is extracted from [1], focusing on CoreSight path power
management.

Compared to the previous version, this series is updated heavily for:

1) Dropped the global per CPU variable for saving path pointers.
   Instead, the activate path is now stored in the source device's
   structure.  This allows fetching the path pointer naturally based on
   the source regardless of whether it is a per-CPU source or a system
   source (such as STM).

   This improvement addresses Mike's comment that, later we can polish
   coresight-sysfs.c to remove the tracer_path variables.

2) To simplify the series and make it easier to review, the CTI driver
   related fixes have been removed from this series and which will be
   sent out separately.

3) This series disables the path when a CPU is hot-plugged off but does
   not re-enable it when the CPU is subsequently hot-plugged in.  This
   simplifies the implementation and keep it consistent with the perf
   session's behavior.

   It also improves security, as there is no risk of unintended tracing
   caused by a CPU being hot-plugged after a long period of inactivity.

This series is dependent on ETM driver's PM improvement series [2] and
has been verified on Juno-r2 and FVP RevC.

[1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com/#t

---
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
Leo Yan (14):
      coresight: sysfs: Validate CPU online status for per-CPU sources
      coresight: Set per CPU source pointer
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: Add callback to determine if PM is needed
      coresight: etm4x: Remove redundant condition checks in save and restore
      coresight: syscfg: Use spinlock to protect active variables
      coresight: Introduce coresight_enable_source() helper
      coresight: Save activated path into source device
      coresight: Add 'in_idle' argument to enable/disable path functions
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for percpu sink
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: Move CPU hotplug callbacks to core layer

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-catu.c       |   1 +
 drivers/hwtracing/coresight/coresight-core.c       | 273 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-dummy.c      |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   1 +
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   2 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 137 ++---------
 drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +
 drivers/hwtracing/coresight/coresight-replicator.c |   1 +
 drivers/hwtracing/coresight/coresight-stm.c        |   1 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  22 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  12 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +
 drivers/hwtracing/coresight/coresight-tpda.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       |   1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   1 +
 drivers/hwtracing/coresight/coresight-trbe.c       |  85 ++++++-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  13 +
 24 files changed, 425 insertions(+), 140 deletions(-)
---
base-commit: f9ac95561513e18c2a2cf8905355dc5f0e030c46
change-id: 20251104-arm_coresight_path_power_management_improvement-dab4966f8280

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


