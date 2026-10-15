Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF9DCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovNA/CLS6+iFz0OpFQaVFejefV2xgJzAekjyPeVYFLA=; b=MMzylC9r6gYin5DuXxqCehhrgJ
	Cc754ci5aVbN79VEC4XyFOdHoUBeBvvbiHtZcgLSl54eRqaKI0E1tofuhsgFj6zty14fRVDJ4VN7I
	I+nAUQOGZLv7MHS9ifOka62jkC11gzdNJzzNMolj+tK7y8alWlEU34GLfbbj7OAB4oP48b8f6gBEs
	ZHP5yvgxnpl5tefc5cNG+TIatVhnAiSHh8KKbkl0oXrtOfD/AA2fLWqDlwO0ISqf8Xq+QfYvHSXDK
	6Zt8gDm2P7ZxHs/8EolJssqFL1Iv4gf0KnerIuQow9ZSA4YKhCiTF1nSRRazzv+CzlhIzyd2/prh/
	KVtGz2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI2H-0000000HJEc-3UBm;
	Thu, 15 Oct 2026 09:46:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI2G-0000000HJCE-1y19;
	Thu, 15 Oct 2026 09:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36FB043E4A;
	Thu, 15 Oct 2026 09:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AE90C32786;
	Thu, 15 Oct 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792057564;
	bh=mXB6tIL/+qLpJiz4Sn4FUNs0zYbvBZ/cActaGcwuZns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JBeK3WnkHrZxvtxm1MimnNo1sTWt4o9UDhoalE4K8PTKRCZ2BHgXJX65Hc9cKRmNy
	 9cuWX6CH2EKtc58TcAH+kI9pecBYipZjA4H128eHDERfQ9upYYDKSCfrndtbnSU7+x
	 INsbLL/2ea/p7e8t0P45jUbqZuVaOk1TMjtpo9WFiNrpgbcXDr8dntABfCWDB8ATBc
	 doPoyU5R7l2/DroSc74ZqtM+0ClQbQhdzwFLGBcKxFa8RzZPFhwfWBZc+WzDRsPw7X
	 M1lbFnn9kro09pvq3oS13XgjHF2Gz+KhS4NIyAxplpMwVYPcG07pNtVrYzETfprAFs
	 fbKG98xzlmYTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0E8CC6B38;
	Thu, 15 Oct 2026 09:46:04 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 15 Oct 2026 17:45:07 +0800
Subject: [PATCH net v5 6/6] can: rockchip_canfd: serialize timecounter
 timestamp conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-rockchip-canfd-restart-close-v5-6-ae77327037c9@qq.com>
References: <20261015-rockchip-canfd-restart-close-v5-0-ae77327037c9@qq.com>
In-Reply-To: <20261015-rockchip-canfd-restart-close-v5-0-ae77327037c9@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792057562; l=2940;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=PpQslORihJNgfj4mzr9VTzdMu4X2EvQLejo/FRw489Q=;
 b=RUohAt88zMHGcIl0NA9Ep90SBUid/VM9brk9mn2HdBYrjShSlOBHdaVR2v9u9mPDwNOIPs6nC
 s3sRyZwU5u9BLMySyX3lRK2h6e5PhCqeDkPeCungPKcBptOfHv7qgd1
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cunhao Lu <1579567540@qq.com>

The timestamp worker advances the timecounter with timecounter_read()
while RX, TX completion and error-frame paths use timecounter_cyc2time()
to convert hardware timestamps without holding timestamp_lock.

timecounter_read() updates frac, cycle_last and nsec in separate steps.
A concurrent conversion can observe the new cycle_last with the old
nsec and produce an incorrect timestamp.

Hold timestamp_lock across timecounter_cyc2time(), using the same lock
as timecounter_read() and timecounter_init(). Keep the SKB timestamp
assignment outside the critical section.

TX completion nests timestamp_lock inside tx_lock; no timestamp-lock
holder acquires tx_lock.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-timestamp.c | 5 ++++-
 drivers/net/can/rockchip/rockchip_canfd.h           | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index 0fa791849c95..05f1005ee506 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -15,13 +15,16 @@ static u64 rkcanfd_timestamp_read(struct cyclecounter *cc)
 	return rkcanfd_get_timestamp(priv);
 }
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp)
 {
 	struct skb_shared_hwtstamps *hwtstamps = skb_hwtstamps(skb);
+	unsigned long flags;
 	u64 ns;
 
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
 	ns = timecounter_cyc2time(&priv->tc, timestamp);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 
 	hwtstamps->hwtstamp = ns_to_ktime(ns);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 4a2bdc205296..63f146ff8e6b 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -489,7 +489,7 @@ struct rkcanfd_priv {
 
 	struct cyclecounter cc;
 	struct timecounter tc;
-	/* Protects timestamp_active and worker reads/requeueing. */
+	/* Protects tc, timestamp_active and worker requeueing. */
 	spinlock_t timestamp_lock;
 	struct delayed_work timestamp;
 	unsigned long work_delay_jiffies;
@@ -557,7 +557,7 @@ void rkcanfd_ethtool_init(struct rkcanfd_priv *priv);
 
 int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv);
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp);
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv);
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv);

-- 
2.34.1



