Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ECFD185F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp3jzDPj4y0ZdC/2W6sn1jmj7lkLx3nXIMAXab+y3rc=; b=AoVVwk2w5HZwt6Mho0gIkKTkPG
	dpgEoZjEPgfGC5QUhjoT/e9UrQ1SYFOSsN8BHqCUnlJ39K6vv5sDnU+L8AJZbqlNDiWJCjvghnGBN
	Wf9FbH++IrlPBcdJmIpOzj+rYzTAksR8UZLMVhyRZ9rvlbfrzD2yWKmnt41+G5SFIAe4QIz4cWIkX
	VZL7aRPZ3eMmIgfhUMFuFyjMJnmLJ152DvL2CK9chLBe9wHS/DIr80axppzqjXsVsttxavvZAyU+u
	4NhRxXfTfvCfs4pB+dBV096HabaqgmEkJamNgki/xNkPdOPxdFmZYVrLlRSlhlh6jmsaZta+Opn25
	TGzYA/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpkb-0000000H6Ys-0xPS;
	Thu, 08 Jan 2026 13:08:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpkZ-0000000H6YM-44w7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 145C360130;
	Thu,  8 Jan 2026 13:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5C7C19421;
	Thu,  8 Jan 2026 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767877706;
	bh=WZjdReui+9uqUJBxWx2+yu3EA2Z46nNDOpIBBhIZ02I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mLgIxyIabylAX90rx8Jn7L7Ic7m5O6LPAg00NPgiwUYN3y+JMJBkdqB/7Vxi3rLZD
	 Jg5EmXYj+477H+SmSv5xI9DFNGRcTmkwoa1O/w5Axf7zPG0kXQ+zKMWgNPgMKYN7FG
	 LYBwveojc4+eDCgY2l44SC+0FgsLOjXcMeoeKVoWltRFpLg6S4wmwdsFbBSiGaY6Fk
	 Q380fpWdb59Orv57GDKpV/skFTr3SN2SpYRCXdxvB//6hE/sM/+aJKp+YqHwodbIqQ
	 MVKrl59yk9yyscEMBA/o3p822Cers2a23PvADzPEOdykLGYREzi1q2pEc3Y6V1Pk4S
	 r3qd+RNZFQfVQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Thu, 08 Jan 2026 07:08:09 -0600
Subject: [PATCH v3 1/3] net: stmmac: socfpga: add call to assert/deassert
 ahb reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
In-Reply-To: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=WZjdReui+9uqUJBxWx2+yu3EA2Z46nNDOpIBBhIZ02I=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpX6xFghfZ1y+O/7GElll7ySvx0smqv/iVf0Hry
 vmvy//a2CKJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaV+sRQAKCRAZlAQLgaMo
 9NAZD/9xVkxvSB9+n9yzDdezbrLFCJNDOIoDca0A0vbDwXhREq046hORyNqa6F0s1XEMl7z0MQJ
 6XqSywVv/pbGH3ais/VL6jbBKGIw+9tQt/bbVrO9kzMp8CEe3V8WlneIAsVu4iVp1l8KWicTBX0
 jHfATx7DsBk+nk3t11X+lxACHPilw1I+iMis2nQPE1+0V2/o2reGfVNITYIsWXDRjs0buG6GXOo
 bY5ib1cMuoBGIMUpyEnD2zXbYvi9PHxq3D0gmXRCnnVkE8ZfcfbSVtEV1S+9SKrVVQtPuBOb70o
 MYrPpsc+yV8pbuJqylwEcXBVFZbwNqynnPTgLBEvltk7nuV/ivY+F11ePuOA2Tk5N7FgrnjU+Gj
 /DjKsbckxRKJBiAOYMfT5kfg4imlMvYpfQQc28vF2BUYN5c/iav5aHm4S72fceMcmku/MqQdlwc
 36vPHQlDkdNnpwA/EEvmOfbMTIxHd7+drJbo4HfE2XekorW7lu96sd7nurgFRM2hgh8DwPg80pi
 IZnLChkpAFOtgFkCemmsROs59GWgYL1iv46I5M1xmRMT5i9IknJNn6n79ZjcEridvU+btshj2SN
 HSd5z8sm7cToPWXCs/tag7wQ8wkN67twox5b1eRI6pz9G1abjUBUJuleEeJWvITb1sDZDF4m9qV
 AHaJo/qohyIqx1A==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
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

The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
platform is essentially the "ahb" reset on the standard stmmac
controller. But since stmmaceth-ocp has already been introduced into
the wild, we cannot just remove support for it. But what we can do is
to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
will be using "ahb", but in order to not break ABI, we will be call reset
assert/de-assert both ahb and stmmaceth-ocp.

The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
ahb reset to be asserted every time before changing the phy mode, then
de-asserted when the phy mode has been set.

With this change, we should be able to revert patch:
commit 62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp"
instead of "ahb"")

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index a2b52d2c4eb6f..79df55515c718 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -407,6 +407,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -436,6 +437,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);
@@ -463,6 +465,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -489,6 +492,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);

-- 
2.42.0.411.g813d9a9188


