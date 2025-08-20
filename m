Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23561CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq16eDaTYQMOn9zzBVLH7MX2YKx+OdDLLiqd/RRx9IE=; b=Y6YnmajDRekkGBjuReIAWzHanA
	i4h/+8qtJ2pq8B3Sa0lyPcvv84zIgvAOYqSsMQ1EohwRDKpqjXfYrNWxotETiAJYpdEG2DGt/FT4Y
	1E3KU280+yeyZZyd5Fv5VANqiZ/T0+cuvk15V6e4cugUKaGO4tzrCLPsI0+OQ1e8RsqAQIoGffDJl
	jRKDYQ9reKiTZiB3Va8PhnvXalxRZZ1yS7BEyVzmuzjZsjZ5KrHsheMivk6It/IPq8ZHRcEvXJrWI
	5VDTF70pRfBQMobs7jnxtYlAt5uc5e1vZSzWM6j6OUjStk3RyMqCHq/z87q4FhXQ1o/UbB+DTlLoA
	oWVC/pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorPa-0000000F6qo-1ncE;
	Wed, 20 Aug 2025 22:36:06 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonH5-0000000EeKL-0cno
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:11:04 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e87035a7c3so13743985a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 11:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755713462; x=1756318262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq16eDaTYQMOn9zzBVLH7MX2YKx+OdDLLiqd/RRx9IE=;
        b=UAvbp0pps9Eh08KmytKLUWpDCDBTfynClD8PQvkOSfbudmep3GgWKmZg28YMZY5Ql3
         v1sMgji8FqHwd+an5XQhE7fDO8nrBrSY4O8EWeiqMqHQErWYbI5F8+ZLt3QW3gzBpaxa
         YC9++Z91qEMIypOsshN3xWgknJxJCs69o6mRFZda7dBrwHCT6DHiqvjmU2hEH2PfotNm
         6jW5qHZiaxlgGy7P0uEu0mnoCr9LM0CoJl0+6Uv9c3YFTQq8RnVrhK/JYOTbVyeW0+Li
         plcaMh8TXu80GrKuDDfMsUpi1TvMqzVJ87KjsYc5l5jPJsUcxKHd9tm5FWoANLP6MhLA
         wNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755713462; x=1756318262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq16eDaTYQMOn9zzBVLH7MX2YKx+OdDLLiqd/RRx9IE=;
        b=Q5ohIaT1Ag1b5tJRfdtWUFQpLqzHrRtuCzLi41AFd30vG2fv+bcptA3Rf7CEv55Jl/
         /uCSz11oTAMMQPB+Zk5wFDqMz/bDWqXBmZaivOXm3t3PaJb1hZ9oaBGCCzwUv0ai+Mb2
         a6cwBy7rd2Y9tsa/27huxVVvr3BqY7GnqsReAp1g67BRdRlwqjr7mqh10JhqD3xSO4HP
         B6M7nNAr0oiV2MBr0/p6OUCeDUtGSCkw1AT2GRjK4G6sRUv+KleiO34bjl8Y4Tg5YCE+
         QGeQcbuqjetMtWsDYk9mc6636HfnUU6HRsBpjyGqXM+IrJWX0vacLHkOdtTL5Vxp8mRz
         0QFg==
X-Forwarded-Encrypted: i=1; AJvYcCW1I3FZYfRYOl/AvgDnEXUPHCyQR0/JDrD0DabCN3Eyny6Lc9FXXjyePYvpCUL72DZWYI5WB4TWwluN4p239uk3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzomk6OQXo2xeS/TB83ex/TgR2zK89MqUipfaUgWlrnmVn3iNtd
	WNJm3SPbs6Jkar6eEyPKyXNZT0eLKSO7EQPvKv0591mTJ10tVkwDCwwPrpvsw3APpQ==
X-Gm-Gg: ASbGnct0+umEeD1aQLtvvGl+wKa3/PIFuvNdg9e3dEfLMuhJfHzaYqewfJe+98lgOvO
	Dp+zEgU6CjLaB4X44OqqJuApYZMKl64nIwVsAb4uxldDGYD/GMunD3aDTQCkG2+3CmK4TrvbOZH
	XmTdy/ipo1UErlw/8dkcw2xNtv0vsFQBBgjbI6QuO4lJyaD1gvcSirkl3UR8nfOn7mH6oOz8VHN
	frPuqQ+PHVylxkaZlupgDxqhTJhNqZ2KX+vwkML4bAg2t3sWLPflMFRPM4nCkDul0nHEG/FRC1R
	lBbd4/q5r1b5UcxFXgOeJ5Jbrl+M0eUmfKE2ZPfZqE81C+WITvhH1WLH3dRl+V3DWk3BwqcYdfb
	fjlYzTCAuIyleTAgeKuuY1l4o9i4RNkYqF5lfh4/6b/Ks54rAbCPyYiz+p9a1ZCXxoIEPGQGpwV
	+9WXseN0PXIum91gWKrDT2QpVuUmBLCyx7AbM=
X-Google-Smtp-Source: AGHT+IHxSEMhGEa7cC/Xc549bj9LNnxJcU8yUkf8DRST4/na6Np0IFzpa9wqSwyR96VMC4fVeNSogg==
X-Received: by 2002:a05:620a:4550:b0:7e6:20a9:1855 with SMTP id af79cd13be357-7e9fcb7b646mr468924185a.44.1755713461000;
        Wed, 20 Aug 2025 11:11:01 -0700 (PDT)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e076811sm977497485a.36.2025.08.20.11.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:11:00 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Wed, 20 Aug 2025 14:10:44 -0400
Subject: [PATCH 1/2] firmware: ti_sci: Add trace events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-linux_master_ti_sci_trace-v1-1-2a69c0abf55e@criticallink.com>
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
In-Reply-To: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5565;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=etqFjPFs3vp08TxiXSqimCaG1/79A2Or3SQaEf8w0P8=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBopg+yRRf9U93bUOX/Qf7T3PjkuKN5XsQfsWGwo
 rTZnMjw3MSJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCaKYPsgAKCRDc1/0uCzbr
 qi3ED/wO/MtdnWf/w4gZK0rTauaX9xNidQJ8Nh0wJMp4R7fjhHDVutuzdwc/uB/l4tBYhWqTVPc
 jdB+1F01gq5yrNbMDoXMThfKfDnYPMXDd9kSsQZfdltNysj0Mikkx3T1oKcT6iPYLxC4Box4CAu
 rimQdnMRcfZ4nQ0Vn76Zd5DrhEUlX3vKOuQuUYqGMmEaXjgcRumaWvNrw9vzoN11/61pz6Cq3Ot
 kFmDBVaqV+CNLgHQ3j3le0AT/dow+0RKx+NQKp5POFcHcMz4PF/wleJusUhSLxVtdp5ZvQFODVB
 DJFSYLR38U5mpWhL2414tQuUJvd05VIvDxe6HmSUuZjwnPM7HVschUOzKMU0d4fa47vJiehGq7R
 JCUxRR7qNNjM7DhMYcM14xh/lXEmwhO6nBizfbhAe1eAt6SskCMNbfHASpsRKIqm4zKAdvFiSVM
 S9ErQSLc5wHV8C3NTgapXnNb67NnP0TF1t5fgEwKO61ST+Wd/AxdtjMs4NCIySeMG48iv1lfvnS
 wHvaZjzO66h1UpGLsVINxgUnIXIu49Nnm0BGtZzwK0pfj+xAQ+fgKtKW25uyGxJx32yJ6qvd7qm
 KbIWdvRorQs/Ehbi+DJxJaSiUzj4A0Qwu5H0x8wgGrc7QvZBcsugzrPJZbv8QIIRRzNA6RMF+t5
 h/dEZcJcsgnO17g==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_111103_194004_43AC1C09 
X-CRM114-Status: GOOD (  18.60  )
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

Add TI sci trace events to help to debug and measure the speed of the
communication channel. The xfer_begin and xfer_end calls can be used
to time how long a transfer takes. The rx_callback and msg_dump trace
events help track the data that gets returned.

Based on tracing done in ARM SCMI

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 MAINTAINERS                     |  1 +
 drivers/firmware/Makefile       |  3 ++
 drivers/firmware/ti_sci.c       | 11 ++++++
 drivers/firmware/ti_sci_trace.h | 87 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a1918beec113b576cf28b76151745ef..a6fac706feceedfc5039ec07de954ac35a9af848 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24631,6 +24631,7 @@ F:	drivers/pmdomain/ti/ti_sci_pm_domains.c
 F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	include/linux/soc/ti/ti_sci_inta_msi.h
 F:	include/linux/soc/ti/ti_sci_protocol.h
+F:	include/trace/events/ti_sci.h
 
 TEXAS INSTRUMENTS' TMP117 TEMPERATURE SENSOR DRIVER
 M:	Puranjay Mohan <puranjay@kernel.org>
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96fa9be012e89dac3038968bb67039..a055c53bdfa9e5c64adb4e20a9ca6c6661d80297 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -2,6 +2,9 @@
 #
 # Makefile for the linux kernel.
 #
+
+ccflags-y += -I$(src)			# needed for trace events
+
 obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
 obj-$(CONFIG_DMI)		+= dmi_scan.o
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ae5fd1936ad322e5e3a94897cc042f6548f919e6..87b1330305939bb6b19bbdaa594b17b266092a34 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -127,6 +127,9 @@ struct ti_sci_info {
 #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
 #define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
+#define CREATE_TRACE_POINTS
+#include "ti_sci_trace.h"
+
 #ifdef CONFIG_DEBUG_FS
 
 /**
@@ -269,6 +272,9 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 		return;
 	}
 
+	trace_ti_sci_rx_callback(hdr, 0);
+	trace_ti_sci_msg_dump(hdr, xfer);
+
 	ti_sci_dump_header_dbg(dev, hdr);
 	/* Take a copy to the rx buffer.. */
 	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
@@ -402,6 +408,9 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	int timeout;
 	struct device *dev = info->dev;
 	bool done_state = true;
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+
+	trace_ti_sci_xfer_begin(hdr, 0);
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0)
@@ -437,6 +446,8 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	mbox_client_txdone(info->chan_tx, ret);
 
+	trace_ti_sci_xfer_end(hdr, ret);
+
 	return ret;
 }
 
diff --git a/drivers/firmware/ti_sci_trace.h b/drivers/firmware/ti_sci_trace.h
new file mode 100644
index 0000000000000000000000000000000000000000..7f99c41ea08aec6cf64d601576cad29b14c6ad5b
--- /dev/null
+++ b/drivers/firmware/ti_sci_trace.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM ti_sci
+
+#if !defined(_TRACE_TI_SCI_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_TI_SCI_H
+
+#include <linux/tracepoint.h>
+
+
+DECLARE_EVENT_CLASS(ti_sci_hdr_event_class,
+	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
+	TP_ARGS(hdr, status),
+
+	TP_STRUCT__entry(
+		__field(u16, type)
+		__field(u8, host)
+		__field(u8, seq)
+		__field(u32, flags)
+		__field(int, status)
+	),
+
+	TP_fast_assign(
+		__entry->type = hdr->type;
+		__entry->host = hdr->host;
+		__entry->seq = hdr->seq;
+		__entry->flags = hdr->flags;
+		__entry->status = status;
+	),
+
+	TP_printk("type=%04X host=%02X seq=%02X flags=%08X status=%d",
+		__entry->type, __entry->host, __entry->seq, __entry->flags, __entry->status)
+);
+
+DEFINE_EVENT(ti_sci_hdr_event_class,
+	ti_sci_xfer_begin,
+	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
+	TP_ARGS(hdr, status)
+);
+
+DEFINE_EVENT(ti_sci_hdr_event_class,
+	ti_sci_rx_callback,
+	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
+	TP_ARGS(hdr, status)
+);
+
+DEFINE_EVENT(ti_sci_hdr_event_class,
+	ti_sci_xfer_end,
+	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
+	TP_ARGS(hdr, status)
+);
+
+
+TRACE_EVENT(ti_sci_msg_dump,
+	TP_PROTO(struct ti_sci_msg_hdr *hdr, struct ti_sci_xfer *xfer),
+	TP_ARGS(hdr, xfer),
+
+	TP_STRUCT__entry(
+		__field(u16, type)
+		__field(u8, host)
+		__field(u8, seq)
+		__field(u32, flags)
+		__field(size_t, len)
+		__dynamic_array(unsigned char, cmd, xfer->rx_len)
+	),
+
+	TP_fast_assign(
+		__entry->type = hdr->type;
+		__entry->host = hdr->host;
+		__entry->seq = hdr->seq;
+		__entry->flags = hdr->flags;
+		__entry->len = xfer->rx_len;
+		memcpy(__get_dynamic_array(cmd), xfer->xfer_buf, __entry->len);
+	),
+
+	TP_printk("type=%04X host=%02X seq=%02X flags=%08X data=%s",
+		__entry->type, __entry->host, __entry->seq, __entry->flags,
+		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
+);
+#endif /* _TRACE_TI_SCI_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE ti_sci_trace
+#include <trace/define_trace.h>

-- 
2.43.0


