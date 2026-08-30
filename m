Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAD3C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2b4O68VJX50eh/Oyo7GA/gZ7ieGUICKFvMS2Pjg1aM=; b=yod80X8QL1KO4/Lj1mUrEtE3B7
	1ua7PNwFaREbXMm0C6/1Kk4JPV5JM9pCE5RE2wC/xixmOaDaoOEKcb2dmzD5TxCG+87tb9Jhya826
	EVhF0NsPC1YtycnnOwSeZOxxvyaih7rvox35w9vBNatXIqRIfdwmCCbFaRPNMOKnRFqS9zyNWKDPV
	lpIPDw53AmdpVo2t6vuzVlnE3rKe/RoUjEa/WJ3Z2JEDjpAE5XGohG56LuwuL0KBnyamPvGk4iXDv
	9fFsaOQ0ITUW10N92qg+PoBTjxcZrwoGj2CWfbA4uP06d87UBkkzJSQTR+h5ZS0dbgOSrDefc7We5
	bAuVIjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0L-000000082y1-0PcH;
	Sun, 30 Aug 2026 20:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0H-000000082pU-1TVp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8A3644519;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89811C4AF1C;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=bjN1NTiSvc6/6RtUd8MUWugBmdf1TrTNf6e7OfieaZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sBxHG/y7+E6JC7LuaiPSJ3+NeCFvwKHwGCYuO2NElXJW51LmYeeI2VWtc+Wxd/s1w
	 lrsePCkLTtOaHx/zK3tmlDyY8IJnsyEcIhDxi1rFm6tY90GEgg29s46bAWW0QMj8Fx
	 JFgssiWQ0Hm3o6o1Dq41kpj9WUPXqMJz8uv22C25lzOCOAEGSDh9BnDCY2XhNV+7K3
	 +x6RdT4WEhTM5S2pleBs1xoS8UvUmGJu6NveMHcb0+lqI+uD/3k13pYh9mYFSmuBM2
	 VePDeOxdLA7EO41zQZNgXKvA/l01ZClbrEKCVvnp59JRE8SFZab52GbTaHZzWWSXT1
	 Mro23Qhv6mVaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73059C61DE2;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:30 +0200
Subject: [PATCH 12/19] thunderbolt: Add ring_configure to tb_nhi_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-12-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4597; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=bjN1NTiSvc6/6RtUd8MUWugBmdf1TrTNf6e7OfieaZY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCRGb7y9IvDeVK3KSiYFpxoEfsc4HqxmXntyjaagmf
 yRQbEZGRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAir1YzMpzSj7SPu/RBwvxf
 lbBpvc+a6mBDu4LtrcH83uU184xrSxgZbi3cLN/E9OBG0Zqtb9yntJi8UnvbmbIlPm6p7k1vP9V
 /PAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The Apple NHI has to configure and enable each ring with a single write
and uses a separate register range for the receive ring PDF masks. Add
an optional tb_nhi_ops hook for it which falls back to the standard USB4
NHI method when it is not set.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 55 ++++++++++++++++++++++++++++++-----------------
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 3cb69deec63e..696da52abff6 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -239,6 +239,31 @@ static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
 	iowrite32(value, ring_options_base(ring) + offset);
 }
 
+static void ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
+{
+	if (ring->is_tx)
+		ring_iowrite32options(ring, 0, 4);
+	else
+		ring_iowrite32options(ring, ring->sof_mask << 16 | ring->eof_mask, 4);
+
+	ring_iowrite32options(ring, flags, 0);
+
+	/*
+	 * Now that the ring valid bit is set we can configure E2E if
+	 * enabled for the ring.
+	 */
+	if (e2e_flags)
+		ring_iowrite32options(ring, flags | e2e_flags, 0);
+}
+
+static void nhi_ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
+{
+	if (ring->nhi->ops->ring_configure)
+		ring->nhi->ops->ring_configure(ring, flags, e2e_flags);
+	else
+		ring_configure(ring, flags, e2e_flags);
+}
+
 static bool ring_full(struct tb_ring *ring)
 {
 	return ((ring->head + 1) % ring->size) == ring->tail;
@@ -694,6 +719,7 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
  */
 void tb_ring_start(struct tb_ring *ring)
 {
+	u32 e2e_flags = 0;
 	u16 frame_size;
 	u32 flags;
 
@@ -717,30 +743,13 @@ void tb_ring_start(struct tb_ring *ring)
 		flags = RING_FLAG_ENABLE | RING_FLAG_RAW;
 	}
 
-	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
-	if (ring->is_tx) {
-		ring_iowrite32desc(ring, ring->size, 12);
-		ring_iowrite32options(ring, 0, 4);
-		ring_iowrite32options(ring, flags, 0);
-	} else {
-		u32 sof_eof_mask = ring->sof_mask << 16 | ring->eof_mask;
-
-		ring_iowrite32desc(ring, (frame_size << 16) | ring->size, 12);
-		ring_iowrite32options(ring, sof_eof_mask, 4);
-		ring_iowrite32options(ring, flags, 0);
-	}
-
-	/*
-	 * Now that the ring valid bit is set we can configure E2E if
-	 * enabled for the ring.
-	 */
 	if (ring->flags & RING_FLAG_E2E) {
 		if (!ring->is_tx) {
 			u32 hop;
 
 			hop = ring->e2e_tx_hop << REG_RX_OPTIONS_E2E_HOP_SHIFT;
 			hop &= REG_RX_OPTIONS_E2E_HOP_MASK;
-			flags |= hop;
+			e2e_flags |= hop;
 
 			dev_dbg(ring->nhi->dev,
 				"enabling E2E for %s %d with TX HopID %d\n",
@@ -750,10 +759,16 @@ void tb_ring_start(struct tb_ring *ring)
 				RING_TYPE(ring), ring->hop);
 		}
 
-		flags |= RING_FLAG_E2E_FLOW_CONTROL;
-		ring_iowrite32options(ring, flags, 0);
+		e2e_flags |= RING_FLAG_E2E_FLOW_CONTROL;
 	}
 
+	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
+	if (ring->is_tx)
+		ring_iowrite32desc(ring, ring->size, 12);
+	else
+		ring_iowrite32desc(ring, (frame_size << 16) | ring->size, 12);
+	nhi_ring_configure(ring, flags, e2e_flags);
+
 	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
 		nhi_ring_interrupt_active(ring, true);
 	ring->running = true;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 5f70d7ddc2e2..670b48efeec5 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -76,6 +76,9 @@ struct tb_nhi_ring_layout {
  * @ring_interrupt_mask: NHI specific hook to mask/unmask the interrupt of a
  *			 single ring. If not set the standard USB4 NHI
  *			 registers are used.
+ * @ring_configure: NHI specific hook to program the ring options registers
+ *		    and enable the ring with the given flags. If not set
+ *		    the standard USB4 NHI registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -93,6 +96,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
+	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0



