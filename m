Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E3C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr0M0J76uyMt4/Nl30fM+SNEIOlB93E4OXNMfftw/G8=; b=HDC91bxZXwKHjJDPHL99vD8zkT
	TVg+KuD1I9waXJuRa7O8KwuQQEYX6yv5arKwFJQrWQnPkpIms/7ewA9JIabQJHWPpsme0j4zLqZZP
	ybLG3vsK0NyCtJrq8aAOgGlCG2iEPBduio5GNIHdPza+fopO5UFAQfK5SYzkWWcBoB9BgRsOb1Yc/
	nJRjv3FzYHwkVXGmyHhBJpJ0+0RtNBGUx8gBK7UiOGRAWOaEo1NuFPLLdEAzCtUnDsKaBlVwuzkjs
	hRLk6oXMCPGumArRK2zi68jEjDnqnZPwsjWbbMgWr7cNh7ERvm/NRCXilmG9n9wM72+31mwRZ7V0t
	gYft/Pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1jl-00000005TeI-3765;
	Tue, 25 Mar 2025 10:42:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1US-00000005QpM-3MNk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE85643BFB;
	Tue, 25 Mar 2025 10:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116E8C4AF0D;
	Tue, 25 Mar 2025 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898396;
	bh=AUDVcWx/fSZsojOnLSFNfxIu2BR40276Vy/2x9iqJro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lTZpXHQWWR6Jj0HkjogvVaGMumYVPEANoMQJ8rDaw29OxYbHoz2LTSHF7AXPrSPIN
	 zOxfbyyCeASl5gDeXVq2Hs2GfgkOZDnK4SwhAe5emW6FBJMEaPJ7J9+qteEEUpIzb3
	 whteSInwuy8f/PHOMMl7CoxRt808xxqotyrOdKDIU3ydKfuSnSQBleOyyOo93437F3
	 zbREmulCyzdK733RMq4hi3UdCehxN9b1+wjR0gnYyd3d6hezh07170Z9hKlx1k9Bax
	 C7LPBsE5jDAQv6dwKBvhR8i/ZQY9A2zd667d6Lb2ri4jsnEArQ7VsNo+HEwIAlT49X
	 Udu0aR+nypj0A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UQ-00GsRS-8Q;
	Tue, 25 Mar 2025 10:26:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 09/13] PCI: apple: Move port PHY registers to their own reg items
Date: Tue, 25 Mar 2025 10:26:06 +0000
Message-Id: <20250325102610.2073863-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032636_903270_1F7D5589 
X-CRM114-Status: GOOD (  15.59  )
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

From: Hector Martin <marcan@marcan.st>

T602x PCIe cores move these registers around. Instead of hardcoding in
another offset, let's move them into their own reg entries. This matches
what Apple does on macOS device trees too.

Maintains backwards compatibility with old DTs by using the old offsets.

Note that we open code devm_platform_ioremap_resource_byname() to avoid
error messages on older platforms with missing resources in the pcie
node. ("pcie-apple 590000000.pcie: invalid resource (null)" on probe)

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 55 +++++++++++++++++++----------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 23d9f62bd2ad4..94c49611b74df 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -39,14 +39,18 @@
 #define   CORE_RC_STAT_READY		BIT(0)
 #define CORE_FABRIC_STAT		0x04000
 #define   CORE_FABRIC_STAT_MASK		0x001F001F
-#define CORE_LANE_CFG(port)		(0x84000 + 0x4000 * (port))
-#define   CORE_LANE_CFG_REFCLK0REQ	BIT(0)
-#define   CORE_LANE_CFG_REFCLK1REQ	BIT(1)
-#define   CORE_LANE_CFG_REFCLK0ACK	BIT(2)
-#define   CORE_LANE_CFG_REFCLK1ACK	BIT(3)
-#define   CORE_LANE_CFG_REFCLKEN	(BIT(9) | BIT(10))
-#define CORE_LANE_CTL(port)		(0x84004 + 0x4000 * (port))
-#define   CORE_LANE_CTL_CFGACC		BIT(15)
+
+#define CORE_PHY_DEFAULT_BASE(port)	(0x84000 + 0x4000 * (port))
+
+#define PHY_LANE_CFG			0x00000
+#define   PHY_LANE_CFG_REFCLK0REQ	BIT(0)
+#define   PHY_LANE_CFG_REFCLK1REQ	BIT(1)
+#define   PHY_LANE_CFG_REFCLK0ACK	BIT(2)
+#define   PHY_LANE_CFG_REFCLK1ACK	BIT(3)
+#define   PHY_LANE_CFG_REFCLKEN		(BIT(9) | BIT(10))
+#define   PHY_LANE_CFG_REFCLKCGEN	(BIT(30) | BIT(31))
+#define PHY_LANE_CTL			0x00004
+#define   PHY_LANE_CTL_CFGACC		BIT(15)
 
 #define PORT_LTSSMCTL			0x00080
 #define   PORT_LTSSMCTL_START		BIT(0)
@@ -146,6 +150,7 @@ struct apple_pcie_port {
 	struct apple_pcie	*pcie;
 	struct device_node	*np;
 	void __iomem		*base;
+	void __iomem		*phy;
 	struct irq_domain	*domain;
 	struct list_head	entry;
 	unsigned long		*sid_map;
@@ -476,26 +481,26 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
 	if (res < 0)
 		return res;
 
-	rmw_set(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
-	rmw_set(CORE_LANE_CFG_REFCLK0REQ, pcie->base + CORE_LANE_CFG(port->idx));
+	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
+	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
 
-	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
-					 stat, stat & CORE_LANE_CFG_REFCLK0ACK,
+	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
+					 stat, stat & PHY_LANE_CFG_REFCLK0ACK,
 					 100, 50000);
 	if (res < 0)
 		return res;
 
-	rmw_set(CORE_LANE_CFG_REFCLK1REQ, pcie->base + CORE_LANE_CFG(port->idx));
-	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
-					 stat, stat & CORE_LANE_CFG_REFCLK1ACK,
+	rmw_set(PHY_LANE_CFG_REFCLK1REQ, port->phy + PHY_LANE_CFG);
+	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
+					 stat, stat & PHY_LANE_CFG_REFCLK1ACK,
 					 100, 50000);
 
 	if (res < 0)
 		return res;
 
-	rmw_clear(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
+	rmw_clear(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
 
-	rmw_set(CORE_LANE_CFG_REFCLKEN, pcie->base + CORE_LANE_CFG(port->idx));
+	rmw_set(PHY_LANE_CFG_REFCLKEN, port->phy + PHY_LANE_CFG);
 	rmw_set(PORT_REFCLK_EN, port->base + PORT_REFCLK);
 
 	return 0;
@@ -515,6 +520,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	struct platform_device *platform = to_platform_device(pcie->dev);
 	struct apple_pcie_port *port;
 	struct gpio_desc *reset;
+	struct resource *res;
+	char name[16];
 	u32 stat, idx;
 	int ret, i;
 
@@ -542,10 +549,22 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 
 	raw_spin_lock_init(&port->lock);
 
-	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
+	snprintf(name, sizeof(name), "port%d", port->idx);
+	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
+	if (!res)
+		res = platform_get_resource(platform, IORESOURCE_MEM, port->idx + 2);
+
+	port->base = devm_ioremap_resource(&platform->dev, res);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
+	snprintf(name, sizeof(name), "phy%d", port->idx);
+	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
+	if (res)
+		port->phy = devm_ioremap_resource(&platform->dev, res);
+	else
+		port->phy = pcie->base + CORE_PHY_DEFAULT_BASE(port->idx);
+
 	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
 
 	/* Assert PERST# before setting up the clock */
-- 
2.39.2


