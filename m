Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9126D62609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB6qe+WiM6Jdm4e2JZteSt/S9JwOmUm8EGeoq5GhI0A=; b=dLgNBIF+MV3ax66qToQrmTiz/F
	U6Ih6eGjQvD7+EtqXpLy/22NuIMBSXPSunYeqMW4fncygf21gA8DRi4Ms6vEJezTt9OGnmhgeiLSv
	uMxX4jZ6arSE39ZcxhjytZIaGFE/F41uifls2O+vdCi6opDHZWKPaZLK2DqqzT8DWsUb0hYCynjYQ
	DRt2o9zJatV7vG06VwDJr7WoE1tvmpxDzEva6CW5fBseSwZbgO0Hx7prC0K79Y1hTndLO9w72I/wu
	3m5a0VWomC4TLFCTlG6cRVAjNoX1VBh1ShpYSYnlEdhg9PLQwHIQqRUmm72n3RxgA2WkER9Y8oIit
	ITvT5yVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJA-00000006m8g-179q;
	Thu, 22 Jan 2026 09:48:56 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJ4-00000006m1r-2Tkw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075326; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=IB6qe+WiM6Jdm4e2JZteSt/S9JwOmUm8EGeoq5GhI0A=;
	b=qTu1xlFk0GuZWZqOOhcRDRPH2m1KeplmUBGLA1g9/4IfcVTAeB3QKUqd7GhfQ9WwjyaQ7mbwDN6Mf6BnL1m4rucwqdLsr04gmrebHOK1AciD4HQpuQ5M3TQUFK8/1VU7zBaZrQh08NiAbY33oQpPxnjm7e/Md/L67XB/IMcL5Jk=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WxbwhFR_1769075322 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:48:45 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 16/16] trace, ras: add ARM RAS extension trace event
Date: Thu, 22 Jan 2026 17:46:56 +0800
Message-Id: <20260122094656.73399-17-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_014851_937990_CFE55E57 
X-CRM114-Status: GOOD (  10.65  )
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
 drivers/ras/aest/aest-core.c |  6 +++
 drivers/ras/ras.c            |  3 ++
 include/ras/ras_event.h      | 71 ++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index bbf8b1142be7..6a2d84b47721 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -13,6 +13,8 @@
 #include <linux/genalloc.h>
 #include <linux/ras.h>
 
+#include <ras/ras_event.h>
+
 #include "aest.h"
 
 DEFINE_PER_CPU(struct aest_device, percpu_adev);
@@ -90,6 +92,10 @@ static void aest_print(struct aest_event *event)
 		pr_err("%s  ERR%dMISC3: 0x%llx\n", pfx_seq, index,
 		       regs->err_misc[3]);
 	}
+
+	trace_arm_ras_ext_event(event->type, event->id0, event->id1,
+				event->index, event->hid, &event->regs,
+				event->vendor_data, event->vendor_data_size);
 }
 
 static void aest_handle_memory_failure(u64 addr)
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 2a5b5a9fdcb3..28ef30ddfeaf 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -111,6 +111,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(extlog_mem_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(mc_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(non_standard_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(arm_event);
+#ifdef CONFIG_ARM64_RAS_EXTN
+EXPORT_TRACEPOINT_SYMBOL_GPL(arm_ras_ext_event);
+#endif
 
 static int __init parse_ras_param(char *str)
 {
diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index eaecc3c5f772..3a4a0c0e4dbe 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -377,6 +377,77 @@ TRACE_EVENT(aer_event,
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
+		 const u32 id0,
+		 const u32 id1,
+		 const u32 index,
+		 char *hid,
+		 struct ras_ext_regs *regs,
+		 const u8 *data,
+		 const u32 len),
+
+	TP_ARGS(type, id0, id1, index, hid, regs, data, len),
+
+	TP_STRUCT__entry(
+		__field(u8,  type)
+		__field(u32, id0)
+		__field(u32, id1)
+		__field(u32, index)
+		__field(char *, hid)
+		__field(u64, err_fr)
+		__field(u64, err_ctlr)
+		__field(u64, err_status)
+		__field(u64, err_addr)
+		__field(u64, err_misc0)
+		__field(u64, err_misc1)
+		__field(u64, err_misc2)
+		__field(u64, err_misc3)
+		__field(u32, len)
+		__dynamic_array(u8, buf, len)
+	),
+
+	TP_fast_assign(
+		__entry->type = type;
+		__entry->id0 = id0;
+		__entry->id1 = id1;
+		__entry->index = index;
+		__entry->hid = hid;
+		__entry->err_fr = regs->err_fr;
+		__entry->err_ctlr = regs->err_ctlr;
+		__entry->err_status = regs->err_status;
+		__entry->err_addr = regs->err_addr;
+		__entry->err_misc0 = regs->err_misc[0];
+		__entry->err_misc1 = regs->err_misc[1];
+		__entry->err_misc2 = regs->err_misc[2];
+		__entry->err_misc3 = regs->err_misc[3];
+		__entry->len = len;
+		memcpy(__get_dynamic_array(buf), data, len);
+	),
+
+	TP_printk("type: %d; id0: %d; id1: %d; index: %d; hid: %s; "
+		  "ERR_FR: %llx; ERR_CTLR: %llx; ERR_STATUS: %llx; "
+		  "ERR_ADDR: %llx; ERR_MISC0: %llx; ERR_MISC1: %llx; "
+		  "ERR_MISC2: %llx; ERR_MISC3: %llx; data len:%d; raw data:%s",
+		  __entry->type, __entry->id0, __entry->id1, __entry->index,
+		  __entry->hid, __entry->err_fr, __entry->err_ctlr,
+		  __entry->err_status, __entry->err_addr, __entry->err_misc0,
+		  __entry->err_misc1, __entry->err_misc2, __entry->err_misc3,
+		  __entry->len,
+		  __print_hex(__get_dynamic_array(buf), __entry->len))
+);
+#endif /* CONFIG_ARM64_RAS_EXTN */
 #endif /* _TRACE_HW_EVENT_MC_H */
 
 /* This part must be outside protection */
-- 
2.51.2.612.gdc70283dfc


