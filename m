Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB9606D828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1OGIFSF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8Oi7t6C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IAm1RnU3LXIK+q/reOMxdY6siUbNPc2TIpIN4Jo7ygE=; b=e1OGIFSF0Abv2UmEYNoJiasMZd
	fcAQCrtz5Xzk1lZBiKZhKBnv8FvVI1TpxkdsmWrPqxsuK6uWx7XkE0x5oVQpYBqqiCkW1qI1SSpuR
	j7MG/PDurjME6zylBmwo5AnmW+/lLiiI4XTJ2+7GbvWllEbJTSK14B0kcH1llRTYvxdikgifdeVSg
	yKCwAoH5LKFNGQsDvAX2iXtGd6fmhbZCvYcTiNqDec0zgmrXqArbzJhm+9aBTnSTDc/boIwSI5dD8
	6UE9c2itqQLTTTc91mYTOohDg6aun7hjsDQG9lTtpTwv5iJRLJscgPadhKsdJ8JLMxWm4uoVULujF
	my7pPzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO9-0000000BlMO-1JKG;
	Fri, 06 Nov 2026 09:37:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGO7-0000000BlLE-35SE;
	Fri, 06 Nov 2026 09:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDAEF605DC;
	Fri,  6 Nov 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793957854;
	b=fdMZYZ2UxV7zpk7RiLp4HE0Db6UsMMCFIAd9fwxRGIlFY5utNiwhW+2K25vqeJDSnwnI
	 sce91VhrLjW1iG151nI2h5JirevGUwZ6qeeqGgsCwJ/Sbr9xMU9OtrPndrP5o4Yw0G050
	 x2jnLj2AyGEg6W9z9TQN56bjeBnduhX9OsIeLDF6HJ6NAoNvvFz2sJlrC7+YSK0rCtsZH
	 620BQsftDKgAiu2F+9vn7ydp9w2WJQ8Vdkp2w9ofCTuGoHpxT28HZUFdbW8ke5Kh92O1N
	 Zyy4/4Oi3/wbe9/ytIZwXC6fKJ703KMcSqIPstW55uSxzM49cxn5GPQJbJTjCRbzqOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793957854;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IAm1RnU3LXIK+q/reOMxdY6siUbNPc2TIpIN4Jo7ygE=;
	b=wh7XG3GcfT8DhrrornMU9TUwqj7yg2rOHXe3D5xX1AElShiqKZRSt56LJmQu7Hi7PhVz
	 1sqoTWbRzoBvL/tiVgYkF/KrNTYJSycehC4HN2udT7HXcbJcsb+/6MRUPQyDQoaQK4Wg8
	 xvH0/8W4T/3A7kOK47nuAJPsFpjM2CKCwc2CgOSCzj144N+Vjnwa6xmyD+geb0wYV9Ij5
	 P15ZGGKVsEsbqzJLRWMy6s8EsoZ4zqP7pAfeTgWKLXLkv7a5FwOS5dOZ6D2b0xiHOLYBQ
	 CQMe4bJEkvoRabmoHds8ikR8Dcy8+gKFPNpeVRC/IXozbMuuxT+Zfvgp9aXGGztIjKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AA641F00939;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957854;
	bh=IAm1RnU3LXIK+q/reOMxdY6siUbNPc2TIpIN4Jo7ygE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C8Oi7t6CW0X2COZY4GjH8xcSFVN+/n3g3XIYg1Ep5aKTpMETd96souPUQDGqou4Xk
	 aH4rea2BKO6swdaQD+botzOP7kJZ76DYRX/JJ/0xx2SHBULE/yfXd6o6yybk/K0qHV
	 1FmNyc3iME5BFre4KX0o6wMU7y93w8cxZ6SXHSP/LDizgTBWncNNOkdwDurl48nSwZ
	 Sgf971pu8cYYBqIXr4abNnyS3y1UB7GVMmtHHY4fiXbVujhSN5I6iUeqs4TD7oqi3X
	 h3bsalGBGPkWPx3RYrLTtalElV8clV5I8/m1WJ5nEXLy+VE01/FHokrU4fF+xfOFy9
	 A+kg1z4Zpg1LA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 796D145CB1;
	Fri,  6 Nov 2026 09:37:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Fri, 06 Nov 2026 17:37:22 +0800
Subject: [PATCH net v7 3/7] can: rockchip_canfd: cancel bus-off restart
 before closing the device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-rockchip-canfd-restart-close-v7-3-accdb11bc845@qq.com>
References: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
In-Reply-To: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Wolfgang Grandegger <wg@grandegger.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel@pengutronix.de, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957851; l=1424;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=FqCrBu6JrjmPJcQNJBNICwgHwS2YwinHx4qtGS13N34=;
 b=EksO5sKz1C4ZmTUOQfpAgWiVrw0MsWrGt2EerKcA1mXzUc6TuBGyNWHEzcgtCgH4H/GXC/5cF
 PFYy8SKy+okC2MSp6zM/SrGgJCHVUs9tqiA6gz37vO3QwkK4s6WxLYe
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

The close path cancels restart_work in close_candev() only after freeing
the IRQ, disabling RX offload and stopping the controller. A concurrent
restart can re-enable the controller and interrupts after IRQ teardown,
or requeue timestamp work that accesses registers after runtime suspend
has disabled the controller clocks.

Call close_candev_cancel_restart_sync() at the start of ndo_stop(), while
the resources needed by a running restart are still available. Keep
close_candev() after IRQ teardown for final cancellation and echo cleanup.

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v7:
- Keep close cancellation separate from restart and open error handling.
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 1cae86973da5..59a79fe057e6 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -758,6 +758,7 @@ static int rkcanfd_stop(struct net_device *ndev)
 {
 	struct rkcanfd_priv *priv = netdev_priv(ndev);
 
+	close_candev_cancel_restart_sync(ndev);
 	netif_stop_queue(ndev);
 
 	rkcanfd_chip_interrupts_disable(priv);

-- 
2.34.1



