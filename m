Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C23CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiWNA2XcQ9MIGpb5iKT0AZ6heJ1aLAPFSuWzw5lWfBY=; b=l8J6y+5hFpOlvdT/TqsmTdrk8g
	ThGVgSsIr2SGA39XPBRU+TFUSbP5/glT+E3nudlnIyLpr3XLm57gVYHWhT/hbDuKNXR9Bcz4eIGjs
	U4wKkVTv5vOw8suKu1f0bb0j+abhQb54WxY7lWA/V3yNds70NdhEBIj2apaiSU64BC54lT0UVz0S0
	4OSdIgaAyA6CnIjR/5Vor5VfPHtFijlEYjT4WNoMmrAUfLER2kNDZQcnyB4blz2gCnnOvUQLgyBfb
	mHbQHuSYv0irnaVnuNcqdXTMIDfP7kYLY/dD5x4uRKYhZn9fR26kMM3c53x4DxhEo994BtsGA3znS
	ksAzAHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdft-00000009JmY-1jIN;
	Thu, 11 Jun 2026 11:34:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdfn-00000009JkW-05hx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:34:16 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260611113405euoutp026f074061358877a17423ef67ee7afcf1~4A6GSzd_k1176311763euoutp02U
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:34:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260611113405euoutp026f074061358877a17423ef67ee7afcf1~4A6GSzd_k1176311763euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781177645;
	bh=aiWNA2XcQ9MIGpb5iKT0AZ6heJ1aLAPFSuWzw5lWfBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hs1iC8+bqurdiMo/Cnpg9tlui3TVPRRe6dzepPnEcM8ZoHBcadWG/UAvWTFmWQsDT
	 bQqV48UI6it831kNnUvYDFHPHTozVPlq6J6sTrUYE4hIDtQoUW+i+xSeZVXhxxfXNo
	 LhNKjrCluhxgVIGWul3JGIvj+VmXre32GFSxsRsM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260611113404eucas1p1ae62c08edaca2d98535c39c59faea923~4A6F-FrlA0882108821eucas1p1u;
	Thu, 11 Jun 2026 11:34:04 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260611113403eusmtip20658597299be23109b0b32fcf53ad27d~4A6E9bI9t0415604156eusmtip2B;
	Thu, 11 Jun 2026 11:34:03 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, k.domagalski@samsung.com,
	k.tegowski@samsung.com, Jakub Raczynski <j.raczynski@samsung.com>, Chang-Sub
	Lee <cs0617.lee@samsung.com>
Subject: [PATCH net 1/2] net/stmmac: Apply TBS config only to used queues
Date: Thu, 11 Jun 2026 13:33:57 +0200
Message-Id: <20260611113358.3379518-2-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611113358.3379518-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260611113404eucas1p1ae62c08edaca2d98535c39c59faea923
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260611113404eucas1p1ae62c08edaca2d98535c39c59faea923
X-EPHeader: CA
X-CMS-RootMailID: 20260611113404eucas1p1ae62c08edaca2d98535c39c59faea923
References: <20260611113358.3379518-1-j.raczynski@samsung.com>
	<CGME20260611113404eucas1p1ae62c08edaca2d98535c39c59faea923@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_043412_078653_EBB4E3BB 
X-CRM114-Status: GOOD (  13.91  )
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

While opening stmmac driver, there is enabling of TBS (Time-Based Scheduling)
option in dma config. Currently this is executed for all possible TX queues via
MTL_MAX_TX_QUEUES macro, but actual number of queues used might differ.
While setting this is generally harmless, since memory for MTL_MAX_TX_QUEUES
is allocated, it is incorrect, because it prepares config for unused queues.

Change this to apply tbs config only to tx_queues_to_use.

Fixes: 4896bb7c0b31a ("net: stmmac: do not clear TBS enable bit on link up/down")
Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..5917bf47c7de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4140,7 +4140,7 @@ static int __stmmac_open(struct net_device *dev,
 	u8 chan;
 	int ret;
 
-	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
+	for (int i = 0; i < priv->plat->tx_queues_to_use; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
-- 
2.34.1


