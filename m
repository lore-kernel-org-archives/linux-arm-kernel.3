Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD93C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGHa73UrWTjwmuPsRwwRvgvwr91/An8UhMtuQjsToI0=; b=D1CQnD/lf+zJVhVTfn0zmeWxFs
	uB+OEVdrdZygzU16m9/AMrDQrkd3w3bv9t+NZGta9CfEc85/IaXUe7mCKh/gGy7jasZNhc0zMkvgK
	shgPu6M7wa4ntrqLrSXnCmiBTWTTtHZU10d/045cKa9RIH0eaajfJUTOGY1FliVG87BXdMTp7LoBm
	7cPhAw/4By3ZPMTlUteVReeGoAaCuuOOmqeR2oCZVS94WzxCbws92+bj4cl8AqeClpGMksrH8dcCP
	3fqS4laQQfD/frvvqsobFBrTIzIIlcvvrA9U49NJk+aEDFOjQ+I+Ac3TB68oMfBKcmBYTQCHN9Uo4
	wufAaw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppeK-00000008Kw0-3Mvj;
	Wed, 05 Mar 2025 14:23:04 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppb9-00000008KHZ-1Qh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:19:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5ADE4410F;
	Wed,  5 Mar 2025 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741184385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGHa73UrWTjwmuPsRwwRvgvwr91/An8UhMtuQjsToI0=;
	b=IOIhiSWOLlEWKpQS/KwLdJQVwH/QlI9ooRoMKQwKm0ynVeEAQev3tigTHRAaE+CKVOlUKV
	3a0hAhjMmkWCn7mXXyrTRHxH5maOnZBUzkufJUWx5SVs5HZmxr+IZeHc70oDlpyOTEY8ld
	/cSTuVykab7Iw1tiGXAOy3MsCHNYWBPW8E2X9yOOAUc7cP/fmpvvfurAp9zAMTizTAsZNt
	3mHB5iJ79dr5aOQrVrQHV/xjEYZBzfzs1wNz5CzPURx6eh9EYpHibB3J6GxbLNJse9g0h6
	Awdae6hnFWDBGg1vxTTXpQUiF3xEERNg0j2Y3pF7Sel1TROfoMdn4FATINoJig==
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
Subject: [PATCH net-next 3/7] net: ethtool: netlink: Introduce command-specific dump_one_dev
Date: Wed,  5 Mar 2025 15:19:33 +0100
Message-ID: <20250305141938.319282-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_061947_539364_747FF14D 
X-CRM114-Status: GOOD (  20.59  )
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

Prepare more generic ethnl DUMP hanldling, by allowing netlink commands
to register their own dump_one_dev() callback. This avoids having to
roll with a fully custom genl ->dumpit callback, allowing the re-use of some
ethnl plumbing.

Fallback to the default dump_one_dev behaviour when no custom callback
is found.

The command dump context is maintained within the ethnl_dump_ctx, that
we move in netlink.h so that command handlers can access it.

This context can be allocated/freed in new ->dump_start() and
->dump_done() callbacks.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 58 +++++++++++++++++++++++++------------------
 net/ethtool/netlink.h | 35 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 24 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 6dddaea2babb..c0215f4acc05 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -336,24 +336,6 @@ int ethnl_multicast(struct sk_buff *skb, struct net_device *dev)
 
 /* GET request helpers */
 
-/**
- * struct ethnl_dump_ctx - context structure for generic dumpit() callback
- * @ops:        request ops of currently processed message type
- * @req_info:   parsed request header of processed request
- * @reply_data: data needed to compose the reply
- * @pos_ifindex: saved iteration position - ifindex
- *
- * These parameters are kept in struct netlink_callback as context preserved
- * between iterations. They are initialized by ethnl_default_start() and used
- * in ethnl_default_dumpit() and ethnl_default_done().
- */
-struct ethnl_dump_ctx {
-	const struct ethnl_request_ops	*ops;
-	struct ethnl_req_info		*req_info;
-	struct ethnl_reply_data		*reply_data;
-	unsigned long			pos_ifindex;
-};
-
 static const struct ethnl_request_ops *
 ethnl_default_requests[__ETHTOOL_MSG_USER_CNT] = {
 	[ETHTOOL_MSG_STRSET_GET]	= &ethnl_strset_request_ops,
@@ -533,9 +515,9 @@ static int ethnl_default_doit(struct sk_buff *skb, struct genl_info *info)
 	return ret;
 }
 
-static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
-				      const struct ethnl_dump_ctx *ctx,
-				      const struct genl_info *info)
+static int ethnl_default_dump_one(struct sk_buff *skb,
+				  const struct ethnl_dump_ctx *ctx,
+				  const struct genl_info *info)
 {
 	void *ehdr;
 	int ret;
@@ -546,13 +528,13 @@ static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *de
 	if (!ehdr)
 		return -EMSGSIZE;
 
-	ethnl_init_reply_data(ctx->reply_data, ctx->ops, dev);
 	rtnl_lock();
 	ret = ctx->ops->prepare_data(ctx->req_info, ctx->reply_data, info);
 	rtnl_unlock();
 	if (ret < 0)
 		goto out;
-	ret = ethnl_fill_reply_header(skb, dev, ctx->ops->hdr_attr);
+	ret = ethnl_fill_reply_header(skb, ctx->reply_data->dev,
+				      ctx->ops->hdr_attr);
 	if (ret < 0)
 		goto out;
 	ret = ctx->ops->fill_reply(skb, ctx->req_info, ctx->reply_data);
@@ -560,11 +542,29 @@ static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *de
 out:
 	if (ctx->ops->cleanup_data)
 		ctx->ops->cleanup_data(ctx->reply_data);
-	ctx->reply_data->dev = NULL;
+
 	if (ret < 0)
 		genlmsg_cancel(skb, ehdr);
 	else
 		genlmsg_end(skb, ehdr);
+
+	return ret;
+}
+
+static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
+				      struct ethnl_dump_ctx *ctx,
+				      const struct genl_info *info)
+{
+	int ret;
+
+	ethnl_init_reply_data(ctx->reply_data, ctx->ops, dev);
+
+	if (ctx->ops->dump_one_dev)
+		ret = ctx->ops->dump_one_dev(skb, ctx, info);
+	else
+		ret = ethnl_default_dump_one(skb, ctx, info);
+
+	ctx->reply_data->dev = NULL;
 	return ret;
 }
 
@@ -593,6 +593,7 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 			dev_hold(dev);
 			rcu_read_unlock();
 
+			ctx->req_info->dev = dev;
 			ret = ethnl_default_dump_one_dev(skb, dev, ctx,
 							 genl_info_dump(cb));
 
@@ -655,6 +656,12 @@ static int ethnl_default_start(struct netlink_callback *cb)
 	ctx->reply_data = reply_data;
 	ctx->pos_ifindex = 0;
 
+	if (ctx->ops->dump_start) {
+		ret = ctx->ops->dump_start(ctx);
+		if (ret)
+			goto free_reply_data;
+	}
+
 	return 0;
 
 free_reply_data:
@@ -670,6 +677,9 @@ static int ethnl_default_done(struct netlink_callback *cb)
 {
 	struct ethnl_dump_ctx *ctx = ethnl_dump_context(cb);
 
+	if (ctx->ops->dump_done)
+		ctx->ops->dump_done(ctx);
+
 	kfree(ctx->reply_data);
 	kfree(ctx->req_info);
 
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index 4db27182741f..d7506b08e5d6 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -307,6 +307,26 @@ struct ethnl_reply_data {
 	struct net_device		*dev;
 };
 
+/**
+ * struct ethnl_dump_ctx - context structure for generic dumpit() callback
+ * @ops:        request ops of currently processed message type
+ * @req_info:   parsed request header of processed request
+ * @reply_data: data needed to compose the reply
+ * @pos_ifindex: saved iteration position - ifindex
+ * @cmd_ctx: command-specific context to maintain across the dump.
+ *
+ * These parameters are kept in struct netlink_callback as context preserved
+ * between iterations. They are initialized by ethnl_default_start() and used
+ * in ethnl_default_dumpit() and ethnl_default_done().
+ */
+struct ethnl_dump_ctx {
+	const struct ethnl_request_ops	*ops;
+	struct ethnl_req_info		*req_info;
+	struct ethnl_reply_data		*reply_data;
+	unsigned long			pos_ifindex;
+	void				*cmd_ctx;
+};
+
 int ethnl_ops_begin(struct net_device *dev);
 void ethnl_ops_complete(struct net_device *dev);
 
@@ -372,6 +392,15 @@ int ethnl_sock_priv_set(struct sk_buff *skb, struct net_device *dev, u32 portid,
  *	 - 0 if no configuration has changed
  *	 - 1 if configuration changed and notification should be generated
  *	 - negative errno on errors
+ * @dump_start:
+ *	Optional callback to prepare a dump operation, should there be a need
+ *	to maintain some context across the dump.
+ * @dump_one_dev;
+ *	Optional callback to generate all messages for a given netdev. This
+ *	is relevant only when a request can produce different results for the
+ *	same netdev depending on command-specific attributes.
+ * @dump_done:
+ *	Optional callback to cleanup any context allocated in ->dump_start()
  *
  * Description of variable parts of GET request handling when using the
  * unified infrastructure. When used, a pointer to an instance of this
@@ -408,6 +437,12 @@ struct ethnl_request_ops {
 			    struct genl_info *info);
 	int (*set)(struct ethnl_req_info *req_info,
 		   struct genl_info *info);
+
+	int (*dump_start)(struct ethnl_dump_ctx *ctx);
+	int (*dump_one_dev)(struct sk_buff *skb,
+			    struct ethnl_dump_ctx *ctx,
+			    const struct genl_info *info);
+	void (*dump_done)(struct ethnl_dump_ctx *ctx);
 };
 
 /* request handlers */
-- 
2.48.1


