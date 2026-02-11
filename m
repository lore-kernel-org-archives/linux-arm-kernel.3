Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F65E9E311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L4vyNH4YErLs5bwpzmTX4TQ2ymTibM6HD0Mohhb6Gt4=; b=zRKyZ56kPgy1Zz4RzYGDaNtDjJ
	wPPVoFiBBtmmanKHUT2Mbu/CbVlIYo0JaMWnBxASZeMWFq6T8A4JlB2thdGbGk8UZVAxq/Qu9tqt9
	JpNEAloHVu7v62v+BRUbTdwrrpn8Wv5gmrQ9+dTZSSUUsFhtUHuVijWkkjFvDyo6brUgNgGcoVtDK
	tgnhLyWfZHHeLHH8vwzzw4uG4zx+UlHh46LT2Xzkt+axmTClOG2wStM35OQZ5ZunZsIjlC1SH/55x
	tg8FVCXR/6vSkmpQPm4QUnRbPpyZp9yxd2KECL5VmZz/+GYkAGJv6hOwvMqQzQqORVnUTxVUzE+PZ
	t2tWBtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBXq-00000000kFF-47xh;
	Wed, 11 Feb 2026 14:50:26 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBXm-00000000kES-1OKS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:50:21 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=L4vyNH4YErLs5bwpzmTX4TQ2ymTibM6HD0Mohhb6Gt4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770821405;
 b=WV1TKxjgD8CEWlGqiZPgoYW31LuXVxZp8B2LC9WPzLqMHTXXKDDgYsHehRMrK5judSV+ZcB+
 11aWUv/d0WdaKmy1VVyaaQWd07bBlauxoT4kcaFCl3fLSEpuOGueulrU8zOLtngJaSL+jRllszb
 +X+Hg7hlh4QMaDXbtxMST/dt6LhhMadishFNRC/mBNjelCLuSfiQuogZ9Tv7REJxGeigLIdufwl
 2qaqxbSo+D1GXivXd+WAegpDB507oM4KE3ij72YevUKptpuBbWujwfjC3XdAyh3c/df4166NalJ
 IQMup2Fu/dKGngqV3LoeM8xHwKF/rK/CZ+N2FQCGaEZ6A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770821405;
 b=FUKFs59eaPgSBbwCsGPeYHDkyTxSgi2AN/sLHl8OrqaQj470fMwEJMVWlFZGkEnDNtJ8b5A9
 mqNZveFBEbo7eQ0YRjI02eaVQQSI/UrFlbkNRiUAE3xVta98HCikGjQceRgc8wYXZBx8L6xnKQy
 9OoMvoMwhScK4kdoQtpHjFnuvPS0Huau/O9l5BEqAdomr7xsMZjjBAvIMvEK3BKY2NCJU9h1GOb
 cf4suuexVKrfDG/jAdek0sKD5J7JlEaqr4OMGwk4RT1LwHUKRtA5iL6HESQxa9YxpqUWrdoyUua
 eBATSrS/w6GVFBpyZlXGZl+B78N+rl/ENTzWIJf528n1w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Wed, 11 Feb 2026 15:50:05 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0CCCC5A12E8;
	Wed, 11 Feb 2026 15:49:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 11 Feb 2026 15:49:48 +0100
Message-ID: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fB1YW4rTYz2nJGn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ba1eb0984800e64e2245420c91fb4aab
X-cloud-security: scantime:2.114
DKIM-Signature: a=rsa-sha256;
 bh=L4vyNH4YErLs5bwpzmTX4TQ2ymTibM6HD0Mohhb6Gt4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770821404; v=1;
 b=Sx5tD7l07x9Rut/WwLWpO7b7XCDS2x4//SbeiGfE3Pxm7dL6VBsMP2eMjTzT0GtDs7OdcULz
 F7vp6hp2V48Em7NpDYZets2LPoBt9xlt6JJ4V8y6oLNGdZE+WWbkVPveyxKmpx+lH+m5enZ8fRa
 2joSnh42cxe/BVfNetEgiJtnLB9YvxkwSt5DvMc+e+EsqKCklk9BXfNLLNZxVnBNVfUGUtDTmc6
 AHHp5cE9v14ZFww5+RbDqW5I7b4pK66xjyQobuaicFouAAvpzi0UcwXkkAJLzYSDNKBG4xySCaK
 JVgX0381hiGPfz14uiiteHfSesrf8CVXixUO/Bw7wGokA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_065019_832200_C5121B6F 
X-CRM114-Status: GOOD (  10.91  )
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
Same as the one sent in December but with an updated CC list.

 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 279b8ac7822df..4ab45c9f53dff 100644
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


