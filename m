Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A97CDC167
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=seiK8+fs0ZCTpnWXJdNXxocWHPB+XNnoDLIxsmwwMmo=; b=arxbK8vzozIBcL
	H7CbTHOEkRdJ8avXnkzz6mb9xipqFYilNSPnp+Hac3y/Hi3N5WYBVITFqkjFq/QOMyj7TiC927p7M
	8w/hJaqySyI2XETj1J2026IS0Cqam1Kvj2hctyqNs6XwiwBHJ+HHre/jWaBSmhnOm7joHE+6aO41b
	cOFte8aOuM3Nl1+EsoTwJ9SbguL6bRz67cETikuj14uGhEB1Ehw9i+NJRdC2AQQoXfvj69KNJf4iC
	dtpZFx1Q9ehLTtE0IEXiZ5dDeWHt/frZViXNPlHYkQEqLvCPh1doEgTQHhYjkG4ZK0oujBiAGxRzg
	a/9Wk3vo+gjwha1eBsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gf-0000000CvnV-0r4R;
	Tue, 06 Jan 2026 11:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gc-0000000Cvmb-10JN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA56497;
	Tue,  6 Jan 2026 03:57:09 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957F33F5A1;
	Tue,  6 Jan 2026 03:57:14 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 0/8] perf arm_spe: Extend operations
Date: Tue, 06 Jan 2026 11:56:45 +0000
Message-Id: <20260106-perf_support_arm_spev1-3-v4-0-bb2d143b3860@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH34XGkC/4XOwW7DIAwG4FepOI8JGxJgp73HNEUJmJVDGwRdt
 KnKu89ppVY7rLsg/Vj/Z59Fo5qpiZfdWVRacsvzkYN52omwH48fJHPkLFBhpxwqWaimoX2WMtf
 TMNbD0AotILWcekqxT8HaCQXXS6WUvy702zvnfW6nuX5fNi2w/V5Rr9zfKD9K2ghpNMYDYHzl6
 XOYD9uGax39P3WATk06OO06e6tvFy14uwIU2AcMMoPRABlreoLpN6PvDJ/4gNHMUK+Dd+iTj/7
 OrOv6A4O9d/GLAQAA
X-Change-ID: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767700634; l=2305;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=unpUmPsbVAfanae3vr0BHr49OvQu961hhpbtWX7uHo8=;
 b=gb6BTTD8pfdDx+a3M1Ccdd4U8S69lekuJdESkBK6thzPsJMKLYY9HvO231FNX4hc0oq3/sNmf
 R9fC3LbKPZsDY9bIqx25BC+dBDjI9w22ZEc5Bjpqdw83FIDuPl+fNfz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035718_404345_F5C6D98E 
X-CRM114-Status: UNSURE (   9.11  )
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

This series sets the operation info into sample's data source and
SIMD flag, and updated the document.

No changes compared to the previous version; this version is only rebased
onto the latest perf-tools-next branch.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v4:
- Rebased on the latest perf-tools-next branch.
- Link to v3: https://lore.kernel.org/r/20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com

Changes in v3:
- Rebased on the latest perf-tools-next branch.
- Link to v2: https://lore.kernel.org/r/20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com

Changes in v2:
- Refined to use enums for 2nd operation types. (James)
- Avoided adjustment bit positions for operations. (James)
- Used enum for extended operation type in uapi header and defined
  individual bit field for operation details in uaip header. (James)
- Refined SIMD flag definitions. (James)
- Extracted a separate commit for updating tool's header. (James/Arnaldo)
- Minor improvement for printing memory events.
- Rebased on the latest perf-tools-next branch.
- Link to v1: https://lore.kernel.org/r/20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com

---
Leo Yan (8):
      perf/uapi: Extend data source fields
      tools/include: Sync uapi/linux/perf.h with the kernel sources
      perf mem: Print extended fields
      perf arm_spe: Set extended fields in data source
      perf sort: Support sort ASE and SME
      perf sort: Sort disabled and full predicated flags
      perf report: Update document for SIMD flags
      perf arm_spe: Improve SIMD flags setting

 include/uapi/linux/perf_event.h          | 32 +++++++++++++++-
 tools/include/uapi/linux/perf_event.h    | 32 +++++++++++++++-
 tools/perf/Documentation/perf-report.txt |  5 ++-
 tools/perf/util/arm-spe.c                | 56 ++++++++++++++++++++++++---
 tools/perf/util/mem-events.c             | 66 +++++++++++++++++++++++++++++---
 tools/perf/util/sample.h                 | 21 +++++++---
 tools/perf/util/sort.c                   | 21 +++++++---
 7 files changed, 205 insertions(+), 28 deletions(-)
---
base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


