Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A90FC61DF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iX+j9zdATKUhVkhOuQ52BXX85AClNR0tNpEGID5di0=; b=jjJ5zFG3Hhet0Ws6QvVPgj3gqW
	3H/MQpO7EM3bLryWHphzKgHKO/1LIicNHTFIoxRjjkPhx8I2/IgyJmoQY2qAcicA2HJRNUyDuBWcp
	60hMIRIPU7GEzGqhNL8cfErEZ2kFA+7EmdWVNtbh2OM8atQOP8krtbmd3G3l8DCbja/r1mcKlneP+
	A7+ipyZMzvnNzE+RmnfQAswiZIUjBninvKOP+9/kWCUMHtpDbMArdnuBuAxHKw4IXhcaHmzq7omo7
	DohiSLWzhj0qKawago8Ldau4FMYKU+Dbn/1OMgF5//iM0gnTLGE224fPaj3EECa1ATZTLK/pJCiHR
	Gf7x0JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0K-000000082vk-0RFu;
	Sun, 30 Aug 2026 20:19:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0H-000000082pb-1586
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A30664450C;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76ACDC4AF12;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=fHahmFpaRK/QzRyP/N5khiYGfLDf/FCodhzsWEEVc74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QLL+W8SCtbzHLmaWH8f9mhQ0np6S+9YeNXAi9MxCsIo4aCDulu68bxTHGK/IyvyJZ
	 CAwL8nbPK4bNs1dsmL2z2xd2KvvwujBWfWdlQDOZp/Ry5TePMTIX0a3xWVZjkAGxnR
	 ebRqMW7mA/v1IrzjI2/YkbqgB+NuQ9cHpoUkoqlZZuUCrSTiGQ6SlLV+irQfK190KA
	 7K/FS2JY+F/m2vYsQMSnJyekqwqDc23+RB3aMpCgxVH+lIH9bKIAOpGnBPGg6zt2Cg
	 eMU1r5ctzw8g/uTbrCUqIsTb/lFYnrlveXpmq+qly0o2VPi67qDQkxPytIXDZC10rD
	 r8hgLEOioMzLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63826C61DF1;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:29 +0200
Subject: [PATCH 11/19] thunderbolt: Add ring_interrupt_mask to tb_nhi_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-11-44bc9348683c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=fHahmFpaRK/QzRyP/N5khiYGfLDf/FCodhzsWEEVc74=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCREWl/bNOCe1Y6lknuKLLfMeyczdwRo/J/XDc7/WQ
 JttQpphHaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJMMsxMvycsSqXo/5Zxowv
 eysPF+u5nXs4XXn68aOddXuVKj/zsvxg+GewNcWrJz2kzevG0+CIpuXb53BNqj54WHCn5apPpRu
 fSDMAAA==
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
---
 drivers/thunderbolt/nhi.c | 12 ++++++++++--
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 3a3d334e69fd..3cb69deec63e 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -422,6 +422,14 @@ static void __ring_interrupt_mask(struct tb_ring *ring, bool mask)
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
@@ -429,7 +437,7 @@ static void __ring_interrupt(struct tb_ring *ring)
 		return;
 
 	if (ring->start_poll) {
-		__ring_interrupt_mask(ring, true);
+		nhi_ring_interrupt_mask(ring, true);
 		ring->start_poll(ring->poll_data);
 	} else {
 		schedule_work(&ring->work);
@@ -450,7 +458,7 @@ void tb_ring_poll_complete(struct tb_ring *ring)
 	spin_lock_irqsave(&ring->nhi->lock, flags);
 	spin_lock(&ring->lock);
 	if (ring->start_poll)
-		__ring_interrupt_mask(ring, false);
+		nhi_ring_interrupt_mask(ring, false);
 	spin_unlock(&ring->lock);
 	spin_unlock_irqrestore(&ring->nhi->lock, flags);
 }
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 035cee433a3c..5f70d7ddc2e2 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -73,6 +73,9 @@ struct tb_nhi_ring_layout {
  * @ring_interrupt_active: NHI specific hook to activate/deactivate the
  *			   interrupt of a single ring. If not set the
  *			   standard USB4 NHI registers are used.
+ * @ring_interrupt_mask: NHI specific hook to mask/unmask the interrupt of a
+ *			 single ring. If not set the standard USB4 NHI
+ *			 registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -89,6 +92,7 @@ struct tb_nhi_ops {
 	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
 	void (*release_ring_irq)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
+	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0



