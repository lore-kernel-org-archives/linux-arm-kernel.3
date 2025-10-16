Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72FACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H4tO8/easJzCGsql5XTMRxbnCY7AtZ9sBuS9/G59HY=; b=JwiJm41QxehtYt/Mj/kj1PkQ0e
	qOJFE32cxRv6w4sTOJ1TH52zuUPx/6vk+r+6xF4VeMzSkUJUSohscNfWkZgDMrjvZwPvLIcCJ9gkF
	0rSHMbxbtGbbjq2hGgzPNwjy6tOiE4EPh2RXxlQQdjQrXlroeYQAEKgv3sXisrXN73f9UN0btRwUD
	N0fkUPhaV1CKZtphal/JaWFOMBrcKmahHbYMmBoYdiE5pDV4Tiz1777zapfL4FKpznTMVMkVTRXdJ
	TBA0b2OXwcZ1S/NJYMn0oTJjAlYfayhxpkmU6DbcINlyQVAyyw0jpAKSUWakJhMoXEnYsYYOuR2fK
	uGMBvnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LE5-00000004Puv-3f9x;
	Thu, 16 Oct 2025 10:28:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LE2-00000004PqJ-1Kk2;
	Thu, 16 Oct 2025 10:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9CA1603CC;
	Thu, 16 Oct 2025 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12367C4CEF1;
	Thu, 16 Oct 2025 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610529;
	bh=12oYb9Bl0moUeFeRekTwqvNJqu88Y0MVBwY5DHVNyPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XJQPCSjUuHacMGxWwm08v3qdS58hrMgdj8ZUgejWtNTzpHlJZH3mFtIgHQc0MT2Ir
	 cT6ojjxQCeBId/XqfQuHoal/okjJGZ/azj8Kj/sXkOQ2RlYbI4KWVDEqoI1kfRNIa3
	 TrxeYokAspdX2JlOYI5cNOyh7/N2d+zwZlRpdTSuTbEpIJkL9yHoiCEjcy3Re8tJZZ
	 x7Gohkr5sJrVgWbRgiTxlKLeVT5ZcEmPFD5wvXrzHWk/GdjMCXI/wOlyCho5k+dpzM
	 HSDBTi8DYPC0iSJwAic/Y6M5VZtfMTyaVHdobymwVPrpklUZl3fvGXuNIh4p1bhcHL
	 pp7OE74c1CNFw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:18 +0200
Subject: [PATCH net-next v2 04/13] net: airoha: Add airoha_eth_soc_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-4-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
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

Introduce airoha_eth_soc_data struct to contain differences between
various SoC. Move XSI reset names in airoha_eth_soc_data. This is a
preliminary patch to enable AN7583 ethernet controller support in
airoha-eth driver.

Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 42 +++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h | 17 +++++++++++--
 2 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 6effdda64380bf72ce3c5b6b2f551f560f2ee097..32015c41b58df68a0fe87bb026ee0a6d44ea6ec9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1387,8 +1387,7 @@ static int airoha_hw_init(struct platform_device *pdev,
 	int err, i;
 
 	/* disable xsi */
-	err = reset_control_bulk_assert(ARRAY_SIZE(eth->xsi_rsts),
-					eth->xsi_rsts);
+	err = reset_control_bulk_assert(eth->soc->num_xsi_rsts, eth->xsi_rsts);
 	if (err)
 		return err;
 
@@ -2908,6 +2907,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 static int airoha_probe(struct platform_device *pdev)
 {
+	struct reset_control_bulk_data *xsi_rsts;
 	struct device_node *np;
 	struct airoha_eth *eth;
 	int i, err;
@@ -2916,6 +2916,10 @@ static int airoha_probe(struct platform_device *pdev)
 	if (!eth)
 		return -ENOMEM;
 
+	eth->soc = of_device_get_match_data(&pdev->dev);
+	if (!eth->soc)
+		return -EINVAL;
+
 	eth->dev = &pdev->dev;
 
 	err = dma_set_mask_and_coherent(eth->dev, DMA_BIT_MASK(32));
@@ -2940,13 +2944,18 @@ static int airoha_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	eth->xsi_rsts[0].id = "xsi-mac";
-	eth->xsi_rsts[1].id = "hsi0-mac";
-	eth->xsi_rsts[2].id = "hsi1-mac";
-	eth->xsi_rsts[3].id = "hsi-mac";
-	eth->xsi_rsts[4].id = "xfp-mac";
+	xsi_rsts = devm_kzalloc(eth->dev,
+				eth->soc->num_xsi_rsts * sizeof(*xsi_rsts),
+				GFP_KERNEL);
+	if (err)
+		return err;
+
+	eth->xsi_rsts = xsi_rsts;
+	for (i = 0; i < eth->soc->num_xsi_rsts; i++)
+		eth->xsi_rsts[i].id = eth->soc->xsi_rsts_names[i];
+
 	err = devm_reset_control_bulk_get_exclusive(eth->dev,
-						    ARRAY_SIZE(eth->xsi_rsts),
+						    eth->soc->num_xsi_rsts,
 						    eth->xsi_rsts);
 	if (err) {
 		dev_err(eth->dev, "failed to get bulk xsi reset lines\n");
@@ -3034,8 +3043,23 @@ static void airoha_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const char * const en7581_xsi_rsts_names[] = {
+	"xsi-mac",
+	"hsi0-mac",
+	"hsi1-mac",
+	"hsi-mac",
+	"xfp-mac",
+};
+
+static const struct airoha_eth_soc_data en7581_soc_data = {
+	.version = 0x7581,
+	.xsi_rsts_names = en7581_xsi_rsts_names,
+	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
+	.num_ppe = 2,
+};
+
 static const struct of_device_id of_airoha_match[] = {
-	{ .compatible = "airoha,en7581-eth" },
+	{ .compatible = "airoha,en7581-eth", .data = &en7581_soc_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_airoha_match);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 1f7e34a5f457ca2200e9c81dd05dc03cd7c5eb77..cb7e198e40eeb2f44bd6e035cc7b583f47441d59 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,6 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_NUM_XSI_RSTS		5
 #define AIROHA_MAX_MTU			9216
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
@@ -556,9 +555,18 @@ struct airoha_ppe {
 	struct dentry *debugfs_dir;
 };
 
+struct airoha_eth_soc_data {
+	u16 version;
+	const char * const *xsi_rsts_names;
+	int num_xsi_rsts;
+	int num_ppe;
+};
+
 struct airoha_eth {
 	struct device *dev;
 
+	const struct airoha_eth_soc_data *soc;
+
 	unsigned long state;
 	void __iomem *fe_regs;
 
@@ -568,7 +576,7 @@ struct airoha_eth {
 	struct rhashtable flow_table;
 
 	struct reset_control_bulk_data rsts[AIROHA_MAX_NUM_RSTS];
-	struct reset_control_bulk_data xsi_rsts[AIROHA_MAX_NUM_XSI_RSTS];
+	struct reset_control_bulk_data *xsi_rsts;
 
 	struct net_device *napi_dev;
 
@@ -611,6 +619,11 @@ static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 	return port->id == 1;
 }
 
+static inline bool airoha_is_7581(struct airoha_eth *eth)
+{
+	return eth->soc->version == 0x7581;
+}
+
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 

-- 
2.51.0


