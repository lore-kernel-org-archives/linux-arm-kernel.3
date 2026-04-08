Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D5C1073C84
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9PfclXFg/I7IVQuWcwQ//GDTuylCVEwmHgQnnTc8E3M=; b=Hr/IBY1Z75ie/0
	5+dGrBQlJEWT9fDhaCsmtzdfmHjnOubDoeUilJhO9sVHcX4eBy8Hpj1CouOSJPZPtUSYF0/FFhB90
	v2+RLHRn9bpeIX8xMdEiC3vO5zCVMi6SyA+hGQiU6TfcK0CTD4YfuSxmX11aEOK/zmWcy01tVD3EX
	ZRS1pwp48KOxvqj855Ixo5Kxo8ukZWneMVJG/IT1OzpsgfzUq7fVTB5SBAFRlQufWLKgFImtMrR7v
	7E4Su+PSKKOOG+yBG5BJDCh+YTvKIkToIUh031LdA703tE6fB1cBCMLBrslWaOLi/sE1Zm6PI31jP
	EOEc5T7r1cZPLMfVWOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRg-00000008dGv-1dN7;
	Wed, 08 Apr 2026 09:43:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRd-00000008dFC-1gGI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:43:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FD6A3161;
	Wed,  8 Apr 2026 02:43:24 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8E23F641;
	Wed,  8 Apr 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775641410; bh=Rbdsud5ILBxTXWpv2HKpv9K7HCW+fl3XIjnnc/huKMo=;
	h=From:Subject:Date:To:Cc:From;
	b=SU9GS2lsuw09ZppHPRec6OL7hwFzl6BdvLtVIcG0TD6luMFVAIHiyS3bHFhmohHjX
	 nivETOqAOakfPNb/tapsv8js43m2Afjr9YYAgoj/PXfR7whxj6hbd2fb4W4nL7/IDw
	 M9L0m8lti1WBXPS/kGNegolmHYhXDXOE7JXXnoeo=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v5 0/4] perf arm_spe: Extend SIMD operations
Date: Wed, 08 Apr 2026 10:42:30 +0100
Message-Id: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcj1mkC/43Q32rDIBQG8FcpXi/DczT+2dXeY5QQ43H1oo1oF
 zpK3n2mZS0dLNuNcJTvdz48s0I5UmEvmzPLNMUSx0Md2qcNG3b94Z2a6OvMkGPLDfImUQ5d+Uh
 pzMeuz/uuJJqgEY1TFLwKg9YOWY2nTCGeLvTbts67WI5j/rxsmmC5vaKWm9/RevBGewi9lBYA/
 Wt9fR7G/bLhGkf7Rxyg5U4MRphW3+JLowlvLYCDXmGwMuglkNRSEbhHRtyZWnGFEZUhJQZr0Ab
 r7SMjvxnFgasVRlbGOfQghRNG8R9/8q+4Mdo5a21QdG8xz/MXtpW03RECAAA=
X-Change-ID: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775641408; l=2534;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Rbdsud5ILBxTXWpv2HKpv9K7HCW+fl3XIjnnc/huKMo=;
 b=HTjaKAOMU4fkrxEsINjopu1ZKsjwIrEYDIVSxKHLJDJHTOFbiJfKoINFRHEhn7kKOSRlVB3cB
 XsrkNpV+9ukC4ieiTIbKF03LXsS1oo306Zc6O+ooIdIxgn9q7sPnrbJ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024333_569613_34C5396B 
X-CRM114-Status: UNSURE (   9.55  )
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

This series extends SIMD flag for Arm SPE and updated the document.

Since I failed to get perf core maintainer's review for uAPI header
updating for data source fields (since last year's Sepetember), this
series I dropped uAPI changes and sent only SIMD flag changes, hope
it is easier for perf tool maintainer's picking up.

Anyway, uAPI patches will be sent out separately.

This version is rebased onto the latest perf-tools-next branch.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v5:
- Dropped uAPI header changes for data source fields updating.
- Link to v4: https://lore.kernel.org/r/20260106-perf_support_arm_spev1-3-v4-0-b887bb999f6e@arm.com

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
Leo Yan (4):
      perf sort: Support sort ASE and SME
      perf sort: Sort disabled and full predicated flags
      perf report: Update document for SIMD flags
      perf arm_spe: Improve SIMD flags setting

 tools/perf/Documentation/perf-report.txt |  5 ++++-
 tools/perf/util/arm-spe.c                | 26 ++++++++++++++++++++------
 tools/perf/util/sample.h                 | 21 ++++++++++++++++-----
 tools/perf/util/sort.c                   | 21 +++++++++++++++------
 4 files changed, 55 insertions(+), 18 deletions(-)
---
base-commit: dc647eb00969cd213c84d6caee90c480317e857d
change-id: 20250820-perf_support_arm_spev1-3-b6efd6fc77b2

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


