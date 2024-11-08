Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE8D64070
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3QYrsrBPYW43jQDvfadZZ/SbvlgS981KQOnirhhBRvU=; b=pKz4/jlm8E+apivW9k+JaZ/TGU
	CzATbIZIObXlZkePfiX8aywNbCWD4G6Xb5UIQzNvp4akiUzf5TbLU7Mbd0vxPJ4g/o8Lye+9IukWl
	uCRIaXqkXnfLd217/tcsQHn4s/vnwyMYllya/0ymbNH9nRR5oDiPAagPkSBY6AQL0ESEzBUY/YIwI
	O4h1Uh+bganzSv+//96IYRqPFrJjVIcS+MPa0hqY0kBWYvvclb80zSMPgika2yKPgicIPGBwZH/F1
	Z4ThpxQMN1LH+GDImyrmGMTenW8wGx+/PgJ0o9tN8m3zkTwNSJbVZU7V30alN4/sQicO29D/++INm
	UG+p4m7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Stb-0000000BPLa-1ZGB;
	Fri, 08 Nov 2024 17:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Srm-0000000BOvc-3wDc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 17:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3QYrsrBPYW43jQDvfadZZ/SbvlgS981KQOnirhhBRvU=; b=iXnAI938aVANlcl3UDbqozavqI
	Wy1cKLw2lvw4Tilj+0eo2+heMp7Dj6J5NPpXgEm2scsZCY8cEFOIjEQejcqTFwB0ZPVmuEy4SCOvb
	iIi/Khvxgj/DbwAqV4BIVkQ1pIZD9ZkBHKbPD2Iex2jOdhuEqHyJhA1G01b0d80G1tr1O7kJulhcM
	IxpR0D08wI9eqZy4zZmLOJqqe594VOPaUSCZHj0E63ujAuh8BoSgsr+nLmiQl/15688WyjggMu3l9
	zU56u8+lJBuKxjeNVTOA4QfnQoIuY67PiE3fg7ICFVXfqHy0Sy+oUGuKK6ptD6ZAeiy4ocEyXePFD
	2Uj8HyCw==;
Received: from mail.ispras.ru ([83.149.199.84])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sri-0000000CLKW-1sNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:33:48 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id E969740B2274;
	Fri,  8 Nov 2024 17:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E969740B2274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731087221;
	bh=3QYrsrBPYW43jQDvfadZZ/SbvlgS981KQOnirhhBRvU=;
	h=From:To:Cc:Subject:Date:From;
	b=F5kOF/OaGdZSfFauj5TVSIstfJVU3lTPNTDHweGefjpPXpJ0XtnIpVTv1ULCVKRov
	 PD1zkrsBF3jPlQfslBxcFO3SizMaSk+ggashI9VbDmg/EmGK1EJbDK9lz0pdeW5tyC
	 jdFv4KDgaz8GCIsg5WJfS3SLQjxa0Lw0gdMSRuwE=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
Date: Fri,  8 Nov 2024 20:33:34 +0300
Message-Id: <20241108173334.2973603-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_173346_984562_6F2C73C4 
X-CRM114-Status: GOOD (  15.58  )
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

If the clock dwmac->tx_clk was not enabled in intel_eth_plat_probe,
it should not be disabled in any path.

Conversely, if it was enabled in intel_eth_plat_probe, it must be disabled
in all error paths to ensure proper cleanup.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 9efc9b2b04c7 ("net: stmmac: Add dwmac-intel-plat for GBE driver")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
v2: Unwind using a goto label, as per Simon Horman's request.

 .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d68f0c4e7835..9739bc9867c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -108,7 +108,12 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (IS_ERR(dwmac->tx_clk))
 				return PTR_ERR(dwmac->tx_clk);
 
-			clk_prepare_enable(dwmac->tx_clk);
+			ret = clk_prepare_enable(dwmac->tx_clk);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to enable tx_clk\n");
+				return ret;
+			}
 
 			/* Check and configure TX clock rate */
 			rate = clk_get_rate(dwmac->tx_clk);
@@ -119,7 +124,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 				if (ret) {
 					dev_err(&pdev->dev,
 						"Failed to set tx_clk\n");
-					return ret;
+					goto err_tx_clk_disable;
 				}
 			}
 		}
@@ -133,7 +138,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(&pdev->dev,
 					"Failed to set clk_ptp_ref\n");
-				return ret;
+				goto err_tx_clk_disable;
 			}
 		}
 	}
@@ -149,12 +154,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret) {
-		clk_disable_unprepare(dwmac->tx_clk);
-		return ret;
-	}
+	if (ret)
+		goto err_tx_clk_disable;
 
 	return 0;
+
+err_tx_clk_disable:
+	if (dwmac->data->tx_clk_en)
+		clk_disable_unprepare(dwmac->tx_clk);
+	return ret;
 }
 
 static void intel_eth_plat_remove(struct platform_device *pdev)
@@ -162,7 +170,8 @@ static void intel_eth_plat_remove(struct platform_device *pdev)
 	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
 
 	stmmac_pltfr_remove(pdev);
-	clk_disable_unprepare(dwmac->tx_clk);
+	if (dwmac->data->tx_clk_en)
+		clk_disable_unprepare(dwmac->tx_clk);
 }
 
 static struct platform_driver intel_eth_plat_driver = {
-- 
2.25.1


