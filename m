Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5432DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3OtLVnCn3uU1HHP+wanwg0ecRxqJyoJbpcOrQbcsfY=; b=iVI7u43DZlqlZy
	2CVbfJfb6PMuGvbnw3JtqIFCaubden/qVr2cbq3kbVgbvQW84ZY2u0wgDcFcizFZWjQ0p5EZLsCJo
	w41gRZJBLHORYXOcEhoRdVIW853A2rtr7KRkQvEPvEqgKbU74of0579SQq7ZKSUd4YO6bLnyJkSHu
	De1gyajRJGkO9mgldws5aGwaqik6V8d9Gje52+KZ7RL2Qah2/Ihd1D566tFfi8o1UUY4CVM8ePrAL
	0BbhJ6JxBd8LIWwsq+NPLYn2vjT868vILv2ZUwqBrADpreKlWCUdC4pM8tX2jfotbmi2tAQiYSXlM
	LlFL4cSHFWf4IE63jWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt7-00000002zPx-0R2I;
	Mon, 29 Sep 2025 16:38:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gsx-00000002zKf-2uiL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A3F150C;
	Mon, 29 Sep 2025 09:37:45 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78C2A3F66E;
	Mon, 29 Sep 2025 09:37:52 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 00/25] perf arm_spe: Extend operations
Date: Mon, 29 Sep 2025 17:37:36 +0100
Message-Id: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANC12mgC/3WNQQ6CMBBFr0JmbU1bkQIr72FIU+hUuoA2UyQaw
 t2tuHYzyfs//80GCcljgrbYgHD1yYc5gzgVMIxmfiDzNjNILq+8lpxFJKfTM8ZAizY06RRxFez
 C+gqdrdygVC8hzyOh869Dfe8yjz4tgd7Hp1V805+04fV/aT6cKSucKctGCGlvuT0PYYJu3/cPu
 qKGy74AAAA=
X-Change-ID: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=3423;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0UK3UBAhu6yCCdqynZEv/rSNKmeciofmmL/dNxUWQWw=;
 b=3ej9XOeB0onJXrW8RiIvgXIHir+PmuJjJ1isNnwPuDFK2edcpQAn0ay+D9HlmLh5Y0aE9Pme3
 coftzUCrP9hAySe5goy4K/vA3RJhY9D1Yehm6C59SU8gmpUMwFo57Zs
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093759_859438_5B59C0E5 
X-CRM114-Status: UNSURE (   9.00  )
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
  Patches 07 ~ 18: Export the operation info into records, so that the
                   information can be later consumed by samples.
  Patches 19 ~ 25: Set the operation info into sample's data source and
                   SIMD flag, and updated the document.

This patch series is tested on FVP. I verified Arm SPE trace data with
kselftest's MTE tag test and SVE test. For GCS test, I verified the SPE
decoding with I manually modifying perf binary file.

Signed-off-by: Leo Yan <leo.yan@arm.com>
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
      perf arm_spe: Expose length for SVE and SME operations
      perf arm_spe: Synthesize memory samples for SIMD operations
      perf/uapi: Extend data source fields
      perf mem: Print extended fields
      perf arm_spe: Set extended fields in data source
      perf sort: Support sort ASE and SME
      perf sort: Sort disabled and full predicated flags
      perf report: Update document for SIMD flags
      perf arm_spe: Improve SIMD flags setting

 include/uapi/linux/perf_event.h                    | 28 +++++++-
 tools/include/uapi/linux/perf_event.h              | 28 +++++++-
 tools/perf/Documentation/perf-report.txt           |  5 +-
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  | 59 +++++++++++++++--
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  | 56 +++++++++-------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 53 ++++++++-------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     | 40 +++++++----
 tools/perf/util/arm-spe.c                          | 77 +++++++++++++++++-----
 tools/perf/util/mem-events.c                       | 58 +++++++++++++++-
 tools/perf/util/sample.h                           | 11 +++-
 tools/perf/util/sort.c                             | 15 ++++-
 11 files changed, 336 insertions(+), 94 deletions(-)
---
base-commit: c17dda8013495d8132c976cbf349be9949d0fbd1
change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


