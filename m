Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EADD78787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dX8+nZRLVwwDiv24ve8i/eYDHt3PXxPAuYMuc5xMJ3E=; b=I76SD0+4G7LaKU1X4t6j7NyK80
	DbFlqwH6YlNMDAzCCx5rTe48A/0N//7tQn4u8UZx6A99rMWgh72DNHAyPYkaW2/zhl+Id/bwx6qsk
	Yv54sXjxl9lk5eJNCOzaaDLkVSrrzEcrYqwT6vOWWGaSgnNlTYHlQ2E/DtbqUAc+fMwA7HIan1nmM
	Y8SDQjGFadphRIU8UWaXb3kDcNtNGB9CM5oNTcAjGn1jHkESs3g5/V5ByFJ5+C9Z3E3clpBa5qEip
	Tg/03jBuuxLBkvpUEG7AtboVg6VPzJIQNDe6vYnvnH13EqU5lWP4tBaVURoFWgogDxqPKj0768uHf
	gR4gAVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc9j-0000000AU2L-4AEm;
	Fri, 19 Dec 2025 15:12:36 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc9g-0000000ATzn-0VW4;
	Fri, 19 Dec 2025 15:12:34 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 59B8360568;
	Fri, 19 Dec 2025 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1766157145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dX8+nZRLVwwDiv24ve8i/eYDHt3PXxPAuYMuc5xMJ3E=;
	b=wm0IoaImO2TsqqZTfOp8+YZM929EMAiSw8WCavhjnwokoMcCwEaGTzD5WXYPFxCEzHpLxa
	MiflB094b+ZB6WHeFpmRsstgIMLTwz0773NRpe/6mOTddz+y3L4zo+OvAaVBSTr7lhEgaK
	0AZ+f8aX8sfZwvi/J4cQhCKpwk0T5Do=
Received: from frank-u24.. (fttx-pool-217.61.156.198.bambit.de [217.61.156.198])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 1FAA81226F4;
	Fri, 19 Dec 2025 15:12:25 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
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
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC net-next v5 0/3] Add RSS and LRO support
Date: Fri, 19 Dec 2025 16:12:09 +0100
Message-ID: <20251219151219.77115-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_071232_826153_9943CE8E 
X-CRM114-Status: UNSURE (   8.78  )
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

It is currently only for discussion to get the upported SDK driver
changes in a good shape.

patches are upported from mtk SDK:
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-08-mtk_eth_soc-add-register-definitions-for-rss-lro-reg.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-09-mtk_eth_soc-add-rss-support.patch
- https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/master/files/target/linux/mediatek/patches-6.12/999-eth-10-mtk_eth_soc-add-hw-lro-support.patch
with additional fixes

changes:
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

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 812 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 173 +++--
 2 files changed, 778 insertions(+), 207 deletions(-)

-- 
2.43.0


