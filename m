Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DD5F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/qObWIGuF1E/C2MgJ34X582gnikRj/3PZDlWaifEv4=; b=ZAbmkgS8UKbx6FnjZDmOFvJYOz
	UnhaeJpcB2kzpexLSgOUlkRm/fpnQgP9JDnZ5z5amnRZsaMUZvpxOASc6PJFkGdTkXNquiLuqns4n
	mLjpsR4uXLhtB6WlqrH2ANMnkaQXv5cjFIakQtSLBSFd9VYOraXQe+BGNQqczon49qS4t6l0PxYe3
	i7AohDhv0OtJOF0NcQgNBEQkmXD+MEYNZRprlDnh2yNlI3U2ZJPYd9hUr7hmqIJLcole65t/6O28i
	z0auQI56vmpPbyG7zHfMFMyyBP+foSHFmdP9z/T1XZC90yiiYS17PeAAl66bS5eULzBkInVM9p7PG
	MXpjkLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wc-00000001PSr-0pbS;
	Wed, 15 Apr 2026 16:55:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3WY-00000001PS8-33RM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AB632D1;
	Wed, 15 Apr 2026 09:55:26 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 397153F7D8;
	Wed, 15 Apr 2026 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272132; bh=EwrIbHeuaP/107PZfY7hFlBvt5C95EI1ZEW/0ruUpLA=;
	h=From:To:Cc:Subject:Date:From;
	b=ctgKcTd2GPZvHouUbYNyyqCyvxXpAXrv4DSjhtiozpZtuCabwVom5artQJl3C87Hz
	 UmmHqGOHiETNK+RBoNUETb2lyX1R1AvBnM9aeAjSi3xbKeqEEdOEBkzqjrJLfqbwTh
	 wYbyTk80E/9w72X8FAqH3HSogSvICP8YMeuIsWCo=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 00/12] fix several inconsistencies with sysfs configuration in etmX
Date: Wed, 15 Apr 2026 17:55:16 +0100
Message-Id: <20260415165528.3369607-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095534_899517_4C5D573A 
X-CRM114-Status: GOOD (  11.14  )
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

The current ETMx configuration via sysfs can lead to the following
inconsistencies:

  - If a configuration is modified via sysfs while a perf session is
    active, the running configuration may differ between before
    a sched-out and after a subsequent sched-in.

  - If a perf session and sysfs session tries to enable concurrently,
    configuration from configfs could be corrupted (etm4).

  - There is chance to corrupt drvdata->config if perf session tries
    to enabled among handling cscfg_csdev_disable_active_config()
    in etm4_disable_sysfs() (etm4).

To resolve these inconsistencies, the configuration should be separated into:

  - active_config, which is applied configuration for the current session
  - config, which stores the settings configured via sysfs.

and apply configuration from configfs after taking a mode.

Also, This patch set includes some small fixes:
  - missing trace id release in etm4x.
  - underflow issue for nrseqstate.
  - wrong check in etm4x_sspcicrn_present().

This patch based on v7.0

Patch History
=============
from v4 to v5:
  - add rb-tag.
  - fix underflow issue for nrseqstate.
  - fix wrong check in etm4_sspcicrn_present().
  - remove redundant fields on etmv4_save_state.
  - rename caps->ss_status to ss_cmp.
  - fix wrong location of etm4_release_trace_id.
  - https://lore.kernel.org/all/20260413142003.3549310-1-yeoreum.yun@arm.com/

from v3 to v4:
  - change etm_drvdata->spinlock type to raw_spin_lock_t
  - remove redundant call etmX_enable_hw() with starting_cpu() callsback.
  - fix missing trace id release.
  - add missing docs.
  - https://lore.kernel.org/all/20260412175506.412301-1-yeoreum.yun@arm.com/

from v2 to v3:
  - fix build error for etm3x.
  - fix checkpatch warning.
  - https://lore.kernel.org/all/20260410074310.2693385-1-yeoreum.yun@arm.com/

from v1 to v2
  - rebased to v7.0-rc7.
  - introduce etmX_caps structure to save etmX's capabilities.
  - remove ss_status from etmv4_config.
  - modify active_config after taking a mode (perf/sysfs).
  - https://lore.kernel.org/all/20260317181705.2456271-1-yeoreum.yun@arm.com/

Yeoreum Yun (12):
  coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
  coresight: etm4x: fix underflow for nrseqstate
  coresight: etm4x: introduce struct etm4_caps
  coresight: etm4x: exclude ss_status from drvdata->config
  coresight: etm4x: remove redundant fields in etmv4_save_state
  coresight: etm4x: fix leaked trace id
  coresight: etm4x: fix inconsistencies with sysfs configuration
  coresight: etm4x: remove redundant call etm4_enable_hw() with hotplug
  coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
  coresight: etm3x: introduce struct etm_caps
  coresight: etm3x: fix inconsistencies with sysfs configuration
  coresight: etm3x: remove redundant call etm_enable_hw() with hotplug

 drivers/hwtracing/coresight/coresight-etm.h   |  46 ++-
 .../coresight/coresight-etm3x-core.c          | 100 ++---
 .../coresight/coresight-etm3x-sysfs.c         | 159 ++++----
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   3 +-
 .../coresight/coresight-etm4x-core.c          | 374 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         | 199 ++++++----
 drivers/hwtracing/coresight/coresight-etm4x.h | 190 ++++-----
 7 files changed, 588 insertions(+), 483 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


