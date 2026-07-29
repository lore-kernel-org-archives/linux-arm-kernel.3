Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA52C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DewgyYDAktvZQQjsN7FV0AudowESd3lzCpxYXEo/03A=; b=RVdIuR6GbLUCBma14g57SuKERr
	hXzW+16NIEWIXMw3PZqT6q0soKFqNEoH65iyHWfUTOS9XeoKpfMY/RmJTQ4Hm2egxf/ep+9whWTa3
	Pj2djOocyBDrhL1aKn32e3MbouN3WAbQYUP0BaNFjU+ihAun5LRNzFvTnlFNlCs2Tg39hhPfFV0Qh
	89xPNs7cBuDftHndsvFacvTUejZzPc4EbhLqzu7Qjz8lY/btQjShjk2LArJCpE1VeeSJz7vnhMv7I
	5AbATWkOE6O48zRax4p3DY0UdLZ+iJ/I5bHH8XvLgzfj0taL9HdVmxAH+lPxftQ/GpT46uCC2CAzL
	BpueoGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywW-000000079OH-3JCo;
	Wed, 29 Jul 2026 07:43:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywQ-000000079Md-3qKr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:43:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf452def93so15618545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310982; x=1785915782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DewgyYDAktvZQQjsN7FV0AudowESd3lzCpxYXEo/03A=;
        b=DP0U8ZEKtzqBJw6oivE+oNMj/n+DygX+yqFloABUp6+E4IM1WMvuMk8CLZDej2mLI7
         sytl7Z1BjyONBx7T881raAMnUeUUHtrOe3QPKSwqNL/ekLcY6qI9p2VQ6+SXADgEFJZX
         Zqqjvw9ev+Eq+dXFAyLuDGIa83U8Yqp6BfwiPrKZAdhcO1LCFSr2Em1LPAv4+8jrIgtd
         eFR27zMbYNPjFSY2WCulR7V8Esne2AwCRr0MHeZ3vx/u1uJRfEyB6Dl7mKBwZtp8JYth
         1PM4uGXVkQeDF2e1NjXc5fDn0TaEXJojos8dGzRDxirqRr8QjlWqg6gEffQopAwctAD1
         BfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310982; x=1785915782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DewgyYDAktvZQQjsN7FV0AudowESd3lzCpxYXEo/03A=;
        b=c7J68n1Ba1WOWSSAsisObEMyZshNTr81QhsT2w3l04WmX2cDnno7Ba7b+i2HsE73MK
         W2MEexS6Bqx/qWb3SVv1y3i8Wztnesr7Z/o/ZRkRipAX8TauYW4F4buOyAo+4wZbQX3a
         T2tmwNj7locGHrAD0v9zJsmv5/YtJUX2wykbHbosby/skZgwgNEQWRywJtQ7l7GaBeaF
         k5Kx5Li3TMKK1nu3p4nkDmxF5dWsRIMbVuTi2gvE2v/k9shoM1Z1vtD63q91XWV4a45w
         FFedkbHEnv7RIGBU4wGdA5owAF6ohMayFamgJ3SA2ppeunPTW2lxfr8nUzh1+At2eY+d
         dDSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIuFzcbueyaS4Tuy4xtZ9iYYmQ5M8UXxmn/tDUn1ftM6572PTF+YO1abydkCXLi3Z3NShm83I4DDuEnZuW1D14@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwsU5ud7yu4SYwdbJqF5jMDe7qmjSEn4ixsvhgMl4ArYwA9uJ
	3pRrl1Tk2NfkumN8wXIM9t0xX86XmnyCatPq6YBvJUxQ78d3GVxZSvF+
X-Gm-Gg: AR+sD134ElF87UwGBY/QjtVC8L984w8bKmk0x5zJNNhe+MVXtoHbFvbHMeftnicbECr
	GZhDypIpo8qEGaDgAbcy0GDD10zznFcxGur8+EVnjKceV3DWRdJZeSMT2S92xw0UqxyHV+i27FD
	4N+syuJ4uUaDRWbS05V54Za7ry/AYYPhRe9aV2CgN81K/bY25Ujk/qom1suBOMEvtjL+JHyKK3Y
	ZgasuoDG+QWp0u7DPv9rOMchZsLO6WzQvH3h0srHgCwE79ADr6NMM/gL11A2MLRzgg1hbSHJ+4R
	z/jpAxCZYOqhbO5vKB/2q9nZH9JpAuIa69rvDPpocxW+F9TZ1gf0ylOzUGbYAdymo9k1e07tiRs
	sntTgcMpa5gRCoqDR/CpTY5rVo1NMsUDeJijXmG7yhaXkkFLBFGbXryft2D7pH0Is2+Oa7IwxPv
	LmwoOolf4fLityyb8xz+Z9kBOGsgTM2o2JassNJr8v73zppNmRatVn7t2w1es=
X-Received: by 2002:a17:903:2282:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d0266945f4mr13611065ad.9.1785310981897;
        Wed, 29 Jul 2026 00:43:01 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf888csm7154505ad.64.2026.07.29.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:43:01 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/2] net: phylink: allow PHYs to be attached in 802.3z inband mode
Date: Wed, 29 Jul 2026 15:42:37 +0800
Message-Id: <20260729074237.2624940-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729074237.2624940-1-zxyan0222@gmail.com>
References: <20260729074237.2624940-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_004302_961919_921DB841 
X-CRM114-Status: GOOD (  15.38  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Now that we have proper decision making for inband mode support which
makes it a "best efforts" feature based on the capabilities of the PHY
and PCS, we can relax whether we expect and permit a PHY to be
attached. This is especially true for the 2500BASE-X case which some
PHYs use without inband on their host side interface for 2.5G speeds,
but use inband for slower speeds switching to SGMII on their host side
interface.

We already have such a case for some qcom-ethqos setups, although
qcom-ethqos overrides phylink's inband settings by accessing the PCS
directly at the moment. This should allow qcom-ethqos to transition to
defaulting to inband when 2500BASE-X or SGMII is specified in its DTS.

Allow PHYs to be attached when inband mode has been specified, which
will be necessary to allow inband mode to be used on qcom-ethqos.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 59dfe35afa54..fd4e80eeeda7 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1964,9 +1964,7 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
  */
 bool phylink_expects_phy(struct phylink *pl)
 {
-	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
-	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
-	     phy_interface_mode_is_8023z(pl->link_interface)))
+	if (pl->cfg_link_an_mode == MLO_AN_FIXED)
 		return false;
 	return true;
 }
@@ -2205,9 +2203,7 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 {
 	u32 flags = 0;
 
-	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
-		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
-		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
+	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
 		return -EINVAL;
 
 	if (pl->phydev)
-- 
2.34.1


