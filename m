Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4D3C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9PcMChA5qRN1WFGx6oxYrmo+wl53t0Pwf4RqpYsrDoY=; b=3EYspN/pHsSJD7ei0Rawxx1NCF
	3saug9Fm8omNmh51Nl371TxNiljsZeyVxoi7d4qIHnc6xeu/jV8p3m/1y2+qOI4q/r2vOlC5xBQT9
	eXWV7PRHO8fx8nCZKjmCFUMpajMQPbP6y6MhO0M0XO0tALKCYFE8mu+oErO6AjrWI0wb9mGwPvQiX
	m533vs/ebD/Ag5/kTaxCgL+o7rnv+YYSJpz+zuXSjzTn2SETDNk7MEy4QpfBhMc83oGODH9FPemdn
	ym9yVenUYVh+FFOjLVNMOMZzt93mM0JNk1r1F1YQ/bkHvcX8ntSJmiz2KJQrMJnct2Ekzk1Q7rRcf
	jqiSpJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMMr-00000003WON-2Q7q;
	Mon, 30 Jun 2025 21:48:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMKW-00000003W0n-42Tr;
	Mon, 30 Jun 2025 21:46:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWMKL-000000007Lk-23v3;
	Mon, 30 Jun 2025 21:46:13 +0000
Date: Mon, 30 Jun 2025 22:46:09 +0100
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
Subject: [PATCH net-next v3 0/3] net: ethernet: mtk_eth_soc: improve device
 tree handling
Message-ID: <cover.1751319620.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_144624_997963_939987EF 
X-CRM114-Status: GOOD (  11.71  )
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
("net: ethernet: mtk_eth_soc: add support for in-SoC SRAM") isn't acceptable
and a dedicated "mmio-sram" node should be used instead.

Support for the hard-coded offset and including the SRAM region as part of
the Ethernet's "reg" MMIO space will still be required in order to support
existing legacy device trees of the MT7981 and MT7986 SoC families.

While at it also replace confusing error messages when using legacy device
trees without "interrupt-names" with a warning informing users that they
are using a legacy device tree.

[1]: https://patchwork.ozlabs.org/comment/3533543/

Daniel Golle (3):
  net: ethernet: mtk_eth_soc: improve support for named interrupts
  net: ethernet: mtk_eth_soc: fix kernel-doc comment
  net: ethernet: mtk_eth_soc: use genpool allocator for SRAM

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 132 +++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |   5 +-
 2 files changed, 94 insertions(+), 43 deletions(-)

-- 
2.50.0

