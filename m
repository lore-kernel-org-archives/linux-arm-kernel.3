Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3F6CD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6OTQoQ6s3xBS0h2XlbHDElXJmcPU875VrDVtO2VZrAI=; b=v4ujq1Z4xV74uz
	jkTvb+igs9gwG/PXgiJhyCUufMSoI2RG6OR1xXQJ/hO+WaAuOGVFjZ8H/3zQoRuC77OBpLj0Y0XzC
	a7jtn0yZ2SU3yZjngx1r3+JmNK0QPFdFimBJxC7Bi/0nrwPOWUU+GFFAXLvaUwNXuOEbD/euHrlbm
	zlXeJEFt7fJRVDb6dU0OXpx+0kIs1cM9Apwkqn2eNlAPK8xXq/TSJoDjQatHL4Kd22jSx9Wja1HdB
	pFN0vqo1HbYis0mlwgTOoj5vqKpDAkjrOJ7BYcV7p7+qoF6X8C/Z3RzqnLn0jcpS/zHSenidFyWBz
	Q9jC9cHrhmE3Lcm9qBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWc-00000009JRh-0xZP;
	Wed, 12 Nov 2025 18:24:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWZ-00000009JQf-25MQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:24:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8060F1515;
	Wed, 12 Nov 2025 10:24:45 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BE273F63F;
	Wed, 12 Nov 2025 10:24:51 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 00/25] perf arm_spe: Extend operations
Date: Wed, 12 Nov 2025 18:24:26 +0000
Message-Id: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrQFGkC/4WOQQ6CMBBFr2K6tqYzFAquvIcxBOhUukCaFomGc
 HcLJLpSN5P8mbw3f2KBvKXAjruJeRptsP0thmS/Y01b3a7ErY6ZocBU5Ci4I2/KcHeu90NZ+a4
 MjkbgCa8zMjozjVI1sog7T8Y+VvX5EnNrw9D75/pphGW7SQuRf5fGIbjSYCopCwDUp3g9NH23f
 NhwLP7gAKmokyZP8lS98aXRiO8WIED90GDUoJZAUsmMoP5o5nl+AfhPUwlEAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971890; l=4088;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uK3OTAm25/Es3W4+oaneRzHWBZP3PdoEBFUSAKd0eE4=;
 b=y2ixQtt0MQOdT7sIMM7VD4HKk6uGxtr4Xzs+6r6u722/njjPnwDnXZ3BQuzgL1esC62nECuko
 Jkh4PpJUBetCajuX3Ig39n4jo8cX3egV7yiPFWcmFdffU5K/pIn9CyD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102455_619965_3FCF839E 
X-CRM114-Status: GOOD (  10.41  )
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

This series enhances tooling to support new operations:

  - Support for MTE tag since Arm SPE v1.3;
  - Support for Advanced SIMD extension and SVE operations;
  - Support memcpy, memset and GCS operations;
  - Support extended operations for atomic, Acquire/Release and
    Exclusive instructions.
  - Enhance the data source for associated info, like floating-point,
    conditional, data processing, etc.

This series is divided into three parts:

  Patches 01 ~ 06: Support raw dump for new operations;
  Patches 07 ~ 17: Export the operation info into records, so that the
                   information can be later consumed by samples.
  Patches 18 ~ 25: Set the operation info into sample's data source and
                   SIMD flag, and updated the document.

This patch series is tested on FVP for native parsing and x86_64 for
cross parsing.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
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
Leo Yan (25):
      perf arm_spe: Fix memset subclass in operation
      perf arm_spe: Unify operation naming
      perf arm_spe: Decode GCS operation
      perf arm_spe: Rename SPE_OP_PKT_IS_OTHER_SVE_OP macro
      perf arm_spe: Decode ASE and FP fields in other operation
      perf arm_spe: Decode SME data processing packet
      perf arm_spe: Remove unused operation types
      perf arm_spe: Consolidate operation types
      perf arm_spe: Introduce data processing macro for SVE operations
      perf arm_spe: Report register access in record
      perf arm_spe: Report MTE allocation tag in record
      perf arm_spe: Report extended memory operations in records
      perf arm_spe: Report associated info for SVE / SME operations
      perf arm_spe: Report memset and memcpy in records
      perf arm_spe: Report GCS in record
      perf arm_spe: Expose SIMD information in other operations
      perf arm_spe: Synthesize memory samples for SIMD operations
      perf/uapi: Extend data source fields
      tools/include: Sync uapi/linux/perf.h with the kernel sources
      perf mem: Print extended fields
      perf arm_spe: Set extended fields in data source
      perf sort: Support sort ASE and SME
      perf sort: Sort disabled and full predicated flags
      perf report: Update document for SIMD flags
      perf arm_spe: Improve SIMD flags setting

 include/uapi/linux/perf_event.h                    | 32 ++++++++-
 tools/include/uapi/linux/perf_event.h              | 32 ++++++++-
 tools/perf/Documentation/perf-report.txt           |  5 +-
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  | 56 ++++++++++++++--
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  | 61 +++++++++--------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 53 ++++++++-------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     | 40 +++++++----
 tools/perf/util/arm-spe.c                          | 77 +++++++++++++++++-----
 tools/perf/util/mem-events.c                       | 66 +++++++++++++++++--
 tools/perf/util/sample.h                           | 21 ++++--
 tools/perf/util/sort.c                             | 21 ++++--
 11 files changed, 359 insertions(+), 105 deletions(-)
---
base-commit: da8fcfba0854dbe0b0eca465d35620c9cf4c89c1
change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


