Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3735DE9271B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzCrI/PO7wr5K/4A53OFPOrkM/kcswBeqhW4yMIzRfg=; b=zVUpPVenv0E6cmrSmyOXPt9tou
	gYyv1PG0wlh91luOdtRsH0AQkgzD/p7TcqkBEdfibyOfM+rdvkL49mB5rXX2BQG1j+yYpXtzm6xRe
	QcqzH4Fxzln6nyIXWp4KtkJyhQl3ZfAM5Cle24hmdQQ/dHN2vhxeSjzcvyULIEvQsu1DuenoXIGJX
	oQjuLABvVGJUDIVK4N6XXhS7c7dGplxKUmMwO49uwtWsFKtN43siOnQJnzUqQqH7l4LWAdDW3Ej8v
	3RkLS7PuJyyFxLCiFEGSxvHZ6VgXAs+7wzPjoi8NeW+C5zWm3Tn0kW/BBUO3X+0YHtqDPyLXMVoAz
	xM18Fc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkc-000000040Ch-1EmF;
	Mon, 29 Dec 2025 19:17:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkb-000000040CA-03yE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 19:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E2846001D;
	Mon, 29 Dec 2025 19:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C83C19423;
	Mon, 29 Dec 2025 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767035871;
	bh=P4TDnNk14F9PHiB/aO/B1Q6sB0FOFxIs5TdMoRAoLHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CkLAQgp8JVSDw+levfEh/+99v/n5tBInf8dxR1N1QqBnNaydcPDsXEJBfHxcYBqb/
	 Gea9WKt0+bKw4JLmSUIw7VgvGawkg5SkpgBIr1xR+FZn2zKdz9Bq2Obq5ZAfk02pac
	 Qau/Kfzr65vdkKVjkz+M3tu35gaTAY9nMH9g7klWinh9P1fzyAOj40KaTiB7QT5wTM
	 o3B8xjcKNL2BUXzLMiR/+mgrTvqJ8+Ysccntso6IzbwLKuZv8rz9gAPxyJtu/mHPGT
	 2cpPDUl5p0xEpmcA3lF3qjninqMZ6j+tPoGaj2yE/0I26X8jgE72KDTawCj1qNEMAP
	 7dIb08vj/JXtA==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 29 Dec 2025 13:17:18 -0600
Subject: [PATCH 1/2] net: stmmac: socfpga: add call to assert/deassert ahb
 reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-remove_ocp-v1-1-594294e04bd4@kernel.org>
References: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
In-Reply-To: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
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
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPbqXk/Yw9UdSOyLmXm8ZWv+eUnK6pQDTyNC
 YUmv9imar+JAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT2wAKCRAZlAQLgaMo
 9KK8D/4hqNU4cTNOQyotM99zfD/zz6svCjL5f6T681rTo5pnz3KekYAqQ03O4Gqku+Nm1bm22S+
 U3IeyArqIgmpIX78aVOAoX9Bju4JDAoqYjDraM+TGOl+6SOK6GcJK3hvo61kqO1RIPaNjcYr4WU
 6B4LgkKsnv6uUTDkUopFo5O0NTyEFU+V7Gy5/Ip8rEj+PjD4EK4GCIyBz9GiHJr60smcjgxwIoD
 nChCAWPNLC8RFPDRIEBx7dC6soR2P8CcQ0VRQIO/EcbIfXXSAn0VIOSyPRQZB0xxktqJmrwJqW3
 UT10/+2qabmUdFwtkfWfNXyB3tAfevCTReMxe2Y5u1BrAWBMVEQ4ookLfZAaWV0X5HgNHxq5B3B
 ixORAJvYFo37xOMeD1LPe6RQHWAcmddoL+K8ATLyNswy3a/YqTIupgbQPjjM44SjSbQJOde1dqq
 dVYF/k822pbL508qO49HzfcSjRwky7MIJIRoVVRroWXF1RJ8BpbpJ1ZUvdJStsNltCPi/Rne8N/
 BfVDuJ8LVIp9Un2s2IcIGTEzYnCNh/i8aqnibK5PTtENys6Qsx+Mkd1krDdfvUFuGlnpHBwX6gs
 AwqCF5cUDhsUZanfiaYa2dxS66CW2bDNVqTFnWq2VNNiJms5TSfw7DipX+lmLoZccBecNogITvu
 K/QLZmcl69LU0Gw==
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


