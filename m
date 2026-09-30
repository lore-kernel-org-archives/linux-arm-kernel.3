Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3105ACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 23:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7RPhUjiycEcHQnbbkoTY2T62c754OsKYicvw3KrO6DM=; b=c07hcF9lLQISmL/txy4gjDhTOd
	MjdfWM0Nsh+IUvpQSouyMwjw53gYPdvpx/FdI7+ilEfAgPfTjUdOxeDgmQ7+z54uHHgOBDmZMi1jb
	hz4prZ2ecjGuOFd1wQ2OcXcB8SG6l0ALK95UJGuaSFcCpCZdi4QzIRQ99X6oko900xETLpl88S3di
	tEe6Kb9UAwEvhFhWrPb8ycTyKL1H4tYsw4KV8THrMDSNwtvZ67xkYYaI4aspkU9ll+5B86xaz6ZJT
	wudymHC7OnwX3h2m0nT/IryYgm9MrIq18x772bVmzAC9pQuOks1cHhuJ+gkvR5VbHdx93BqEVnQ9b
	jb/uOQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3Sq-00000007Qxb-16Zf;
	Wed, 30 Sep 2026 23:11:52 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3Sm-00000007QxD-3kRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 23:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790809908; x=1822345908;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7RPhUjiycEcHQnbbkoTY2T62c754OsKYicvw3KrO6DM=;
  b=cvztA2/PWYhZsNGHQ6Nm9pXx3BoeVUo7g124Tq/n55VircmPy+TkVOiC
   X4jLR9n3VDn9lTz3BUifdvHPN9XiK+AnViuP4wL2I3tWlvKQ9KrRozbwc
   zgs3F+WViXkFCwNF9leR0Ad76t8Q0i6qiq6sUpYrgYLRrfbGKWLo2LM/W
   mw+tmMuW2oXmRG1ey4aw8ltoBbt2TENk8Y/O2HTE1SXoMw4NlSxHZggjG
   wB5bSrJkXwxW9fZhPFwAOihJcQoZjo6epAweGrr0qP8WGREeClxt9Dvc1
   LeMe0tH5WVRjS84jlFLce5n/yPP8nP3NQcRRtrSnC9owm9rmzxBK/Zvdr
   A==;
X-CSE-ConnectionGUID: COp1LAQJQkC/DYmRJ9GWiA==
X-CSE-MsgGUID: UxrbsUqaRLC+VxuZPSvsvg==
X-IronPort-AV: E=Sophos;i="6.27,133,1787011200"; 
   d="scan'208";a="29591602"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:11:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:10101]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.208:2525] with esmtp (Farcaster)
 id 2eeecea5-4b05-481e-bc0f-993f8015a844; Wed, 30 Sep 2026 23:11:45 +0000 (UTC)
X-Farcaster-Flow-ID: 2eeecea5-4b05-481e-bc0f-993f8015a844
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:45 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.10) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:43 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <robin.murphy@arm.com>, <mark.rutland@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<harisokn@amazon.com>
Subject: [PATCH v2 0/2] perf/arm-cmn: Allow userspace to select the PMU's CPU
Date: Wed, 30 Sep 2026 18:11:25 -0500
Message-ID: <20260930231127.3094040-1-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.10]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161149_003218_759F6F51 
X-CRM114-Status: GOOD (  12.48  )
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

arm_cmn_probe() picks the CPU that owns the PMU and nothing but the CPU
hotplug callbacks ever revisits it, so in practice all of the PMU's
recurring work stays on the first CPU local to the interconnect's NUMA
node. Patch 2 makes the existing 'cpumask' attribute writable so it can
be moved, which helps on systems that confine background kernel work to
a chosen set of housekeeping CPUs.

I made the existing 'cpumask' attribute writable rather than
adding a new one. Every other implementation of that file is read-only,
so I am happy to switch to a separate attribute if you would prefer to
keep 'cpumask' uniformly read-only across PMUs.

Patch 1 is new in v2. Robin pointed out that perf_event_open() can latch
cmn->cpu and then install the event after a migration has already moved
the PMU, leaving it on a CPU which no longer owns the PMU's shared state.
The window already exists via arm_cmn_pmu_online_cpu(), so patch 1 stands
on its own; a writable cpumask just makes it reachable on demand.

Changes since v1:
 - Added patch 1 to close the perf_event_open() race.
 - No change to patch 2 (the v1 patch) other than being rebased.

v1: https://lore.kernel.org/linux-arm-kernel/20260929223244.2411400-1-harisokn@amazon.com/

Tested on two platforms with CONFIG_PROVE_LOCKING=y:

  AWS m9g.metal-48xl CMN S3,  one mesh,   192 CPUs
  AWS m8g.metal-48xl CMN-700, two meshes, 192 CPUs

  - Multiplexing occurs on the configured CPU.
  - Offlining the owning CPU migrates the PMU and updates the attribute.
  - Writes racing CPU offline/online produced no lockdep reports.
  - Hammer perf_event_open() while flipping the cpumask between two CPUs.

Haris Okanovic (2):
  perf/arm-cmn: Don't schedule events on a CPU which no longer owns the
    PMU
  perf/arm-cmn: Allow userspace to select the PMU's CPU

 Documentation/admin-guide/perf/arm-cmn.rst | 18 ++++++++
 drivers/perf/arm-cmn.c                     | 49 ++++++++++++++++++++--
 2 files changed, 63 insertions(+), 4 deletions(-)

-- 
Haris Okanovic
AWS Graviton


