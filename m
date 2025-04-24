Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC167C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycgJR5zEjmvD8nS6gQ3Tfwq4cma6r3cAZuNgLAzZkLY=; b=p8prbjpH6WawA5OXU0aCL8L3lf
	Qpm90Qoz9gEJYiDw9giCepo2Yf3otfp8QFg1jqdUWFGOHNasOmEL99HHgzlBU/b+gJ+Ph7+yMB5yE
	iUFlklj5MJY+5HZcSEccsmyO+FCWfJrr18ghay41VMHGffVaid0UNHFbISkixr1t4neKrmYZ5EiAL
	Jisn+fDkKYYM/tV+CX26gdYQ/MFuaSrHKubcE8FkmjKjQg7lyDYGAa/Z1giH9PSjF+Kr3YzLxj6LV
	QFoW7HLhB9ZG8ZjbrrCH2Q8pw7jS82UJwVNckGmy6UFHh1RynDHvERgp6NEcgQjkWqdpav1XCPMSg
	sViJ4Oxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qnB-0000000D6fY-2DFv;
	Thu, 24 Apr 2025 07:14:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qlD-0000000D6OP-2ICH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ycgJR5zEjmvD8nS6gQ3Tfwq4cma6r3cAZuNgLAzZkLY=; b=Ei/0APZheQfd3lTV0Qd2xzCidY
	z7kllpw8eGcTpSpv78ySpiVNY9wvmEigUFJaSJRP+6pWUrMXCJEKSe7PmAC0USbwuOTfD3q07y/C5
	Ds76/2FFXkpr0H3zuEVs8ene4r3HFLVDeaWDphm73IBrHyDY6fgyaAqXdlWcaSGV+HSTYbC46yjQt
	5IL7l810cailzs8I8w7pyxKhZ30wkhT8MNUbuEKHSz2FUrSJob6AP4hyeafSXPra0O6CzjTjWLGTY
	3O4RfKyDGx6qIkqicWh3qV87vZqFAp/uaCR1ND1nsY1nz4gHAMpgkJK64TnO5CKAa5XrS85wXloMn
	VCBBqKSA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ql9-0000000BXQg-0Mys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:12:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 950CD43A3B;
	Thu, 24 Apr 2025 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745478753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycgJR5zEjmvD8nS6gQ3Tfwq4cma6r3cAZuNgLAzZkLY=;
	b=QVxFnV4nnmjm0W6PgA89ziic6glf/WhsXppf1wp5l1jwnTD/c5TE9YqEwMubYbqUSQsGSk
	zpfgnzEklh2h+PVnY22d6I2CGvXRkzNBtlKRkfnyLCkBCklpc0rksJndomBtmWzi8q0TBi
	Xk2xQbWFN+j5W74mLv+rkcnnM7/pvW0rHiEaQWwgnTYudMfVtqJRjPXRaKTYXgNCAhh/xG
	TtSBHudzUsIImDHnZmUBMpVItw643TnfefToCCZEXW/NYO48mohjF2OQoS20SN+RbSzUAC
	bqia88SdKtqM1kFLNOm31LIdpZhB6+Mi0AXAnu2Kd0bOxK7AD4AhYmX9eDXLGA==
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
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v3 3/3] net: stmmac: socfpga: Remove unused pcs-mdiodev field
Date: Thu, 24 Apr 2025 09:12:22 +0200
Message-ID: <20250424071223.221239-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhto
 hepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081235_340934_13DA4434 
X-CRM114-Status: GOOD (  10.94  )
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

When dwmac-socfpga was converted to using the Lynx PCS (previously
referred to in the driver as the Altera TSE PCS), the
lynx_pcs_create_mdiodev() was used to create the pcs instance.

As this function didn't exist in the early versions of the series, a
local mdiodev object was stored for PCS creation. It was never used, but
still made it into the driver, so remove it.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c832a41c1747..72b50f6d72f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -59,7 +59,6 @@ struct socfpga_dwmac {
 	void __iomem *sgmii_adapter_base;
 	bool f2h_ptp_ref_clk;
 	const struct socfpga_dwmac_ops *ops;
-	struct mdio_device *pcs_mdiodev;
 };
 
 static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
-- 
2.49.0


