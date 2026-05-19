Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C99CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6ZybV9ffBO+bF3KFjdl75FHenuA3vvB4POjGhUbYG8=; b=KTKp/2jyg8ODKjhpofoybk7xoN
	PxGCQZNJ1PlLIk+OkGoONUdmSl7vsDXOUKZ2yFYvzYqHWjm3coQyB+JHBvHTdiI6KUCBMk2LoRndm
	Zvz3uyZKqTYrhwJmKNgFCLKQLSuj7237xlPBgFRYWYQrCz1eWXhVFJdNUpyGOXoSGrO3aE+TNKosH
	6XZ9nkCxkyJ8zlvq/orqES9XOAvY51DEkynaARlHV/+rz62NyJWFlDS9mOcXAHigj3ClYfmzWY1DK
	MDz1RUCUhh7O09AGt+cFEHWVqzAmLBKq6dlqAmH14EYbdp67/ENZv7Mqav0BxhiIJPxTZnfQ35ITZ
	y/k8tvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMg8-000000026az-2amE;
	Tue, 19 May 2026 15:48:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMg6-000000026aV-3CVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E9E1682;
	Tue, 19 May 2026 08:48:12 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2725E3F632;
	Tue, 19 May 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205697; bh=pQR0h+3TV82ZXu9JbMLqnWp60TwJw+934MZ9CAfLymk=;
	h=From:To:Cc:Subject:Date:From;
	b=WKYdvX4cW+aWIq0y6DNBIDu/0sQax1E6W2Wults7ZQi3sRbN659aZXsKvcgIEzSf8
	 1m6JHyJLPpjzcKO3bksMkpgJaSOzRIqO/TkY/a4tz7U3WQCZmh7/3L+xi+OPVyUSJw
	 tc+orqZQtEdN9LDoCSPpHMe7Syle4+OGiThQVaN4=
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
Subject: [PATCH v7 00/13] fix several inconsistencies with sysfs configuration in etmX
Date: Tue, 19 May 2026 16:47:59 +0100
Message-Id: <20260519154812.254884-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084818_881620_F6FFC5B1 
X-CRM114-Status: GOOD (  12.09  )
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
  coresight: etm4x: fix underflow for nrseqstate
  coresight: etm4x: introduce ETM_MAX_SEQ_TRANSITIONS
  coresight: etm4x: introduce struct etm4_caps
  coresight: etm4x: exclude ss_status from drvdata->config
  coresight: etm4x: remove redundant fields in etmv4_save_state
  coresight: etm4x: fix leaked trace id
  coresight: etm4x: fix inconsistencies with sysfs configuration
  coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf
    enable
  coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
  coresight: etm3x: introduce struct etm_caps
  coresight: etm3x: fix inconsistencies with sysfs configuration
  coresight: etm3x: remove redundant cpu online check on
    etm_enable_sysfs()

 drivers/hwtracing/coresight/coresight-etm.h   |  46 ++-
 .../coresight/coresight-etm3x-core.c          |  96 ++---
 .../coresight/coresight-etm3x-sysfs.c         | 159 ++++----
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   5 +-
 .../coresight/coresight-etm4x-core.c          | 379 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         | 202 ++++++----
 drivers/hwtracing/coresight/coresight-etm4x.h | 195 ++++-----
 7 files changed, 592 insertions(+), 490 deletions(-)


base-commit: a5dd853fb7774c9543aed272a8614c15ebce3173
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


