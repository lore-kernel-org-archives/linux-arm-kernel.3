Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5EAC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFvrnBRSvdhgzn2vQzbKBQ8kFQcjj0Zp4PCnrL3E5wc=; b=xbTUWJj2pnSFulTtrUJmW12WAh
	kkWmxbWkNgtvENFfTzMXJ13KwHnOHGXaEv1P0sRK3obLBW9okzLiOazAHJ1Zpju75ra3Bkf492Hbp
	rPFJPpdmZMuLKLGok/nuOvuFUfJuCoZ2lxPeoRPYIn0KHIptOIaU89zqBAPPtrEqJY5DpWET6newc
	gF/u/lQJWC/nZdbGiTBdU9qgcrXnsGM4w1kAeAE/JtH3N06td90mr7EqdJWlny5luPsMfMsGyYj6E
	OgCyWzEWGr53H+ERQWxI2UBZnaKpva7hpb8DjxI4+xanal/o2Y1hITrij9D/WV5mNJ78bf+PBQFIh
	ZnAVhLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfTb-00000002tAS-2frA;
	Mon, 24 Mar 2025 10:56:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfEM-00000002qzi-175M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:40:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1E49432FD;
	Mon, 24 Mar 2025 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742812828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFvrnBRSvdhgzn2vQzbKBQ8kFQcjj0Zp4PCnrL3E5wc=;
	b=L6qI3QDxwz3/yvShHrOw2xKvE532sXFABNxbj8UcCbP3VwI6Ep/kqm4RfDsntHFY3xK8pG
	F72ZdDJJsdjrvQiuqYkVK2lMvWktODrrgjkbhX4++5cWQOZHUYtJCO8tfOkUxg7l8WOtiD
	xMe/riNLSIe4h+auwtaFEfinMnryvIB5UjbHKV2n0fX3W3Nduq6hRdl7Qe6pBH8qjE8q/j
	Be4+T5kYGYvalDJ5SvsSgpbgMOfygv8bd6HuMdfemFmb+8bkmTKga8p0q+UXNdxsQm2Pqr
	PQJI0yZeWiRb7RXbR+Q7KhbreMyCcp5XfhGjksMmuvdBV1zaLdIfZykt3hft6w==
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
Subject: [PATCH net-next v4 8/8] net: ethtool: pse-pd: Use per-PHY DUMP operations
Date: Mon, 24 Mar 2025 11:40:10 +0100
Message-ID: <20250324104012.367366-9-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeehvdgrfeemjegsledumeduhegtleemtgeltdeinecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemhedvrgefmeejsgeludemudehtgelmegtledtiedphhgvlhhopeguvghvihgtvgdqvdegrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvu
 ghumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_034030_432155_4496C9E6 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Leverage the per-phy ethnl DUMP helpers in case we have more that one
PSE PHY on the link.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4 : No changes

 net/ethtool/pse-pd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ethtool/pse-pd.c b/net/ethtool/pse-pd.c
index 4f6b99eab2a6..f3d14be8bdd9 100644
--- a/net/ethtool/pse-pd.c
+++ b/net/ethtool/pse-pd.c
@@ -314,4 +314,10 @@ const struct ethnl_request_ops ethnl_pse_request_ops = {
 
 	.set			= ethnl_set_pse,
 	/* PSE has no notification */
+
+	.dump_start		= ethnl_dump_start_perphy,
+	.dump_one_dev		= ethnl_dump_one_dev_perphy,
+	.dump_done		= ethnl_dump_done_perphy,
+
+	.allow_pernetdev_dump	= true,
 };
-- 
2.48.1


