Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E82C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/CgfC9bQQMQo7QYZcvRHcVFZ3LoI/EHR6DAT/jK644=; b=mLK0yRJndYdEbYO/uEcAgZUSQK
	NgwlAFgtNhuARzIEUrnDH8akRyCfRNz7tpwI4kHe+M3C2ssPMTzPM4DygAAGC5LNopZVXWiu6hTY0
	HsZRhxFYlgWDPNcVF8mhQhVGbqNwHZskwIzIKXVXexfuxXszwypyYILRCqzOyau4iJa4wEhMMUmxq
	eH1BRgl1lOdzh96rWTPw1CXvZ6KCRTzSaoVDc5x9NzGmYo8B3Ah1rTaLkhq/RjDG6vMZjNQxeIuqm
	Y2+p4deV9PgUcAsev4xJo9MGtTbOPE0W/sTM4OGajfnolVj080zenHx7tOlbyeautqILRoy/mteKg
	aIMg5/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwgI-0000000Gq2V-2C49;
	Sat, 08 Mar 2025 16:05:42 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwVm-0000000Gohm-3HbO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:54:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 473A8204CC;
	Sat,  8 Mar 2025 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741449287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/CgfC9bQQMQo7QYZcvRHcVFZ3LoI/EHR6DAT/jK644=;
	b=CKsLYps19CeEEQQCP47KdAvj2eK2Q90syFYkMMqrmOTO2ATe3GnEROyI8MkN8rE/UYP9G1
	wxS2u1MDLXgNly56PP6deBJr6zGKqyvOsxaNbtzaraa/vH3exxbS/IrYBwA/ztKZ8RpK+N
	lHloe7NzOJR0IPTDxRG+5S/gqIqpQ5Rxv/xgNQ2Q3MnBKdKGJ6yuBK4Ydt/+hxhWct4/xN
	0IkOVUUmQkhkl+vjVQQUljkoZ36UZfE6DaLfl0INx9Fn4tVhq5PxYBBqX0QZlsw9pceLor
	Ld9eX17446V4rP8SuG8GMs+VeNTU31VhICb1XEvTJvErDiZl9ID6Tx9RAlqugQ==
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
Subject: [PATCH net-next v2 2/7] net: ethtool: netlink: Rename ethnl_default_dump_one
Date: Sat,  8 Mar 2025 16:54:34 +0100
Message-ID: <20250308155440.267782-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudehudevhedvvdevkeetleeigeejtddvkeejueffieevudfgvdekjeelffetvdehnecuffhomhgrihhnpehishhsuhgvrdhnvghtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_075450_966051_659B47AE 
X-CRM114-Status: GOOD (  10.01  )
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
V2: Rebase, Fix whitespace issue.

 net/ethtool/netlink.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 11e4122b7707..f391a11242de 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -539,9 +539,9 @@ static int ethnl_default_doit(struct sk_buff *skb, struct genl_info *info)
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
@@ -592,8 +592,8 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 		/* Filtered DUMP request targeted to a single netdev. We already
 		 * hold a ref to the netdev from ->start()
 		 */
-		ret = ethnl_default_dump_one(skb, dev, ctx,
-					     genl_info_dump(cb));
+		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
+						 genl_info_dump(cb));
 		rcu_read_lock();
 		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
 	} else {
@@ -601,8 +601,8 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 			dev_hold(dev);
 			rcu_read_unlock();
 
-			ret = ethnl_default_dump_one(skb, dev, ctx,
-						     genl_info_dump(cb));
+			ret = ethnl_default_dump_one_dev(skb, dev, ctx,
+							 genl_info_dump(cb));
 
 			rcu_read_lock();
 			dev_put(dev);
-- 
2.48.1


