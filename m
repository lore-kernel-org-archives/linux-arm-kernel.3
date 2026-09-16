Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89C1C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=; b=zj6l8k5VpwOd7hyy9UIKPGPYLr
	OfXl+7CBh43WK2QgsWrARiAp/UYaR+ckLjdssrcJwXQrKymGty969LS4zZGLBxDNluhezG8+CXvg2
	DWMYY5ksGXOmzMNx1ibJajhEEi1p+xuFEpGXLcO5YbVvfkUvR71W/aJdfZG6E234CMF8LlT7YT3+O
	5q+aop071T2WX0wftKSU2qwAvxTarXlhKpk1QIi+x6nK9Exts4GQpu24wFApFuua4NW9ibA/R/F2C
	geu2rAVduC9Oo3p7Z0s3AwsdCwtGTE4k19e8R/mKLRY5rnEqjMUiApgtz3W0xjYm7HycXUFjCmR0C
	fTwCxYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i0X-00000008N8v-36Db;
	Wed, 16 Sep 2026 05:16:33 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i0T-00000008N8C-2sLe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:16:32 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so370028a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535789; x=1790140589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=;
        b=FgneBKDVo+TYfkomZNe7D5E4loWqAlj/t6QU/JTiumTn7mVbfUtxC5T3K9ehScEwj0
         Kj/aBiGzZDNk+cGTBPWekGJCFqKbjC7J3zxMTgEtU8BzGsgoy64t+PURln16mGDkW9d1
         cpBPwf3zwshlDYbIDCT1q4nmN5bkLEafqViH2mvLKvZcY+2idIeO5nZxCZrDBD7+TeZQ
         ticc9VhfD+IASHkKwWO2EjRsbX/O7c4pTE3xipeLHurCiI2Afuvy8WloJd7F9BNOg4pl
         0taaRg9yZc0Saxw3odv2qXpjuo9E0OG5fXgxX+43hc9eJOmML1HCr8aRV9fpPL/RN34d
         afGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535789; x=1790140589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=;
        b=rUuKKWCLGeL9vyOKIKqFEfz8/8M3umcuk3JBETnYgoBeWZDuzZAJBUzlaE4ZTibqGM
         wrtr4tJVlr2luC0NN/bWMl4nt7FVCYhiYdegn6Ps3dRiJaiasAF1GhSpbOMG0unguFxn
         pPnCTLG8K+AgVbdaHvYXRqLPLcD0w/7zoJ+WnF7o1OSR2KGmr5Qr7LcIoUJTndJyAlgj
         w5yitwQCKfKotCZIi+TFuxfBiMSmItNA0h3H6KacUvindFK1vNGL6lx824NKVA/bReC6
         QsbZEN+tqdS3OUld+X2rz5oEzuH4bNmHIHZvNbN/QeOFj+0LKy4UofJ7/25rvtZOuGTd
         nv/A==
X-Forwarded-Encrypted: i=1; AKwUvBzbzPTi6EViPMAF+S23Nyyi0FPAK+5Dswf5mJmfCC4nECxMg1MtbY2c3a8w/6WJEX+7x5VCy71k24YYvFPCotXe@lists.infradead.org
X-Gm-Message-State: AFuF++k11c9ejA0hLbkREsBGDSpfJVY/1gg16HxsFJ3yVKATwP+bj7Wa
	crzDUNN9u0ja40h1tEkVSBWow8sixzFfvvb0E3LuA3KwbYE3ZyC7wMIX
X-Gm-Gg: AYBFou2NvtjFtbuaBPIfF+geawl90k5Bkcppmb8D7rBCtw8/igQKliatME6qh7XzWVa
	WXgxgVBSxAch+mmC2EIZebj9o1eI6GTN839ykBEDQC3pOioXe+KWXNcnJzjXVxCs7vAMU0IuFnO
	fI+yYgfZA+U93M7Dk0gOC4GYiSedGA3t41Dj92nIZpim2dOIur4DfX/zvKJrUmAb/Wcz0Z27kjZ
	tyRDFsdMfB16/AWipJAsoT3V7ZIV4X46oMgNtQOgUZ1uGjnskGHt8dmrmPs/R/GkBb79zIUatPi
	RWPvtmS4mfyUSCJMYbb8qC5wv9jk3WEgs8P7UBhAK5uFvDtBPhEdMHUOFVkT6vOIM+j06LoF9dW
	aawh+Y2t4z8HFdEAhVu0bf2ZgNII51CGFYN4SOOWJW/Zs9EZgINX+RpTP0V4HxAK82TtdImsRXH
	+ViwFG5cr8nxPdbiqSYoX4IfNQSl3tUBSac0mUDURcrKZilBCiW7D5fMWtWm2t5Iqb94Oi
X-Received: by 2002:a17:90b:2645:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39e1e5777famr3113557a91.23.1789535788375;
        Tue, 15 Sep 2026 22:16:28 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb22ee5sm2428218a91.5.2026.09.15.22.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:16:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: mediatek: fix PPE resource leak on remove
Date: Wed, 16 Sep 2026 13:16:18 +0800
Message-ID: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221631_344507_D403674E 
X-CRM114-Status: GOOD (  10.87  )
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

mtk_ppe_init() initializes the l2_flows rhashtable for each PPE
instance.

The probe failure path releases these resources with
mtk_ppe_deinit(). However, after a successful probe, mtk_remove()
tears down the network devices without calling mtk_ppe_deinit(),
leaving the PPE rhashtable resources allocated.

Call mtk_ppe_deinit() during device removal before freeing the network
devices.

This issue was found by manual code inspection.

Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..04d0a1eec4cf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
 
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
+	mtk_ppe_deinit(eth);
 	mtk_cleanup(eth);
 	free_netdev(eth->dummy_dev);
 	mtk_mdio_cleanup(eth);
-- 
2.43.0


