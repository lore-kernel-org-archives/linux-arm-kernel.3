Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69089CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFOBGkbyLEsT8oHbnv3Tx7r5hqOModam36oOeO/AXUQ=; b=TC4JxCUnse82uZIgOwMAWoy4me
	3cC0dCQuowTZieMJkOThtGouXmh3wRG/b8OjlZyGtS/ErCdasSZX4X9pcCklfFBonWGnRr9NwvPq2
	Wb1WAB4qTVGgslaKu2r7ZzeIPuoOVwRbowkdmwmsa7fMhkhvXT0XcyQoS9baXsoXUv0ug0x+wMtj0
	0xZdxa4cXawBKXyfOstdo/4e/bRsJzTTHzPTa8fRpq208vJ3+HMDozXgS0xczcukjijqYQ+bb3Oi9
	xroZuogzwJTQw2LNUPWGqwFz7wvqwzx/AoSUPtWbWcBP2V7FeN5QQ0L+TBua+yj4ajDLd7t9tBsGd
	QUUfN2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBB9N-00000000cvP-1si3;
	Mon, 28 Sep 2026 13:12:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBB9L-00000000cux-1iAP;
	Mon, 28 Sep 2026 13:12:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 533E31655;
	Mon, 28 Sep 2026 06:12:00 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE63B3F763;
	Mon, 28 Sep 2026 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790601123; bh=qARXK5luvst6TAFL4jAEw2OrBYm6ac8q5l9d2gaTyoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=METk7VeL7FwsyTZ8S6FYEwMaMolu9SL5gg4JMZJsCAms92flWQLNTO0HCiIMZ6cfw
	 qXRx0RjbLUZdADGQpCoYLhb8BCNpJ0xcQFrbQ/jqAgP2/WoFXV2uaPsd8MpcvdyxML
	 mmDDNJ6/WsrqTFMR7q06quekokzYF9NS/iDNscJ0=
Message-ID: <845ef1a3-8d85-4007-aa2c-05e59e79afcd@arm.com>
Date: Mon, 28 Sep 2026 14:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: mtu3: Fix double dereference in TP_printk
To: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, rostedt@goodmis.org, paulmck@kernel.org,
 mark.rutland@arm.com
References: <20260922103756.104846-1-vladimir.murzin@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260922103756.104846-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_061207_551763_082CE744 
X-CRM114-Status: GOOD (  20.38  )
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

Hi All,

Gentle ping... spat is still present in v7.3-rc5

Cheers
Vladimir

On 9/22/26 11:37, Vladimir Murzin wrote:
> Paul reported kernel splat:
> 
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
> Which also observed by Mark and myself.
> 
> The splat it result of new check introduced by b5cc230af5e5 ("tracing:
> Warn when an event dereferences a pointer in TP_printk()") which
> correctly catches issue with %pad dereferencing the address saved in
> the ring buffer. TP_fast_assign() logic gets executed when the
> tracepoint is triggered, however the TP_printk() is executed when the
> user reads the trace buffer which could be seconds, minutes, hours,
> days, even months later and nothing guarantee that __entry->gpd_ring
> pointer will still be pointing to what it was when it was recorded.
> 
> Fix the issue by capturing immediate value of gpd_ring.dma when trace
> point is triggered.
> 
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  drivers/usb/mtu3/mtu3_trace.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d635..9aaa167d69c1 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__field(unsigned int, flags)
>  		__field(unsigned int, direction)
>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> +		__field(dma_addr_t, gpd_ring_dma)
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->flags = mep->flags;
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
> +		__entry->gpd_ring_dma = mep->gpd_ring.dma
>  	),
>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring, &__entry->gpd_ring_dma,
>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> -- 2.34.1
> 


