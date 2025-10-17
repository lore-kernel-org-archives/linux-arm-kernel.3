Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236F0CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3uZgxjzDNDuKjESGiCrd9N4R1x2nDKb74mktL9TgEI=; b=RNbLNMrRHJ1vYO/EyXau+oJVOt
	8WV3ZqkNLqH9gEfv5q7x+uWG7b+HbPdKl5pXTQEKc6J43zMd5QxPESYCf83HGNC65c4EMeD/DL1WK
	YMT33ixS4FwKn9fq8t0CJpUDoZl0IMOEICugPKGvMqFv9Re8wTkMVj2ziahJCgLISumbTInJ3XjbD
	ZWWTvPUNvdAGt8ZrV9X2bHbdRq9m4rZlJ1SSL1M2DY/AMw/5IaxXbsZkJLSkMvpjnFhfJhXB9ZPTr
	VTvN03NHwzolJcfOaZnHCrhEYdD94pfhjciOeJ79edbG093Ej3b6lVkF6OY+nRsjV7gXz+dOZYx2M
	YoQPJVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLM-00000007QG6-3sD2;
	Fri, 17 Oct 2025 10:05:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL4-00000007Pp8-0Rr9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDBA61596;
	Fri, 17 Oct 2025 03:05:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495C53F59E;
	Fri, 17 Oct 2025 03:05:32 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:04 +0100
Subject: [PATCH v2 15/25] perf arm_spe: Report GCS in record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-15-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1911;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ixiUf5kOPNGqDsCLn1W0tcm157BdMTyzNAxILZdP0Es=;
 b=njlyUUBiX2qFoyCvQfsQzGV6HQ75k4jvWOwg3JItCR2qNUOKTLLRiHJ9/Urx5TcywCxYwlcKu
 W0LGV7nw2DKDjrWGXnY8m+PwZ/cp2FihnrD/H2+gHknhuBzOoPFKOGr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030534_249087_D420DB9A 
X-CRM114-Status: UNSURE (   9.90  )
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

Report GCS related info in records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 2 ++
 2 files changed, 6 insertions(+)

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
index 3f4dae589c062d927d286b73ce53fa39795daffd..b838e9c6168c6b7c20bb63b8e7c9d27c35f416dc 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -47,6 +47,7 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_MTE_TAG		= 1 << 13,
 	ARM_SPE_OP_MEMCPY		= 1 << 14,
 	ARM_SPE_OP_MEMSET		= 1 << 15,
+	ARM_SPE_OP_GCS			= 1 << 16,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -57,6 +58,7 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_DP			= 1 << 25,	/* Data processing */
 	ARM_SPE_OP_PRED			= 1 << 26,	/* Predicated */
 	ARM_SPE_OP_SG			= 1 << 27,	/* Gather/Scatter */
+	ARM_SPE_OP_COMM			= 1 << 28,	/* Common */
 };
 
 enum arm_spe_2nd_op_branch {

-- 
2.34.1


