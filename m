Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B218C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3s2HJFqh+DDOetxTyo9o779Bmx/pzDHI5lZrygVa5Qc=; b=FP4FIW6YthvvxFs9T3FXs45uWV
	JpmYa8d26lfRoHGzLGNcqHc0d6exObcHZ/NCv1+mfhphTPVPPlYoYBAAJa9FZEoPgH4MJQc0D1FoZ
	PzcuoGdLe0Ai67xrlcNrddeNyiHf05fC4Fz681odw/VcQ/a90HlmvVyRb41cp3QimdZf3ry5PbtSl
	yTzyMQK5Ss8rTTDYGVzVm98/Yk8uejeB618VihPXarLu+DBsei9gDTxAvvFYKcTEwfSc5/S5pq+ok
	dOemHBWKIi7DgZwp9q2jK3KIU4x3/11s4zwLn6BhgvImsc8rNH+t4RXUj78auHgNXHfszr/7m/4jL
	7IUalgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTEI-0000000AvbG-24hI;
	Thu, 30 Jul 2026 16:03:30 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTEF-0000000AvZV-1Zrt;
	Thu, 30 Jul 2026 16:03:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wpTDv-000000007W1-0nVU;
	Thu, 30 Jul 2026 16:03:07 +0000
Date: Thu, 30 Jul 2026 17:03:00 +0100
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
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 0/4] net: dsa: mt7530: fix remaining swallowed MDIO
 access errors
Message-ID: <cover.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090327_417739_D5A4FB54 
X-CRM114-Status: UNSURE (   8.85  )
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

v1 of "net: dsa: mt7530: fix swallowed MDIO read errors" [1] was
applied to net just before v2 [2] went out. This series carries
everything from v2 which was not already applied with v1 and still
qualifies as a fix: the two standalone patches v2 had grown following
the Sashiko AI reviewers' findings on v1, and, as patches of their
own, the companion fixes v2 added inside the already applied patches:
the unchecked bus->read() in core_rmw() and the unchecked PHY_IAC
command writes in the MT7531 indirect PHY access functions.

The remaining non-fix changes from v2, dropping a redundant read-back
and improving the poll failure messages, will follow via net-next.

[1] https://lore.kernel.org/netdev/cover.1785213071.git.daniel@makrotopia.org/
[2] https://lore.kernel.org/netdev/cover.1785368701.git.daniel@makrotopia.org/

Daniel Golle (4):
  net: pcs: mtk-lynxi: check regmap reads in mtk_pcs_lynxi_get_state()
  net: dsa: mt7530: check bus->read() error in core_rmw()
  net: dsa: mt7530: error out on failed PHY_IAC command writes
  net: dsa: mt7530: serialize the regmap IRQ chip like every other user

 drivers/net/dsa/mt7530.c        | 56 ++++++++++++++++++++++++++++-----
 drivers/net/pcs/pcs-mtk-lynxi.c |  5 +--
 2 files changed, 51 insertions(+), 10 deletions(-)


base-commit: dd16f1b5720f5dae33a79b5305e188e8290a3973
-- 
2.55.0

