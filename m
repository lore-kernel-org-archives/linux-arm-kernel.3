Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF4EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bynjWbNkBctQ6Jxc04916fgsV3PBTm6dOdvJ+TUtb28=; b=pdRrbdMrC3AU9O9lJssMRHO/8o
	h/yy25eZt+US6hqoBa5ptRfzaDpMCcOFYJZGfxzgRqM2zEmDGxfpA1Pp7ZADwY6DUJ8bX+brUrRoU
	MSjPNVr97nZ8TbBp1NitdlFtiBlvTa+6JZ+5+Xkcbqi12LlUkeOx544a6RCzbZVSJEfprLqbTm6+r
	hESLeV9ilqGyk27iXHQV0OvvGivUG7nweu1PtVdCWT1T6lu8tzkqeQnBIqNbR+qlBkeRAJ7Yt2Ayy
	4GYRm7S6QNuwEHZMBbaKTya/dK+K2/qKtaKE4enV2Qb3v0oZUqBOD8vsXv2UR1G0eF1U96d85AtfB
	EPQ2esTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfL4-00000002s2T-0okd;
	Mon, 24 Mar 2025 10:47:26 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfEF-00000002qwX-16CZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:40:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A56114331A;
	Mon, 24 Mar 2025 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742812821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bynjWbNkBctQ6Jxc04916fgsV3PBTm6dOdvJ+TUtb28=;
	b=Y2dv5YKTqVI8LdnEynEEO/37DPTOzkNLhbj+/4oIPs9LaP6Iq2pM3IaIJcKxO8JIzlaO2F
	hA+FdvuGywcj37YQEnc47Bn2xT2dX8zw8iefuQDj3xqpVnxN7YQvB/cdz5y8E8Wnluc/jk
	5h2E6f7dbPlbe9EnUco/DpmzjCkznAy5fElySBksLNSWfCMFE1kXPrUkBe0zr7Y9oyXZQg
	aEREUI6+3cGao3DRqjU0jdV0LfCKwnxPO1IzoWiiAVzBPwgJKVqG2CaHkhz4x3LZ7kfiDj
	ey1REc7JthamfCvzaAmJUdOmamCrA1akbv9gEhrlLzJmuKbEVrDkNox3UPC7xQ==
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
Subject: [PATCH net-next v4 3/8] net: ethtool: netlink: Rename ethnl_default_dump_one
Date: Mon, 24 Mar 2025 11:40:05 +0100
Message-ID: <20250324104012.367366-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeehvdgrfeemjegsledumeduhegtleemtgeltdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemhedvrgefmeejsgeludemudehtgelmegtledtiedphhgvlhhopeguvghvihgtvgdqvdegrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvu
 ghumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_034023_428993_4B1602A4 
X-CRM114-Status: GOOD (  11.66  )
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

As we work on getting more objects out of a per-netdev DUMP, rename
ethnl_default_dump_one() into ethnl_default_dump_one_dev(), making it
explicit that this dumps everything for one netdev.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4 : No changes

 net/ethtool/netlink.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 31ab89ca0bcc..63ede3638708 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -540,9 +540,9 @@ static int ethnl_default_doit(struct sk_buff *skb, struct genl_info *info)
 	return ret;
 }
 
-static int ethnl_default_dump_one(struct sk_buff *skb, struct net_device *dev,
-				  const struct ethnl_dump_ctx *ctx,
-				  const struct genl_info *info)
+static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
+				      const struct ethnl_dump_ctx *ctx,
+				      const struct genl_info *info)
 {
 	void *ehdr;
 	int ret;
@@ -590,7 +590,8 @@ static int ethnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
 		rcu_read_unlock();
 
 		ctx->req_info->dev = dev;
-		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
+		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
+						 genl_info_dump(cb));
 
 		rcu_read_lock();
 		dev_put(dev);
@@ -618,8 +619,8 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 		/* Filtered DUMP request targeted to a single netdev. We already
 		 * hold a ref to the netdev from ->start()
 		 */
-		ret = ethnl_default_dump_one(skb, ctx->req_info->dev, ctx,
-					     genl_info_dump(cb));
+		ret = ethnl_default_dump_one_dev(skb, ctx->req_info->dev, ctx,
+						 genl_info_dump(cb));
 		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
 
 		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
-- 
2.48.1


