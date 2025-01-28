Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22ADC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CorL0XJq1X6cS70LA23wjdvs40fgV9cqYUId0MQpe9w=; b=Noxer0U8XGGmCZqaM8isR2zyCJ
	vOPnFsuAxeMLj60C43scMvEQVio0xvLUnaFLbABv9ZLhE4qznhp+YbliZgPfNLp4GaSsQcm+FA3nX
	G0+wLhznuQu+TZ8jgXLBcpD2FOcEFiOvygF25gIDdqZEmul4K6IruYlyUQkFcKjKQ00CPhOybAs8r
	Rk5F7r/CIFtYbSoRao07apBHyzceIIF0TSbTu4yGY76yDribDmt/1u2q63WMiR72zndlo9eQQxGS8
	jCv6qgvSN10OHhYGfrya3Wj2N/KfZWLuiniBJz6vVnyA4myNOgAB3sholvh+Vx78HKdicRwMP7F0J
	JOK1RonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tclTd-00000004xDj-3hVl;
	Tue, 28 Jan 2025 13:18:01 +0000
Received: from [203.254.224.25] (helo=mailout2.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclPq-00000004wWk-20Su
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 13:14:09 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250128131401epoutp02435e41c883ebe8d56b790d9d4c029fed~e3X6WCO6i0598005980epoutp02D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 13:14:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250128131401epoutp02435e41c883ebe8d56b790d9d4c029fed~e3X6WCO6i0598005980epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738070042;
	bh=CorL0XJq1X6cS70LA23wjdvs40fgV9cqYUId0MQpe9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQcwISTWcveSWbf5ysliymXZ6Zm+6ZGBl+2iB1zPI6CQzZuSV8agRbCFp1AXK4kOU
	 RjASYfrNEeJeIcAcEpzHWuqO18iMhQCG0k+WeJR8xSn1+WeggTVak9HiAh3deoDMOF
	 M9yqpB/h3t40mU/VvFkGEnCencRMZX1EBfPJtLQ4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250128131401epcas5p2c2e5f3accd8bbccec875a2b17d7cbf77~e3X5x2VlI0345703457epcas5p24;
	Tue, 28 Jan 2025 13:14:01 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Yj5Mr0LB5z4x9Pp; Tue, 28 Jan
	2025 13:14:00 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.35.19933.718D8976; Tue, 28 Jan 2025 22:13:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250128102732epcas5p4618e808063ffa992b476f03f7098d991~e1Gi-dMDr2149421494epcas5p4E;
	Tue, 28 Jan 2025 10:27:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250128102732epsmtrp2732242e23b76711037f689303a526b2f~e1Gi_ZkhO1510015100epsmtrp2q;
	Tue, 28 Jan 2025 10:27:32 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-9e-6798d8172139
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.CB.18949.411B8976; Tue, 28 Jan 2025 19:27:32 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250128102728epsmtip159e2c7a07dc46747e1fa4dea440a91dd~e1GfUvG4E1806618066epsmtip1-;
	Tue, 28 Jan 2025 10:27:28 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	andrew@lunn.ch, alim.akhtar@samsung.com, linux-fsd@tesla.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
	swathi.ks@samsung.com, rcsekar@samsung.com, ssiddha@tesla.com,
	jayati.sahu@samsung.com, pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: [PATCH v5 2/4] net: stmmac: dwc-qos: Add FSD EQoS support
Date: Tue, 28 Jan 2025 15:55:56 +0530
Message-Id: <20250128102558.22459-3-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250128102558.22459-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTf0xTVxTHve+1rwUHealML41WUrcoZGCrUC6/2WDLy2YMc8lImsxa6EvL
	KG3XV5wubMJgyWSMqZnICDCGOLQwsV0prfJbcBMJ1Wz8isEUZoeAFBTEacdYS3H773s/53zP
	OTn3Xi7OWyD43ByNgdZr5GohEciyXg/fE7ltrFIpMv0qQc9mKgBy1loJ5JjoxVFzxxCGqh0l
	LPR93xAbuW5McdB4tx1DfQMNGLpX72Yjh+MKB922lrOR+Y8RNpqczUS/Xa0mUKWjE0OlI/fZ
	qHb1Jza6UbcVrdx6CFB96zIHrc21AjS52M5BVbdtbNQ3+ABHa+02Dqp31rHRsmmck7qdslwa
	xyjXN60cyl41waHqzPmU2XiSoH5uOEHZbUsYtdA5TFDlFiOgejrFlOuvDpyydC0B6p/PazjU
	klmQESzNTVTRcgWtD6M12VpFjkaZJHznPVmaLEYiEkeK41CsMEwjz6OThOkHMiLfylF79yIM
	OypX53tRhpxhhHuTE/XafAMdptIyhiQhrVOoddG6KEaex+RrlFEa2hAvFon2xXgTj+SqvmuZ
	x3WTgmPOlT/ZhaAvtBQEcCEZDY39pzilIJDLI68BWFNhx30BHvkYwKcT2f7ACoBTxWZvgLvu
	ONuu8vMOAFttQ8B/WPa6TcVsn5sg98DRi23rZUPIQgyemb+D+w442YXD8XIXy5e1hXwDPhld
	JHyaRb4KbxbXcHwtgsh4WHjmkH++nbDpSvf6SAFkAnxQ/4jl5+cDYM/wUf9E6XDqAt+Pt8DZ
	Xywcv+bDJXcH4dcy2FQ+vGFVwYnnpzd4Cuz+vZrlK4OT4bDl6l4/3gHPDlzGfBong+HXnvuY
	nwdBW+0LvQuuzo1slAyF1gsLG20p2NA8Q/h3Ug7g4EoPcQoIqv5vUQeAEYTSOiZPSTMxun0a
	+uP/7ixbm2cG6y8/4m0bmHQuRvUCjAt6AeTiwpCgD4Yqlbwghfz4J7ReK9Pnq2mmF8R4t3ca
	57+crfV+HY1BJo6OE0VLJJLouP0SsXBbULG9RMkjlXIDnUvTOlr/wodxA/iF2O7iVgemTeJG
	zh1gWxcuVayt2qWHrX0JpV0JpWW6x0XxyWOJox0LYKtn0ytTD+8SlsEw59h01mSFShTY/KVs
	osCeKVU2ZSU9Ml63SLThcRfN/INZuOArxr0zkoolMhqdJ4I/in9d+pqn0fzhuenksmRT1LnA
	1PnjO54rwExnUUuAK+JZsceTvmiQ/jgQVdipMDKfngkfP/S36iXZrc3vT5dYTm4+nKxqDE8r
	Ydo/0428aVD3z9e1/XDzDq/CRQd33xVsmo09WHbedjknt7/gaUbbroJ30wd3L+xvkQoM1zxp
	jiPfFj2Ru1Ns945l0gUhX/SnNDAzblOfyZ3atJ1cFLIYlVwcgesZ+b/lqQj4ggQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWRf0yMcRzH+z7PPfc8HZ1Hl3xLiuvHyJTQ9l1+rAx7MBa2wta46dmd6ec9
	UphJtUxIqKRRt5PSYVfXD3ek3Gl+lHVZI2cdl+sXietKfkwdV/Pf67PX+7P3Z/tQuHsVz5s6
	lHSElSdJEsR8Aa/xidh3uUdtiXTFn4+e6NenYoAsZY18ZDQbcHT3UQeGrhtzeKi8tYNA/U8/
	ksj0WIeh1rYKDL1XfiWQ0VhDos7GfAJprG8I1Ps5FnU9uM5HJcZmDOW96SNQ2eQ9Aj1VeKKJ
	9i8AKRvGSeQYbgCo19ZEotJOLYFaXw7hyNGkJZHSoiDQeK2JjPRh6qtNGNN/sYFkdKVmklFo
	0hiN6iyfqas4xei0Yxjzrfk1n8mvVwFG3xzG9P98hDP1LWOAmcq6QTJjGt9o4T7B2ng24dBR
	Vh66/oBAdk09gqf0+mZYJgaITNDqlQcoCtKrYVGTLA+4Uu70QwDztSInQ9oL2rOLiBkWweqp
	QTIPCP5l7AB+yLXwnYJPL4Hdt+9PCw+6AINqewvmHHD6FQ6z20ZJZ0pEb4Dfu23TGzw6EL7I
	vkE6m93oCJh5eddMgx+8U/MYd7IrvQYOKUd5MxdFwN6sYlAAhArgogJebAqXKE3kwlJWJrHp
	IZwkkUtLkoYcTE7UgOlfBgdrQZPKFmIAGAUMAFK42MPtrKlQ6u4WLzl2nJUn75enJbCcASyg
	eOL5bhPDF+LdaankCHuYZVNY+X+LUa7emdiskatBIZf6rpRkqcUy9VD8sh0HFp6JPO8TcDNg
	9x69atfdGoMiriDcq4+y2ivTJ7p1gXXPzaRk1Fa7t82nZdXXjbN1ju2lRQHpsUGLcwjblneT
	4qptG8e37s+5lBv2LgOA8OWh13IG5wqXEQEnFm12ST2vLtzkyQX18MYEI9bBiK4YLCquxxq1
	Iu63Z6X15A9VdJBZlE5lxPwS6vVz1n2xZQ2l7hb6r5+bPWiUG62Fp9vCI1BLcq5Fn+ryrGLA
	MVXV+VbGj7J3mPZFts/zD1zKlLf3mTzOiEzDHC6AV2/NP2zY6Vt1Ybtj28CP+p5Cy7l8gynG
	rGz0u7im2xK8SczjZJKwYFzOSf4CjkabEToDAAA=
X-CMS-MailID: 20250128102732epcas5p4618e808063ffa992b476f03f7098d991
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102732epcas5p4618e808063ffa992b476f03f7098d991
References: <20250128102558.22459-1-swathi.ks@samsung.com>
	<CGME20250128102732epcas5p4618e808063ffa992b476f03f7098d991@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_051406_849076_57BD64F6 
X-CRM114-Status: GOOD (  23.77  )
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

The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
The binding that it uses is slightly different from existing ones because
of the integration (clocks, resets).

Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
Signed-off-by: Suresh Siddha <ssiddha@tesla.com>
Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index bd4eb187f8c6..81a7038bcdf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/stmmac.h>
+#include <linux/regmap.h>
 
 #include "stmmac_platform.h"
 #include "dwmac4.h"
@@ -37,6 +38,12 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
+struct fsd_eqos_plat_data {
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct device *dev;
+};
+
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -260,6 +267,67 @@ static int tegra_eqos_init(struct platform_device *pdev, void *priv)
 	return 0;
 }
 
+static int fsd_clks_endisable(void *priv, bool enabled)
+{
+	struct fsd_eqos_plat_data *plat = priv;
+
+	if (enabled) {
+		return clk_bulk_prepare_enable(plat->num_clks, plat->clks);
+	} else {
+		clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
+		return 0;
+	}
+}
+
+static int fsd_eqos_probe(struct platform_device *pdev,
+			  struct plat_stmmacenet_data *data,
+			  struct stmmac_resources *res)
+{
+	struct fsd_eqos_plat_data *priv_plat;
+	struct clk *rx1 = NULL;
+	struct clk *rx2 = NULL;
+	int ret = 0;
+
+	priv_plat = devm_kzalloc(&pdev->dev, sizeof(*priv_plat), GFP_KERNEL);
+	if (!priv_plat)
+		return -ENOMEM;
+
+	priv_plat->dev = &pdev->dev;
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &priv_plat->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "No clocks available\n");
+
+	priv_plat->num_clks = ret;
+
+	data->bsp_priv = priv_plat;
+	data->clks_config = fsd_clks_endisable;
+
+	for (int i = 0; i < priv_plat->num_clks; i++) {
+		if (strcmp(priv_plat->clks[i].id, "eqos_rxclk_mux") == 0)
+			rx1 = priv_plat->clks[i].clk;
+		else if (strcmp(priv_plat->clks[i].id, "eqos_phyrxclk") == 0)
+			rx2 = priv_plat->clks[i].clk;
+	}
+
+	/* Eth0 RX clock doesn't support MUX */
+	if (rx1)
+		clk_set_parent(rx1, rx2);
+
+	ret = fsd_clks_endisable(priv_plat, true);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable FSD clock\n");
+
+	return 0;
+}
+
+static void fsd_eqos_remove(struct platform_device *pdev)
+{
+	struct fsd_eqos_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
+
+	fsd_clks_endisable(priv_plat, false);
+}
+
 static int tegra_eqos_probe(struct platform_device *pdev,
 			    struct plat_stmmacenet_data *data,
 			    struct stmmac_resources *res)
@@ -406,6 +474,11 @@ static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.remove = tegra_eqos_remove,
 };
 
+static const struct dwc_eth_dwmac_data fsd_eqos_data = {
+	.probe = fsd_eqos_probe,
+	.remove = fsd_eqos_remove,
+};
+
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data;
@@ -468,6 +541,7 @@ static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id dwc_eth_dwmac_match[] = {
 	{ .compatible = "snps,dwc-qos-ethernet-4.10", .data = &dwc_qos_data },
 	{ .compatible = "nvidia,tegra186-eqos", .data = &tegra_eqos_data },
+	{ .compatible = "tesla,fsd-ethqos", .data = &fsd_eqos_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
-- 
2.17.1


