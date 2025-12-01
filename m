Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54039D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=56tOwbEBJTLJhjKdIT9TQkzKXCcbdtWhOBbyUqojaZc=; b=lLsV1HuOOfaJew
	TD/qqsy1MnZ8UMXlGzRyeiXlxiLYgSD7gtuN84oRyON8a9oDC3D77f4Krgz86HOsHu759y1fqNLGp
	IZk8FfcAQl3NN//sQWhD9M/vnZ9P2vuRrTZSbxCbPRvpJlFQX95zK2BsxW722hgrcGhH4htVN3lSk
	F001zFGg9eQoGmnsnne7/eWkn8i10CMjswrbSN1s9bFp1ib1wmXoBvigKa7aeAXQVnujbVgySpA1l
	vyGEh3eTgiqhJJOwfXc8j3gL6SKSCK2S+vvs7A8kvcshClPxjMT+Z2ObSSVGNWn5DcGVtwME8MTMJ
	hpNWC07f7S28OHmTdqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yv-00000003Qlh-01Mq;
	Mon, 01 Dec 2025 11:22:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yt-00000003QlA-1HZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F50B153B;
	Mon,  1 Dec 2025 03:22:01 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31B53F59E;
	Mon,  1 Dec 2025 03:22:05 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 00/19] coresight: trbe: Support trigger and circle buffer
 modes
Date: Mon, 01 Dec 2025 11:21:50 +0000
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE56LWkC/x2MSQqAMAwAvyI5W2jqgvoVkaI11VxUUhWh+HeLx
 2GYiRBImAJ0WQShmwPvWwLMM3DruC2keE4MRpsK0Wh1ykR2urwnsUJ+dOcu9kaFqvGNNgXqqqx
 bSP2RND//ux/e9wM5ztXeawAAAA==
X-Change-ID: 20251120-trbe_buffer_refactor_v1-1-8f8023105469
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=3011;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Q418Pi12Y9fylcLKnDQK9SBuEzma5xaeDlTY2E+UtgY=;
 b=DKvlT12+88iiZfKhYaoXj/K9VVQbojlYhimip3kurywxxJxainaY25rRCVhBH6dz95kgA69TF
 CJn2AMANkYLCCLgaNEBAGSDrgdxxmhyxf3hqoi2odBEi/7JP9dbYmm2
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032211_486047_FA9FD030 
X-CRM114-Status: GOOD (  10.85  )
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

The current TRBE driver operates only in fill mode, where tracing stops
at the top of buffer and a maintenance interrupt is raised.  Due to
interrupt latency, tracing is halted while the program continues to run,
resulting in trace data lose.

This series enhances the driver for the trigger mode to mitigate trace
discontinuity.  The circle buffer mode is introduced to avoid any
maintenance interrupts during the snapshot session.

It can be divided into three parts for easier review:

  Patches 01~05: Minor refactoring for disabling operations and
                 clearing status.
  Patches 06~12: Refactor fault action and trace size calculation.
  Patches 13~19: Support trigger and circle modes. To better utilize the
                 new buffer modes, perf sets the watermark to
		 one-quarter of the buffer size.

This series is applied on coresight-next branch and has been validated
on Orion O6 board:

  1) The trigger count and wrap mode are verified using Ftrace logs.
  2) A new kunit test module verifies limit and count calculations.
  3) Basic perf record / script commands and module load/unload have
     been tested successfully.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (19):
      coresight: trbe: Use helpers for checking errata
      coresight: trbe: Remove redundant disable operation
      coresight: trbe: Remove buffer disabling in trbe_handle_overflow()
      coresight: trbe: Remove set_trbe_disabled() from the enable flow
      coresight: trbe: Refactor status clearing
      coresight: trbe: Refactor syndrome decoding
      coresight: trbe: Refactor AUX flag setting
      coresight: trbe: Use PERF_AUX_FLAG_PARTIAL instead of PERF_AUX_FLAG_COLLISION
      coresight: trbe: Add fault action argument to trbe_handle_overflow()
      coresight: trbe: Always check fault action when updating buffer
      coresight: trbe: Apply overwrite erratum for only wrap event
      coresight: trbe: Calculate size for buffer wrapping
      coresight: trbe: Remove misleading comment
      coresight: trbe: Refactor compute_trbe_buffer_limit()
      coresight: trbe: Add static key for bypassing trigger mode
      coresight: trbe: Support trigger mode
      coresight: trbe: Enable circle mode for snapshot
      coresight: trbe: Add kunit tests
      perf: cs-etm: Set watermark for AUX trace

 drivers/hwtracing/coresight/Kconfig                |   9 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 .../coresight/coresight-trbe-kunit-tests.c         | 536 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-trbe.c       | 440 +++++++++--------
 drivers/hwtracing/coresight/coresight-trbe.h       | 111 ++++-
 tools/perf/arch/arm/util/cs-etm.c                  |   7 +
 6 files changed, 896 insertions(+), 208 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20251120-trbe_buffer_refactor_v1-1-8f8023105469

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


