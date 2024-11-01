Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC49E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5fKo8fTnEQdNdanyDiSNTFJtWguTQA4Rk/sMpAvPEs=; b=Aq//KlMApumvYnjaAVbdNRy1k2
	kXdw/8HSM8ULXaFFWNmCDXdfc/NyHQrR7SnpNWbF9wsCHtzIDXFvkPfYCof3cmx0Arly+Dz2LaaoC
	3qYaadzwZqEa1/QwIukFILTbXPqjUOvPxIUIcsdvhLFIrwoyhEGawRUtADSOCUlugcyT77w66ruN8
	Mf0nezarO/Kk6xjtWu3ysbSD5Nnc0oMGlYi+pjBY9j9JwfnPk191IGcMRK+1QIMp/TQJuPDEtM+Gd
	EhftRl7f9oCFZ2i4X1NPtxxP2jAz28fVIi0hEW/LNpEALyjsj1YPSghLPDyGn0xDPmfcSQx4Y7EVS
	zq8jrQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdm-00000007VuF-1TOw;
	Fri, 01 Nov 2024 15:32:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tSH-00000007UHt-1PjY;
	Fri, 01 Nov 2024 15:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730474450;
	bh=mA2I+V0jmE17nosO27KRVAzP6b9TsoO1O+RYOl7x5tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6PuDibA13Tiu/mFj6sgHUpKPAIZJdUJxCO/uPujAaU2EeIKxpEmwVP5d58+fpCdn
	 ay+DGk3S2NfTPu/cjgC82GD3HI9bzw8nOZsYKrMSdJaE5YdkJ6ODkw8jOFgKCEu5T5
	 qm9A2r7sVWlQOq4yxmMt0rk5H3RNVjCPElM9HlaBUQkajhLnvt409XRaTFoLSKHIIl
	 2xt5PXmZs0e33pxFNPOV+1/YRK9c7cFgxbt2x/G1xA1Tu+YqIlFHnukg0YvvDF0Nvz
	 Z+I3MgRVghYEe5k4Ph103d5ZjUpc68IgHSUVqR2ehSTyplxKgfE2oUW9j3obfSO7YX
	 ahIwVx8EyWEVA==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A6A017E0F80;
	Fri,  1 Nov 2024 16:20:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:24 -0400
Subject: [PATCH 2/4] net: stmmac: dwmac-mediatek: Handle non-inverted
 mediatek,mac-wol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-2-75b81808717a@collabora.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082053_544407_717969C0 
X-CRM114-Status: GOOD (  11.65  )
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

Parse the newly introduced mediatek,mac-wol-noninverted DT property and
use it to determine how the mediatek,mac-wol property should be
interpreted for enabling the MAC WOL or the PHY WOL.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index f8ca81675407ade786f2b9a38c63511a0b7fb705..f3255b84195389d73c6f6542f51f962b87a5cb4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -85,6 +85,7 @@ struct mediatek_dwmac_plat_data {
 	bool rmii_clk_from_mac;
 	bool rmii_rxc;
 	bool mac_wol;
+	bool mac_wol_noninverted;
 };
 
 struct mediatek_dwmac_variant {
@@ -493,6 +494,7 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
 	plat->rmii_clk_from_mac = of_property_read_bool(plat->np, "mediatek,rmii-clk-from-mac");
 	plat->mac_wol = of_property_read_bool(plat->np, "mediatek,mac-wol");
+	plat->mac_wol_noninverted = of_property_read_bool(plat->np, "mediatek,mac-wol-noninverted");
 
 	return 0;
 }
@@ -588,10 +590,11 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	int i;
 
 	plat->mac_interface = priv_plat->phy_mode;
-	if (priv_plat->mac_wol)
-		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
-	else
+	if ((priv_plat->mac_wol_noninverted && priv_plat->mac_wol) ||
+	    (!priv_plat->mac_wol_noninverted && !priv_plat->mac_wol))
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+	else
+		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
 	plat->riwt_off = 1;
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;

-- 
2.47.0


