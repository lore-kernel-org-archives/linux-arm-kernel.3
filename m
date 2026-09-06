Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296BDC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxdvX9H+SwG0XjJD8e1C6V10dJ2C6IvqMh0iv1m2V4g=; b=a5xttNqKuEiuZKIW6mQaR8q2NI
	d9N0B731Uqy6OlJ6NV6YBlTEa2/eSEK6BRJPfO7Q7BLWTF3KuoSygbsQgZ0/+c2jrcESHy8QWp/Lz
	rhg8tPUhjAopEmsqWv432xdkGvQGK6ElHZ4oWu9/OUYqAU4HEEOCpjQx6e3/vPEg3WbG/dXY4uXXO
	affJVKr6Zx38OAuiPeZ5buxBOpN9Xt7bRHmrBEiaUV8vyjiBzyW7EUujVctvohKckWIES/rtwK3ku
	QrJTZnYWF1CyyjkuDQuF7h3V73iGYS+iPjJixWvne8jqEYrnhLgY/0MDkRyVAUuSbbvbtTm4WCLxC
	AJaKr/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk2-00000005RI2-1tYP;
	Sun, 06 Sep 2026 18:37:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjp-00000005QzD-00hj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3585D4483D;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 133B1C32781;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=XzwUrv8QkEnw2nIL7r4TaOTvzfuNbqBbIbkln6OG5pQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ba5kwVu7y6VLFD41n4xRuj2Ao5acq5FgjSpwQorMztwD262l+nPYoz26/N4DYoIvQ
	 blK87Fv30k8Cg++FWTjyGxGkL7DpHJi+zu0PUdwf+lHsgvPeioqRB0cDxhdHIKhJ7n
	 8r8w7mSYcKqiKMAmiWQvVVgsIROw2m3k3zKxffiI3q/ro2nO05SoSza3at1k+XyJ17
	 +NDV1/M9i2Ynj0xC4fs6SggzXoZ4BabrCFEv//8pA35UO2UhqWvzy2denbgMMp5W+d
	 JDL4CAPzuBLuh/yvv5usOJd9qHyiGS7RqHKJ/Iwk5Tf2DX6InUuiUHZkXz2VwC3kxE
	 /Q8vqBaRq6O1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38EAC79FA1;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:36 +0200
Subject: [PATCH v2 13/22] thunderbolt: Add ring register accessors to
 tb_nhi_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>
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
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=XzwUrv8QkEnw2nIL7r4TaOTvzfuNbqBbIbkln6OG5pQ=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTYd2HZoox/5JV2THtMBpEr6T8lP8Mnomd0yekCSfq
 N3zRvlLRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAis5QZ/vAcYFXJZkl7WrKA
 Vclct8A7QFf88n43mw87OnY/mVnNcIHhf6RvsKon99cp3jPkjt+J2sIj9Xjx6bTMaz8mpHkfOHL
 iLhcA
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

The ring descriptor and options registers are laid out differently on
the Apple NHI. Add optional tb_nhi_ops hooks for their base addresses
which fall back to the standard USB4 register layout when they are not
set.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 32 ++++++++++++++++++++++++++------
 drivers/thunderbolt/nhi.h |  6 ++++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index fc54ff7edfb9..1b1e4a12c744 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -179,19 +179,37 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
 static void __iomem *ring_desc_base(struct tb_ring *ring)
 {
 	void __iomem *io = ring->nhi->iobase;
+
 	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
 	io += ring->hop * 16;
 	return io;
 }
 
+static void __iomem *nhi_ring_desc_base(struct tb_ring *ring)
+{
+	if (ring->nhi->ops->ring_desc_base)
+		return ring->nhi->ops->ring_desc_base(ring);
+
+	return ring_desc_base(ring);
+}
+
 static void __iomem *ring_options_base(struct tb_ring *ring)
 {
 	void __iomem *io = ring->nhi->iobase;
+
 	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
 	io += ring->hop * 32;
 	return io;
 }
 
+static void __iomem *nhi_ring_options_base(struct tb_ring *ring)
+{
+	if (ring->nhi->ops->ring_options_base)
+		return ring->nhi->ops->ring_options_base(ring);
+
+	return ring_options_base(ring);
+}
+
 static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
 {
 	/*
@@ -199,29 +217,31 @@ static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
 	 * are ignored by the hardware so we can save one ioread32() by
 	 * filling the read-only bits with zeroes.
 	 */
-	iowrite32(cons, ring_desc_base(ring) + 8);
+	iowrite32(cons, nhi_ring_desc_base(ring) + 8);
 }
 
 static void ring_iowrite_prod(struct tb_ring *ring, u16 prod)
 {
 	/* See ring_iowrite_cons() above for explanation */
-	iowrite32(prod << 16, ring_desc_base(ring) + 8);
+	iowrite32(prod << 16, nhi_ring_desc_base(ring) + 8);
 }
 
 static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
 {
-	iowrite32(value, ring_desc_base(ring) + offset);
+	iowrite32(value, nhi_ring_desc_base(ring) + offset);
 }
 
 static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
 {
-	iowrite32(value, ring_desc_base(ring) + offset);
-	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
+	void __iomem *base = nhi_ring_desc_base(ring);
+
+	iowrite32(value, base + offset);
+	iowrite32(value >> 32, base + offset + 4);
 }
 
 static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
 {
-	iowrite32(value, ring_options_base(ring) + offset);
+	iowrite32(value, nhi_ring_options_base(ring) + offset);
 }
 
 static bool ring_full(struct tb_ring *ring)
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 4884c3f5a2b2..3a963b0b5b46 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -52,6 +52,10 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
  * @request_ring_irq: NHI specific interrupt retrieval hook
  * @release_ring_irq: NHI specific interrupt release hook
+ * @ring_desc_base: NHI specific hook returning the ring descriptor registers.
+ *		    If not set the standard USB4 NHI registers are used.
+ * @ring_options_base: NHI specific hook returning the ring option registers.
+ *		       If not set the standard USB4 NHI registers are used.
  * @ring_interrupt_active: NHI specific hook to activate/deactivate the
  *			   interrupt of a single ring. If not set the
  *			   standard USB4 NHI registers are used.
@@ -70,6 +74,8 @@ struct tb_nhi_ops {
 	void (*post_nvm_auth)(struct tb_nhi *nhi);
 	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
 	void (*release_ring_irq)(struct tb_ring *ring);
+	void __iomem *(*ring_desc_base)(struct tb_ring *ring);
+	void __iomem *(*ring_options_base)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);

-- 
2.55.0



