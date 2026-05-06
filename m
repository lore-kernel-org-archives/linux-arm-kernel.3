Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA224CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGY2haGv8b75oYTLHj6+B0R/plUm275hXnrLqKepFuo=; b=unwA+7PMnZSG21FhCKavzzUXWN
	JBtLulkXhE/Vkv3e+KziZ8UJDZdwzY9zzJNhw2TALz5Cm7J37DuMeQiBOHAL75yDdXhRtFDmD7Wwz
	SJ8ZcyOthnQPGHDhnHWqyIN3Av/CQDd8pJMmd9mHcNfuPVVgLHPHZ1Shknul48TLHtswv7j22heP/
	N942E9vBUJD/ss6v6ARnkWxd4yBpaxiDfu4zPKUZuGy20UCa7txB6ZwtUkruUKZ67k735pyrc57Cj
	J6OQYeeZI6IAhOrfoH80SEkBgRvc9pP5EcDk8Ja5gMqCteElHgBoqRdJTj3+Y9fqMzAkkES7aQJ+c
	F3k0g/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhuw-00000001s2t-3ZrL;
	Wed, 06 May 2026 19:28:22 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhuv-00000001s13-2Hex;
	Wed, 06 May 2026 19:28:21 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 0321B40A12;
	Wed,  6 May 2026 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1778095696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pGY2haGv8b75oYTLHj6+B0R/plUm275hXnrLqKepFuo=;
	b=icYpUfj2T1Z9IU6F8HCGW8yRTNAPPhSOZSrsu4IKoPa3irT2ufHQWrCYQ9cIPp7cE3Xc8Z
	HwT8ASoJAwcoX+QsY6Tap1VY/GjKa7IaLBuv/WLjwaSyFOuAa4IwYLPaJF1FHeKMLEFndO
	GbgXRKIhHex5giGyI9Vmm5GuGhqIVlA=
Received: from frank-u24.. (unknown [217.61.157.0])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B840B1225E7;
	Wed,  6 May 2026 19:28:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [net-next v7 0/3] Add RSS and LRO support
Date: Wed,  6 May 2026 21:28:00 +0200
Message-ID: <20260506192806.143725-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_122821_807923_B303383C 
X-CRM114-Status: GOOD (  10.72  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This series add RSS and LRO hardware acceleration for terminating
traffic on MT798x.

patches are upported from mtk SDK:
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-08-mtk_eth_soc-add-register-definitions-for-rss-lro-reg.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-09-mtk_eth_soc-add-rss-support.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-10-mtk_eth_soc-add-hw-lro-support.patch
with additional fixes

changes:
  v7:
  - fix u32 vs. be32 reported by patchwork check
  - add L4 PSH check
    https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/7521c42b0bd5be20d52e20b110daea8c756fc069%5E%21/#F1
  - Add HW LRO max 4-depth VLAN support including switch special tag.
    https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/35490cec6a2e5982532935fb0a1c884f7c4efdb0%5E%21/#F2

  v6:
    - no RFC
    - rebase on netnext (7.1-rc1)
    - drop unused MTK_CTRL_DW0_SDL_MASK
    - e33bd8dd7f1f ("net: mediatek: convert to use .get_rx_ring_count") moved
      ETHTOOL_GRXRINGS handling from mtk_get_rxnfc to mtk_get_rx_ring_count
      move changes to this new function too
    - fix some Macro argument '...' may be better as '(...)' to avoid precedence issues
  v5:
    - fix too long lines after macro changes reported by checkpatch
  v4:
    - drop unrelated file
    - rss-changes suggested by andrew
    - fix MTK_HW_LRO_RING_NUM macro (add eth)
    - fix MTK_LRO_CTRL_DW[123]_CFG (add reg_map param)
    - fix MTK_RX_DONE_INT (add eth param)
    - fix lro reverse christmas tree and LRO params suggested by andrew
    - drop mtk_hwlro_stats_ebl and unused IS_HW_LRO_RING (only used in
      properitary debugfs)
  v3:
    - readded the change dropped in v2 because it was a fix
      for getting RSS working on mt7986
    - changes requested by jakub
    - reworked coverletter (dropped instructions for configuration)
    - name all PDMA-IRQ the same way
    - retested on
      - BPI-R3/mt7986 (RSS needs to be enabled)
      - BPI-R4/mt7988
      - BPI-R64/mt7622 and BPI-R2/mt7623 for not breaking network functionality

  v2:
    - drop wrong change (MTK_CDMP_IG_CTRL is only netsys v1)
    - Fix immutable string IRQ setup (thx to Emilia Schotte)
    - drop links to 6.6 patches/commits in sdk in comments

Mason Chang (3):
  net: ethernet: mtk_eth_soc: Add register definitions for RSS and LRO
  net: ethernet: mtk_eth_soc: Add RSS support
  net: ethernet: mtk_eth_soc: Add LRO support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 816 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 175 +++--
 2 files changed, 785 insertions(+), 206 deletions(-)

-- 
2.43.0


