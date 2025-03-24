Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A6BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyN/yr+VxFDRia4MxGLEfv2GDAM0+bfrn4ubPet1vcI=; b=ftnrkC8Yw9djtCeBbR8EEYUY9a
	wdqKMJ/MWmBrqbegrM7Jzwkt3h6sPzi5tHrJV0JUDihteV4RViNOK82feRwcoGVriEf2pucuzBlTn
	+kvOtpf5Jh69jkIAUGK9EF0MN888Q6ZxpionL9W45Y6lbXPtLIny/F51FASoYLfHB78x4DYZ5hs72
	Or/YtGJJc59/5hRF/wpyQDjBosCkIN91FDg+3+bWaF+Gw83Ucxr5VZSxrlZVtpZtTV4qjkTr+zOpg
	Yq14uWUALx/AcsnLdSJ7L0w9cil9mNyF8dnw4XI57vyP/a0aAP8faNRS8F3mWXqmwIOzbAvcPyQQz
	+VX1Ainw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfJM-00000002rqy-1s3B;
	Mon, 24 Mar 2025 10:45:40 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfED-00000002qw3-3m0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:40:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C128432F7;
	Mon, 24 Mar 2025 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742812820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyN/yr+VxFDRia4MxGLEfv2GDAM0+bfrn4ubPet1vcI=;
	b=ESoY48MPAwHmfg5RIBadmjiqRaM3b0n7moTN23eMagl01jlLpw7kOfiDn1GPqnta8Ignuu
	LbUWMrgMa7xySAY8LRVhL0bUNL356jrxlYkK5jGg1LPyQ8XqXwLAT2m4MzkbVjcj6H1X1s
	Lxd9CxVLJ6XgFIO/6sxvTcHjjg7gF7V7zOv7RB3d5PEpSwrnz5TrBkq6HR4gQrGfivhZRp
	akTSCUkg5Cr4nLuTR/vSoR1m3Aivv55Un9Y+4rN4Xu2ix9TAt/KJJctLmjF9MKI5QxZfU9
	M3pN3LsuVrzbc83L2RX0FMv8E1G+quj8Ui1Wv7zIY8yVBInB6kRk37SUsq0J4A==
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
Subject: [PATCH net-next v4 2/8] net: ethtool: netlink: Allow per-netdevice DUMP operations
Date: Mon, 24 Mar 2025 11:40:04 +0100
Message-ID: <20250324104012.367366-3-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250324_034022_090628_E0862516 
X-CRM114-Status: GOOD (  17.55  )
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
V4: - Don't hold RCU in the filtered path
    - Move dump_all into a new separate helper

 net/ethtool/netlink.c | 37 ++++++++++++++++++++++++++++++-------
 net/ethtool/netlink.h |  2 ++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 6b1725795435..31ab89ca0bcc 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -577,9 +577,7 @@ static int ethnl_default_dump_one(struct sk_buff *skb, struct net_device *dev,
 	return ret;
 }
 
-/* Default ->dumpit() handler for GET requests. */
-static int ethnl_default_dumpit(struct sk_buff *skb,
-				struct netlink_callback *cb)
+static int ethnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct ethnl_dump_ctx *ctx = ethnl_dump_context(cb);
 	struct net *net = sock_net(skb->sk);
@@ -609,6 +607,31 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
 	return ret;
 }
 
+/* Default ->dumpit() handler for GET requests. */
+static int ethnl_default_dumpit(struct sk_buff *skb,
+				struct netlink_callback *cb)
+{
+	struct ethnl_dump_ctx *ctx = ethnl_dump_context(cb);
+	int ret;
+
+	if (ctx->req_info->dev) {
+		/* Filtered DUMP request targeted to a single netdev. We already
+		 * hold a ref to the netdev from ->start()
+		 */
+		ret = ethnl_default_dump_one(skb, ctx->req_info->dev, ctx,
+					     genl_info_dump(cb));
+		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
+
+		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
+			ret = skb->len;
+
+	} else {
+		ret = ethnl_dump_all(skb, cb);
+	}
+
+	return ret;
+}
+
 /* generic ->start() handler for GET requests */
 static int ethnl_default_start(struct netlink_callback *cb)
 {
@@ -636,10 +659,10 @@ static int ethnl_default_start(struct netlink_callback *cb)
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
index ec6ab5443a6f..4aaa73282d6a 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -331,6 +331,7 @@ int ethnl_sock_priv_set(struct sk_buff *skb, struct net_device *dev, u32 portid,
  * @req_info_size:    size of request info
  * @reply_data_size:  size of reply data
  * @allow_nodev_do:   allow non-dump request with no device identification
+ * @allow_pernetdev_dump: allow filtering dump requests with ifname/ifindex
  * @set_ntf_cmd:      notification to generate on changes (SET)
  * @parse_request:
  *	Parse request except common header (struct ethnl_req_info). Common
@@ -388,6 +389,7 @@ struct ethnl_request_ops {
 	unsigned int		req_info_size;
 	unsigned int		reply_data_size;
 	bool			allow_nodev_do;
+	bool			allow_pernetdev_dump;
 	u8			set_ntf_cmd;
 
 	int (*parse_request)(struct ethnl_req_info *req_info,
-- 
2.48.1


