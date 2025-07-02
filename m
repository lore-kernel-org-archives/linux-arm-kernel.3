Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A286C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HsGHZeDLRcosGuwALT4r1u45hzbPWUF+FK6Vc+CPIpI=; b=qEc7JsT8v4kIE7iZEV7nUt+T9t
	5uo9oLrv6qRr8300LGBH2duQ7y5xvVl9OtnqksqDpHdOZ2AnnCzHZWIivkTi7UIvAy9ja9ovZCiS5
	xaT+VldUcBPKKqkl/orc0rRes92XhDNwhUgFM70euUqtGgYQFmgNLUvhxIzJrmI5I+Jlz+Eyl2DXh
	C+fHiDybV5XE4nrsXOd4A7feUXJaWyhem3Vsso4/caf2loEmkJhWc9KdxZ/unPlG7fiLqTKc+2223
	wxjk8rZ++gpPnLdHebw3yj4Kf/HYENu+inmZuqbo6DUeUR8bDCsPdn7M5jIe+hh1q0hlHkygINEwG
	5DG+vJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxNn-00000008QXn-05er;
	Wed, 02 Jul 2025 13:20:15 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxIM-00000008Pj2-3LrU;
	Wed, 02 Jul 2025 13:14:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWxI8-000000007sk-0DKJ;
	Wed, 02 Jul 2025 13:14:24 +0000
Date: Wed, 2 Jul 2025 14:14:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 0/3] net: ethernet: mtk_eth_soc: improve device
 tree handling
Message-ID: <cover.1751461762.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_061438_834356_E6CC4C90 
X-CRM114-Status: GOOD (  13.66  )
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

This series further improves the mtk_eth_soc driver in preparation to
complete upstream support for the MediaTek MT7988 SoC family.

Frank Wunderlich's previous attempt to have the ethernet node included
in mt7988a.dtsi and cover support for MT7988 in the device tree bindings
was criticized for the way mtk_eth_soc references SRAM in device tree[1].

Having a 2nd 'reg' property, like introduced by commit ebb1e4f9cf38
("net: ethernet: mtk_eth_soc: add support for in-SoC SRAM") isn't
acceptable and a dedicated "mmio-sram" node should be used instead.

In order to make the code more clean and readable, the existing
hardcoded offsets for the scratch ring, RX and TX rings are dropped in
favor of using the generic allocator. However, support for the hardcoded
offset of the SRAM itself being included as part of the Ethernet's "reg"
MMIO space is kept as it will still be required in order to support
existing legacy device trees of the MT7986 SoC family.

While at it also replace confusing error messages when using legacy
device trees without "interrupt-names" with a warning informing users
that they are using a legacy device tree.

[1]: https://patchwork.ozlabs.org/comment/3533543/

Daniel Golle (3):
  net: ethernet: mtk_eth_soc: improve support for named interrupts
  net: ethernet: mtk_eth_soc: fix kernel-doc comment
  net: ethernet: mtk_eth_soc: use generic allocator for SRAM

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 167 +++++++++++---------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  11 +-
 3 files changed, 101 insertions(+), 78 deletions(-)

-- 
2.50.0

