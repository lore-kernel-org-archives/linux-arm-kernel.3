Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C263BC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn4OugAZ7sAo/dzL+u9hij9jwFPOnyywvCizSecmfL0=; b=sWzl74lolCGa6XxLKRZgFC/Dpl
	TuU0tq01NCOmyyuYKpnqxb8qyIUJEFPVAwSaZAtq+XWHrSQs1XiQyjPsEV/19nM8T51TmzdYifoqG
	xqIy3Qc5hnZGxjOQELxcThiVFDF8Hre2h1gCCCsoEwTEcBEB5H39YWTIMy0VcUk9Rfb8FozuQrOr9
	d5qyv/Dkw/VfHS3t+aWTaiz62QQusCP2tQ4g3BoWzFODgtAHNWLqQiewTWDr55DpBnPH6NWjb/XKA
	meHREHvl63qHfwiofYsEkZ/58xY4gYdY4EgRz3NO/fDc38NzjD/yj2x64kYmcAxSoayEG6zIfu2Fu
	26mqfP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmHL-00000001GyI-3IbI;
	Fri, 02 May 2025 09:01:55 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm8a-00000001F2F-3nHF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:52:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A41DA43219;
	Fri,  2 May 2025 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746175969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cn4OugAZ7sAo/dzL+u9hij9jwFPOnyywvCizSecmfL0=;
	b=AhjploZqcduQNEHAxIZ8rebFZhz2/YoGHABnqy4nz8tsjScYG+JcAOqAUr7e3M2r7/yjmY
	MjEB0QAJt8WnCvByRi8OKp92GoOe+2G6ZBWp7i4h4Ky1zwRLAu1BmWbfgYjz3G6LR/XA2Q
	qi/0ZyB5/xahc6a5ukOJnA4JJfNmNMrZx4Mj8PD2W4TKPPEqw52dXtfi8k4TA9kZSw/zXD
	1rn3z4/5gh1PV6+uNkKlvbwFC6ZozCKJR0vXlm0ErlPfOgwgWRw8lG8s6M8zX1gwGBgwFZ
	ngr00Ig/zetJ1U5i/NduJwLbL1Mm1bL30aP46+iMr/oFg1N0o3GoFPT5KF9Pjw==
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
Subject: [PATCH net-next v8 3/3] net: ethtool: netlink: Use netdev_hold for dumpit() operations
Date: Fri,  2 May 2025 10:52:41 +0200
Message-ID: <20250502085242.248645-4-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250502_015253_097965_08DF0CA5 
X-CRM114-Status: GOOD (  11.16  )
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
index c8ed5a6f1e92..9de828df46cd 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -603,18 +603,19 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
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


