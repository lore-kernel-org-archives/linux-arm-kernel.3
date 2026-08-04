Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61AFC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=KZ7812YrouTaGKtnZrRRlTGtZhtVMD2AeJWLFgwrtg0=; b=v+pBmhYXPZvYXJGhz87WRZBgfx
	T1VIRULyS5+mWdl+3RBnpDXPjhManpHO4P51uxv83gzD/hTs6NOmJWtHelxbiegtuw9oKHo2dKOT0
	CtZhSHLAaOK4hiVkZpQuLzCELioqFxCfyuP0Vy7b3pZaf+Gt80IHyiZpoEhXepaGUzzEJUf9YiOHC
	NGAabH87VDIj8RRw1dOzpPKm5hEnis42BZb9rkJnZC9O/QS/fAvy6SqBE9vteRKZxvALoxs+vgN5D
	QUwvSGH2LizX34ZHdiEIPqvxUvfAUKfO1smvtWPtjkgJmDTSqfS2GCduk1QgX2kag9lg9BWXuYZ8j
	kFL6g6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC1t-00000001Ux2-3BnD;
	Tue, 04 Aug 2026 10:05:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC1r-00000001UwG-0DNX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 10:05:49 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260804100540euoutp0120722c0882bb1b743f86573cc4775951~IkiUh326Z1924919249euoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 10:05:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260804100540euoutp0120722c0882bb1b743f86573cc4775951~IkiUh326Z1924919249euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785837940;
	bh=KZ7812YrouTaGKtnZrRRlTGtZhtVMD2AeJWLFgwrtg0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=W9pMlmYIb9bMkRu4jfc8clgyQCFq19x84t+o1f4NNVFPNzppRlZfYm/Am//yXRobf
	 x9kobMvqpbC40iYmNByaNhNsQ9BRZb/wIs6elgt/V8N+y/3vHg7FqvqQGKBEYYvQfV
	 TVkrr7vDCeqxCNyFlCNeF2wekj6FmFNO16Y2jVcg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3~IkiUU8B6_3251632516eucas1p2x;
	Tue,  4 Aug 2026 10:05:40 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260804100539eusmtip249c88d331150984ce7acdc66a99b9818~IkiT6smw23264332643eusmtip2G;
	Tue,  4 Aug 2026 10:05:39 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Date: Tue,  4 Aug 2026 12:05:30 +0200
Message-ID: <20260804100531.88576-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
X-EPHeader: CA
X-CMS-RootMailID: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_030547_575054_3FD90F14 
X-CRM114-Status: GOOD (  12.94  )
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

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") added a warning then printing an event dereferences
a pointer, because it might be already freed that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing also the DMA address in the event structure to avoid
dereferencing gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d635..b24c6411a8cf 100644
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
2.43.0


