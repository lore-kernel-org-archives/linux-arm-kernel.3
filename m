Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A717CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c45RCiZFnpvIRIApUW8GP2qBnj9FSWOECr9ZirFB7BY=; b=3mjFMHqs9xycYdKEuuwNCOnqqa
	uDa7TX+/n81GP1TqsZr2VY13H2YYsjfKCJFDGhKyTUHR9a9wcZa68BCgE2Hq0stfWLMeVzlwwzlKd
	6Qk1DzRLtwEahdREnw6CoHucXkW69p5ct2vAttJ38JqgFwxRKEf45dMKK0IK1FEcbwxgYP+lBxR4B
	j+XehccuvLBxR8zwgKZ/v+l1zH3Yx/1sG9pc3oyocAUjPDXN7c7lRNe0ys+ToKINFyERUriGkSv8s
	SMD/ZnI1lbr7osDlI2xHEzSLMfUxqVWpb3A95Chmo3vgdI8UDkDW5JYgSS9rBK8sSZX5uGrh/NSUK
	YGHi4i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFyO-00000001IsV-3mbW;
	Mon, 28 Sep 2026 18:21:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFyN-00000001IsE-11rI;
	Mon, 28 Sep 2026 18:21:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE1BF600E2;
	Mon, 28 Sep 2026 18:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2071F000FF;
	Mon, 28 Sep 2026 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790619666;
	bh=c45RCiZFnpvIRIApUW8GP2qBnj9FSWOECr9ZirFB7BY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=jnGBehApRnp2zUzBcxAhucOVsXYejV9U9aAaHeA4OAN0/hqqLC/54hDmJ9EemU7y7
	 eWsMelFCW3E0bWLJ0JNlODXbnGZtwH1JW7dJvTLdwCezVDmh4cSZP7SMlS70rF5YAL
	 LxIGecBHfP8A1U8JG9F0SNfjJTXLpDBGP2T3V9Gb6H0Xhz+J2vEMHm6CIRxfYqb1HQ
	 3w/xwflut2yQ5gzl4FGbzJbpI4cosUAKFEGtkinGfKkANqjGscY7Mh/yBw4GsaUOBU
	 5XsYkIWBrpRPlkAMxOAjMsW2NazfFlaqqcS/A5UIBqdhZD7WWfmxArnh2UC8Q0L1VS
	 JGApbadXzpvRA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1AEDCCE0832; Mon, 28 Sep 2026 11:21:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:21:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	rostedt@goodmis.org, mark.rutland@arm.com
Subject: Re: [PATCH] usb: mtu3: Fix double dereference in TP_printk
Message-ID: <315259c9-d7b9-44bc-8896-ecb9429a6eb5@paulmck-laptop>
References: <20260922103756.104846-1-vladimir.murzin@arm.com>
 <845ef1a3-8d85-4007-aa2c-05e59e79afcd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <845ef1a3-8d85-4007-aa2c-05e59e79afcd@arm.com>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 28, 2026 at 02:11:42PM +0100, Vladimir Murzin wrote:
> Hi All,
> 
> Gentle ping... spat is still present in v7.3-rc5

If no one else wants to push it, I can do so.  I gotta admit that the
resulting test failures when I forget to apply it are a bit annoying.  ;-)

							Thanx, Paul

> Cheers
> Vladimir
> 
> On 9/22/26 11:37, Vladimir Murzin wrote:
> > Paul reported kernel splat:
> > 
> > [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> > [    0.000000] ------------[ cut here ]------------
> > [    0.000000] Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> > [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x144/0x14c, CPU#0: swapper/0/0
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1 #15247 PREEMPT
> > [    0.000000] Hardware name: linux,dummy-virt (DT)
> > [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    0.000000] pc : test_double_dereference+0x144/0x14c
> > [    0.000000] lr : test_double_dereference+0x144/0x14c
> > [    0.000000] sp : ffffc80aa7633bf0
> > [    0.000000] x29: ffffc80aa7633bf0 x28: ffffc80aa7c0f047 x27: 000508b58019388f
> > [    0.000000] x26: 0000000000000003 x25: 0000000000000007 x24: ffffc80aa5fceff8
> > [    0.000000] x23: ffffc80aa7c0f05a x22: ffffc80aa64edfe8 x21: ffffc80aa7c0fce8
> > [    0.000000] x20: ffffc80aa7c0f047 x19: 0000000000000013 x18: 0000000000000001
> > [    0.000000] x17: 6572656420656c62 x16: 756f642073616820 x15: 746c61685f746573
> > [    0.000000] x14: 0000000000000000 x13: ffff000139d90000 x12: 0000000000000045
> > [    0.000000] x11: 00000000000000cf x10: ffff00013f546428 x9 : ffff000139d90000
> > [    0.000000] x8 : 3fffffffffffc000 x7 : 0000000000000001 x6 : 0000000000000001
> > [    0.000000] x5 : ffff00013f4e6440 x4 : 0000000000000000 x3 : 0000000000000000
> > [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc80aa764a700
> > [    0.000000] Call trace:
> > [    0.000000]  test_double_dereference+0x144/0x14c (P)
> > [    0.000000]  trace_event_raw_init+0x37c/0x5d8
> > [    0.000000]  event_init+0x34/0xc0
> > [    0.000000]  trace_event_init+0xec/0x588
> > [    0.000000]  trace_init+0x24/0x6e0
> > [    0.000000]  start_kernel+0x4a0/0x8ec
> > [    0.000000]  __primary_switched+0x88/0x90
> > [    0.000000] irq event stamp: 0
> > [    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> > [    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
> > [    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> > [    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
> > [    0.000000] ---[ end trace 0000000000000000 ]---
> > [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
> > [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma
> > 
> > Which also observed by Mark and myself.
> > 
> > The splat it result of new check introduced by b5cc230af5e5 ("tracing:
> > Warn when an event dereferences a pointer in TP_printk()") which
> > correctly catches issue with %pad dereferencing the address saved in
> > the ring buffer. TP_fast_assign() logic gets executed when the
> > tracepoint is triggered, however the TP_printk() is executed when the
> > user reads the trace buffer which could be seconds, minutes, hours,
> > days, even months later and nothing guarantee that __entry->gpd_ring
> > pointer will still be pointing to what it was when it was recorded.
> > 
> > Fix the issue by capturing immediate value of gpd_ring.dma when trace
> > point is triggered.
> > 
> > Reported-by: Paul E. McKenney <paulmck@kernel.org>
> > Tested-by: Mark Rutland <mark.rutland@arm.com>
> > Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> > Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> > ---
> >  drivers/usb/mtu3/mtu3_trace.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > index 89870175d635..9aaa167d69c1 100644
> > --- a/drivers/usb/mtu3/mtu3_trace.h
> > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__field(unsigned int, flags)
> >  		__field(unsigned int, direction)
> >  		__field(struct mtu3_gpd_ring *, gpd_ring)
> > +		__field(dma_addr_t, gpd_ring_dma)
> >  	),
> >  	TP_fast_assign(
> >  		__assign_str(name);
> > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__entry->flags = mep->flags;
> >  		__entry->direction = mep->is_in;
> >  		__entry->gpd_ring = &mep->gpd_ring;
> > +		__entry->gpd_ring_dma = mep->gpd_ring.dma
> >  	),
> >  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> >  		__get_str(name), usb_ep_type_string(__entry->type),
> >  		__entry->maxp, __entry->slot,
> >  		__entry->mult, __entry->maxburst,
> > -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> > +		__entry->gpd_ring, &__entry->gpd_ring_dma,
> >  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> > -- 2.34.1
> > 
> 

