Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39270C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGYLXTKr317lbz7cMZmlo8cdmq8BQi7yYoNQiu8UGv4=; b=wTAJh2V5uB6YhAOBIckp+Tadng
	oggiaqW6dbdQNlcLx+dyKq68GMPPjXEPWzzvL5lpcrIZCMkAmR/OzHFLuYF98KQNXvSwc8OJkoagj
	mDbSWOkusTp9+CQvxpfOr06ZYIQqEcvd/iqlbjA51wXy2ghQRWRGidwotHqbN4symm+POB4GfKnF/
	XWtFIl+u1WllqX2WuLRjvthBGSSdaigh6RBhG58QdQz9tOryseKi6HQixcybJiSgx6mbzDAWRKo6D
	VoqVTpeAvpEn0JzafwhjpNk5ORSe+dhp4zpkoh2oUfnaacxK8H2Zjw0x7rNeyaIxcV/SIjQNJI5Mj
	GI4c896A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rDX-0000000AXMB-3XLx;
	Thu, 10 Apr 2025 12:41:15 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r6V-0000000AVux-3Ya5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:34:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC4B54431D;
	Thu, 10 Apr 2025 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744288437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGYLXTKr317lbz7cMZmlo8cdmq8BQi7yYoNQiu8UGv4=;
	b=j29ek6nRygjiIrj1VFhvxOR2Z3kUusliKiTMMpu4hFiQ0sb3IHP/JruHwoqavDjW9TujXC
	sEj2TLDPwSVlQW7Nu/T7cxSlYP3UiwWrvZ9qfEB19vPif6wpu+5tixl7iN/VVgNU1D4QSw
	ylSKdSPxfmTi2E+RbGUGTFvX71LrHpgcDefOV+Z13MsYtVqaTmggmkRH44tcFJ1UgAGeQX
	Jl2BS6Mpkxsv5MVOI4PqSuQgRiJP4T7ed2AtZ1n1lD/XV/Cwfrx5CGe0Nzy/7y9Le+Gwzn
	pq6BnURCTrJyUeBRB/lN2PwYwPhHjmubXLCTa/U71kA0xFVnTWOsuJmWBEKE8Q==
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
Subject: [PATCH net-next v5 3/4] net: ethtool: plca: Use per-PHY DUMP operations
Date: Thu, 10 Apr 2025 14:33:48 +0200
Message-ID: <20250410123350.174105-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
References: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053400_019303_7281DDFC 
X-CRM114-Status: UNSURE (   9.68  )
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
 net/ethtool/netlink.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 69c3f62ac82c..dd4eaa77dd8c 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -1385,9 +1385,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_PLCA_GET_CFG,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_perphy_start,
+		.dumpit	= ethnl_perphy_dumpit,
+		.done	= ethnl_perphy_done,
 		.policy = ethnl_plca_get_cfg_policy,
 		.maxattr = ARRAY_SIZE(ethnl_plca_get_cfg_policy) - 1,
 	},
@@ -1401,9 +1401,9 @@ static const struct genl_ops ethtool_genl_ops[] = {
 	{
 		.cmd	= ETHTOOL_MSG_PLCA_GET_STATUS,
 		.doit	= ethnl_default_doit,
-		.start	= ethnl_default_start,
-		.dumpit	= ethnl_default_dumpit,
-		.done	= ethnl_default_done,
+		.start	= ethnl_perphy_start,
+		.dumpit	= ethnl_perphy_dumpit,
+		.done	= ethnl_perphy_done,
 		.policy = ethnl_plca_get_status_policy,
 		.maxattr = ARRAY_SIZE(ethnl_plca_get_status_policy) - 1,
 	},
-- 
2.49.0


