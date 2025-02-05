Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0329C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qLnZ78Py+wfjPr+X+JYST1fSbSyNwDBvlEsN0KsU6Zg=; b=caHC5Gll7drpqLE5/dfZqwyIX0
	+FcmZf/F+ArEEg1H0uyjWbr5wigBZmgP32LaJIBtJoha0pj2j9Ov1GZuE6GBbjgpTkUr1qIXLy96S
	X8O1P1FqGawWowFYQLuHmavS9iBMl4W5Y9atLI3hZ63iGTq5mfIbd2JTW2p1FGhZaYWhRuPoL8KDI
	bageG+8thjiwTzmG6x+z8fGPXIOYemC0gX+z6YjoutSB3W0TpXdGXnwbuT6MPLou0nEKbjtnVgtM8
	QMNe7mG+ytWVnzAZg+rJqCZgnS5jPc9rzc/j4IzMtptXGxsxLtRivIuVV2vnVL9IxKz3sNl0lBSIZ
	3JLPXatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeLa-00000003AJg-064D;
	Wed, 05 Feb 2025 12:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKC-000000039w7-3Ob5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 160DE1007;
	Wed,  5 Feb 2025 04:16:34 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C1163F63F;
	Wed,  5 Feb 2025 04:16:07 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 00/11] perf script: Refactor branch flags for Arm SPE
Date: Wed,  5 Feb 2025 12:15:44 +0000
Message-Id: <20250205121555.180606-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041612_956032_EEAE5C5F 
X-CRM114-Status: UNSURE (   9.81  )
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

This patch series refactors branch flags for support Arm SPE.  The patch
set is divided into two parts, the first part is for refactoring common
code and the second part is for enabling Arm SPE.

For refactoring branch flags, the sample flaghs are classified as branch
types and events.  A program branch type can be conditional branch,
function call, return or expection taken.  A branch event happens when
taking a branch.  This series combines branch types and the associated
events to present a sample flag.

The second part is to enable Arm SPE's sample flags for expressing
branch types and events, and support branch stack.

Patches 01 - 03 are to refactor branch types and branch events.
Patches 04, 05 extend to support not-taken event.

Patches 06 - 09 enables branch flags in Arm SPE.  This allows to print
out sample flags for samples.

Patch 10 supports branch stack for Arm SPE.  Patch 11 is an enhancement
for PBT feature.

Before:
  perf record -e arm_spe_0/load_filter=1,store_filter=1,branch_filter=1/ \
    -- ~/perf-c2c-usage-files/false_sharing.exe 1
  perf script --itrace=i1ibl -F,+flags,+addr,+brstack
   false_sharing.e  414489 [005] 775348.899294:          1                                                  branch:   jmp                   ffffc0fad9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899294:          1                                            instructions:   jmp                   ffffc0fad9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899294:          1                                                  branch:   jmp                   ffffc0fad98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899294:          1                                            instructions:   jmp                   ffffc0fad98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899297:          1                                                  branch:   br miss                   ffff8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)
   false_sharing.e  414489 [005] 775348.899297:          1                                            instructions:   br miss                   ffff8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)
   false_sharing.e  414489 [005] 775348.899297:          1                                                  branch:   br miss                   ffff826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
   false_sharing.e  414489 [005] 775348.899297:          1                                            instructions:   br miss                   ffff826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)
   false_sharing.e  414489 [005] 775348.899298:          1                                            instructions:                                        0 ffffc0fadaad6124 mas_walk+0x274 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899300:          1                                            instructions:                                        0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899301:          1                                            instructions:                                        0 ffffc0fad98c3dcc __sync_icache_dcache+0x5c ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899301:          1                                                  branch:   jmp                   ffffc0fad9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899301:          1                                            instructions:   jmp                   ffffc0fad9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899306:          1                                            instructions:                                        0 ffffc0fad9b3f184 filemap_map_pages+0x178 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899307:          1                                                  branch:   jmp                   ffffc0fad9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899307:          1                                            instructions:   jmp                   ffffc0fad9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899307:          1                                            instructions:                                        0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899308:          1                                                  branch:   jmp                   ffffc0fad9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899308:          1                                            instructions:   jmp                   ffffc0fad9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899310:          1                                                  branch:   jmp                   ffffc0fad98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899310:          1                                            instructions:   jmp                   ffffc0fad98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms])
   ...

After:
  perf script --itrace=i1ibl -F,+flags,+addr,+brstack
   false_sharing.e  414489 [005] 775348.899294:          1                                                  branch:   return                ffffc0fad9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms]) 0xffffc0fad98b2c68 ([kernel.kallsyms])/0xffffc0fad9ef3d68 ([kernel.kallsyms])/P/-/-/5/RET/- 
   false_sharing.e  414489 [005] 775348.899294:          1                                            instructions:   return                ffffc0fad9ef3d68 ffffc0fad98b2c68 search_cmp_ftr_reg+0x8 ([kernel.kallsyms]) 0xffffc0fad98b2c68 ([kernel.kallsyms])/0xffffc0fad9ef3d68 ([kernel.kallsyms])/P/-/-/5/RET/- 
   false_sharing.e  414489 [005] 775348.899294:          1                                                  branch:   jcc/not_taken/        ffffc0fad98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms]) 0xffffc0fad98b3704 ([kernel.kallsyms])/0xffffc0fad98b3708 ([kernel.kallsyms])/PN/-/-/6/COND/- 
   false_sharing.e  414489 [005] 775348.899294:          1                                            instructions:   jcc/not_taken/        ffffc0fad98b3708 ffffc0fad98b3704 get_arm64_ftr_reg+0x30 ([kernel.kallsyms]) 0xffffc0fad98b3704 ([kernel.kallsyms])/0xffffc0fad98b3708 ([kernel.kallsyms])/PN/-/-/6/COND/- 
   false_sharing.e  414489 [005] 775348.899297:          1                                                  branch:   return/miss/              ffff8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0) 0xffff8266dafc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/0xffff8266da60 (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/M/-/-/12/RET/- 
   false_sharing.e  414489 [005] 775348.899297:          1                                            instructions:   return/miss/              ffff8266da60     ffff8266dafc __sprintf_chk@plt+0xc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0) 0xffff8266dafc (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/0xffff8266da60 (/usr/lib/aarch64-linux-gnu/libnuma.so.1.0.0)/M/-/-/12/RET/- 
   false_sharing.e  414489 [005] 775348.899297:          1                                                  branch:   jcc/miss,not_taken/       ffff826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so) 0xffff826a44e8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/0xffff826a44ec (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/MN/-/-/23/COND/- 
   false_sharing.e  414489 [005] 775348.899297:          1                                            instructions:   jcc/miss,not_taken/       ffff826a44ec     ffff826a44e8 strcmp+0xa8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so) 0xffff826a44e8 (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/0xffff826a44ec (/usr/lib/aarch64-linux-gnu/ld-2.31.so)/MN/-/-/23/COND/- 
   false_sharing.e  414489 [005] 775348.899298:          1                                            instructions:                                        0 ffffc0fadaad6124 mas_walk+0x274 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899300:          1                                            instructions:                                        0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899301:          1                                            instructions:                                        0 ffffc0fad98c3dcc __sync_icache_dcache+0x5c ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899301:          1                                                  branch:   jmp                   ffffc0fad9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms]) 0xffffc0fad9ba99c0 ([kernel.kallsyms])/0xffffc0fad9ba7f24 ([kernel.kallsyms])/P/-/-/8//- 
   false_sharing.e  414489 [005] 775348.899301:          1                                            instructions:   jmp                   ffffc0fad9ba7f24 ffffc0fad9ba99c0 folio_add_file_rmap_ptes+0x48 ([kernel.kallsyms]) 0xffffc0fad9ba99c0 ([kernel.kallsyms])/0xffffc0fad9ba7f24 ([kernel.kallsyms])/P/-/-/8//- 
   false_sharing.e  414489 [005] 775348.899306:          1                                            instructions:                                        0 ffffc0fad9b3f184 filemap_map_pages+0x178 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899307:          1                                                  branch:   jcc/not_taken/        ffffc0fad9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms]) 0xffffc0fad9b3d7ac ([kernel.kallsyms])/0xffffc0fad9b3d7b0 ([kernel.kallsyms])/PN/-/-/15/COND/- 
   false_sharing.e  414489 [005] 775348.899307:          1                                            instructions:   jcc/not_taken/        ffffc0fad9b3d7b0 ffffc0fad9b3d7ac next_uptodate_folio+0xc4 ([kernel.kallsyms]) 0xffffc0fad9b3d7ac ([kernel.kallsyms])/0xffffc0fad9b3d7b0 ([kernel.kallsyms])/PN/-/-/15/COND/- 
   false_sharing.e  414489 [005] 775348.899307:          1                                            instructions:                                        0 ffffc0fad9b3d98c next_uptodate_folio+0x2a4 ([kernel.kallsyms])
   false_sharing.e  414489 [005] 775348.899308:          1                                                  branch:   jcc                   ffffc0fad9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms]) 0xffffc0fad9ef3d70 ([kernel.kallsyms])/0xffffc0fad9ef3da4 ([kernel.kallsyms])/P/-/-/20/COND/- 
   false_sharing.e  414489 [005] 775348.899308:          1                                            instructions:   jcc                   ffffc0fad9ef3da4 ffffc0fad9ef3d70 bsearch+0x58 ([kernel.kallsyms]) 0xffffc0fad9ef3d70 ([kernel.kallsyms])/0xffffc0fad9ef3da4 ([kernel.kallsyms])/P/-/-/20/COND/- 
   false_sharing.e  414489 [005] 775348.899310:          1                                                  branch:   jmp                   ffffc0fad98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms]) 0xffffc0fad98a159c ([kernel.kallsyms])/0xffffc0fad98a2158 ([kernel.kallsyms])/P/-/-/5//- 
   false_sharing.e  414489 [005] 775348.899310:          1                                            instructions:   jmp                   ffffc0fad98a2158 ffffc0fad98a159c el0t_64_sync+0x198 ([kernel.kallsyms]) 0xffffc0fad98a159c ([kernel.kallsyms])/0xffffc0fad98a2158 ([kernel.kallsyms])/P/-/-/5//- 
   ...


Leo Yan (11):
  perf script: Make printing flags reliable
  perf script: Refactor sample_flags_to_name() function
  perf script: Separate events from branch types
  perf script: Add not taken event for branches
  perf script: Add not taken event for branch stack
  perf arm-spe: Extend branch operations
  perf arm-spe: Decode transactional event
  perf arm-spe: Fill branch operations and events to record
  perf arm-spe: Set sample flags with supplement info
  perf arm-spe: Add branch stack
  perf arm-spe: Support previous branch target (PBT) address

 tools/perf/builtin-script.c                   |  30 ++--
 .../util/arm-spe-decoder/arm-spe-decoder.c    |  23 ++-
 .../util/arm-spe-decoder/arm-spe-decoder.h    |  11 +-
 .../arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 +-
 .../arm-spe-decoder/arm-spe-pkt-decoder.h     |  12 +-
 tools/perf/util/arm-spe.c                     | 135 ++++++++++++++++++
 tools/perf/util/branch.h                      |   3 +-
 tools/perf/util/event.h                       |  12 +-
 tools/perf/util/trace-event-scripting.c       | 116 +++++++++++----
 tools/perf/util/trace-event.h                 |   2 +
 10 files changed, 307 insertions(+), 51 deletions(-)

-- 
2.34.1


