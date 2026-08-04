Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0556C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=; b=OkyUXb1oLiPgKfVyHUd7Urji40
	9yWtj0kGwsewaWt5SPIusQmW7gGSOlAlSzXRLv5fQ0hhI0aZ5lD8v6ruqRBcCJdvWj7FZ8l7UTAIx
	Bwb9TLwwMNoNlVUVK0iMMQWXTH1Vnt99l70Fa89J1iICFrXAyUmQjxnrJkirDzHP+BKesZZh41l4w
	31ZOCuC2H568PVOc9mhmmzYyfSDM7qBCIaZjUoUY5isZaxt3/SARfJHxJJJ8ksPzmcAsdG67HAdRz
	1zHjivm+XZ+cIpG+VfKbyiGUSIpdkEqrmu5LXootVBMxX5R9TU1gfYX6AemshDd9sBGZwb66kSMan
	6wnK+drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQq-00000001iUw-3M53;
	Tue, 04 Aug 2026 11:35:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQo-00000001iS3-0tVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:35:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbb973e6749so4994843a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785843337; x=1786448137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=;
        b=lJqO9jUD0QsGG32XOGzfuYq3yobUPEJNkmh4Q0Q2duGMpZfgXkU5KZ23h6n8YS1zwa
         JFabZUNGCvECiATCzIy3hqK4i1dpqnHcAwWsFSsIlcIpGAl5f+e/hphIfKM9jwdXOLn4
         drNA6OWXQbWydK4Atk9s0V/EX6hbQtj35FHZypZrTFRGU+6fqn3lJmMngr774yonisap
         BPZxWicv5/0sDvEsqcEFM1/FB1CDKZ10tcqsUs4zRuzexJiAeyjTPAaWX5S0ayVMxp3C
         RPCossCijJ1eEQmi92lSKqf5LrIXBRNfbendKUU2W8q5IF5nHb9f42Rf0az92FBc0Sgk
         n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785843337; x=1786448137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=;
        b=KVS1XL8ScV1F7/CyADLfS3Pr41U8gTajg7EsKVjTWoW/PNoind+noTQ/o8cRGgzucc
         qQph80lQlYfFB21/m9BjB1PFTnCbHeAlqjEfoFFSddV1fAD8IBSj2eHFm1a2242AFIF4
         7m68IbRiCNBa+PFQlf8ZvB5imdxfNrkIs3vj519XvHIjlDLj4tNCrSxBswZO1DI/CNHH
         olb9n3j7pCdfVLMRjqOndxgYNHePKxhHSRwk/xhN8tD6z4RQI5eNnJuP7gL2tVhLnqRY
         /EAxgT//hh3XRjEpbVlIyx+zs/VOgisy7jY8zTIvcKTqX2uDmQplucNGebyeZxJo88H5
         Co7A==
X-Forwarded-Encrypted: i=1; AHgh+RqNuhw/rutNQ9fEtMkPdJzocM8lLYcEHeD7DJ2MCO8c4qwDumqHQ4M0SQBnlIGbeaUmyAYArzrJZN5AOS7DBVx5@lists.infradead.org
X-Gm-Message-State: AOJu0YzwI6bpVFq/Fu4fQzG7VpZVtaTvPrLhEMtNYX/I7jdFutczC+fa
	QXzyaUE1WrqiUZSyQx4Aia0BLfcC36zErSuSdhXV9DE2GPd1+eGbYzJq
X-Gm-Gg: AR+sD128ISCW0OK9j4cqzEcDA2NvOezsGIVjQCJbmsYZmVJ69RYE5z7ynwIEqZMmkMp
	8/Pj6i5AVhuuCqrun5ptk9AvHg8m6tETUJPVaIIVsl8Pao8uKfrcY9dtGy1xpGGtBbxlv1AuCy5
	2Kf2quAR7WQGeCdXjbtGY3f7Y8tXD//xByIFozdPa0nAQAYJ/6CnyFqueTBUFATCbz3pc2Vcyif
	LkZpkCz2h75PHRl5P9EZP+T+Veu/x83D7+zTp3lZxRqj8Z0+e3x3Z+yN2wucdwcm1t2D76yhIHE
	zs0QKgDC4ZtkIn8c/9Dcq++Tw0AB5teHzqoNj4i3P6TzLt4cjgZR5V4D07hIuzpslNftkU9VpbE
	ijwHsFxjF76A5nqzQyrCH9YzaIf/KJ98wmvA3h5Ia4LChg0DgvJ77ZFUr+1LhCGcRQZ1fFeZt2p
	oNbcgPk4ioSe0y/60dPpqLWxCaRxVnlkEWCGOHU8xXRGWekMDDdMMndD/EJX05IpJMQ3tV
X-Received: by 2002:a05:6a21:3a47:b0:3c0:278c:6a31 with SMTP id adf61e73a8af0-3c92a51df73mr13770829637.11.1785843337304;
        Tue, 04 Aug 2026 04:35:37 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm3569493c88.5.2026.08.04.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:35:36 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX bits
Date: Tue,  4 Aug 2026 15:35:11 +0400
Message-Id: <20260804113511.3371248-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043538_265427_E1DB1F09 
X-CRM114-Status: GOOD (  12.30  )
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

MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
from the RX blink bits instead of the TX ones, so both TX masks are
identical to their RX counterparts. The TX bits they should be using,
MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
by the per-speed branch of mtk_phy_led_hw_ctrl_set().

A TX trigger selected without a link trigger therefore programs the RX
blink bits, and the LED blinks on received traffic. The masks are also
used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
as a result cannot tell the two triggers apart: an RX-only
configuration reads back as RX and TX, and a TX-only configuration
reads back as neither.

Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")
Cc: stable@vger.kernel.org
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/phy/mediatek/mtk.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 320f76ffa81f..79e09727b81b 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -53,15 +53,15 @@
 #define MTK_GPHY_LED_RX_BLINK_SET		(MTK_PHY_LED_BLINK_1000RX | \
 						 MTK_PHY_LED_BLINK_100RX | \
 						 MTK_PHY_LED_BLINK_10RX)
-#define MTK_GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_1000RX | \
-						 MTK_PHY_LED_BLINK_100RX | \
-						 MTK_PHY_LED_BLINK_10RX)
+#define MTK_GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_1000TX | \
+						 MTK_PHY_LED_BLINK_100TX | \
+						 MTK_PHY_LED_BLINK_10TX)
 
 #define MTK_2P5GPHY_LED_ON_SET			(MTK_PHY_LED_ON_LINK2500 | \
 						 MTK_GPHY_LED_ON_SET)
 #define MTK_2P5GPHY_LED_RX_BLINK_SET		(MTK_PHY_LED_BLINK_2500RX | \
 						 MTK_GPHY_LED_RX_BLINK_SET)
-#define MTK_2P5GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_2500RX | \
+#define MTK_2P5GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_2500TX | \
 						 MTK_GPHY_LED_TX_BLINK_SET)
 
 #define MTK_PHY_LED_STATE_FORCE_ON	0

base-commit: 1a35da325cac4d5bcad76a2aa943408a6f1d9000
-- 
2.34.1


