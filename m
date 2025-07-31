Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F46C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ls3a9E1QyuA8vD57oRcUOGH4ZeEiNo44MD56HhBoFk=; b=LnCyHPOKNwgoxd
	9/igeJSR3Bwu4ONudqPDas3lTrRwooZexSX7rUQfvcBnF+LFbiBeTfNSdTDjYHnkh21EslMQk+uRQ
	snNLb+QPlzUn48bY9N4NHDlQtX3GIry0iwvwe/RYACJrvOUe025y/V4Y9dWerO+R6oOuglGyryydP
	Ey5L+i6In8+kCw+B1c3F/UgRqwQJ0CVX71HHLa2xi6BuOdg6FZXjOSRgiqbPQjIEhMnAtE5B322gk
	wReVl7VqRzHnBW3Tk3l+B62bD748QcY1MUgRglmyMA2nn9jqj1op6QW2sWAYcJypgD4iQ31vhkCbM
	i0H63p23vm/29b8706GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTLw-00000003hGm-05iD;
	Thu, 31 Jul 2025 13:29:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTJJ-00000003gmI-1jAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:27:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFD51D13;
	Thu, 31 Jul 2025 06:26:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9590E3F66E;
	Thu, 31 Jul 2025 06:27:02 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/15] perf arm-spe: Support new events in FEAT_SPEv1p4
Date: Thu, 31 Jul 2025 14:25:35 +0100
Message-Id: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9ui2gC/5XQQW7DIBAF0KtErEsFDLZpVr1HFSHA4xqpDggcl
 Cjy3YtTqUl2zvKPNO+P5koyJo+Z7HdXkrD47MOxBvm2I240x2+kvq+ZCCYa1nJGTZp0jqjzKca
 QZj36edKhYBrR9LpwHU/2xzvqpBEtgGokSFK1mHDw51vT16Hm0ec5pMutuIh1+npHEZTRjoleS
 uta26jPuvnuwrQW/mnwoiaQm8FY4GA//rX13sIfb4TtKq9qOxh0AzOq65pnFe5qx7rtKlQVAI0
 SvQGh2LMqH1Tg21VZVackSsaq6e7/PCzL8gvahYbmLAIAAA==
X-Change-ID: 20250610-arm_spe_support_hitm_overhead_v1_public-c4a263385434
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753968422; l=3708;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=MGXl2cnLbu4zu2dy1/bFgNlB0vBOPNcA8WyrHKceQEM=;
 b=+JYI9uWYTJO9WrwmWrsWwJfv4HEfGmxWG1DWAYwnqNQQ3JSY9M+a54sa1lOH4kCwX3BWddZY6
 PaRS+fK5vllBLikshvdbJjiFGmA3+OGROoQr+FMFs0HyixMzpc27qqy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062705_551049_882CEA7B 
X-CRM114-Status: GOOD (  14.00  )
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

This series adds support for new event types introduced in Arm SPE v1.4.

The first two patches modify the SPE driver to expose 'event_filter'
entry in SysFS caps folder. These patches are part of James' series
"[PATCH v5 00/12] perf: arm_spe: Armv8.8 SPE features" [1]. In case this
series will be merged independently of James' series, these patches have
have been included here.

Patches 03 ~ 15 are support new events in Perf tool:

  * Patches 03 ~ 04: Fix for remote access.
  * Patches 05 ~ 06: Refactor for data source and event bits.
  * Patch 07       : Dump new event bits.
  * Patches 08 ~ 14: Enhance memory-level info for the new events.
  * Patch 15       : Combine analysis of data source and events.
		     As a result, Arm SPE can support both HITM and peer
		     modes (See the "--display" options in perf c2c).

This series has been tested on FVP RevC platform.

Note: for a local HITM event, the emulation does not provide any info
for LLC. However, the perf c2c tool relies on LLC + HITM for accounting
local HITM. I manually set the LLC HIT flag to verify the
"perf c2c -d tot" command.

[1] https://lore.kernel.org/linux-arm-kernel/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org/

---
Changes in v4:
- Refactor exposing event filter in SPE driver (Will).
- Rebased on latest perf-tools-next branch.
- Link to v3: https://lore.kernel.org/r/20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com

Changes in v3:
- Retrieve CPU number from PMU type (Ian).
- Link to v2: https://lore.kernel.org/r/20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com

Changes in v2:
- Dropped the kernel change for caching "pmsevfr_res0" (James)
- Renamed the "events" entry to "event_filter" (James)
- Added a new refactoring patch 04 (James)
- Updated memory level info for remote access (James)
- Link to v1: https://lore.kernel.org/r/20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com

---
James Clark (2):
      perf: arm_spe: Support FEAT_SPEv1p4 filters
      perf arm_spe: Use full type for data_src

Leo Yan (13):
      perf: arm_spe: Expose event filter
      perf arm_spe: Correct setting remote access
      perf arm_spe: Correct memory level for remote access
      perf arm_spe: Directly propagate raw event
      perf arm_spe: Decode event types for new features
      perf arm_spe: Add "event_filter" entry in meta data
      perf arm_spe: Refine memory level filling
      perf arm_spe: Separate setting of memory levels for loads and stores
      perf arm_spe: Fill memory levels for FEAT_SPEv1p4
      perf arm_spe: Improve CPU number retrieving in per-thread mode
      perf arm_spe: Refactor arm_spe__get_metadata_by_cpu()
      perf arm_spe: Set HITM flag
      perf arm_spe: Allow parsing both data source and events

 arch/arm64/include/asm/sysreg.h                    |   9 -
 drivers/perf/arm_spe_pmu.c                         |  45 +++--
 tools/perf/arch/arm64/util/arm-spe.c               |   5 +
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  |  37 +---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  |  33 ++--
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 ++
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   7 +
 tools/perf/util/arm-spe.c                          | 220 ++++++++++++++++-----
 tools/perf/util/arm-spe.h                          |   2 +
 9 files changed, 241 insertions(+), 131 deletions(-)
---
base-commit: e0c9c1e67156b257e9f1e97e4e372961e4e03fcf
change-id: 20250610-arm_spe_support_hitm_overhead_v1_public-c4a263385434

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


