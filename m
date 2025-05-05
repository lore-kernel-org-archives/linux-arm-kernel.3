Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F9AC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 01:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISfmgL0pGPDsruyGgJ3iPh5wWjp5R0YXLtpcNoGLwTA=; b=wUTtVD1gJnyIXisiXMwHJWrKBb
	zwD4MN1ShyV4Xxk9JPw3fRXFUBQnLtCVC3SCx4IRLbv9QWu9lyBU2Wv+tomZUwtVv5xbhksqsyyKg
	josyf7tr6q9fLfUVRt629b5U+Lpnzht7AhvOJIV3KxkmBejT13v/felzaMaTexNPe1mOUjHV9rE3n
	aQG97uOStF6R2Zzt/XZzjchhRmppuDQZvKLRpysQlzIiirMmpvKTYKDC090IMOG0bYdfa7PlTvtya
	fDi77qDXz2ogHAmqR8WG1ysHVBXNJaFJxXCZQc9hPRBsTDZGtzAex0gibsRm1pYgYDIXIWxE1s3nW
	wBfqPKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBkN5-00000006E7q-31hI;
	Mon, 05 May 2025 01:11:52 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBkJU-00000006Dfy-3J1a;
	Mon, 05 May 2025 01:08:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uBkDd-000000004Zc-3m28;
	Mon, 05 May 2025 01:08:01 +0000
Date: Mon, 5 May 2025 02:07:58 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elad Yifee <eladwf@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 2/2] net: ethernet: mtk_eth_soc: do not reset PSE when
 setting FE
Message-ID: <18f0ac7d83f82defa3342c11ef0d1362f6b81e88.1746406763.git.daniel@makrotopia.org>
References: <c9ff9adceac4f152239a0f65c397f13547639175.1746406763.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9ff9adceac4f152239a0f65c397f13547639175.1746406763.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_180808_927412_1B9863A1 
X-CRM114-Status: UNSURE (   9.37  )
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

Remove redundant PSE reset.
When setting FE register there is no need to reset PSE,
doing so may cause FE to work abnormal.

Link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/3a5223473e086a4b54a2b9a44df7d9ddcc2bc75a
Fixes: dee4dd10c79aa ("net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2: fix commit title

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 53c39561b6d9a..22a532695fb0d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3473,9 +3473,6 @@ static int mtk_open(struct net_device *dev)
 			}
 			mtk_gdm_config(eth, target_mac->id, gdm_config);
 		}
-		/* Reset and enable PSE */
-		mtk_w32(eth, RST_GL_PSE, MTK_RST_GL);
-		mtk_w32(eth, 0, MTK_RST_GL);
 
 		napi_enable(&eth->tx_napi);
 		napi_enable(&eth->rx_napi);
-- 
2.49.0

