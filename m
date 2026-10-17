Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F76CCF2D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6BqTaX9K/aTEFAmYB4DDBgoh6mXwvUEKVwJKpfp6AM=; b=P2Rf0EcKJhlK5oZyMF04nwWaf3
	iMVdhw0tF46Vvk6og3wYxX8R3ZTVhWE+1n7hUB2O5DIRx86nPoNjdV65wKAtUCt5Bu20Mr3cioTpB
	Ar/KDUNhYxNvx18JQLsRXPfY+xCVlacEUW6+k328SqQ+rWIRyFYYxgaBPF9ryu0SMS005UHkWnie5
	kZBQc7A0ja/gi3p+TFiQX4p6EhVk2zLYBZbZq8EPHXw4/4zf1obKD4HutEoivzHV3Nm+WHC/T2//A
	txU1a9pTyRGWT/hH+TCREh78JwKB3UHV1Zw3+No/6FDAIye4xUbfOoBTMkBjFjrG2E1XhptFzUkUu
	F2BeA0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5kR-00000004qVH-34gB;
	Sat, 17 Oct 2026 14:50:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5kP-00000004qRa-1hNE;
	Sat, 17 Oct 2026 14:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 736BB60A9D;
	Sat, 17 Oct 2026 14:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DE63C2BCFD;
	Sat, 17 Oct 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792248656;
	bh=HpjYOLfBJm5ttjl2VKp8Qd+WjxxgiMjYtLa1agXHI3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WeIzBhmC8gt9sw0LCMH2t6/sakhJ+hIRsWK+31oslbEfei01bj0rqTbyuJ+Kcg4Yz
	 +KqgLJvy/Mvmgc028XSsXKgI7diEAnY34eudvHeaECz0jOEArQt67bUVgm2iB3HKEU
	 Ab2pVJvy1WdD+fTqN8tr31TytzVP0lGglLWf12+II7j+jMu/mnUc5j66fg9HH9edwT
	 SufkhzFJuaZC4fVbgdu6h17Rpt7bb99ANMGeFAAvKyWhuF0YSvubTpCmUYWtZrxTVw
	 GO+ptfoUyTC8ZdemZW7hlHFlF4P7CK9Da+TQW0sLAm4tnpfPUGQJwRu+oNwrGel7bA
	 YAMJpX5y33uDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15B7CCF2C1;
	Sat, 17 Oct 2026 14:50:55 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sat, 17 Oct 2026 22:50:51 +0800
Subject: [PATCH net v6 1/6] can: dev: prevent bus-off recovery when the
 interface is not running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-rockchip-canfd-restart-close-v6-1-ed605feb4b6e@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792248654; l=3984;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=g1Lt1jcKFwF1Vjymzk/CqbM4Jz0xSuU4KCs88UQRpAk=;
 b=/fF4/xeJUnIWzANKza1S3FgMd5nX/SnOpmAQl5M2yU02k2VzrFPe70CFxgfVUZs5tAyjgKhdD
 Ize2Ycj1rkaASV/xSlc1WPJIsUXe6UkEXJ2QytF/fQHliljzYwPGHN+
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

The networking core clears __LINK_STATE_START before calling ndo_stop(),
but CAN bus-off recovery neither checks this state before queuing work
nor before calling the driver's restart callback. Recovery can therefore
be queued or started after the interface has begun closing, potentially
re-enabling hardware while the driver is tearing it down.

Check netif_running() in can_restart() before flushing echo skbs, sending
the restart notification or enabling the carrier. Keep the existing
unsupported-operation check first. In can_bus_off(), only schedule
recovery for a running interface and make the log message reflect that
decision. Keep reporting bus-off and disabling the carrier.

These checks do not wait for recovery that has already passed the check,
nor serialize the check with work submission. Drivers still need to
cancel restart work before tearing down resources and quiesce its
producers before their final cleanup.

Fixes: 39549eef3587 ("can: CAN Network device driver and Netlink interface")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v6:
- Update the can_bus_off() comment and document the running-interface
  requirement for automatic recovery.
---
 Documentation/networking/can.rst |  6 ++++--
 drivers/net/can/dev/dev.c        | 11 ++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/can.rst b/Documentation/networking/can.rst
index 536ff411da1d1..861397e4ce906 100644
--- a/Documentation/networking/can.rst
+++ b/Documentation/networking/can.rst
@@ -1298,7 +1298,8 @@ More info to the above output:
 	Automatic restart delay time. If set to a non-zero value, a
 	restart of the CAN controller will be triggered automatically
 	in case of a bus-off condition after the specified delay time
-	in milliseconds. By default it's off.
+	in milliseconds, provided the interface is running. By default
+	it's off.
 
 "bitrate 125000 sample-point 0.875"
 	Shows the real bit-rate in bits/sec and the sample-point in the
@@ -1372,7 +1373,8 @@ before you can start it to avoid error-prone default settings::
 A device may enter the "bus-off" state if too many errors occurred on
 the CAN bus. Then no more messages are received or sent. An automatic
 bus-off recovery can be enabled by setting the "restart-ms" to a
-non-zero value, e.g.::
+non-zero value. Recovery is only scheduled and started while the
+interface is running, e.g.::
 
     $ ip link set canX type can restart-ms 100
 
diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index 769745e22a3c7..d5cb22db2a346 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -198,6 +198,9 @@ static int can_restart(struct net_device *dev)
 	if (!priv->do_set_mode)
 		return -EOPNOTSUPP;
 
+	if (!netif_running(dev))
+		return -ENETDOWN;
+
 	if (netif_carrier_ok(dev))
 		netdev_err(dev, "Attempt to restart for bus-off recovery, but carrier is OK?\n");
 
@@ -259,13 +262,15 @@ int can_restart_now(struct net_device *dev)
  *
  * This functions should be called when the device goes bus-off to
  * tell the netif layer that no more packets can be sent or received.
- * If enabled, a timer is started to trigger bus-off recovery.
+ * If automatic recovery is enabled and the interface is running,
+ * delayed work is scheduled to trigger bus-off recovery.
  */
 void can_bus_off(struct net_device *dev)
 {
 	struct can_priv *priv = netdev_priv(dev);
+	const bool restart = priv->restart_ms && netif_running(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		netdev_info(dev, "bus-off, scheduling restart in %d ms\n",
 			    priv->restart_ms);
 	else
@@ -273,7 +278,7 @@ void can_bus_off(struct net_device *dev)
 
 	netif_carrier_off(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		schedule_delayed_work(&priv->restart_work,
 				      msecs_to_jiffies(priv->restart_ms));
 }

-- 
2.34.1



