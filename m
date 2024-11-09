Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A3ED5E38A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=; b=gRoXsi3/yi6FN+7UgxE70X7182
	pk77izIbwipafEP5KTs3FZjcNWn1QU41gn/t6U2buw3enQJy5VQOndoCyZqR09jU4EM9746rlFAMf
	s4scyLke7R2YeYr+nnjM/9x+2h3pAEZhtM0iekERXREjjjQAy/hg9OUtVycf6Dn+bzGkROBrD+4fw
	Ueidpj9Yyc2V2Ox/hXAiuJS4sTc1tMIdQO6tsh/wEpgalKZaiOywPiCiaUXCsq4y/j9kMiipMvVMt
	39nwJOaNvK5AyCLPX9CDcZzmmaZ7wRmEYLEcTa9cowFMLzsFomAk2rg78NXUgCA2NdGTa4VI4Uf4y
	i1AH5u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9v3x-0000000E7WZ-2Q2G;
	Sat, 09 Nov 2024 23:40:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9v29-0000000E7NQ-2Lu4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 23:38:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2113da91b53so24401235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 15:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731195504; x=1731800304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=;
        b=ktZP8HgTfOPBGTvA82EbhUn7Wxya3VozMuNIfiCcrkEDDn4KbG7rRF4mX7sCXXDETz
         3WjFq/wNj+hU7CGcwkpQlTEgsCGRCWwr/dXag3CcnIt5hd9hmflhXd8hpjJKZuOyQA0G
         vbtbZJ8pKeQa+zBdod/yGk0CUgdL0NYItPAHQ7ykOjYANdvNJXUrf9zv/gMwuAGpvQSW
         y/SBgA8OAB0jGxg/5Q7mkgpwyC/dL5DlRG4hGSmAv1kuwXByvIbsth1aUvVVc8dR/EDW
         vrk+xoDLNxjq5qNrlP/iqk8hfSZOLACQcCtAdGuri9GPV0gpMq/ErVjMiH4/dI+R3UDP
         9x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731195504; x=1731800304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WS9Cf0rpv763uMkx6ljFiQoDVVkOxO5ZGRudjYIJ+8=;
        b=XBdnESNLOG55FpglSnPmwKF3+dCOvWoJKyQEaeFW146d1bXl0CseJxXKMdkGULXyuZ
         9JHki13/PAqParxRXNZu2uYXKv7FCDgzG35u03CSnDQEszBTEa6dZCfkVaFEfIZzDYy5
         zKoigczeAPpKr2HCH8UeOxH3Tq/mDvESDu1GyesuiTpeCCv/Fp+e0utFALb/rHyE8iZr
         /DlS2qBt6SCH4Ru1tQyWmOXQmCA2YuGGJx/9TK5ENy8WXuW06U67NTmTdlAlXrykMoUC
         Ilfumv1UZ6EiJdre44cXzTI4fCJpklYGrx05gfTTk72b8J+BXNhlAfvTclaqsd3Jyjkj
         m/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWgm+jbcRabSLL3mR6cL9GvXBPI9z/C/5U7WIPEi7xZY1fOavmN/ogD49si2poT9zbWuY/stnMiAxNIlUM28PB/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm2JtylooHh0/RVozmkYfwDYopo+lidkegKELOewzwayeyepDw
	P7uvoQhIf8W+jJ/Qe79YhSA/RmjeZoBVVLSQH4y6zRJi8XjEk2RW
X-Google-Smtp-Source: AGHT+IFWJIUgHc1oRxZrf0aN5OX+ho3LnxY/4odziwXSjaXs6zql+r8FAmb9Rw6CT2WgI37pumpZrg==
X-Received: by 2002:a17:902:f541:b0:20d:1866:ed6f with SMTP id d9443c01a7336-21183ccf11bmr103236155ad.4.1731195504224;
        Sat, 09 Nov 2024 15:38:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e86e30sm50116915ad.281.2024.11.09.15.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:38:23 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Byungho An <bh74.an@samsung.com>,
	Kevin Brace <kevinbrace@bracecomputerlab.com>,
	Francois Romieu <romieu@fr.zoreil.com>,
	Michal Simek <michal.simek@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Zhao Qiang <qiang.zhao@nxp.com>,
	linux-can@vger.kernel.org (open list:CAN NETWORK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC FS_ENET DRIVER)
Subject: [PATCH net-next] net: use pdev instead of OF funcs
Date: Sat,  9 Nov 2024 15:38:21 -0800
Message-ID: <20241109233821.8619-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_153825_645211_3D60A48A 
X-CRM114-Status: GOOD (  22.38  )
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

np here is ofdev->dev.of_node. Better to use the proper functions as
there's no use of children or anything else.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/can/grcan.c                       |  2 +-
 drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
 drivers/net/dsa/bcm_sf2.c                     |  4 ++--
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
 .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
 drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
 drivers/net/ethernet/marvell/mvneta.c         |  2 +-
 drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
 .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
 drivers/net/ethernet/via/via-rhine.c          |  2 +-
 drivers/net/ethernet/via/via-velocity.c       |  2 +-
 drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
 drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
 drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
 19 files changed, 66 insertions(+), 59 deletions(-)

diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
index cdf0ec9fa7f3..0a2cc0ba219f 100644
--- a/drivers/net/can/grcan.c
+++ b/drivers/net/can/grcan.c
@@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *ofdev)
 		goto exit_error;
 	}
 
-	irq = irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
+	irq = platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
 	if (!irq) {
 		dev_err(&ofdev->dev, "no irq found\n");
 		err = -ENODEV;
diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/mpc5xxx_can.c
index 0080c39ee182..252ad40bdb97 100644
--- a/drivers/net/can/mscan/mpc5xxx_can.c
+++ b/drivers/net/can/mscan/mpc5xxx_can.c
@@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device *ofdev)
 	if (!base)
 		return dev_err_probe(&ofdev->dev, err, "couldn't ioremap\n");
 
-	irq = irq_of_parse_and_map(np, 0);
+	irq = platform_get_irq(ofdev, 0);
 	if (!irq) {
 		dev_err(&ofdev->dev, "no irq found\n");
 		err = -ENODEV;
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 43bde1f583ff..9229582efd05 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 		of_node_put(ports);
 	}
 
-	priv->irq0 = irq_of_parse_and_map(dn, 0);
-	priv->irq1 = irq_of_parse_and_map(dn, 1);
+	priv->irq0 = platform_get_irq(pdev, 0);
+	priv->irq1 = platform_get_irq(pdev, 1);
 
 	base = &priv->core;
 	for (i = 0; i < BCM_SF2_REGS_NUM; i++) {
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 2f516b950f4e..18df8d1d93fd 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
 
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->membase;
-	ndev->irq = irq_of_parse_and_map(np, 0);
+	ndev->irq = platform_get_irq(pdev, 0);
 	if (ndev->irq == -ENXIO) {
 		netdev_err(ndev, "No irq resource\n");
 		ret = ndev->irq;
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index 2bfaf14f65c8..553d33a98c99 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	int rv;
 	struct net_device *ndev;
 	struct mpc52xx_fec_priv *priv = NULL;
-	struct resource mem;
+	struct resource *mem;
 	const u32 *prop;
 	int prop_size;
 	struct device_node *np = op->dev.of_node;
@@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	priv->ndev = ndev;
 
 	/* Reserve FEC control zone */
-	rv = of_address_to_resource(np, 0, &mem);
-	if (rv) {
+	mem = platform_get_resource(op, 0, IORESOURCE_MEM);
+	if (!mem) {
 		pr_err("Error while parsing device node resource\n");
+		rv = -ENODEV;
 		goto err_netdev;
 	}
-	if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
+	if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
 		pr_err("invalid resource size (%lx < %x), check mpc52xx_devices.c\n",
-		       (unsigned long)resource_size(&mem),
+		       (unsigned long)resource_size(mem),
 		       sizeof(struct mpc52xx_fec));
 		rv = -EINVAL;
 		goto err_netdev;
 	}
 
-	if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
+	if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
 				DRIVER_NAME)) {
 		rv = -EBUSY;
 		goto err_netdev;
@@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	ndev->netdev_ops	= &mpc52xx_fec_netdev_ops;
 	ndev->ethtool_ops	= &mpc52xx_fec_ethtool_ops;
 	ndev->watchdog_timeo	= FEC_WATCHDOG_TIMEOUT;
-	ndev->base_addr		= mem.start;
+	ndev->base_addr		= mem->start;
 	SET_NETDEV_DEV(ndev, &op->dev);
 
 	spin_lock_init(&priv->lock);
 
 	/* ioremap the zones */
-	priv->fec = ioremap(mem.start, sizeof(struct mpc52xx_fec));
+	priv->fec = ioremap(mem->start, sizeof(struct mpc52xx_fec));
 
 	if (!priv->fec) {
 		rv = -ENOMEM;
@@ -879,9 +880,9 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 
 	/* Get the IRQ we need one by one */
 		/* Control */
-	ndev->irq = irq_of_parse_and_map(np, 0);
+	ndev->irq = platform_get_irq(op, 0);
 
-		/* RX */
+	/* RX */
 	priv->r_irq = bcom_get_task_irq(priv->rx_dmatsk);
 
 		/* TX */
@@ -967,7 +968,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 		bcom_fec_tx_release(priv->tx_dmatsk);
 	iounmap(priv->fec);
 err_mem_region:
-	release_mem_region(mem.start, sizeof(struct mpc52xx_fec));
+	release_mem_region(mem->start, sizeof(struct mpc52xx_fec));
 err_netdev:
 	free_netdev(ndev);
 
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index 3d073f0fae63..4ffab516f770 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -68,7 +68,7 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 	struct device_node *np = of->dev.of_node;
 	struct mii_bus *bus;
 	struct mpc52xx_fec_mdio_priv *priv;
-	struct resource res;
+	struct resource *res;
 	int err;
 
 	bus = mdiobus_alloc();
@@ -85,16 +85,18 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 	bus->write = mpc52xx_fec_mdio_write;
 
 	/* setup registers */
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
+	res = platform_get_resource(of, 0, IORESOURCE_MEM);
+	if (!res) {
+		err = -ENODEV;
 		goto out_free;
-	priv->regs = ioremap(res.start, resource_size(&res));
+	}
+	priv->regs = ioremap(res->start, resource_size(res));
 	if (priv->regs == NULL) {
 		err = -ENOMEM;
 		goto out_free;
 	}
 
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res->start);
 	bus->priv = priv;
 
 	bus->parent = dev;
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index be63293511d9..8bed0ea11dd1 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -83,7 +83,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 	struct fs_platform_info *fpi = fep->fpi;
 	int ret = -EINVAL;
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		goto out;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index f2ecd20027cf..8dbd624b87ac 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -88,7 +88,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 6c97191649de..53d67fb08bad 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -87,7 +87,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 {
 	struct platform_device *ofdev = to_platform_device(fep->dev);
 
-	fep->interrupt = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	fep->interrupt = platform_get_irq(ofdev, 0);
 	if (!fep->interrupt)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index dec31b638941..0e6faba74e34 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -96,7 +96,7 @@ static int fs_enet_fec_mii_write(struct mii_bus *bus, int phy_id, int location,
 
 static int fs_enet_mdio_probe(struct platform_device *ofdev)
 {
-	struct resource res;
+	struct resource *res;
 	struct mii_bus *new_bus;
 	struct fec_info *fec;
 	int (*get_bus_freq)(struct device *);
@@ -117,13 +117,15 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
 	new_bus->read = &fs_enet_fec_mii_read;
 	new_bus->write = &fs_enet_fec_mii_write;
 
-	ret = of_address_to_resource(ofdev->dev.of_node, 0, &res);
-	if (ret)
+	res = platform_get_resource(ofdev, 0, IORESOURCE_MEM);
+	if (!res) {
+		ret = -ENODEV;
 		goto out_res;
+	}
 
-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res.start);
+	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res->start);
 
-	fec->fecp = ioremap(res.start, resource_size(&res));
+	fec->fecp = ioremap(res->start, resource_size(res));
 	if (!fec->fecp) {
 		ret = -ENOMEM;
 		goto out_fec;
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6663c1768089..2a10486bc1f0 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3560,7 +3560,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	struct net_device *dev = NULL;
 	struct ucc_geth_private *ugeth = NULL;
 	struct ucc_geth_info *ug_info;
-	struct resource res;
+	struct resource *res;
 	int err, ucc_num, max_speed = 0;
 	const unsigned int *prop;
 	phy_interface_t phy_interface;
@@ -3605,12 +3605,12 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	if (err)
 		return err;
 
-	err = of_address_to_resource(np, 0, &res);
-	if (err)
-		return err;
+	res = platform_get_resource(ofdev 0, IORESOURCE_MEM);
+	if (!res)
+		return -ENODEV;
 
-	ug_info->uf_info.regs = res.start;
-	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
+	ug_info->uf_info.regs = res->start;
+	ug_info->uf_info.irq = platform_get_irq(ofdev, 0);
 
 	ug_info->phy_node = of_parse_phandle(np, "phy-handle", 0);
 	if (!ug_info->phy_node && of_phy_is_fixed_link(np)) {
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 1fb285fa0bdb..0da7084b80c4 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5511,7 +5511,7 @@ static int mvneta_probe(struct platform_device *pdev)
 		pp->neta_ac5 = true;
 	}
 
-	dev->irq = irq_of_parse_and_map(dn, 0);
+	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq == 0)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/moxa/moxart_ether.c b/drivers/net/ethernet/moxa/moxart_ether.c
index 8bd60168624a..f995591dc43b 100644
--- a/drivers/net/ethernet/moxa/moxart_ether.c
+++ b/drivers/net/ethernet/moxa/moxart_ether.c
@@ -465,9 +465,9 @@ static int moxart_mac_probe(struct platform_device *pdev)
 	if (!ndev)
 		return -ENOMEM;
 
-	irq = irq_of_parse_and_map(node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
-		netdev_err(ndev, "irq_of_parse_and_map failed\n");
+		netdev_err(ndev, "platform_get_irq failed\n");
 		ret = -EINVAL;
 		goto irq_map_fail;
 	}
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index 2eccc7617507..4118e35b99e5 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	/* Get the SXGBE common INT information */
-	priv->irq  = irq_of_parse_and_map(node, 0);
+	priv->irq = platform_get_irq(pdev, 0);
 	if (priv->irq <= 0) {
 		dev_err(dev, "sxgbe common irq parsing failed\n");
 		goto err_drv_remove;
@@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 
 	/* Get the TX/RX IRQ numbers */
 	for (i = 0, chan = 1; i < SXGBE_TX_QUEUES; i++) {
-		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
+		priv->txq[i]->irq_no = platform_get_irq(pdev, chan++);
 		if (priv->txq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe tx irq parsing failed\n");
 			goto err_tx_irq_unmap;
@@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
-		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
+		priv->rxq[i]->irq_no = platform_get_irq(pdev, chan++);
 		if (priv->rxq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe rx irq parsing failed\n");
 			goto err_rx_irq_unmap;
 		}
 	}
 
-	priv->lpi_irq = irq_of_parse_and_map(node, chan);
+	priv->lpi_irq = platform_get_irq(pdev, chan);
 	if (priv->lpi_irq <= 0) {
 		dev_err(dev, "sxgbe lpi irq parsing failed\n");
 		goto err_rx_irq_unmap;
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index 894911f3d560..f079242c33e2 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -1127,7 +1127,7 @@ static int rhine_init_one_platform(struct platform_device *pdev)
 	if (IS_ERR(ioaddr))
 		return PTR_ERR(ioaddr);
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (!irq)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index dd4a07c97eee..4aac9599c14d 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -2950,7 +2950,7 @@ static int velocity_platform_probe(struct platform_device *pdev)
 	if (!info)
 		return -EINVAL;
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
 	if (!irq)
 		return -EINVAL;
 
diff --git a/drivers/net/ethernet/xilinx/ll_temac_mdio.c b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
index 07a9fb49eda1..4bc5d47ecb7e 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_mdio.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
@@ -69,7 +69,7 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
 	u32 bus_hz;
 	int clk_div;
 	int rc;
-	struct resource res;
+	struct resource *res;
 
 	/* Get MDIO bus frequency (if specified) */
 	bus_hz = 0;
@@ -98,9 +98,9 @@ int temac_mdio_setup(struct temac_local *lp, struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (np) {
-		of_address_to_resource(np, 0, &res);
+		res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
-			 (unsigned long long)res.start);
+			 (unsigned long long)res->start);
 	} else if (pdata) {
 		snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
 			 pdata->mdio_bus_id);
diff --git a/drivers/net/mdio/mdio-mux-mmioreg.c b/drivers/net/mdio/mdio-mux-mmioreg.c
index 9c4b1efd0d53..b5a65a1ab406 100644
--- a/drivers/net/mdio/mdio-mux-mmioreg.c
+++ b/drivers/net/mdio/mdio-mux-mmioreg.c
@@ -98,7 +98,7 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct mdio_mux_mmioreg_state *s;
-	struct resource res;
+	struct resource *res;
 	const __be32 *iprop;
 	int len, ret;
 
@@ -108,13 +108,15 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 	if (!s)
 		return -ENOMEM;
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "could not obtain memory map for node %pOF\n", np);
-	s->phys = res.start;
+	res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
+	if (!res) {
+		dev_err(&pdev->dev,
+			"could not obtain memory map for node %pOF\n", np);
+		return -ENODEV;
+	}
+	s->phys = res->start;
 
-	s->iosize = resource_size(&res);
+	s->iosize = resource_size(res);
 	if (s->iosize != sizeof(uint8_t) &&
 	    s->iosize != sizeof(uint16_t) &&
 	    s->iosize != sizeof(uint32_t))
diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index f999798a5612..414a9d22da5e 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1118,7 +1118,7 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 	struct ucc_hdlc_private *uhdlc_priv = NULL;
 	struct ucc_tdm_info *ut_info;
 	struct ucc_tdm *utdm = NULL;
-	struct resource res;
+	struct resource *res;
 	struct net_device *dev;
 	hdlc_device *hdlc;
 	int ucc_num;
@@ -1170,12 +1170,12 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
+	res = platform_get_resource(pdev, 0, IORESOURCE_MEM);
+	if (!res)
 		return -EINVAL;
 
-	ut_info->uf_info.regs = res.start;
-	ut_info->uf_info.irq = irq_of_parse_and_map(np, 0);
+	ut_info->uf_info.regs = res->start;
+	ut_info->uf_info.irq = platform_get_irq(pdev, 0);
 
 	uhdlc_priv = kzalloc(sizeof(*uhdlc_priv), GFP_KERNEL);
 	if (!uhdlc_priv)
-- 
2.47.0


