Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4Vt/+sE9uq1aYjpbMx/58Ei8i4J79Zx7ZN6MMUPbsc=; b=mi0zpMw/qkLmXNTe2klN4m2wir
	892USE/xOX4GY09RhIlemNsbINOsOSyFn14DarT0GWDRhwjCI83oNVOAzqJKiXVqRxn6dJ+jJSJ7u
	HYZ0Cyr82hmFKhHFp7swLxGb92U23n1Ngz/wCAqKUtbasJFuM5BUucj5tAUMMCPlpVM0MgPPwyUIL
	wBZnH9EU26XEAfFB/tpKZoGHKZtBb9oqYa3BybYc6I1PpSeC4Itg9V6QLITdmJ8d16pp5fUYAZopZ
	TJ67UHhpKfze0xlev9MDiiqyNE2PlUhpVX/eXGmWvu21p1qX4JSN8HbBdVhS46PXeulkW6C2QD+Eq
	18It6gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqkh-00000008WvR-1qiw;
	Wed, 05 Mar 2025 15:33:43 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppb9-00000008KGm-0Y7s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:19:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B724D44110;
	Wed,  5 Mar 2025 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741184383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4Vt/+sE9uq1aYjpbMx/58Ei8i4J79Zx7ZN6MMUPbsc=;
	b=G4k4yM9ttZ1iCsFOil5MiRmHa+ABS8VQg8xqJL5FlX9vz94dEpz99jUqSUYRMfIrNKAxVz
	7mlAh06hqjgSEiIrXbXQK6WKS/LpC4K67pFFXTkpcUmSLt7qamYHn9CdoswfUX+Uny1RLm
	H9RhMj3OooeLwlTelbQCGHnb/Zk/z6wkhs09xyEskdHF6BSZ6VRbefvh9liJ41B/92VqFI
	1H8OPP49pPX6iKbyBiegf76eA6y6nNN7hvuKrZCvfp7j6Nj3s/OMTcrBjuT1UxDLjRkDge
	7A2N6aW9bvZlF2mULovljGK1Xl8rKp79x3Fx1Y0kU+1fMQKImZitqJHfBjxQ4g==
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
Subject: [PATCH net-next 1/7] net: ethtool: netlink: Allow per-netdevice DUMP operations
Date: Wed,  5 Mar 2025 15:19:31 +0100
Message-ID: <20250305141938.319282-2-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250305_061947_310510_3FB2C0AC 
X-CRM114-Status: GOOD (  16.31  )
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

We have a number of netlink commands in the ethnl family that may have
multiple objects to dump even for a single net_device, including :

 - PLCA, PSE-PD, phy: one message per PHY device
 - tsinfo: one message per timestamp source (netdev + phys)
 - rss: One per RSS context

To get this behaviour, these netlink commands need to roll a custom
->dumpit().

To prepare making per-netdev DUMP more generic in ethnl, introduce a
member in the ethnl ops to indicate if a given command may allow
pernetdev DUMPs (also referred to as filtered DUMPs).

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 45 ++++++++++++++++++++++++++++---------------
 net/ethtool/netlink.h |  1 +
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 734849a57369..0815b28ba32f 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -578,21 +578,34 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 	int ret = 0;
 
 	rcu_read_lock();
-	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
-		dev_hold(dev);
+	if (ctx->req_info->dev) {
+		dev = ctx->req_info->dev;
 		rcu_read_unlock();
-
-		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
-
+		/* Filtered DUMP request targeted to a single netdev. We already
+		 * hold a ref to the netdev from ->start()
+		 */
+		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
+						 genl_info_dump(cb));
 		rcu_read_lock();
-		dev_put(dev);
-
-		if (ret < 0 && ret != -EOPNOTSUPP) {
-			if (likely(skb->len))
-				ret = skb->len;
-			break;
+		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
+	} else {
+		for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
+			dev_hold(dev);
+			rcu_read_unlock();
+
+			ret = ethnl_default_dump_one(skb, dev, ctx,
+						     genl_info_dump(cb));
+
+			rcu_read_lock();
+			dev_put(dev);
+
+			if (ret < 0 && ret != -EOPNOTSUPP) {
+				if (likely(skb->len))
+					ret = skb->len;
+				break;
+			}
+			ret = 0;
 		}
-		ret = 0;
 	}
 	rcu_read_unlock();
 
@@ -626,10 +639,10 @@ static int ethnl_default_start(struct netlink_callback *cb)
 	}
 
 	ret = ethnl_default_parse(req_info, &info->info, ops, false);
-	if (req_info->dev) {
-		/* We ignore device specification in dump requests but as the
-		 * same parser as for non-dump (doit) requests is used, it
-		 * would take reference to the device if it finds one
+	if (req_info->dev && !ops->allow_pernetdev_dump) {
+		/* We ignore device specification in unfiltered dump requests
+		 * but as the same parser as for non-dump (doit) requests is
+		 * used, it would take reference to the device if it finds one
 		 */
 		netdev_put(req_info->dev, &req_info->dev_tracker);
 		req_info->dev = NULL;
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index ec6ab5443a6f..4db27182741f 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -388,6 +388,7 @@ struct ethnl_request_ops {
 	unsigned int		req_info_size;
 	unsigned int		reply_data_size;
 	bool			allow_nodev_do;
+	bool			allow_pernetdev_dump;
 	u8			set_ntf_cmd;
 
 	int (*parse_request)(struct ethnl_req_info *req_info,
-- 
2.48.1


