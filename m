Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD2FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VEJe+1swjZgkADNkawN3wsqrsvKx3yd9+z0b1zAaso=; b=VeI/nvMMGDW6WWdOTEVayQN5ve
	PE+ZpSAYykTQTM7yWp0duxPRu3q6aT65Wf15m2bt0pqZKyidHf/wyRtE3Gb3txA1s5K9D5GtarjIy
	lISJFzxlACPJLm7aVha58JGf3JzwyDBfLGjLYO9G1i2ntul3BnP6VeANKVTZIwvrrACsUgWky2s27
	1fM0r7P2OcTF6BNRZuJPUayrPzPKPVazLgngBY8bns8z2Og1fRpsrLgxELsWH6kfdVfUg5LNCYrfC
	zqgQ6I25R3Rl6dibkEIUB4x9dkpUrE6RYmwlwPybfgnIkt/U23VI+2+13wjrbgJgUr70r8JU6/6Qb
	JSQ9S2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjQG-000000060qw-0UV0;
	Fri, 20 Dec 2024 20:16:32 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjP5-000000060bw-05UK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 20:15:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3005BE0002;
	Fri, 20 Dec 2024 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734725711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VEJe+1swjZgkADNkawN3wsqrsvKx3yd9+z0b1zAaso=;
	b=VKpNX6OyJU7dGG5vvrytkpBk2GMh0p1cQblILZsQ9pyj2Otzg029rX/FPyAdiaa88MtCqS
	DLE3ejbHCgCO7ujEqKqlURuk3JXlckE+ipfcK5w5AEFDvSicwGYpj+gfuu08ucLTrS0BSs
	WuVUYbuOfmjPyAruxokqErDE68HHGYfKaMXSDzlP2OInFDRweD5JXUbklw9aIyXp9IVcaI
	nIn5oPNnHnmXP+J4wIz6DcaqmIdETVAaGgQNO23SrYIFX76gY7Ji6PT5xrJOsUUXAuly5r
	PDPj9+DV8LWpwJdoWl3N49IIWhSV+FV+vOdILDutzWF3LJn9FipCpZsqWaGHEw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	Antoine Tenart <atenart@kernel.org>
Subject: [PATCH net-next RFC 1/5] net: ethtool: common: Make BaseT a 4-lanes mode
Date: Fri, 20 Dec 2024 21:15:00 +0100
Message-ID: <20241220201506.2791940-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_121519_366975_AF0ECCD4 
X-CRM114-Status: UNSURE (   9.57  )
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

When referring to BaseT ethernet, we are most of the time thinking of
BaseT4 ethernet on Cat5/6/7 cables. This is therefore BaseT4, although
BaseT4 is also possible for 100BaseTX. This is even more true now that
we have a special __LINK_MODE_LANES_T1 mode especially for Single Pair
ethernet.

Mark BaseT as being a 4-lanes mode.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 02f941f667dd..5a9c09ce57d5 100644
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
2.47.1


