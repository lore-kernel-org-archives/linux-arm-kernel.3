Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D4AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Dc7TFmFRKKTvyZIVhsZW3P6/3ssL/r4tGzDHIGuSvM=; b=X5Ubs5OS6gG+kPUHozJ+sQzA50
	9SbJxaaG2wvD98dEYyVZZ5daIMIWUR6AYcV7VGQlM9OjRTvTrR1IF44xr++vzkdfLLBEUi4Sal0bt
	x00rlxOQTB9Ohh4Nzi5ptu4QU+58W8jHoAIdVFInY60BA/z7R7BJVoQHMILSszlpIjnJl/y2UB6xq
	zJJVmCWxStYY7yORcjnltjoM291JcDi81sCr3Q8gnBpdWGvcAz1xOfDEDT4LhglsmOW8Klc0mQqkU
	yucKM5Zi5tYU4syuHHTDIBzvG1xrw9hcetwx75mwJXZ7rl/HrnoaJW/t/GoLCP9ASJ1HRkCLj4HWY
	crqrEr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWPo-00000005wAA-1jqy;
	Tue, 18 Mar 2025 12:51:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWBu-00000005tgR-0NSK;
	Tue, 18 Mar 2025 12:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301424;
	bh=SWYqymPKeDTlu6phGSOFR4MJR0iXqjVq5q8eAzMWs68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m6EzrwZ9QIIF0/PfoITwAfzJx4Cwo/3/5uFym2zqeBuXfn73+U+PdrjQsHLsjq3EL
	 f7JrWSx7lLBcUwrtL6uuKJIsiLiiTmSppeCGOkf9M5cXaFjSklqAOU/ncGvXiEH+hG
	 0L7RbFnqxSrzORPV0La9S2DooT6hwZu9q5LyHCwNTGyywDWlYu/97+7LALBAyDX7SQ
	 b0ZWmDdXPcKRs+aXzrUS7zg4dzygDbhkYXIWABTELBOwbWdd3Z7FOU4cFTNm1NIjpS
	 fCztkenhHS5gjix62RU2AFSt7YSSeDjr5XPfdt6O+ZtcXyHqSgjnlUBISb1s15E5dh
	 gZdVav8KA2cSw==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 903B317E1067;
	Tue, 18 Mar 2025 13:37:04 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:41 +0200
Subject: [PATCH v6 07/14] phy: rockchip: samsung-hdptx: Drop superfluous
 cfgs driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-7-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053706_276505_9CDCE1E5 
X-CRM114-Status: GOOD (  13.65  )
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

The ->cfgs member has been introduced via commit f08d1c085638 ("phy:
phy-rockchip-samsung-hdptx: Don't use dt aliases to determine phy-id"),
but it is only used during probe() in order to setup ->phy_id.

Use a probe() local variable to store device match data and remove the
now unnecessary member from struct rk_hdptx_phy.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index c9f79c4e698cef405dd2b6a8c1071e296464c36e..2c0ae2442842fe84a86eba6815125be9d31cc41e 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -392,10 +392,7 @@ struct rk_hdptx_phy {
 	struct regmap *regmap;
 	struct regmap *grf;
 
-	/* PHY const config */
-	const struct rk_hdptx_phy_cfg *cfgs;
 	int phy_id;
-
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int nr_clks;
@@ -1894,6 +1891,7 @@ static int rk_hdptx_phy_runtime_resume(struct device *dev)
 
 static int rk_hdptx_phy_probe(struct platform_device *pdev)
 {
+	const struct rk_hdptx_phy_cfg *cfgs;
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct rk_hdptx_phy *hdptx;
@@ -1912,14 +1910,14 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(regs),
 				     "Failed to ioremap resource\n");
 
-	hdptx->cfgs = device_get_match_data(dev);
-	if (!hdptx->cfgs)
+	cfgs = device_get_match_data(dev);
+	if (!cfgs)
 		return dev_err_probe(dev, -EINVAL, "missing match data\n");
 
 	/* find the phy-id from the io address */
 	hdptx->phy_id = -ENODEV;
-	for (id = 0; id < hdptx->cfgs->num_phys; id++) {
-		if (res->start == hdptx->cfgs->phy_ids[id]) {
+	for (id = 0; id < cfgs->num_phys; id++) {
+		if (res->start == cfgs->phy_ids[id]) {
 			hdptx->phy_id = id;
 			break;
 		}

-- 
2.48.1


