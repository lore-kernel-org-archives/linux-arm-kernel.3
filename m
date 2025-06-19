Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD17C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS2lUJltRvHPUIa4JQpyFGxD+jJplBBokp6RSnTT/O0=; b=wkpCa1zYbZOVWwMwLGrAYgUWyn
	a4zR+S5TclDDRyTQYCDoot+ESjmm5gPzJ2cLAPKSFtejfmU1hfCymOWSwZnil9PiI1TFZAxgyaUaY
	fkaV8FqwE3APunjk5a//CVDJfhX+ubi4Ih5rv6I6UM5AOOSePTPtTew0Q5pddkYTo+Efqt3wBLqkm
	EolXSDPuEJG0hXV2jU9gJ6oqod9P8R9QP62n9C0tXln00bNlaevj93dy4MiP9DQ+ci42mJLiiNnSm
	5hc6MrHE0fMCXMGZzwR1NQANb0Ax0NelfSAZ7TFjWQLDngGIhkY19OMzsFyWvKlQl1oLpMsIfs4b7
	Fn4NdPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHW6-0000000DYXX-1Y2i;
	Thu, 19 Jun 2025 15:49:30 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFCy-0000000D9N4-3s5s;
	Thu, 19 Jun 2025 13:21:38 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 7241361634;
	Thu, 19 Jun 2025 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750339295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HS2lUJltRvHPUIa4JQpyFGxD+jJplBBokp6RSnTT/O0=;
	b=IiGc5phLz6zEsG8qlLtRtYkeD0bxYWoox9fQ+43vKyLGjgVxaEeH1iHA5zfIgBSd1ZCEk4
	V1ubV+Y3pQfoZx2RbzOsF54ca/gKjmr8j71jJEn7E1xN1FSAhgAMzMdGx+CInY0Za374fU
	jCekEa0SyjdgSt9Tu9DYJrfkR0itzcU=
Received: from frank-u24.. (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 395D21226AA;
	Thu, 19 Jun 2025 13:21:35 +0000 (UTC)
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
Subject: [net-next v6 4/4] net: ethernet: mtk_eth_soc: only use legacy mode on missing IRQ name
Date: Thu, 19 Jun 2025 15:21:24 +0200
Message-ID: <20250619132125.78368-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619132125.78368-1-linux@fw-web.de>
References: <20250619132125.78368-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062137_271414_072F1C46 
X-CRM114-Status: GOOD (  10.39  )
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

If platform_get_irq_byname returns -ENXIO fall back to legacy (index
based) mode, but on other errors function should return this error.

Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 67ba8927be46..f8a907747db4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3346,6 +3346,13 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 	if (eth->irq[MTK_FE_IRQ_TX] >= 0 && eth->irq[MTK_FE_IRQ_RX] >= 0)
 		return 0;
 
+	/* only use legacy mode if platform_get_irq_byname returned -ENXIO */
+	if (eth->irq[MTK_FE_IRQ_TX] != -ENXIO)
+		return eth->irq[MTK_FE_IRQ_TX];
+
+	if (eth->irq[MTK_FE_IRQ_RX] != -ENXIO)
+		return eth->irq[MTK_FE_IRQ_RX];
+
 	/* legacy way:
 	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken
 	 * from devicetree and used for both RX and TX - it is shared.
-- 
2.43.0


