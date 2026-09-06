Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB7BC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyHjvoap3uzxFf8Urv2PT9XMtlCRjQtDU0Mm2HjuoYE=; b=LGpVtzZ/PZrbFPAIv0XVsxdziZ
	odSYKKa+D2uce1XfGHkg8cufpm6ft4DsufNNJygisGtBuobhTRL6NkjzTGF6qPgorh27Vfc7KR6pJ
	NtuqM6tGtEDX1cgAHycmxKdZGKng6v8Y8sVkgRaMTbexZXU3KphaYHhZmryOKGIYDZSs0LuLYjF35
	zvR2JwcXiCn8QJm8UGTX2lE14izxxWP1a9ixsbZXgceEBLMc1aLLIoSl7Nq2fevlnAfJa9qJF6HqO
	G92vwXwk6EnB1DhuIrGMJ8XtSSmgyBoc4dExp5v+ErAPHErsoAdT+YCNRSzSU79iZfQWfWzdaff5q
	X4+pobPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk3-00000005RJz-0ICU;
	Sun, 06 Sep 2026 18:37:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjp-00000005Qzg-0OYf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4849144847;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 234F5C2BD00;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=HJ+d/OZeUWUlC39b4Bp/Qj2ekR0RdTWk6ov7g7kvJNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cIXU3rHZp2xx7rD79RNZNBPC5BNwRYpKev1jnGOuylEsbV7Wrg3KlANao+VAWHR56
	 MB+oHhWDvO5B+7Zpu4xiHPX/SCUQdq+Zsxef5+PGpMrafTQJR1qjYbW2b8PDtlkUHA
	 akreFeag6ykUHW6XD8UtzmTTgdCR8VWQuVJFtTnr799vDgmcqLReC/OR77xmgLtb62
	 aOhT1lWozBAcPZ3c2DwotcvUWzJeVfveg3H59mwdrXY04FPl3pr0eo3sBhQs0d9VW5
	 qif4d4FRkUAgNY2iGPAtmwqRgW9H80DmT59P/s9BQCV1F/UlVG7TIr0HlIe22P7GSt
	 oLLnXoVZVMj1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC01C79F8C;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:37 +0200
Subject: [PATCH v2 14/22] thunderbolt: Add ring_interrupt_mask to
 tb_nhi_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-14-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2895; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=HJ+d/OZeUWUlC39b4Bp/Qj2ekR0RdTWk6ov7g7kvJNs=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTYc7mz+onjuQkXho1qyMPy25X0QY17553XrW4NOmW
 70CO84v6ChlYRDjYpAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBMRKSBkaH7/IFlj6xPnTkq
 9pwn18Lc5k7o5uW+35YfzHt9btpbwbClDP+rI3I2f2J+0noriu2N1umZYt0911bwxjzx01GJ/eV
 6RpcHAA==
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

Masking ring interrupts works differently on the Apple NHI as well. Add
an optional tb_nhi_ops hook for it which falls back to the standard
USB4 NHI method when it is not set.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/nhi.c | 12 ++++++++++--
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 1b1e4a12c744..4ef86e7c0285 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -427,6 +427,14 @@ static void __ring_interrupt_mask(struct tb_ring *ring, bool mask)
 	iowrite32(val, ring->nhi->iobase + reg);
 }
 
+static void nhi_ring_interrupt_mask(struct tb_ring *ring, bool mask)
+{
+	if (ring->nhi->ops->ring_interrupt_mask)
+		ring->nhi->ops->ring_interrupt_mask(ring, mask);
+	else
+		__ring_interrupt_mask(ring, mask);
+}
+
 /* Both @nhi->lock and @ring->lock should be held */
 static void __ring_interrupt(struct tb_ring *ring)
 {
@@ -434,7 +442,7 @@ static void __ring_interrupt(struct tb_ring *ring)
 		return;
 
 	if (ring->start_poll) {
-		__ring_interrupt_mask(ring, true);
+		nhi_ring_interrupt_mask(ring, true);
 		ring->start_poll(ring->poll_data);
 	} else {
 		schedule_work(&ring->work);
@@ -455,7 +463,7 @@ void tb_ring_poll_complete(struct tb_ring *ring)
 	spin_lock_irqsave(&ring->nhi->lock, flags);
 	spin_lock(&ring->lock);
 	if (ring->start_poll)
-		__ring_interrupt_mask(ring, false);
+		nhi_ring_interrupt_mask(ring, false);
 	spin_unlock(&ring->lock);
 	spin_unlock_irqrestore(&ring->nhi->lock, flags);
 }
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 3a963b0b5b46..ca3eddf862e0 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -59,6 +59,9 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @ring_interrupt_active: NHI specific hook to activate/deactivate the
  *			   interrupt of a single ring. If not set the
  *			   standard USB4 NHI registers are used.
+ * @ring_interrupt_mask: NHI specific hook to mask/unmask the interrupt of a
+ *			 single ring. If not set the standard USB4 NHI
+ *			 registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -77,6 +80,7 @@ struct tb_nhi_ops {
 	void __iomem *(*ring_desc_base)(struct tb_ring *ring);
 	void __iomem *(*ring_options_base)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
+	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0



