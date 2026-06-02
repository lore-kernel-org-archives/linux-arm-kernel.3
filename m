Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A74CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8PYl6vt/JGLK/5rXbDBL7ylKeOz6sqUbxtL6VST4yk=; b=HRM84gQGLsEqsit01V9qGPS7js
	BP/2JD6zlY3cfAhfrKHo2NqOccpu6eXYE6NWarMhaXq2S867hK0QS7CXIOcEd0JaKiEKnWlyAZMyU
	NQGnd2csFR42oqP8Fi/GuBT3ei5ijk11iuw9QtgOPKCwee196QZuudD8oE7k/Z9LG9Ssl2xkl8vz/
	CinmUApk1QremGcHO2c9KpjAmQ2Mx8e0hySrZgRO4kgNrPZpp4uGphy7/S4b7NzTb1lxlG/Q1wT97
	1aj1qpzhL7EnARTvDOgmhooeMsrKzQlBp2O32ZX6VF8hrMJ0TQY4fR/so9twevwxTWCgq2gr8nV6K
	oihzES+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMe-0000000CRbz-0f8J;
	Tue, 02 Jun 2026 07:16:40 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJMS-0000000CRDl-11QL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780384580; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=m8PYl6vt/JGLK/5rXbDBL7ylKeOz6sqUbxtL6VST4yk=;
	b=ejTna3FHsIne9z7Da7wJFICwGYJcS0wZJ053H8Tus8UXsdGhsKU0s0zOgYOKmb1/QmxgKlrtvmDObCRh8ZpPp3uP0M50IUx753hhbzCpVYy/0mZGRACR0kDxErphTgzSwS1IBRSa1ZJDLwsJ5WHl8HjCJals9uzfJT3/NTmiHxw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X43R2hf_1780384577;
Received: from t50a05405.sqa.eu95.tbsite.net(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X43R2hf_1780384577 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 15:16:19 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v7 16/16] trace, ras: add ARM RAS extension trace event
Date: Tue,  2 Jun 2026 15:15:39 +0800
Message-ID: <20260602071540.3711528-17-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_001631_771482_0C35B65A 
X-CRM114-Status: GOOD (  11.53  )
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

Add a trace event for hardware errors reported by the ARMv8
RAS extension registers. userspace app can monitor this
trace event and decode error information.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/arm64/ras-core.c |  5 +++
 drivers/ras/ras.c            |  3 ++
 include/ras/ras_event.h      | 79 ++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
index 82e8bb10870f..3f4e7866bb75 100644
--- a/drivers/ras/arm64/ras-core.c
+++ b/drivers/ras/arm64/ras-core.c
@@ -11,6 +11,7 @@
 #include <linux/panic.h>
 #include <linux/platform_device.h>
 #include <linux/ras.h>
+#include <ras/ras_event.h>
 
 #include "ras.h"
 
@@ -181,6 +182,10 @@ static void ras_do_proc(struct ras_record *record, struct ras_ext_regs *regs)
 		}
 	}
 
+	trace_arm_ras_ext_event(record->node->type, record->index, regs,
+				record->node->specific_data, record->node->specific_data_size,
+				record->vendor_data, record->vendor_data_size);
+
 	atomic_notifier_call_chain(&ras_decoder_chain, 0, record);
 
 	if (status & ERR_STATUS_CE)
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..c8858b745021 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -115,6 +115,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(extlog_mem_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(mc_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(non_standard_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(arm_event);
+#ifdef CONFIG_ARM64_RAS_EXTN
+EXPORT_TRACEPOINT_SYMBOL_GPL(arm_ras_ext_event);
+#endif
 
 static int __init parse_ras_param(char *str)
 {
diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index fdb785fa4613..346c868f3cf7 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -381,6 +381,85 @@ TRACE_EVENT(aer_event,
 			"Not available")
 );
 #endif /* CONFIG_PCIEAER */
+
+/*
+ * ARM RAS Extension Events Report
+ *
+ * This event is generated when an error reported by the ARM RAS extension
+ * hardware is detected.
+ */
+
+#ifdef CONFIG_ARM64_RAS_EXTN
+#include <asm/ras.h>
+TRACE_EVENT(arm_ras_ext_event,
+
+	TP_PROTO(const u8 type,
+		 const u32 index,
+		 struct ras_ext_regs *regs,
+		 const u8 *specific_data,
+		 const u32 specific_data_size,
+		 const u8 *vendor_data,
+		 const u32 vendor_data_size),
+
+	TP_ARGS(type, index, regs, specific_data, specific_data_size,
+		vendor_data, vendor_data_size),
+
+	TP_STRUCT__entry(
+		__field(u8,  type)
+		__field(u32, index)
+		__field(u64, err_fr)
+		__field(u64, err_ctlr)
+		__field(u64, err_status)
+		__field(u64, err_addr)
+		__field(u64, err_misc0)
+		__field(u64, err_misc1)
+		__field(u64, err_misc2)
+		__field(u64, err_misc3)
+		__field(u32, specific_data_size)
+		__dynamic_array(u8, specific_data, specific_data_size)
+		__field(u32, vendor_data_size)
+		__dynamic_array(u8, vendor_data, vendor_data_size)
+	),
+
+	TP_fast_assign(
+		__entry->type = type;
+		__entry->index = index;
+		__entry->err_fr = regs->err_fr;
+		__entry->err_ctlr = regs->err_ctlr;
+		__entry->err_status = regs->err_status;
+		__entry->err_addr = regs->err_addr;
+		__entry->err_misc0 = regs->err_misc[0];
+		__entry->err_misc1 = regs->err_misc[1];
+		__entry->err_misc2 = regs->err_misc[2];
+		__entry->err_misc3 = regs->err_misc[3];
+		__entry->specific_data_size = specific_data_size;
+		memcpy(__get_dynamic_array(specific_data), specific_data, specific_data_size);
+		__entry->vendor_data_size = vendor_data_size;
+		memcpy(__get_dynamic_array(vendor_data), vendor_data, vendor_data_size);
+	),
+
+	TP_printk("type: %d; index: %d; "
+		  "ERR_FR: %llx; ERR_CTLR: %llx; ERR_STATUS: %llx; "
+		  "ERR_ADDR: %llx; ERR_MISC0: %llx; ERR_MISC1: %llx; "
+		  "ERR_MISC2: %llx; ERR_MISC3: %llx; "
+		  "specific data len:%d; specific data:%s; "
+		  "vendor data len:%d; vendor data:%s",
+		  __entry->type,
+		  __entry->index,
+		  __entry->err_fr,
+		  __entry->err_ctlr,
+		  __entry->err_status,
+		  __entry->err_addr,
+		  __entry->err_misc0,
+		  __entry->err_misc1,
+		  __entry->err_misc2,
+		  __entry->err_misc3,
+		  __entry->specific_data_size,
+		  __print_hex(__get_dynamic_array(specific_data), __entry->specific_data_size),
+		  __entry->vendor_data_size,
+		  __print_hex(__get_dynamic_array(vendor_data), __entry->vendor_data_size))
+);
+#endif /* CONFIG_ARM64_RAS_EXTN */
 #endif /* _TRACE_HW_EVENT_MC_H */
 
 /* This part must be outside protection */
-- 
2.51.2.612.gdc70283dfc


