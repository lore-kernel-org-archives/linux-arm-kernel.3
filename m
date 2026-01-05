Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53205C2A086
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=; b=DdgU6pluThbLEruWBQ28hm4HIv
	0NoDaepNxOIM3uR2yxZeNomDUmnDGDBF0Z6+aPTXQIIkqrSHMwOKvTL+1SbYIQrIuVHpQUeSdXALl
	IrL0VpUTP2NZI4I8B/ZO8UEdfD3pihjIRoOKlR+0vs1fgq0FWDM5tRH7Lzu/Z9iP84KrieGe9IEji
	aPiAaZ7AIHP6np+yQ3PvTnuQSlxhpzdQOLjXPwOmr8Q9W8TlWOhb4LADLyoT5HLttgCbktYm2Y9WF
	4viRGEngoifQ+HwB7aG4qG8yPntwDzVpDGBMZTkXVG1+yQMmCk2A+ZjTQc/4zpL/3cQy8i5zHRtC4
	qO4RD2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchQO-0000000B5XA-3l5C;
	Mon, 05 Jan 2026 10:02:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchQM-0000000B5Wl-2F9n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:02:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-432777da980so4061055f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607372; x=1768212172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=Fa13UGluF53PppIHjiMKT2uhnZIL53it5J7T3vfdQ8GP3+09ezgw1R89Jo9Ai07kbw
         ZfFMd14T5sNdM3heQF6hhxgVW9usbLUbZkLEXAhdhOUKz+asRa5el1V9aqsZj3lkQhVL
         Um5Usl2YbUe6d2OER61BaN6UfAcxTme2fsmPNP0cINPh4YXEEPGANDKvswncR057hNEN
         Grkj4Bj+0Rp/hofYrCLiA5DhFhV/5zGoF2bEmrj3tekiG3k0W3Cj7mTgDR44Emu/aKu6
         bkDfsmaEL7HDbQ8jcZsK3w4PoluuOMVax7rnViH29aKzjTWQ9OO9ISFCp3ZL54OobPmf
         l1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607372; x=1768212172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGMtlDyyRbCcoNhJtD681fIKSx7Hpi6HHJrHp091fTU=;
        b=EmfA2DDMTXJFD4fdKXi59l8REhYqEinNhCyalKziDZIIk3BvilhenLURZfckj+W2et
         pJ7bAo4JiaKG3HksMpLTckIxZa6NsTllFF+n3erIgJl1r7NGjTsuA447feUkSb4WivjD
         5Dd2J+C/GBYrQej8nBcak8/Eq99gg3KMGDfxAqZnzaTvdTMUghHauOGHF6+yxp1cvQ2G
         kmj5ZneHuRxGrn0M1xMl+Q9rCqNvNY+y7ut3gAhoU3t/lDqk831sZUe0MTZ4VRNMcHEQ
         ANQwdv2Cr6xptEvsXuLKYX0GJ2wY8qihmAx5BtGJNfPGv2fB0HODNx4iy6OphOyL8flF
         m0+g==
X-Forwarded-Encrypted: i=1; AJvYcCVpcSnsqaqRhEpM7eDIYY4IfR3amnIIU91RV6eiY+YYw6++/MZI2rvOQ6/YShkfbPEQWOKSQcjfmzn95NVam87Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxGV9ydRVHx5a/AHNeVYCfl9d7+h33uertaAqdu8HDU/VJm2Yir
	W+RxDrsSpHfkHejmxad/SUFtTITFplAKSnD6fzc1QetKmJcjrtzEjtzx
X-Gm-Gg: AY/fxX68kVy1ZvLNLcWoV/QB6LwWgZaXIW2RuJWY9lgtTmcl3hbm3u4OHYRa46pCHmf
	2sHhYrhDCYaIYNiNzfi9QUWLQamOuH61oHYTjQffWNy2PCzQoiwGyRFj8Jyjv7XNUa6AIKtMY7c
	ktTLKFob426WbCHt5tbOnAmBuxYMAsrXAvyNIvfXj9N5PLVtL+6UVbIP5KlWkyHy9BF53+OAu5o
	vPi6ltxl0dI26OE69Fcs9rGajpWmYgaxTmPL1W/fdLMt3F0Ii15bTIXtGNpFxsUnrTEr/arIRuf
	as2ND/bW4zCFtN9lmLFYpleoGRv7zkLBmyn/13W2Jup6xzUzEzajgFirqPCU1drfU0dVUzNGHFE
	PvBcsvFnJmDSHWlN/ifB3gVIlZu/mEXZOLxbif+ShHo2DQ9e9I8j2HyQYo3JaGnBMAhgIa70ylv
	FER0xiBJufJXa0gVtDNia0hDgR
X-Google-Smtp-Source: AGHT+IFKkMH1ZSx5o/rB6BTbeL4h1LkJTSLLqMkYzmB0QdI0255AUuWQv6qVkyZaadRtjHotP2jJUg==
X-Received: by 2002:a5d:5d87:0:b0:432:8651:4071 with SMTP id ffacd0b85a97d-4328651421amr32457140f8f.18.1767607371844;
        Mon, 05 Jan 2026 02:02:51 -0800 (PST)
Received: from eichest-laptop.gad.local ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm99270630f8f.5.2026.01.05.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:51 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for the Micrel KSZ9131 PHY
Date: Mon,  5 Jan 2026 11:02:23 +0100
Message-ID: <20260105100245.19317-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_020254_607203_78024270 
X-CRM114-Status: GOOD (  22.86  )
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


