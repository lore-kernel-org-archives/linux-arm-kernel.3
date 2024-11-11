Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3431D2E9E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoDFg+BU0HIQ1tlmc6quFrKIJzeXNVPGLXuX0Js0k1k=; b=fzsdLujBP/GC0QgfJByOE6DIy3
	7tPmHS+ubBJEdAMAuHnHIR9ACM7LKurDe5+3Kwx9HK41Xw//kvtR0gqdAETeCftbYawG65aagVOeo
	GdZxDt/aovZnJcU2WKOUOLHPxEQn/9o5RCutgLMcYaisa6pyEwQ70vN7fJWcEM1IZiyzHo/pm34kp
	96iYLbku5lzInacs64d8+AgWMujzBopDrzKZivv7MgZreSkKtG+suBOEijiR0yvD/i/b5svl7TGVR
	/CnppfTW0w9YBMapsuIgRBYlc7FZKZp9Neag5o3R7tYxgHwzIZAisFmd6pQmVHDvdcKoBCI7qmQS4
	ZZph3p4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUCL-000000009As-0t5e;
	Mon, 11 Nov 2024 13:11:17 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAU2U-000000006JN-326F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:01:09 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 712E140B2287;
	Mon, 11 Nov 2024 13:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 712E140B2287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731330060;
	bh=LoDFg+BU0HIQ1tlmc6quFrKIJzeXNVPGLXuX0Js0k1k=;
	h=From:To:Cc:Subject:Date:From;
	b=QTFaz9NF4hXmf7LBTvZ2meQdmeUgnJSFQZnoC8H+TJWclm7XXWDHNULJOHOU2CDy8
	 nS7sJP616ASKWNrnaJJxK+DbG9tgkeS92JDplwxw9ZFRqMxhbnzxclMaNoeidIZGs2
	 O5tjBQ8h0Spg4ZADdEIGWX4gPM8Ck4QBGLovEfrw=
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
Subject: [PATCH net-next v2] stmmac: dwmac-intel-plat: remove redundant dwmac->data check in probe
Date: Mon, 11 Nov 2024 16:00:47 +0300
Message-Id: <20241111130047.3679099-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_050107_040528_761E57B6 
X-CRM114-Status: GOOD (  15.29  )
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
---
v2: Add a comment explaining why dwmac->data cannot be NULL, as per
Andrew Lunn's request.
Link to another patch touching this code and targeted at net tree:
https://lore.kernel.org/netdev/20241108173334.2973603-1-mordan@ispras.ru
 .../stmicro/stmmac/dwmac-intel-plat.c         | 69 ++++++++++---------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 230e79658c54..377c98801319 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -97,47 +97,50 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
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
-
-			clk_prepare_enable(dwmac->tx_clk);
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
-					return ret;
-				}
-			}
-		}
-
-		/* Check and configure PTP ref clock rate */
-		rate = clk_get_rate(plat_dat->clk_ptp_ref);
-		if (dwmac->data->ptp_ref_clk_rate &&
-		    rate != dwmac->data->ptp_ref_clk_rate) {
-			rate = dwmac->data->ptp_ref_clk_rate;
-			ret = clk_set_rate(plat_dat->clk_ptp_ref, rate);
+	if (dwmac->data->fix_mac_speed)
+		plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
+
+	/* Enable TX clock */
+	if (dwmac->data->tx_clk_en) {
+		dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
+		if (IS_ERR(dwmac->tx_clk))
+			return PTR_ERR(dwmac->tx_clk);
+
+		clk_prepare_enable(dwmac->tx_clk);
+
+		/* Check and configure TX clock rate */
+		rate = clk_get_rate(dwmac->tx_clk);
+		if (dwmac->data->tx_clk_rate &&
+		    rate != dwmac->data->tx_clk_rate) {
+			rate = dwmac->data->tx_clk_rate;
+			ret = clk_set_rate(dwmac->tx_clk, rate);
 			if (ret) {
 				dev_err(&pdev->dev,
-					"Failed to set clk_ptp_ref\n");
+					"Failed to set tx_clk\n");
 				return ret;
 			}
 		}
 	}
 
+	/* Check and configure PTP ref clock rate */
+	rate = clk_get_rate(plat_dat->clk_ptp_ref);
+	if (dwmac->data->ptp_ref_clk_rate &&
+	    rate != dwmac->data->ptp_ref_clk_rate) {
+		rate = dwmac->data->ptp_ref_clk_rate;
+		ret = clk_set_rate(plat_dat->clk_ptp_ref, rate);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to set clk_ptp_ref\n");
+			return ret;
+		}
+	}
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
 
-- 
2.25.1


