Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57EBCCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C29Lhl3utqry3jvG/ywSdUspWblVdrnQV5iRpNmlrZA=; b=a8jSuPVfYJdopHdt+SXOa49vZO
	AzKYBrml1/gZiPWJARpEWbXlFijoqqKn/i5a2vUkTGyA0UA4sWb9GWsZFP7Htvfpr8wiVhm0bqj9L
	Prl60Rks2Q8nqBuFVNnoFBhyc8cdr12vMO6XMF+qHNPc93pVQfwR6mrwPTJdLWQr6gxle6+v45ueA
	s+I+p4kLYYPe3igdX3hH8ICGpEhYbBRpVy2RbzmTx2PeJznh/3z1j5d08zAS2od4WrPGovGDIJ5G4
	k5Mlu02A0bxHPDcvRcWd/OLpOpwx8UwPQf+e+KaMDhciXwlC/nQ9e1AAop2xTXMoGSuHi+v1R2+uK
	Zx6cSBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5kQ-00000004qSl-2fNf;
	Sat, 17 Oct 2026 14:50:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5kO-00000004qRZ-34kH;
	Sat, 17 Oct 2026 14:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C6AB42EAD;
	Sat, 17 Oct 2026 14:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A1A9C2BD00;
	Sat, 17 Oct 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792248656;
	bh=OYMczEsHLUYrVedhtGrdoP046Pr5eNXHENmvZsFgWlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AqsBEEtZWxIZew94vbtMF/nK1hkPKKQxOI7KuJ1HEkwd29ebUU+2BDSpPKspNpy0u
	 oHsOMv/N8SI3IA5BxGh5FbhRGThX5hBJhXI/V5g/3p48BsQP/1/pJbwRFJhtqgmGIL
	 XDN4CnNxi9GJq0NyKD7NNhM0kTndRTzgB/GP+8hOQBouQzh135p5yW6nGAeUWuj1wb
	 t1MSDDlyxCq33a2Ey2vzw2AG2DfUrOz5su7e4xarXG2OvOkivxP552Wn840d6E4jH1
	 Ck7b2K5omHe3OUw09ErnkffI1uIqOEBuO5IwUH5ix/liDEHnmQabVJOZnq6CV0TRKo
	 Qg4DVLgOeD4OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3669CCF2C9;
	Sat, 17 Oct 2026 14:50:55 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sat, 17 Oct 2026 22:50:52 +0800
Subject: [PATCH net v6 2/6] can: dev: add
 close_candev_cancel_restart_sync()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-rockchip-canfd-restart-close-v6-2-ed605feb4b6e@qq.com>
References: <20261017-rockchip-canfd-restart-close-v6-0-ed605feb4b6e@qq.com>
In-Reply-To: <20261017-rockchip-canfd-restart-close-v6-0-ed605feb4b6e@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, stable@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792248654; l=2657;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=VwOo682oM6+dAV7fJCgpLEeH4L12b6gOYwxj8t1Ev6Y=;
 b=KeIFB3H3BBGOrDJgQ59ZE8/YPihhu+tHIiSYSvL6/U1RZuIEWXdVXMQTSm39OXqkVJ+xb0dDp
 GtLPWHDlOdTD5bA/tuIkmvvhjExqyHaHc5nw2slYCS0UCYfHUZ01LZe
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

Drivers may need to wait for bus-off recovery before tearing down the
IRQ and hardware resources used by their restart callback. Calling
close_candev() at that point also flushes echo skbs, which belongs after
the driver has quiesced the users of those buffers.

Add close_candev_cancel_restart_sync() in linux/can/dev.h so drivers can
cancel the core restart work separately, without accessing can_priv's
work item directly. The helper only cancels restart work; callers must
still stop its producers and call close_candev() for the final cleanup.

Use the helper in close_candev(), preserving its existing cancellation
and echo cleanup order.

The following Rockchip fix uses the helper at the start of rkcanfd_stop()
to wait for recovery before IRQ teardown, leaving echo cleanup to
close_candev().

Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v6:
- Describe the helper's use by the following Rockchip fix.
---
 drivers/net/can/dev/dev.c |  4 +---
 include/linux/can/dev.h   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index d5cb22db2a346..a5f4ce7cb5264 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -535,9 +535,7 @@ EXPORT_SYMBOL_GPL(of_can_transceiver);
  */
 void close_candev(struct net_device *dev)
 {
-	struct can_priv *priv = netdev_priv(dev);
-
-	cancel_delayed_work_sync(&priv->restart_work);
+	close_candev_cancel_restart_sync(dev);
 	can_flush_echo_skb(dev);
 }
 EXPORT_SYMBOL_GPL(close_candev);
diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
index 6d0710d6f571d..a277d12332f15 100644
--- a/include/linux/can/dev.h
+++ b/include/linux/can/dev.h
@@ -22,6 +22,7 @@
 #include <linux/can/skb.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 /*
  * CAN mode
@@ -115,6 +116,17 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
 
 int open_candev(struct net_device *dev);
 void close_candev(struct net_device *dev);
+
+/* Cancel bus-off restart before tearing down resources used by the restart
+ * callback. The driver must still call close_candev() for the final cleanup.
+ */
+static inline void close_candev_cancel_restart_sync(struct net_device *dev)
+{
+	struct can_priv *priv = netdev_priv(dev);
+
+	cancel_delayed_work_sync(&priv->restart_work);
+}
+
 void can_set_default_mtu(struct net_device *dev);
 void can_set_cap_info(struct net_device *dev);
 int __must_check can_set_static_ctrlmode(struct net_device *dev,

-- 
2.34.1



