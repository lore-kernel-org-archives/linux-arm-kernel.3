Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9597CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqhVF62lXxp4ehI9VcV/C1HiZcbumD+HxLx7oV5CC5s=; b=xp4RXUtpcbBaHFdwpAgL3jKcsN
	RGTgmmfQM1ZR8UPvhnGIcUOs2yQ2vJZsfkl9lO3z/ZJxFbau1WVE3bQmpeKiA5a1qie/bg9BLxZXr
	1FlcEKK46AWNUjmXbYUKiqS4XZ8tj1dde5RcRjRtZKZTj2WtiywMTW83nunai9E5bbOvkZLVyDoCD
	WztjKfCkueP+y7o+T6kSxuvUYQfdk6hseK5HJzzR7z8gYo+aeKr9xIOczbRP9p5n3Lcn7JF4/egiC
	wFCwRdfmyHAWK5upW/opfAorhHoEIBfyxMI0Vr1nY4wXLY6rKm892NAY7y69zfV8UL5aPLruvQIlx
	Vh0QKoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppnl-00000008MNA-2Vs5;
	Wed, 05 Mar 2025 14:32:49 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppbD-00000008KLA-2ZOI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:19:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2094744140;
	Wed,  5 Mar 2025 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741184390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqhVF62lXxp4ehI9VcV/C1HiZcbumD+HxLx7oV5CC5s=;
	b=ceW9uAAo4G9bXVuI4ZERHZyb/kah8I5x/RmDD3jQstKr4v1Uea10lH0vRJ5MnV/mRG1IAC
	0axyedojTiTmRYXsyZ0w4Q2vj/ayCy1hUYkisREnON9sioxjuF1Fg+MXQ+atkL0HJLYl4N
	2ru30DHgRuSo5xcNNt7ve938uNjidbytT8b+LIg9gbjOXWEGQ+Iife9M93b+RDHsOHMQvA
	VQ9iO4gCbJmw6MewUMZzlsoezgJBT4KE+mt2i72DWJFtYuj2ULb0FCxAUTLendA9H7/94R
	aZ4ekHPX02VtIpZXem78gVpdKMznuHsUK8T0uk7KrtNrtGp6CkKy40rHAUy0CQ==
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
Subject: [PATCH net-next 7/7] net: ethtool: pse-pd: Use per-PHY DUMP operations
Date: Wed,  5 Mar 2025 15:19:37 +0100
Message-ID: <20250305141938.319282-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmr
 giivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_061951_795169_149A4CBF 
X-CRM114-Status: UNSURE (   8.48  )
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


