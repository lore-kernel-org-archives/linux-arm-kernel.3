Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1210CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPRZlMe3mXhNEyltLr31WcLJ89n4CFgrXGaqrj8oMSg=; b=v65ii72zkdbyacLHS7F0V9wXq4
	6lujT0kbS40sW56Mo7Kw/fmn5nyTbvyS3bj7gT+xXjJN5P/T0bj0XHF1eItafd+/3Z00N/hdJ0ZL6
	AEoYkAXOwONd0php8Jt6LdndlJ1nab9saZXywXb+5Km2fUQ4ahg0P2kXIwwNNOaLUsdgwk3Y5tD0E
	+Y3SMOvbiabhbqRkT6v9cZMDUWK1jtJHjNV9zcyM2/ei6BIQjs1jYM/mAeipXpatxqCX/m6PrEYnM
	sZ0vFbbvS7sJALLWoQNUffNtauCkG8/TKXmK1MrHRAr/WS/B4nUnm8yq3RdaqXZzegYVYyxkwBJ8t
	1DfUbCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLR-00000007QNR-1xzf;
	Fri, 17 Oct 2025 10:05:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLF-00000007Q6P-468z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5289F1C25;
	Fri, 17 Oct 2025 03:05:37 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D23BD3F59E;
	Fri, 17 Oct 2025 03:05:43 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:11 +0100
Subject: [PATCH v2 22/25] perf sort: Support sort ASE and SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-22-2d41e4746e1b@arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
In-Reply-To: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1741;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LxrG4la+UU2a+kngmi6pw8OHWq6AgFvXmkETg/5yk98=;
 b=tbAXEc0TDjJdPMhk/Q/Mq0Y3agA2yqN7TuC2Tg5fk+Bb1XplrNO6/2bet+S1u4sJerINTwJ8r
 gaBIYqM1q1lAOqrhlolNuHS3T0i3NT0QTtkfK5DAorsMP00DvDWO/NL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030546_141993_DD0C3DD8 
X-CRM114-Status: GOOD (  12.06  )
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

Support sort Advance SIMD extension (ASE) and SME.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/sample.h | 12 +++++++++---
 tools/perf/util/sort.c   |  6 +++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index fae834144ef42105d08a59704ee75cd4852bbc5a..3b22cc2f7ad6ba1dc53b5d9ffff2a4e47c89612a 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -67,12 +67,18 @@ struct aux_sample {
 };
 
 struct simd_flags {
-	u8	arch:1,	/* architecture (isa) */
-		pred:2;	/* predication */
+	u8	arch:  2,	/* architecture (isa) */
+		pred:  2,	/* predication */
+		resv:  4;	/* reserved */
 };
 
 /* simd architecture flags */
-#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* ARM SVE */
+enum simd_op_flags {
+	SIMD_OP_FLAGS_ARCH_NONE = 0x0,	/* No SIMD operation */
+	SIMD_OP_FLAGS_ARCH_SVE,		/* Arm SVE */
+	SIMD_OP_FLAGS_ARCH_SME,		/* Arm SME */
+	SIMD_OP_FLAGS_ARCH_ASE,		/* Arm Advanced SIMD */
+};
 
 /* simd predicate flags */
 #define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index f3a565b0e2307a8adf159725f803df5fef0dff83..ad98d5b75f34b49cd39e30cba997a614654eebcb 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -193,8 +193,12 @@ static const char *hist_entry__get_simd_name(struct simd_flags *simd_flags)
 {
 	u64 arch = simd_flags->arch;
 
-	if (arch & SIMD_OP_FLAGS_ARCH_SVE)
+	if (arch == SIMD_OP_FLAGS_ARCH_SVE)
 		return "SVE";
+	else if (arch == SIMD_OP_FLAGS_ARCH_SME)
+		return "SME";
+	else if (arch == SIMD_OP_FLAGS_ARCH_ASE)
+		return "ASE";
 	else
 		return "n/a";
 }

-- 
2.34.1


