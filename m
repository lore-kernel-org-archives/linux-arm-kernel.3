Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1DAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcCvskkAvrE3dpzstivzwhhvcSYs52ScThWYLV//VMw=; b=leoQMQK/nCoQ22wlao5CJRPF1F
	VKzSPPWsxUfs1GKt2qxZf5DJ5KWDe7TplVfp54cgD5NTZhy0+BySK3uzsS7KmC6/LmzNA8aWdZgRb
	hbokNaeovQtvz7ThnfahxlAQN6FbmlRgeJl/3D+DwUoxLslS5HBijVmYR5WSAWPSg2mdBxNHT2YDB
	2rcSEMzP0sukAukavX3v8QyX4TOp3en11/4md5K2yXMlCKpn46uyYGv3q5aAc1CjhFu2BI04PfjYU
	H5cfP8Yxg14CEfprAej/+CL2RA6Zn539ucjaK8xF7Sv5TQl2/miFZtiLMeRrVhr//4qjudjk0d2y4
	o9c26f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qt6-0000000D7om-30cv;
	Thu, 24 Apr 2025 07:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qlD-0000000D6OT-3vJF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GcCvskkAvrE3dpzstivzwhhvcSYs52ScThWYLV//VMw=; b=JelbIvp+laPu3ByeSoL4+8XzKI
	1xnFT/h00KUGTk3e4yDZMqmAK2Yl5bjrZhJXhJSaxITDFZ0LW38cIKDimfeYTNeYNd5wgafO4yhqY
	8hN/F8uWdUvpYafT4d8CyBXevmzWckHaX8J7NaehxcRpMw5UUD9ynyFYj8obActVLEXbmfKcioX0u
	Y0YcY8WfhjqBj0FL0Opi3cqYoZzrLNAzrQLHFLhKmcTi8i780vB9XU10RPf21qhdVMeKhNW2ahBW+
	I7stlJ2E9ZGK8PCf1KhTJfhOG0ZMN2N4AyIHgocX6gg8IVzAY5YIM28KTtzcy+gVrij2kw74hrUjI
	kTP6Ya7A==;
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ql9-0000000BXQf-2Bil
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:12:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C216243A39;
	Thu, 24 Apr 2025 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745478752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcCvskkAvrE3dpzstivzwhhvcSYs52ScThWYLV//VMw=;
	b=FH64OYzN4ny6D8XvWJGI1+JqPMBtzoiw0J5FosX91MoJQ77obJ9tlfJacevOlh2LwkDCdW
	mdzeLjuoAjddgSIm4zn9NNwj3GHnYK1T471kttz1fPQFjmYIGkUJaODH+86Pn/sNWw2IJ1
	B24reWtN+2yu625G1qI6G+L98W8fQ653NwLnMe+xz04OFcEeGzivoPFLeCNkLe1oKS5gmn
	xGtxyBFT8U5a+63nzv6Zi9hr4vSKSKAs6V6NjJh09GIA59r4odws4C7IWxaHod71fQqFYA
	cJ3AneYbCufIv3qa4ZHVo23GzUPrL/RsTiha6Jp2w148fXxCN5LaCpG8gWvTbQ==
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
Subject: [PATCH net-next v3 2/3] net: stmmac: socfpga: Don't check for phy to enable the SGMII adapter
Date: Thu, 24 Apr 2025 09:12:21 +0200
Message-ID: <20250424071223.221239-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhto
 hepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081235_711955_23B9394B 
X-CRM114-Status: GOOD (  13.38  )
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

The SGMII adapter needs to be enabled for both Cisco SGMII and 1000BaseX
operations. It doesn't make sense to check for an attached phydev here,
as we simply might not have any, in particular if we're using the
1000BaseX interface mode.

Make so that we only re-enable the SGMII adapter when it's present, and
when we use a phy_mode that is handled by said adapter.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 027356033e5e..c832a41c1747 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -62,14 +62,13 @@ struct socfpga_dwmac {
 	struct mdio_device *pcs_mdiodev;
 };
 
-static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
+					unsigned int mode)
 {
-	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)priv;
+	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)bsp_priv;
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dwmac->dev));
 	void __iomem *splitter_base = dwmac->splitter_base;
 	void __iomem *sgmii_adapter_base = dwmac->sgmii_adapter_base;
-	struct device *dev = dwmac->dev;
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct phy_device *phy_dev = ndev->phydev;
 	u32 val;
 
 	if (sgmii_adapter_base)
@@ -96,7 +95,9 @@ static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode
 		writel(val, splitter_base + EMAC_SPLITTER_CTRL_REG);
 	}
 
-	if (phy_dev && sgmii_adapter_base)
+	if ((priv->plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
+	     priv->plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) &&
+	     sgmii_adapter_base)
 		writew(SGMII_ADAPTER_ENABLE,
 		       sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
 }
-- 
2.49.0


