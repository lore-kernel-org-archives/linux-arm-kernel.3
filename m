Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E7CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EKnlnckxkADslXtJokLa5AGNX78GYEKcN/BuvSjY7yo=; b=E9UKzvaPnnJIXmsrFoKjCZqaSP
	b2GZBa6mDMZzI6YD832eVKF5TmN1kMaobdB5Lyq6vll2OlWphKaqufLTHRY926PTeiGm9yjy2xtFU
	vhzKx/5Lje/v1JL8RXzdKo+txfG+ZIp4xe42Vm5f5EeDlOGgAcEAbBiIjIZwgNaPLUVGdVEmEKTOp
	fh7YXylEBO0NfzkNW8HVVRqOzlAF5r1TkADtjTotweTJwjcGJChoG41qC9nSUJr5Q9FuZYyuRE1a/
	P4h25HqY+mp+6gOc0+/ylsBGzZ83jB+jBVX6njkQCCVF/Z+GeKsemArUmcoNTZIOW7qpz8ClFOLjU
	QKFm8MQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLn3l-00000009UnW-2qda;
	Sat, 09 May 2026 19:09:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLn3g-00000009UkU-3GP4;
	Sat, 09 May 2026 19:09:55 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id AEA365FC5A;
	Sat,  9 May 2026 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1778353786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EKnlnckxkADslXtJokLa5AGNX78GYEKcN/BuvSjY7yo=;
	b=JIyIYh3D0cLYIYGhraKVBwFzRh30NYLao4sogDADXfU7YlttF96e8Omu2P7gRpxhDksry2
	2GevANviVXcmwOO/KBtufa7gO9ogC8xErua3A2IaH6xZ5thuk48eZKxFK7AktD9h96gH6e
	XHmy2V00CQMKy1sJxnyj05aN1GzYUOE=
Received: from frank-u24.. (fttx-pool-217.61.152.172.bambit.de [217.61.152.172])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 707611226E6;
	Sat,  9 May 2026 19:09:46 +0000 (UTC)
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
Subject: [net-next v8 0/3] Add RSS and LRO support
Date: Sat,  9 May 2026 21:09:29 +0200
Message-ID: <20260509190938.169290-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120953_163644_0F36A8C9 
X-CRM114-Status: GOOD (  10.83  )
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
  v8:
  - fix more sparse errors, should be all touched lines now

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

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 828 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 177 +++--
 2 files changed, 792 insertions(+), 213 deletions(-)

-- 
2.43.0


