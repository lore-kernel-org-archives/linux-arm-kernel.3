Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D0FD6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCodZ65ripcarw6609Dpnt3dZb7SVi5h2TJ87Z7JA4M=; b=QiQwA5d7iqSao4GVxkX6Mgpiuy
	GqlcHTK8o903UNxpm/e+LVQAi6agOD+1rvqDDqnDhVARZtD+VpLuLci6xysP1JkmPWh3LEkYRHxPp
	PuyUooZyC5VkPLPZVBXbyNq4GfCXdVbpHkbapmBaDHJjPPu2MKpbQe8CYtXmdU3tyM5mo5B4uQBOZ
	rvvi0ZTN/enIh/fpEUsOghUvLICNvN0t2QcIm2U2IL70jptoXSSwuPFk8tLKzgNEKto+xXSMsuTxp
	SbMkgu/ozxj0q1wpFKGb57ZgA2b1IroSD9/TYjVXSrXt+V0r/hO/hNCaLKp0k+0sEBLhC+MXwtScj
	i4dwevJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYi-00000008SJS-1h0s;
	Thu, 18 Dec 2025 12:56:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYc-00000008SBk-2JCx;
	Thu, 18 Dec 2025 12:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766062590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VkZspcdBB8CC+tZvlfS6DHLQLLgwNzLgceFUA/BbASESctKc0+lXH87sKe24wTQjbtV0VN926EqYzApEc9deMCo+CIRwdViRDoyzaFxhimTzBAjIrLgC2lFLFVGMw83v/nxpDx9RFQkfXC0xRy+U3CIMN2dO63OuwFdKt9zTSFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766062590; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DCodZ65ripcarw6609Dpnt3dZb7SVi5h2TJ87Z7JA4M=; 
	b=S3/9UY932Lq6NaOhYNVsfZp9UBP2RFQhLSPNaYz+Eg+oTCACwHwLLCbJ5cYflChS/0gIQr6XlgdWXY/vitPxZkwEYS9bfWyXEuWdwSHBz4kK0H7QB4Q3kRdwUgnNPpbXHQt9WyfX30oPNn2Eup5Ul+JTkQAriM8iWhtZaF/d0vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766062590;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DCodZ65ripcarw6609Dpnt3dZb7SVi5h2TJ87Z7JA4M=;
	b=BgIq1IV+0jku6sdH/hbA6ptzf6ygSImZhdhGoGb2j/mcDXtz8HWuCT4Pq9t+Aqeb
	8ZYbaM4seb2YAnuXzE669LvsRuGPzBZfn06t8/fDKmoN/a6uoWpiUiHieReK2X8XUw4
	lLCiHn/1vZX9sZlmSsiXiyV3O2kTfuYCOcbvzlE4=
Received: by mx.zohomail.com with SMTPS id 1766062588541902.244686873399;
	Thu, 18 Dec 2025 04:56:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 18 Dec 2025 13:54:59 +0100
Subject: [PATCH v4 09/25] scsi: ufs: mediatek: Rework the crypt-boost stuff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mt8196-ufs-v4-9-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_045639_659510_87BCA2DF 
X-CRM114-Status: GOOD (  15.09  )
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

I don't know whether the crypt-boost functionality as it is currently
implemented is even appropriate for mainline. It might be better done in
some generic way. But what I do know is that I can rework the code to
make it less obtuse.

Prefix the boost stuff with the appropriate vendor prefix, remove the
pointless clock wrappers, and rework the function.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 91 +++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 59 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 131f71145a12..9c0ac72d6e43 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -562,21 +562,6 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	return 0;
 }
 
-static int ufs_mtk_get_host_clk(struct device *dev, const char *name,
-				struct clk **clk_out)
-{
-	struct clk *clk;
-	int err = 0;
-
-	clk = devm_clk_get(dev, name);
-	if (IS_ERR(clk))
-		err = PTR_ERR(clk);
-	else
-		*clk_out = clk;
-
-	return err;
-}
-
 static void ufs_mtk_boost_crypt(struct ufs_hba *hba, bool boost)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -633,65 +618,53 @@ static void ufs_mtk_boost_crypt(struct ufs_hba *hba, bool boost)
 	clk_disable_unprepare(cfg->clk_crypt_mux);
 }
 
-static int ufs_mtk_init_host_clk(struct ufs_hba *hba, const char *name,
-				 struct clk **clk)
-{
-	int ret;
-
-	ret = ufs_mtk_get_host_clk(hba->dev, name, clk);
-	if (ret) {
-		dev_info(hba->dev, "%s: failed to get %s: %d", __func__,
-			 name, ret);
-	}
-
-	return ret;
-}
-
-static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
+static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_mtk_crypt_cfg *cfg;
 	struct device *dev = hba->dev;
-	struct regulator *reg;
-	u32 volt;
+	int ret;
 
-	host->crypt = devm_kzalloc(dev, sizeof(*(host->crypt)),
-				   GFP_KERNEL);
-	if (!host->crypt)
-		goto disable_caps;
+	cfg = devm_kzalloc(dev, sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
 
-	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
-	if (IS_ERR(reg)) {
-		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
-			 PTR_ERR(reg));
-		goto disable_caps;
+	cfg->reg_vcore = devm_regulator_get_optional(dev, "dvfsrc-vcore");
+	if (IS_ERR(cfg->reg_vcore)) {
+		dev_err(dev, "Failed to get dvfsrc-vcore: %pe", cfg->reg_vcore);
+		return PTR_ERR(cfg->reg_vcore);
 	}
 
-	if (of_property_read_u32(dev->of_node, "boost-crypt-vcore-min",
-				 &volt)) {
-		dev_info(dev, "failed to get boost-crypt-vcore-min");
-		goto disable_caps;
+	ret = of_property_read_u32(dev->of_node, "mediatek,boost-crypt-vcore-min",
+				   &cfg->vcore_volt);
+	if (ret) {
+		dev_err(dev, "Failed to get mediatek,boost-crypt-vcore-min: %pe\n",
+			ERR_PTR(ret));
+		return ret;
 	}
 
-	cfg = host->crypt;
-	if (ufs_mtk_init_host_clk(hba, "crypt_mux",
-				  &cfg->clk_crypt_mux))
-		goto disable_caps;
+	cfg->clk_crypt_mux = devm_clk_get(dev, "crypt_mux");
+	if (IS_ERR(cfg->clk_crypt_mux)) {
+		dev_err(dev, "Failed to get clock crypt_mux: %pe\n", cfg->clk_crypt_mux);
+		return PTR_ERR(cfg->clk_crypt_mux);
+	}
 
-	if (ufs_mtk_init_host_clk(hba, "crypt_lp",
-				  &cfg->clk_crypt_lp))
-		goto disable_caps;
+	cfg->clk_crypt_lp = devm_clk_get(dev, "crypt_lp");
+	if (IS_ERR(cfg->clk_crypt_lp)) {
+		dev_err(dev, "Failed to get clock crypt_lp: %pe\n", cfg->clk_crypt_lp);
+		return PTR_ERR(cfg->clk_crypt_lp);
+	}
 
-	if (ufs_mtk_init_host_clk(hba, "crypt_perf",
-				  &cfg->clk_crypt_perf))
-		goto disable_caps;
+	cfg->clk_crypt_perf = devm_clk_get(dev, "crypt_perf");
+	if (IS_ERR(cfg->clk_crypt_perf)) {
+		dev_err(dev, "Failed to get clock crypt_perf: %pe\n", cfg->clk_crypt_perf);
+		return PTR_ERR(cfg->clk_crypt_perf);
+	}
 
-	cfg->reg_vcore = reg;
-	cfg->vcore_volt = volt;
+	host->crypt = cfg;
 	host->caps |= UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
 
-disable_caps:
-	return;
+	return 0;
 }
 
 static void ufs_mtk_init_host_caps(struct ufs_hba *hba)

-- 
2.52.0


