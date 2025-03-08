Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6283BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmy9NxM0ktvekYXuuKXI27bEO2tP0yU3U+/hUv66has=; b=BMENtRGBiE+3jYnvrV1RybI1zA
	VR1cw+MwiZK9zKI1s610fy8AVETJwVDxvGpUllalMRaQoBmu09XdCNFzmfOeufYbalFyht4yRpxx/
	RqJuUhvNbCahTTwYFEgS5psgzGWguMGMSkYA0ehGM1SB6CRDQ0PAEyUZVLLSXDTQOfj4XMgx5bUKR
	ueQJkRxLqTwwRIAHXh8GQqv75DnwSh60hNYNwYNfDZtNo9Xee/3dXnzExs+X12f/Y+Hm4MVkPjq6R
	++6U7LBEPCaMqfmS3pTSNfQPl48VySuqmL1Vw925DlCimlYXXSWY8bKaBU2C8ZTFB1x5jNYG6K+pK
	mz9JX6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwht-0000000Gq9B-0ep6;
	Sat, 08 Mar 2025 16:07:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwVn-0000000GoiF-2EbR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:54:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED68C204CF;
	Sat,  8 Mar 2025 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741449290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmy9NxM0ktvekYXuuKXI27bEO2tP0yU3U+/hUv66has=;
	b=FFPGi6uZLLxb9/W0w/LZ8BQjCxyxBMST6edtHqALz44Ux5cykiGOOGStK6TGiP4UaIdR3V
	RXqEpeg0mSnQTBcXJCsnfd3ZNNbeA2hULpshad4tAi+LpP2mLwv0y5GjomVi+FwCbLlwJH
	Qo6/MIskcz1SkNlxmJ5WkGRKt0ak1DWO/vzY0q7iKEv12dOhpHecvRR4qvPlY7oC8uSucR
	O3/VijVYousSUDqbUQEH89cIjJoQqbJhoPgFNtb4ZHHRkhGIf4cI+ml8Ydxg4nRdlSbnbD
	bBXSjsBlxhUwxdZ/EOBg82yojsbCzyYGO0LjW0ZG2iraZqmBdyy++k0XX47NWg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 4/7] net: ethtool: netlink: Introduce per-phy DUMP helpers
Date: Sat,  8 Mar 2025 16:54:36 +0100
Message-ID: <20250308155440.267782-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_075451_705565_05373357 
X-CRM114-Status: GOOD (  14.63  )
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

As there are multiple ethnl commands that report messages based on
phy_device information, let's introduce a set of ethnl generic dump
helpers to allow DUMP support for each PHY on a given netdev.

This logic iterates over the phy_link_topology of each netdev (or a
single netdev for filtered DUMP), and call ethnl_default_dump_one() with
the req_info populated with ifindex + phyindex.

This allows re-using all the existing infra for phy-targetting commands
that already use ethnl generic helpers.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: Rebase

 net/ethtool/netlink.c | 53 +++++++++++++++++++++++++++++++++++++++++++
 net/ethtool/netlink.h |  6 +++++
 2 files changed, 59 insertions(+)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index ae06b72239a8..a09bcd67b38f 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -559,6 +559,59 @@ static int ethnl_default_dump_one(struct sk_buff *skb,
 	return ret;
 }
 
+/* Specific context for phy-targeting command DUMP operatins. We keep in context
+ * the latest phy_index we dumped, in case of an interrupted DUMP.
+ */
+struct ethnl_dump_ctx_perphy {
+	unsigned long phy_index;
+};
+
+int ethnl_dump_start_perphy(struct ethnl_dump_ctx *ctx)
+{
+	struct ethnl_dump_ctx_perphy *dump_ctx;
+
+	dump_ctx = kzalloc(sizeof(*dump_ctx), GFP_KERNEL);
+	if (!dump_ctx)
+		return -ENOMEM;
+
+	ctx->cmd_ctx = dump_ctx;
+
+	return 0;
+}
+
+void ethnl_dump_done_perphy(struct ethnl_dump_ctx *ctx)
+{
+	kfree(ctx->cmd_ctx);
+}
+
+int ethnl_dump_one_dev_perphy(struct sk_buff *skb,
+			      struct ethnl_dump_ctx *ctx,
+			      const struct genl_info *info)
+{
+	struct ethnl_dump_ctx_perphy *dump_ctx = ctx->cmd_ctx;
+	struct net_device *dev = ctx->reply_data->dev;
+	struct phy_device_node *pdn;
+	int ret = 0;
+
+	if (!dev->link_topo)
+		return 0;
+
+	xa_for_each_start(&dev->link_topo->phys, dump_ctx->phy_index,
+			  pdn, dump_ctx->phy_index) {
+		ctx->req_info->phy_index = dump_ctx->phy_index;
+
+		/* We can re-use the original dump_one as ->prepare_data in
+		 * commands use ethnl_req_get_phydev(), which gets the PHY from
+		 * what's in req_info
+		 */
+		ret = ethnl_default_dump_one(skb, ctx, info);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
 				      struct ethnl_dump_ctx *ctx,
 				      const struct genl_info *info)
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index 79fe98190c64..530a9b5c8b39 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -327,6 +327,12 @@ struct ethnl_dump_ctx {
 	void				*cmd_ctx;
 };
 
+/* Generic callbacks to be used by PHY targeting commands */
+int ethnl_dump_start_perphy(struct ethnl_dump_ctx *ctx);
+int ethnl_dump_one_dev_perphy(struct sk_buff *skb, struct ethnl_dump_ctx *ctx,
+			      const struct genl_info *info);
+void ethnl_dump_done_perphy(struct ethnl_dump_ctx *ctx);
+
 int ethnl_ops_begin(struct net_device *dev);
 void ethnl_ops_complete(struct net_device *dev);
 
-- 
2.48.1


