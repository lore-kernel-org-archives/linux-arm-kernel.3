Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858D7CC6B26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aRgEdiuLM67e5NxG8ScP4ZjaeN0AlrFtrVyhfl7tkQ=; b=k6pISUuaXPdp3HW7qDUccZ0Mhd
	IgYOGUQurNsSGv5jjKxf3x6dVRgfzp7Zt++hyR62IiMC+FuOijyhHyzS9U7ajAmVUVMgcKbe08yy4
	/I5DWPcTOta2RYlaM+C6EpR1Omihy+JaXepFKw/H3k4grj4g8sWkOmK34D6li6S4Hj8R157vq+cbp
	n7bAwx+jmz3al3JxxDCpOybMyp8ooJ848AtMsvwcjcG5sFgbUbufviV85rHmPZ2BXhSvcRHIeIIEs
	kglB5JkZdmIoWo/p/1nth25ljyj+mr1kbjxcd5YrIrPia4roalxtLG1tQCgqGP4d6prvtP+UIX9Sw
	xTeCrllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKg-0000000Ejai-1nK8;
	Wed, 14 Oct 2026 07:23:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKS-0000000EjLX-0dD5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3663605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962590; x=1792567390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aRgEdiuLM67e5NxG8ScP4ZjaeN0AlrFtrVyhfl7tkQ=;
        b=UxofLsBLA4Fk8462JVhSJolmMetVvE2+3bJZryc64BPLu6xHf/PbdFEOgJU/kOy3Sh
         tDrOv4oG4uSeDzbIWUCMVyfl58ugXLdHZ+gUtT7JNYMJqx53ikBMgxIHXiduhFZwMvtg
         NQQMta8Q5zGL/he/KHC/YlrLOHHuM03sClus7wrgycjijG0kFjVuzJOwzWZWXM8hEDB3
         d+2B3xIiZCc9pSIMhq+QJR9FNg+HTQgqBUYAd9DJUOONuLz/4JL0tzFAn83Q4/hu7ZJT
         T0+UfgMAXswHGBzRn586gpQJtrQ9yM2xGrK1IJRbrXeDmethsPab9VDFbdOlFBGUkcDk
         4u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962590; x=1792567390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aRgEdiuLM67e5NxG8ScP4ZjaeN0AlrFtrVyhfl7tkQ=;
        b=hNJtGVvuaJLMVnxE1xHf0lJ+L/RxId1U3OMCizzQmHr7+yIC6KI+15M6Qe2m21J6vu
         yzXO0rpQr6lbnmJeLywdX004hTMfo8vGX48LuRDpi+K2dJZMDNfdt84TL/z1r6wWIq75
         xCNSql1/hhTEBm1xEM7Ylm5e7/qlB+0myipiUtr/DJAm6MnYqQaBSk9RIysQF3kzir7t
         Snffk/RiEtdUx1VVQT1GW5k1QThNlQbVDzb+9b7fwpVvcfaBUK0V4giKMD5Bg4S48+hJ
         uLkLlEZWgGs/0WBDzJ4gnG0pk8vXGowu+He5KZMgmJ4uk56/97sbPw/zt2weavkk2jrV
         Nj5Q==
X-Gm-Message-State: AFq9FYJcNzgXmy71gzr7XmnDmjH8IM9tLH4R+NV6Y2kGOuBQk3m+Uque
	Dy5m59pGyiM4qEcbPP9ZS94kj5riwZ2SbJdKMr9Yxkgy1WzNnH2h+M0HuOyeVkykZBOZQA==
X-Gm-Gg: AYBFou0SwOMCsXUHXhsk/OB0LXUEaXRNJTD8sQuwRYilvR83K3rNEIufrhQx3TqmGYE
	azRCndQ1/DOC1Vh4ZZF4U4cUL7qdsvTtNRi6dqWPygl3QyOi6A3A2nwWJanIEyHNXDx9Md6ZURA
	xh2phWZjUD6yQe1/mAf/KQ3L9XTVN9L6CFpJ7bhQUuGmx6YfdwliuBPyZqTg5rabDf5KHpvr5Uw
	YUJMCmIEs64OeHeRds/Iyxh8Vj3W6rLx2aeQI8IyPfyG8FGmKQgk3YjUmLZ3J+UgGIL1xypa6cf
	HbZl942AbWQ5pEwmQJidOWWdX09AZ+K0g4V+baeEfpGyhLgLCdJzqKJZwnsVflRtF+OcvGpW9I1
	j3IoVjxwu7S7uy/YS/80JhT/a8EUEzDNT3pQnG2TAmfSz9mPOjqNJZXq8nPicW0AE14xM3ucX3z
	MARmHn7yEKDNTYA1a0NOA2N8E9k6uyijFkHQlgdK4sdlFZ4in6hZ7HsHOXotbTuUCCzr0HKQkuX
	0fQVwxc+Fpm1HmaL36hEb6RFSYkkoguFDg2JIo8adZe5oPmPtq8OZSy64KhzWCQXG9eeVyig8XE
	3bK8LykQF6G7eqHdP2phOhUdz527tS5zxN/vJDUCQ6tNJUYhlA8G/J8st+HC2Q==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id 5b1f17b1804b1-4a18e4b15e5mr292084425e9.35.1791962590141;
        Wed, 14 Oct 2026 00:23:10 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:09 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Wed, 14 Oct 2026 08:20:56 +0100
Message-ID: <20261014072109.1759502-17-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002312_227461_4D00FE99 
X-CRM114-Status: GOOD (  23.27  )
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

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/phy/Kconfig     |   8 ++
 drivers/net/phy/Makefile    |   1 +
 drivers/net/phy/sanechips.c | 152 ++++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
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
index 0000000000..92d6388f7d
--- /dev/null
+++ b/drivers/net/phy/sanechips.c
@@ -0,0 +1,152 @@
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


