Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75213CA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mcYJeikhf+1cs7oxJAYDuJWMVU6PVHgHphuyMhrcPo=; b=TsYeyQAYKNNPmCd0GOnPbuQ/fN
	Rci0ZuT4JtHA0CaNjS5EXtUO5Ga3o9GiFl6anwscrm2k8GKbFZGUb8DyBrdLemWiLe3E/3vUa/cKH
	m5kzFcIEZxI7psKSez0k5oojjdso/XILFDI1VIKEek3DcOBHb4GrvRsXOTu1nhiKDDZvm8cBJp+9r
	j5J5L1lgwz+yu/zP8JTo17C0Uzet3D7zTvGIKGyaNz+4zflXmrGQwFrQYkqVTBoOCSpBjWK23AES/
	2PDPreBlPLuE3wlOlFkpQVPQF7Ju/nBH0tkL1h8b/pxb3+SUozDquDiTJigFaW+BuvMVPt6JsPLXw
	Jo7wr73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhd-0000000844h-1VWW;
	Sat, 10 Oct 2026 13:01:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgw-000000083L5-2Cs6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4956869750eso4450995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637245; x=1792242045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mcYJeikhf+1cs7oxJAYDuJWMVU6PVHgHphuyMhrcPo=;
        b=XhKeBojZnXJwX7h74vcRMO9ci4WYaXx1sBR4ByjXBssPGccY2tkh1G1+V3ignpFSZS
         VqS2VrTpZmHSHKqW5OWZjja9bFh1cfbE0D6UnWh2pJa+KSTnn3gLKc23yMqu1kMvogn0
         QGGuxT0LRM8GUPbR0mn84tw94klEs5Lj3YnTOEUGIFrZGO22AIYyGMmSliM+/HRCPysZ
         +0KIpO1igPLrbcFgocpApZVbBAdFw10whoMqK2XpYVZ/tMByKXvNvAaRdUiQZL3ohHH1
         vQ2vEGov4Pl6fHoBEj1eluFIIJkswjxq8+YCc7DuF2yelIdkwupfKoay3BPn32W1S0WM
         ZTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637245; x=1792242045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mcYJeikhf+1cs7oxJAYDuJWMVU6PVHgHphuyMhrcPo=;
        b=ENaF659H1RxsqkEqCmEEsLq6BGEQFO9jkjNB+LqHR+jF0zg8c00M0KfOS4KCQdWGxX
         uugOvmyhrpCydr8IG7xhfye/3MtRrCb2EWPcZ23xti8I5giLOH8aF/kh6pdRGP1JpJ5S
         CtxXIM8XHiY+eNnzk9fS6YjSBbC1anbyg0mjlDrFtOYGsNvfWOnBSHHke/2IdbFcDt7Q
         RutVI3hZFC/NwMRXK99CXnYH08ZXRIr92onRZK4F40eNpAiX/leFJDEerDU2Paz+FZ/R
         HP/z3zY6oS6kwbgxwiWgtncAUc3WCSbUUw7LVSt5nVPWfEgLYe9CuHL6nzmwts+NHYme
         jppQ==
X-Gm-Message-State: AFq9FYKnj3diwM9D7SYPN+MkitD9DnR4NIrobgsu4xyjz4L1HyT9LALq
	zB83Kcgl9g0B90PkjAGsFLrtX1Kd/tsME0HL5R+AuqYX+qrofziznq2fJBxf/WhtfmMnjA==
X-Gm-Gg: AYBFou1jB/fVmCqeApkEm4LLqLw1JPQQQpqmPBekt45/j41536DxW4zFj5oXt8dBE/S
	uidchF5+KhU0NdCiRJ2EH+J3Kt6Tsj63WmycH9pxMl3T7K1Lz2WGm3zCV+xYtSxmDsGu5g+5Q5Q
	C39Vp184FK72kQYA5s/hgEjIaoBG7VjOHGki8lVW0zk6jPXSdo1nMgpv+tumtM+fzoNwwKmIwt8
	t1Xt03prJqlAfxGvC+99tv6YROP1TRkyzlyFkZfwooR7Hyh7y1GmXeBvDLm12zQnTqXfu/9iQD4
	YxZYvzQV9sfbfg7NhTQylaKlHNE6efbF52QgT6eLK2zpuKnV5HseedCwOLb3l3679mO1A2LI5HY
	fFuXoE14EGJ+aZFzgHvD3XJuu7qiiXTwJXx6ympT+NK2L5nUACcUWNy8wbe7cVrfNNRTHbk+IKS
	pfEwLDrRAmYSCtM8eFXRia/o4MYrSDbPTWYQR9Bl+FuSvea8ExlKX3w0mTBIAv+zhTza+1Cc3pH
	MAlUPVnFZia2k5hw/rw18HhAyCtTLAlbjp5MzExv2audO3/RT0NwHYJ1IGHenopQ0EemVSc3tYv
	bK5xQVV6/nMeSYo5y3SeJqvQHVuOpPIkK9/9ABQpX+alnYVjSnN6epv4z8mmkA==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr88467255e9.33.1791637244608;
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Sat, 10 Oct 2026 13:59:54 +0100
Message-ID: <20261010130024.177503-17-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060046_597307_90B6B0BC 
X-CRM114-Status: GOOD (  22.65  )
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

Initialize the external WAN PHY and its SerDes path; generic PHY support
handles negotiation.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/phy/Kconfig     |   8 ++
 drivers/net/phy/Makefile    |   1 +
 drivers/net/phy/sanechips.c | 153 ++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/net/phy/sanechips.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index b4ef927fd4..63620fdfc4 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -416,6 +416,14 @@ config ROCKCHIP_PHY
 	help
 	  Currently supports the integrated Ethernet PHY.
 
+config SANECHIPS_PHY
+	tristate "Sanechips Ethernet PHYs"
+	help
+	  Currently supports the Sanechips ZX5201 PHY, which the ZTE ZXHN
+	  H3600 uses for its WAN port. The driver sets the PHY up so that
+	  its SerDes interface passes traffic; everything else is handled
+	  by the generic PHY code.
+
 config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 25c4a3c242..666309f7d0 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_QSEMI_PHY)		+= qsemi.o
 obj-$(CONFIG_REALTEK_PHY)	+= realtek/
 obj-$(CONFIG_RENESAS_PHY)	+= uPD60620.o
 obj-$(CONFIG_ROCKCHIP_PHY)	+= rockchip.o
+obj-$(CONFIG_SANECHIPS_PHY)	+= sanechips.o
 obj-$(CONFIG_SMSC_PHY)		+= smsc.o
 obj-$(CONFIG_STE10XP)		+= ste10Xp.o
 obj-$(CONFIG_TERANETICS_PHY)	+= teranetics.o
diff --git a/drivers/net/phy/sanechips.c b/drivers/net/phy/sanechips.c
new file mode 100644
index 0000000000..bb5129b2bb
--- /dev/null
+++ b/drivers/net/phy/sanechips.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sanechips ZX5201 Ethernet PHY
+ *
+ * The ZX5201 answers on two MDIO addresses: the copper PHY on its own
+ * address and its MAC-side SerDes interface on the next one. The copper PHY
+ * uses the standard registers and the generic PHY code; this driver only adds
+ * the setup that the PHY needs before it passes traffic. The values come from
+ * the vendor firmware of the ZTE ZXHN H3600, and most of them are not
+ * documented.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/phy.h>
+
+#define PHY_ID_ZX5201		0x84b95011
+
+/* Copper PHY vendor registers */
+#define ZX5201_REG18		18
+#define ZX5201_EXT_ADDR		16	/* extended register access: address */
+#define ZX5201_EXT_DATA		17	/* extended register access: data */
+#define ZX5201_REG29		29
+
+/*
+ * SerDes interface registers, at the PHY's MDIO address + 1. The names are
+ * a best guess from the way the vendor firmware uses them.
+ */
+#define ZX5201_SDS_WDATA_LO	16
+#define ZX5201_SDS_WDATA_HI	17
+#define ZX5201_SDS_CMD		18
+#define ZX5201_SDS_RDATA_LO	20
+#define ZX5201_SDS_RDATA_HI	21
+#define ZX5201_SDS_REG22	22
+#define ZX5201_SDS_REG27	27
+
+static int zx5201_sds_read(struct phy_device *phydev, u32 regnum)
+{
+	return mdiobus_read(phydev->mdio.bus, phydev->mdio.addr + 1, regnum);
+}
+
+static int zx5201_sds_write(struct phy_device *phydev, u32 regnum, u16 val)
+{
+	return mdiobus_write(phydev->mdio.bus, phydev->mdio.addr + 1, regnum,
+			     val);
+}
+
+static int zx5201_ext_write(struct phy_device *phydev, u16 reg, u16 val)
+{
+	int ret;
+
+	ret = phy_write(phydev, ZX5201_EXT_ADDR, reg);
+	if (ret)
+		return ret;
+
+	return phy_write(phydev, ZX5201_EXT_DATA, val);
+}
+
+static int zx5201_config_init(struct phy_device *phydev)
+{
+	static const u16 led_regs[] = { 0xb409, 0xb407, 0xb406, 0xb408 };
+	int ret, lo, hi, i;
+
+	ret = phy_write(phydev, ZX5201_REG18, 0x8402);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG22, 0x0a0f);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG27, 0x0800);
+	if (ret)
+		return ret;
+
+	ret = phy_write(phydev, ZX5201_REG29, 0x0355);
+	if (ret)
+		return ret;
+
+	ret = zx5201_ext_write(phydev, 0xb62d, 0x0006);
+	if (ret)
+		return ret;
+
+	/*
+	 * This looks like an indirect read-modify-write of SerDes register 4:
+	 * read it, set bits 9-13 of its high half (bits 25-29 of the register)
+	 * to 0b10100, and write it back.
+	 */
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_CMD, 0x0004);
+	if (ret)
+		return ret;
+
+	hi = zx5201_sds_read(phydev, ZX5201_SDS_RDATA_HI);
+	if (hi < 0)
+		return hi;
+
+	lo = zx5201_sds_read(phydev, ZX5201_SDS_RDATA_LO);
+	if (lo < 0)
+		return lo;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_WDATA_HI,
+			       (hi & 0xc1ff) | 0x2800);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_WDATA_LO, lo);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_CMD, 0x0204);
+	if (ret)
+		return ret;
+
+	ret = zx5201_sds_read(phydev, ZX5201_SDS_REG22);
+	if (ret < 0)
+		return ret;
+
+	ret = zx5201_sds_write(phydev, ZX5201_SDS_REG22, (ret & 0xfff3) | 0x0004);
+	if (ret)
+		return ret;
+
+	/* LED control registers, all cleared as the vendor firmware does */
+	for (i = 0; i < ARRAY_SIZE(led_regs); i++) {
+		ret = zx5201_ext_write(phydev, led_regs[i], 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct phy_driver sanechips_phy_driver[] = {
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_ZX5201),
+		.name		= "Sanechips ZX5201",
+		.config_init	= zx5201_config_init,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
+	},
+};
+module_phy_driver(sanechips_phy_driver);
+
+static const struct mdio_device_id __maybe_unused sanechips_phy_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(PHY_ID_ZX5201) },
+	{ }
+};
+MODULE_DEVICE_TABLE(mdio, sanechips_phy_tbl);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("Sanechips Ethernet PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


