Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68B8C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=9PIL/kPnMxq3P5cVAkbNzmiNq+J34/FFMbTiuCsg88Q=; b=4OPkybicw94B6M5/Hzgp6K1yaj
	DXEdbzK57DjKD/axrq31IXUf+jF1Bl5zxZDG+ZqgHlrk5cl+bI7WsowA3SoBbMdkhal7CUcPMAA2m
	pve7be02NwDYJvBszWiPM0lddYNKaIFMGpAS8h6UPzyx2HTFDpKpKqe9V6iHv0oc694zW3TDNNJ90
	gFUOve38B7y9AlYfJgPG9+o+itiWRq4SLHXqxA0uLl+hTg5mWR6Oj2f6SJ0I1npYKaR0a8MKvitJS
	TKCCxrugDp30SugneH9WtuuZ1I5BywdY6z6TpaIOY7bElayALS2kfwL85YoDjMgEU2J7CamFRpx5F
	YC5kEXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PQ7-00000001OUb-0ZwN;
	Fri, 04 Sep 2026 08:37:11 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PQ2-00000001ORg-0XD7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:37:10 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904083658euoutp02ba63dfbde58576e7d6c74e73f1dbfe5f~SEUuMiQ392265122651euoutp02M
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 08:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904083658euoutp02ba63dfbde58576e7d6c74e73f1dbfe5f~SEUuMiQ392265122651euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788511018;
	bh=9PIL/kPnMxq3P5cVAkbNzmiNq+J34/FFMbTiuCsg88Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OcL5ju4AonUTzK9Ge087FQnJstUcn0MPleQ4C5m1FRsL1xv6MKilFPklLZISGAADY
	 4gpQaeGD9E+gXstRDv42+nA4MUmPAU/kNIF7+fyCbT8qb+cNsZM6wa/Nkp/BfymUcQ
	 yxul+lYmgUZ5emXDZtoZ8dRXV7mfKcON9pdTTr7s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea~SEUt8Oz_y2337323373eucas1p1w;
	Fri,  4 Sep 2026 08:36:57 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260904083657eusmtip28ebc646c943dfc2d88fd5b5d1282e30b~SEUtgfgC_1075010750eusmtip2c;
	Fri,  4 Sep 2026 08:36:57 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2] USB: mtu3: tracing: fix pointers dereferencing
Date: Fri,  4 Sep 2026 10:36:43 +0200
Message-ID: <20260904083644.2010063-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
X-EPHeader: CA
X-CMS-RootMailID: 20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea
References: <CGME20260904083657eucas1p18056c0eacd7ba79401c8fb11150954ea@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_013706_755349_DC53421D 
X-CRM114-Status: GOOD (  12.66  )
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
in TP_printk()") added a warning when printing an event dereferences
a pointer, because it might be already freed at that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing the DMA address in the event structure to avoid dereferencing
gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- fixed typos in commit description

v1: https://lore.kernel.org/all/20260804100531.88576-1-m.szyprowski@samsung.com/
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


