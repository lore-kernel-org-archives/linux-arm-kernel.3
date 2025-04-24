Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF442C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CGBKQP0ozZgi8SSFu8gigr2mI4CbgnOZryTHhEPMZd8=; b=TpOQgMMWorynb5otYU04m3Nm7h
	RXhV6ZS+N5daGrtUEKYa7/4xYS1GcVPg5BhPwY8NCcjCM6QyQTi3cUYAxoIV6jrBngU+Y0wFKP8sh
	HzGGJUBiGK2PZZnnID8Js7WaQh+49X/4azeubZlUey5S1P/2hQV0CdkkWPbXNToZ1kqRdbFjxHsqg
	W+Co0H2ET6l/Ud5HoSyFWsgKBqToYUk2xNFmD6FGSLsv0CdnD8pWA6tNPPvFVptcElfrzkb9YtpO+
	Pt7l1oiJdSFjbbbI53zGvqtlCO+NTAWo6kAB3ripTop1n3K+Ipjzi83uPb2dP7bpFTR9A6A/FYjRK
	xJrSwcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qr7-0000000D7Os-43y4;
	Thu, 24 Apr 2025 07:18:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qlD-0000000D6OS-3wuf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CGBKQP0ozZgi8SSFu8gigr2mI4CbgnOZryTHhEPMZd8=; b=nvuq0XQEecMk7rPlbLOcNBuxur
	NCVPxxS0gSKgBIdjZJ6FTrZhXh1IgQGjkR5GMdj1ObLED8dJ4CwZZCLvTssfySzadMviQRfeYGfGo
	iUTS+fG57Tk5/2CB33+WQXp08R343tUC/2T3oVV1EEIDKp5ogfcv4uJkahXyymad1KZFEGubSPItb
	+UDX9NgNila/hUP1Dt0aeM/5aT4LyjqdecYczwQQGI59PLZ2rUZfPtzJLJQN1wUuxpkErnTBZli1j
	77lHMcnUrJF+YtllXotnY3BgLnMxHFnNzNvUSSCCf9V6dgXK0ic/fLvmvTSDoUmESXup71qZNnIoB
	bcjfIWxw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ql9-0000000BXQd-1y5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:12:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3975143A4E;
	Thu, 24 Apr 2025 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745478750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CGBKQP0ozZgi8SSFu8gigr2mI4CbgnOZryTHhEPMZd8=;
	b=CbCZT+Rdeqcs/wB6DjINTQ7gct4Pv/v0ovBacHSLBoggDrnVKL9cYb9y0QYiK/Jj0UjGi5
	j1k6aEKBDyY4DXp+Oeg9rEQjQr7qUYQb0eaPp3ceSnBB4+b9OL8jewRrWX7KCjDKJNqTNt
	+nJnLE02xC7P36rwG0DJJnc4KWUvtlIJydXrw8O8LO4SkT/poQoDS1IyTu6NF7ycoy6u9S
	G6LmCYrXwkSxOPeXGTRukAqfQk9RPkkCNDxwpWu4U2MtB8TQGVjL/zapprBDBiBFOuJUYc
	SZ/z0c+VSTQ2t8Ve0QcaEIir5dFn2k7Y46HPt/RlgW00qkVU14t89GVMXkyWNg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v3 0/3] net: stmmac: socfpga: 1000BaseX support and cleanups
Date: Thu, 24 Apr 2025 09:12:19 +0200
Message-ID: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhleeihefgffeiffdtffeivdehfeetheekudekgfetffetveffueeujeeitdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtoheplhhinhhugiesrghrmhhli
 hhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081235_711115_926E3E9A 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi everyone,

This V3 is simply a re-send of V2, targeting net-next instead of net as
the V2 did by mistake.

No other changes besides a rebase on net-next were made.

This small series sorts-out 1000BaseX support and does a bit of cleanup
for the Lynx conversion.

Patch 1 makes sure that we set the right phy_mode when working in
1000BaseX mode, so that the internal GMII is configured correctly.

Patch 2 removes a check for phy_device upon calling fix_mac_speed(). As
the SGMII adapter may be chained to a Lynx PCS, checking for a
phy_device to be attached to the netdev before enabling the SGMII
adapter doesn't make sense, as we won't have a downstream PHY when using
1000BaseX.

Patch 3 cleans an unused field from the PCS conversion.

Changes in V3:
 - None besides targeting net-next instead of net

Changes in V2: 
 - Added Russell's review tags
 - Reworked patch 2 to check for phy_interface when configuring the
   adapter, as suggested by Russell.

V1: https://lore.kernel.org/netdev/20250422094701.49798-1-maxime.chevallier@bootlin.com/
V2: https://lore.kernel.org/netdev/20250423104646.189648-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (3):
  net: stmmac: socfpga: Enable internal GMII when using 1000BaseX
  net: stmmac: socfpga: Don't check for phy to enable the SGMII adapter
  net: stmmac: socfpga: Remove unused pcs-mdiodev field

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.49.0


