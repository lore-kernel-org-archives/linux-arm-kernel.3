Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E23C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNmfKWXLdsLmg0P+nz3LlGUh4bvQptyAhlgGd24elxg=; b=EQ+3NGUld4Xwfe06+Ag7Dw271b
	MrjxadItl6NmCFX/ndF2HkDrYy88eY9tXbNR1i5woj3ttLVbh/OkqfWxmW7Cxsp1BpDdBV69PJ+z9
	W6rUZNAo1RRWrZp8N/fSLjjwd9OPobFCAKpoj9pG9a9BLQL6VtU21woI34OvHMOzttcLCtNUSnmON
	Ue2NLkcwGBBGIASmjjgcSKsuiPheQ0TtBLR5WOx9FZIJHb15H25HF1/cLRhVFufetTYitrymi18AT
	wUA49LcRyUqvVW/R7gZO3XXWLzspXwCp5qsJLuGEf4LdU+PnCgECzvdKaosOk065ZGsGL6coGhw47
	Mpk0C+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IQy-00000008AnD-39xh;
	Tue, 22 Apr 2025 18:33:28 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GJK-00000007rzz-0roa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:17:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF95C1FD45;
	Tue, 22 Apr 2025 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745338644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNmfKWXLdsLmg0P+nz3LlGUh4bvQptyAhlgGd24elxg=;
	b=Lu1vzrV+WjeG/cG/kW3OgBU37GuYW2ZdU+JwxGG1l97/cH4s9bUfwvM5BjzXpU8PbTBq9M
	dhjEaiFgNLJkmaHstTHzPfDSUlYFFFZhzYbsaa7EzssP7PcvdRbT3sgOQAuKBjx5c0YCk4
	Mk+BJswp+7tzgxW2BYop89k6tTUv7HXH0v5S3yAl1MKWn3mOywqgzWGgXB4KqdtTcHJm/v
	TDzVaYcpY8cVLWGkZDxe3bnhZ9QeEPTdJ9KQ2IJ/V+cnR3MAkZFUcKbWeBTCMqidRmUucy
	KOjFMUTP9CHe/pNNxRlQmzJaulprYn2puo9nhExvuo4CRgb55QVuUabtFtH9YA==
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
Subject: [PATCH net-next v7 3/3] net: ethtool: netlink: Use netdev_hold for dumpit() operations
Date: Tue, 22 Apr 2025 18:17:16 +0200
Message-ID: <20250422161717.164440-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
References: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_091726_394683_19DB1314 
X-CRM114-Status: GOOD (  10.96  )
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

Move away from dev_hold and use netdev_hold with a local reftracker when
performing a DUMP on each netdev.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 8ccc6957295d..9f08e9d9ed21 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -601,18 +601,19 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 {
 	struct ethnl_dump_ctx *ctx = ethnl_dump_context(cb);
 	struct net *net = sock_net(skb->sk);
+	netdevice_tracker dev_tracker;
 	struct net_device *dev;
 	int ret = 0;
 
 	rcu_read_lock();
 	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
-		dev_hold(dev);
+		netdev_hold(dev, &dev_tracker, GFP_ATOMIC);
 		rcu_read_unlock();
 
 		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
 
 		rcu_read_lock();
-		dev_put(dev);
+		netdev_put(dev, &dev_tracker);
 
 		if (ret < 0 && ret != -EOPNOTSUPP) {
 			if (likely(skb->len))
-- 
2.49.0


