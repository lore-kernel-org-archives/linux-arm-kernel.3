Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE59C83F35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvhogsV6u0eq8NEZjjZYMPSknEEGOZefTf8HyT/B9sQ=; b=S+JxOqX2LFp+F9UGJLej/I7EiQ
	rTOZARK5i0Ae3rZFpMEOBuILLB3GcX7U0OS4G5txXJY7UueMmqYCPqY5AO9B6c1ldfkwWByub+ImA
	N148CUdtRa45J32eFZnvy+qkKCLsl58qKTisxNhEYOyas3q2T9sAJyjY5+y1/VeCtAo55mOk8IJGO
	HPO1hwj0nwHteQXiPWjWOBFo82U06CvimWAvkN69Yn33BexzjgZ1GUq+H4s7L24esPZ6sVFYGECJv
	zt+XRdNhYLB39CeV0e0M069ayEXTflSO1I4mS91r43H16LpOqaCO2yB5aiItf4ynYIpRUWnT8mN1J
	Fil4UIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucK3P-00000009a1J-05dS;
	Thu, 17 Jul 2025 08:33:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJ4q-00000009S88-2Is8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:30:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 653B4443EF;
	Thu, 17 Jul 2025 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752737446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvhogsV6u0eq8NEZjjZYMPSknEEGOZefTf8HyT/B9sQ=;
	b=c8xvZPl4Av0fCNMCTUfxf0TpayEgX8x+i+IacCh8mhsnYk3jNQ6hJvlor9KiL4qjc8XeKu
	KNfq8olTWngl3uDiDnGoRTFGSIFTqrh5ZGOkY0L7pZJoPSACnfZ4VJs0ZHO1NN9wkhQ2Yv
	hnhO1zopDBVuA8Uqa8irHjZR3rEym/bAypYlLreOJinh/0zJFVGrvofaOJF5qjCc5mwypI
	IUqDM7iJQhvKcXIx7iA3OaklD/d5E1p83zeT8sNGJlQrPU8hEyB1uif1mMHjv0Vkj+7k8a
	KtSWLsSBLuRhkQrkjUG7X713huzt+SbQjhjN1M7V4BIWDKnWTG6S/r/HXXaISA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v9 14/15] net: phy: dp83822: Add SFP support through the phy_port interface
Date: Thu, 17 Jul 2025 09:30:18 +0200
Message-ID: <20250717073020.154010-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_003048_732983_F5E32F96 
X-CRM114-Status: GOOD (  10.98  )
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

The DP83822 can support 100BaseFX. This mode was only accessible through
custom DT properties, but there also exist SFP modules that support
these modes. As this only requires setting the relevant supported
interface in the driver, expose the port capability with the new
phy_port API, allowing SFP support.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 2657be2e9034..aa2c0085a900 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -979,6 +979,13 @@ static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
 		}
 	}
 
+	/* If attached from SFP, is_mii is set, but not the mediums. */
+	if (port->is_mii)
+		dp83822->fx_enabled = true;
+
+	if (dp83822->fx_enabled)
+		__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
+
 	return 0;
 }
 
-- 
2.49.0


