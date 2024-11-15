Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06039D6DDE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1e1LOUtI0Astf/a7ioL+raSU9vL4XmV0G94gVl8ZTzA=; b=UgKjH961VSUeUReow8/7nYzgSe
	JE2nQ64FBZmZLFoni9vcnPff/JHX6JM59M41EZgQVNVhYNyi3/shTtPcHdyqJedDC8RiuT7fbm5AX
	5jcbID+l3rGWPirutP4mokg2AeE5pkwFkTlJC7FLc3MCSJ1YCblFgAHC5vqbcTLxbMoCnEr2BNOsn
	0nF31gFgFwvhH1UhjAi3Gv3/QEzS7EzI1pASxugC5vOP/HgOocbFacSRICSkdAqiwAHIpZtEkGA5R
	4cPy1pZfH9od8AOX8bTluuECOScUv5E/Xc94sNSZ/oJkyo9A1xtL3Z5AigcsVCLOGFJwBWUz1JbpY
	9csyK2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwMt-00000002okE-3DaE;
	Fri, 15 Nov 2024 13:28:11 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLo-00000002nnj-2aEG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:27:07 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id BDDCA40777D2;
	Fri, 15 Nov 2024 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BDDCA40777D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731677215;
	bh=1e1LOUtI0Astf/a7ioL+raSU9vL4XmV0G94gVl8ZTzA=;
	h=From:To:Cc:Subject:Date:From;
	b=omP7zZoLTS3qTb2wHMaUKEYSdvj2aRwzUayVpDedz18JlYgjCW/T1J77VZLAhifpF
	 tWkxPCmDCuE+bKNCgd61u5jWKhkHmQEk8LPHnSWRZ2dEno85iLZCNS08rRLC1rp4cH
	 GO32E5lDSfPXhciACWi1DWaBIbaHF5xpLGgP+vKE=
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
	Vadim Mutilin <mutilin@ispras.ru>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3] stmmac: dwmac-intel-plat: remove redundant dwmac->data check in probe
Date: Fri, 15 Nov 2024 16:26:32 +0300
Message-Id: <20241115132632.599188-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052704_886073_ADA202CB 
X-CRM114-Status: GOOD (  15.68  )
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

The driver’s compatibility with devices is confirmed earlier in
platform_match(). Since reaching probe means the device is valid,
the extra check can be removed to simplify the code.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2: Add a comment explaining why dwmac->data cannot be NULL, as per
Andrew Lunn's request.
v3: Resolve merge conflicts.
 .../stmicro/stmmac/dwmac-intel-plat.c         | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index a433526dcbe8..d94f0a150e93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -97,35 +97,38 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->tx_clk = NULL;
 
+	/*
+	 * This cannot return NULL at this point because the driver’s
+	 * compatibility with the device has already been validated in
+	 * platform_match().
+	 */
 	dwmac->data = device_get_match_data(&pdev->dev);
-	if (dwmac->data) {
-		if (dwmac->data->fix_mac_speed)
-			plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
-
-		/* Enable TX clock */
-		if (dwmac->data->tx_clk_en) {
-			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
-			if (IS_ERR(dwmac->tx_clk))
-				return PTR_ERR(dwmac->tx_clk);
+	if (dwmac->data->fix_mac_speed)
+		plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
+
+	/* Enable TX clock */
+	if (dwmac->data->tx_clk_en) {
+		dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
+		if (IS_ERR(dwmac->tx_clk))
+			return PTR_ERR(dwmac->tx_clk);
+
+		ret = clk_prepare_enable(dwmac->tx_clk);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to enable tx_clk\n");
+			return ret;
+		}
 
-			ret = clk_prepare_enable(dwmac->tx_clk);
+		/* Check and configure TX clock rate */
+		rate = clk_get_rate(dwmac->tx_clk);
+		if (dwmac->data->tx_clk_rate &&
+		    rate != dwmac->data->tx_clk_rate) {
+			rate = dwmac->data->tx_clk_rate;
+			ret = clk_set_rate(dwmac->tx_clk, rate);
 			if (ret) {
 				dev_err(&pdev->dev,
-					"Failed to enable tx_clk\n");
-				return ret;
-			}
-
-			/* Check and configure TX clock rate */
-			rate = clk_get_rate(dwmac->tx_clk);
-			if (dwmac->data->tx_clk_rate &&
-			    rate != dwmac->data->tx_clk_rate) {
-				rate = dwmac->data->tx_clk_rate;
-				ret = clk_set_rate(dwmac->tx_clk, rate);
-				if (ret) {
-					dev_err(&pdev->dev,
-						"Failed to set tx_clk\n");
-					goto err_tx_clk_disable;
-				}
+					"Failed to set tx_clk\n");
+				goto err_tx_clk_disable;
 			}
 		}
 
-- 
2.25.1


