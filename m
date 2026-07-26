Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706EFC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/TLl71jUWptanjVEHFZh82fCzoKSbTQp3yt1GZ8oxw=; b=fSiYJtUQOxxp6V2HL+HzQ3EfJ6
	xrm0UG41cvatS+2FCNmgf5LXvoNEsbNrlWJaHgPgE85QP8o8Pxn/CzKCugCMjVXMofjdIqPTx8Tgu
	83udkT/rC3iaVaFHK7pT8fgsu9UQaOfNudY7EPs6DzKS0PQI+K5nJyWqOtKv77OoxQDM4fXUHg+H1
	dVNFbxqH8WAorYP2PSlBcTC4cO+XRnxSl4sfOyMZC6PSnmxJr7jJZY6hlN0DZ5ApP7fJ7uy6Im3B/
	MXeG4dHwylK8I7KBBu2bVH4d3dw1/Oa+c3Zgo6iNafQAcmk5Rppaj/mY9SFn6CSBkN1ekfgD3Ywo3
	hFm+YBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysV-00000001Cgy-2o6N;
	Sun, 26 Jul 2026 13:26:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysS-00000001Cg3-3MI6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 13:26:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceae1ed204so18920565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785072408; x=1785677208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/TLl71jUWptanjVEHFZh82fCzoKSbTQp3yt1GZ8oxw=;
        b=TvcKkiq3o2GVmJki3wksr06/RvolYVT3MAP90jG9W8PNfD3gLG9kbw96iv2mCa9Wqv
         OARvSayzrmnIHkVXJg7nn7C2xUfO/NyCM9wuMEx4laOPtEIpyqcfJf6MvIlMPqzpQe2m
         V5WRjeM4mK6hZlTH5wETDBhlnVAQZwo7bfTktAp0mlv8a44sJwh56MQIEMU2lTlFg9lP
         Tu0bGpEWQO7S4AnnvfCrO9ocmLDnlHN1tIiWGX+OOu6LU8FfRUU7NvhU+ayKyJctJOjz
         aziBTMBy1ti/n9tcP9jWCen6nxifIrfcjo7g5/ZlyLXfbRw9hP+nWDDzi2tQTRQ4TSgj
         ZoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785072408; x=1785677208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/TLl71jUWptanjVEHFZh82fCzoKSbTQp3yt1GZ8oxw=;
        b=m5GO6k6UNt8RCAYs0QlFLuY0GW4HZgF+k3Rdyb+HI1SQ+LduKyMrcgwPi6ZCSm0F/4
         P4dKrBTQ2nb2rgIhaei3OD0ziUctJ1+5aipQFmNAPinufzNTSkgI8jA2ObAOGutLCAmj
         Quo5VT3OGvqB+V9kcEWKDfU97kWX+sIJQHWIC0UK7vHUXytkMTjukuPt9Irfa4FSuJc4
         uEUKVwjqdjZOuYOq65jaAqGxkAqUGHNltd+TPR+EJZRSCh9rR8aJCdVgymQt2QOEjyIX
         OzBrgKeRS8jrOLUNTAEbPeCOS4TIkd5TNXESTDwidlXgjabxgJT2lcp1NFlkQTXeIFm3
         MnMA==
X-Forwarded-Encrypted: i=1; AHgh+RraTkWpCO6lE52itJNkzld1NW2EJ1DWRwo/p3xd7Djq+QsDE7ysJh8JnScHGoz2H3VWRcCgijorZ9KSxPL2jTSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzQj/f1aj+HlWSZEzhdjFQbYfAVoKB3wNOCi/IxJi5JWqDgiCg0
	Iv7qgBPlyQN5oVFvX3RIZeTv8TJc32X/RCgc50XAVlqqdywPuU4bQtXR
X-Gm-Gg: AR+sD12b0pYFET7NjC4uQ6Eeyi4jJHVFp376NIQZMt53bbDX3oxQkW22SQ3fyztfLIf
	NyuLbnWA18cP7dSTUgZBmp0AqTgiwofxVfm3Wqjq7TNMSlYZ+GrrsYBJ7GvD4LK7fNn7Rotdvf2
	fuoROEaHZbn50mZsCoRECPwUDoqD3fr6MnXLemAS757ZSdIxGIQM7OZDN8nf3IuA8TsL8++ZxKJ
	7eyG6aDZuUGQPjWW6ibEQi0FDgFv0PBRn6SKEqJ3xKQZ7pYOG4X4QG6p0RSLLI08Xs11AizZ3CI
	uC3B5bQNI6/4vumEtUa4aQwZqt4m6C9tRJNq689+dGlFx9rM9OMXkIRX3Kxv1BUKgGrX1hCCr7u
	aTlU/O1VKEamJ4KPNMMuy2i/spCPYFCWf54ZM0IWEpUzIkgDC5jnZfyWr0aJV4pyphR9xUAQM9h
	uT
X-Received: by 2002:a17:903:988:b0:2ca:281:27fd with SMTP id d9443c01a7336-2cfde845828mr50672695ad.25.1785072408037;
        Sun, 26 Jul 2026 06:26:48 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdc2sm20677655ad.42.2026.07.26.06.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 06:26:47 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: Skip PHY attach if custom PCS is in use
Date: Sun, 26 Jul 2026 21:26:18 +0800
Message-Id: <20260726132618.3580612-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726132618.3580612-1-zxyan0222@gmail.com>
References: <20260726132618.3580612-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_062648_846411_F9D9E793 
X-CRM114-Status: GOOD (  14.08  )
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

When a platform provides a custom PCS via the pcs_init callback,
the MAC's phylink_pcs is already configured. In this case, phylink
validates against the PCS's supported interfaces and manages link
state through the PCS, so no traditional PHY device is needed.

Without this, stmmac_init_phy() falls through to the no-phy-node
path and errors out with "no phy found" when the DT has no
phy-handle for such interfaces.

Skip the PHY attach when priv->hw->phylink_pcs is already set and no
phy-handle is specified in the device tree.

Fixes: f0ef433fc264 ("net: stmmac: introduce pcs_init/pcs_exit stmmac operations")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 562d20830b94..044ed3b89247 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1346,6 +1346,10 @@ static int stmmac_init_phy(struct net_device *dev)
 		int addr = priv->plat->phy_addr;
 		struct phy_device *phydev;
 
+		/* If a custom PCS is in use, no PHY is needed */
+		if (priv->hw->phylink_pcs)
+			return 0;
+
 		if (addr < 0) {
 			netdev_err(priv->dev, "no phy found\n");
 			return -ENODEV;
-- 
2.34.1


