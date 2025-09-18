Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2825CCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GACh2D2pXQ3TWuGrMWea50Im6d5e8m/XDV6uNV78uiU=; b=yluGGZmdy0cU4vLOfIYFSHdPxH
	aKH4UoIdWdtetHYx+Cv8Jlu5d61l0Y21sDeaMG7RmBG/aBsT9gjYY/NFGmG8+xr01C8McxbGeLzQO
	HwKh03xh00AfEV/Uqx7bfLTRFqaqyJJXQZIbnBh8maifi7dKo6qzZaoG4quti1X3WKdxJuE+qZY3+
	2Vh22h14gZ4jYM3c3go1Eh2fSy5wKDSIapDq8I2oxYcsP3z4GF0XRf767pn4F7T3NDrBI1XbZlZFN
	Elr+Ha7iB1ixFkNltjorU+yGnEnoK/xwUXw55vCfecHWGjKxZ6wjsPLKNdSd2lpe4SzGHfaAuaRhx
	ZyZElNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWb-0000000GnGt-1Dk6;
	Thu, 18 Sep 2025 09:01:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWZ-0000000GnFf-1ias
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D173A6020B;
	Thu, 18 Sep 2025 09:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F37C4CEE7;
	Thu, 18 Sep 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758186114;
	bh=mGSWa58npvsbMCZz/6vmp8p/XePk3TJBfYof7NGs8oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LykDXyf9viuasSfBsno2kiu+GBRZ9k02IgoUx32ATpI36+DMYYge8IsVktJ9Y0hCh
	 itVkhBj/FxyvYIGA/ZC66LiXHhEY+BCGEcLOG6DriQ7pntaLTQzj4mT9MFxuXrdZWR
	 WTlQZ+3uh7vQZJciFKtbeaQAWg2Fj5Z3CKaHH9DV5J7ZDeO0BOJgzGqIQYA6AZVHbu
	 KWkWpLNsRJtCOKlUzhICLsYmMJPHWa2AvjT1JqQAK0x8A3ZI5V0GAdmzBzy5aAuZnR
	 Ms3juopOsxXJRCs9uV5hU1+6dquREhGtGXFRjkpIAe/5CmUGaA6xiBdTsK6cje+hEh
	 6JCP5JTck0aAw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 18 Sep 2025 18:00:26 +0900
Subject: [PATCH 3/4] can: sun4i_can: populate ndo_change_mtu() to prevent
 buffer overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-can-fix-mtu-v1-3-0d1cada9393b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=mGSWa58npvsbMCZz/6vmp8p/XePk3TJBfYof7NGs8oU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBmnTxWZTgw4VM999eMKhiW/mgPzTVdd92X5/OeGtJvF4
 gvHcjqud5SyMIhxMciKKbIsK+fkVugo9A479NcSZg4rE8gQBi5OAZjIfQZGhv9126JX8G42aY3J
 mbiI+0nZJbvFB699Tqvivdr3J7Ca8z8jwwTdeWUXmvIuqQQHsiS6Km2sXf3IRa/fUMf80IctX55
 PZwEA
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

And so, sun4ican_start_xmit() receives a CAN XL frame which it is not
able to correctly handle and will thus misinterpret it as a CAN frame.

This can result in a buffer overflow. The driver will consume cf->len
as-is with no further checks on this line:

	dlc = cf->len;

Here, cf->len corresponds to the flags field of the CAN XL frame. In
our previous example, we set canxl_frame->flags to 0xff. Because the
maximum expected length is 8, a buffer overflow of 247 bytes occurs a
couple line below when doing:

	for (i = 0; i < dlc; i++)
		writel(cf->data[i], priv->base + (dreg + i * 4));

Populate net_device_ops->ndo_change_mtu() to ensure that the
interface's MTU can not be set to anything bigger than CAN_MTU. By
fixing the root cause, this prevents the buffer overflow.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/net/can/sun4i_can.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 6fcb301ef611d0c8bdb8720aaa77dc78950123d6..53bfd873de9bdecaf6923049007f9efd71289dd3 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -768,6 +768,7 @@ static const struct net_device_ops sun4ican_netdev_ops = {
 	.ndo_open = sun4ican_open,
 	.ndo_stop = sun4ican_close,
 	.ndo_start_xmit = sun4ican_start_xmit,
+	.ndo_change_mtu = can_change_mtu,
 };
 
 static const struct ethtool_ops sun4ican_ethtool_ops = {

-- 
2.49.1


