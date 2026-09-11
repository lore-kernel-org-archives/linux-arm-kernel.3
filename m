Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E281C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+aqplhvDf/OL3/5UqRL17/rrAfzRy5i+vXd2UEPt91E=; b=hsjuAy/4gj1ylU
	UCW5KPQqqJq9teed/OTPF9gv8momSYbXSJjN8Hk6RcIN+dj1O5FzPSs/5YAEW+6TXL1tXWpJs8GPb
	+NkMdqSj3v5jy0rE+ZQBnOp+aMBkEf7EwqHbLHjAZ6pvgaj6A5cqx+ktMeFBLKTq2FcsOVBw0mTs2
	XuSqI7mF2Mj1FzcUE96DUGVfZM64rejlqQc//fV2PkjSsvqks13TokM5g0mLXLf6sp9raBLDLb1pO
	WRp4ujRQfBNhDEJ1USiIM6R7HJXwJMJIDQcniUSEYjfIZpzSxBE8BairItLRPoEFw7vx8wczV/f4M
	h1IDAwqcMLi0uAdk+77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yvc-0000000GRBG-0xSS;
	Fri, 11 Sep 2026 10:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yva-0000000GRAS-014m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:56:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07CA61570;
	Fri, 11 Sep 2026 03:56:11 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C5973F7B4;
	Fri, 11 Sep 2026 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789124174; bh=L8EzfeK5GHg9ts95UQZjIMXReLQVDSdUBWYGEouRTwo=;
	h=From:Subject:Date:To:Cc:From;
	b=FoWNhRN2PkKrNDMCkWpEKANSSmhj8pUl2ugXvG+rLVOagMPoUyWEONQZq1R2ehQKD
	 FLtFtTPyY0xeIdyhGMS9SadjMeKuVFUGxFAIpSEKYo3EAAm+KKoaqO2iS6Wtpk3P3N
	 bOtLmU5MFLTQIl/VtYxyrrjOJ5RwwtHRu/rCTdFE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v10 0/8] fix several inconsistencies with sysfs
 configuration in etmX
Date: Fri, 11 Sep 2026 11:55:59 +0100
Message-Id: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/eo2oC/x2MWwqAIBAArxL7neAaSXWVCDFbbT96oBJBdPekz
 xmYeSBRZEowVA9EujjxsRdAWVfgVrsHErwUAUoqLXtEkei00WYylDfjfDCXEk2LnUXdudl7KOU
 ZyfP9b8fpfT9Urkq8ZgAAAA==
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=L8EzfeK5GHg9ts95UQZjIMXReLQVDSdUBWYGEouRTwo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqo95HtZ4cpF4zqoXqt5mEqsg7wKxqYq7f+aYuk
 2jGxbUKS6+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqPeRwAKCRBt1cPRWsUx
 M0XlC/9g+sHLYYPrYo3Ooh00EvSPsOSpRlswqk9J+F1lhK218YZPlskc2uLITKHOsEJ3pot966r
 Eldo4+4z7he90kmj6kd5CRmynThXHjf61AZ/wJTM0d93L7XtQf9oFC22NiSQmD+41JuRJu4rgbf
 9CFTcviIUEZ8j4GkPl6017E38c10kSqB51SEWuK5Gm3Th0Bkv0zqIQEIHkYbE/OEql0Uaw+ueNF
 UiIe2mbeAej3EmI0PPjfkvYInkN9fvKF4lBm/xipHVSUqO2p67QJUpcgvVCjtytJ/BbeVx+RgSI
 014Z9gEOTadTXxEJD0pbHJvgHd7upC7vWoSJBH40Ktsc30JuslyaF50WSw8nwkwjDUE3/IRcobB
 vXG/ZY/u4AoRYIUTSyumdDewRpD2Ndk4zJL4IGRSYaKH8a85oAHUohvPF5yvV2sYVqnbmy7NlJb
 74pTZD1w6SYc91IOv/0KYNI85YpE4kJKDYv13MuiyoNLbMbFNCWzQg+xOS0MPM5LZIuTk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035618_165613_E1E17243 
X-CRM114-Status: GOOD (  12.80  )
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

Patch History
=============
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
Yeoreum Yun (8):
      coresight: etm4x: fix inconsistencies with sysfs configuration
      coresight: etm3x: fix inconsistencies with sysfs configuration
      coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
      coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
      coresight: etm4x: introduce struct etm4_caps
      coresight: etm4x: exclude ss_status from drvdata->config
      coresight: etm4x: remove s_ex_level from config
      coresight: etm3x: introduce struct etm_caps

 drivers/hwtracing/coresight/coresight-config.c     |  18 +-
 drivers/hwtracing/coresight/coresight-config.h     |  22 ++
 drivers/hwtracing/coresight/coresight-etm.h        |  48 ++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  96 ++---
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 155 ++++----
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |  14 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 413 +++++++++++----------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 204 +++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      | 196 +++++-----
 9 files changed, 645 insertions(+), 521 deletions(-)
---
base-commit: 9e3604d7369cfc0110100eb1a0acab1865ee2d18
change-id: 20260911-separate_etm_cfg_v2-3518a168cbff

Best regards,
-- 
Sincerely,
Yeoreum Yun


