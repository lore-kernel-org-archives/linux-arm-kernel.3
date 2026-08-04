Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D1DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wDGsIohfeV98fyRDJDwZIGZioU3ZkExJNiulZ+SgHGg=; b=hY3sV6CoorWIUeZmpeUCqrvXCN
	5HfKBZ40oADT/WxMl/B6aOprz8tOMSfTmilVJW+AF19/LStU/ArOrCz3t7+9pgeiv7pcT2BrUE/gP
	oEFxglXO7xMASEnyy93QEuGpCRO/7xXUngv/HGe8HNJFBh2xfNpaES9t4BMJpkrXBbCD7imNtztHu
	9oc5UXa98vV4e5lGVJxrjShuyLYvO4qGv10QSdVVTDYvjtaxIhPpi3xlgzPRwEfmCbC08GrwCXz9f
	Ok/pNs2d2VezCmDdmbQ0uW77a4Aneyg3fNKC7hexFvA27VFM44J/HxZ4XhyTJy+uc3bzEKollZwFL
	y8J5Q+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YB-00000000tPd-0dZ2;
	Tue, 04 Aug 2026 03:10:43 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Y8-00000000tOE-49c7;
	Tue, 04 Aug 2026 03:10:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wr5Xp-00000000448-3OQV;
	Tue, 04 Aug 2026 03:10:21 +0000
Date: Tue, 4 Aug 2026 04:10:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 0/6] net: dsa: mt7530: fix remaining swallowed MDIO
 access errors
Message-ID: <cover.1785811140.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_201041_025544_E70A1965 
X-CRM114-Status: GOOD (  11.59  )
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

The original series, "net: dsa: mt7530: fix swallowed MDIO read
errors", landed on net as its v1 [1] just before its v2 [2] was sent.
This series started from the fixes in that original v2 which its v1
had not already carried: the two standalone patches that original v2
grew from the Sashiko AI review of its v1 (the mtk-lynxi read check
and the regmap IRQ serialization), plus, split into patches of their
own, the companion fixes original v2 had folded into the
already-applied patches -- the unchecked bus->read() in core_rmw() and
the unchecked PHY_IAC command writes in the MT7531 indirect PHY access
functions.

The Sashiko AI review of this series' own v1 [3] then flagged two more
swallowed MDIO errors of the same kind, added here as patches of their
own: the unchecked CORE_PLL_GROUP4 read-modify-write in mt7531_setup(),
and the unchecked ATC/VTCR command-register writes in mt7530_fdb_cmd()
and mt7530_vlan_cmd().

The remaining non-fix changes from the original v2, dropping a
redundant read-back and improving the poll failure messages, will
follow via net-next.

Changes in this series (v2), relative to its v1 [3]:
 * patch 1: also report the link as down (state->link = false) on the
   failed-read path; phylink presets state->link, so the previous bare
   return reported a failed read as link-up (Sashiko AI review). Kept
   Andrew's Reviewed-by given the small, in-spirit change -- please
   re-confirm.
 * new patch 4: check the CORE_PLL_GROUP4 read-modify-write in
   mt7531_setup(), the call site exposed once patch 3 makes the MT7531
   indirect c45 access propagate command-write failures.
 * new patch 5: propagate MT7530_ATC / MT7530_VTCR command-register
   write errors in mt7530_fdb_cmd() and mt7530_vlan_cmd() instead of
   polling a BUSY bit that a failed write never set.
 * collected Reviewed-by: Andrew Lunn on patches 1-3 and 6.

[1] https://lore.kernel.org/netdev/cover.1785213071.git.daniel@makrotopia.org/
[2] https://lore.kernel.org/netdev/cover.1785368701.git.daniel@makrotopia.org/
[3] https://lore.kernel.org/netdev/cover.1785427248.git.daniel@makrotopia.org/

Daniel Golle (6):
  net: pcs: mtk-lynxi: check regmap reads in mtk_pcs_lynxi_get_state()
  net: dsa: mt7530: check bus->read() error in core_rmw()
  net: dsa: mt7530: error out on failed PHY_IAC command writes
  net: dsa: mt7530: check CORE_PLL_GROUP4 access in mt7531_setup()
  net: dsa: mt7530: check command register writes in fdb and vlan cmd
  net: dsa: mt7530: serialize the regmap IRQ chip like every other user

 drivers/net/dsa/mt7530.c        | 86 +++++++++++++++++++++++++++------
 drivers/net/pcs/pcs-mtk-lynxi.c |  7 ++-
 2 files changed, 75 insertions(+), 18 deletions(-)


base-commit: af39eb111ce6b5eba9c08513b62c4868eb7e7fd5

