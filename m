Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBDDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOKYRCw54rTmlJbeP91fGLk+vpGUvA0hvgwiBiK9J8U=; b=dAV9smCdYtcfaOV92gcdmAOc5S
	iAUWSaMhWT5qyRufFtf5KCPzVaN468pWRce3Nam49T2yMK3e9jthUsn/74Qj48rikIqMcIWsGprPh
	9KHnYEyTntAaNQzdajGig5/ANq3TIM8i6ZiEQLiKkTCL6CgYk8ptdRpgLVnWVgNhGZTVN8Sc+efmp
	+j2SqhSqNwu8mAn7gE92wNV01+tiE2eEwmLdCFtpKEiCVo0tf9MZAFnZTi2EG9ef7kucDlwwwvD6F
	KcFUnG/CPw17RuM5oCqGv5TYXfLloOu4J5rJcp1k/BezqKRdfzunShSs+vVf2SOhhTByV4Bhq+voF
	S9UYcv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40FH-00000009wQb-1kuX;
	Tue, 08 Sep 2026 18:08:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40FG-00000009wQ4-29RD;
	Tue, 08 Sep 2026 18:08:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 231584091A;
	Tue,  8 Sep 2026 18:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0724E1F00A3A;
	Tue,  8 Sep 2026 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890914;
	bh=vOKYRCw54rTmlJbeP91fGLk+vpGUvA0hvgwiBiK9J8U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=dFWN4L0Wa240iNqj9HLS/cbcF5ztCdRLp1LHs6WPSl354OvwVdj99OQGMShaO5CtV
	 5LQ3VPQTV0gn5B8o8IHNbrB6NimrIC/7uWa5OvXWSztzbMQOcSCcp85PS7qUla1H+s
	 +IWO6SgtxCqlHV57zWLg7YIrZNIaqTAtlQSLHBhLubvA99X5s8ayG0lldcpihYnA0y
	 pFcO0WQD4rloUxcVXeujgJfjnJg292ZYuMUwKwKIrImKD70bsAcXhRhdUoJ5xZryA+
	 2ZZT8OjlhTn5SpDliYWgxc7+/JWCui6iPTJGxNBrRoh9Q8X+0K3mIzoEzvpvbc+Ecc
	 U3A9yZMjE1A6g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C39C8CE1902; Tue,  8 Sep 2026 11:08:33 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:08:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rostedt@goodmis.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
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

On Mon, Sep 07, 2026 at 02:28:47PM +0100, Vladimir Murzin wrote:
> On 9/4/26 00:59, Paul E. McKenney wrote:
> > This is more bug report than patch, but this patch does suppress the
> > splat, so there is that.  ;-)
> > 
> > Kernels built with either KASAN or KCSAN produce this splat:
> > 
> 
> I see it on kernel w/o KASAN or KCSAN. IIUC, this is new check introduced
> by b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer in TP_printk()")
> so adding Steven :)
> 
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
> > Apparently, the code should instead create another entry in
> > TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> > of TP_printk().  But simply removing the offending double indirection
> > in TP_printk() gets this splat out of the way of other debugging.
> 
> Indeed, splat has gone after applying the patch.
> 
> Thanks
> Vladimir

Does this less hacky patch do the trick?

							Thanx, Paul

------------------------------------------------------------------------

commit afda2321e6e93a5bcc28bfb4717fbc3a1768446c
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Sep 3 16:48:09 2026 -0700

    EXP drivers/usb/mtu3: Work around mtu3_log_ep double-indirection issue
    
    Kernels built with either KASAN or KCSAN produce this splat:
    
    [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
    [    0.000000] ------------[ cut here ]------------
    [    0.000000] Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
    [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x144/0x14c, CPU#0: swapper/0/0
    [    0.000000] Modules linked in:
    [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1 #15247 PREEMPT
    [    0.000000] Hardware name: linux,dummy-virt (DT)
    [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    [    0.000000] pc : test_double_dereference+0x144/0x14c
    [    0.000000] lr : test_double_dereference+0x144/0x14c
    [    0.000000] sp : ffffc80aa7633bf0
    [    0.000000] x29: ffffc80aa7633bf0 x28: ffffc80aa7c0f047 x27: 000508b58019388f
    [    0.000000] x26: 0000000000000003 x25: 0000000000000007 x24: ffffc80aa5fceff8
    [    0.000000] x23: ffffc80aa7c0f05a x22: ffffc80aa64edfe8 x21: ffffc80aa7c0fce8
    [    0.000000] x20: ffffc80aa7c0f047 x19: 0000000000000013 x18: 0000000000000001
    [    0.000000] x17: 6572656420656c62 x16: 756f642073616820 x15: 746c61685f746573
    [    0.000000] x14: 0000000000000000 x13: ffff000139d90000 x12: 0000000000000045
    [    0.000000] x11: 00000000000000cf x10: ffff00013f546428 x9 : ffff000139d90000
    [    0.000000] x8 : 3fffffffffffc000 x7 : 0000000000000001 x6 : 0000000000000001
    [    0.000000] x5 : ffff00013f4e6440 x4 : 0000000000000000 x3 : 0000000000000000
    [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc80aa764a700
    [    0.000000] Call trace:
    [    0.000000]  test_double_dereference+0x144/0x14c (P)
    [    0.000000]  trace_event_raw_init+0x37c/0x5d8
    [    0.000000]  event_init+0x34/0xc0
    [    0.000000]  trace_event_init+0xec/0x588
    [    0.000000]  trace_init+0x24/0x6e0
    [    0.000000]  start_kernel+0x4a0/0x8ec
    [    0.000000]  __primary_switched+0x88/0x90
    [    0.000000] irq event stamp: 0
    [    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
    [    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
    [    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
    [    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
    [    0.000000] ---[ end trace 0000000000000000 ]---
    [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
    [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma
    
    Therefore, work around this restriction by creating another entry in
    TP_STRUCT__entry(), and do the double-indirection TP_fast_assign()
    instead of TP_printk().
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Cc: <linux-usb@vger.kernel.org>
    Cc: <linux-arm-kernel@lists.infradead.org>
    Cc: <linux-mediatek@lists.infradead.org>

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d63561..6477ad3ddc66f6 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t *, gpd_ring_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_ring_dma = &mep->gpd_ring->dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, __entry->gpd_ring_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

