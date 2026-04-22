Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546B6F9EDC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PWgin5xzPDuA1r3tNbrkvodzYu4p7O8819GOB0OQhxA=; b=iLcEZvUSb+Ys5Zwlz7v3ZQYufY
	DnrP6R2jWDWCK2o7h45XL1OSMjKKyUZU/zxdSSg7lHi9UpIuaa8L9tFbL7fHAXvlpLafXB/W8gpCP
	N9mc4+28jLZcJZlTYdBGQAcXY+bsQGg75gHCcObiUHdEYTfbGMagIkjnF06FnhY45uO7nNRzXmjwd
	FTaKaafJBL+5R9KWgsY2sI2Z0advTNptPC71HhHLdhmwFrO8wUnz5D5dmcUCqCJZoKKKAQRuQkBl4
	CK4GyopBm+hVp4Xu7cMzFv14oYOQLBBnc7ZKX0ZZ504sNJUd1t65OUG6kPUIfppR34GbDUgmFLbce
	WAAFoLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXX0-0000000AHa2-0unL;
	Wed, 22 Apr 2026 13:22:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXWt-0000000AHYO-0GRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31DA21E2F;
	Wed, 22 Apr 2026 06:22:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E57663FD46;
	Wed, 22 Apr 2026 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864127; bh=1Dl9mLxUt7hW/4BYBJxfcg/K5lhhqXp4yvX5HtjxTxE=;
	h=From:To:Cc:Subject:Date:From;
	b=dkVSCzdaH95uaHkhAzUYSKa8IoerGaZKzMqkDgt36xJGNkYnAop/DliHlgNDYkJZZ
	 XJ4zuzx4SH+G/rnS+8EbxYnIhg+Scqu/H+sSXfiKG3Sk1XiVKq4QmcNDW1lVxQgSCD
	 x97wROp1YubRhoUVEYxJfnf/YTzAf6ttPmaYI7I8=
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
Subject: [PATCH v6 00/13] fix several inconsistencies with sysfs configuration in etmX
Date: Wed, 22 Apr 2026 14:21:50 +0100
Message-Id: <20260422132203.977549-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062211_244446_C5F51C22 
X-CRM114-Status: GOOD (  11.76  )
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
  - missing call of cscfg_csdev_disable_active_config()

This patch based on v7.0

Patch History
=============
from v5 to v6:
  - fix missing of calling cscfg_csdev_disable_active_config()
  - add rb & fixes tags.
  - add ss_status field in etm4x_drvdata to expose STATUS and PENDING bits.
  - https://lore.kernel.org/all/20260415165528.3369607-1-yeoreum.yun@arm.com/

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

Yeoreum Yun (13):
  coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
  coresight: etm4x: fix underflow for nrseqstate
  coresight: etm4x: introduce struct etm4_caps
  coresight: etm4x: exclude ss_status from drvdata->config
  coresight: etm4x: remove redundant fields in etmv4_save_state
  coresight: etm4x: fix leaked trace id
  coresight: etm4x: fix inconsistencies with sysfs configuration
  coresight: etm4x: remove redundant call etm4_enable_hw() with hotplug
  coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf
    enable
  coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
  coresight: etm3x: introduce struct etm_caps
  coresight: etm3x: fix inconsistencies with sysfs configuration
  coresight: etm3x: remove redundant call etm_enable_hw() with hotplug

 drivers/hwtracing/coresight/coresight-etm.h   |  46 ++-
 .../coresight/coresight-etm3x-core.c          | 101 ++---
 .../coresight/coresight-etm3x-sysfs.c         | 159 +++----
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   3 +-
 .../coresight/coresight-etm4x-core.c          | 388 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         | 202 +++++----
 drivers/hwtracing/coresight/coresight-etm4x.h | 190 +++++----
 7 files changed, 606 insertions(+), 483 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


