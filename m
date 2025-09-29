Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F71CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTMzcL1EXa9jQ0WyiYRs8eCtEteAaAvQsITfEPnMHJg=; b=31n9aXJQ4/dIF0hBA70/aQ8fQD
	u2BUHHg9O76dinuOeuyKmNM2SWXJDCvS+iYlgYjv67lYeoojLSDzvKzQE6HO5uyQq8NhQRai1upp8
	E9Y96NLOfc5RwwbtbSY+YBEVeF6Yg30YQ6uZuZnnNDe29aNknRzOGt2GIdSShzTBDisKxPACUfedg
	n/OWAKpN/obCQGM7qXWGMwKDn4JSSWOo+7cLONRoMBvc9d61ZsCAVtVU/ru/eGWRCeQ/ddJMKk86+
	TYeirkv3xTY/BbuvQBKS247/OL2QTEQFn6RxWNOq6CNqUdKmSE24VIbytd0UvKHi1PBc85/fqOvpT
	hmOKb8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gu1-000000030JK-2Oo9;
	Mon, 29 Sep 2025 16:39:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtV-00000002zq4-3LSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A018150C;
	Mon, 29 Sep 2025 09:38:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047EC3F66E;
	Mon, 29 Sep 2025 09:38:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:38:00 +0100
Subject: [PATCH 24/25] perf report: Update document for SIMD flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-24-1150b3c83857@arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=1301;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=K+lf5GgTPw3SkqzOp32MWVxQu+Fbe4D7TBbZIbWs9ig=;
 b=2y9rbFtRgPk/fl/IR99AAJdtzFHP8byuTNT6rWvMBLtcukf7b5p7CN7kH1Sm7GfcA7kAjZC7F
 kASMLG48HUeCBLpXDD3ctNov8WowRm1/Fyj7urHk9o0TyjUojPzTPt1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093833_880562_0BD29C10 
X-CRM114-Status: GOOD (  10.70  )
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

Update SIMD architecture and predicate flags.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Documentation/perf-report.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-report.txt b/tools/perf/Documentation/perf-report.txt
index acef3ff4178eff66e8f876ae16cdac7b1387f07b..f361081a65dbe9cead539c7cb81d6ed86eb0acc6 100644
--- a/tools/perf/Documentation/perf-report.txt
+++ b/tools/perf/Documentation/perf-report.txt
@@ -136,7 +136,10 @@ OPTIONS
 	- addr: (Full) virtual address of the sampled instruction
 	- retire_lat: On X86, this reports pipeline stall of this instruction compared
 	  to the previous instruction in cycles. And currently supported only on X86
-	- simd: Flags describing a SIMD operation. "e" for empty Arm SVE predicate. "p" for partial Arm SVE predicate
+	- simd: Flags describing a SIMD operation. The architecture type can be Arm's
+	  ASE (Advanced SIMD extension), SVE, SME. It provides an extra tag for
+	  predicate: "e" for empty predicate, "p" for partial predicate, "d" for
+	  predicate disabled, and "f" for full predicate.
 	- type: Data type of sample memory access.
 	- typeoff: Offset in the data type of sample memory access.
 	- symoff: Offset in the symbol.

-- 
2.34.1


