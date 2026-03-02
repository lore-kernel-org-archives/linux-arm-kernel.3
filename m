Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B6EA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Mom/fwmQMpeqJbPffCG6eZTIeRFvYd0WKUM/yKqmt8=; b=dkzvqkl15HYo8samcgSVVc0Lle
	ZtHcje0bgXsvdy8Vw69WW7gOKch85oJ3qq4vZSel5IOo1bO3Mayk7F4ZWMxouFXYWMXgzbeMkrK6d
	7y5SygPCRXp0jCDzisG8yXr+vvDZnTlhZMAlVOkxzJMnj+0Sat2z/WpzTltdPxh+CU26YIx59WN9U
	G2BZNgEUJz+44nz/Gu95MepGa/lnCtZ+3Vl3rMuHjsQnJhmm9LIiZEl/ER41OFOuRvPN0F9g4s9Bl
	DnnYBhdFMmLDIYWy4W3GfA175WL7U+ZKqBekA4Wr98viWSv+JfaL734hHtrXc7o6Dtn1f1pYtrjR6
	KGYbkD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4WB-0000000DGBD-1zKs;
	Mon, 02 Mar 2026 14:45:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4W8-0000000DGAg-3RUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CC6043A6D;
	Mon,  2 Mar 2026 14:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEEFC19423;
	Mon,  2 Mar 2026 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462703;
	bh=Nx8e9ImpKfl1Xmp/jb3AnFN0qerg/qMataBRWy7eFoY=;
	h=From:To:Cc:Subject:Date:From;
	b=NfjNxJe80eSbLMNI+9ecgLfrvkFcjT2UW5TdK9TbnzYeJC3jjDq1V2E40XiEu1mtB
	 jO0FM8ttExBsrkESGAgpfJr0xUYLEDT/lEi6992skVT+oCsHb4YNnilAxcZ8VW+9Tj
	 1MhLdtXO34adjm65as9fs7iZPi1tpqJM2yKqJsB+aA0jKW3KwipaY1Ri+40HhEuLax
	 1h7hYSin9yt4tBns/FQR0EUujDjsnG8wWxhfaqeugIS3FGq6MflILnZCKQCCshbeHv
	 owIsIEc/HPKIhm47ZyHX8JAf24x1fnIN6VmKgW+gx2Y3Uga7or0TEq0Dhx2MpfNWs9
	 1QLx9905kAvTg==
Received: by wens.tw (Postfix, from userid 1000)
	id 996B05FCAC; Mon, 02 Mar 2026 22:45:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: Handle PHY reset during initial PHY ID read
Date: Mon,  2 Mar 2026 22:44:57 +0800
Message-ID: <20260302144458.3180702-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_064504_897492_2B9C99D3 
X-CRM114-Status: GOOD (  28.35  )
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

The mdio device core handles reset GPIOs and controls for PHYs and
MDIOs after the MDIO or PHY device is created. However this does not
cover the initial PHY ID read _before_ the PHY device is created, since
the PHY ID is needed for the PHY device. This causes PHY devices that
have reset GPIOs or controls to not work after a reboot if the GPIO
is left in the reset state; neither will it work if the reset GPIO is
by default (for example, missing a pull-up) in the reset state.

One possible workaround is to place the reset GPIO or control property
under the MDIO bus instead of under the PHY. However the common PHY
device tree bindings already allow a reset for the PHY, so we should
make some effort to support this.

Rework get_phy_device() to allow passing in a fwnode handle for the PHY
device, and use the handle to acquire the reset GPIO, control and delay
timings for it. Before reading the PHY ID, deassert the reset. This
reworked version is renamed to fwnode_get_phy_device(), with
get_phy_device() calling the new version.

Use this new version in fwnode_mdiobus_register_phy() so that PHY reset
is handled. This allows the reset GPIO and reset control in the common
Ethernet PHY device tree to be correctly handled without any gotchas.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
This work was the result of Russell mentioning [1] that placing the
reset GPIO under the PHY node in the device tree might result in it
not working.

I also talked about this at Plumbers in Tokyo last year during the
Device Tree MC. There a few people mentioned that MDIO reset handling
has been a pain point.

[1] https://lore.kernel.org/linux-sunxi/aJy_qUbmqoOG-GBC@shell.armlinux.org.uk/

 drivers/net/mdio/fwnode_mdio.c |  2 +-
 drivers/net/phy/phy_device.c   | 47 +++++++++++++++++++++++++++++++---
 include/linux/phy.h            | 10 +++++++-
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
index ba7091518265..f62a48583404 100644
--- a/drivers/net/mdio/fwnode_mdio.c
+++ b/drivers/net/mdio/fwnode_mdio.c
@@ -130,7 +130,7 @@ int fwnode_mdiobus_register_phy(struct mii_bus *bus,
 
 	is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
 	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
-		phy = get_phy_device(bus, addr, is_c45);
+		phy = fwnode_get_phy_device(bus, addr, child, is_c45);
 	else
 		phy = phy_device_create(bus, addr, phy_id, 0, NULL);
 	if (IS_ERR(phy)) {
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 3bd415710bf3..62304fcacc7b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -34,6 +35,7 @@
 #include <linux/pse-pd/pse.h>
 #include <linux/property.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/reset.h>
 #include <linux/rtnetlink.h>
 #include <linux/sfp.h>
 #include <linux/skbuff.h>
@@ -1050,14 +1052,17 @@ int fwnode_get_phy_id(struct fwnode_handle *fwnode, u32 *phy_id)
 EXPORT_SYMBOL(fwnode_get_phy_id);
 
 /**
- * get_phy_device - reads the specified PHY device and returns its @phy_device
- *		    struct
+ * fwnode_get_phy_device - reads the specified PHY device and returns its
+ *			   @phy_device struct
  * @bus: the target MII bus
  * @addr: PHY address on the MII bus
+ * @fwnode: PHY fwnode handle
  * @is_c45: If true the PHY uses the 802.3 clause 45 protocol
  *
  * Probe for a PHY at @addr on @bus.
  *
+ * Transparently handle any reset GPIOs.
+ *
  * When probing for a clause 22 PHY, then read the ID registers. If we find
  * a valid ID, allocate and return a &struct phy_device.
  *
@@ -1068,21 +1073,55 @@ EXPORT_SYMBOL(fwnode_get_phy_id);
  * Returns an allocated &struct phy_device on success, %-ENODEV if there is
  * no PHY present, or %-EIO on bus access error.
  */
-struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45)
+struct phy_device *fwnode_get_phy_device(struct mii_bus *bus, int addr,
+					 struct fwnode_handle *fwnode, bool is_c45)
 {
 	struct phy_c45_device_ids c45_ids;
+	struct gpio_desc *gpiod = NULL;
+	struct reset_control *rstc = NULL;
 	u32 phy_id = 0;
+	u32 delay = 0;
 	int r;
 
 	c45_ids.devices_in_package = 0;
 	c45_ids.mmds_present = 0;
 	memset(c45_ids.device_ids, 0xff, sizeof(c45_ids.device_ids));
 
+	if (fwnode) {
+		/* Deassert the optional reset signal */
+		gpiod = fwnode_gpiod_get_index(fwnode, "reset", 0,
+					       GPIOD_OUT_LOW, "PHY reset");
+		if (IS_ERR(gpiod)) {
+			if (PTR_ERR(gpiod) == -ENOENT)
+				gpiod = NULL;
+			else if (PTR_ERR(gpiod) == -ENOSYS)
+				gpiod = NULL;
+			else
+				return ERR_CAST(gpiod);
+		}
+
+		if (is_of_node(fwnode)) {
+			rstc = of_reset_control_get_optional_exclusive(to_of_node(fwnode), "phy");
+			if (IS_ERR(rstc))
+				return ERR_CAST(rstc);
+			reset_control_deassert(rstc);
+		}
+
+		/* Wait for PHY to come out of reset if needed */
+		if (!fwnode_property_read_u32(fwnode, "reset-deassert-us", &delay))
+			fsleep(delay);
+	}
+
 	if (is_c45)
 		r = get_phy_c45_ids(bus, addr, &c45_ids);
 	else
 		r = get_phy_c22_id(bus, addr, &phy_id);
 
+	if (!IS_ERR_OR_NULL(rstc))
+		reset_control_put(rstc);
+	if (!IS_ERR_OR_NULL(gpiod))
+		gpiod_put(gpiod);
+
 	if (r)
 		return ERR_PTR(r);
 
@@ -1100,7 +1139,7 @@ struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45)
 
 	return phy_device_create(bus, addr, phy_id, is_c45, &c45_ids);
 }
-EXPORT_SYMBOL(get_phy_device);
+EXPORT_SYMBOL(fwnode_get_phy_device);
 
 /**
  * phy_device_register - Register the phy device on the MDIO bus
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 6f9979a26892..3bd3bbc1b281 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2142,7 +2142,15 @@ int fwnode_get_phy_id(struct fwnode_handle *fwnode, u32 *phy_id);
 struct mdio_device *fwnode_mdio_find_device(struct fwnode_handle *fwnode);
 struct phy_device *fwnode_phy_find_device(struct fwnode_handle *phy_fwnode);
 struct fwnode_handle *fwnode_get_phy_node(const struct fwnode_handle *fwnode);
-struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45);
+struct phy_device *fwnode_get_phy_device(struct mii_bus *bus, int addr,
+					 struct fwnode_handle *fwnode, bool is_c45);
+
+static inline
+struct phy_device *get_phy_device(struct mii_bus *bus, int addr, bool is_c45)
+{
+	return fwnode_get_phy_device(bus, addr, NULL, is_c45);
+}
+
 int phy_device_register(struct phy_device *phy);
 void phy_device_free(struct phy_device *phydev);
 void phy_device_remove(struct phy_device *phydev);
-- 
2.47.3


