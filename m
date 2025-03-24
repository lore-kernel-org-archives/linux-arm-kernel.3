Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC657C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJY5QtUZ+l2cU5lE2ea9Uk5hUsgrVL+Y7Y03zrA9ueA=; b=rsGiBBr/5TYLQps/a25tc0O5zw
	HON9FrRD2IMaqKC+FXHh767GYCc+KND8+1J+tF+JqEp6/B8E231u0MaA58Vs5GL7t3Ay57d6giSt4
	m7jwgpRHTJzvZI++KgDJMjuWZgqr+wL8eVxMPFaS+Ko4EVLR9p5JfAfz4AsRn5ShqEKjRBZp9JpKM
	DEhyo/Qz1GS2RraYI421qU4M2MYaGK5Jqt3BJ8z/xkZvsrM3zJcx8PfIenPME9u0ygY9QZF1vNHFO
	wFPZ7thtETRPsreyPbg8OEEr/ioRJjyWWQDX9qg8grbJQQOQ20wR6C369X8XbTya0VcZQCXjZdvt0
	nW2SBOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfHd-00000002rcS-2xCk;
	Mon, 24 Mar 2025 10:43:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfEC-00000002qv4-10tO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:40:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FE4442EF2;
	Mon, 24 Mar 2025 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742812817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJY5QtUZ+l2cU5lE2ea9Uk5hUsgrVL+Y7Y03zrA9ueA=;
	b=NyEkAL62b/yB+iGr7Fo1IVLInyf/nO7bw2lc8JsZPxUCCfG8KP9pcnKLE2aPPxDeLblb+f
	I7fvBwXd6zvCmVLRj7HmodZ8kP6cQ9FIk+XCP+sMtRcLc10YuCcha0jj6Bw+hGPlsnOhie
	JTEA56wL5BUKZd2+ZKKqGj8VEd3PrAo+DJ0sR1MWQxfTOHBMVeBFExpGCPcFnwb+ju5pcw
	fqJJgQ0R7czGf4aheXVJERQtJezY760nvxThNrydz0JUjcZSbrWygwwtoNrF9sR0vl4geH
	HZiHBPUR/5ej57fBNRB+kp8RChjRCusbpfrJ0MIUDQlHC74PYb0Ifb7NCdvf0Q==
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
Subject: [PATCH net-next v4 1/8] net: ethtool: Set the req_info->dev on DUMP requests for each dev
Date: Mon, 24 Mar 2025 11:40:03 +0100
Message-ID: <20250324104012.367366-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeehvdgrfeemjegsledumeduhegtleemtgeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemhedvrgefmeejsgeludemudehtgelmegtledtiedphhgvlhhopeguvghvihgtvgdqvdegrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvu
 ghumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_034020_408289_13E367B3 
X-CRM114-Status: GOOD (  12.91  )
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

There are a few netlink commands that rely on the req_info->dev field
being populated by ethnl in their ->prepare_data() and ->fill_reply().

For a regular GET request, this will be set by ethnl_default_parse(),
which calls ethnl_parse_header_dev_get().

In the case of a DUMP request, the ->prepare_data() and ->fill_reply()
callbacks will be called with the req_info->dev being NULL, which can
cause discrepancies in the behaviour between GET and DUMP results.

The main impact is that ethnl_req_get_phydev() will not find any
phy_device, impacting :
 - plca
 - pse-pd
 - stats

Some other commands rely on req_info->dev, namely :
 - coalesce in ->fill_reply to look for an irq_moder

Although cable_test and tunnels also rely on req_info->dev being set,
that's not a problem for these commands as :
 - cable_test doesn't support DUMP
 - tunnels rolls its own ->dumpit (and sets dev in the req_info).
 - phy also has its own ->dumpit

All other commands use reply_data->dev (probably the correct way of
doing things) and aren't facing this issue.

Simply set the dev in the req_info context when iterating to dump each
dev.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4 : New patch (was sent separaltely once)

 net/ethtool/netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index a163d40c6431..6b1725795435 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -591,6 +591,7 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 		dev_hold(dev);
 		rcu_read_unlock();
 
+		ctx->req_info->dev = dev;
 		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
 
 		rcu_read_lock();
-- 
2.48.1


