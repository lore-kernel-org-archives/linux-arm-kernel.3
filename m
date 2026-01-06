Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF8DCDC176
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v05yKJQtSMs58Qb4kTmsKKZ6Kw8j5NlK40b1aTLKc+8=; b=Of4RSTo89V6mO5
	g6T83U+OW3OcVLuH3MTCl1MM8TWo2XMMCevMqKjFFFEDPFnDdpGVsBOqvruiyICk1TyGL3eVMFydS
	Lu99iKDdXhXdShdkGNsn9i1sVsxmXwpA/P4SjGB2YDwH7WBhoju3cYNCX7eLDXBl6uYtgrA3QhvGC
	PNg/pJyjnKw/mSIrkaj+GT35RD8s7AnRYneSuh/67XzeGUs8tfJp7QRo1ArYAl+xwaY+NQfBACzn5
	RR9wxH4MaLKX31KyRWOMBw6YcNdVzwyJF0MmCY9tXsqe2eZ0ZBWY2RjOn0/f3YIpKoYpz7eu6O1ju
	Ak/48EEo68v53G2CFiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5rC-0000000Cx7t-2uqH;
	Tue, 06 Jan 2026 12:08:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5rA-0000000Cx7Q-1sg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:08:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19BC4497;
	Tue,  6 Jan 2026 04:08:04 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B093F5A1;
	Tue,  6 Jan 2026 04:08:08 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH RESEND v4 0/8] perf arm_spe: Extend operations
Date: Tue, 06 Jan 2026 12:07:50 +0000
Message-Id: <20260106-perf_support_arm_spev1-3-v4-0-b887bb999f6e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABb7XGkC/4XOPU/DMBAG4L9SeSbId3b8wcRAV4YyIhTF8bn10
 Cay2whU5b/jBtGqA2GxdD69z71nlilFyuxpdWaJxphjfyiDfFixbtcetlRFX2aGHGtukFcDpdD
 k0zD06di0ad/kgUaoROUUBa9Cp7VDVuJDohA/Z/qdbdZv69cX9lH+dzEf+/Q1Xxxh3s645eZvv
 Dy80h5CK6UFQP9cto9dv79c+omj/ScOUHMnOiNMra/xS6MRry2Ag15gsDDoJZDUUhG4e0bcmFJ
 xgRGFISU6a9AG6+09I38ZxYGrBUYWxjn0IIUTRvEbM03TN+gMwHvaAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767701288; l=2519;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mbAdR0C9J/IerSiXzkSVdYRxp0+AnNR/yDsPxR5pTdI=;
 b=/mrgpUgbJPsrV8VNbqs+FZeyynJb4/99wdMj9qi8+nGSky1W9bxS5zaW3bqxbpWQDI7ya7oNg
 +tDXy2gyDrqBh3NXLCnAxoLtl8lp3Z8eQAWkk44sTYq+b94r9KoBNES
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_040812_732549_4EDAB10B 
X-CRM114-Status: UNSURE (   9.28  )
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
Changes in v4 (resend):
- Updated for Ian and James' review tags.
- Link to v4: https://lore.kernel.org/r/20260106-perf_support_arm_spev1-3-v4-0-bb2d143b3860@arm.com

Changes in v4:
- Updated for Ian and James' review tags.
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


