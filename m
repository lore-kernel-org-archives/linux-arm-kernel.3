Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0BFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGfkNTk4NejAFC9gRo0exSxw9o65QVeFJfwbgDyX5cY=; b=BUDfRUtGSVsNCWIapeeGw9kcam
	t/Iwv5h6AsacQtD6LcMi/II88FpZuMoz2mTj8A4SLvqsdDQkB12TEj4U2TflJTW3S9OfKgim0EI5f
	bhDkatgO7RrySUTjv32XCIuGQoNLt73Sxq58AdY+hJHkHA7By5WZwnl4d7Kxl2xL8m2+QdG+7a5uV
	gFvgQJGkw/kyb1QWrVAPhz7vyQepJVR8XBzQ9CztzEKnprmANUSN3ZDxZ55WuhsTogIIbpLaaaIn8
	QcvioWAOPQ8/tEe/3ergdwFbO0HVXBNoN/1dJG5nhHb2b6nThGC3cJ7ZctmaCtji32fibeCqyo6pD
	YPz4OGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4M8-00000009yd1-2ooG;
	Mon, 19 May 2025 17:32:52 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3gt-00000009s62-1WMU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:50:17 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1E6101F0003D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 16:50:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8FB55AC2ABC; Mon, 19 May 2025 16:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 4EB52AC2ABA;
	Mon, 19 May 2025 16:49:43 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address instead of 1
Date: Mon, 19 May 2025 18:49:36 +0200
Message-ID: <20250519164936.4172658-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_095015_561116_CFCEFBC8 
X-CRM114-Status: GOOD (  14.66  )
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

While the MDIO address of the internal PHY on Allwinner sun8i chips is
generally 1, of_mdio_parse_addr is used to cleanly parse the address
from the device-tree instead of hardcoding it.

A commit reworking the code ditched the parsed value and hardcoded the
value 1 instead, which didn't really break anything but is more fragile
and not future-proof.

Restore the initial behavior using the parsed address returned from the
helper.

Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 85723a78793a..6c7e8655a7eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -964,7 +964,7 @@ static int sun8i_dwmac_set_syscon(struct device *dev,
 		/* of_mdio_parse_addr returns a valid (0 ~ 31) PHY
 		 * address. No need to mask it again.
 		 */
-		reg |= 1 << H3_EPHY_ADDR_SHIFT;
+		reg |= ret << H3_EPHY_ADDR_SHIFT;
 	} else {
 		/* For SoCs without internal PHY the PHY selection bit should be
 		 * set to 0 (external PHY).
-- 
2.49.0


