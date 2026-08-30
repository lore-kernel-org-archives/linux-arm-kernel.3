Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD66C61DFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHVO68B7igtSFgTBgjcniXXKERUfMSUFXXPkhQS4q9w=; b=GXKeIrFQf298nKZXxZSHx9WMxe
	GT7t64AuZ2htMbRAN5WwuzYyy1x1zmpJoYlYEVKnLWF7itD8fcraEw6Y++UfCMbSXWqslqA382+LZ
	QmYk8b7sqmguT0Dm8R6Cs9tHuUhIXN1WD/hJGl0gUPh+UjTqTRW5xSo0Qj0fxN3cktYqTGxFCAkWT
	fDAvHVN+YHTRulg8Y51TGZYaLZHsN85b9c/CA/yCHfvnnZC+WZKlju0SlGvXFoNnVjnKh5yrlc5FQ
	lJ+D99Ji6yUODfeDoqumkREPRxWNWtTiiOZP6XRAVqh57KbKXFzAfAwpVOEG3y9Y7OGJAe/pDHu8r
	KzfE31bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0J-000000082uG-0X6C;
	Sun, 30 Aug 2026 20:19:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0H-000000082pe-0luv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 657F944015;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 470E3C2BCC7;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=RpEpSG63+tBPZuuziz+1veWy6ZIV0qRqo8PjvUS8qJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=keqJbrtc1W0IGsWsGuMtDEPAgCFasm1ak2z5Yzbyh/rYOE52V2eItWA2GvodyGU8y
	 XHmcQdjDfXdC6CWk3Qgun4kfC0SPLpdt4Yx71Kz8x9AK14mqiVBlr3WMaea9u61vD/
	 HijDFiZabt0of9qfxAfNmA0QibG3R3UlDdbgdyyrxLanlmlzCCKQfPokHRXBIbcMwA
	 wNIvb/auxQqfEpYHYaHzhZ4mUMGHDw8ud8l3HSxDr4KW4r0xHFC3T+AZMhYHhRWNC8
	 6YXiYz0FOVuBfv/Ei4EMBINNZJJEBQbQ+Ognhd/K3HV2mQBgO+Ja4gKqVevIQMCpaw
	 FtOA/Xjx6h5ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33164C61DF1;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:26 +0200
Subject: [PATCH 08/19] thunderbolt: Allocate ring HopID before requesting
 the ring interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-8-44bc9348683c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=RpEpSG63+tBPZuuziz+1veWy6ZIV0qRqo8PjvUS8qJs=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCWFH0ybf7Lx1kkX1xuxVUnppiybwLvoz38XszI9pW
 TkLDu7N7ShlYRDjYpAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBM5HInw//IjU/LvuZpb8n7
 e7b74Q2+SStY3r/VkJl00EdH/NmFoyuVGP4KHOjh/ms74xn3jHMz/WZ3TXsUY5fvWbby6CedzfL
 966fyAgA=
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

The Apple NHI has one interrupt per ring and request_ring_irq picks it
based on ring->hop which is still -1 at this point for rings allocated
with an automatic HopID. Allocate the HopID first and release it again
if the interrupt request fails.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5809809f64d4..6a97dcd57deb 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -534,6 +534,16 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 	return ret;
 }
 
+static void nhi_free_hop(struct tb_nhi *nhi, struct tb_ring *ring)
+{
+	guard(spinlock_irq)(&nhi->lock);
+
+	if (ring->is_tx)
+		nhi->tx_rings[ring->hop] = NULL;
+	else
+		nhi->rx_rings[ring->hop] = NULL;
+}
+
 static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 				     bool transmit, unsigned int flags,
 				     int e2e_tx_hop, u16 sof_mask, u16 eof_mask,
@@ -581,19 +591,18 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
+	if (nhi_alloc_hop(nhi, ring))
+		goto err_free_descs;
+
 	if (!(flags & RING_FLAG_NO_INTERRUPT) && nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
-			goto err_free_descs;
+			goto err_free_hop;
 	}
 
-	if (nhi_alloc_hop(nhi, ring))
-		goto err_release_msix;
-
 	return ring;
 
-err_release_msix:
-	if (nhi->ops->release_ring_irq)
-		nhi->ops->release_ring_irq(ring);
+err_free_hop:
+	nhi_free_hop(nhi, ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),

-- 
2.55.0



