Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529F3C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3UMlmb6jwrXPI5NV1LH+6xMKzIQ9GQZGYpCbr9qZdw=; b=jxhnOxqKjDkQzJFtj12USZWu0Y
	2WKbgGZUtW6/Y4ssDbMODWRQFJ9vO04jEhhLu48/H6LbWzuL6UfTlEA5V1re5IDotYc2KiZO6W62B
	tcEZisZahGk8I7DJTTDsdXwcqAWjFP+tm5EjaDM1cJ7EcBnjDfkacGSuH1CSmLlSxfk/2Vt+bQ865
	iRHWG+BSkR2FuCpW3DPXVIs6y49MboN3H4Oj4nrOzuK2CIb+ryiJftC1tjj2psp1VKLnwbfhH3GQJ
	5i8INoQTET1V1yszJdyiYUekugrRDuzKjnWgXjRtWy4ZAJgDAkYd/QT6+ex8oGlvPCNGuxGVNzPzA
	kQpEHIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2HKr-00000000n4A-0onZ;
	Thu, 03 Sep 2026 23:59:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2HKp-00000000n3s-0hCo;
	Thu, 03 Sep 2026 23:59:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88C70411FD;
	Thu,  3 Sep 2026 23:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAC91F000E9;
	Thu,  3 Sep 2026 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788479950;
	bh=w3UMlmb6jwrXPI5NV1LH+6xMKzIQ9GQZGYpCbr9qZdw=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=btcvT93i86aW8sr/GL24t8KC62MNU8DBCLJ9ABJv5Ncz+3YOI3eHoOFHBpsE/KdH3
	 d/+maGXKqXu3sFta2dg8kQ3rZlKt7Pn8nYtQKX2ulXIFTXzh18C176R9MiQzOD+Zqu
	 BeyTvwvCJs2wZkRC+OIw7XvObHY+d/EcPCEV3tHaCFVh5v7hkxMrn3ZxPZv9fu86SB
	 WNFN+Doj6KCc9v9k7c5N8/P8xnAqfRJthnNnMuTfm15DFxjsVLJi5bpM9Z/1209FWz
	 zsSAH5O/Q+2lXlvmwoZr+6UGoU5PV9I9M4uL1uvOIlZVNVrd2NBglXpC6YV/Dn8T4n
	 xA7kM7aSEEpqA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2F989CE090A; Thu,  3 Sep 2026 16:59:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:59:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This is more bug report than patch, but this patch does suppress the
splat, so there is that.  ;-)

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

Apparently, the code should instead create another entry in
TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
of TP_printk().  But simply removing the offending double indirection
in TP_printk() gets this splat out of the way of other debugging.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-mediatek@lists.infradead.org>

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d63561..7c414e196d5871 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -236,11 +236,11 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
 	),
-	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
+	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

