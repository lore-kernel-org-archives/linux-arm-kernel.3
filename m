Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQ7YWrPQH4eKb2hcGi9xzFrlY9L4wPx8/nkdEx2cSuc=; b=fm8Gg9RgWIuCP6BD0pqqK1kX1s
	lLEj920zJb1uBQU3hjx2H5FFnxHUzZC55rYa0s0ORLeX1k3DuKSufAZ2+7AmI45GTADCoJO2OVIOz
	RoxVOIEERwP/lb0TWONuOtlNdTYH984ZR4E5UZkSdQ/dNwHUM08vE2kFi5OaeKfrZ3QAIqLqKLE49
	4yLvV/6uj+Cgkz95EUAEUKhjRcwrqYi53eDWD1XzGFDOWrSRCG08I+p1DZzkHOUNkHjeXk0mnXLkk
	zAw0+5HQ1beA5SIa22Z8ZMwtM6bpJ/VA8CIID02AxJFg7X0kLKWcKISf6Tcla6gNySqimmFV8bzF2
	x6hTuUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHW9-0000000DYda-0Iav;
	Thu, 19 Jun 2025 15:49:33 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFCy-0000000D9N0-3mSD;
	Thu, 19 Jun 2025 13:21:38 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 69E1B61633;
	Thu, 19 Jun 2025 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750339294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eQ7YWrPQH4eKb2hcGi9xzFrlY9L4wPx8/nkdEx2cSuc=;
	b=w/NBMfkZg41xJNspRvdAMMJP0SmfIqfenp3BdYrDzVBF5j7z30iwx+sbem56jOMphsWs4j
	k1HiEyoA9TOd3Hgh7WUDo4QypezNrQ/WL0xmCw4Lq7lgNjXj0RgG3OH93xhtFfe3kw3mRp
	+wfmwaeZe9Q5+ohKOglSZcdMgvGrdbk=
Received: from frank-u24.. (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 246471226B5;
	Thu, 19 Jun 2025 13:21:34 +0000 (UTC)
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	arinc.unal@arinc9.com
Subject: [net-next v6 0/4] rework IRQ handling in mtk_eth_soc
Date: Thu, 19 Jun 2025 15:21:20 +0200
Message-ID: <20250619132125.78368-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062137_266689_D0039850 
X-CRM114-Status: GOOD (  11.27  )
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

This series introduces named IRQs while keeping the index based way
for older dts.
Further it makes some cleanup like adding consts for index access and
avoids loading first IRQ which was not used on non SHARED_INT SoCs.
    
changes:
    v6:
    - change irq names from tx/rx to fe1/fe2 because reserved irqs
      are usable and not bound to specific function
    - dropped Simons RB because of this
    - updated description of patch "skip first IRQ if not used" and
      use MTK_FE_IRQ_SHARED instead of 0 in condition too
    - add "only use legacy mode on missing IRQ name" patch
    
    v5:
    - fixed typo in patch 1
    - moved comments from previous patch #3 to patch #1 with changes suggested by simon
    - rename consts to be compatible with upcoming RSS/LRO changes
      MTK_ETH_IRQ_SHARED => MTK_FE_IRQ_SHARED
      MTK_ETH_IRQ_TX => MTK_FE_IRQ_TX
      MTK_ETH_IRQ_RX => MTK_FE_IRQ_RX
      MTK_ETH_IRQ_MAX => MTK_FE_IRQ_NUM
    - change commit title and description in patch 3
    
    v4:
    - calculate max from last (rx) irq index and use it for array size too
    - drop >2 condition as max is already 2 and drop the else continue
    - update comment to explain which IRQs are taken in legacy way
    
    v3:
    added patches
    - #2 (add constants for irq index)
    - #3 (skip first IRQ on ! MTK_SHARED_INT)
    to the v2 non-series patch
    
    https://patchwork.kernel.org/project/netdevbpf/patch/20250615084521.32329-1-linux@fw-web.de/
    
    Tested on BPI-R4/mt7988 with IRQ names and BPI-R2/mt7623 and BPI-R3/mt7986 with upstreamed
    dts via index-mode.
    I do not have any MTK_SHARED_INT (mt7621/mt7628) boards to testing.


Frank Wunderlich (4):
  net: ethernet: mtk_eth_soc: support named IRQs
  net: ethernet: mtk_eth_soc: add consts for irq index
  net: ethernet: mtk_eth_soc: skip first IRQ if not used
  net: ethernet: mtk_eth_soc: only use legacy mode on missing IRQ name

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 69 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++-
 2 files changed, 58 insertions(+), 18 deletions(-)

-- 
2.43.0


