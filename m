Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E22C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crxwshCi6/gIzDkqvmX43AHE+I9xHsMFw6dKDZ/wTv4=; b=ZxeKY671QtTQzeWcKHMB9quAOb
	NYI+lTMZfTYsv2hKKa7InP+JEGQft7upHgn0RdmM3QVIFPHHVEbTxFvIyo9LOZytm7buqeSAAjofZ
	PUNuunUkZXqoTt/dG5Ed3fIeGVhPCu5RCZv4YY4gid6nYGdfEVfygdH/p37ouCSfXDa2/Qcv7NgPz
	FedGgw8w4nBS1iMYgNnsBaPzbLOVJnlIup6sWdyD6hkVW9xgycAupdZLdTpiAITun+YOKBmQSwYXb
	rGXvtijOI3Njc36J3bgKME6PG/uMcEd8sGUUlGE/MccUQMrDikFls+ShDYufomc6yP3qn+OeliOxe
	MlG86v2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfRt-00000002t1E-41iP;
	Mon, 24 Mar 2025 10:54:29 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfEK-00000002qz2-3gY3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:40:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A483442F0;
	Mon, 24 Mar 2025 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742812827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crxwshCi6/gIzDkqvmX43AHE+I9xHsMFw6dKDZ/wTv4=;
	b=DMnA8mFBZJleF0Q20q3rSS9gcUyavMVWvycfbFy5xqPg5b4Tl8pa0N/t+zHwyeKDSugbHk
	8o6qCDxriJ/FHEPW2G8dko1PUChTWkGpKpqRbxdSq1HDkreJwhI+TJexIEoNfcAoGQaj+F
	zwJzEa+Fy9JxmHSYYdvOgzyoOP0ZxIeI57oMwz0ivnb7QR2AdGv/K4lGZ9A9m+RWV/p4IO
	3OqtwkNRqTM1qP21twkzaSxI0e1sfhmb7MMVoov+EcvQ3HdXI0Dw5HbdWa01E07jy0NCEi
	WsD96jAR2a7Rkbk66uzESNOLiq5wGDzl9ZfdqNFeR0uga2yDhx770YysXqk0ww==
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
Subject: [PATCH net-next v4 7/8] net: ethtool: plca: Use per-PHY DUMP operations
Date: Mon, 24 Mar 2025 11:40:09 +0100
Message-ID: <20250324104012.367366-8-maxime.chevallier@bootlin.com>
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
X-CRM114-CacheID: sfid-20250324_034029_045825_E6F44F30 
X-CRM114-Status: UNSURE (   8.53  )
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
PLCA-able PHY on the link.

This is done for both PLCA status and PLCA config.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4 : No changes

 net/ethtool/plca.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/ethtool/plca.c b/net/ethtool/plca.c
index e1f7820a6158..2148ff607561 100644
--- a/net/ethtool/plca.c
+++ b/net/ethtool/plca.c
@@ -191,6 +191,12 @@ const struct ethnl_request_ops ethnl_plca_cfg_request_ops = {
 
 	.set			= ethnl_set_plca,
 	.set_ntf_cmd		= ETHTOOL_MSG_PLCA_NTF,
+
+	.dump_start		= ethnl_dump_start_perphy,
+	.dump_one_dev		= ethnl_dump_one_dev_perphy,
+	.dump_done		= ethnl_dump_done_perphy,
+
+	.allow_pernetdev_dump	= true,
 };
 
 // PLCA get status message -------------------------------------------------- //
@@ -268,4 +274,10 @@ const struct ethnl_request_ops ethnl_plca_status_request_ops = {
 	.prepare_data		= plca_get_status_prepare_data,
 	.reply_size		= plca_get_status_reply_size,
 	.fill_reply		= plca_get_status_fill_reply,
+
+	.dump_start		= ethnl_dump_start_perphy,
+	.dump_one_dev		= ethnl_dump_one_dev_perphy,
+	.dump_done		= ethnl_dump_done_perphy,
+
+	.allow_pernetdev_dump	= true,
 };
-- 
2.48.1


