Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97403C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I4N8gzh34TI4s9xtonIahAOEOyG3JFBd/5w0IEWxzdw=; b=v6nwHPjKcl0lJStWK8pdqMOEYH
	w02IV9Kn92nBWoxQzNCles7vCGHTnciXPjKGEqzDpYgGi3PczJb4nyueSqclLJSfgvCfUvDbZ01nr
	J+N/VzKz7hVtT8D3IRPQBe1R5Kqx46TiAefMg6P2PzM9KdHD2YDe4PgYGfxmh9318RzGHzoJb11DF
	v6oRT/t+YgNOOmbu1xjHA/hnQFu/J5eiJHh5o6/h5p+OI5w6MwFTbKF59GoW4O/BqNbUwkiNXSjso
	g1Fc6Oea301Vu6d5f1UW1m/Afe/IUK5kqUz6Vqhhz7DR+LpI9HciVxj+gEUbnL9rNOJGgMXz1QME0
	uGFQzsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztrz-00000005a5W-1lfS;
	Fri, 28 Aug 2026 10:31:36 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztrw-00000005a48-2Oq2;
	Fri, 28 Aug 2026 10:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I4
	N8gzh34TI4s9xtonIahAOEOyG3JFBd/5w0IEWxzdw=; b=ctmxte7VTqPZfHLDUH
	qSPlOfreNlz3vxDreQ9CQ7w4dognsWsVp83ezPsYhkSNh4aF3tvtRLKwfkaLP37t
	+LvNB1+AjJRcyctC4dkIQrHrkWNAMhJ30eyhcgs58+GBAaHN2pSbM9DSX7ZdT89C
	53RzD6hQpvLn+zhaQPjjvQhSM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnfhtxY5FqOxmtOg--.5497S2;
	Fri, 28 Aug 2026 18:31:13 +0800 (CST)
From: oushixiong1025@163.com
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] usb: mtu3: fix double dereference in mtu3_log_ep trace event
Date: Fri, 28 Aug 2026 18:31:10 +0800
Message-Id: <20260828103110.893817-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnfhtxY5FqOxmtOg--.5497S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw15CFyxXr1kWFW5Wr4Durg_yoW5Gr1fpa
	yfuF9rKF4ktwsFvF4kZ34FyFZ0vrWFvFyrKryxu3s5Z3WS9FnxtFs7tryF9ryqkrWrCFy7
	JF1qkryrX3Wj937anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKXd8UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-hHzA2qRY3FYVQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_033133_045308_569BFBA7 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Shixiong Ou <oushixiong@kylinos.cn>

TP_printk() dereferences the gpd_ring pointer stored in the entry
via &__entry->gpd_ring->dma, which may point to freed memory when
the trace record is read later. Store the dma address in the entry
and print that instead.

This is detected at boot:

  TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
  ------------[ cut here ]------------
  Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
  WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x138/0x140, CPU#0: swapper/0/0
  Call trace:
   test_double_dereference+0x138/0x140 (P)
   trace_event_raw_init+0x350/0x5b8
   event_init+0x38/0xb0
   trace_event_init+0xf4/0x5c8
   trace_init+0x30/0x6b8
   start_kernel+0x4a4/0x8d8
   __primary_switched+0x88/0x98
  TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
  TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d635..041e730c88a6 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t, gpd_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_dma = mep->gpd_ring.dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, &__entry->gpd_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
-- 
2.25.1

No virus found
		Checked by Hillstone Network AntiVirus


