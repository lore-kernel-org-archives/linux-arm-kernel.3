Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF037C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vj0WcNUhnnLtOXVEHID9gTU0Aa3yPN7eAW1ctHKY5NQ=; b=yx4kA88SBj90NTBDnMo9lHFzg9
	7ZIVZ79xiORE9IhdeE6ngMJlzvJSyjzcGB1GMSX3UHYtyGH6zsqMDYb+FEbpliiFRXameEbIj0M62
	jc6LrUtueITIv19fdwGWSqILMHh2q0ab4gW1rnTypXycC3alGCAkwiFC4P8fABWKET5Oe8jiq55Pp
	hKiUagN7c7QlMahalYMLJVBtrWYdp38L0MDlzls5jRL26lk9f8AaJCsq9G/OWQZRTHvdaljLhpRqa
	j9YKUSuKFm0z5EetKnt4QoQdAmXULJtqfWcKNDQDB63V8Q0ZJAls7Ad0dHfmF6L5s/BIBTr/TZxKZ
	ClftqpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5C-00000004XEf-0Ebr;
	Tue, 04 Mar 2025 12:09:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQCi-00000004LvI-3wvT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EC5CFEC;
	Tue,  4 Mar 2025 03:13:03 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 635983F5A1;
	Tue,  4 Mar 2025 03:12:47 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/12] perf script: Refactor branch flags for Arm SPE
Date: Tue,  4 Mar 2025 11:12:28 +0000
Message-Id: <20250304111240.3378214-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031253_067143_82EDCFA0 
X-CRM114-Status: GOOD (  12.53  )
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

Patch 06 is to fix a bug for parsing ldst operations.  Without this fix,
the seqential changes will cause breaking for memory samples.

Patches 07 - 10 enables branch flags in Arm SPE.  This allows to print
out sample flags for samples.

Patch 11 supports branch stack for Arm SPE.  Patch 12 is an enhancement
for PBT feature.

Changes from v3:
- Deleted unnecessary change for left-justified printing in patch 01
  (Adrian).

Changes from v2:
- Added a new patch 06 for fixing the ldst operation bug (James).
- Added James' review tags (except the new added patch 06).
- Removed a wrong output result in the last patch's commit log.

Changes from v1:
- For patch 05, changed to append the 'not_taken' bit in the branch_flags.
  This can avoid altering bit layout and cause breakage.
- Added Ian's review tags.


Leo Yan (12):
  perf script: Make printing flags reliable
  perf script: Refactor sample_flags_to_name() function
  perf script: Separate events from branch types
  perf script: Add not taken event for branches
  perf script: Add not taken event for branch stack
  perf arm-spe: Fix load-store operation checking
  perf arm-spe: Extend branch operations
  perf arm-spe: Decode transactional event
  perf arm-spe: Fill branch operations and events to record
  perf arm-spe: Set sample flags with supplement info
  perf arm-spe: Add branch stack
  perf arm-spe: Support previous branch target (PBT) address

 tools/perf/builtin-script.c                   |  29 ++--
 .../util/arm-spe-decoder/arm-spe-decoder.c    |  23 ++-
 .../util/arm-spe-decoder/arm-spe-decoder.h    |  11 +-
 .../arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 +-
 .../arm-spe-decoder/arm-spe-pkt-decoder.h     |  12 +-
 tools/perf/util/arm-spe.c                     | 143 +++++++++++++++++-
 tools/perf/util/branch.h                      |   3 +-
 tools/perf/util/event.h                       |  12 +-
 tools/perf/util/trace-event-scripting.c       | 116 ++++++++++----
 tools/perf/util/trace-event.h                 |   2 +
 10 files changed, 313 insertions(+), 52 deletions(-)

-- 
2.34.1


