Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866EDE937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PNT5ItI1IVrIA02ILUZJxVXnoAzB8DUilzB6A31Brg=; b=qspT6HjOUSz7vmazSN8ahR1Hib
	+DwIAk/7mScPr+xmy4oLgohtJxhIubeHk76dypba8Tb6XZ2hOpcoRXwrsbTj+3ifGqYc7d9XhxiCD
	yqwPxcL4xcGUV03RHBcQXRgv5THR6Ld4DvBRMmpvWTgi7uU2O+sWGaqbXt++jSuJPUZwucvIdeLFr
	BbfImhqs3DtSXB7/NKr/bKX9B20SQ4rtb7qAWT2CMyi4ry9wDCCHqGSNtAyjzLNSWe18fczOJqfC0
	tCzBrTc2eUqiHTmAkIjRgK8AgkFKNHK16qT2c5iMlWaRSPHY6p0Zw7u+2kl9EDkgJk1H7kRJT2uXt
	99sKoymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1f-0000000EYsy-3vLE;
	Sun, 12 Apr 2026 17:55:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1c-0000000EYrv-1CM3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:55:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB0E132FA;
	Sun, 12 Apr 2026 10:55:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2F1E3F7B4;
	Sun, 12 Apr 2026 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776016510; bh=+slWvVcYov6iDyAPQdLjBb+UebT5tUgCGSNZJwVcFgg=;
	h=From:To:Cc:Subject:Date:From;
	b=dL5Q3Yzdh4mxoTHwW5Bn5ho9lFUztXiUsB9U2P7cBbC4DYM3NGA8OYFjx1CjHEFsB
	 RncB6yrxfYR4ZEnoLY5ujGo4O+lhyZMpyEJyLz53IBwolmKWGOVtIjaC9XHdt7oAi5
	 /UGaNqAGNG3aW/fcWX5oPjqqJKBwN9lD7pOaXBtE=
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
Subject: [PATCH v3 0/5] fix inconsistencies with sysfs configuration in etmX
Date: Sun, 12 Apr 2026 18:55:01 +0100
Message-Id: <20260412175506.412301-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_105512_464170_A396754C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

This patch based on v7.0-rc7

Patch History
=============
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

Yeoreum Yun (5):
  coresight: etm4x: introduce struct etm4_caps
  coresight: etm4x: exclude ss_status from drvdata->config
  coresight: etm4x: fix inconsistencies with sysfs configration
  coresight: etm3x: introduce struct etm_caps
  coresight: etm3x: fix inconsistencies with sysfs configration

 drivers/hwtracing/coresight/coresight-etm.h   |  44 ++-
 .../coresight/coresight-etm3x-core.c          |  59 ++--
 .../coresight/coresight-etm3x-sysfs.c         |  29 +-
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   3 +-
 .../coresight/coresight-etm4x-core.c          | 322 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         | 197 ++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h | 180 +++++-----
 7 files changed, 465 insertions(+), 369 deletions(-)


base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


