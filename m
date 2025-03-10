Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F16DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlqE4qE6OPFidY4CG/IBm2h7QLwV8tIrE6C3uoFZbmU=; b=DralWaN38maaSGGeNnZVhAHJr/
	4L8m9M6dz8TbqNcgAT9kVZofmf7K+SdN/Qgwkuy6OZsbZPJfry5jcjmIoewyQR0q6OcuU0uc784ut
	tVsrkzzG3rZw2dGJzqUpauGGeE+Nn/j1vwQaETl+8iJszB72wbDEyO6HjX2jYXW6GiCyzqh6edP+M
	GUMAXy564/Pmk0pYp7vDJ01tmnQWWJCmt6J7QHv7bFF/959lTW93pG5dOM/tfj+SfLfjs83tC+Ao1
	t9kZP3m0yImJN1LCCCX9j5+UP/Q2KD7QIxM968A6wjtZJL2oNUIRcB8gD78AiI9Eso1X/EHb8IQ3p
	Sw1I4FMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbYJ-00000002T6J-1DpV;
	Mon, 10 Mar 2025 11:44:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trahM-00000002JHK-44cC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:49:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091DB153B;
	Mon, 10 Mar 2025 03:49:40 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEF8A3F673;
	Mon, 10 Mar 2025 03:49:26 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/8] Arm CoreSight: Support AUX pause and resume
Date: Mon, 10 Mar 2025 10:49:11 +0000
Message-Id: <20250310104919.58816-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034929_054008_8B435CC7 
X-CRM114-Status: GOOD (  12.03  )
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
perf session.  The patches 05 and 06 offers an extra feature for
updating buffer on AUX pause occasion, which can mitigate the trace data
lose issue.

Patch 07 documents the AUX pause usages with Arm CoreSight.  The last
patch syncs headers between user space and the kernel.

This patch set has been verified on the Hikey960 board and TC platform.
The previous one uses ETR and the later uses TRBE as sink.

It is suggested to disable CPUIdle (add `nohlt` option in Linux command
line) when verifying this series.  ETM and funnel drivers are found
issues during CPU suspend and resume which will be addressed separately.

Changes from v1:
- Added validation function pointers in pause and resume APIs (Mike).


Leo Yan (8):
  coresight: etm4x: Extract the trace unit controlling
  coresight: Introduce pause and resume APIs for source
  coresight: etm4x: Hook pause and resume callbacks
  coresight: perf: Support AUX trace pause and resume
  coresight: etm: Add an attribute for updating buffer
  coresight: perf: Update buffer on AUX pause
  Documentation: coresight: Document AUX pause and resume
  perf cs-etm: Sync kernel coresight-pmu.h header

 .../trace/coresight/coresight-perf.rst        |  50 ++++++
 drivers/hwtracing/coresight/coresight-core.c  |  20 +++
 .../hwtracing/coresight/coresight-etm-perf.c  |  94 +++++++++-
 .../hwtracing/coresight/coresight-etm-perf.h  |   2 +
 .../coresight/coresight-etm4x-core.c          | 166 ++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
 drivers/hwtracing/coresight/coresight-priv.h  |   2 +
 include/linux/coresight-pmu.h                 |   1 +
 include/linux/coresight.h                     |   4 +
 tools/include/linux/coresight-pmu.h           |   1 +
 10 files changed, 289 insertions(+), 53 deletions(-)

-- 
2.34.1


