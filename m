Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB4AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaUPRHEfNCFEmwu3vevftKoNk75hQNFopCX45O+gSAs=; b=DE0rjWH/XDQ4TgoKrMXfvf+1uj
	M9r7bQu8GooUe6j6RnEH0FATRKr6W0TbDniy6lrBawY9yF85iRuu5JipWmRylTMZXLVLro184FUj0
	4QdF3M+sltZdvRNhwiSUzOcJzW7bDcNUdr4/PWWSVtPDFlOEeBjZ/cX/1SywlbAy0k59RaC2NIXeQ
	LKV8fqSXzCXMvAE3/5JXiRw283i0fnjh1zaxbqr+cgpIUH8dD687Swkfjh5BnovytNNvzId7cmaT3
	UeA8beGmQbubaVf7sFlRgz/sEzSohk7bxtnbJUepQYomDF5qGnobrnTP0+LT3wkSxaJ1P4mnWY6F/
	8NSnLgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz6R-0000000B9hv-05lg;
	Wed, 15 Jan 2025 08:50:19 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyzT-0000000B8Oe-1PgS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736930585; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=QaUPRHEfNCFEmwu3vevftKoNk75hQNFopCX45O+gSAs=;
	b=SvAtT41ckdtW7nS+xCdggyAhqPmXU1BKvo/s0wia439QLW0VEjdMj4Nw4R+rUL1hYDCT7WnU/QxCMzws/wrcfHsxJKhSOlq0JmL7puUa3PxtjAavASBbuUqDsZSokZcjp5/pShWytRfy+cKbh5QUZxyJYvobUavS37Pe/gacIUc=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WNhzKe1_1736930580 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jan 2025 16:43:03 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com
Cc: tianruidong@linux.alibaba.com,
	Tyler Baicar <baicar@os.amperecomputing.com>
Subject: [PATCH v3 5/5] trace, ras: add ARM RAS extension trace event
Date: Wed, 15 Jan 2025 16:42:28 +0800
Message-Id: <20250115084228.107573-6-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_004307_543298_BE9202E4 
X-CRM114-Status: GOOD (  10.15  )
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
RAS extension registers.

Signed-off-by: Tyler Baicar <baicar@os.amperecomputing.com>
Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/acpi/arm64/aest.c    |  2 +
 drivers/ras/aest/aest-core.c |  6 +++
 drivers/ras/ras.c            |  3 ++
 include/ras/ras_event.h      | 71 ++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/drivers/acpi/arm64/aest.c b/drivers/acpi/arm64/aest.c
index 312ddd5c15f5..adc12174f4e0 100644
--- a/drivers/acpi/arm64/aest.c
+++ b/drivers/acpi/arm64/aest.c
@@ -11,6 +11,8 @@
 
 #include "init.h"
 
+#include <ras/ras_event.h>
+
 #undef pr_fmt
 #define pr_fmt(fmt) "ACPI AEST: " fmt
 
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 0530880ded3e..e72df9a79b96 100644
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
index e5f23a8279c2..2a5a440e4c29 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -72,6 +72,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(extlog_mem_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(mc_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(non_standard_event);
 EXPORT_TRACEPOINT_SYMBOL_GPL(arm_event);
+#ifdef CONFIG_ARM64_RAS_EXTN
+EXPORT_TRACEPOINT_SYMBOL_GPL(arm_ras_ext_event);
+#endif
 
 static int __init parse_ras_param(char *str)
 {
diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index e5f7ee0864e7..119e8c4e6d20 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -338,6 +338,77 @@ TRACE_EVENT(aer_event,
 			"Not available")
 );
 
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
+#endif
+
 /*
  * memory-failure recovery action result event
  *
-- 
2.33.1


