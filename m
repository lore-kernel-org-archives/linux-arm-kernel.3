Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AADCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ytYA9HEDY46ms/6Q3YJWrz7/wr7uatEo4ryGtqURyOU=; b=mRd+YdaznWe0fdHD+HLl3ZK7t0
	nGaeW1uMOTGI2zkSNHjHM+ta+G98UEJMgm5f09LvI8SkwY4OnDXXV4KM71U3pa8TtSkXUzJ5guUF8
	XZDRL+zF0YRrkApi2ckWsHssZzWmRhm7Dv/j66emnk+y5B3JnDxvo/+WQH0Y/TfTwr8iOiu4yp6JG
	eykhTR+olRRp3xvx+liTCmimpDSxTA1DBqPQO+tuCXpKlHRuErCmIrtgrnKlvkjXKY/zsUBzyuNyJ
	EcLTbtd8au3JpmbYpnzUiYK+2sL8zSPF61VHd+I+boROG6IsdgbXeFPstbdPM3GIAgTybx62rgrdk
	FPpz3Fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZur-0000000BJnP-1Usp;
	Sun, 03 May 2026 16:43:37 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZuo-0000000BJks-26NR;
	Sun, 03 May 2026 16:43:35 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id A2E835FAA9;
	Sun,  3 May 2026 16:43:22 +0000 (UTC)
Received: from frank-u24.. (fttx-pool-217.61.145.231.bambit.de [217.61.145.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 599771226B5;
	Sun,  3 May 2026 16:43:22 +0000 (UTC)
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
Subject: [net-next v6 0/3] Add RSS and LRO support
Date: Sun,  3 May 2026 18:43:05 +0200
Message-ID: <20260503164312.82699-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_094334_681691_11174BB5 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 810 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 172 +++--
 2 files changed, 776 insertions(+), 206 deletions(-)

-- 
2.43.0


