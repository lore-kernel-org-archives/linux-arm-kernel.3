Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1822ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df9Ky4phV/FxeuByGrQvzjH0ZYGDRAlOwv78D0ZevxQ=; b=4K2Yj/bYFlSuDrClT4veNOgxnW
	oc8QleQ2/zENqxoleZswNJOwiTa3CiO8v1SckLNO1riNZJI5dwrHT+gij6d8Wrjl9szppmir9BM4U
	bZxHfTCInkcZDZHFt0HFIV6Ybk9VHATqDs8xZjnuO/7xtkZ0uCXwh8QHfAlYwsxcFV6za5DZCzC76
	lojsESoHK/2iargECoOJQDGWMCBmNijUu7noP3NPOycaKwbim2mv3rP06guAL8z950bwO9vb+6trp
	TnUmEryt5sielltV+gEey8VBPXXSDaEkbkAhIq9LMsm3MHWi19Bl2tpUiLwlkV4skEf6OeY35CRlH
	JvGVkG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnc8-0000000DvB9-1F2d;
	Mon, 18 May 2026 02:21:52 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnc5-0000000DvAR-39WB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:21:51 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgA3TaCydwpqsUoaAA--.47399S2;
	Mon, 18 May 2026 10:21:40 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net v2 3/5] net: stmmac: eswin: clear TXD and RXD delay registers during initialization
Date: Mon, 18 May 2026 10:21:37 +0800
Message-ID: <20260518022137.464-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260518021919.404-1-lizhi2@eswincomputing.com>
References: <20260518021919.404-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgA3TaCydwpqsUoaAA--.47399S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy5KF1UZr1fGFWUtF1kXwb_yoW5Xw47pF
	WkAFy5Xrn2qryxKanIvFnYgryFyan7Ka1Sk34SkFnI9FyYkry5Ka4jva4YkF1UJrWUAFy3
	t3yUAF1xuF13CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNSdgDUUUU
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_192149_969883_FD567E84 
X-CRM114-Status: GOOD (  11.19  )
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

From: Zhi Li <lizhi2@eswincomputing.com>

Clear the TXD and RXD delay control registers during EIC7700 DWMAC
initialization.

These registers may retain values programmed by the bootloader. If left
unchanged, residual delays can alter the effective RGMII timing seen by
the MAC and override the configuration described by the device tree.

This may violate the expected RGMII timing model and can cause link
instability or prevent the Ethernet controller from operating correctly.

Explicitly clearing these registers ensures that the MAC delay settings
are determined solely by the kernel configuration.

The corresponding register offsets are optional, and the registers are
only cleared when the offsets are provided in the device tree.

Fixes: ea77dbbdbc4e ("net: stmmac: add Eswin EIC7700 glue driver")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
index 63001c4acdb7..541b279f08a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -46,7 +46,11 @@ struct eic7700_qos_priv {
 	u32 eth_axi_lp_ctrl_offset;
 	u32 eth_phy_ctrl_offset;
 	u32 eth_clk_offset;
+	u32 eth_txd_offset;
+	u32 eth_rxd_offset;
 	u32 eth_clk_dly_param;
+	bool has_txd_offset;
+	bool has_rxd_offset;
 };
 
 static int eic7700_clks_config(void *priv, bool enabled)
@@ -84,6 +88,12 @@ static int eic7700_dwmac_init(struct device *dev, void *priv)
 	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
 		     EIC7700_ETH_CSYSREQ_VAL);
 
+	if (dwc->has_txd_offset)
+		regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
+
+	if (dwc->has_rxd_offset)
+		regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
+
 	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_clk_offset,
 		     dwc->eth_clk_dly_param);
 
@@ -190,6 +200,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "can't get eth_clk_offset\n");
 
+	ret = of_property_read_u32_index(pdev->dev.of_node,
+					 "eswin,hsp-sp-csr",
+					 4, &dwc_priv->eth_txd_offset);
+	if (!ret)
+		dwc_priv->has_txd_offset = true;
+
+	ret = of_property_read_u32_index(pdev->dev.of_node,
+					 "eswin,hsp-sp-csr",
+					 5, &dwc_priv->eth_rxd_offset);
+	if (!ret)
+		dwc_priv->has_rxd_offset = true;
+
 	plat_dat->num_clks = ARRAY_SIZE(eic7700_clk_names);
 	plat_dat->clks = devm_kcalloc(&pdev->dev,
 				      plat_dat->num_clks,
-- 
2.25.1


