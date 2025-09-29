Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834FBCCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfaFh6+nz83CdGe5kkTdS8YAcEi+Ex4u2AmFkZ1eszM=; b=YgsAxVfhNkvqDO3ihdVDC7uDOx
	YjPOyJW62WE8Gs/83r5zN0aZKh/IoO+b2uoPbthmgect+Oin9lEHUbKQ0qra933h+RwVVbpaSSEkN
	uLmba3xoJlTcCy5C6gHVvQoCqV+2kjTyEeSuQ+w1JR48jhH5RiGfH+Cj2R1mxjhzRd/RGWjHKA0ms
	te5rQmvM6pY0nzdKmPZkDNg78o7CUK6aDiJHiBCNVDXaGxPz0zCq0FA9/BYVnlrf2YEJZiM7AsZMA
	XAiM4gsD7bePqWXhTzR0N2GUu3wGAQMSjdDkf8TtN2fy01sNK0uAvfG2L4jyhNL3kfR7cyNcgDwWN
	HkvPzVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtk-00000002zxn-0ggz;
	Mon, 29 Sep 2025 16:38:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtF-00000002zbL-1V4b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E012D150C;
	Mon, 29 Sep 2025 09:38:08 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88AB03F66E;
	Mon, 29 Sep 2025 09:38:15 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:50 +0100
Subject: [PATCH 14/25] perf arm_spe: Report memset and memcpy in records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-14-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=1758;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yuX1bLKbtNtYvgw+8k1mJ3RsMWDT4yzWTFB8WvrM3rE=;
 b=tn/zbeubJ1crXa8NtFllcJpnlLSKnwcVCgznWKeQX0NC2GFBwEUGrTkQtiFwm9LaV0VL0Zb2W
 JB8b/e7GsXIDVXC1DaFaUkCuYEOTltex8j1Zs1XjTd6tkgGxHjD56lY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093817_448666_3531F982 
X-CRM114-Status: GOOD (  11.18  )
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
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 87d45c11ad7483c167b4d9cb2e481a001f54e5cc..565458a7a6cbd94d67803cc122154cb5cab4f308 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -43,7 +43,9 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
 	ARM_SPE_OP_SIMD_FP		= 1 << 11,
 	ARM_SPE_OP_MTE_TAG		= 1 << 12,
-	ARM_SPE_OP_SVE			= 1 << 13,
+	ARM_SPE_OP_MEMCPY		= 1 << 13,
+	ARM_SPE_OP_MEMSET		= 1 << 14,
+	ARM_SPE_OP_SVE			= 1 << 15,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,

-- 
2.34.1


