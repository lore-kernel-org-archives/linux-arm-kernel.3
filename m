Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700F1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 20:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDjS9wsj/i5sYXVRvIAzP89uRLtBdLP5tmgPtBoF7s4=; b=1OBu2oOANxNzAZla9yHerlirE/
	0fh0Dpy+WqFELGaLDIj/i2R7xrCoAUkhZ0aTUAqoO9NSSWeLI/l8rx4la4GNIGZXfK6L+FejZ6XL/
	Q8ao48WBS8vcjkdt7Bd+6DK1FmfjGOqNIbZIInglPKiT6/Btx3vuNQNL2f8xrv8SnGwBT4BuyAtNn
	mMBsS1wPAattfqoq1Zdc6XN9r45pY4KbiAZ1rN84i4M7kqHOk/n+lV2sFbprKgaDzy8v8ztXsGzl8
	JpsmKLteMKBDlqZx6bVsLBpqOYhaSp3ZKUj3y1ux1/I4mH4OXkS7ZgbkCqRxskv8NEungWE6xWn1h
	aw4owilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjSW-000000061K7-1bMu;
	Fri, 20 Dec 2024 20:18:52 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjP4-000000060c0-42I4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 20:15:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C43E1E0006;
	Fri, 20 Dec 2024 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734725714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDjS9wsj/i5sYXVRvIAzP89uRLtBdLP5tmgPtBoF7s4=;
	b=MJuPLsiA0RRuh0Lbl+3dGbpGPyEkmENswunuNJpa1c2A1athplvAZd86XMr09AX4MAELny
	LetRjftc06k8t9QxAWKdSeAyf0XLidHaWzUYjzs06POFVqwLf4r7/xy1+flGyrpCxhBOLo
	EKZXVscHbG3b4Exh2JfPWT6+jY758vXonJtsAnGpt4l+uUt+9wNHiUgR73eNZtDSAk9nfF
	Wno2dQGXUfjUa+pxJkCbLzcMhGNVS8b/WnHzUR0NBkWKxyj8NpPSYLv26L88bSWtGMWOln
	rVWqSs2KlaVYx4Kj+K3j5MOTGepBIuneTpl2kQmJ7PuBxZta2U4RU7VD4h8vbA==
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
Subject: [PATCH net-next RFC 3/5] net: ethtool: Export the link_mode_params definitions
Date: Fri, 20 Dec 2024 21:15:02 +0100
Message-ID: <20241220201506.2791940-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_121519_386090_D6DB77F9 
X-CRM114-Status: GOOD (  10.76  )
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

link_mode_params contains a lookup table of all 802.3 link modes that
are currently supported with structured data about each mode's speed,
duplex, number of lanes and mediums.

As a preparation for a port representation, export that table for the
rest of the net stack to use.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 include/linux/ethtool.h | 10 ++++++++++
 net/ethtool/common.c    |  1 +
 net/ethtool/common.h    |  9 ---------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index dc02a1bef549..51d110dfa8ef 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -251,6 +251,16 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
 	}
 }
 
+struct link_mode_info {
+	int                             speed;
+	u8                              min_lanes;
+	u8                              lanes;
+	u8                              duplex;
+	enum ethtool_link_medium        medium;
+};
+
+extern const struct link_mode_info link_mode_params[];
+
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 41e7598f6ed7..bded82c0bba4 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -392,6 +392,7 @@ const struct link_mode_info link_mode_params[] = {
 	__DEFINE_LINK_MODE_PARAMS(10, T1BRR, Full, T),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
+EXPORT_SYMBOL_GPL(link_mode_params);
 
 const char netif_msg_class_names[][ETH_GSTRING_LEN] = {
 	[NETIF_MSG_DRV_BIT]		= "drv",
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index b25011a05fea..ee250a5c5364 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -14,14 +14,6 @@
 
 #define __SOF_TIMESTAMPING_CNT (const_ilog2(SOF_TIMESTAMPING_LAST) + 1)
 
-struct link_mode_info {
-	int				speed;
-	u8				min_lanes;
-	u8				lanes;
-	u8				duplex;
-	enum ethtool_link_medium	medium;
-};
-
 struct genl_info;
 struct hwtstamp_provider_desc;
 
@@ -34,7 +26,6 @@ tunable_strings[__ETHTOOL_TUNABLE_COUNT][ETH_GSTRING_LEN];
 extern const char
 phy_tunable_strings[__ETHTOOL_PHY_TUNABLE_COUNT][ETH_GSTRING_LEN];
 extern const char link_mode_names[][ETH_GSTRING_LEN];
-extern const struct link_mode_info link_mode_params[];
 extern const char netif_msg_class_names[][ETH_GSTRING_LEN];
 extern const char wol_mode_names[][ETH_GSTRING_LEN];
 extern const char sof_timestamping_names[][ETH_GSTRING_LEN];
-- 
2.47.1


