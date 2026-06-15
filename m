Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3370CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atumCYZH4kfixZGFrkvd6pjJYdqMUcUkjREboEVQyOE=; b=lchxdDhx0GXU2r07N/ggtdFUJi
	7SmyBym6eruZFRzYGVIuOUrSFK7Cj5qqNrmg7Ppw926UEmRcsk33cbGFETPKQ6P/BpuXS35VTyT8E
	ICaCIF5SZzhKT4g9tfOes4AQc/4HzvCxoMd+PaEmMdzjEp3P845NCFh1RhBoytXso4MeTFTZ/qC5G
	yZ68qqbqV8l0hiXJDHm+Mqs/NPU4/ft1DdZjC5vMdBEJUlwGEcEE67mXjct0zcWN/Qyq8sVrJxjfm
	qnXzCaj2Y7zkRSQPspeKctnqyV62c3wPoom2Pu1cGpvERSnML60fOvdFEMLSFdk1oT3JbcDlqcCtB
	h922FUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8yB-0000000EU2S-25W8;
	Mon, 15 Jun 2026 15:11:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8y8-0000000EU0p-0Mil
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:11:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso31073825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781536278; x=1782141078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atumCYZH4kfixZGFrkvd6pjJYdqMUcUkjREboEVQyOE=;
        b=U7K3r36HRoEQt3bJevAUz1mW/6P17WHnoVb6XgNNo7L86GCTvzYsr8Cnzz3E7l/qtd
         g2ZLVADR4wtmXlDvpYzx4hrxgvxa6ilcT5RB2QegBesIsH0V9/vQrAy9RG4yaNkOU9g0
         MAyTfl/NaCSHn7OIb5XCMn9Vk21yDEt7/Xo7+LGXQoTCk6OeKr72Ty8jGS2rtwDag+62
         ObRdjhiej7bb8cxIV8dN20E2exkDZhxXIu/WfWSVosObf9hkMHt8iDLpyz3gV/wxMev4
         xOWo+jzDnvdNByzYbKaG7CglDYNW4QUj0stpMssS8DQ6H/HoUWY3Ws1zrHF7qp6VOny+
         1/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536278; x=1782141078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atumCYZH4kfixZGFrkvd6pjJYdqMUcUkjREboEVQyOE=;
        b=Nh4KjYbG6/4T9dkhBh5afPUdqb+kYsotAHAiJ2Hve2Ae/c3tKq4AnRtrIsoqn+QdKg
         bFSdTGfuKyy7XlwDZJ8RdseMiaBOKZIFGrVA5yYPMnNpqNlkw5Urgy8Aj9Rka3edYy4B
         3MLOjaQXjReUTeIxQgYlixubKTRFOK71z7dyOrz49kkGpsO+RAwZQdLdav4N6gB7ZqM4
         GQ243TuTvsrHaf+gBbsuCbylFfWTeAQlpB/mo9Sqra1ih+6adO3uEHoTISgyb9bidvz8
         sgWydhUjTF82meQMRoVISJZv28EbHaB2qI51qgXbd7JB43vokYIj2/6FfCeLdNY7QBYu
         4ouA==
X-Forwarded-Encrypted: i=1; AFNElJ+q9GlFd0QrfuXoXiTxUVuQCQsZuQkL1vCc71WdTGCMEB7Fhqr/Qc/HSR7+lU8tvnPLL1F5XKkndvx3fwc4aqgs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2gqO8yo4se6bhCq96pk+rRIhDhlz6IGmaptnmggAdyjIZbX/+
	6hWZrJvPTOEdhhRCXWB+0+C8sLLFGcd6K4eJXBdt0AfsxFihfwvqmqVA
X-Gm-Gg: Acq92OHF7HYW7iDOt7AX97libVKC183hKVvOrkdUKcDuuTWJzLoFC9jxwyD8I+OqP7q
	VVZgOApQApr1ZLuSLpIt4QDqCLEBjj1dDOtISb1MRaRqnTd/5puwzmOOpzCxiMTkBbRhaYrlbwE
	B23b3TRsRvqhfnoxGj4AkNdj0lg10Vk3n+235xZWiN3ELICBw9MNbN2tWBlzDVEFMuYCZ0hAZrM
	9IXvj5v6wX3glq9CzKtFpptHeoag8dCcpdlUGLzxxX+cFBwaEQ4T2kTZgvYNT6IowGttmsyr/uy
	afGlcaWPVc3S4RvCIZEGS5cWSOKUijJ2mvzRQTTYPeQccFh9meGo9kaucsTHSyvd1VPNnuTf/P5
	R5lkcGbzd9cTk5bkPXLtpxsuvifI/s+LnqrLc8tavfcfwaM5DRJ4/36MeMTfSB3K2+n9pvGuUPG
	6dzIs7gUHqQ16tsWxzNcNH8K0+4auatEKjY07QbUZoLQUl2xucMq+nOyI=
X-Received: by 2002:a05:600c:3b02:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4922f3cd1a2mr6544955e9.30.1781536278038;
        Mon, 15 Jun 2026 08:11:18 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492203d08bcsm260449915e9.13.2026.06.15.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:11:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix supported_interface set after phylink_create
Date: Mon, 15 Jun 2026 17:11:00 +0200
Message-ID: <20260615151106.15438-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_081120_136563_E044DD1E 
X-CRM114-Status: GOOD (  14.22  )
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

Everything configured in phylink_config it's assumed to be set before
calling phylink_create() to permit correct parsing of all the different
modes and capabilities.

Commit 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988
internal 2.5G PHY") while introducing support for 2.5G phy for MT7988,
probably due to an auto-rebase, placed the configuration of the INTERNAL
interface mode for the supported_interfaces for phylink_config right after
phylink_create() introducing a possible problem with supported interfaces
parsing.

While this doesn't currently create any problem/bug, move setting this bit
before phylink_create() to prevent any possible regression in future code
change in phylink core.

Fixes: 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988 internal 2.5G PHY")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7d771168b990..5d291e50a47b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4960,6 +4960,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
 		mac_ops = &rt5350_phylink_ops;
 
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
+	    id == MTK_GMAC2_ID)
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  mac->phylink_config.supported_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
@@ -4970,11 +4975,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink = phylink;
 
-	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
-	    id == MTK_GMAC2_ID)
-		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
-			  mac->phylink_config.supported_interfaces);
-
 	SET_NETDEV_DEV(eth->netdev[id], eth->dev);
 	eth->netdev[id]->watchdog_timeo = 5 * HZ;
 	eth->netdev[id]->netdev_ops = &mtk_netdev_ops;
-- 
2.53.0


