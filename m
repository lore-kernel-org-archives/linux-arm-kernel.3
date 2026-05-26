Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF3CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1BZk2y1KGNMX+ccHuEp6KWVVbr1Nr9TPnS/MltAXFTI=; b=sFX97ESCoEb4Ta5wf6n+WY/fg3
	lVq6WmIRfZBEpeD0Vf6ZcWoZPhbvFiAJoInlYPQ1sx0gb2rp8PNYQ/C0WVOowtCR24LXs4lA98B7J
	5MUF0RZcw1W706KqQJMvqgsnUoSPdBUhkMlgmq0lvqBqPXlBg0wasu1jkdwd9kLLtUEAwfHn1OcER
	k02RkLb/bPH3Q37M/01HMA/A3guJxhP4Eo5dPmX7k7xVCaoijoG1KDSpdnmsYP1Wrw79JHdXkpcfn
	BT8rVMZplHHNwfa2kEDb4S4q8jhPIN/xRtYhyC0YyS4BDxX0R7sSPZy1Ah3CDRpTwYpXkJxv+W7Qg
	tIX3Ngjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp0n-00000001eFn-07vi;
	Tue, 26 May 2026 10:27:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp0k-00000001eEi-2t1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:27:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29A4444425;
	Tue, 26 May 2026 10:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9501F00A3A;
	Tue, 26 May 2026 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791265;
	bh=1BZk2y1KGNMX+ccHuEp6KWVVbr1Nr9TPnS/MltAXFTI=;
	h=From:To:Cc:Subject:Date;
	b=SyKKdCFN9GuMHt9XiHa/sVOfiYznVkXy51REaRbImzrnSeusFP4ZZH97TCZI3bhYy
	 NwMHKfeb0ufokz91E2VRVvKNojYtjNC8ITkf/cnzS4JRbSxd7wOHXOJpcNn0EvAjj1
	 e21iIdzG7x7CI9kmYC7lZbegajNZQ51RTPQRduko3ZU4/TykQb7lgfvSgvD7e6y7FS
	 XjFBFL+ZPlW6Ohwrg3X9cTyFUK68gsu9FpyfK9LRg5JNHn7AjcpdRnLpAfKk5cBfIR
	 pteTvV+A7+zqTXBjlwvNwaLfmH5daveHG2uIYkaa0ZB+U+ATPGHKpHSIppjn/dwzYs
	 qmBmaC1iWrt0Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Wei Fang <wei.fang@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] [net-next] net: dsa: netc: fix enetc dependencies
Date: Tue, 26 May 2026 12:26:37 +0200
Message-Id: <20260526102708.2837129-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_032746_860649_CBDA64D6 
X-CRM114-Status: GOOD (  13.92  )
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added netc dsa support has incorrect Kconfig dependencies,
leading to Kconfig and link failures:

WARNING: unmet direct dependencies detected for FSL_ENETC_MDIO
  Depends on [n]: NETDEVICES [=y] && ETHERNET [=n] && NET_VENDOR_FREESCALE [=n] && PCI [=y] && PHYLIB [=y]
  Selected by [y]:
  - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]
WARNING: unmet direct dependencies detected for NXP_NTMP
  Depends on [n]: NETDEVICES [=y] && ETHERNET [=n] && NET_VENDOR_FREESCALE [=n]
  Selected by [m]:
  - NET_DSA_NETC_SWITCH [=m] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=m] && PCI [=y]
ERROR: modpost: "enetc_mdio_read_c22" [drivers/net/dsa/netc/nxp-netc-switch.ko] undefined!
ERROR: modpost: "ntmp_fdbt_delete_entry" [drivers/net/dsa/netc/nxp-netc-switch.ko] undefined!
ERROR: modpost: "enetc_mdio_read_c45" [drivers/net/dsa/netc/nxp-netc-switch.ko] undefined!

Add the required 'NET_VENDOR_FREESCALE' dependency to make it possible
to select both the PHY and NTMP library modules. Originally this was
meant to be done through an 'IS_REACHABLE' check in the header file,
but that did not work because the drivers/net/ethernet/freescale
directory is not even entered in this case. IS_REACHABLE() is generally
counterproductive because even when it works as intended, it turns
a helpful link-time error into a silent runtime failure that is
harder to debug. In this case, it clearly did not even do anything.

Fixes: 187fbae024c8 ("net: dsa: netc: introduce NXP NETC switch driver for i.MX94")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/dsa/netc/Kconfig   |  1 +
 include/linux/fsl/enetc_mdio.h | 22 ----------------------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/net/dsa/netc/Kconfig b/drivers/net/dsa/netc/Kconfig
index d2f78d74ac23..eaad3cb5babe 100644
--- a/drivers/net/dsa/netc/Kconfig
+++ b/drivers/net/dsa/netc/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NET_DSA_NETC_SWITCH
 	tristate "NXP NETC Ethernet switch support"
+	depends on NET_VENDOR_FREESCALE
 	depends on ARM64 || COMPILE_TEST
 	depends on NET_DSA && PCI
 	select NET_DSA_TAG_NETC
diff --git a/include/linux/fsl/enetc_mdio.h b/include/linux/fsl/enetc_mdio.h
index 623ccfcbf39c..7cd5be694cc4 100644
--- a/include/linux/fsl/enetc_mdio.h
+++ b/include/linux/fsl/enetc_mdio.h
@@ -35,8 +35,6 @@ struct enetc_mdio_priv {
 	int mdio_base;
 };
 
-#if IS_REACHABLE(CONFIG_FSL_ENETC_MDIO)
-
 int enetc_mdio_read_c22(struct mii_bus *bus, int phy_id, int regnum);
 int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id, int regnum,
 			 u16 value);
@@ -45,24 +43,4 @@ int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id, int devad, int regnum,
 			 u16 value);
 struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs);
 
-#else
-
-static inline int enetc_mdio_read_c22(struct mii_bus *bus, int phy_id,
-				      int regnum)
-{ return -EINVAL; }
-static inline int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id,
-				       int regnum, u16 value)
-{ return -EINVAL; }
-static inline int enetc_mdio_read_c45(struct mii_bus *bus, int phy_id,
-				      int devad, int regnum)
-{ return -EINVAL; }
-static inline int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id,
-				       int devad, int regnum, u16 value)
-{ return -EINVAL; }
-static inline struct enetc_hw *enetc_hw_alloc(struct device *dev,
-					      void __iomem *port_regs)
-{ return ERR_PTR(-EINVAL); }
-
-#endif
-
 #endif
-- 
2.39.5


