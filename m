Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A91CAC5A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NsFm63S3HcC4Bz3LctIVdBlwwQslgpjY8k9+dqFKyg=; b=piFoVuhAznkSNloPlzIs/uVpWX
	v0ScnfhAbpE/BeN2805Bp0yet7W4cJk3LJv2RtKluJnwn/gVzQrWyNht+ROPFdkQHp8CQc3JGr0bi
	J9s6XyjAnMfeFzKlmuHNBr9GV8gTgPoK52UWFOyqlclKdSoW8Enp9welma+uaZi5rdOfjOfQYKv7+
	nz8cuCAfD9LZgphixM1hyCoSRr/ThcXuNLjRAdIDH3wMmbX9ibX+hRG3ewLAcuvGyCSm3JwoxAvfj
	2KdXdqf+cga7hOUKnFqPWgcupBHtbSvNe1iWgaETN5ARKQs/pA1HIAU5h87J93fNNP8/5XaXAw4Ju
	iE6BiKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWa-0000000GnGV-45LQ;
	Thu, 18 Sep 2025 09:01:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWW-0000000GnEG-3cJv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 462BF6020E;
	Thu, 18 Sep 2025 09:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1676C4CEF7;
	Thu, 18 Sep 2025 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758186112;
	bh=2ojWim0st4lnA2XgT/Qg56HLdpsIlwLb6NH17RfD91E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vI+C1g/e4EQ9UYWBlg8FNogeSAxF7IsqrjbIKlefff7UPE4VZhL7IunkvHKKmbL4S
	 fPZ4gxz+MnlsDX3NMkowkdB4msN+2IeSRVzSlagISr8bHzteyIYgqjsEfeJtc81fvA
	 SI8mQ9/i/kRAHEuO+3uZ/l8SxohvfpXrwG6iKi90Oi7JZKUCjkLfqOEaLeIHq9wDGJ
	 d9x4MABSIRXimIt0sATWTcMkox6L5RNZp1mPQvWXdivpdHpPlqFWbtp860oQJ2yyOV
	 r6zFw+Q/3glj/XBfJQfjUu2k7h+UOXfgtdFLw3qsLAh1LVc52g+k1YshRtpEfI83ru
	 W6Jky67iqsEDQ==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 18 Sep 2025 18:00:25 +0900
Subject: [PATCH 2/4] can: hi311x: populate ndo_change_mtu() to prevent
 buffer overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-can-fix-mtu-v1-2-0d1cada9393b@kernel.org>
References: <20250918-can-fix-mtu-v1-0-0d1cada9393b@kernel.org>
In-Reply-To: <20250918-can-fix-mtu-v1-0-0d1cada9393b@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Wolfgang Grandegger <wg@grandegger.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
 Yasushi SHOJI <yashi@spacecubics.com>, 
 =?utf-8?q?Remigiusz_Ko=C5=82=C5=82=C4=85taj?= <remigiusz.kollataj@mobica.com>, 
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=2ojWim0st4lnA2XgT/Qg56HLdpsIlwLb6NH17RfD91E=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBmnTxW8SLihku7eY1d3/cZPkdrHCZ6R/1fwzJvSmexu0
 T49/hFHRykLgxgXg6yYIsuyck5uhY5C77BDfy1h5rAygQxh4OIUgIlIejEyXFkuX7Ft50TvzoDn
 BmZ/K3dFFP1MU0+Vbj3zqUHWL2ZxMSPDF/FvzC/n8b1RMj+2Kvtmmopvff2kq3Ff16RX/z9iKyP
 EDQA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

Sending an PF_PACKET allows to bypass the CAN framework logic and to
directly reach the xmit() function of a CAN driver. The only check
which is performed by the PF_PACKET framework is to make sure that
skb->len fits the interface's MTU.

Unfortunately, because the sun4i_can driver does not populate its
net_device_ops->ndo_change_mtu(), it is possible for an attacker to
configure an invalid MTU by doing, for example:

  $ ip link set can0 mtu 9999

After doing so, the attacker could open a PF_PACKET socket using the
ETH_P_CANXL protocol:

	socket(PF_PACKET, SOCK_RAW, htons(ETH_P_CANXL))

to inject a malicious CAN XL frames. For example:

	struct canxl_frame frame = {
		.flags = 0xff,
		.len = 2048,
	};

The CAN drivers' xmit() function are calling can_dev_dropped_skb() to
check that the skb is valid, unfortunately under above conditions, the
malicious packet is able to go through can_dev_dropped_skb() checks:

  1. the skb->protocol is set to ETH_P_CANXL which is valid (the
     function does not check the actual device capabilities).

  2. the length is a valid CAN XL length.

And so, hi3110_hard_start_xmit() receives a CAN XL frame which it is
not able to correctly handle and will thus misinterpret it as a CAN
frame. The driver will consume frame->len as-is with no further
checks.

This can result in a buffer overflow later on in hi3110_hw_tx() on
this line:

	memcpy(buf + HI3110_FIFO_EXT_DATA_OFF,
	       frame->data, frame->len);

Here, frame->len corresponds to the flags field of the CAN XL frame.
In our previous example, we set canxl_frame->flags to 0xff. Because
the maximum expected length is 8, a buffer overflow of 247 bytes
occurs!

Populate net_device_ops->ndo_change_mtu() to ensure that the
interface's MTU can not be set to anything bigger than CAN_MTU. By
fixing the root cause, this prevents the buffer overflow.

Fixes: 57e83fb9b746 ("can: hi311x: Add Holt HI-311x CAN driver")
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/net/can/spi/hi311x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/spi/hi311x.c b/drivers/net/can/spi/hi311x.c
index 09ae218315d73d49c2ec4280707911966fce1c31..6441ff3b4198718e8e662daa3022f06a2405f322 100644
--- a/drivers/net/can/spi/hi311x.c
+++ b/drivers/net/can/spi/hi311x.c
@@ -812,6 +812,7 @@ static const struct net_device_ops hi3110_netdev_ops = {
 	.ndo_open = hi3110_open,
 	.ndo_stop = hi3110_stop,
 	.ndo_start_xmit = hi3110_hard_start_xmit,
+	.ndo_change_mtu = can_change_mtu,
 };
 
 static const struct ethtool_ops hi3110_ethtool_ops = {

-- 
2.49.1


