Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1DDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qP5fHpkwdXZblvpZzaRSVdXqYAoJ1F4EruazOKwBiI=; b=Nc0ZDPu+OPScWG5ghHmULIXUBN
	vz27EZTWKjM4wq0oR6Iz56Y3WAlSWy4BAVljlqUb/J4ix0InE+3fhwsW0eEGr8pP8wHauOpvw29za
	DXI7MbmVrz6YpjY9B1G8TP3ER6KpG112XpVB5J05TXYnlpQE3QcsfS4dHkirHGJh/dLR3En9T6uG/
	V0NPwDLYB147ryc8iP4sN/1zyeoixsi+AREYdKNE8+aqltFBKKEfdfrXokB0kpvNcWHV3C35lR7q9
	1Uq+VVGyjaVnWY53FYxksdC1ZriLshTk0DLmgA7eiuw4MLMW3ybEGELI+ZdbdrFt5H8zZ6FH+FdNj
	LziByk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmDV-00000001G9P-1oF3;
	Fri, 02 May 2025 08:57:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm8a-00000001F0t-0sJ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:52:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DFBA43214;
	Fri,  2 May 2025 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746175967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qP5fHpkwdXZblvpZzaRSVdXqYAoJ1F4EruazOKwBiI=;
	b=DKuSFT1CmF534CHNyAxRWuLIWCtnW6ISwJiRLIyWvhUEu58YJcEEw9CweP0s8lr/hqmxZM
	3yzZVXUvMUb37smqxQltKxGXcCCgZ3nU7k4jhByLH9inPqBa+IxHTkJ2O1q3sOUCaPSGVc
	Pz6jA9hZZccJwfsvp1GSlCHyepyTact5IvsRJWMPizFV2tcQtOQVoYmMNGTQPP9R8u8w2a
	RPfRBM3ODr5iL8LFui9/IWbxBz99ZzMbfBbbaoTS1MsI5ORy7+MZsSMHDSzIlQrBPCoQZ+
	nDSYVQ61ZH62Sc8a7UU0zzvt8kzw+tdX8nFq1IoHrSXHhgjdMiV4+QHR8o/oaw==
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
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: [PATCH net-next v8 1/3] net: ethtool: Introduce per-PHY DUMP operations
Date: Fri,  2 May 2025 10:52:39 +0200
Message-ID: <20250502085242.248645-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502085242.248645-1-maxime.chevallier@bootlin.com>
References: <20250502085242.248645-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_015252_746153_403F05A0 
X-CRM114-Status: GOOD (  22.20  )
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

ethnl commands that target a phy_device need a DUMP implementation that
will fill the reply for every PHY behind a netdev. We therefore need to
iterate over the dev->topo to list them.

When multiple PHYs are behind the same netdev, it's also useful to
perform DUMP with a filter on a given netdev, to get the capability of
every PHY.

Implement dedicated genl ->start(), ->dumpit() and ->done() operations
for PHY-targetting command, allowing filtered dumps and using a dump
context that keep track of the PHY iteration for multi-message dump.

PSE-PD and PLCA are converted to this new set of ops along the way.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 203 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 194 insertions(+), 9 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 977beeaaa2f9..a58570c68db2 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -357,6 +357,18 @@ struct ethnl_dump_ctx {
 	unsigned long			pos_ifindex;
 };
 
+/**
+ * struct ethnl_perphy_dump_ctx - context for dumpit() PHY-aware callbacks
+ * @ethnl_ctx: generic ethnl context
+ * @ifindex: For Filtered DUMP requests, the ifindex of the targeted netdev
+ * @pos_phyindex: iterator position for multi-msg DUMP
+ */
+struct ethnl_perphy_dump_ctx {
+	struct ethnl_dump_ctx	ethnl_ctx;
+	unsigned int		ifindex;
+	unsigned long		pos_phyindex;
+};
+
 static const struct ethnl_request_ops *
 ethnl_default_requests[__ETHTOOL_MSG_USER_CNT] = {
 	[ETHTOOL_MSG_STRSET_GET]	= &ethnl_strset_request_ops,
@@ -407,6 +419,12 @@ static struct ethnl_dump_ctx *ethnl_dump_context(struct netlink_callback *cb)
 	return (struct ethnl_dump_ctx *)cb->ctx;
 }
 
+static struct ethnl_perphy_dump_ctx *
+ethnl_perphy_dump_context(struct netlink_callback *cb)
+{
+	return (struct ethnl_perphy_dump_ctx *)cb->ctx;
+}
+
 /**
  * ethnl_default_parse() - Parse request message
  * @req_info:    pointer to structure to put data into
@@ -662,6 +680,173 @@ static int ethnl_default_start(struct netlink_callback *cb)
 	return ret;
 }
 
+/* per-PHY ->start() handler for GET requests */
+static int ethnl_perphy_start(struct netlink_callback *cb)
+{
+	struct ethnl_perphy_dump_ctx *phy_ctx = ethnl_perphy_dump_context(cb);
+	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
+	struct ethnl_dump_ctx *ctx = &phy_ctx->ethnl_ctx;
+	struct ethnl_reply_data *reply_data;
+	const struct ethnl_request_ops *ops;
+	struct ethnl_req_info *req_info;
+	struct genlmsghdr *ghdr;
+	int ret;
+
+	BUILD_BUG_ON(sizeof(*ctx) > sizeof(cb->ctx));
+
+	ghdr = nlmsg_data(cb->nlh);
+	ops = ethnl_default_requests[ghdr->cmd];
+	if (WARN_ONCE(!ops, "cmd %u has no ethnl_request_ops\n", ghdr->cmd))
+		return -EOPNOTSUPP;
+	req_info = kzalloc(ops->req_info_size, GFP_KERNEL);
+	if (!req_info)
+		return -ENOMEM;
+	reply_data = kmalloc(ops->reply_data_size, GFP_KERNEL);
+	if (!reply_data) {
+		ret = -ENOMEM;
+		goto free_req_info;
+	}
+
+	/* Unlike per-dev dump, don't ignore dev. The dump handler
+	 * will notice it and dump PHYs from given dev. We only keep track of
+	 * the dev's ifindex, .dumpit() will grab and release the netdev itself.
+	 */
+	ret = ethnl_default_parse(req_info, &info->info, ops, false);
+	if (req_info->dev) {
+		phy_ctx->ifindex = req_info->dev->ifindex;
+		netdev_put(req_info->dev, &req_info->dev_tracker);
+		req_info->dev = NULL;
+	}
+	if (ret < 0)
+		goto free_reply_data;
+
+	ctx->ops = ops;
+	ctx->req_info = req_info;
+	ctx->reply_data = reply_data;
+	ctx->pos_ifindex = 0;
+
+	return 0;
+
+free_reply_data:
+	kfree(reply_data);
+free_req_info:
+	kfree(req_info);
+
+	return ret;
+}
+
+static int ethnl_perphy_dump_one_dev(struct sk_buff *skb,
+				     struct ethnl_perphy_dump_ctx *ctx,
+				     const struct genl_info *info)
+{
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	struct net_device *dev = ethnl_ctx->req_info->dev;
+	struct phy_device_node *pdn;
+	int ret;
+
+	if (!dev->link_topo)
+		return 0;
+
+	xa_for_each_start(&dev->link_topo->phys, ctx->pos_phyindex, pdn,
+			  ctx->pos_phyindex) {
+		ethnl_ctx->req_info->phy_index = ctx->pos_phyindex;
+
+		/* We can re-use the original dump_one as ->prepare_data in
+		 * commands use ethnl_req_get_phydev(), which gets the PHY from
+		 * the req_info->phy_index
+		 */
+		ret = ethnl_default_dump_one(skb, dev, ethnl_ctx, info);
+		if (ret)
+			return ret;
+	}
+
+	ctx->pos_phyindex = 0;
+
+	return 0;
+}
+
+static int ethnl_perphy_dump_all_dev(struct sk_buff *skb,
+				     struct ethnl_perphy_dump_ctx *ctx,
+				     const struct genl_info *info)
+{
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	struct net *net = sock_net(skb->sk);
+	netdevice_tracker dev_tracker;
+	struct net_device *dev;
+	int ret = 0;
+
+	rcu_read_lock();
+	for_each_netdev_dump(net, dev, ethnl_ctx->pos_ifindex) {
+		netdev_hold(dev, &dev_tracker, GFP_ATOMIC);
+		rcu_read_unlock();
+
+		/* per-PHY commands use ethnl_req_get_phydev(), which needs the
+		 * net_device in the req_info
+		 */
+		ethnl_ctx->req_info->dev = dev;
+		ret = ethnl_perphy_dump_one_dev(skb, ctx, info);
+
+		rcu_read_lock();
+		netdev_put(dev, &dev_tracker);
+		ethnl_ctx->req_info->dev = NULL;
+
+		if (ret < 0 && ret != -EOPNOTSUPP) {
+			if (likely(skb->len))
+				ret = skb->len;
+			break;
+		}
+		ret = 0;
+	}
+	rcu_read_unlock();
+
+	return ret;
+}
+
+/* per-PHY ->dumpit() handler for GET requests. */
+static int ethnl_perphy_dumpit(struct sk_buff *skb,
+			       struct netlink_callback *cb)
+{
+	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
+	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	int ret = 0;
+
+	if (ctx->ifindex) {
+		netdevice_tracker dev_tracker;
+		struct net_device *dev;
+
+		dev = netdev_get_by_index(genl_info_net(&info->info),
+					  ctx->ifindex, &dev_tracker,
+					  GFP_KERNEL);
+		if (!dev)
+			return -ENODEV;
+
+		ethnl_ctx->req_info->dev = dev;
+		ret = ethnl_perphy_dump_one_dev(skb, ctx, genl_info_dump(cb));
+
+		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
+			ret = skb->len;
+
+		netdev_put(dev, &dev_tracker);
+	} else {
+		ret = ethnl_perphy_dump_all_dev(skb, ctx, genl_info_dump(cb));
+	}
+
+	return ret;
+}
+
+/* per-PHY ->done() handler for GET requests */
+static int ethnl_perphy_done(struct netlink_callback *cb)
+{
+	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+
+	kfree(ethnl_ctx->reply_data);
+	kfree(ethnl_ctx->req_info);
+
+	return 0;
+}
+
 /* default ->done() handler for GET requests */
 static int ethnl_default_done(struct netlink_callback *cb)
 {
@@ -1200,9 +1385,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_PSE_GET,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_perphy_start,
+		.dumpit	= ethnl_perphy_dumpit,
+		.done	= ethnl_perphy_done,
 		.policy = ethnl_pse_get_policy,
 		.maxattr = ARRAY_SIZE(ethnl_pse_get_policy) - 1,
 	},
@@ -1224,9 +1409,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_PLCA_GET_CFG,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_perphy_start,
+		.dumpit	= ethnl_perphy_dumpit,
+		.done	= ethnl_perphy_done,
 		.policy = ethnl_plca_get_cfg_policy,
 		.maxattr = ARRAY_SIZE(ethnl_plca_get_cfg_policy) - 1,
 	},
@@ -1240,9 +1425,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_PLCA_GET_STATUS,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_perphy_start,
+		.dumpit	= ethnl_perphy_dumpit,
+		.done	= ethnl_perphy_done,
 		.policy = ethnl_plca_get_status_policy,
 		.maxattr = ARRAY_SIZE(ethnl_plca_get_status_policy) - 1,
 	},
-- 
2.49.0


