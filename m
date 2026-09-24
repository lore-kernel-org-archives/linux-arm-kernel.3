Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECF2C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7sosICFSPkyiTQo0MGSmpDiNmi6g0Ot7hQF1ARun3fA=; b=ywKkchDUWt5TyT
	MMp0REls8f3CkoZywwPQYTdfJBsuqZ5YV56Us6H8exLZiW51+M5munPaJTm22C1FKFEqt//BF6XnU
	KUL0SVtaVHjkWSERrd/93+s5mjuyZ8/CWXqjcPsMqRrjGuLGuTaL87jypX6S5Q2Sc9W5/++6e9KQx
	BtvrMBlqc/Gv1tecCjBIUKD7tio6dc5Y4JVO0LSRhG91MLem40rDz7f5UpsEu4pLKCUFt2Xz3kF/N
	QUVj1Ia4TPpF9iHX4H68vIcUiWE8zbqRTDkWSwe7v/kT2h0imHYOBX+JpqO6M4lhp2geBXzysSZ+s
	g6VlGvqHkx7B8sMWCNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nKu-0000000Bm8r-1wAm;
	Thu, 24 Sep 2026 17:34:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nKq-0000000Bm7e-0Kta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387471E4D;
	Thu, 24 Sep 2026 10:34:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63A6A3F86F;
	Thu, 24 Sep 2026 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271253; bh=QdGBmO5V0iQIW02FrfgvhrRx27to9UxuZH1EW+m6zG0=;
	h=From:Subject:Date:To:Cc:From;
	b=imnQLMT8axqY8MaQE9nuSLfvCEFRogkiODOjHkxYcq/BmYAwsn7cjqp3tCpgra20n
	 S+jb0YTxqK4DCYgv71tbSwgMZw9CHpeJvwnu9FIAZYPRSxN+iMUvxeI8C9S5Hn4NT8
	 +Gxjb1rCQY4TS40sEQrlRWNtmHMIt97bOswwwCPI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v12 00/14] fix several inconsistencies with sysfs
 configuration in etmX
Date: Thu, 24 Sep 2026 18:33:38 +0100
Message-Id: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPNetWoC/33NQQ6CMBAF0KuQrq3pjJaCK+9hDCntFLpASEsaD
 eHuFja60eX/mf9mYZGCp8guxcICJR/9+MgB8FAw0+tHR9zbXDAUWIoagEeadNAzNTQPjXFdk5C
 fJFQaysq0zrG8nAI5/9zZ2z3n3sd5DK/9SwKx1f/BfMQFh1aBtLWsUemrDsPRjAPbvATwbcgfB
 mTDYouyshLUWX2MdV3fuhhT8fsAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5641; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=QdGBmO5V0iQIW02FrfgvhrRx27to9UxuZH1EW+m6zG0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8L0XTVwGE93MoHZp9g+aF5HqImnglOzDEyv
 xfFaAKDtjuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfCwAKCRBt1cPRWsUx
 M+75C/9pZInzTi1gUtVRTAsaf1UmnFVjIWxX8WJ/VhjoyspfGHH8REdzBdL/Ysik32ry10T3r2f
 nj9iZuKlmbd9+ZkfuUxdll35XW+j3ZCZ4/HnQZtq1u7RMZgs+RwU6Ae+PW+A5eYbYqYUTR3tKiV
 eJnGfqpr7GkueCA/kZk8bEv9bHvSzB5LAJ2p0fHWBMyIQbP087Xx5KyowY90N9pDylG7gtblavg
 jf4VsB85ObVtCrJmrNnEDxnRPItQlWCrHgSAiHo2jvusE0cQOFrE8oeqcljnEr/Xjf9NNZenblT
 5A6G9aDwtcAIH66RFe+cuhwUQjYhO4tQiUbokKcJueq55/hd3vX+PV7FIewuQMfAFu7ZsyEc9Xu
 UMm4EGDN7Iap3GsYDVs283sdq4zj+o5FA59z7oU+s5T/7z5zAOugh/GHIW0JewjuNl2ad+nKTae
 vSm/Xk/BVk1V+NCv07xallonqzB6jjgJbNXfFSZgLTifDKRrA0+5+3eo2fpQs5MXr+iHQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103416_232887_EEF0B352 
X-CRM114-Status: GOOD (  13.25  )
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
base-commit: 9e3604d7369cfc0110100eb1a0acab1865ee2d18
change-id: 20260911-separate_etm_cfg_v2-3518a168cbff

Best regards,
-- 
Sincerely,
Yeoreum Yun


