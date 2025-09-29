Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5708CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNE6fHVM3Zl5+zzi968pHEEaJxY2YmKZ9MYGvQ7VGI4=; b=3Upbvn4BpY8fYLMZzooKCkAkzf
	axK+dC7RylWp8S7g0mkGH5oflMHTEQwsA6GdFLumvOCC1YFU58bfwpZKPUbjN/0HrAW/uwPxTQctx
	RSqjgHMWcM52eDYUeqs7lVL49mCtOK6TBzOEkgdw9VNvXtblQu769HL5iOMbKsWlmvVeTYTRp6LQj
	R0MdkqW39dHv5tUcuDpau3MzrQjhXUdOvn3PSz8grWHnVyXo1R71Akv34LY3CQBHKS1i3L5xyJC10
	QPcK5wkpSxiSyOtI71KfObC+VdZUTubK5PZiwr0uxkV0zvXpBTOh9rhhnuHjyrjd3pbSVey3c5Dji
	SU/CwCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtv-000000030C6-1A1E;
	Mon, 29 Sep 2025 16:38:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtQ-00000002zib-3qQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69638150C;
	Mon, 29 Sep 2025 09:38:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 140853F66E;
	Mon, 29 Sep 2025 09:38:26 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:57 +0100
Subject: [PATCH 21/25] perf arm_spe: Set extended fields in data source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-21-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=3190;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gTHiDHw3pvrWPKm1NepqNycFJ5f2dr2RUOowvflQb1U=;
 b=DyKmy4kTu2vPkTdDe6ltyj6ZfTv/k3+unq9fhPJZpAiq4JvSi5rGby0dSmvUgZXaWo1IXmURx
 UencLEpvwoOAzWA+Pk1/9gdvV8NuhG6Rp8CGnY6vBL6Lnug0u6YDQ6V
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093829_099367_BA52EDA8 
X-CRM114-Status: UNSURE (   8.84  )
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

Set extended operation type and affiliate info in the data source.

Before:

  perf script -F,dso,sym,data_src | grep SIMD
  sve-test 6516696.714341:        288100144 |OP STORE|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A
  sve-test 6516696.714341:        288100144 |OP STORE|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A
  sve-test 6516696.714341:        288100144 |OP STORE|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A
  sve-test 6516696.714344:        288800142 |OP LOAD|LVL L1 hit|SNP HitM|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A
  sve-test 6516696.714344:        288800142 |OP LOAD|LVL L1 hit|SNP HitM|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A

After:

  perf script -F,dso,sym,data_src | grep SIMD
  sve-test 6516696.714341:  444000288100144 |OP STORE SIMD|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  PRED SG
  sve-test 6516696.714341:  444000288100144 |OP STORE SIMD|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  PRED SG
  sve-test 6516696.714341:  444000288100144 |OP STORE SIMD|LVL L1 hit|SNP None|TLB Walker hit|LCK No|BLK  N/A|AFF  PRED SG
  sve-test 6516696.714344:        288800142 |OP LOAD|LVL L1 hit|SNP HitM|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A
  sve-test 6516696.714344:        288800142 |OP LOAD|LVL L1 hit|SNP HitM|TLB Walker hit|LCK No|BLK  N/A|AFF  N/A

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index bc233a5007d20e4dec11eeb1554adc1580f43718..5e920fe77ccda6f398cab13fa1e4269ddab12fd9 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1000,6 +1000,36 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 	else
 		data_src.mem_op = PERF_MEM_OP_NA;
 
+	if (record->op & ARM_SPE_OP_MTE_TAG)
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_MTE_TAG;
+	else if (record->op & ARM_SPE_OP_NV_SYSREG)
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_NESTED_VIRT;
+	else if (record->op & ARM_SPE_OP_MEMCPY)
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_MEMCPY;
+	else if (record->op & ARM_SPE_OP_MEMSET)
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_MEMSET;
+	else if (record->op & ARM_SPE_OP_GCS)
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_GCS;
+	else if (is_simd_op(record->op))
+		data_src.mem_op_ext = PERF_MEM_EXT_OP_SIMD;
+
+	if (record->op & ARM_SPE_OP_DP)
+		data_src.mem_aff |= PERF_MEM_AFF_DP;
+	if (record->op & ARM_SPE_OP_FP)
+		data_src.mem_aff |= PERF_MEM_AFF_FP;
+	if (record->op & ARM_SPE_OP_PRED)
+		data_src.mem_aff |= PERF_MEM_AFF_PRED;
+	if (record->op & ARM_SPE_OP_ATOMIC)
+		data_src.mem_aff |= PERF_MEM_AFF_ATOMIC;
+	if (record->op & ARM_SPE_OP_EXCL)
+		data_src.mem_aff |= PERF_MEM_AFF_EXCLUSIVE;
+	if (record->op & ARM_SPE_OP_AR)
+		data_src.mem_aff |= PERF_MEM_AFF_AR;
+	if (record->op & ARM_SPE_OP_SG)
+		data_src.mem_aff |= PERF_MEM_AFF_SG;
+	if (record->op & ARM_SPE_OP_COND)
+		data_src.mem_aff |= PERF_MEM_AFF_CONDITIONAL;
+
 	arm_spe__synth_ds(speq, record, &data_src);
 	arm_spe__synth_memory_level(speq, record, &data_src);
 

-- 
2.34.1


