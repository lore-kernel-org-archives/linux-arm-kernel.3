Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D3CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCTA33sxxd+17lpakNm3vu47CBhEKqJUljuqGVtyXcw=; b=yrW9hrlkYXFwMzfEbONxTqld2U
	+7EAbV7VI3vZrtPHnXTFt/QF++MxITNmKdbs5Fwvx/3C0TBPeEWCoe9xwSa7RwwdDyBW+zvv7ktsG
	6gDu7i67NaaCKMjRfckoFgKJkOuhAMKKlgPU+sob7ZW1qYKIdBfKWhxFC47SOZt0TZy5CtDJ0mqrh
	EIIsRsJkD8HHb7AdHkOyLdjqCRGrxIX80MiwUsdGXb+nca5Aqbp0XIDh4SseMHU+h48HQwUiT5ngP
	phD9u/isyC+egWTGtj4xbi/EFKL25XCOeDrEb5Y9NYiWdTITp7roGC5i+5xy7kHKxM+f0DMg8mO0x
	Br4dKk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDz-00000003UOz-1sP9;
	Fri, 16 Oct 2026 16:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDW-00000003Tt7-1rpy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yCTA33sxxd+17lpakNm3vu47CBhEKqJUljuqGVtyXcw=; b=KUk0AK/E46kRmJTfyuwws0hEk+
	aegQqrwtvI865GPrkRJkXJSdrPDLeiCAXaotsH9cwfOYCosq6oSRU17lo1hHReUlG6Oz8p4qSTZS2
	tL5y+zN6IYkknHC2Lii6h2CJMbjbox8ufGFMY1TouXbaPl5/Spu+8XDGDqG7OQWTM1qsnqIGKM38v
	u1drlKnxxFXlcTJFS7aoAZI8BuxKXpJvhLJwBGnu1McXVBQgIBOAaEvQPJKBUF2zFMiCRIBpL5Yha
	kPCsg8sTYsoQhN5Pw1avpnyPsvdLkRrR9PiquMZQOxOI8MI+y9vM8JIvRRIq/ChM9HN+p6vogTHb/
	Kwiufx3Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDT-00000001lJZ-1tMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F51175A;
	Fri, 16 Oct 2026 09:55:30 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F2E3F7B4;
	Fri, 16 Oct 2026 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169734; bh=0s3gRd+7Z6m8dnxBaVin2agHkJaeme2Yso2ncpuajKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eu8EiVTCpodE4s5gJdsP/6dquUbNKeRen11WdOhxXoxiPM44fw+hw86/zUalcGRuB
	 i3CpcsBtQkV5a4viDxY/WTY8WededTxehW3LLnWCjVz523lv3xAog7hsqg3cOGMHqV
	 LeTfklwAks9IDlToY3zcsMRhisqlTxH7gHqX91dU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:10 +0100
Subject: [PATCH v2 12/23] coresight: trbe: Decode TRBSR status codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-12-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=5756;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0s3gRd+7Z6m8dnxBaVin2agHkJaeme2Yso2ncpuajKk=;
 b=7RfNH5jk9/wl6i7XePQMS8nB+eLPRlnmRbnF9h9wGUj9rckLgY/cTYhmvgFny83aq7VyM63C6
 36FzYmhbZPxBdbCLsL6n98WIT/CO57i2B6ULBGjsH3kfRJAvZhutoJ1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175535_853576_C60858E4 
X-CRM114-Status: GOOD (  17.24  )
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

trbe_get_fault_act() currently handles only a small set of TRBE stop
reasons: external aborts, trigger events and stage 1 and 2 aborts. Other
TRBSR_EL1 EC/BSC values are reported as spurious events, which hides
useful failure information and makes the status handling hard to extend.

Decode the EC and BSC fields explicitly. Keep the normal fill-mode
handling unchanged, but treat unsupported or unexpected status values as
fatal and report them with a ratelimited diagnostic containing TRBSR_EL1,
TRBPTR_EL1 and TRBLIMITR_EL1. Use %p for the buffer pointers so the
printk diagnostic hashes their address values by default.

Stop using is_trbe_trg(), instead, use TRBSR_EL1_BSC_TRIGGER_EVENT as
the unsupported trigger case. This keeps the stop-reason handling in the
EC/BSC decode path, the driver can validate the status fields safely.

Move the TRBSR_EL1 BSC definitions to the arm64 sysreg header, and use
the common TRBSR_EL1 EC/BSC names in the TRBE driver.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/sysreg.h              |  6 +++
 drivers/hwtracing/coresight/coresight-trbe.c | 57 +++++++++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-trbe.h |  8 ----
 3 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d49448cfa3bb61f5cb42e0a6f1aa8a89..0e602f07625b3c4fe6cd3fd71a658ebae768d8fd 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -357,6 +357,12 @@
 #define TRBSR_EL1_BSC_MASK		GENMASK(5, 0)
 #define TRBSR_EL1_BSC_SHIFT		0
 
+#define TRBSR_EL1_BSC_NOT_STOPPED	UL(0)
+#define TRBSR_EL1_BSC_FILLED		UL(1)
+#define TRBSR_EL1_BSC_TRIGGER_EVENT	UL(2)
+#define TRBSR_EL1_BSC_MANUAL_STOP	UL(3)
+#define TRBSR_EL1_BSC_BUF_SIZE		UL(4)
+
 #define SYS_PMINTENSET_EL1		sys_reg(3, 0, 9, 14, 1)
 #define SYS_PMINTENCLR_EL1		sys_reg(3, 0, 9, 14, 2)
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1f51c33de83638479436683fd96e31d69c3b860f..a851f09d806a6b6a6386d6f7547b01a17f61b88e 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -658,29 +658,76 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *handle,
 						 u64 trbsr)
 {
+	const char *err_str;
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	struct trbe_cpudata *cpudata = buf->cpudata;
 
 	WARN_ON(is_trbe_running(trbsr));
-	if (is_trbe_trg(trbsr) || is_trbe_abort(trbsr))
-		return TRBE_FAULT_ACT_FATAL;
 
-	if ((ec == TRBE_EC_STAGE1_ABORT) || (ec == TRBE_EC_STAGE2_ABORT))
-		return TRBE_FAULT_ACT_FATAL;
+	if (is_trbe_abort(trbsr)) {
+		err_str = "External abort";
+		goto out_fatal;
+	}
+
+	switch (ec) {
+	case TRBSR_EL1_EC_OTHER:
+		break;
+	case TRBSR_EL1_EC_IMP_DEF:
+		err_str = "Unexpected IMPDEF buffer management event";
+		goto out_fatal;
+	case TRBSR_EL1_EC_FAULT_GPC:
+		err_str = "Granule Protection Check fault";
+		goto out_fatal;
+	case TRBSR_EL1_EC_FAULT_WRITE_S1:
+		err_str = "Stage 1 data abort";
+		goto out_fatal;
+	case TRBSR_EL1_EC_FAULT_WRITE_S2:
+		err_str = "Stage 2 data abort";
+		goto out_fatal;
+	default:
+		err_str = "Unknown error code";
+		goto out_fatal;
+	}
+
+	switch (bsc) {
+	case TRBSR_EL1_BSC_NOT_STOPPED:
+		break;
+	case TRBSR_EL1_BSC_FILLED:
+		break;
+	case TRBSR_EL1_BSC_TRIGGER_EVENT:
+		err_str = "Unsupported trigger event";
+		goto out_fatal;
+	case TRBSR_EL1_BSC_MANUAL_STOP:
+		err_str = "Unsupported manual stop";
+		goto out_fatal;
+	case TRBSR_EL1_BSC_BUF_SIZE:
+		err_str = "Buffer size was too large";
+		goto out_fatal;
+	default:
+		err_str = "Unexpected buffer status code";
+		goto out_fatal;
+	}
 
 	/*
 	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
 	 * it might write data after a WRAP event in the fill mode.
 	 * Thus the check TRBPTR == TRBBASER will not be honored.
 	 */
-	if ((is_trbe_wrap(trbsr) && (ec == TRBE_EC_OTHERS) && (bsc == TRBE_BSC_FILLED)) &&
+	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
 	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
 	     get_trbe_write_pointer() == get_trbe_base_pointer()))
 		return TRBE_FAULT_ACT_WRAP;
 
 	return TRBE_FAULT_ACT_SPURIOUS;
+
+out_fatal:
+	pr_err_ratelimited("%s on CPU %d [TRBSR=0x%016llx, TRBPTR=%p, TRBLIMITR=%p]\n",
+			   err_str, smp_processor_id(), trbsr,
+			   (void *)read_sysreg_s(SYS_TRBPTR_EL1),
+			   (void *)read_sysreg_s(SYS_TRBLIMITR_EL1));
+	return TRBE_FAULT_ACT_FATAL;
 }
 
 static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
index 45202c48accec7c86ba56130e2737bc2d1830fae..8ba9ef4056e4dc3968816c6a7cbf2859f2bbed36 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.h
+++ b/drivers/hwtracing/coresight/coresight-trbe.h
@@ -35,19 +35,11 @@ static inline bool is_trbe_enabled(void)
 	return trblimitr & TRBLIMITR_EL1_E;
 }
 
-#define TRBE_EC_OTHERS		0
-#define TRBE_EC_STAGE1_ABORT	36
-#define TRBE_EC_STAGE2_ABORT	37
-
 static inline int get_trbe_ec(u64 trbsr)
 {
 	return (trbsr & TRBSR_EL1_EC_MASK) >> TRBSR_EL1_EC_SHIFT;
 }
 
-#define TRBE_BSC_NOT_STOPPED 0
-#define TRBE_BSC_FILLED      1
-#define TRBE_BSC_TRIGGERED   2
-
 static inline int get_trbe_bsc(u64 trbsr)
 {
 	return (trbsr & TRBSR_EL1_BSC_MASK) >> TRBSR_EL1_BSC_SHIFT;

-- 
2.34.1


