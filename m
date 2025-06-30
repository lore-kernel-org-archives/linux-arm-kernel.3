Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996E0C83035
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=03+W5bkRuY1HZB67u6xmCqh+/7HR/ytAxONNFxRhqGQ=; b=LdDXDSfzYNEoa2
	2iNA/8HrVfzQ1uZMoW5nF7/8PGtii6w8A2+iSJXk1B1GlXp9NZLcxKtGKJsAShGD46S1PRDXP0RH+
	F5z+PNkOlJBdM6tpJLZ91l9Cz7zCBgrYBf9EckzpgZe4LKRa2a2UmDQOjlQ2jZGP/rRVDwr0qWc/2
	hToR6RfP0R1f5UdZ3h2evL7Y96kGkL1TeXLQg0M9Ui8/EaKbDfwDXJEY66zxe9n+eA3cEFNG069Vm
	RnN0PYE7zl2bhsIEmoPmexsK5ajscSgVKYCqDdrBHtoMIQnGf8BrNrLZbYEQw/1ETNBded9sg22sn
	rkOcbS/6XLFpnigNPSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAK-00000002rFZ-3ukb;
	Mon, 30 Jun 2025 16:15:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGMa-00000002jxq-00nu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:24:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 500F21AC1;
	Mon, 30 Jun 2025 08:23:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF8F3F6A8;
	Mon, 30 Jun 2025 08:24:04 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/13] perf arm-spe: Support new events in FEAT_SPEv1p4
Date: Mon, 30 Jun 2025 16:23:32 +0100
Message-Id: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSrYmgC/5WNTQ7CIBgFr9KwFkP5a+PKexhDKP0qJFYItETT9
 O7SbnSpy3nJm1lQguggoVO1oAjZJecfBeihQsbqxw2w6wsjSqggsiZYx1GlACrNIfg4KeumUfk
 M0YLuVa5VmLu7M9hwTSVjreCMo2ILEQb33EuXa2Hr0uTjaw9nuq3/NzLFBDeE9px3RnaiPZfn0
 fgRbYVcf1vZ79a6WOWgwQxEt00jPtZ1Xd8wETlKMgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751297044; l=3121;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=t+AFp13ZhIpvuxI6JtbIFhv/8RoP5Sz8j+i+izr4ZOM=;
 b=eYdoWCvAY99iept/wHMoiWoKdd1KVEWvgXH2fRKQldqI81pk36PdINUQSc61IE9BcC7gd2ZPv
 Yu7fOO646TbDR2BUcvTMioj9rYgaUo8aeg6ZKiv0ihxAAbq/XAQpQeZ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082408_123823_5556608A 
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

The first patch modifies the Arm SPE driver to expose 'event_filter'
entry in SysFS caps folder. This allows users to discover the event
filter is supported by the hardware.

Patch 02 is a fixing for setting remote bit. Patch 03 is for fixing
memory level info for remote access.

Patch 04 is a refactoring for using full type for data_src.

Patch 05 refactors the code to avoid duplicate definitions of event
bits.

Patch 06 dumps new event bits in raw format via the 'perf script -D'
command.

Patches 07 to 12 enhance memory-level information based on the new
events introduced in FEAT_SPEv1p4.

Patch 13 changes the logic to parse events after data source analysis.
The event information complements the data source and provides a more
complete view. As a result, Arm SPE can now support both HITM and peer
modes (See the "--display" options in perf c2c).

This series has been tested on FVP RevC platform.

Note: for a local HITM event, the emulation does not provide any info
for LLC. However, the perf c2c tool relies on LLC + HITM for accounting
local HITM. I to manually set the LLC HIT flag to verify the
"perf c2c -d tot" command.

---
Changes in v2:
- Dropped the kernel change for caching "pmsevfr_res0" (James)
- Renamed the "events" entry to "event_filter" (James)
- Added a new refactoring patch 04 (James)
- Updated memory level info for remote access (James)
- Link to v1: https://lore.kernel.org/r/20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com

---
James Clark (1):
      perf arm_spe: Use full type for data_src

Leo Yan (12):
      drivers/perf: arm_spe: Expose event filter
      perf arm_spe: Correct setting remote access
      perf arm_spe: Correct memory level for remote access
      perf arm_spe: Directly propagate raw event
      perf arm_spe: Decode event types for new features
      perf arm_spe: Add "event_filter" entry in meta data
      perf arm_spe: Refine memory level filling
      perf arm_spe: Separate setting of memory levels for loads and stores
      perf arm_spe: Fill memory levels for FEAT_SPEv1p4
      perf arm_spe: Refactor arm_spe__get_metadata_by_cpu()
      perf arm_spe: Set HITM flag
      perf arm_spe: Allow parsing both data source and events

 drivers/perf/arm_spe_pmu.c                         |  36 ++--
 tools/perf/arch/arm64/util/arm-spe.c               |   5 +
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  |  37 +---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  |  33 ++--
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 ++
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   7 +
 tools/perf/util/arm-spe.c                          | 206 ++++++++++++++++-----
 tools/perf/util/arm-spe.h                          |   2 +
 8 files changed, 222 insertions(+), 118 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250610-arm_spe_support_hitm_overhead_v1_public-c4a263385434

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


