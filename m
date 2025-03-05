Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSOYBw/5jkwuslYtI7ZM9ppsbctGLWTWVfGhnv8zcfI=; b=Do8E6x6wGmh/XDQzFOiL6kdUkK
	CNyzqH3H9hg4odRUjvpSHXt3xvCZyVhWiOSj4uw4k6rwUwA7YqM09cAIMRdQGBIhUmEkIbwPBsblt
	IX9hbceyde3hGY0JwAHzORfwH2vfk9QzmSMUKKF7n/6z3/SJMGt8TTXtheXsLCpthWEGILMC/n7DN
	xo/Gd6VS2G3+4C0+4Itrj3PcObOlJEAomcf256N7sLUUG5mnCkOJzYsuXt2U4SdWmZ1YF/UgcDXE7
	doezlh8tMjStf7xBmrG42VdS4L1+iUUHXTBplCCcy24AtmZS92TfxuT71UvJlnsayI5Nn/dG7eTnD
	Z+f8t2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppj2-00000008Lcv-23zL;
	Wed, 05 Mar 2025 14:27:56 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppbA-00000008KGv-037U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:19:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D61434411E;
	Wed,  5 Mar 2025 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741184384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSOYBw/5jkwuslYtI7ZM9ppsbctGLWTWVfGhnv8zcfI=;
	b=CNpRq1d/cuzV9UnWGhB+RaDXUSGmm9HAq663efZaVsTdaNmMDT1+YAzBf22ETP/VsRZ5J7
	5nXR+yn9v8wDezHRD9xmPiw9drZAJwb+A9IAcW90X6NKm34MpP0uq/FTcFw1zYmLTjiwEx
	G79sGNOi+vOLTl99j5HS1jKDtKxaXvI2ARMZUbIX6e9iTolYExJJQMcwhAqfMLtmOF9Rw7
	UXdKuxF/oOaJMnYXwhzq/eLezyG1oID53j3fA+ujwOcaC+Nqj2xS4AThoWz3xAnSLr8rOZ
	MF/e5rBg6HiL4yjfGZzgg9k2O7TEN9TQ5cAFY1ro3TjDrAZAurajff1UhGBavA==
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
Subject: [PATCH net-next 2/7] net: ethtool: netlink: Rename ethnl_default_dump_one
Date: Wed,  5 Mar 2025 15:19:32 +0100
Message-ID: <20250305141938.319282-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_061948_196555_240AEF03 
X-CRM114-Status: GOOD (  11.05  )
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
 net/ethtool/netlink.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 0815b28ba32f..6dddaea2babb 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -533,9 +533,9 @@ static int ethnl_default_doit(struct sk_buff *skb, struct genl_info *info)
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
@@ -593,8 +593,8 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
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


