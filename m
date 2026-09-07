Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2377C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBVf7GNwiAue4dehfynxHKxKXcAJS2MErbg19828qsg=; b=i6WMqUbS3ErseDKiv1Za+3w/H2
	SjJq1C5esus/bKtWJa4bDUjoaa6GJqbIgQV9q95LfxZl5+Gd84w3vemj8ASdvJoFjyec+r2eKzuos
	UrnGjT+zMjBzceybcZG76sx9JwYuKQ0DlP1/4N3FV58UdWEAAsvnPBVSR9MmjJ4CB9ZB+SbeW795G
	SILKjbcq3pDajurpmzzRNenlbQCkJ7ZVQ77R0rfnCdmifoCQxLYyEnC/eXVJdnTMueb5h+P4e9ynO
	85MK22YnQtWB4A8XZFs60+4bvGPo6FovOS+wHVLGSBxKnyrHtLp/WeWuuZI6SK8YX/ELJ3rUE0FX8
	sdOh/a8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZP7-00000006wOG-1LEr;
	Mon, 07 Sep 2026 13:28:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZP4-00000006wNh-1wX1;
	Mon, 07 Sep 2026 13:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49641476;
	Mon,  7 Sep 2026 06:28:47 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893583F7D8;
	Mon,  7 Sep 2026 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788787731; bh=Q43zjFngUH4CVRm0yM8HzVAnPDiw5923YGyUdTIL2X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDqy+gXdsbWjQJPd91C1nM1zZ+xgWeS11WliE9Osu1N/a3Fjgd/2p2Xx/8MhgRZLR
	 ucE++QR5nAlr8Qq4g07e9u7HQKvsSBNE2oaru/6qRuQM+o3PTaTePwbVhyW9QXlP4A
	 f0nPXWjg8bGVTYGo8ofymc0I7B9rALdmwVs+EelI=
Message-ID: <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
Date: Mon, 7 Sep 2026 14:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
To: paulmck@kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rostedt@goodmis.org
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062854_581270_AA92DCE9 
X-CRM114-Status: GOOD (  16.61  )
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

On 9/4/26 00:59, Paul E. McKenney wrote:
> This is more bug report than patch, but this patch does suppress the
> splat, so there is that.  ;-)
> 
> Kernels built with either KASAN or KCSAN produce this splat:
> 

I see it on kernel w/o KASAN or KCSAN. IIUC, this is new check introduced
by b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer in TP_printk()")
so adding Steven :)

> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x144/0x14c, CPU#0: swapper/0/0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1 #15247 PREEMPT
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : test_double_dereference+0x144/0x14c
> [    0.000000] lr : test_double_dereference+0x144/0x14c
> [    0.000000] sp : ffffc80aa7633bf0
> [    0.000000] x29: ffffc80aa7633bf0 x28: ffffc80aa7c0f047 x27: 000508b58019388f
> [    0.000000] x26: 0000000000000003 x25: 0000000000000007 x24: ffffc80aa5fceff8
> [    0.000000] x23: ffffc80aa7c0f05a x22: ffffc80aa64edfe8 x21: ffffc80aa7c0fce8
> [    0.000000] x20: ffffc80aa7c0f047 x19: 0000000000000013 x18: 0000000000000001
> [    0.000000] x17: 6572656420656c62 x16: 756f642073616820 x15: 746c61685f746573
> [    0.000000] x14: 0000000000000000 x13: ffff000139d90000 x12: 0000000000000045
> [    0.000000] x11: 00000000000000cf x10: ffff00013f546428 x9 : ffff000139d90000
> [    0.000000] x8 : 3fffffffffffc000 x7 : 0000000000000001 x6 : 0000000000000001
> [    0.000000] x5 : ffff00013f4e6440 x4 : 0000000000000000 x3 : 0000000000000000
> [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc80aa764a700
> [    0.000000] Call trace:
> [    0.000000]  test_double_dereference+0x144/0x14c (P)
> [    0.000000]  trace_event_raw_init+0x37c/0x5d8
> [    0.000000]  event_init+0x34/0xc0
> [    0.000000]  trace_event_init+0xec/0x588
> [    0.000000]  trace_init+0x24/0x6e0
> [    0.000000]  start_kernel+0x4a0/0x8ec
> [    0.000000]  __primary_switched+0x88/0x90
> [    0.000000] irq event stamp: 0
> [    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma
> 
> Apparently, the code should instead create another entry in
> TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> of TP_printk().  But simply removing the offending double indirection
> in TP_printk() gets this splat out of the way of other debugging.
> 

Indeed, splat has gone after applying the patch.

Thanks
Vladimir

> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-usb@vger.kernel.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <linux-mediatek@lists.infradead.org>
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d63561..7c414e196d5871 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -236,11 +236,11 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
>  	),
> -	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> +	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p flags %c:%c%c%c:%c",
>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring,
>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> 


