Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+K6/83Ivd5bjHb/XmHVqt8HxTV4guNxU+s8h3zZY/Q=; b=ZU5ZIs0n5p1613WcQqK9wEKV6C
	kNJbFwEMos9nHqgJuWhRk0YTkPU/XdCfnDfhBWPpZGo3dO4tU5hpekJa9hqvO9f1IGGBYbbh1qeVr
	9/fFsnDI1xQNmDco+wtyIATNFH3Xx0jG9EeFFAkWRhO/8PUWTOhSrwbz6JHFjxoMd98OZDG9BrACo
	xkpOW1zEBuQKSvITRwZJHGOj98QTu9nEp332f3muA4UxIg2cVNlVv2dElPYWaNLn/icnvE2+3aIym
	R/sjgpK1ZR/eRSyLIXoSjiZdSvHMFp+TFD+4cIszgautMwXWgn6yP5JscFD0kEcxnHRAVmC4E2tWt
	qScp24oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWh-0000000GnLF-2X3K;
	Thu, 18 Sep 2025 09:02:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWb-0000000GnHS-48Ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67C6F6013E;
	Thu, 18 Sep 2025 09:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35ECC4CEF0;
	Thu, 18 Sep 2025 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758186117;
	bh=jwRTUoN54HeyKKOV4Dj4gsSdmsvGsDnd8DlVRGDSbDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GxoH68x7hQHtLVtLVFaUYb+D7yUzMQAZLIcgN2NuzCvOueygHkFoCIZpYVskFiuxX
	 y1TATBou4FNIrB9zORxwf1WlGgQDx1qcA8PYE7mHvTFGHzVCicFJUwRQ+a2yCVmcvO
	 rM8g62VcDBWqaVYPddsMgb5LImWZa41OdSK5Y0rqFxnQ4DbfrQBkXJyQikO8/kUFEp
	 J9nM5mVxOGfBgnoghgHUUQdEXBs7MIiePFYyp53CuZVYCSEiXXaGD3RoP+Ki8t2Psg
	 bX/+R5//IRXVQRwAD9i/v2Uu9b2i7Usb6raiG+75yt5mpXFkU/ye8HASukUJ+zEtDf
	 RPELvjxDeOA6g==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 18 Sep 2025 18:00:27 +0900
Subject: [PATCH 4/4] can: mcba_usb: populate ndo_change_mtu() to prevent
 buffer overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-can-fix-mtu-v1-4-0d1cada9393b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=jwRTUoN54HeyKKOV4Dj4gsSdmsvGsDnd8DlVRGDSbDU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBmnT5Wa/3W9fdJ1Pmfsm6Utj1ZGxk9zsm+6r7lgB+Pcm
 5eDojZs7ChlYRDjYpAVU2RZVs7JrdBR6B126K8lzBxWJpAhDFycAjAR0WaG/wW/Ql+G9f/64zBv
 YUxp32L9bP/UrZ+OrlxjbPWX05p91n1Ghmdnr4fNte61cj9dc6HiXP0mz5MHYxaub63d7v08Qvr
 yE0YA
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

Unfortunately, because the mcba_usb driver does not populate its
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

And so, mcba_usb_start_xmit() receives a CAN XL frame which it is not
able to correctly handle and will thus misinterpret it as a CAN frame.

This can result in a buffer overflow. The driver will consume cf->len
as-is with no further checks on these lines:

	usb_msg.dlc = cf->len;

	memcpy(usb_msg.data, cf->data, usb_msg.dlc);

Here, cf->len corresponds to the flags field of the CAN XL frame. In
our previous example, we set canxl_frame->flags to 0xff. Because the
maximum expected length is 8, a buffer overflow of 247 bytes occurs!

Populate net_device_ops->ndo_change_mtu() to ensure that the
interface's MTU can not be set to anything bigger than CAN_MTU. By
fixing the root cause, this prevents the buffer overflow.

Fixes: 51f3baad7de9 ("can: mcba_usb: Add support for Microchip CAN BUS Analyzer")
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/net/can/usb/mcba_usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/usb/mcba_usb.c b/drivers/net/can/usb/mcba_usb.c
index 41c0a1c399bf36104fbf8991b537acdb01e7e950..1f9b915094e64de875adff35026e9cd3beb0410d 100644
--- a/drivers/net/can/usb/mcba_usb.c
+++ b/drivers/net/can/usb/mcba_usb.c
@@ -761,6 +761,7 @@ static const struct net_device_ops mcba_netdev_ops = {
 	.ndo_open = mcba_usb_open,
 	.ndo_stop = mcba_usb_close,
 	.ndo_start_xmit = mcba_usb_start_xmit,
+	.ndo_change_mtu = can_change_mtu,
 };
 
 static const struct ethtool_ops mcba_ethtool_ops = {

-- 
2.49.1


