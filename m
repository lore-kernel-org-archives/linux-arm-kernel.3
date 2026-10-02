Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C9ECA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Q6oLTF+6Kqfx7VdG7sciEA16G353zobKG63QaGPfV8=; b=NswN3RXPjJ/pC8
	p/NN5yQ4cVcnEazx+D6LjVU7/5Bd3sBUjJEM0nB1uzXINvLOLD067sq7aEwWYr5Z2YcEGN2rRRxbv
	voSU/bDPToudCn8CyHkaqOLJ2T39BL3Gc4rt4YrNnEw0QKGJtFbXq1IDF9V/U8gwEywfOaUH/Hnke
	ism62RIYIvqDnAOoIVYtuMl5bzK0udQq9ziQsXe2J5r9HHqnKHEJf0/dP77a75wVpbGldqPPr8CVA
	24mqWcTbL/AweV/rg0KZMgivy+tqDD5sUXdIrVZoI4ev6t5XQMVGvOynS/Pe6fnx8XyUEh/xCABjo
	cDmuUTpZ9AIq5n+a6Txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXk-0000000CLga-1ojk;
	Fri, 02 Oct 2026 19:03:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiXh-0000000CLf1-3cSI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:03:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D64142F;
	Fri,  2 Oct 2026 12:03:33 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 400513F85F;
	Fri,  2 Oct 2026 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967817; bh=TbnVt3gQWmpcMUUHHajzpHckoRHYF737sR5u33zz6ek=;
	h=From:Subject:Date:To:Cc:From;
	b=jWixvWMSQPprN4sDVPjylBBh9xxN+fGM4CMWg+dngp8op8RPklL+hjpGHySgOFIZR
	 NQYhoAM6dgDnNfPeMAMKzNwzT91riT+Sjln7YBHwCLi6tfjhEXjStm4YLx58H2fHEz
	 MxK9NdKLMw69ej719T258THTalBSVG8P4maHrb3M=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v13 00/14] fix several inconsistencies with sysfs
 configuration in etmX
Date: Fri, 02 Oct 2026 20:03:21 +0100
Message-Id: <20261002-separate_etm_cfg_v2-v13-0-fe429d8d96fb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPn/v2oC/33NywqDMBAF0F+RrJvijMZoV/2PUiRPzcIHiUiL+
 O+NbioFu7yXuWcWEox3JpBbshBvZhfc0McA2SUhqhV9Y6jTsSCYYpFWADSYUXgxmdpMXa1sU89
 IMwalgKJU0loSl6M31r129vGMuXVhGvx7/zJDutX/wXhEUwqSA9MVq5CLu/DdVQ0d2bwZ4GiwE
 wOioVEiKzUDnvMfAw8G5icGRkOgzEGj5Qrl11jX9QM+ylotPwEAAA==
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5779; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=TbnVt3gQWmpcMUUHHajzpHckoRHYF737sR5u33zz6ek=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqv///eNenjJHKMCxTJOH7tptKpRUK4ca1T6/DG
 bxCtbP/rNuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCar///wAKCRBt1cPRWsUx
 M1MNDACKezudDcFRYbvFgi6Eur4LQmQY7SHC1Dxl44XhkeY0RQ32j2VUFP7JCAZLyMgMLVQ/uFf
 jqvZAoD1osyZGwga9NPkoGMbzgMnYhu4dAKNHpSSOZtePCwQMhS6YgAKxxsG5Koqlq+LeLT25PN
 q7RwdZnlM1Z9hXaHf8qJpBY64N65w3SUTqkYRvYdSOMC+oA10/sAN+xGDXDTbapC4lRqNclazdh
 K/zI8Ft8IkTABtaLEjApfhUxvU+AMUunL9qqa+ZkqUFiioFM0rp+bpDLzysTehSVdt0qBQphBSD
 6qhinJPNtoqIw7RFS35jQXQPEVvTRtK9Ld+FXh3RZ4kpkY/RKv/TsTWo/G2sUcxfA6RvPfIxNlp
 pALWTINtbD3MyyGWycksG55Qa7r0Shq/z53kqLoUbUwI8s2yLU54XWGMnlOuePT2ONr0HgWMjDP
 mPvggbGMrZd9vq6FQTosiUdEdCdb3DrxzMI1pIN6vbF5pSB1+/3iRWhgpLJ9LMj2hui/Q=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_120337_989258_D9D7868D 
X-CRM114-Status: GOOD (  13.31  )
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

  - curr_config, which is applied configuration for the current session
  - config, which stores the settings configured via sysfs.

and apply configuration from configfs after taking a mode.

Patch History
=============
from v12 to v13:
  - add r-b tags
  - Link to v12: https://lore.kernel.org/r/20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com

from v11 to v12:
  - rename active_config to curr_config.
  - rename config to sysfs_config.
  - remove redundant config argument in etmX_args.
  - add read-back and copy from curr_config to sysfs_config TRCSEQSTR
    (seq_state).
  - add r-b and t-b tags.
  - Link to v11: https://lore.kernel.org/r/20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com

from v10 to v11:
  - replace direct register read from etm3 sysfs with IPI.
  - fix issue cntr_val and others field which required to be shown after
    sysfs session disable.
  - prohibit the write for some etm3 sysfs while sysfs session is
    enabled.
  - drop locktype change in etm3
  - Link to v10: https://lore.kernel.org/r/20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com

from v9 to v10:
  - rebase to coresight/next
  - https://lore.kernel.org/all/20260725113645.57519-1-yeoreum.yun@arm.com/

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

---
Yeoreum Yun (14):
      coresight: etm4x: read-back TRCSEQSTR at disabling and prohibit modifying seq_state while enabling.
      coresight: etm4x: prohibit modifying cntr_val while session is enabled
      coresight: etm3x: prohibit modifying cntr_val and reset while session is enabled
      coresight: etm4x: fix inconsistencies with sysfs configuration
      coresight: etm3x: fix inconsistencies with sysfs configuration
      coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
      coresight: etm4x: introduce struct etm4_caps
      coresight: etm4x: exclude ss_status from drvdata->config
      coresight: etm4x: remove s_ex_level from config
      coresight: etm4x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm4x: rename drvdata->config to sysfs_config
      coresight: etm3x: introduce struct etm_caps
      coresight: etm3x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm3x: rename drvdata->config to sysfs_config

 drivers/hwtracing/coresight/coresight-config.c     |  18 +-
 drivers/hwtracing/coresight/coresight-config.h     |  22 +
 drivers/hwtracing/coresight/coresight-etm.h        |  48 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 196 +++--
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 461 +++++-----
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |  14 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 567 ++++++------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 961 +++++++++++----------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 199 +++--
 9 files changed, 1340 insertions(+), 1146 deletions(-)
---
base-commit: a3281934612608db9e1d24aaf913c846e913de89
change-id: 20260911-separate_etm_cfg_v2-3518a168cbff

Best regards,
-- 
Sincerely,
Yeoreum Yun


