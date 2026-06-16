Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E721CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJJvLQcsXRqIV9bKinu30GBt9W6FiGqkHOghRxLofTY=; b=mEO1ZiG+0cEWwhAxva/O25THxm
	Zn92ebPFbNWrq1o3zqK8kP2QfvlOToafyioxkkT10MA34KvrbROI6m9/YtOLSaFm0woyuDnJJPVUx
	qLFLkTHcgnZYtEuIrKAarZUcfngSCSGpy0voKRnnti22S8myCndkPk6nMP/B/0SPbuDQMs5QZyuv7
	KMhtTFw4pE7rLccenbhLRbpxZfEa4vmcyHu1dp2DoUkCJX0cRiUpoaiHWQ/ULWenv99Luyeu6Vhif
	hxuwoLF6QeIVLwhbBHOKsfEXFWTgUlntwAI6ztuVhSgQ5n2kDu9K4/kDF4Rn5KUmlEgeGMK2WtSXV
	jKeW3esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZThj-0000000FpHQ-3jOi;
	Tue, 16 Jun 2026 13:19:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZThg-0000000FpGb-2RYA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 13:19:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b64c8311so44923145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781615982; x=1782220782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJJvLQcsXRqIV9bKinu30GBt9W6FiGqkHOghRxLofTY=;
        b=LToDT1ZL7ryGpK8DkQECgEU8lQ9kfdPABoNLrF22yreXtaBfMc0LuJxFtbderiL/Z8
         xnc+DTajt98QPK1LBN/NXhX6WwZzgOU6Q8JPguuZrWG+iOgAnMh4VPUOnbAlkuJEyWd+
         dtDplwZcev1u69vdMa0MypSjbc0FSjHNdedlHnzJs36EEaPnuPwCh2JrZVgGmQX1dWB4
         g/y5Ymb5/i0QNiW+qS3q+YORDpXXEv4UalzA94VE6UPpjK6/IrhBi39BT8910qJTwG4u
         zjWlSAdHmiy9TK1COgDy9rkDPlKekhSGWF/gVZrg3u+21+B2zrkXMjHX1KWJA/gSxeJs
         Oobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615982; x=1782220782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJJvLQcsXRqIV9bKinu30GBt9W6FiGqkHOghRxLofTY=;
        b=JjcVpashYuNrc98H12a3J5NM+Lf7HQiq9+4rP5bfGLa7Od7zkQ1r0y2nlDanXMpiep
         K/MKKbQl7j9qP5HrnMzxxnrCyC+XEhqeXzQQntFdPpHm++fyZiUoaCU57O7UZuoJEEhA
         CpJyqeRpRPr8FqZy497aW0KOy6K+5ANgZKbg/dG4hK07vFJBiPuVYv0/k+t9JUFHfndt
         2ZFruTFLkISdF2jByxZt2aQvfKGErEAiy3Fzo+hYT/BY5QKxxdOrgRbYVQjOTR5A5mtB
         X0CG8EOBiqdWljgeSeTKfP91bFLxxsXtqBEq/Ew97tg5sALNopd6ggRNn5aCkiPzfz1y
         bFbA==
X-Forwarded-Encrypted: i=1; AFNElJ/0+bPks92wdc573d36iNmavX0bSAM/OF+9/Z7hMWAfJbklwuPSyNfZHi9AqkL6r28mr3Qxl36dXt3eugPJdGoq@lists.infradead.org
X-Gm-Message-State: AOJu0Yya02zIPd8Yy6o/uzvN4bFdjdyL8a0ia2H4KFAf85s1kasczHTS
	AXWaRvjMaHkQhdSKECGPjZp4wDWinlcg+pgrvlgaLvhNP54HYZ/5xEGejwJz30YLGIs=
X-Gm-Gg: Acq92OHSq4GActPUJEiN6ah7aNboYPt4NEB1ZterBu6Z2LTVMe3hZ6wTboT9a472bGK
	Jdus/UOD0v+ee6pweDkl/VCPjguP8/uQhDE10MVgd5OFSmzEWTDOrfbIwc91OOQxhkPE960CbKN
	Ar9B0FLnuZIBrA7Ep7px2fa3JxPAnKdyLnFVuI1vALFJn0BKbmx4bFMZZwM3HEljBnWcrDOAu5z
	9nm4AzTQRi9pvRYyXFxRRHE1PCipqyGt8x+h1KyWixXskEPxQWCly39bK7OW6kb7fypPCJy+Xhr
	zo2nuU1mwR9DidfFA01luR/IodfcAUcAszfxyweZ7viCcqx5ErKtY+3vhfobKaF3nUFyuzM3e4D
	st6yOkRkwdpNMF3SYrQeZXKBnRqb3pZzKKf9A7voqSHr7rYlhBY5jMN2Al/0nBPhQBXN0HXm0I/
	UjBeVawr64Iz8KpxEwlGTO
X-Received: by 2002:a05:600c:6812:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-4922ffb7525mr56959135e9.26.1781615981714;
        Tue, 16 Jun 2026 06:19:41 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm83714245e9.12.2026.06.16.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:19:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: netdev@vger.kernel.org,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Lukasz Raczylo <lukasz@raczylo.com>,
	Steffen Jaeckel <sjaeckel@suse.de>
Subject: [PATCH v2] net: macb: add TX stall timeout callback to recover from lost TSTART write
Date: Tue, 16 Jun 2026 15:23:03 +0200
Message-ID: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_061944_632700_501C7D8E 
X-CRM114-Status: GOOD (  13.34  )
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

From: Lukasz Raczylo <lukasz@raczylo.com>

The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
the TX queue.
While the exact root cause is not yet fully understood, it is likely
related to a hardware issue where a TSTART write to the NCR register
is missed, preventing the transmission from being kicked off.

Implement a timeout callback to handle TX queue stalls, triggering the
existing restart mechanism to recover.

Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller")
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---

CHANGES IN v2:

- dropped the rate-limited log message
- avoid incrementing tx_error as this is per packet

---
 drivers/net/ethernet/cadence/macb_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a12aa21244e83..fd282a1700fb9 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4522,6 +4522,13 @@ static int macb_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	}
 }
 
+static void macb_tx_timeout(struct net_device *dev, unsigned int q)
+{
+	struct macb *bp = netdev_priv(dev);
+
+	macb_tx_restart(&bp->queues[q]);
+}
+
 static const struct net_device_ops macb_netdev_ops = {
 	.ndo_open		= macb_open,
 	.ndo_stop		= macb_close,
@@ -4540,6 +4547,7 @@ static const struct net_device_ops macb_netdev_ops = {
 	.ndo_hwtstamp_set	= macb_hwtstamp_set,
 	.ndo_hwtstamp_get	= macb_hwtstamp_get,
 	.ndo_setup_tc		= macb_setup_tc,
+	.ndo_tx_timeout		= macb_tx_timeout,
 };
 
 /* Configure peripheral capabilities according to device tree
-- 
2.35.3


