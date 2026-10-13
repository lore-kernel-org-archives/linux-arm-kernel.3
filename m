Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3827CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ExDc15Ef98vtkv2halza2GLOY92o7Aeod/xe2/R8Z/4=; b=FaWqiZegxoAUOotydWHrjVy7X2
	RZsOEFXQK8mXZCdPSn5Uspcrgq87SgPNcjVfD9I+3+OSz9GKMufxm/pcv/PZc71Xs56ei6VkSUGnc
	XnUyCLLkrSfkYczBIAs+Ihzr0NKaLt61tUF9TFnMMaKf2E0+fdazE/dTSgoLha2qUhYY3t2vm/t75
	butkFP46mxfYiEZOnbaLNAkKDWIQQER2XHNfO3FDm1eglQqLLdFlfvfBK3HbTEMjI7CZNNOXm1DeK
	+JtDgCSME4rTWxN1G9bmzTY04VcYgS02q28XCWcE3YOx7fAvswTuQjAgH074zt/hrYf3swU5rooWM
	xU/fCq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhfo-0000000DsE6-0Hpt;
	Tue, 13 Oct 2026 18:56:28 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhfl-0000000DsDL-3NP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791917785; x=1823453785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ExDc15Ef98vtkv2halza2GLOY92o7Aeod/xe2/R8Z/4=;
  b=Y8rsvtJAYR1DipECtiJhtc8aAxkOJ/9z3ZJv+lDraPs4Uc1RpbqBCI6R
   PWHrD54gMmI4KhtNMsk1pnt4eyBI4wTWiOrWi4H5BiubmIp2Pt3EsYj2N
   LJuPFW9iXlt6FbhcoTWHQzS5tp2W2AwUaCW3aZcH5eUPV82G84uUyDQMb
   mCA9+Wq+RY9PWYcMOTVteCo7YIg/NDLa2CPH0yS7+SHOrYo5k6f6abYYC
   HMcvpdih5pjiw5ato72ZRVs9dCBIbeIrVtOHinV3cEiSM4o5R6wqEeope
   vOxjUYW1fPQ3+cajpC6cYy1Hcn3XXo83jDlhX+KjcWlUUm/WkGTzGk5ws
   w==;
X-CSE-ConnectionGUID: oWznY2ffSqarfFIC8BEq2w==
X-CSE-MsgGUID: VXbXS8RXQHO3aQJZ0MCX2A==
X-IronPort-AV: E=Sophos;i="6.27,156,1787011200"; 
   d="scan'208";a="31152671"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:56:20 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8919]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.175:2525] with esmtp (Farcaster)
 id f1b4118a-6202-4225-89df-e251ce4331da; Tue, 13 Oct 2026 18:56:20 +0000 (UTC)
X-Farcaster-Flow-ID: f1b4118a-6202-4225-89df-e251ce4331da
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 13 Oct 2026 18:56:20 +0000
Received: from u34cccd802f2d52.amazon.com (10.187.170.30) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 13 Oct 2026 18:56:19 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <harisokn@amazon.com>
Subject: [PATCH 0/4] perf: Manage single-CPU PMU affinity in perf core
Date: Tue, 13 Oct 2026 13:55:59 -0500
Message-ID: <20261013185603.1347265-1-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.170.30]
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_115625_913623_544195B7 
X-CRM114-Status: GOOD (  16.06  )
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

About 25 PMU drivers, nearly all under drivers/perf, drive their PMU from
a single CPU, and each implements the same logic independently: pick a CPU
at probe with cpumask_local_spread(), cpumask_any(), cpumask_any_and() or
similar, register a CPUHP state to handle hotplug migration, bind every
event to that CPU in event_init(), and publish it via a 'cpumask'
attribute.

Besides the duplicated code, that has two costs. On systems with many
PMUs, the arbitrary choice tends to land all of them on the same CPU,
concentrating overhead there. The chosen CPU also cannot be changed
afterwards, except via hotplug, which is awkward on systems that confine
background kernel work to housekeeping CPUs or otherwise isolate PMUs
from latency sensitive work.

These patches move the choice into perf core as a new "device" pmu::scope.
A driver describes which CPUs are eligible with an optional
filter_allowed_cpus() callback; core intersects that with the online CPUs,
picks one with cpumask_any_distribute() so instances spread out, migrates
events on hotplug, and reports the result through an optional migrate_cpu()
so the driver can follow with interrupt affinity.

'cpumask' is made writable for device scope, so users can also choose the
owning CPU deliberately, e.g. to move a PMU onto a housekeeping CPU. The
attribute is read-only or absent in other scopes. Reusing it was the
minimal change, and I'm happy to add a separate attribute instead if you
would rather 'cpumask' stayed read-only everywhere.

Only arm-cmn is converted in this series, as an example and because it is
what I can test today. I have prototype conversions for the other 24
drivers locally and will post them if the core approach looks right, but I
have no access to most of that hardware and will need help testing.

The series also carries two synchronization changes for events left behind
by migration: the __perf_pmu_remove() fix in patch 1 and the sequence
counter mechanism in patch 2. Neither problem is new. Under hotplug,
leftover events are torn down with the dying CPU, which limits the damage.
Migrating between two online CPUs leaves nothing to clean them up, so they
matter more once users can request migration. I'm open to suggestions on
different or better ways to close these races.

Tested arm-cmn on two platforms with CONFIG_PROVE_LOCKING=y:

  AWS m9g.metal-48xl CMN S3,  one mesh,   192 CPUs
  AWS m8g.metal-48xl CMN-700, two meshes, 192 CPUs

  - Events multiplex on the configured CPU, and the two meshes are placed
    on distinct CPUs at registration.
  - Offlining the owning CPU migrates every open event and updates the
    attribute; nothing is left behind on the dying CPU.
  - Writing 'cpumask' migrates open events, and offlining the vacated CPU
    afterwards strands nothing. Bad input is rejected with EINVAL, ERANGE
    or ENODEV without moving the PMU.
  - Hammering perf_event_open() from 64 threads while flipping 'cpumask'
    between two CPUs does not strand events.
  - No lockdep reports on either platform.

This supersedes the arm-cmn-only approach, following Robin Murphy's
suggestion that CPU affinity be generalized into perf core:

  https://lore.kernel.org/linux-arm-kernel/2d70be7b-12c0-46e0-b308-744a3159388a@arm.com/

Haris Okanovic (4):
  perf/core: Fix perf_pmu_migrate_context() leaving events behind
  perf/core: Add PERF_PMU_SCOPE_DEVICE
  perf/core: Allow userspace to select a device PMU's CPU
  perf/arm-cmn: Convert to PERF_PMU_SCOPE_DEVICE

 drivers/perf/arm-cmn.c     | 104 ++++------------
 include/linux/perf_event.h |  26 ++++
 kernel/events/core.c       | 247 +++++++++++++++++++++++++++++++++----
 3 files changed, 274 insertions(+), 103 deletions(-)

-- 
Haris Okanovic
AWS Graviton


