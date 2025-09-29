Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnc2mUeAbjaG4HF8qFRvk87tmyTTYQ8ec61eQr9j9eM=; b=qahlJxpFibEwBPI2lqv2xIISSd
	+zlca1Hc8VWSmXyLDwrBfrhMOYpC/L4TFM3pxKOGV36LmTlmsyRT2L9Ivq6wzwD51Vi6hqhD6qSYK
	2rHRGRRASXsUe1yTnC564Pie1ZiFSzfGRZ+GGp/QZjnLTaZbod5WEkQHTUCfCdiAqydDQAMgfkZ4j
	xbHevjzG/FWDs+HH1bsEcFwS1jYg1/ogLv7bwCqTC9nfuesYLsWErflMpvjHO2YZFTWnUwr0Qc63j
	gCfpc7bhrLTbFPoofGbLAaF6dVV7gLNxt2dDn9r5KAmrQKDrNPikQsmOyfiky+XmehQwO2dxFiSy2
	FlRb/EIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtj-00000002zwF-10tg;
	Mon, 29 Sep 2025 16:38:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtC-00000002zXG-0vkG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A87F150C;
	Mon, 29 Sep 2025 09:38:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419AE3F66E;
	Mon, 29 Sep 2025 09:38:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:48 +0100
Subject: [PATCH 12/25] perf arm_spe: Report extended memory operations in
 records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-12-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=1324;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=IN1q4IBQZez4Gc/ZmEnYrKyLPI5UL1+SlIBjzXyHK0A=;
 b=Ns/KHgBy0FELdbj3bJVeUMIr95L+HG/iQPxa8FG5hHkK38B0n5/G1LqzfT/EBPUpeb6Lt/XRB
 MN7KvAgwqtnDE+w1tDI4X7u3TMLE2oRlwWwQnV5n9aIP8iPGtgwUc55
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093814_322505_C965A430 
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

Extended memory operations include atomic (AT), acquire/release (AR),
and exclusive (EXCL) operations. Save the relevant information
in the records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 6696448bdf4f347e2032a1b4da46fcdd4016f9fc..949c20816826a4d45d6cf9a5efaa125acea90b0a 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -211,6 +211,13 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_NV_SYSREG;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_MTE_TAG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_EXTENDED(payload)) {
+					if (payload & SPE_OP_PKT_AR)
+						decoder->record.op |= ARM_SPE_OP_AR;
+					if (payload & SPE_OP_PKT_EXCL)
+						decoder->record.op |= ARM_SPE_OP_EXCL;
+					if (payload & SPE_OP_PKT_AT)
+						decoder->record.op |= ARM_SPE_OP_ATOMIC;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
 				}

-- 
2.34.1


