Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E29CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkN/MDjZtLq4YcCo9QF8yvcL89leh7oczNKEorSdyk4=; b=v6E1TnsDOorUXt5PIf5Lfk0ZV/
	xRzhNC1KojHLmtFuEQIlos3Y8wePo8FLugGhyH4XWhX1RQz+06IxqMwRx44u1ny63emG+Q7eCyWid
	S39hEBnE5IJdvW5Pr++0/988y43WY6dxhm/qY5Cm3IDOTuJZUn2hFpHDBIgk9FP5S47docrW/4gxW
	l2PrAAbCV/8geAkJM1POTQLoVt4665BtFGhdVGkC43RdAydCYYI30XcIiXlPjoCNt6UP+goLa5EbH
	TUERYJn5BKPDfpCj6X3HHnNKWMHVGKtTmRlpC4NMg7BFRCTWnJmZiPAgxkN/j5224HZ+Hy8D7F8Lz
	xWYEuEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotZ9-0000000FLem-2ua2;
	Thu, 21 Aug 2025 00:54:07 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uooyS-0000000EnHz-3KbT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:59:58 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KJxjjJ325974;
	Wed, 20 Aug 2025 14:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755719985;
	bh=FkN/MDjZtLq4YcCo9QF8yvcL89leh7oczNKEorSdyk4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KM2ME80B+HoDnJ/8jka7ukowr1nUnLyyeHobTq2skdhavrFPCscw2/2OqfUTE9DWF
	 KeBb3AAxLomU6ObXU6KNBc+oKrfDNxlTtL69ER3Q2o65w63dx/yqnc4vxq9Azf34c8
	 EZqiGsBoxeb5pdcOhUyYARdaKZ2+JYMdCJ0mlU68=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KJxj1i2283160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 14:59:45 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 14:59:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 14:59:45 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KJxiLT1026617;
	Wed, 20 Aug 2025 14:59:44 -0500
Message-ID: <54018fdc-d332-415e-8747-f46d84245870@ti.com>
Date: Wed, 20 Aug 2025 14:59:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: ti_sci: Add trace events
To: Jonathan Cormier <jcormier@criticallink.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-trace-kernel@vger.kernel.org>
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
 <20250820-linux_master_ti_sci_trace-v1-1-2a69c0abf55e@criticallink.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250820-linux_master_ti_sci_trace-v1-1-2a69c0abf55e@criticallink.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_125956_930716_32BC7223 
X-CRM114-Status: GOOD (  25.26  )
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

On 8/20/25 1:10 PM, Jonathan Cormier wrote:
> Add TI sci trace events to help to debug and measure the speed of the
> communication channel. The xfer_begin and xfer_end calls can be used
> to time how long a transfer takes. The rx_callback and msg_dump trace
> events help track the data that gets returned.
> 
> Based on tracing done in ARM SCMI
> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>   MAINTAINERS                     |  1 +
>   drivers/firmware/Makefile       |  3 ++
>   drivers/firmware/ti_sci.c       | 11 ++++++
>   drivers/firmware/ti_sci_trace.h | 87 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 102 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fad6cb025a1918beec113b576cf28b76151745ef..a6fac706feceedfc5039ec07de954ac35a9af848 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24631,6 +24631,7 @@ F:	drivers/pmdomain/ti/ti_sci_pm_domains.c
>   F:	include/dt-bindings/soc/ti,sci_pm_domain.h
>   F:	include/linux/soc/ti/ti_sci_inta_msi.h
>   F:	include/linux/soc/ti/ti_sci_protocol.h
> +F:	include/trace/events/ti_sci.h
>   
>   TEXAS INSTRUMENTS' TMP117 TEMPERATURE SENSOR DRIVER
>   M:	Puranjay Mohan <puranjay@kernel.org>
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96fa9be012e89dac3038968bb67039..a055c53bdfa9e5c64adb4e20a9ca6c6661d80297 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -2,6 +2,9 @@
>   #
>   # Makefile for the linux kernel.
>   #
> +
> +ccflags-y += -I$(src)			# needed for trace events
> +
>   obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
>   obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
>   obj-$(CONFIG_DMI)		+= dmi_scan.o
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index ae5fd1936ad322e5e3a94897cc042f6548f919e6..87b1330305939bb6b19bbdaa594b17b266092a34 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -127,6 +127,9 @@ struct ti_sci_info {
>   #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
>   #define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
>   
> +#define CREATE_TRACE_POINTS
> +#include "ti_sci_trace.h"
> +
>   #ifdef CONFIG_DEBUG_FS
>   
>   /**
> @@ -269,6 +272,9 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
>   		return;
>   	}
>   
> +	trace_ti_sci_rx_callback(hdr, 0);
> +	trace_ti_sci_msg_dump(hdr, xfer);
> +

You could instead put these in the same ti_sci_do_xfer() as the other
trace additions, after the completion, xfer->xfer_buf will contain
the response "hdr" message. Keeps all the tracing in one spot, and
if you are going for timing info you'll want to take into account
the completion scheduling/polling.

Andrew

>   	ti_sci_dump_header_dbg(dev, hdr);
>   	/* Take a copy to the rx buffer.. */
>   	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
> @@ -402,6 +408,9 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>   	int timeout;
>   	struct device *dev = info->dev;
>   	bool done_state = true;
> +	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
> +
> +	trace_ti_sci_xfer_begin(hdr, 0);
>   
>   	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
>   	if (ret < 0)
> @@ -437,6 +446,8 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>   	 */
>   	mbox_client_txdone(info->chan_tx, ret);
>   
> +	trace_ti_sci_xfer_end(hdr, ret);
> +
>   	return ret;
>   }
>   
> diff --git a/drivers/firmware/ti_sci_trace.h b/drivers/firmware/ti_sci_trace.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7f99c41ea08aec6cf64d601576cad29b14c6ad5b
> --- /dev/null
> +++ b/drivers/firmware/ti_sci_trace.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM ti_sci
> +
> +#if !defined(_TRACE_TI_SCI_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_TI_SCI_H
> +
> +#include <linux/tracepoint.h>
> +
> +
> +DECLARE_EVENT_CLASS(ti_sci_hdr_event_class,
> +	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
> +	TP_ARGS(hdr, status),
> +
> +	TP_STRUCT__entry(
> +		__field(u16, type)
> +		__field(u8, host)
> +		__field(u8, seq)
> +		__field(u32, flags)
> +		__field(int, status)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->type = hdr->type;
> +		__entry->host = hdr->host;
> +		__entry->seq = hdr->seq;
> +		__entry->flags = hdr->flags;
> +		__entry->status = status;
> +	),
> +
> +	TP_printk("type=%04X host=%02X seq=%02X flags=%08X status=%d",
> +		__entry->type, __entry->host, __entry->seq, __entry->flags, __entry->status)
> +);
> +
> +DEFINE_EVENT(ti_sci_hdr_event_class,
> +	ti_sci_xfer_begin,
> +	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
> +	TP_ARGS(hdr, status)
> +);
> +
> +DEFINE_EVENT(ti_sci_hdr_event_class,
> +	ti_sci_rx_callback,
> +	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
> +	TP_ARGS(hdr, status)
> +);
> +
> +DEFINE_EVENT(ti_sci_hdr_event_class,
> +	ti_sci_xfer_end,
> +	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
> +	TP_ARGS(hdr, status)
> +);
> +
> +
> +TRACE_EVENT(ti_sci_msg_dump,
> +	TP_PROTO(struct ti_sci_msg_hdr *hdr, struct ti_sci_xfer *xfer),
> +	TP_ARGS(hdr, xfer),
> +
> +	TP_STRUCT__entry(
> +		__field(u16, type)
> +		__field(u8, host)
> +		__field(u8, seq)
> +		__field(u32, flags)
> +		__field(size_t, len)
> +		__dynamic_array(unsigned char, cmd, xfer->rx_len)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->type = hdr->type;
> +		__entry->host = hdr->host;
> +		__entry->seq = hdr->seq;
> +		__entry->flags = hdr->flags;
> +		__entry->len = xfer->rx_len;
> +		memcpy(__get_dynamic_array(cmd), xfer->xfer_buf, __entry->len);
> +	),
> +
> +	TP_printk("type=%04X host=%02X seq=%02X flags=%08X data=%s",
> +		__entry->type, __entry->host, __entry->seq, __entry->flags,
> +		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
> +);
> +#endif /* _TRACE_TI_SCI_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE ti_sci_trace
> +#include <trace/define_trace.h>
> 


