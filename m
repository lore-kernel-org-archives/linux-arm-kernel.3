Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5EACC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 05:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS4djhTCCyfNupiiHbhsTglSI4Wcf298uQffxP9D2K4=; b=FlWKXILfJN9Mr1jxYSR4uR9kDD
	VPsaKeCj4LlAdNwF5E7c/yQkq/+kz3QWiBdYCR0O/5NipE+PJAqJ4bS8DnEi20K2mIvqLku7mqDRv
	JWDiclGeYcLcdZ7NxDrXpEBo5NgQDHvBRMEuTbIXd8kW4XGg2geY7qvkYhEiD2XKUV1jVwxG0ze9N
	yCxANoAVAB2MCLBj7InUKCJka7IdasTO+G+gkf5FduzVlsfMidL7yOX0KLM2SPbTjvZDHt9puxqHR
	1DLJwvw+TWqroGcHSREk0SBlwODbIP4Geyjdbph8QO2mgJoMYT4+L+cmnmVfqyPArMOsdQRkgynfP
	itrYNTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEBQ-0000000Gs2t-3bUM;
	Thu, 15 Oct 2026 05:39:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEBO-0000000Gs21-2W1q;
	Thu, 15 Oct 2026 05:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 119C24176F;
	Thu, 15 Oct 2026 05:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC720C2BCFC;
	Thu, 15 Oct 2026 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792042753;
	bh=ezz9X8LCg9d+XCwZ3z22UMCSEaqyTLaQMTVDqp8Flk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qeWZQc3E6bw96CKDHU6b8eLjnOTmLuPimJHseQqvcJ+isKMMAJsnmvf2hxtIm9W1R
	 bns8LkAy+331XpOw0IpNlDHq0px+qJFDbIQqDbjr6/7Uk4Xv0iNDYOjKjhmDOsY8UK
	 +GEtf0PsvaPewmS7SQRbaDzxAhyLE7tuB+lhx0qR1a6OsHQtFNYQQGte5xCZLSzZ1P
	 SUGkvt8vqJKlSZZh6h4WbMIPqhnLU6IY/gB7KJgdkxlisa88R/WKsRYR7fL3hJ7tRO
	 HfHbZeZPAQuIp3wF05G+WsgKzmiD9eiPoEMRTCL8BJq9W4ZgleLe2QuO0KNj3UO3a/
	 jb0zwI25A2H8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DF9CC6B2F;
	Thu, 15 Oct 2026 05:39:13 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 15 Oct 2026 13:38:55 +0800
Subject: [PATCH net v4 1/6] can: dev: prevent bus-off recovery when the
 interface is not running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-rockchip-canfd-restart-close-v4-1-ad149ff79450@qq.com>
References: <20261015-rockchip-canfd-restart-close-v4-0-ad149ff79450@qq.com>
In-Reply-To: <20261015-rockchip-canfd-restart-close-v4-0-ad149ff79450@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792042751; l=2288;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=uB+Pk/mygKqGhQYSoYzTiXpubbzalD/v2yRTUeNfoh0=;
 b=qFu6jCjlfQAOMF4S/9w/na0VuZg9OCUazkAvDZtgoaA7Pw+vjJ5QN21IoElGk3A1OZDTEiREB
 HuBVfsNn1cMDg9mwlcCIhiNKMseD0gx3O7+Fc1EZRJZ+0L7t1OTdlUx
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
 drivers/net/can/dev/dev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index 769745e22a3c7..92492c503446e 100644
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
 
@@ -264,8 +267,9 @@ int can_restart_now(struct net_device *dev)
 void can_bus_off(struct net_device *dev)
 {
 	struct can_priv *priv = netdev_priv(dev);
+	const bool restart = priv->restart_ms && netif_running(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		netdev_info(dev, "bus-off, scheduling restart in %d ms\n",
 			    priv->restart_ms);
 	else
@@ -273,7 +277,7 @@ void can_bus_off(struct net_device *dev)
 
 	netif_carrier_off(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		schedule_delayed_work(&priv->restart_work,
 				      msecs_to_jiffies(priv->restart_ms));
 }

-- 
2.34.1



