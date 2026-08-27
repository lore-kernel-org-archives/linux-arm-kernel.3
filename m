Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3189C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=; b=KUWlS0Ermqfw8Ig+W6gH2Yb+rG
	gWpieTlOogmqGFav69xwVHPuoQAjdUde1meudrJN6VNpCOQgUDGL7HqXqxDMaNSXm9K5MGtMzgLSv
	g6JPohV3EcMymmuiJMUf5lCE1bLCsyaAT3kMrceU8Cg7ITTfFOkrGqeaOfwzeqB/+rwCvOb3K7byb
	wsgqRid7FOIGcQ6cLror3EDwWg7GMEt7M/TutxXj61JQko5nFAnOCh+eYVFxXvavVohZsKWxrw3wT
	lka4zbVyhqTlZVegZk7II7waPbEXVfnLdONjUayesDMxbs6iKFJW8HK+CPI5IDhlvqvHgKWDD/jrP
	gCEbFoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhTF-00000004nf6-17CZ;
	Thu, 27 Aug 2026 21:17:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT5-00000004naB-1sWN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 21:17:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49954b88fffso1753495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865421; x=1788470221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=SfZ6MLhSa7mFsia56I08N5CTImTnv7zUCJlemq+9xK3YQyy/o5MOiJnLhFpELbf3w5
         wJwfNnQuUNHyeahxeszZoYR5GitO90mm/6+613paUQy+pUe90KVoitTDec7jeOTIUyq9
         BSjYQIiisioZwErv8KrOAR+wuZ/8m3oK0ycCJGNBvo31PfTYvDPifKSwfjuowfUmw2zi
         TnRcCS28eJzylEVt2Oi1rOy8ChL7FKO+cOaF//rnhlsyEVHFqoBOsvE3kd67eSA+yCAs
         jjQj+CoklEYrYJldEdfYv5fpsWqgJEfxPM2rDTjqZcagS4ILep9+rPN52WV/g+toTYfh
         hK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865421; x=1788470221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=fNnxUzCNkQ0q8mnlYYp2OPujb1IKbcKOrjg/BhLhiFMZMjAwAZnSK+Mp8Hsp4EHdqq
         9uM4rM7Ia/0aH3KrF9pj+rft+Rgu5/AvtunhlyUzx/YOMHSJJ/ngR/RtvBRXKFeeKOcY
         pSXwr5egs/vD3Qh6W8FhZc3pH2YtfYg/qvn0GzOa5qT3iR4s/+5zkjyP/8CFzhejvMfT
         IXhILCmdGQIhmkPJoM7/9iqGGFi0Fh4FxfRo7+IVKT9NIiOYshJU8bRZtRpIrqMQWopx
         y0xD1+PeE16wEg3nq8zf+MLkY7Hr0Kq5HB4/EQR5N8qyL+UHSaG5yxobyYktKzIKtWPL
         bM8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp8LTghFKCehNK3cFbwnyU3GPk90tvjtrgbVOwOJcEzPj2f5lF9UAKO4Mt8Mb6MnWYsgh8j1T8JrcTVHXGbn2H2@lists.infradead.org
X-Gm-Message-State: AFuF++nvAMtgrzIP7Y/T4Me6iqioOPHE905jhTtlq55sRptEzXKODxTM
	mjp6kxBP/cNDaZgxh1ErtwG2nKhcrVKnmiRAWbKxnsgXMh+lIoBiWh5LXKKUmGK2Rhc=
X-Gm-Gg: AR+sD103D2CDBr9KvAhsKbr1x+DK8Tij4p4wi40EhnqgS+RIIK1D7e2rW/R3TXqmJ28
	PTSCA0LZ4U/hWyJ4y0h1v3+/6mhtuuKXB1jpFgPuaxyKJiBwq8BZzWaceuxfUw7xooVqt4HT3Yf
	gEwHLMswaAXPP+1Ba0MYrzYEyvxTQ8cyENCGpf978CbLqGdFX0aB8K7eBWXfl7Lo5Z+whwz3+ho
	24bDzQl4QMiNgF+HcEOAFfPogpR8YGym6f7AiE54HS3t/EjGT3Shw3qwZGQHujZmi6HnsVNoJg/
	ceTCKO3gaote+fpudVbFY/DG6E5aIaxzvJp28JneKPV9Urs5/2k1PqT3Jf1xs1CeBAdy8ETk3Qn
	Y5qbO/mSWO8MZ17J8AQPhuKqOfG/5c755VBQ3gqcJ3IyfibYM2rdVQGCJwZlTYNoJIPqF4NGFKA
	5dvajzUAN/vRATE22vhWac5sSLDUL+ywKzWbox4UXgRnrPUC+GtVDD0oIN
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr27682655e9.8.1787865421583;
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Aleksei Sviridkin <f@lex.la>,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Fri, 28 Aug 2026 00:16:52 +0300
Message-ID: <20260827211652.63504-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211652.63504-1-f@lex.la>
References: <20260827211652.63504-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141704_431628_4EF2267B 
X-CRM114-Status: GOOD (  19.29  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.

So ever since EEE support was added, ethtool has answered "Not
supported" on every MAC that uses mtk_phylink_ops, and
phy_disable_eee() has locked userspace out of turning EEE on. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
and that is unvalidated rather than known unsupported: MediaTek's SDK
driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
unit of the wakeup timers is undocumented with the port clock at
2.5 times the rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. It is a fixed link port with no PHY, so phylink had no EEE to
manage there before this patch either.

Pre-existing and not addressed here: mtk_mac_enable_tx_lpi() programs
MT7531's reset wakeup times (17 for 1 Gbps, 36 for 100 Mbps) whenever
it runs, as its own comment says, so they now apply to every SoC driven
by mtk_phylink_ops once a user enables EEE on an eligible interface.
Those values do not appear to have been confirmed for MT7981, MT7986 or
MT7988.

v2, with the full argument for leaving 2.5 Gbps out:
https://lore.kernel.org/netdev/20260824024117.46154-3-f@lex.la/
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..37a831f73da6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* MAC_MCR folds SPEED_2500 onto MAC_MCR_SPEED_1000, so LPI above
+	 * 1 Gbps would be governed by MAC_MCR_EEE1G and is unvalidated
+	 * rather than unsupported.
+	 */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4969,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	phy_interface_copy(mac->phylink_config.lpi_interfaces,
+			   mac->phylink_config.supported_interfaces);
+
+	/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not even when
+	 * a rate matching PHY drops the media to 1 Gbps, and
+	 * mtk_mac_enable_tx_lpi() refuses the xGMII modes outright.
+	 */
+	__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+		    mac->phylink_config.lpi_interfaces);
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (mtk_interface_mode_is_xgmii(eth, i))
+			__clear_bit(i, mac->phylink_config.lpi_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
-- 
2.55.0


