Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50453CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8imUXXfdG5uZHqg94GBpIXrEp/z8VJ7aFQEVv4se48Q=; b=vE1quCwMk5njg9MDuhztFnd3D2
	l0+7kDlSLyjDxrWfJUtZv6XDxNeW3P8IyiNKL0gLM0SJOqIZrnI17k17t3P/w1Yw0rZgP2LVyUuTJ
	Cq5DbedQdwIaZ2E40mYQ76Gd6rTjzFtjR9YK5oednIYWxb2V9+8M5yvxFf8C3mYoUCS6mRr22Blyc
	xFR1pbIoCWS5GwftvY2YKOdkUFRJIwCvuAa+dhzqlvIXn5dRqKlS6caOPH2o+UceNi57q6qcubkyv
	wUXnrm6MpbX+xgUtdFdb3t2pWqRNzPAYo3RjvTf+4ydS4ztWEmwprECEwWeeknmJH3CKknSnAoGr6
	dUepHfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL7-00000007Pv3-2aFY;
	Fri, 17 Oct 2025 10:05:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL0-00000007Ply-3Rwr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738341596;
	Fri, 17 Oct 2025 03:05:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F36FE3F59E;
	Fri, 17 Oct 2025 03:05:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:02 +0100
Subject: [PATCH v2 13/25] perf arm_spe: Report associated info for SVE /
 SME operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-13-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1727;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zinKOe0OnQlC3Qe3ta5WLcFD5NOnPxLV9drCk020yzQ=;
 b=LO8FRYC95KLUH45j9sKs+4J4d9XhY9zeXNi7MHgZxpPokeJGlXNVggMonv3m966iCpwdDWaL7
 RYkExZlFaZEABGIgk1On4BvZlggydGPQMbwUb7iWDTt9yvp10+PSSiG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030530_917268_DF6661AA 
X-CRM114-Status: UNSURE (   9.10  )
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

SVE / SME operations can be predicated or Gather load / scatter store,
save the relevant info into record.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 949c20816826a4d45d6cf9a5efaa125acea90b0a..5b214fc4ca9f67cf11700a18939f37f4a5400b84 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -220,6 +220,10 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 						decoder->record.op |= ARM_SPE_OP_ATOMIC;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
+					if (payload & SPE_OP_PKT_SVE_PRED)
+						decoder->record.op |= ARM_SPE_OP_PRED;
+					if (payload & SPE_OP_PKT_SVE_SG)
+						decoder->record.op |= ARM_SPE_OP_SG;
 				}
 
 				break;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 7b4d26f2ebfe17a9187f959e5ec0b2479f70cc2f..d14cf6b95507bcbdb1f7e6d4908e6c40c4a8279c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -53,6 +53,8 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_EXCL			= 1 << 23,
 	ARM_SPE_OP_AR			= 1 << 24,
 	ARM_SPE_OP_DP			= 1 << 25,	/* Data processing */
+	ARM_SPE_OP_PRED			= 1 << 26,	/* Predicated */
+	ARM_SPE_OP_SG			= 1 << 27,	/* Gather/Scatter */
 };
 
 enum arm_spe_2nd_op_branch {

-- 
2.34.1


