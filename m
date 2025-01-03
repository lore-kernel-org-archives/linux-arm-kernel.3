Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED50BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tIWKiLB8KnEZOm+SI6dbLJmqYzCWnnlF58g0NlWh4Tg=; b=nVjMeeWZWKPf3SAY5y9AavEz4B
	z86mTAaFJtIweR/V9Ik4aAwNbqOLzAEOy41l+wX+2bT3nPjQjI71Q/IMFOHhNtHA/i+B+1gSNGutk
	JHMRVRwrxcluoaemwggcujRGSigx774kWwGuZFPHU1KV37BdZBHA++jb4eteBMGg+vjdJOnl8/uEc
	bitgUqZNxBIrPz0TXGO/+fieOQg27Ee1njUVodjPIPzhsl0G+zNyO35ll1FllXVbyz3f3Qv4YzWoc
	u+n2MPMLaOXeOm/ZHdRl9zewDjLKr2b9sN4bYzf68X8y/VjVzu+KIRplCOTWELpGUdGN2M896EoxL
	zzKoHYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe9A-0000000CeIk-1aNa;
	Fri, 03 Jan 2025 09:39:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe7y-0000000Cdyu-3MDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:37:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21634338cfdso240890375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 01:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735897078; x=1736501878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIWKiLB8KnEZOm+SI6dbLJmqYzCWnnlF58g0NlWh4Tg=;
        b=UGkvSX9UIEJBvMe3Y1k379VDkzKD756Xm4fawGbPo243OZOLE6a+Vrunbs71cZtl74
         rIzIWK/xeRQ2837YEGLB1TVwj5urM82cidh+FvexmIc/c57qw71yfOOiMPpkEApbOYlh
         DLedSzXdcYKckC3bBiUKw3lTYvlB1zxGvUfdwvG0+K47anZUhEvek0bpzJ6NlKcbKTYa
         vl7Pdj/PcY+eClmO50R841e7yFs/QQ+vj94AT3hf0WwDRX3q84PsPGeHcHZJPvVK5nmt
         h1aQ7kUzl3ODBBv2QByLJoyKLk62c5aTq+wnxuWlIVBuHitrkqFnzaqQDBmKn0Z6gVWD
         E2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735897078; x=1736501878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIWKiLB8KnEZOm+SI6dbLJmqYzCWnnlF58g0NlWh4Tg=;
        b=d+ri+pZEMgys36z800cLr+LxvCYLO9UGZXmqEqWf7rf3dIt4IAmTIuzdzLx0bp0As/
         +OGsRiEfxcqPYFVqxXZCG5pyEIkdP0KQxB2QdS8x2KtuJAExp7sKJCw+bqIyKTd5xb2o
         wpS/AL1yeJX9JXr36wuJzanokAMw3KqUCoGE5Gl6IflIRY4j7WwTH3aqWv5HmXlhWS7O
         tqPd9jTHOiTEcQW0CifvAqCUC6zLC1fjzXPm6P5kamsiIV5NTOl0mR7+kKSlsua5FmYl
         Y7cO6qDKCBRdYJidUjWZ/YjXTYnh1B5wh4bFf+EZedbwvV0+pxw47s40OCIOe0UFxYU4
         oCyA==
X-Forwarded-Encrypted: i=1; AJvYcCUw+dQoZEESF25ZStYsR/R94LRz3bFrE2iohx7kqJs2adWet51kPG1tU3fuAQnRYycY2DmVuB8Nx/vUOJSmZkB8@lists.infradead.org
X-Gm-Message-State: AOJu0YxofjaeFtGCQyKCILj00YqCeWf7SrvzbsV2Jnu6LTtTR0y2L+3T
	NXSIi8pCsUfMkZ8HxzJRN2+jEhXe3+CE88VstpI8u9rjvZpFe2kb
X-Gm-Gg: ASbGncuTfU5prikGx6c1F/xxROyLgyOyJLvJC35KFfRZkEKQsdnqGcNh/YjpWxrZSZR
	4scaCiHKR9aeJ1i9Y25x78pCTj3OJ2THh7iAc25hf7XtXUYU5d2bqQD5YMXHSnFegttIfgfd1jI
	R70UKuTVF5P22ScIlF0YfBSjT0XkZszgyrByDlRimwVLJ3PlaZlX1yvIOS68dAl2qT4nYfbrzby
	HK6hkB2ojs+gNKEH/utsQbHL0FjpM9XvITxndXl3BVeaQcU2Y0ECk+ml09g4wlq9b4thQ==
X-Google-Smtp-Source: AGHT+IEsfYK7/PGJhM8Gb1hlU/h+2ggzuQZhcjiI2RfwOotYgSfS9FXc9Ht12SveoR4AdIe31Pb6mg==
X-Received: by 2002:a05:6300:7113:b0:1e6:5323:58d1 with SMTP id adf61e73a8af0-1e653235b45mr18248605637.26.1735897077548;
        Fri, 03 Jan 2025 01:37:57 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad848020sm25860479b3a.81.2025.01.03.01.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:37:57 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1] net: stmmac: Set dma_sync_size to zero for discarded frames
Date: Fri,  3 Jan 2025 17:37:33 +0800
Message-Id: <20250103093733.3872939-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_013758_837189_7172EABB 
X-CRM114-Status: GOOD (  13.12  )
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

If a frame is going to be discarded by driver, this frame is never touched
by driver and the cache lines never become dirty obviously,
page_pool_recycle_direct() wastes CPU cycles on unnecessary calling of
page_pool_dma_sync_for_device() to sync entire frame.
page_pool_put_page() with sync_size setting to 0 is the proper method.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..1cdbf66574b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5472,7 +5472,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
-			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
 			buf->page = NULL;
 			error = 1;
 			if (!priv->hwts_rx_en)
-- 
2.34.1


