Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEE5D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OmqjiyOxiK3k5ibOXuc5+y3BAzCAtxHcZycrogYzkSo=; b=vHwcgEOxYVUF2QHd40dVsYDNkL
	bVNleIkBCB9HroO3MM+W4qcjpF5E1DW2RT1bmaEzAigOnp1EOcCF2hJ5JVfYjukLJNhbiHYBz5NPV
	Q/C/E8g0nOsJbjNFfQdFQLCNgFjIYjZxJqaVIwFC0VT1EF1vOHjZvgP0FZxKkizi+IAhQcvEhESZd
	s2RkuSVEPRBiPiHieA5C0xjrWbrQ+iUfY8lYt2305WEH7b3Z2JkJhRNdMCYkIWvRKgmsDDq62Sw+Y
	mlPM4tlXzYesgMygeMg+d3JSSIHJzd7tDBeb0CWY8QSPtugMU9c5BoU9bIRElocYEK23KeqQ1Y+3Z
	xiMbXLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjsw-00000002MtR-01eU;
	Sun, 14 Dec 2025 11:03:30 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjsq-00000002Mqh-0Fjr;
	Sun, 14 Dec 2025 11:03:28 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id F058310032F;
	Sun, 14 Dec 2025 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1765710198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OmqjiyOxiK3k5ibOXuc5+y3BAzCAtxHcZycrogYzkSo=;
	b=WyZYqHMYdSuQA96MjjKro0k4DYuMcsY0IffRDyV+SPMLlPPu+GMIhJ6PA+lxXEV2W7yede
	qz2sMNN/lXjEf2pmW5DF7c/p9tkmgxFhHj2Nqy8yFo4izbuKc7fj3mrY9CqcOpicSQEcL0
	rRXCchEL2fHyRRvTFT+XtfVe2dtNVJY=
Received: from frank-u24.. (fttx-pool-194.15.85.205.bambit.de [194.15.85.205])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id AC4871226B1;
	Sun, 14 Dec 2025 11:03:17 +0000 (UTC)
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
Subject: [RFC net-next v3 0/3] Add RSS and LRO support
Date: Sun, 14 Dec 2025 12:03:01 +0100
Message-ID: <20251214110310.7009-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030324_587373_EA9DF985 
X-CRM114-Status: UNSURE (   7.53  )
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

 bpi-r4.its                                  |  16 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 762 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 171 +++--
 3 files changed, 757 insertions(+), 192 deletions(-)

-- 
2.43.0


