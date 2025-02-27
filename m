Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0E1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbCH8LuhMXgUlCeD9Wl9UKbqWQuv1zcU/Fe3CugVy0k=; b=whHUsnkiDjuMwWYxaNFt78EAI9
	jyOhe7N3bhTqyQ5v+/aCdInph2RI9Ns21pPdJavgSZECK58a5zwk9DZ6RHxP5anuK0Wk/1/ezquj/
	HtBF3+nJUT7hF8iWmLQdOQmDFg4K1MAUfO1kHKRfo9aK8ifEdgBU+dcPa5dGcOuYI+NZWbHgjCgCF
	667X/F5PkuCE9nSWswy9rWRsQjQwZ09E/LN3k11JtFwJs0Q9Q+NhrrX0I6KHXWpNHDsVwy/DG8vl3
	As9G60f2/x92Oz1RScG0RWLlNkssO8R6DMtrtyg9JeAZjuoEKXL6jDwWM5CBXugf/4KlicdzPRWvG
	wURhbqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmE-00000008d3r-09fE;
	Thu, 27 Feb 2025 19:42:34 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniZD-00000008Jsy-22a1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:25:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3349443B9;
	Thu, 27 Feb 2025 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740680700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbCH8LuhMXgUlCeD9Wl9UKbqWQuv1zcU/Fe3CugVy0k=;
	b=VlQWuXsIWTisQisKY3jiDM8hLEsOTkzTJgiNbC7wy+kc+iMnH7uIZOzBXL/ELc1IlBSjSx
	lpCR8aYeHu2vwf2ceCnMVUHxFEZWhg3CG9OpHIqbcQjgqg+MLnaKEnJTV/PWt+cymW7Je2
	20XBlIECw5G2tqU5TmTR7wJ5OrRRi37D8DESSiGJfLblut3Z3Wjid+27boMfBmIOoTBLya
	GNoIqB4suq/tTkurVuYHffc01R3sO1NtpNzse4YX/zEzyXbDq1/B/6dizJFM/nQfoon+mG
	ZliDdf/kSlYFSgU8SsW0rT1clgPX03bd0fYxPmOYTtt6Hg3daFcnjcn2f6Km0A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: [PATCH net 2/2] net: ethtool: netlink: Pass a context for default ethnl notifications
Date: Thu, 27 Feb 2025 19:24:52 +0100
Message-ID: <20250227182454.1998236-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgri
 igvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_102503_834060_52898EDF 
X-CRM114-Status: GOOD (  18.15  )
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

In some situations, it's useful to get some context passed to ethnl
notifications, especially when we perform a ->set followed by
ethtool_notify().

One such case is when the ->set targets a specific PHY device. The
phy_index of the PHY may be coming from the request header, and we want
the followup notification to be specific to the phydev we just
accessed.

This commit leverages the const void *data pointer that's passed to
ethtool netlink notifications.

In our case, and only for default ethnl ops, lets use that void* pointer
to pass a context. The context is filled in the ->set request path, and
used in ethnl_default_notify() to populate the req_info with context
information.

For now, the only thing we pass in the context is the phy_index of the
->set request.

The only relevant user for now is PLCA, and it very likely that we never
ended-up in a situation where the follow-up notif wasn't targeting the
correct PHY as :

 - This was broken due to the tb[] array being NULL for notifs
 - There's no upstream-supported scenario (as of today) where we have 2
   PHYs that can do PLCA (a BaseT1 feature) on the same netdev.

Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some commands")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/netlink.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 734849a57369..6691a8f73bfd 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -663,8 +663,17 @@ static int ethnl_default_done(struct netlink_callback *cb)
 	return 0;
 }
 
+/* Structure to store context information between a ->set request and the
+ * follow-up notification. Used only for the ethnl_default ops.
+ * @phy_index: If the original ->set request had a PHY index, store it in ctx.
+ */
+struct ethnl_default_notify_ctx {
+	u32 phy_index;
+};
+
 static int ethnl_default_set_doit(struct sk_buff *skb, struct genl_info *info)
 {
+	struct ethnl_default_notify_ctx ctx = {0};
 	const struct ethnl_request_ops *ops;
 	struct ethnl_req_info req_info = {};
 	const u8 cmd = info->genlhdr->cmd;
@@ -691,6 +700,7 @@ static int ethnl_default_set_doit(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev = req_info.dev;
+	ctx.phy_index = req_info.phy_index;
 
 	rtnl_lock();
 	dev->cfg_pending = kmemdup(dev->cfg, sizeof(*dev->cfg),
@@ -711,7 +721,7 @@ static int ethnl_default_set_doit(struct sk_buff *skb, struct genl_info *info)
 	swap(dev->cfg, dev->cfg_pending);
 	if (!ret)
 		goto out_ops;
-	ethtool_notify(dev, ops->set_ntf_cmd, NULL);
+	ethtool_notify(dev, ops->set_ntf_cmd, &ctx);
 
 	ret = 0;
 out_ops:
@@ -749,6 +759,7 @@ ethnl_default_notify_ops[ETHTOOL_MSG_KERNEL_MAX + 1] = {
 static void ethnl_default_notify(struct net_device *dev, unsigned int cmd,
 				 const void *data)
 {
+	const struct ethnl_default_notify_ctx *ctx = data;
 	struct ethnl_reply_data *reply_data;
 	const struct ethnl_request_ops *ops;
 	struct ethnl_req_info *req_info;
@@ -776,6 +787,8 @@ static void ethnl_default_notify(struct net_device *dev, unsigned int cmd,
 
 	req_info->dev = dev;
 	req_info->flags |= ETHTOOL_FLAG_COMPACT_BITSETS;
+	if (ctx)
+		req_info->phy_index = ctx->phy_index;
 
 	ethnl_init_reply_data(reply_data, ops, dev);
 	ret = ops->prepare_data(req_info, reply_data, &info);
-- 
2.48.1


