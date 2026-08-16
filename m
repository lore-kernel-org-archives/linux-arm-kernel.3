Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED9C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XsGCXFozT69ITA4eF1crVo3PlInrHxlGF6a27uOAn/o=; b=IZVbsDjoUt5SU4NURn/zrDMYaD
	kt4FpRkMJYd4VfzAcApiwtnCWfeRhlQjRMVbek/JYWDEYk7/lib3EirPQl61BzwM9i5Wrc8bW2e+L
	QjZOk9t+BghLokz2epSjZ7v7ctze8MJc35Xd1a28kUUIQv4vcCOlCNddGjW9p8q3sILG+UW7zuV8S
	jGJkuZA8MvgXG4Y/J29y+mUm/15UqVG9+u8j2Uhx6VbhlZfp+9FVj/FD8h+gSEI2vDkO9zIvKOZOw
	67/g+AwuIzVxye26Evfpd9ph6U6ACHiZNHZB0G3Jk6V33kE6Ul2eOtJcvw12GZ0jrkGawDhOZcqTW
	leBXTjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbl4-00000004pNO-0pVW;
	Sun, 16 Aug 2026 14:22:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbl1-00000004pMd-2BY4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 14:22:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d01663d816so21870735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890158; x=1787494958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsGCXFozT69ITA4eF1crVo3PlInrHxlGF6a27uOAn/o=;
        b=KOZ6h018ZqmDbBYcNxxnx3Eh97z6N6o0DRWn8YJeXPet3QsePX96nnmDaT2KNF0+nW
         Ar/6bWZpO6jasCbj4SXToWLhJ6g0ebZgjorz2B4gEYRIuY+0cbO0bW17KG5b4WV7OqFw
         sTcZvY6d9I28GuoUpvYyuyZ/6DwriBySfS8HOJUlgv37lo7XJITNXo5uVQ6IwaEZEqCJ
         j8Iy7c3cWNrJGUkVbAE5CNhS6CDBwgm9PuQ4NjWdOTdSfku8zlPfN3tMgtiu0S00nMyP
         nE2t3D/DupbgqaXx0MHYtPMuHjkXsaVqgaSWe9cDKYHSCJBSlksp7nuIqg4bK7TJF2Tk
         0slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890158; x=1787494958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsGCXFozT69ITA4eF1crVo3PlInrHxlGF6a27uOAn/o=;
        b=Dr3LnI0G2Gn+5yUpGKYCw2UrPmWKOqEndIu597wgB7TA6oHQBFGGSbhFjKnKk7MGn3
         MfCSKA2fzIpZ+L1SBTlbtzHs6UuxccvxHwSXEfInQLWlHzXBZ3KNdTceUhAZeYQSXFWB
         WUhFxkESYWEUqkwXLnNHG1VwG6HJ/wnZFbOh8PYmhmc/UqFx9Fo6RlDI/MXcbZWIXf7Y
         8QHJ1vduY1dDHDyRJKJBb/9pZpYBPdRAvCvRjS8sZQTac8A9xYLXCjgAweGd77ixD/ZZ
         5nQz8hnNk9AXY+cUcJrBqmH1Bt81KAcj4e5KQUXVJoq3t+Jr1OF6cEpcbAgwgsBSKovy
         PBiA==
X-Forwarded-Encrypted: i=1; AHgh+RrsMie/GjL0kiB3yrXuop+yB0Dhz+g8CH3rgpCFEO57NCCEng/YoV6SlY9mPAl80XYHCLGrPVB/OKtzDpwL/1Dw@lists.infradead.org
X-Gm-Message-State: AOJu0YyzctU+yY+bBzTy/VOjqDDWFce2AFOCLteXXRpCX9lZKPVdPPRC
	mMLEuzuQ3b1eQo9CFCiuKr+uSI9+7I9P7yDKp7SR8J1aDuLPPTClSgOY
X-Gm-Gg: AR+sD10ftDI8FBtxN5WNG+tK5EhXkBOD5/yKE0YXveso9WEpVWNnqKS4y1mj8Tc7W7r
	H56boZe/v7jitrtm95gRbw/p3uzh0ylz/PX9s9h2Rg8uaPwdBCKdWX8gp1hVRxwo5RubATQ5QAm
	2xizUrDA7cOGi936o7sa1KTCilCETHhtuYRIweDe4gI7ySBRT8Epxpbu8Eo7Ge8GBWRvp68VKgi
	d7IxhMB1pE2MWTA214zBE2TamRc277q5eM6lNCF5Y9YSRCYugYqXOAim/cmfy/TLQl72PclLawe
	sLivlGKMeNssLClbFa9jtJhWe3nt7s2KtpGNZ3P0kbv/wqewjnATWoz/kYbOPeoL5izXgqo6gwy
	5yf7pJNeG9e5nPQiAsGYcMyDNi7AInHw39S4O8ky4FIr+GHeC25GiA6Uqe4tht07MoF79Ktwxz0
	mVDn5Fiv64b7u8QmEWIMwAHMsdVlCAiK1Quu9ZKoYc75Q4RjV7lBZgrLXbJxGYwUiQr5UA9rXp1
	44/Oo23brEEp1/WuJI=
X-Received: by 2002:a17:902:da82:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d3b0d5ed01mr190367395ad.13.1786890157697;
        Sun, 16 Aug 2026 07:22:37 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc8199sm26102365ad.74.2026.08.16.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:22:36 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: will@kernel.org,
	mark.rutland@arm.com,
	sj@kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	kunwu.chan@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [RFC PATCH 0/4] mm/damon/perf: add ARM SPE AUX backend
Date: Sun, 16 Aug 2026 22:22:17 +0800
Message-ID: <20260816142222.689624-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_072239_568699_F7570077 
X-CRM114-Status: GOOD (  17.28  )
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

From: Kunwu Chan <kunwu.chan@gmail.com>

This series adds an AUX trace-buffer backend to the DAMON perf
observability framework, enabling ARM SPE (Statistical Profiling
Extension) to deliver hardware-sampled access reports into DAMON's
existing SPSC report ring.

Patch 2 touches drivers/perf/arm_spe_pmu.c to expose the PMU matcher.
This change is tightly coupled with the DAMON AUX backend.  ARM SPE
PMU driver maintainers only need to review patch 2.

This series is based on the Ravi's hardware-sampled access reports 
branch [1], and depends on the perf AUX kernel-consumer RFC series [2].
The dependencies is not upstream yet, so this series remains RFC.

Why a dedicated AUX backend
---------------------------
ARM SPE and similar PMUs do not deliver samples through the standard
perf overflow callback.  Instead, they write trace data into an AUX
buffer managed by the perf core.  The AUX buffer is consumed from
process context (kdamond) rather than from NMI, so the existing
overflow-callback path in DAMON cannot be reused.

The backend model adds three operations to the damon_perf_event
lifecycle: init (allocate the AUX buffer), arm (position the consumer
cursor), and drain (parse the SPE packet stream and publish reports).
The backend is selected at event creation time by matching the PMU
object via its event_init callback.

What the series adds
--------------------
Patch 1 introduces the backend operations table, the backend state
fields in damon_perf_event, and the Kconfig options.  ARM SPE must be
built into the kernel; the KUnit test option is separate.

Patch 2 is the ARM SPE backend.  It owns a per-CPU AUX buffer,
decodes the SPE packet stream (the same encoding that perf's
userspace arm-spe-decoder handles), resolves sampled
CONTEXTIDR_EL1 values to tgids under RCU, and publishes synthesized
access reports.  The drain runs before the SPSC ring consumer on
each monitoring interval, and a final drain after event disable
ensures no records are lost.  The backend also modifies the ARM SPE
PMU driver to expose arm_spe_pmu_match() for PMU object matching.

Patch 3 adds byte-exact KUnit tests for the SPE record parser.  The
tests cover load and store records, timestamp terminators, multiple
records in one window, PAD and ALIGNMENT packets at both odd and
aligned positions, extended addresses, bad-packet resynchronization,
truncated records, and records without a virtual address.  A split-
record test verifies that a record spanning two AUX snapshots leaves
the tail unchanged until the terminating packet arrives.

Patch 4 adds a DAMON selftest for the AUX backend.  It checks the
backend integration, the required AUX-before-ring lifecycle ordering,
runs the parser KUnit suite through debugfs, and on an ARM SPE system
creates a live DAMON session with a controlled userspace target,
verifying positive end-to-end pipeline counters and final
enqueue/dequeue closure.

Testing
=======
Tested on Kunpeng 920 (256 CPUs, ARM SPE, kernel 7.1.0-rc5-mm-new-damon+):

  ARM SPE KUnit (spe_parse_one_record):
    16 passed, 0 failed, 0 skipped
    (store record, load record with timestamp, two records, pad-wrapped,
     alignment at odd/aligned positions, bad packet resync, record without
     address, events/source/counter, truncated record retained, truncated
     packet retained, extended address, invalid extended header, pad-only,
     empty window, split record across two snapshots)

  AUX selftest (damon_perf_aux_test.sh arm_spe_0):
    SUMMARY: 52 passed, 0 failed, 0 skipped (Overall PASS)
    callback=58318, valid=58318, enqueue=43390, dequeue=43390,
    match=34049, update=564
    final ring closure: enqueue=43390 dequeue=43390

Known limitations
=================
- AUX_BACKEND_MAX=4: the AUX backend registration table holds at most 4
  backend types.  This is a framework limit, not a per-PMU-instance cap.

- ARM SPE must be built into the kernel (ARM_SPE_PMU=y), not as a
  module, because the backend calls arm_spe_pmu_match() at initcall
  time.

- The AUX buffer is 2 pages (8 KiB).  The SPE hardware pauses when the
  non-overwrite ring is full; the drain frees space and re-enables
  the event.

- CONTEXTIDR_EL1 carries the sampled task's pid, resolved to tgid
  under RCU.  Records without a valid tgid are dropped.

- This series requires the perf AUX kernel API patches [2] to be applied
  first.  These patches are not yet upstream and must be reviewed by the
  perf subsystem maintainers.

References
==========
Link [1]: https://github.com/damonitor/linux.git
          branch: ravi_hw_sampled_access_reports_rfc_v1
          commit: fd968106e5bf

Link [2]: https://lore.kernel.org/all/20260814144927.489172-1-kunwu.chan@linux.dev/
          perf AUX kernel API PATCH Series:
          - perf/core: add AUX buffer ownership for kernel events
          - perf/core: add AUX ring accessors for kernel consumers
          - perf/core: add KUnit tests for AUX kernel-consumer API
          - selftests/perf_events: add userspace AUX regression test
          - selftests/perf_events: add AUX kernel API selftest script


Kunwu Chan (2):
  mm/damon/perf: introduce AUX backend interface and Kconfig
  mm/damon/perf: add AUX trace-buffer PMU backend for ARM SPE

Lian Wang (ProcessMission) (2):
  mm/damon/perf: add KUnit tests for the SPE record parser
  selftests/damon: add DAMON perf AUX backend test

 drivers/perf/arm_spe_pmu.c                    |   8 +
 include/linux/damon.h                         |   5 +
 include/linux/perf/arm_spe_pmu.h              |  11 +
 mm/damon/Kconfig                              |  28 +
 mm/damon/core.c                               |  22 +-
 mm/damon/ops-common.h                         |   6 +-
 mm/damon/perf/Makefile                        |   5 +
 mm/damon/perf/aux_backend.c                   | 121 +++++
 mm/damon/perf/aux_backend.h                   |  72 +++
 mm/damon/perf/spe_backend.c                   | 479 ++++++++++++++++++
 mm/damon/perf/spe_parser.h                    | 109 ++++
 mm/damon/perf/spe_parser_test.c               | 365 +++++++++++++
 mm/damon/vaddr.c                              |  68 ++-
 tools/testing/selftests/damon/Makefile        |   1 +
 .../selftests/damon/damon_perf_aux_test.sh    | 414 +++++++++++++++
 15 files changed, 1704 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/perf/arm_spe_pmu.h
 create mode 100644 mm/damon/perf/aux_backend.c
 create mode 100644 mm/damon/perf/aux_backend.h
 create mode 100644 mm/damon/perf/spe_backend.c
 create mode 100644 mm/damon/perf/spe_parser.h
 create mode 100644 mm/damon/perf/spe_parser_test.c
 create mode 100755 tools/testing/selftests/damon/damon_perf_aux_test.sh

-- 
2.43.0


