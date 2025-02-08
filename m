Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B0C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vmH4T18OZXoGg6ed05XdGXmv82tavSUJNIA4scMc1EY=; b=BhzgYZsAvaFwesTEd4dGp4HPnZ
	6RuRgJ2oa8gWPhDiVcIcwa/UVwBxMyjuq1WzxP5560DQO8kkR55n7HdNeBOS15rPrHkD4vZmvO9qy
	+xmNKxIHN9r+umQzY1TvpW5EHxrlNg9CCE8quWISpf/zk/8BgkOuq7Vz0Bqqbn6UtOaCGMkP+DxXl
	os6shxEId3c8r5ASaBrCUaIiysNJ2Ck5W7b7zzpb3cygyT93LDpaBqzUs29AOCSE+ZTQHtpbnxlIE
	DEOePwIuSiw142HJAuqPYzM8AW5Rh6yImZthze6QA1JhS/F7ZFUgrijQTeBp61baKhDVxjdugmURo
	qYKvVltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiLQ-0000000CmJZ-3X3m;
	Sat, 08 Feb 2025 10:45:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiG6-0000000ClgR-1YKC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:40:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tgiG3-0001Sg-54
	for linux-arm-kernel@lists.infradead.org; Sat, 08 Feb 2025 11:40:19 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tgiG2-0047tF-35
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 11:40:18 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 870BC3BCC7A
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 10:40:18 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 0D0D73BCC79;
	Sat, 08 Feb 2025 10:40:15 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id d4e51cb2;
	Sat, 8 Feb 2025 10:40:13 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sat, 08 Feb 2025 11:40:10 +0100
Subject: [PATCH] can: rockchip: rkcanfd_handle_rx_fifo_overflow_int(): bail
 out if skb cannot be allocated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-fix-rockchip-canfd-v1-1-ec533c8a9895@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAIk0p2cC/x2MUQqAIBAFrxL73YKKQXWV6CPWZy2BhUIE0d2TP
 gdm5qGCrCg0Ng9lXFr0SBVs25BsS1rBGiqTM64zzvQc9eZ8yC6bnixLioEFZoCFd15ANTwzqvV
 Pp/l9P3aUMVNkAAAA
X-Change-ID: 20250208-fix-rockchip-canfd-ce09e1e424ce
To: kernel@pengutronix.de, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Robin van der Gracht <robin@protonic.nl>, 
 stable@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-33ea6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=PwbCo7t4iBsksyF7q8Utv/uAB57+6RRB9poqEpMgKGU=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBnpzSLeZF041hFWwJznMla/rYHo/Kr6M9ABoeEf
 I30PGx2iY+JATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCZ6c0iwAKCRAMdGXf+ZCR
 nK6oB/4/q1HDynZTpdxTvLZh2kNz03joEazK23rP5OaVDdzxMt39NZgK4+AzopoLbD3O8gbIXfl
 QCtWdlnRVwaTcCtmmJqqb0yu8BRJICWoQKbf+ehUfQaztoL4BKL6/o3BYJidhBOyyuzursTjyjk
 mjbs5geqx+qrD5WdFmZ+TUomvekUehuAs5CdXOesMv7B+1L1K992GB0UFt21sb7dz4KncplCeb8
 MVhgA+oKUYX5VF4Cy5f5scDeCs7Mxry4VzUR78A9mhTVsATt1jIoY/JT/zivCTxDZSnlNbM3hra
 yYzEOI+KVXmIsvCfzVzGKSaS3TksIKFye2pf1ocqtWO7zM4I
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_024022_402273_D6755CA3 
X-CRM114-Status: GOOD (  12.18  )
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

From: Robin van der Gracht <robin@protonic.nl>

Fix NULL pointer check in rkcanfd_handle_rx_fifo_overflow_int() to
bail out if skb cannot be allocated.

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Robin van der Gracht <robin@protonic.nl>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index df18c85fc078..d9a937ba126c 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -622,7 +622,7 @@ rkcanfd_handle_rx_fifo_overflow_int(struct rkcanfd_priv *priv)
 	netdev_dbg(priv->ndev, "RX-FIFO overflow\n");
 
 	skb = rkcanfd_alloc_can_err_skb(priv, &cf, &timestamp);
-	if (skb)
+	if (!skb)
 		return 0;
 
 	rkcanfd_get_berr_counter_corrected(priv, &bec);

---
base-commit: 1438f5d07b9a7afb15e1d0e26df04a6fd4e56a3c
change-id: 20250208-fix-rockchip-canfd-ce09e1e424ce

Best regards,
-- 
Marc Kleine-Budde <mkl@pengutronix.de>



