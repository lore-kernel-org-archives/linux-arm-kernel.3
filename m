Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84353CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFtb79XB+daz86eZckBpH5JE1qFqGX2RiCOIg2Ztgeo=; b=aSuIlhWwzhCxj9HqjiPj7W2VWm
	WBYNlxOIuZdRWjQqzbVWT2h+vUYwqtgkL/NKaoBZX7M1SKH+T9k2R1Ql7ekXUXjMd6jleBnqOZobc
	HvMgxT9TuyD69D+qpmW6FGb71LTJJjsFoRfMbmhokD+D+3RZUelgz3Cp2gHnskN1dGfvfw+uTWb6P
	tSCKXJ+uICWT1qK/3hbAv146kP7qdXHPYKhGGRDEDdl9zlcRQsZyYQFlCBLr8l1yw6vk9KX8VOGDh
	UykJUXgKCVAhVoYVmPujIFUZr2/yMaarPg2NjC72yThQFRvLaKchY0rikeOiG62pt6VVLOEhV0AlB
	9Eis8PzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtk-00000002zyc-2Xkd;
	Mon, 29 Sep 2025 16:38:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtH-00000002zSj-03V1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89B1F1758;
	Mon, 29 Sep 2025 09:38:10 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328923F66E;
	Mon, 29 Sep 2025 09:38:17 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:51 +0100
Subject: [PATCH 15/25] perf arm_spe: Report GCS in record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-15-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2032;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sNhkxC+oum+/cHNq8ZXvE/LkTQgoAia9/NmGzye9YGw=;
 b=nYy5ov3+B6cfJpNKn02ulqb+fW8/zKNkOQkK3QDDKOglXE4flOSMabsLxHsJoeozWyrLo7WM6
 /znqzb5E/eZBHfsQeLS4c4Gj5cOaf0J2mCDzfP8mKRZzrLN02o879V6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093819_516567_DCE032C3 
X-CRM114-Status: GOOD (  11.49  )
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

Report GCS related info in records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 6f0390d4089599cd6bbf1357fa4cd6ec8190a58c..649471abef6a4386e1b250a19cda4f4caeb0a2ff 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -228,6 +228,10 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_MEMCPY;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload)) {
 					decoder->record.op |= ARM_SPE_OP_MEMSET;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_GCS(payload)) {
+					decoder->record.op |= ARM_SPE_OP_GCS;
+					if (payload & SPE_OP_PKT_GCS_COMM)
+						decoder->record.op |= ARM_SPE_OP_COMM;
 				}
 
 				break;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 565458a7a6cbd94d67803cc122154cb5cab4f308..40d734f284eb8d742de9c53e55a9a541d6d462b2 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -45,7 +45,8 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_MTE_TAG		= 1 << 12,
 	ARM_SPE_OP_MEMCPY		= 1 << 13,
 	ARM_SPE_OP_MEMSET		= 1 << 14,
-	ARM_SPE_OP_SVE			= 1 << 15,
+	ARM_SPE_OP_GCS			= 1 << 15,
+	ARM_SPE_OP_SVE			= 1 << 16,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -56,6 +57,7 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_DP			= 1 << 25,	/* Data processing */
 	ARM_SPE_OP_PRED			= 1 << 26,	/* Predicated */
 	ARM_SPE_OP_SG			= 1 << 27,	/* Gather/Scatter */
+	ARM_SPE_OP_COMM			= 1 << 28,	/* Common */
 
 	/* Second level operation type for BRANCH_ERET */
 	ARM_SPE_OP_BR_COND		= 1 << 8,

-- 
2.34.1


