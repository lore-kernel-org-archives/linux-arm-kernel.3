Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E619CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvLIdRB+kw/euoeY7rITEJDNGr0lT/fAIMkag3zH71k=; b=qywVudVLEkjzj+uz+pmEZUq4SI
	H1WrVXHw3/L/uQCHsO0PgjY0KBMZP3lSlK2Y675ecBHOSwhK0bTS5LNTU9bbVV/qjvuLlYUYZMpW6
	fBW6/ek9XmQZt04yna4j7umOrXTw49EGrGqmJFeQbt4yv01vOKDSETwD4rnnI0PEKR/2GBcXQsLSR
	4/27RewYTk3DBY3ZDbyuyS+pgTFzLWb6nFLemaASN9/bZX24lo5dueWlsQMY23aXJWdSFQ4CFbViF
	ejFllMUpChNMw0K93tx12iWOUSFx8/UY/PQLXCs1YhrtHsl97UTAE45WZ767GRXysDjyMJ7vWqL52
	65Uxa3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiv0W-0000000ErVt-2asq;
	Fri, 14 Feb 2025 12:41:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titju-0000000EeAN-2dpC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:20:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863EF113E;
	Fri, 14 Feb 2025 03:20:30 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AE8F3F6A8;
	Fri, 14 Feb 2025 03:20:07 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 08/11] perf arm-spe: Fill branch operations and events to record
Date: Fri, 14 Feb 2025 11:19:33 +0000
Message-Id: <20250214111936.15168-9-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214111936.15168-1-leo.yan@arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032010_799892_BFED1667 
X-CRM114-Status: GOOD (  11.37  )
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

The new added branch operations and events are filled into record, the
information will be consumed when synthesizing samples.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../util/arm-spe-decoder/arm-spe-decoder.c     | 18 ++++++++++++++++++
 .../util/arm-spe-decoder/arm-spe-decoder.h     | 10 ++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index ba807071d3c1..52bd0a4ea96d 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -207,6 +207,18 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				break;
 			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
 				decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
+				if (payload & SPE_OP_PKT_COND)
+					decoder->record.op |= ARM_SPE_OP_BR_COND;
+				if (payload & SPE_OP_PKT_INDIRECT_BRANCH)
+					decoder->record.op |= ARM_SPE_OP_BR_INDIRECT;
+				if (payload & SPE_OP_PKT_GCS)
+					decoder->record.op |= ARM_SPE_OP_BR_GCS;
+				if (SPE_OP_PKT_CR_BL(payload))
+					decoder->record.op |= ARM_SPE_OP_BR_CR_BL;
+				if (SPE_OP_PKT_CR_RET(payload))
+					decoder->record.op |= ARM_SPE_OP_BR_CR_RET;
+				if (SPE_OP_PKT_CR_NON_BL_RET(payload))
+					decoder->record.op |= ARM_SPE_OP_BR_CR_NON_BL_RET;
 				break;
 			default:
 				pr_err("Get packet error!\n");
@@ -238,6 +250,12 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 			if (payload & BIT(EV_MISPRED))
 				decoder->record.type |= ARM_SPE_BRANCH_MISS;
 
+			if (payload & BIT(EV_NOT_TAKEN))
+				decoder->record.type |= ARM_SPE_BRANCH_NOT_TAKEN;
+
+			if (payload & BIT(EV_TRANSACTIONAL))
+				decoder->record.type |= ARM_SPE_IN_TXN;
+
 			if (payload & BIT(EV_PARTIAL_PREDICATE))
 				decoder->record.type |= ARM_SPE_SVE_PARTIAL_PRED;
 
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 4bcd627e859f..85b688a97436 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -24,6 +24,8 @@ enum arm_spe_sample_type {
 	ARM_SPE_REMOTE_ACCESS		= 1 << 7,
 	ARM_SPE_SVE_PARTIAL_PRED	= 1 << 8,
 	ARM_SPE_SVE_EMPTY_PRED		= 1 << 9,
+	ARM_SPE_BRANCH_NOT_TAKEN	= 1 << 10,
+	ARM_SPE_IN_TXN			= 1 << 11,
 };
 
 enum arm_spe_op_type {
@@ -52,8 +54,12 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_SVE_SG		= 1 << 27,
 
 	/* Second level operation type for BRANCH_ERET */
-	ARM_SPE_OP_BR_COND	= 1 << 16,
-	ARM_SPE_OP_BR_INDIRECT	= 1 << 17,
+	ARM_SPE_OP_BR_COND		= 1 << 16,
+	ARM_SPE_OP_BR_INDIRECT		= 1 << 17,
+	ARM_SPE_OP_BR_GCS		= 1 << 18,
+	ARM_SPE_OP_BR_CR_BL		= 1 << 19,
+	ARM_SPE_OP_BR_CR_RET		= 1 << 20,
+	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 21,
 };
 
 enum arm_spe_common_data_source {
-- 
2.34.1


