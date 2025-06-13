Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D2C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cpq4jyvcxAWR6CISrugBCEzMTNh/5zrqihpiJffvPRA=; b=XD5KYlOOMY5/Mg
	IMKYtW7Y+PyvziD6uwHdctqohzrabVUPeRHTYq6XMT+8fwDT0jMyhx/D1/1deTEswfz477XsEYXGd
	HilZQuuOa02Lw2XmHmmmlu5N7rm7tHAqBYfcEYG0N4+zI6Zk12Nwdf2n0BaNLibEBRzWqMGWKUemW
	GfIvtxfMPUHmCia93pV/3p5adoD2etB/bVnKU5moRlSLBgYlacD0muDJHWagPEBwHxBdn2jY8orh3
	ojOwpF8jtwzzdhm6ZHT8IJcOc1okf7Yk1iDgWsMYDNL09DpWqTXCJ8q9hsQ6+2iBl8i3WGR2gIXM0
	4Sn0Apq9CczGnphbNNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xF-0000000HFg7-3Ir4;
	Fri, 13 Jun 2025 18:16:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6jS-0000000Gy0s-3OlC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:54:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EEA51C0A;
	Fri, 13 Jun 2025 08:53:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE0D03F59E;
	Fri, 13 Jun 2025 08:54:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 00/12] perf arm-spe: Support new events in FEAT_SPEv1p4
Date: Fri, 13 Jun 2025 16:53:33 +0100
Message-Id: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1JTGgC/5WNQQ6DIBBFr2JYlwYRremq92gMQZyWSaqQQUkbw
 91LvUGX7yf/vZ1FIITIrtXOCBJG9EuB+lQx68zyBI5TYSaFbEVXC25o1jGAjlsInlbtcJ21T0A
 OzKRTrcM2vtByq4zsmqZvVaNYsQWCB76P0n0o7DCunj5HOMnf+n8jSS74RchJqdF2Y9vfyvNs/
 cyGnPMXAi0y/twAAAA=
X-Change-ID: 20250610-arm_spe_support_hitm_overhead_v1_public-c4a263385434
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749830053; l=2636;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=x/vuRwsI7claaPV1ru+xRI5aJd1BjECDtBhmWCSDVT8=;
 b=027hfQMenkWH7wwgD3IgFe2qvyhqJhby52SkoLvr/t4WOS62ugNzWHL118/GMSHnsXBgFpaAr
 ErOXDob/AfmAc7kox4B7LjhkCmMKqFZaFBvEayBDZVVSLiyaq0BNDE/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085418_938802_F45BDFCD 
X-CRM114-Status: GOOD (  13.53  )
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

The first two patches modify the Arm SPE driver to expose 'events' entry
in SysFS caps folder. This allows users to discover which events are
supported by the hardware.

Starting from patch 03, changes are made to the perf tool:

Patch 03 is a fixing for setting remote bit.

Patch 04 refactors the code to avoid duplicate definitions of event
bits.

Patch 05 dumps new event bits in raw format via the 'perf script -D'
command.

Patches 06 to 11 enhance memory-level information based on the new
events introduced in FEAT_SPEv1p4.

Patch 12 changes the logic to parse events after data source analysis.
The event information complements the data source and provides a more
complete view. As a result, Arm SPE can now support both HITM and peer
modes (See the "--display" options in perf c2c).

This series has been tested on FVP RevC platform.

Note: for a local HITM event, the emulation does not provide any info
for LLC. However, the perf c2c tool relies on LLC + HITM for accounting
local HITM. I to manually set the LLC HIT flag to verify the
"perf c2c -d tot" command.

---
Leo Yan (12):
      drivers/perf: arm_spe: Store event reserved bits in driver data
      drivers/perf: arm_spe: Expose events capability
      perf arm_spe: Correct setting remote access
      perf arm_spe: Directly propagate raw event
      perf arm_spe: Decode event types for new features
      perf arm_spe: Add "events" entry in meta data
      perf arm_spe: Refine memory level filling
      perf arm_spe: Separate setting of memory levels for loads and stores
      perf arm_spe: Fill memory levels for FEAT_SPEv1p4
      perf arm_spe: Refactor arm_spe__get_metadata_by_cpu()
      perf arm_spe: Set HITM flag
      perf arm_spe: Allow parsing both data source and events

 drivers/perf/arm_spe_pmu.c                         |  15 +-
 tools/perf/arch/arm64/util/arm-spe.c               |   5 +
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  |  37 +----
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  |  33 ++--
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 ++
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   7 +
 tools/perf/util/arm-spe.c                          | 173 ++++++++++++++++-----
 tools/perf/util/arm-spe.h                          |   2 +
 8 files changed, 194 insertions(+), 92 deletions(-)
---
base-commit: 27605c8c0f69e319df156b471974e4e223035378
change-id: 20250610-arm_spe_support_hitm_overhead_v1_public-c4a263385434

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


