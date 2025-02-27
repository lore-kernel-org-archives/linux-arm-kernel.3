Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC78C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAf0sv9xDuaLpXhcwIoBAI4n+toA8S87mPFKt5v4J0s=; b=SSnOsSI5B/NFo4sjK6G5/4V835
	scc7D1kPSwS6AhBV3zhImlZtzwvRuwIcdre0PVzE9iW9Dt8e70awPrmec+H09CO7/kTP2QyH5Ss+A
	1YqloaXSmhm/yjGcMX9k11wPqzZ3czHWRHQNlUv0YdShCYTHZuW2glYyl3q1TET3ro3B8MAmtPd5E
	n2AvLuVoC82xSNdHNUCo5RSDUu4CJcq/cYCqvbjhJO7h0T2W0SotAgecAWiUwLK298MtcSy8to1Zw
	OPx6zj5Am5sL901TpBbvm1TjgBx/7zNlSLECUsIzXx4zMQ/hqlri0fOLDkcFHEVvhWHw04Z53fQ2c
	oqBbud6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmF-00000008d5z-2WbY;
	Thu, 27 Feb 2025 19:42:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniZD-00000008JsQ-1lHe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:25:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF2C3443C1;
	Thu, 27 Feb 2025 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740680698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAf0sv9xDuaLpXhcwIoBAI4n+toA8S87mPFKt5v4J0s=;
	b=nrIL6fzxm8WR81Nyux4fFY6CdAQ6LBH4yZBwEHTL5eKesBlDIEL2r1922T8PZ+Lpul7Ram
	R3HN4+NKRDnYX204JF+895FMR6Qkq8pk42ivJ+CW12h7JLeTr4maIPNXQW4N4l81GuSlGn
	FgqfK1HPgkvoaqkJSTJtCpyMVgJU++vVZgldATBxiRkLYlaFJLD5QncqCSXvx+Q5RMdHww
	ryF9LyNYSFbvIpDBME6vVN2yjCQUMgunJ432GroOBtHEK2IqepEj6vT+YlvlIsZNWR0B3/
	TeE+FZ0k93r4nFf9rLDpcvp6GVBD4Frs45yFPYFZNBpAVweVyGd934iU+TBtMg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: [PATCH net 1/2] net: ethtool: netlink: Allow NULL nlattrs when getting a phy_device
Date: Thu, 27 Feb 2025 19:24:51 +0100
Message-ID: <20250227182454.1998236-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_102503_832021_8F8616E2 
X-CRM114-Status: GOOD (  21.10  )
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

ethnl_req_get_phydev() is used to lookup a phy_device, in the case an
ethtool netlink command targets a specific phydev within a netdev's
topology.

It takes as a parameter a const struct nlattr *header that's used for
error handling :

       if (!phydev) {
               NL_SET_ERR_MSG_ATTR(extack, header,
                                   "no phy matching phyindex");
               return ERR_PTR(-ENODEV);
       }

In the notify path after a ->set operation however, there's no request
attributes available.

The typical callsite for the above function looks like:

	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_XXX_HEADER],
				      info->extack);

So, when tb is NULL (such as in the ethnl notify path), we have a nice
crash.

It turns out that there's only the PLCA command that is in that case, as
the other phydev-specific commands don't have a notification.

This commit fixes the crash by passing the cmd index and the nlattr
array separately, allowing NULL-checking it directly inside the helper.

Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some commands")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---

I didn't include a Reported-by tag as the report was done outside of the
mailing list, and checkpatch wants a "Closes:" if I add Reported-by...

 net/ethtool/cabletest.c | 8 ++++----
 net/ethtool/linkstate.c | 2 +-
 net/ethtool/netlink.c   | 6 +++---
 net/ethtool/netlink.h   | 5 +++--
 net/ethtool/phy.c       | 2 +-
 net/ethtool/plca.c      | 6 +++---
 net/ethtool/pse-pd.c    | 4 ++--
 net/ethtool/stats.c     | 2 +-
 net/ethtool/strset.c    | 2 +-
 9 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/net/ethtool/cabletest.c b/net/ethtool/cabletest.c
index f22051f33868..84096f6b0236 100644
--- a/net/ethtool/cabletest.c
+++ b/net/ethtool/cabletest.c
@@ -72,8 +72,8 @@ int ethnl_act_cable_test(struct sk_buff *skb, struct genl_info *info)
 	dev = req_info.dev;
 
 	rtnl_lock();
-	phydev = ethnl_req_get_phydev(&req_info,
-				      tb[ETHTOOL_A_CABLE_TEST_HEADER],
+	phydev = ethnl_req_get_phydev(&req_info, tb,
+				      ETHTOOL_A_CABLE_TEST_HEADER,
 				      info->extack);
 	if (IS_ERR_OR_NULL(phydev)) {
 		ret = -EOPNOTSUPP;
@@ -339,8 +339,8 @@ int ethnl_act_cable_test_tdr(struct sk_buff *skb, struct genl_info *info)
 		goto out_dev_put;
 
 	rtnl_lock();
-	phydev = ethnl_req_get_phydev(&req_info,
-				      tb[ETHTOOL_A_CABLE_TEST_TDR_HEADER],
+	phydev = ethnl_req_get_phydev(&req_info, tb,
+				      ETHTOOL_A_CABLE_TEST_TDR_HEADER,
 				      info->extack);
 	if (IS_ERR_OR_NULL(phydev)) {
 		ret = -EOPNOTSUPP;
diff --git a/net/ethtool/linkstate.c b/net/ethtool/linkstate.c
index af19e1bed303..05a5f72c99fa 100644
--- a/net/ethtool/linkstate.c
+++ b/net/ethtool/linkstate.c
@@ -103,7 +103,7 @@ static int linkstate_prepare_data(const struct ethnl_req_info *req_base,
 	struct phy_device *phydev;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_LINKSTATE_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_LINKSTATE_HEADER,
 				      info->extack);
 	if (IS_ERR(phydev)) {
 		ret = PTR_ERR(phydev);
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index b4c45207fa32..734849a57369 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -211,7 +211,7 @@ int ethnl_parse_header_dev_get(struct ethnl_req_info *req_info,
 }
 
 struct phy_device *ethnl_req_get_phydev(const struct ethnl_req_info *req_info,
-					const struct nlattr *header,
+					struct nlattr **tb, unsigned int header,
 					struct netlink_ext_ack *extack)
 {
 	struct phy_device *phydev;
@@ -225,8 +225,8 @@ struct phy_device *ethnl_req_get_phydev(const struct ethnl_req_info *req_info,
 		return req_info->dev->phydev;
 
 	phydev = phy_link_topo_get_phy(req_info->dev, req_info->phy_index);
-	if (!phydev) {
-		NL_SET_ERR_MSG_ATTR(extack, header,
+	if (!phydev && tb) {
+		NL_SET_ERR_MSG_ATTR(extack, tb[header],
 				    "no phy matching phyindex");
 		return ERR_PTR(-ENODEV);
 	}
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index ff69ca0715de..ec6ab5443a6f 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -275,7 +275,8 @@ static inline void ethnl_parse_header_dev_put(struct ethnl_req_info *req_info)
  * ethnl_req_get_phydev() - Gets the phy_device targeted by this request,
  *			    if any. Must be called under rntl_lock().
  * @req_info:	The ethnl request to get the phy from.
- * @header:	The netlink header, used for error reporting.
+ * @tb:		The netlink attributes array, for error reporting.
+ * @header:	The netlink header index, used for error reporting.
  * @extack:	The netlink extended ACK, for error reporting.
  *
  * The caller must hold RTNL, until it's done interacting with the returned
@@ -289,7 +290,7 @@ static inline void ethnl_parse_header_dev_put(struct ethnl_req_info *req_info)
  *	   is returned.
  */
 struct phy_device *ethnl_req_get_phydev(const struct ethnl_req_info *req_info,
-					const struct nlattr *header,
+					struct nlattr **tb, unsigned int header,
 					struct netlink_ext_ack *extack);
 
 /**
diff --git a/net/ethtool/phy.c b/net/ethtool/phy.c
index ed8f690f6bac..e067cc234419 100644
--- a/net/ethtool/phy.c
+++ b/net/ethtool/phy.c
@@ -125,7 +125,7 @@ static int ethnl_phy_parse_request(struct ethnl_req_info *req_base,
 	struct phy_req_info *req_info = PHY_REQINFO(req_base);
 	struct phy_device *phydev;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_PHY_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_PHY_HEADER,
 				      extack);
 	if (!phydev)
 		return 0;
diff --git a/net/ethtool/plca.c b/net/ethtool/plca.c
index d95d92f173a6..e1f7820a6158 100644
--- a/net/ethtool/plca.c
+++ b/net/ethtool/plca.c
@@ -62,7 +62,7 @@ static int plca_get_cfg_prepare_data(const struct ethnl_req_info *req_base,
 	struct phy_device *phydev;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_PLCA_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_PLCA_HEADER,
 				      info->extack);
 	// check that the PHY device is available and connected
 	if (IS_ERR_OR_NULL(phydev)) {
@@ -152,7 +152,7 @@ ethnl_set_plca(struct ethnl_req_info *req_info, struct genl_info *info)
 	bool mod = false;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_info, tb[ETHTOOL_A_PLCA_HEADER],
+	phydev = ethnl_req_get_phydev(req_info, tb, ETHTOOL_A_PLCA_HEADER,
 				      info->extack);
 	// check that the PHY device is available and connected
 	if (IS_ERR_OR_NULL(phydev))
@@ -211,7 +211,7 @@ static int plca_get_status_prepare_data(const struct ethnl_req_info *req_base,
 	struct phy_device *phydev;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_PLCA_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_PLCA_HEADER,
 				      info->extack);
 	// check that the PHY device is available and connected
 	if (IS_ERR_OR_NULL(phydev)) {
diff --git a/net/ethtool/pse-pd.c b/net/ethtool/pse-pd.c
index 2819e2ba6be2..4f6b99eab2a6 100644
--- a/net/ethtool/pse-pd.c
+++ b/net/ethtool/pse-pd.c
@@ -64,7 +64,7 @@ static int pse_prepare_data(const struct ethnl_req_info *req_base,
 	if (ret < 0)
 		return ret;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_PSE_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_PSE_HEADER,
 				      info->extack);
 	if (IS_ERR(phydev))
 		return -ENODEV;
@@ -261,7 +261,7 @@ ethnl_set_pse(struct ethnl_req_info *req_info, struct genl_info *info)
 	struct phy_device *phydev;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_info, tb[ETHTOOL_A_PSE_HEADER],
+	phydev = ethnl_req_get_phydev(req_info, tb, ETHTOOL_A_PSE_HEADER,
 				      info->extack);
 	ret = ethnl_set_pse_validate(phydev, info);
 	if (ret)
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 038a2558f052..3ca8eb2a3b31 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -138,7 +138,7 @@ static int stats_prepare_data(const struct ethnl_req_info *req_base,
 	struct phy_device *phydev;
 	int ret;
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_STATS_HEADER],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_STATS_HEADER,
 				      info->extack);
 	if (IS_ERR(phydev))
 		return PTR_ERR(phydev);
diff --git a/net/ethtool/strset.c b/net/ethtool/strset.c
index 6b76c05caba4..f6a67109beda 100644
--- a/net/ethtool/strset.c
+++ b/net/ethtool/strset.c
@@ -309,7 +309,7 @@ static int strset_prepare_data(const struct ethnl_req_info *req_base,
 		return 0;
 	}
 
-	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_HEADER_FLAGS],
+	phydev = ethnl_req_get_phydev(req_base, tb, ETHTOOL_A_HEADER_FLAGS,
 				      info->extack);
 
 	/* phydev can be NULL, check for errors only */
-- 
2.48.1


