Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774E2C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tu3FMDsHigiQn50IpxUVGSpwlAirW5ewQunvzcK1lUA=; b=mXJhDREFiAVA5xbpynIiuYxebj
	vMERcRzDgXdkTsd+OGelKnAGgJlmgb9TJIpl1oj1MRLwR7BTjopqDU2ta2FVkCkd+GAtca1O5524X
	tR/hf781KZ6HLRK9DR+9ePm2p8mtXAM0yjYx0vfjeCLxKn0c81bnuIo4u3+5sW3GyvOfdZ/xQ8mYZ
	feK84g2c0EO1OyzndfTZ+6XkHGArWNWD8yTMiWf9VA+hLPCY9KAtJdl0+UXJHVvKyxz19svUSsf8Z
	vOzhE/MW4M39HSpZAqcZw24eAKt/2ugGcp7iwae9E8zWikko8+mVQUf4uDBRkz9iDFX9M2YGw/iJs
	rhd8vCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg48-000000045Fq-3jp2;
	Tue, 01 Apr 2025 18:10:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg18-000000044aR-2heR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:07:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC3312FC;
	Tue,  1 Apr 2025 11:07:20 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF6B23F59E;
	Tue,  1 Apr 2025 11:07:15 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Date: Tue,  1 Apr 2025 19:07:01 +0100
Message-Id: <20250401180708.385396-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110718_736510_DAD87450 
X-CRM114-Status: GOOD (  11.63  )
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

This series is to enable AUX pause and resume on Arm CoreSight.

The first patch extracts the trace unit controlling operations to two
functions.  These two functions will be used by AUX pause and resume.

Patches 02 and 03 change the ETMv4 driver to prepare callback functions
for AUX pause and resume.

Patch 04 changes the ETM perf layer to support AUX pause and resume in a
perf session.  The patch 05 re-enables sinks after buffer update, based
on it, the patch 06 updates buffer on AUX pause occasion, which can
mitigate the trace data lose issue.

Patch 07 documents the AUX pause usages with Arm CoreSight.

This patch set has been verified on the Hikey960 board.

It is suggested to disable CPUIdle (add `nohlt` option in Linux command
line) when verifying this series.  ETM and funnel drivers are found
issues during CPU suspend and resume which will be addressed separately.

Changes from v3:
- Re-enabled sink in buffer update callbacks (Suzuki).

Changes from v2:
- Rebased on CoreSight next branch.
- Dropped the uAPI 'update_buf_on_pause' and updated document
  respectively (Suzuki).
- Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
- Minor improvement for error handling in the AUX resume flow.

Changes from v1:
- Added validation function pointers in pause and resume APIs (Mike).


Leo Yan (7):
  coresight: etm4x: Extract the trace unit controlling
  coresight: Introduce pause and resume APIs for source
  coresight: etm4x: Hook pause and resume callbacks
  coresight: perf: Support AUX trace pause and resume
  coresight: tmc: Re-enable sink after buffer update
  coresight: perf: Update buffer on AUX pause
  Documentation: coresight: Document AUX pause and resume

 Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
 drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
 drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
 include/linux/coresight.h                          |   4 ++
 9 files changed, 265 insertions(+), 42 deletions(-)

-- 
2.34.1


