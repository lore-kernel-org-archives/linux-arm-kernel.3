Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8A0E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=; b=etz9Wfs5lbexfNGQQoc6+AVHVY
	ibDPWApbivDeZGKYHF2hLbinVTgm/24/eeyLHZEsq73tqt9Xe+MxUd1E8jXBea0lf1lcUTVWSVi3V
	pWYfw3pB5yYmRFaA6KXa+U0IwlY9vHQ9OTpDB//LvZQB+u/Zpi4DddMVmAQpXplWDmZvVXAt/pgCJ
	a52JT+d8vEkBHdTbTiYwCkoY+0ilYxVPNeixL/z2GzZtwXBirXDy7JJ8gEct+d+v85pRICTpHmk6Y
	ZJE+TGeWyZKIQwf4YKsTPjusQNwXt1rJWs9WjwsL5ar3ZeKv9YSVwE/t+V2wXpwd+9SDz3dGVkH5F
	39d2w4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzO5-0000000Es6h-2Ai1;
	Tue, 23 Dec 2025 10:13:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzO3-0000000Es5n-0ccP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:13:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so3206302f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766484781; x=1767089581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=SqQI7K1SUchpgPtsMyb5rcawfnAqGS48UQ153TWI4bx8fZyLLPTwqaPGUSs5ElYaBh
         9SA7gm7pIsx1HGn+qGVyCrv5K5HIT29I2Ev2yc2snJT4NihiBaojQ2cRe5Xoxu5NOknl
         Kr4aIB9AwOm6uko8rKwbt2MXxyfSM4GnCCxwTGrJi7UzIw1KCsqCBuRXZI1pbNrrQb94
         X83XsJTETSeXnuNLyM/CYm5hUr7PN0GQ8RGddV7q6Xx5oG9cy937LUGqNHW/WE+UHD3Y
         ThvR2a2d3kam/5/R3dAu68lvO05mTNfMg3PEvg5PNKK0UFhlE6mpw5EvNeX2dsRBZZ6S
         4ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484781; x=1767089581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=lRC7yC5NP+LdpEl0G1r4bypDXZYb7k9DRmB1A2SIIzp6c8/L2RTAKSbPVFSGDMTwrR
         gIox+ebGGYYwe1ttQhWiTUzS1ooJDDHR6IVJWQX57Pzq52aLVE2bEQbqNUJbYv9quIz5
         z+Sgc0ipDW8AyD6c2qdcgHrXX8soizxZ/o88G9l922pPXs0D6DbI0BamsnaUhv5ItbSE
         3CkueBr5kQQLPCunWCdqT6ejP64OI4jT+rbvR8cfpIFERTT65LL1EHWvedB+zN/kRZUB
         zQDakbR3TLagTA4ZJUcrEmNxTx/ETFeMdwpMlhJTMK+sld3CP/BdgQnnWcwJbh/WYi7d
         fb5A==
X-Forwarded-Encrypted: i=1; AJvYcCXt8c4ihQjMP3KKUcJAnYu8R6KqPY/ag0+NqWMY3I9EfyltToO0L1KR/zlmnffjwr8xF8VI5h4pd5MegF5y3146@lists.infradead.org
X-Gm-Message-State: AOJu0YyXP349avtMZhf+URnJQS6HrqJf05m1B2MeNiqYPIPdws32N9XO
	04mMvu5gJV+4aSH0ZHx3207R+FjVIEMs/QBIOylxeZ1Mh6ii3nTj3Kuc03jaiw==
X-Gm-Gg: AY/fxX5RfNxOZwqxY/Bz29fRkrNms1O8elaGSMq5In/WDCKXSCs+1GDQZ4kGmOL0eAH
	ZhNbPDw2mLL48FlSWbag1Usfvici9+x8lRe3yDFgA3n1jvB/Z3leUQRBwNSsEuTzAsEw01u1JvP
	Nvajvwt30dQPibXm6ftxbbqzSJKfuwxWWY93z3XC2OqFp9FW/H2/hyH89JV0EWFq8oLA1iAu9mZ
	qmicPr+gpokl2qvKLU8I+a7BU5ovjoZF46XWvOyPOXocS5P5Mf2r7cbxdFOS8AG5E2j0ienHnon
	798VxMXjU2YzB0y5mbVo9mc7ZJPUqLYF8xrVMXT31ffIGiXkK5tN2gqlR1UVdV6ZwCcak5qdWnG
	VVMRDuvUeiNc5S9mcXGDwDMM0M0R3QJ5IBqnK6rO+xwQNwALevGHz3gdEuSlwYb93y1Lo9hwS9k
	iCbFd1XjMBcIGS/skn5kIvsmoV2w==
X-Google-Smtp-Source: AGHT+IGF0o0X3T9TPemtGA4iv5QpXYtSLA5891eQonPhGoJJdeHdYF9/vi2taBPYEXsT/bnOH7uFfA==
X-Received: by 2002:a05:6000:188e:b0:430:fb26:3409 with SMTP id ffacd0b85a97d-4324e703d95mr14723855f8f.63.1766484780377;
        Tue, 23 Dec 2025 02:13:00 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:db87:3fd:1ea8:b6eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm26759247f8f.31.2025.12.23.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:13:00 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v2] net: stmmac: dwmac: Add a fixup for the Micrel KSZ9131 PHY
Date: Tue, 23 Dec 2025 11:10:59 +0100
Message-ID: <20251223101240.10634-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021303_281475_E2059FCE 
X-CRM114-Status: GOOD (  22.37  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a fixup to the stmmac driver to keep the preamble before the SFD
(Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
used on an NXP i.MX8MP SoC.

This allows to workaround errata ERR050694 of the NXP i.MX8MP that
states:
ENET_QOS: MAC incorrectly discards the received packets when Preamble
Byte does not precede SFD or SMD.

The bit which disables this feature is not documented in the datasheet
from Micrel, but has been found by NXP and Micrel following this
discussion:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
10MBit. Without bit 2 being set in the remote loopback register, no
packets are received. With the bit set, reception works fine.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v2:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..23bc917d3f0bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/stmmac.h>
+#include <linux/micrel_phy.h>
 
 #include "stmmac_platform.h"
 
@@ -39,6 +40,12 @@
 #define RMII_RESET_SPEED		(0x3 << 14)
 #define CTRL_SPEED_MASK			GENMASK(15, 14)
 
+/* Undocumented bit of the KSZ9131RNX in the remote loopback register to keep
+ * the preamble before sfd. It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
@@ -282,6 +289,30 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	return err;
 }
 
+static int imx8mp_dwmac_phy_micrel_fixup(struct phy_device *phydev)
+{
+	struct device *mdio_bus_dev = phydev->mdio.dev.parent;
+	struct device_node *mac_node;
+
+	if (!mdio_bus_dev || !mdio_bus_dev->parent)
+		return 0;
+
+	mac_node = mdio_bus_dev->parent->of_node;
+	if (!mac_node)
+		return 0;
+
+	if (!of_device_is_compatible(mac_node, "nxp,imx8mp-dwmac-eqos"))
+		return 0;
+
+	/* Keep the preamble before the SFD (Start Frame Delimiter) for the
+	 * Micrel KSZ9131. This is required on the i.MX8MP because of errata
+	 * ERR050694.
+	 */
+	return phy_modify_changed(phydev, KSZ9x31_REMOTE_LOOPBACK,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE,
+				  KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+}
+
 static int imx_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -389,7 +420,30 @@ static struct platform_driver imx_dwmac_driver = {
 		.of_match_table = imx_dwmac_match,
 	},
 };
-module_platform_driver(imx_dwmac_driver);
+
+static int __init imx_dwmac_init(void)
+{
+	int ret;
+
+	if (of_machine_is_compatible("fsl,imx8mp")) {
+		ret = phy_register_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK,
+						 imx8mp_dwmac_phy_micrel_fixup);
+		if (ret)
+			return ret;
+	}
+
+	return platform_driver_register(&imx_dwmac_driver);
+}
+module_init(imx_dwmac_init);
+
+static void __exit imx_dwmac_exit(void)
+{
+	if (of_machine_is_compatible("fsl,imx8mp"))
+		phy_unregister_fixup_for_uid(PHY_ID_KSZ9131, MICREL_PHY_ID_MASK);
+
+	platform_driver_unregister(&imx_dwmac_driver);
+}
+module_exit(imx_dwmac_exit);
 
 MODULE_AUTHOR("NXP");
 MODULE_DESCRIPTION("NXP imx8 DWMAC Specific Glue layer");
-- 
2.51.0


