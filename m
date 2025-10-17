Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F26CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ej1NFuBeEgNDwKBK3LK1GcRT/jjK1IciPKMmztUUEQ=; b=OeYcA9kbDjTLfeHVnHcp8tTkvz
	D0XvRpDLd0LICLLD/MKBZp2IfGsTZNius+PeYp7xDeLjiQbQSDVCJK3pDdP7zESBC+KJ8CN3KWyr4
	vnXAjKQwwXEFas4iHAw5KecJwY/LpzcjpXPpxSWqapJEyMWaIh34pPFP5XieJbHazouyCR0kO/8BB
	9n86P8xflFBpPrPG7m8swIEtjVRkVVFC7/EmQpcuCYm3Z/vqyp/Z3rrMh5MAarBf1Ey+FBu+q8Nsl
	9XD+XJavXvq0EDcMlLuP0oS1hnmu/4fccmIpz5F3J9IYxK8E4wuvShrkwqY35PgSwh/0ZjQG2AkPr
	HVo+uTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL8-00000007PxH-3rPT;
	Fri, 17 Oct 2025 10:05:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL2-00000007PnR-1YMA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7631595;
	Fri, 17 Oct 2025 03:05:24 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E37A3F59E;
	Fri, 17 Oct 2025 03:05:30 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:03 +0100
Subject: [PATCH v2 14/25] perf arm_spe: Report memset and memcpy in records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-14-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1678;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/o6IlPDccsoR4PgqXvnisv0NgEarTT/VpnQkQ92xlAQ=;
 b=wa+2C7BhtYxkvU6Ig8PHrk2z3EMfAyPdcN7oM/5ayfZrj8wt6dYY07ELGAvp1wqoBQfPmbx6R
 r+NOHLFXVpOD5JIrK8Yn9zr2Aj16IcUVxxycObccOcJE1LmvlbVE2nN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030532_461935_9025F308 
X-CRM114-Status: UNSURE (   9.46  )
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

Expose memset and memcpy related info in records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 5b214fc4ca9f67cf11700a18939f37f4a5400b84..6f0390d4089599cd6bbf1357fa4cd6ec8190a58c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -224,6 +224,10 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 						decoder->record.op |= ARM_SPE_OP_PRED;
 					if (payload & SPE_OP_PKT_SVE_SG)
 						decoder->record.op |= ARM_SPE_OP_SG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(payload)) {
+					decoder->record.op |= ARM_SPE_OP_MEMCPY;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload)) {
+					decoder->record.op |= ARM_SPE_OP_MEMSET;
 				}
 
 				break;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index d14cf6b95507bcbdb1f7e6d4908e6c40c4a8279c..3f4dae589c062d927d286b73ce53fa39795daffd 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -45,6 +45,8 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_SIMD_FP		= 1 << 11,
 	ARM_SPE_OP_SVE			= 1 << 12,
 	ARM_SPE_OP_MTE_TAG		= 1 << 13,
+	ARM_SPE_OP_MEMCPY		= 1 << 14,
+	ARM_SPE_OP_MEMSET		= 1 << 15,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,

-- 
2.34.1


