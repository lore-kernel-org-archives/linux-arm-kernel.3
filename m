Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A4BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 00:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dRhyP3PYlzHvMEt3zEQHw/ZPq5Vmru+IGhbQdOV2jp0=; b=GtgwPkgObkDUs10N0FAWBuKVeq
	Z8JltbjkIFk2ER0YWX8Jp23nhjaAuMYqKyKi59emfEiZKTiUWwDvNkQXNsbfuSNnUfmT/qUA98Kdh
	9BVkXAmk4ALZizTqvZj+IhBSW73sJ8rHPIRzFAB75W4wFPuqIla/ELCnreVJFMm1ahFoAY1VjwS9L
	+aQl/j6b2bBiqNS6rcbFcUBv6XK8/KR9R/MnH6dp8F+RDBEHupAxemJs+TycsSkI8oMT3Ea8wgJbY
	jPvx/FN7AXLDtYphUVcytQI+6/557TGp2iE0dWjUCu6hJTnpNec54jU3pP3Oh+L931gwV+0lj698u
	Y58qn91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OJm-00000008uqx-16Lv;
	Wed, 23 Apr 2025 00:50:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OHt-00000008uWq-1Nwf;
	Wed, 23 Apr 2025 00:48:30 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u7OF6-000000000JG-3jFV;
	Wed, 23 Apr 2025 00:48:14 +0000
Date: Wed, 23 Apr 2025 01:48:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
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
Subject: [PATCH net-next v3] net: ethernet: mtk_eth_soc: convert cap_bit in
 mtk_eth_muxc struct to u64
Message-ID: <ded98b0d716c3203017a7a92151516ec2bf1abee.1745369249.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_174829_370741_DF002B26 
X-CRM114-Status: GOOD (  12.43  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

With commit 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in
mtk_soc_data struct to u64") the capabilities bitfield was converted to
a 64-bit value, but a cap_bit in struct mtk_eth_muxc which is used to
store a full bitfield (rather than the bit number, as the name would
suggest) still holds only a 32-bit value.

Change the type of cap_bit to u64 in order to avoid truncating the
bitfield which results in path selection to not work with capabilities
above the 32-bit limit.

The values currently stored in the cap_bit field are
MTK_ETH_MUX_GDM1_TO_GMAC1_ESW:
 BIT_ULL(18) | BIT_ULL(5)

MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY:
 BIT_ULL(19) | BIT_ULL(5) | BIT_ULL(6)

MTK_ETH_MUX_U3_GMAC2_TO_QPHY:
 BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(6)

MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII:
 BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(7)

MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII:
 BIT_ULL(21) | BIT_ULL(5)

While all those values are currently still within 32-bit boundaries,
the addition of new capabilities of MT7988 as well as future SoC's
like MT7987 will exceed them. Also, the use of a 32-bit 'int' type to
store the result of a BIT_ULL(...) is misleading.

Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: don't use Fixes: tag
v2: improve commit message

 drivers/net/ethernet/mediatek/mtk_eth_path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_path.c b/drivers/net/ethernet/mediatek/mtk_eth_path.c
index 7c27a19c4d8f..6fbfb16438a5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_path.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_path.c
@@ -14,7 +14,7 @@
 
 struct mtk_eth_muxc {
 	const char	*name;
-	int		cap_bit;
+	u64		cap_bit;
 	int		(*set_path)(struct mtk_eth *eth, u64 path);
 };
 
-- 
2.49.0


