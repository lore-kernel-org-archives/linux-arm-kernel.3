Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456DBC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNKMfFoLrxfVgkUmO/8mblNHEBodyP1KuT76nV4WYpo=; b=HzimSbyxS0qPXX2qKVtBW0aZqH
	PvEl8ZD8FAWrWuFwDeq4ZPS/pfAthpUYjDgvVBKoQ9LpNbxufhnAuB71EhH7joNO5j+u5H070ktRc
	vdVOPu7llqDU+pcwaNLayBNue7pZWe4klftfRroOtYEQHeSvF7R0DVFqKHBPf9khbvYA9mDbm4MKU
	ygtcNCBurMexkLLuNvxQ8roQZmd+G7pKuavpJDEZflJ+2oWQr2L+brJurwC5UaAkgnw3ToA4SEuHD
	ATcq89xGJNs/uAjM2C8UIyaiq3de+/7p+qhynKygRtOwGy+NU+6nJfxH3KlTkbqTi5oVww4RfY8GB
	zQznECtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywN-000000079Lc-1oVN;
	Wed, 29 Jul 2026 07:42:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woywK-000000079KS-1auu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:42:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce98cb8165so6732795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310975; x=1785915775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNKMfFoLrxfVgkUmO/8mblNHEBodyP1KuT76nV4WYpo=;
        b=WlVw50RtIzyy44daRMBrf+ypjpqueq3xfn/UBBMz8rtTYIAsXt6iU4Osa9EktLRv1U
         DESHvPVqQnpNsPDwiGf9U0rQsY7bbvT3Yetj5RGEIJ1LPoVs67hzA9BqNa5nroWZN+TL
         Q0bALcMVJb4C3SOiBXVx88y5pk26snzCeIoR3cRfHmSU4lIRkB1Rw+aV75+KlQMFg8u4
         SQE6sptY3WOvfeINDd22zMw1UoPNTfruA+tyrcLq/WcwNw3Hf9ZfmyIP5liFwkfNQqa0
         iyux7A4jfZ9rfDOarddCJETttUPWuyLohbtBhmlW4W6Mbr0l40h+hePTjQjPs20qMsmN
         K82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310975; x=1785915775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNKMfFoLrxfVgkUmO/8mblNHEBodyP1KuT76nV4WYpo=;
        b=mEt8HJVsg3pOdCHtMNH//Dd5tnAwCGbLwqZcpPwmB3rH6DLzk1LOVwUpvpMzsdIRKQ
         kTXl2Mp+8+ym2No8zHhX0THAKIlPXWZJA+C4KA+w7h2pi2kHj2yg1Yjtx8k48cCmGUze
         X7f9vtFvh+2+8jv7VnEGLvssRJNTdAAjQ0/0ZNMzeBefJQdF2EZw7peCW4aIaIMJ5maI
         jsEBmRsYD6TyMXZtiKfUiivNSSTjCgADK4FpW4kNwsCa9PEryi1mnv0kE3gqgVkCjLGa
         se6+FLZvccmtN8EUVFRSKQNXlFkIq/aRdo9qirRAxSjmPyBL3uRmQAib/Lc7wbYcgppd
         XH+g==
X-Forwarded-Encrypted: i=1; AHgh+RouKRwbojt621Jt86r1z6koQIGbkNWhMZywcfcmdIKEj93NIMgEbkvOtszARyizmCiFBoMPHtfBjwCF1v4vNj6k@lists.infradead.org
X-Gm-Message-State: AOJu0YwJOQNAjl0Z7wEPz30PnKwt+KURRWCZzDj6nQwaHXl5jXcV+11A
	9SYr92PvmRUvX71Woeucy9xD+zSvXczNqRs4z+bzpnaUJ4qONEnJnKfE
X-Gm-Gg: AR+sD10Gc/qmyN105eUouyiXhy96ssO508xC0ZzN9iyETMlt19CKizfBqJhaqxTTdE1
	LJmkgTeMah4EXids1Ki8iShCF31b2E7loVNYshvHTgJ6B4CW3D4sLU3C0Z4hchjK3YSsJkXoRos
	M1RokC+HiPjUOPExMqz2Nuq+vHHkWWQRHlSnl6l1tJkxM8u45ovKBLyGELbBA/SbvVBlaookjdw
	7LXg0nuHG8JGpIU99lGnhjpvPYGwTGcB5DbxfWDPIQIjVjxFA2PwY5aRqp/HgXplh9Ik8CQAs6W
	fBVpblneBdg7eDx3a0gKVVWGrqWOM88Vtz9nySM61a7dyNEnxg8VCBWGFYFgmyvAVLym5Hjr0U3
	dGoOp91ryEXI75FaYklzLZMvxGMMr0v8/Vh/kj8RD4yfE7GZV/Cpqv9/RDLdWPQt0zRCRn6m5tb
	PlBwq5NA11O8KOMCL8XtKQpr8grPGSc0m/XM9wcVcbo/L94y+fkSCZp7zpexs=
X-Received: by 2002:a17:903:46c6:b0:2ca:e496:5f19 with SMTP id d9443c01a7336-2d0267522d0mr13767845ad.19.1785310975421;
        Wed, 29 Jul 2026 00:42:55 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf888csm7154505ad.64.2026.07.29.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:42:54 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/2] net: stmmac: Skip PHY attach if custom PCS is in use
Date: Wed, 29 Jul 2026 15:42:36 +0800
Message-Id: <20260729074237.2624940-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729074237.2624940-1-zxyan0222@gmail.com>
References: <20260729074237.2624940-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_004256_429036_6997BC36 
X-CRM114-Status: GOOD (  13.08  )
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
the MAC's phylink_pcs is already configured. In this case, no
traditional PHY device is needed.

Without this, stmmac_init_phy() falls through to the no-phy-node
path and errors out with "no phy found" when the DT has no
phy-handle for such interfaces.

Skip the PHY attach when priv->hw->phylink_pcs is set and
phy_addr is invalid.

Fixes: f0ef433fc264 ("net: stmmac: introduce pcs_init/pcs_exit stmmac operations")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 562d20830b94..575132b9cdbf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1347,6 +1347,10 @@ static int stmmac_init_phy(struct net_device *dev)
 		struct phy_device *phydev;
 
 		if (addr < 0) {
+			/* If a custom PCS is in use, no PHY is needed */
+			if (priv->hw->phylink_pcs)
+				return 0;
+
 			netdev_err(priv->dev, "no phy found\n");
 			return -ENODEV;
 		}
-- 
2.34.1


