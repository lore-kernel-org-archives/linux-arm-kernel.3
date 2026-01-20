Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093E0D262A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=; b=d9SVGEpf5zQcT8rbqO3NUgxUmT
	iwREha16qKqFMTO7fXb1pHrI4mMOhAL3ZMoAEjHPZpSDVLDdFOznBctNHrv7+uVCJJehYzPZx2gFG
	4WdXzxaOiXks+yaW9t6OXhvMG+12XgFHBtf8O0lc0d+/COHgDZosrcoVsg6bYXUeb3VEfiM3j8jaj
	/tm/kycCeuHWhKoqjcelbkh5QWoDtP3uBDUk9SdqMT/T0WPJrZyXYdJ5tCYO5AsDElNr76xZu7kaH
	7N0X+bpl8QbQPdSqI73MT2QWXAJecaknbDJNyZep1mBzblOXG7QHjXZui1xaoPO5j1bboFK3qmwre
	Fu5rSSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVQ-00000004Rm7-1vg6;
	Tue, 20 Jan 2026 20:39:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVN-00000004Rju-2Udz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:39:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee974e230so46367285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941552; x=1769546352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
        b=RJCOOXIXIbhd5coMt9vBnLbnU/Tu6m2qaQywJ86uIVNM3xe0ZYn3FUFUz9DqfHRTcE
         1KSwSGilQPKO1NSWlYsBqlCZ+DHH+2qLyQEEj9+t8GAQHBRY+2pTS0mj5PzI4trcz6Vo
         jyCcDCkPXkAONZBr0LiTGu5lzFEbuDRyjyNv6OzGs3pvehx7eqR2W46Nmiy1zJ3QQMMV
         f9K8JnnH/ahnNkNNfGo30rDvs5gScego0BrsRsIh12zSfI0dYDWKbtdGiDdUvJFbH19s
         vujR+ZA+e4rPdQTmOMVgim9+JZN9J23KG3zuVqiXCX4CiFhLDWeB/RKksh/OKZQvTd9i
         5hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941552; x=1769546352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
        b=CRnyfAHzwsMhvam7YKvvk/InucGI0XBOL9gwyu5OWCX2AOiy5TCunhrhAp8wLhf0kD
         Z+GkIaHySmy+8LpHjJCU72I8EQTb2hLjiXSdnfXeig+6ut3qNpNHl7wbx/+y5cJEKc52
         gOSmkVm+3Ohv5zyGrXrONow5LuuRPY8krQ0w2uTfQHTI44KTm47YxRqgmm/VUEmTMqLS
         IJumcTc3hTz9DHZ2QJ54ihOEQr9opABxnwYxZCDFIZI5eEGRU8L63r5LsBpXvQm3xPtL
         /2Udn17qPrnggrNgM1h3V/UdNOpkcYAvLFaiduetiRqksRtoTXEXoMTYcQFYFITWA4Or
         OiZA==
X-Forwarded-Encrypted: i=1; AJvYcCVT5pLeTGkqkRRhyLZGvgYhoIaqEoDmIdTnglZjSO+lHivpPFWSS4DbK8xdwFfNT0P2aOpURDGzIzla09nP227p@lists.infradead.org
X-Gm-Message-State: AOJu0YzKcX8+389kP3+gEW9Ab4wkggEt9cgnuPfpuChlnTnjcVLLHOBZ
	YCfAYtEvbmalTgaJLjrb77YWJjpC31eI8NOCIh5oBrZqOnMrmxGSnvga
X-Gm-Gg: AY/fxX7iMMVjhWV14YwVQMHZ0bhHwqYDX0bsQBaZ0u0G3uHDgZiRQpEoRJpknaPm0AY
	9Rz6DScp03Xy5IJG9xkBL2N/2AKy9ixbZVfbu3F54UvoBWupg6/Pa6l+YhXT014MikXr1CEFMNG
	5xWWvUkRR6rLk1BOknCrVxEqBp72fLTqPUERw/4inzWvBdNvNkk7vtnaVkhPHUKJPYc0FQPXFv0
	S+r8gS31HVAWtcUvLT2mBulEFRiysNmfGOX9E7sdRV8B0Gx95Tkx5XNrlXEr781Mqyxss+K1ki0
	27d8Y5J0KZhAfOQTV9F8n2vY7UMuu0JNNCM6P6h6tQkYUe8mc7ZZXdBFlJ48fE2MnMSxqcUCtcr
	vWAatct/A5vJEOzbJ5Qpk46LP/icrAdi940dC2tmFedBguTKf2pl4mfkcNEalD27d1WkX+1/Nra
	3Jwf3QXpscoJRVUCKk
X-Received: by 2002:a05:600c:190d:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-4803e79bbbamr44181875e9.6.1768941551414;
        Tue, 20 Jan 2026 12:39:11 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:10 -0800 (PST)
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
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
Date: Tue, 20 Jan 2026 21:30:04 +0100
Message-ID: <20260120203905.23805-4-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123913_692691_1254FCCC 
X-CRM114-Status: GOOD (  22.48  )
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

The stmmac implementation used by NXP for the i.MX8MP SoC is subject to
errata ERR050694. According to this errata, when no preamble byte is
transferred before the SFD from the PHY to the MAC, the MAC will discard
the frame.

Setting the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag instructs PHYs that
support it to keep the preamble byte before the SFD. This ensures that
the MAC successfully receives frames.

As this is an issue in the MAC implementation, only enable the flag for
the i.MX8MP SoC where the errata applies but not for other SoCs using a
working stmmac implementation.

The exact wording of the errata ERR050694 from NXP:
The IEEE 802.3 standard states that, in MII/GMII modes, the byte
preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
(0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
be no preceding preamble byte. The MAC receiver must successfully
receive a packet without any preamble(0x55) byte preceding the SFD,
SMD-S, or SMD-C byte.
However due to the defect, in configurations where frame preemption is
enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
byte, the received packet is discarded by the MAC receiver. This is
because, the start-of-packet detection logic of the MAC receiver
incorrectly checks for a preamble byte.

NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
they show two tables one where the preamble is preceding the SFD and one
where it is not. The text says:
The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
between transmission at the source GMII and reception at the destination
GMII. Table 35-3 depicts the case where no preamble bytes are conveyed
across the GMII. This case may not be possible with a specific PHY, but
illustrates the minimum preamble with which MAC shall be able to
operate. Table 35-4 depicts the case where the entire preamble is
conveyed across the GMII.

This workaround was tested on a Verdin iMX8MP by enforcing 10 MBit/s:
ethtool -s end0 speed 10
Without keeping the preamble, no packet were received. With keeping the
preamble, everything worked as expected.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 include/linux/stmmac.h                            | 1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..c722ff2dc1fcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -320,6 +320,9 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	if (data->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		plat_dat->flags |= STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
@@ -355,7 +358,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
 	.addr_width = 34,
 	.mac_rgmii_txclk_auto_adj = false,
 	.set_intf_mode = imx8mp_set_intf_mode,
-	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+		 STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD,
 };
 
 static struct imx_dwmac_ops imx8dxl_dwmac_data = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index da206b24aaed9..08a6082fc0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1205,6 +1205,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
 	struct ethtool_keee eee;
+	u32 dev_flags = 0;
 	int ret;
 
 	if (!phylink_expects_phy(priv->phylink))
@@ -1223,6 +1224,9 @@ static int stmmac_init_phy(struct net_device *dev)
 	else
 		phy_fwnode = NULL;
 
+	if (priv->plat->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		dev_flags |= PHY_F_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
@@ -1241,10 +1245,12 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		phydev->dev_flags |= dev_flags;
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
+		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, dev_flags);
 	}
 
 	if (ret) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8ac..e308c98c7bd33 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -191,6 +191,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
+#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
 
 struct mac_device_info;
 
-- 
2.51.0


