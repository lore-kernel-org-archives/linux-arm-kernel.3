Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394DD6408D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gBojcA9uKcuTxPzbTmt63WipEC3ONCXYd+7KHmpSJsI=; b=WAoO6rkGHNG1f/+4PFLnXfh1tb
	LaGQKDhsTyAVEC37kbP3/0LqyRF2icPe1z8o1pj452zk4sSsH8vvMR/E+maxZF3dH9xPaDFX78RUE
	ju69D5N16DP68FmC/cg8ED6LE4O0TIVWZ4c2cBJL2AmDsZQY8wE3AQRIpeSmi7dbQkrZIACj+KHAc
	jwsSdqhcBa/vVkmnCJ+D3kuTlcXzp2pBNrh4Q5ZGnhCF4+kpn9rtgKJKg9qkB7FTkHCXRZv0F6Md1
	tjtrrpoDuHUPEJCXyW9hSIea70I6R5WZLC/fCJ8ITTAHOL9vh1XoVbd0MNICRnV+hFylh4V/7bco9
	fBrkPD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmfC-00000006KHX-43qe;
	Wed, 17 Dec 2025 08:13:38 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmf8-00000006KGY-3EyI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:13:37 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=gBojcA9uKcuTxPzbTmt63WipEC3ONCXYd+7KHmpSJsI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765959197;
 b=HC0IXmTlLoJKkfr3TH5g1y3h/G/C05/TOS8DR0UhWJYnjc522CP8TzErJ6OthbNkm+ORbGhC
 VwHw0WPHTZF2/tZBMBJ0uxNnPTrip1JLd4FM4SvSCQPaYxSmZZkM5E0Um+oR9XCAofKadLx2xSK
 0vJVAJzy+2xxHb+F6ofOMOnKk0eUJdbzN0b3wO6e68UAu4n5X46xm85mkIQ+HCepO8duWdta9jT
 zjvrql+wRjnG4QzYvqfGUJ9GgtwkP3hHVb6Uo+BBi6jPezbJtNXxoQODcrFIq3btaz2RNIcEeIn
 6uV6r3Yy/ImIefo8957Ka7X/WVsoHrLbSQgx9WyconPRg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765959197;
 b=QGYiMCE0oz/Uiv4/md0YAHVsLm/pPNWd5SJuZCm5+bqpRVy74NOLFnn3ocPzntUI+zi4EbVD
 Enm5ibHvGHTzQy59IEKF34/n4zUkm+rIm0Im6/06xG2S0aQH5hKc6waflSiRatWjqr41MFC4/y9
 slNMcrarvbsBUrQOC2t81vdKIgaDBddiFuYS3nGwEGPMjYpw+piIX9bLWYRC1AjdjP5LjbVIf6L
 IDrSnlo+NHnJGEA6ignWW4US7uerWCw7GuaCFSqHLQo0+q+jKeh8VxHjaJQWxArGNNondhQ5LlX
 Zmfl3qJTmTZ8RxbrHU1gLN1Zo63qiQQydgFCXvR6JrYjg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 17 Dec 2025 09:13:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 135C5220D78;
	Wed, 17 Dec 2025 09:13:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 17 Dec 2025 09:13:02 +0100
Message-ID: <20251217081303.1181922-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dWRPY5DcFz4MJtD
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: d01e9fb050804b371cf9e7666b08d8ae
X-cloud-security: scantime:2.392
DKIM-Signature: a=rsa-sha256;
 bh=gBojcA9uKcuTxPzbTmt63WipEC3ONCXYd+7KHmpSJsI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765959197; v=1;
 b=f5PvjxYoWYddoYxi/2SNZ+bRdkP2S7l8vyP2JgBAj8iE6YPW7jZrNqZRMODBw0AGoUGYb/1n
 5pAVkX/WqXgXaBRBflgmTUPRdvm/dp8xbYOcFgFIQC+oIg6NcEOQ0/eq1ExaikabI9ApZ57Dhon
 VW3g1q3Xz8/idTlPtfuQSwTDefMilWhnFFQ5GRXjuXWPEh7W94r/7ai7098Uq0FhCaAY15J1pfZ
 JUabcAeLRd9vPoy5Cu9ovYfIhZQv8fOJNEHTNZddNa550JO7lrA/xBiJ8z4/sAiMihoTrHquWt6
 eE5yH9EvgIsfH7rOl4PyYd2PAfB+D98nTdWTxdQtd0wgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_001335_201378_51877805 
X-CRM114-Status: GOOD (  11.01  )
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

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '5f1a0000.phy' already exists in 'regmap'
Fix this by using a dedicated regmap config for each resource, each
having a dedicated regmap name.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 977d21d753a59..0a0e10792dff4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
 static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
 					      "phy1_crr", "misc_crr"};
 
-static const struct regmap_config regmap_config = {
+static const struct regmap_config regmap_phy_config = {
+	.name = "phy",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static const struct regmap_config regmap_ctrl_config = {
+	.name = "ctrl",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static const struct regmap_config regmap_misc_config = {
+	.name = "misc",
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	off = devm_platform_ioremap_resource_byname(pdev, "phy");
-	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_phy_config);
 	if (IS_ERR(priv->phy))
 		return dev_err_probe(dev, PTR_ERR(priv->phy),
 				     "unable to find phy csr registers\n");
 
 	off = devm_platform_ioremap_resource_byname(pdev, "ctrl");
-	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
 	if (IS_ERR(priv->ctrl))
 		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
 				     "unable to find ctrl csr registers\n");
 
 	off = devm_platform_ioremap_resource_byname(pdev, "misc");
-	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_misc_config);
 	if (IS_ERR(priv->misc))
 		return dev_err_probe(dev, PTR_ERR(priv->misc),
 				     "unable to find misc csr registers\n");
-- 
2.43.0


