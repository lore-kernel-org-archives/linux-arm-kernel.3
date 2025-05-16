Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C55C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irF7gTt08zo31ys5mqpc5hg46uqOw2cyB75qPSPUQ7c=; b=f0FMniWf4ZTqO86UTG8TYfh0K3
	k17N2fPXUH6mBMvB7thN47qDLt0zez//wB06Q1NZ2MwIIfqpuZLX2KukW1Jk6yNR22p5L+mg5BTsU
	WCip8R85dz4XsBd4B2HjyVgEQ/DfIlTtkPR/amJk6SsCjQdoVMPeUXT5fCmssnjqDGymkV/IybgYr
	YB+vd0I5FDpK9Y0So4GSZVrEND9R6KgIyj2wZKnbAHgz0vvnX8DRM8QSYRs39OwT3P2Ro2nakvMqx
	zHmsEPX2WlVAMyDWVK/xj/aA+tuvr5KZPrsAJcKKkj3seWhAansxJ/oGfKPDkBLIWlitrFMjMDpqx
	fpNRrZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxsA-000000040nM-40n1;
	Fri, 16 May 2025 16:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbC-00000003yNh-0KPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E76169C;
	Fri, 16 May 2025 09:07:37 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9B773F63F;
	Fri, 16 May 2025 09:07:47 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 00/11] CoreSight: Refactor CPU PM and hotplug
Date: Fri, 16 May 2025 17:07:31 +0100
Message-Id: <20250516160742.1200904-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090750_204672_B1721091 
X-CRM114-Status: GOOD (  13.11  )
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

Besides managing tracers (ETM) in CPU PM and hotplug flows, the
CoreSight framework is found the issues below:

Firstly, on some hardware platforms, CoreSight links (e.g., funnels and
replicators, etc) reside in a cluster power domain.  If the cluster is
powered off, the link components also will lose their context.  In this
case, Arm CoreSight drivers report errors when detect unpaired self-host
claim tags.

Secondly, if a path has been activated from per CPU's tracer (ETM) to
links and a sink in Sysfs mode, then when the CPU is hot-plugged off,
only the associated ETM will be disabled.  Afterwards, the links and the
sink always keep on and no chance to be disabled.

The last issue was reported by Yabin Cui (Google) that the TRBE driver
misses to save and restore context during CPU low power states.  As a
result, it may cause hardware lockup issue on some devices.

To resolve the power management issues, this series extends CPU power
management to cover the entire activated path, including links and
sinks.  It moves CPU PM and hotplug notifiers from the ETMv4 driver to
the CoreSight core layer.  The core layer has sufficient info to
maintain activated paths and can traverse the entire path to manipulate
CoreSight modules accordingly.

Patch 01 is to fix a bug in ETMv4 save and restore callbacks.

Patches 02 ~ 06 move CPU PM code from ETMv4 driver to the core layer, and
extends to maintain activated paths and control links.

Patches 07 and 08 support save and restore context for per-CPU sink
(TRBE).  Note, for avoid long latency, system level's sinks in an
activated path are not touched during CPU suspend and resume.

Patches 09 ~ 11 move CPU hotplug notifier from ETMv4 driver to the core
layer.  The entire path will be controlled if the corresponding CPU is
hot-plugged on or off.

This series has been verified on Hikey960 for CPUIdle and hotplug.  And
it is tested on FVP for verifying TRBE with idle states.


Leo Yan (10):
  coresight: etm4x: Control the trace unit in CPU suspend
  coresight: Set per CPU source pointer
  coresight: Register CPU PM notifier in core layer
  coresight: etm4x: Hook CPU PM callbacks
  coresight: Save activated path into source device
  coresight: Control path during CPU PM
  coresight: Add PM callbacks in sink operation
  coresight: Take hotplug lock in enable_source_store() for Sysfs mode
  coresight: Move CPU hotplug callbacks to core layer
  coresight: Manage activated paths during CPU hotplug

Yabin Cui (1):
  coresight: trbe: Save and restore state across CPU low power state

 drivers/hwtracing/coresight/coresight-core.c       | 252 +++++++++++++++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   2 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 133 ++++++----------------
 drivers/hwtracing/coresight/coresight-priv.h       |   1 +
 drivers/hwtracing/coresight/coresight-sysfs.c      |  12 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |  65 +++++++++++
 include/linux/coresight.h                          |  11 ++
 7 files changed, 375 insertions(+), 101 deletions(-)

-- 
2.34.1


