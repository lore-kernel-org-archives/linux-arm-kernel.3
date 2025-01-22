Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EB7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R21uchUxZH3kd/+XEJyhxXfsQTWgj4LtDLMoHBD/ylY=; b=IW83HK47se454sQjPIeCCdBwgR
	FU60jT+H5qhU/1l8KemwII1VKE3TZ9oSEguPiLxBqAK3l/9V6oSm+pvYQtouIf+iJ7JpMfSnGrnAu
	vWBwI1FTGeZ27dYJEX7XWgjjOXy1HqLaCH57KHlnGm3i3a5yFM+LZbPZ2ghM3N8qDkLRStji35Cx4
	dc/jLVBLMBaiTBPIvHfvxbbKWzQKP7C76qG4epcLQQzn2jj4PgrDf5/AR3yzPxsEp15fjyHUUZ+rY
	NSIPLO/yptXxhHA+COvjnpJyupPIXaSCwkEqEV66QMgISEkwGtt9cJneYZ22d4uiFfcTRZf27Lb0n
	zWR8jsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taenK-0000000AuIM-0vvg;
	Wed, 22 Jan 2025 17:45:38 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taekl-0000000AtbH-1S53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:43:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 497721BF20A;
	Wed, 22 Jan 2025 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737567777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R21uchUxZH3kd/+XEJyhxXfsQTWgj4LtDLMoHBD/ylY=;
	b=DZKgEsHO8ziv7KeVihZaDAIEhCh1W2pzfR6LOfaQptA4ggQY9zz5aqwCUiGElzu9cgUiSK
	KXD02YlVDWPSvzI5vzFGkleXUpEAhD1085GJr8YK6bOmOMyOgow14YSPtJy6jzEEB4ndt0
	Bzdw9LBNUuAK1lF7ZoNE6ytPzi7IL3C7D6Rk9CH9vVUxtMOxZLzeqE9Uz9vvYa4DC1cIa4
	TuWUOO8gtiKYUP34kMqG1cvw+jyDAPWcR7KPQvJazDfxKG2jejQ87bCGF0YU4J6TLi0eJd
	29mkCrWTfMZkoIgjPEvDN7WOJW9s0vDmb0EEc4EiJG11LqSiJHOcg52CcSCLqQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next RFC v2 1/6] net: ethtool: common: Make BaseT a 4-lanes mode
Date: Wed, 22 Jan 2025 18:42:46 +0100
Message-ID: <20250122174252.82730-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094259_511110_4FDE7851 
X-CRM114-Status: GOOD (  10.33  )
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

When referring to BaseT ethernet, we are most of the time thinking of
BaseT4 ethernet on Cat5/6/7 cables. This is therefore BaseT4, although
BaseT4 is also possible for 100BaseTX. This is even more true now that
we have a special __LINK_MODE_LANES_T1 mode especially for Single Pair
ethernet.

Mark BaseT as being a 4-lanes mode.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
RFC V2: No changes

 net/ethtool/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 2bd77c94f9f1..8452d3216bce 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -244,7 +244,7 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_LR8_ER8_FR8	8
 #define __LINK_MODE_LANES_LRM		1
 #define __LINK_MODE_LANES_MLD2		2
-#define __LINK_MODE_LANES_T		1
+#define __LINK_MODE_LANES_T		4
 #define __LINK_MODE_LANES_T1		1
 #define __LINK_MODE_LANES_X		1
 #define __LINK_MODE_LANES_FX		1
-- 
2.48.1


