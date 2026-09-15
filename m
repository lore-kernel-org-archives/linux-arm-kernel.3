Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4570CC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nx6kcC6T/CBVAANjLTqKgoQ+eAsQB2eLKb2QMIhX71s=; b=Rrh4DLVL8Di57ovWBLzrUrxF/Q
	SZJiO+0NJ6CEmPitzA32eE3mR4FD8FbICUlkp4jO0W4zoX+0f/+PUqJO4xACOGDgURrvsBlaBt6s5
	SEKk2lhWfnbnFTO8TP3vOcmF3BKE6Ps4g8ZWQKC0Kdvt66eRtf2uigAHOhw2Jy+I2IWP6l513saRR
	Z2Ar5Fx02YE5y3JmlKMjz9Wbm31cKSI3OVLjqSSUe8RhYmzyB3YX/6rTL+t3Mr1IbbvhzDG945kqH
	hSLCtEW0KdyfxhIehDBspd4uLf9HhlthNpFfRJDnJSDFl1PgQQvIasH0vMgF72ADeEUHf3oGLxTeq
	pw4JoTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UFg-00000006xNV-0REi;
	Tue, 15 Sep 2026 14:35:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UFd-00000006xLH-1Tzb;
	Tue, 15 Sep 2026 14:35:15 +0000
Date: Tue, 15 Sep 2026 16:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789482907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nx6kcC6T/CBVAANjLTqKgoQ+eAsQB2eLKb2QMIhX71s=;
	b=Pd2chXqNhfsyyVA3mOANEDBu9rqAg4YRHmcXYXsF0c4N+xgXGjBMRtOxvexqWTsTWV6fNu
	AMrYAUjBtwWQr2PTi1rWjlzwFRrwzdPDvzUqT6RrFw8W2GZHtcxXO7PHeTkir/pV0oEhfB
	Wbpow+EKBTdMZ/OkKRt7gpRMjA52jptVf+1nCowPtD+GtZaw53Da5QCAhUCET8S+vITRe9
	WM4rAxdi+NDgu0CpGpMDHQRyR+VjECQKnQpk8P4OHDxzW+1RM8IZGqKNyN6UhtHri79Z7e
	cfKvfGuE7JCxw8XNS6GWANfmQ2HnmHjZfaLhxy6idvt5k3cB5MLkBKNN6xPlzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789482907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nx6kcC6T/CBVAANjLTqKgoQ+eAsQB2eLKb2QMIhX71s=;
	b=Oy1d0P9ZSJtaxieXglY3zjfYX+QGJbzbbquBiZtTVGpnwXJN8xVBK3sMp1awtGq0sUNvq1
	YOVi3G6CqdIfHWBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 REPOST] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260915143505.k5Mxo7_J@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_073513_569108_AE4B950C 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") added a warning when printing an event dereferences
a pointer, because it might be already freed at that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing the DMA address in the event structure to avoid dereferencing
gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Could this please be routed via the USB tree?

v3:
  - Repost

v2: https://lore.kernel.org/20260904083644.2010063-1-m.szyprowski@samsung.com
- fixed typos in commit description

v1: https://lore.kernel.org/all/20260804100531.88576-1-m.szyprowski@samsung.com/

 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d6356..b24c6411a8cf1 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t, gpd_ring_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_ring_dma = __entry->gpd_ring->dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, &__entry->gpd_ring_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
-- 
2.55.0


