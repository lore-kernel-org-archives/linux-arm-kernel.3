Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242E2D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59Pqhy1EFnUaL46dXQ6luaGwUEO+r3+4Qh5mTUPe9fc=; b=xfj1HrFFGueCh44ASJ5m+DFboL
	uGfBJn2YjkWs5KOT/5Tov4vREtIi5pexweYorUVzm6d+2IEdpTH/avqfDxCu+cYahb/MK8mi5yAlH
	jsKbkdGBovySMDn7uA8I3h9oqTwR8u4DpdkvPngVnWNybTHqath5hheGRC5UT8inatorDL1kx4KDA
	TcOBuwnBVy5EAoWqlVlx9xdYjGkaKxtDPnVHTL4IoO35XDtyjdJdc/Zopl2aFojVl6v4RtFNVdgE7
	serTp5XlsMWzJvdv2rVSrZijXz2ZBPM8oWY6Wvb9FfUMdawnuO5sVu6aARMY1TtFu2m3ztbKgkjEf
	6niKkHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zA-00000003Qvs-1TiY;
	Mon, 01 Dec 2025 11:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1z8-00000003Qu7-1iqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6BA3153B;
	Mon,  1 Dec 2025 03:22:17 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89F83F59E;
	Mon,  1 Dec 2025 03:22:22 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:56 +0000
Subject: [PATCH 06/19] coresight: trbe: Refactor syndrome decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=4359;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rS7n6GqYxBhjQifAmikJPjJWBJ0+WduJEB52j0HxrUc=;
 b=j2R99VhM0xRCEGs9Df6BspIDlCsqEPA0TdAW9zgg7opexB+TMQv2IZXgjHuEHaqsxSf8Rfn+0
 siZbfpHRgTVA2u0tY12czMXtmPRWBTWMLKT9N+FT+TZqLe27g92sSq0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032226_567221_27776F97 
X-CRM114-Status: GOOD (  16.33  )
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

It gives priority to TRBSR_EL1.EA (external abort); an external abort
will immediately bail out and return an error.

Next, the syndrome decoding is refactored based on two levels of
information: the EC (Event Class) bits and the BSC (Trace Buffer Status
Code) bits.

If TRBSR_EL1.EC==0b000000, the driver continues parsing TRBSR_EL1.BSC to
identify the specific trace buffer event.  Otherwise, any non-zero
TRBSR_EL1.EC is treated as an error.

For error cases, the driver prints an error string and dumps registers
for debugging.

No additional checks are required for wrap mode beyond verifying the
TRBSR_EL1.WRAP bit, even on units with overwrite errata, as this bit
reliably indicates a buffer wrap.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 60 +++++++++++++++++++++-------
 drivers/hwtracing/coresight/coresight-trbe.h |  8 ++--
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 9e565122816949b37b8ff5e4ba04cfbc317c6f25..28e2bfa68074f19ccaa4a737d00af577aea818fe 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -643,29 +643,61 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *handle,
 						 u64 trbsr)
 {
+	const char *err_str;
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	struct trbe_cpudata *cpudata = buf->cpudata;
 
 	WARN_ON(is_trbe_running(trbsr));
-	if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
-		return TRBE_FAULT_ACT_FATAL;
 
-	if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
-		return TRBE_FAULT_ACT_FATAL;
+	if (is_trbe_abort(trbsr)) {
+		err_str = "External abort";
+		goto out_fatal;
+	}
 
-	/*
-	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
-	 * it might write data after a WRAP event in the fill mode.
-	 * Thus the check TRBPTR == TRBBASER will not be honored.
-	 */
-	if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == TRBE_BSC_FILLED)) &&
-	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
-	     get_trbe_write_pointer() == get_trbe_base_pointer()))
+	switch (ec) {
+	case TRBE_EC_OTHERS:
+		break;
+	case TRBE_EC_BUF_MGMT_IMPL:
+		err_str = "Unexpected implemented management";
+		goto out_fatal;
+	case TRBE_EC_GP_CHECK_FAULT:
+		err_str = "Granule Protection Check fault";
+		goto out_fatal;
+	case TRBE_EC_STAGE1_ABORT:
+		err_str = "Stage 1 data abort";
+		goto out_fatal;
+	case TRBE_EC_STAGE2_ABORT:
+		err_str = "Stage 2 data abort";
+		goto out_fatal;
+	default:
+		err_str = "Unknown error code";
+		goto out_fatal;
+	}
+
+	switch (bsc) {
+	case TRBE_BSC_NOT_STOPPED:
+		break;
+	case TRBE_BSC_FILLED:
+		break;
+	case TRBE_BSC_TRIGGERED:
+		err_str = "Unexpected trigger status";
+		goto out_fatal;
+	default:
+		err_str = "Unexpected buffer status code";
+		goto out_fatal;
+	}
+
+	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 
 	return TRBE_FAULT_ACT_SPURIOUS;
+
+out_fatal:
+	pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, TRBPTR=0x%016llx, TRBLIMITR=0x%016llx]\n",
+			   err_str, smp_processor_id(), trbsr,
+			   read_sysreg_s(SYS_TRBPTR_EL1),
+			   read_sysreg_s(SYS_TRBLIMITR_EL1));
+	return TRBE_FAULT_ACT_FATAL;
 }
 
 static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
index 45202c48accec7c86ba56130e2737bc2d1830fae..d7f7cd763c0c7139cf322b7336ee563073e3bea0 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.h
+++ b/drivers/hwtracing/coresight/coresight-trbe.h
@@ -35,9 +35,11 @@ static inline bool is_trbe_enabled(void)
 	return trblimitr & TRBLIMITR_EL1_E;
 }
 
-#define TRBE_EC_OTHERS		0
-#define TRBE_EC_STAGE1_ABORT	36
-#define TRBE_EC_STAGE2_ABORT	37
+#define TRBE_EC_OTHERS			0x0
+#define TRBE_EC_GP_CHECK_FAULT		0X1e
+#define TRBE_EC_BUF_MGMT_IMPL		0x1f
+#define TRBE_EC_STAGE1_ABORT		0x24
+#define TRBE_EC_STAGE2_ABORT		0x25
 
 static inline int get_trbe_ec(u64 trbsr)
 {

-- 
2.34.1


