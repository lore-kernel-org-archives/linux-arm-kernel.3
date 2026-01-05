Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9180EC79F81
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzCrI/PO7wr5K/4A53OFPOrkM/kcswBeqhW4yMIzRfg=; b=iD+3wEL5XRduldQHmoPDOU2+vZ
	S69pHyPRPcrxa+yrysp0Cv5Twp6SlXbhII8tOyt2fTT/DV7D2CdCFE4dxU5acDsTcksYoU3bLGHWW
	OBf4ENUUEXml3KqRRJVD5sfjb400SrH3qAkv8GptxPyDM+qrHUHtkCuaGZXaB7hszTgQFUJORqaiM
	spzKfNO+i+vrHzMJ1HETEOs/8yDgTDm+VAXhZiXf7032H5prJUZ0tMJmGEAwQDWURf0HDu/Veaq2D
	3AV8DGscAZxbtsAtQHHylcu103TTkmE02zfmNhYcNBgkE7niAR39pLa766t3vgfl5iKfsm/Z1tLLh
	/cZyv+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjO9-0000000BFIO-2MRi;
	Mon, 05 Jan 2026 12:08:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjO8-0000000BFI9-15BX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D9596013B;
	Mon,  5 Jan 2026 12:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80B3C19423;
	Mon,  5 Jan 2026 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767614922;
	bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iQ+8nHQ2wrJ02GrUTDILvYq5BNdR9ALMiDIvib4zw2wPjGuTQIVJLjK5el+EPMgyX
	 qLRjMCjJE4Xc+Xux8wXCSn+L4oHHIc0Y+m1xANzZovXVNwGkkwrrg/iubV0p0PWM9o
	 mNCBqh4MVbH6/7AAwAtfcJ0aNXucjXAiOJoP7bvYDyav2zCdsVtC8z0B5DoBMydOkt
	 q5NeduHbrQqDHJD2c6nfu6PjvM4pn8N6e/cOQFEj3iF2PDWPVNkDRSwQR8pVe5IehB
	 GY86EU0TBUDl17CkrUCo38RwVwLdaTkK8ZaivHFgeOHHFaRmCdbSuIp8oIF3Iq3beP
	 PfULfuu+rkiKQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:20 -0600
Subject: [PATCH v2 1/3] net: stmmac: socfpga: add call to assert/deassert
 ahb reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-remove_ocp-v2-1-4fa2bda09521@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
In-Reply-To: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nEkHwBUX1Fi3QuvGkVgapLLXU6emvOtPKFr
 eljJE0/ogiJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupxAAKCRAZlAQLgaMo
 9ObQEACMkYtt9G/PbVDY2AQe9ZvZU/5Dyv8Ahhyts72NOKkfe+fvYLBuJDLKEqiGVjThIxxqL76
 NEs36K5a8vCpnXkKF8wvYYMuslrMXn8Gfqx4fJ/Qi6C/avA9A4zeVGGV0D8ABNCQL7aGHVcM1Vo
 +Cqpdqtbczui618srTtXkGIORNWsXJEcpf7CA19zDK7mAVVwA8kbLa/qe5F3KjGxvdidrchHs1i
 +vlq8tOlw4Drsud29XHun6IStAgRrCbOWg151dv+Iq+R0DrbwHDCNJriSHn/cuDuS3IrcjwR3zw
 ZBQqo0KlLAS5py39t+66DMFea3W57ZDmOSGpjoO4WD0sfzbvmIIcL5kjk5YGE//9t1Hvj29iWwp
 J/B3QmJojaIOIyIVwxrd9O59ejwHl1Js6JHnKf8ZyDV/HDen1bRGn7s46ulkT661nDsR0yEPOG/
 GZIrQov6xmJX3zAOsCXhaKyw9VGy4l9QBdThZLFkMWF+pb2qCIyI9A1rwqy+6ZVbstmXbBpyZlN
 At6ryWMh4zpd8DDq2Est4A7iRzsYl+QU7Q4JjP39N2ogBj5/MU99Y9v1emQwTCD5pBPByJVX3YA
 BK1mHPcAwfHkpxDPxB+iIgIzjK3qt0xrlEcW9pc51MvUxh/GnjniGjrUqpExVX6u4hdTi4K7qrR
 vg/tKOz0L0LvIxA==
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
index a2b52d2c4eb6..79df55515c71 100644
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


