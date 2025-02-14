Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8654C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRhZ94ZDaJ7/SNWDLWpTt7Lu6iq+AFbuXKvyQN/GFWM=; b=1iLE3DT1glntROV0FRT8BwxkBl
	Zd1Hp+ByPpoeCXIkiH9iK+ozvU2SqRnopd9/Ik7s57W2Br+j/liT4E5WrhJkdIodwNvHlojnVPcB8
	h3HUK9j4qOs7K1uzWTlMbHVS95Rqzd6K8jm7nD0+OFm23H+BRmU6fL0hbDUDOLzDBT3FrRWml6VJh
	YpmM5BmGD7nMzL53FtFeV83UnTdlf/1T9/HxELq47W21oOkp+rX+hk2zyZACj0kAL4jSUPdthWWRI
	DnbCJYWXyxDadtDv8QY6KmMU2kA3U8ylg6nNFllhuPXhqQ8/Y4yeqOiloROd21lDShSE4Os+w4dOd
	ccq0PAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titky-0000000EePq-09mg;
	Fri, 14 Feb 2025 11:21:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titjW-0000000Ee1p-2eaA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25516113E;
	Fri, 14 Feb 2025 03:20:06 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 079573F6A8;
	Fri, 14 Feb 2025 03:19:42 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/11] perf script: Refactor branch flags for Arm SPE
Date: Fri, 14 Feb 2025 11:19:25 +0000
Message-Id: <20250214111936.15168-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031946_717579_B18FE960 
X-CRM114-Status: GOOD (  10.78  )
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

Changes from v1:
- For patch 05, changed to append the 'not_taken' bit in the branch_flags.
  This can avoid altering bit layout and cause breakage.
- Added Ian's review tags.


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


