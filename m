Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B427C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bN68XxvEAG0kJPv7nTgf4sN5m46Irhaxec0eYSllag4=; b=sylKw5BeJHXRdiGKl3lHmtbOSy
	Zpgw58uYQoCN8wuQjy5b7Uv1Tv33yohCvWFIVgU8tFb8kQ5k2e+php7Q6+7Rw5DWmyf+iypMaAnPj
	cw00remsqThAhOUwaJU/MKsFDW3tB2izn7ARZOsHwlKw8Igu3BUSHMVUeZrglSoj3hC4KA2+ryoBH
	e0vnxa3qM3dhjmPy5FjUs3XvoKnYWDY1g67JbVmFoyfHt2KhsR7Wadd0VJ4o992Zosw8jcmDsRFmy
	N1ge1lJCiY9yiOjimaWygYiYsoDL8SXrQiVxZj1fBMwj6b7MYkebZ0SGyZJOq14JHRbDZ/39zWlFC
	KvTrIwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM96-00000008ZVp-21eO;
	Wed, 12 Mar 2025 13:29:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLPY-00000008R9n-053F;
	Wed, 12 Mar 2025 12:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D5075C59C2;
	Wed, 12 Mar 2025 12:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E537FC4CEE3;
	Wed, 12 Mar 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783331;
	bh=okfRAyhj/OuF18kxT3pwOtemMTI22dYU0tMF9Ccp3Ew=;
	h=From:To:Cc:Subject:Date:From;
	b=BqBg9NgvEYowDAXhggHexPbakfdHGBqC9wV2b0Rl3ZCRXVOYhZK8zNCqd2dVsCmg0
	 nsgU8+m2ARQk966pA+cSTqO3DO7eNW1iLEYCnfTd/xpcsbaY5IisSQ/GpCoFpFjMDX
	 wFtpLjg0M3QrZ8RWNW78ZJ5ElAKMGLWdjWP0oueIvKB8sO6GpIzd8P+OSoEnKWNzKj
	 1PjndwBzMgbsJ/WMtO1iRNUVJc42HTE0weQFBuY2EciUIs2YQ4zgLtGkzVqRcZP4hw
	 7MYmOUt2jfkLBR2j1OClwVzzEqytddTW/hKAAhuxpn76BLX5WRXc4NmhTtu6IahG6M
	 YWgtg1BDqcu1w==
Received: by wens.tw (Postfix, from userid 1000)
	id D50745FC08; Wed, 12 Mar 2025 20:42:07 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH netdev v2] net: stmmac: dwmac-rk: Provide FIFO sizes for DWMAC 1000
Date: Wed, 12 Mar 2025 20:42:06 +0800
Message-Id: <20250312124206.2108476-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_054212_099042_91612F4E 
X-CRM114-Status: GOOD (  16.17  )
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

From: Chen-Yu Tsai <wens@csie.org>

The DWMAC 1000 DMA capabilities register does not provide actual
FIFO sizes, nor does the driver really care. If they are not
provided via some other means, the driver will work fine, only
disallowing changing the MTU setting.

Provide the FIFO sizes through the driver's platform data to enable
MTU changes. The FIFO sizes are confirmed to be the same across RK3288,
RK3328, RK3399 and PX30, based on their respective manuals. It is
likely that Rockchip synthesized their DWMAC 1000 with the same
parameters on all their chips that have it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:
- Removed references to breakage from commit message as it is already fixed
- Removed Cc stable and Fixes tags
- Rebased onto latest -next
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 003fa5cf42c3..e57181ce5f84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1969,8 +1969,11 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	/* If the stmmac is not already selected as gmac4,
 	 * then make sure we fallback to gmac.
 	 */
-	if (!plat_dat->has_gmac4)
+	if (!plat_dat->has_gmac4) {
 		plat_dat->has_gmac = true;
+		plat_dat->rx_fifo_size = 4096;
+		plat_dat->tx_fifo_size = 2048;
+	}
 
 	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
 
-- 
2.39.5


