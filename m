Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421E0C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpRMpAZDV+Hl+0RPQ0jZmFawaVMCpMbj52f5fVWQd9w=; b=Axi7gQ4KwrBpDklnXFZ3/T4gYn
	KuIP+YXMhXPXdoo6x5ao93Q6fxgf0c/fx3BZij7cPVChHMeWoXKYc4G0drrk/l9mdM8CFHoIHVT48
	uMj00Fu0qCP7fhWMEONnoVbha5In/AxEQrprSplAQv65yJR2lQmJ8RxjTAgDpRRVl0B7Y9BTgdE59
	XmQb6gCMOO5vIKBh5uUTwWYJp1cwmuiYIhsSRdXDyR45hd160Mqx2HLiCGl+JjX909tLiiegbnCNW
	KI3Bm7lySGkO2yQ9Uh78kF5b87xuKj/buouhevEINJUH2DSDv1OG+8MTsFaZgMxy4aCcVoyfI0VHx
	JKC+8l5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagf-00000000IBt-0MHL;
	Sat, 25 Jul 2026 11:37:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagb-00000000IBH-2dPF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A42041476;
	Sat, 25 Jul 2026 04:36:49 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 410D53F86F;
	Sat, 25 Jul 2026 04:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979413; bh=HT/W94VkBkTu1HicXcpPmo34HneyLW9c0AqcSxt6T9c=;
	h=From:To:Cc:Subject:Date:From;
	b=ldGIB9wOwYXbBtKTyU5qkINs/+H7LNa3wcXWPZnN5LK+cYdkyCve1YBzSbQGBSTx5
	 tWwPj+wjTyRORXlVCWHnaTVW2K2uNlNJ2MNM/O/wKe60kD6vpICXvXd8CEOBBZMISZ
	 N9iatRzgy9bfmPWVQzdgSRGK+poUxncCX9j7HcU4=
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
Subject: [PATCH v9 00/13] fix several inconsistencies with sysfs configuration in etmX
Date: Sat, 25 Jul 2026 12:36:32 +0100
Message-ID: <20260725113645.57519-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043658_225084_FF2114B9 
X-CRM114-Status: GOOD (  12.94  )
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

This patch based on coresight tree's next

Patch History
=============
from v8 to v9:
  - add feat_csdev_lock guard interface.
  - set feat_csdev->drv_spinlock as NULL for etmv4_drvdata.
  - https://lore.kernel.org/all/20260629090007.1718746-1-yeoreum.yun@arm.com/

from v7 to v8:
  - accept @Leo Yan' suggestion to handle error.
  - small minor fixes following @Suzuki' suggestion.
  - https://lore.kernel.org/all/20260519154812.254884-1-yeoreum.yun@arm.com/

from v6 to v7:
  - rebase on coresight/next
  - add ETM_MAX_SEQ_TRANSITIONS define
  - remove redundant patch relavent cpu-hotplug as coresight-pm patch
    merged.
  - https://lore.kernel.org/all/20260422132203.977549-1-yeoreum.yun@arm.com/

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
  coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
  coresight: etm4x: fix leaked trace id
  coresight: etm4x: fix inconsistencies with sysfs configuration
  coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf
    enable
  coresight: etm3x: fix inconsistencies with sysfs configuration
  coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
  coresight: etm3x: remove redundant cpu online check on
    etm_enable_sysfs()
  coresight: etm4x: introduce struct etm4_caps
  coresight: etm4x: exclude ss_status from drvdata->config
  coresight: etm4x: remove s_ex_level from config
  coresight: etm4x: remove redundant fields in etmv4_save_state
  coresight: etm3x: introduce struct etm_caps

 .../hwtracing/coresight/coresight-config.c    |  18 +-
 .../hwtracing/coresight/coresight-config.h    |  26 +
 drivers/hwtracing/coresight/coresight-etm.h   |  48 +-
 .../coresight/coresight-etm3x-core.c          |  96 ++--
 .../coresight/coresight-etm3x-sysfs.c         | 159 +++---
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  16 +-
 .../coresight/coresight-etm4x-core.c          | 454 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         | 204 ++++----
 drivers/hwtracing/coresight/coresight-etm4x.h | 204 ++++----
 9 files changed, 682 insertions(+), 543 deletions(-)


base-commit: 98495b5a4d77dd22e106f462b76e1093a55b29a7
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


