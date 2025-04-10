Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B84C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGJUReIguyRV9xbIU9xSCriFdgpAnC77rarzBi44MG0=; b=I/iz4/XMJAFbrt+sDxDcOXlb8r
	62qJRiJcWuyIIUtIMwTTbBrzRCZUrxjPpiShbKUfhLzXSlso8Lc/BzmhTWvN+DP8Y+O6GGTiinP+Q
	qgU/VaFvy3/0Mjxr04b1s6+VFmJ8GkTT8oPDuwqg7iqiR32Cgx09Qph+5UYNmD1k52jx3tsD3duZG
	e9sLdg2OJNp9MLd0rxL6Lk4fRW5uh9akdp2FjBSztiYpOhVhI5ROwdb7kLkmjyowSzboaIrgHSKPN
	f4OGUnhVPnDEBWwFMvl1SHELAkiMTyLtMyoaQx/8te5Slbcye/zjkUSF3Jf8m5CX6Qmx3/4w8JXNE
	4vn/KRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r8H-0000000AWHn-0xts;
	Thu, 10 Apr 2025 12:35:49 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r6T-0000000AVtR-0ROl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:33:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 498774433D;
	Thu, 10 Apr 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744288435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGJUReIguyRV9xbIU9xSCriFdgpAnC77rarzBi44MG0=;
	b=G8dgjPxKC4HU8TuoZ8134TttkhQMtiq2n4a1UyaGTaCriv6hHAJku59LdvdTR3bUjPWDBb
	uQCEk1ZTOipFIJ2dGb2Kva0emCarEQiLqaeHN9cCZD6E8vYbJLCiJYSKbjUIuhpuJdnBZl
	fFSkXX2gBjopq3JXlBbiz+oGse7FZ/fdSIhfVbL5ukxH71LLEtuP3VF9ukK9ZIKv5/oP/d
	pTGjyU+w0+oz/Q7HcMZRrM6qVUrju419ejiYd6qf7dHIh6awSfbvNab7eZIDjQp+RSXMqB
	pvzLlFuFQ01miacSpkoC3Maq9i9haqHrL+Af1ddbfpDK90bAC+XW/jUmnstRGA==
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
Subject: [PATCH net-next v5 1/4] net: ethtool: Introduce per-PHY DUMP operations
Date: Thu, 10 Apr 2025 14:33:46 +0200
Message-ID: <20250410123350.174105-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
References: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053357_469441_060F907A 
X-CRM114-Status: GOOD (  19.21  )
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

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 162 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index a163d40c6431..343faa6886a3 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -357,6 +357,16 @@ struct ethnl_dump_ctx {
 	unsigned long			pos_ifindex;
 };
 
+/**
+ * struct ethnl_perphy_dump_ctx - context for dumpit() PHY-aware callbacks
+ * @ethnl_ctx: generic ethnl context
+ * @pos_phyindex: iterator position for multi-msg DUMP
+ */
+struct ethnl_perphy_dump_ctx {
+	struct ethnl_dump_ctx	ethnl_ctx;
+	unsigned long		pos_phyindex;
+};
+
 static const struct ethnl_request_ops *
 ethnl_default_requests[__ETHTOOL_MSG_USER_CNT] = {
 	[ETHTOOL_MSG_STRSET_GET]	= &ethnl_strset_request_ops,
@@ -407,6 +417,12 @@ static struct ethnl_dump_ctx *ethnl_dump_context(struct netlink_callback *cb)
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
@@ -661,6 +677,152 @@ static int ethnl_default_start(struct netlink_callback *cb)
 	return ret;
 }
 
+/* perphy ->start() handler for GET requests */
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
+	/* Don't ignore the dev even for DUMP requests */
+	ret = ethnl_default_parse(req_info, &info->info, ops, false);
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
+				     struct net_device *dev,
+				     struct ethnl_perphy_dump_ctx *ctx,
+				     const struct genl_info *info)
+{
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	struct phy_device_node *pdn;
+	int ret = 0;
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
+			break;
+	}
+
+	return ret;
+}
+
+static int ethnl_perphy_dump_all_dev(struct sk_buff *skb,
+				     struct ethnl_perphy_dump_ctx *ctx,
+				     const struct genl_info *info)
+{
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	struct net *net = sock_net(skb->sk);
+	struct net_device *dev;
+	int ret = 0;
+
+	rcu_read_lock();
+	for_each_netdev_dump(net, dev, ethnl_ctx->pos_ifindex) {
+		dev_hold(dev);
+		rcu_read_unlock();
+
+		/* per-PHY commands use ethnl_req_get_phydev(), which needs the
+		 * net_device in the req_info
+		 */
+		ethnl_ctx->req_info->dev = dev;
+		ret = ethnl_perphy_dump_one_dev(skb, dev, ctx, info);
+
+		rcu_read_lock();
+		dev_put(dev);
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
+/* perphy ->dumpit() handler for GET requests. */
+static int ethnl_perphy_dumpit(struct sk_buff *skb,
+			       struct netlink_callback *cb)
+{
+	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
+	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
+	int ret = 0;
+
+	if (ethnl_ctx->req_info->dev) {
+		ret = ethnl_perphy_dump_one_dev(skb, ethnl_ctx->req_info->dev,
+						ctx, genl_info_dump(cb));
+
+		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
+			ret = skb->len;
+
+		netdev_put(ethnl_ctx->req_info->dev,
+			   &ethnl_ctx->req_info->dev_tracker);
+	} else {
+		ret = ethnl_perphy_dump_all_dev(skb, ctx, genl_info_dump(cb));
+	}
+
+	return ret;
+}
+
+/* perphy ->done() handler for GET requests */
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
-- 
2.49.0


