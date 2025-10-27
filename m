Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAABACCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oeIS8EIA8tV/DRtmrbfkAfy9s1uN5beSjtj+Mb/s6c=; b=CvtnAEu510Ae9A8PESqLEPp7Ls
	1d/LTVBEZdEww8ykGJiUKc3EhVvvbMIHk7m1VyLrKkqwcrZbVDYZfIQuFC+FmnpMz0to7PEG++VGk
	6mVAhhRmVrWrlcyoRRAXRyUWfCuWfCx70GZG+QFLPohtDe0AVb3qmf0+xCRhRJa4A/H3bulJGADLV
	ZGhoKiutEADBL1vKHrSh0QKxHqsmNDkANbgnae+qH/1JdyeY11cRHZgiFn6SZkqS1t7oPGnx6tkgF
	HAjATv7cSirgjJccFv+XwloV9HMXWuBI1lUyK8ln1BTVy5qkV+Ry0KJsKHLT2OfOxkd6Lb5b4VKyl
	BSFpBbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmf-0000000Dx36-2lDi;
	Mon, 27 Oct 2025 12:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmZ-0000000Dwyl-2pER
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0oeIS8EIA8tV/DRtmrbfkAfy9s1uN5beSjtj+Mb/s6c=; b=Afw86ZqYJ805Tl4EXSKyehZLoS
	cKsPJGh2koUi1SDA9AgQJDAUTt+CuOey3hkX9DcZHkcair/gDgh4tBJMsxuNIV5BRn2NPmCB6wKEv
	BI04pLG4opBZp9uPvsdUtBL7vHDW5lDlqLgaJRbm2m+urVE5CmOgtW+L2BeQdG2KZXuAoTsU1WOLH
	hZklaOeBA+kZLQFgtuygnESeMcdatyw8quFuc5qs0n7+y7MSktgWaxZ5U3+tvmKjtWFUg0+N5GvJI
	TqUixGLUsoG2QA2hoFjWbRIAuvUSbszidZjLUseRExUGzZPgb64h9Ko66jCfxxepMUDVdrKvZEAbv
	0yN3DVFA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLul-0000000270T-0zUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D74459CA;
	Mon, 27 Oct 2025 12:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9365C19421;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569820;
	bh=zxJ79mA1lCmnOVxEdjNKKgjbhpuWz79NbCyv/SzMZnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YHZDMTLr3lwyO8l6wrInwbdUuhdncaCwZ9Zhr1SZXbEfLFaNW0Fea+0g8ZCksTdXl
	 w3jM0ZTCu/3tEkV2pcKDgTzYmob7A8A/UtHCOUcHvfDjprmNT+rdrFj+vWZCyeUf8b
	 kLGIOCIz+FqoySc3Apx1fY7Yc+iwzlWUV0DkNM41wWLEHi4rd8m2yJBtqAJBAmHxBr
	 BPzovagqCU838CIrey56iuHp75/IxTxqYCecIqs8Cr0euOhjxzw1tv0w6CMwzhId+H
	 J9xRafULE7Txu4/Dm5OewCkiPep+pOYHJUbBTEZdynXcx92f2h6g7OFvu0AKhBeSiV
	 emgADGE+zq/Lg==
Received: by wens.tw (Postfix, from userid 1000)
	id 89EE15FF19; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 27 Oct 2025 20:56:45 +0800
Message-ID: <20251027125655.793277-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120131_613535_7801AC11 
X-CRM114-Status: GOOD (  19.22  )
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

The TX side of the SPDIF block on the A523 is almost the same the
previous generations, the only difference being that it has separate
module clock inputs for the TX and RX side.

Since this driver currently only supports TX, add support for a
different clock name so that TX and RX clocks can be separated
if RX support is ever added. Then add support for the A523.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

---
Changes since v1:
- Dropped bogus name removal
- Dropped clock rate debug message
---
 sound/soc/sunxi/sun4i-spdif.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 34e5bd94e9af..2e7ac8ab71bb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -177,6 +177,7 @@ struct sun4i_spdif_quirks {
 	bool has_reset;
 	unsigned int val_fctl_ftx;
 	unsigned int mclk_multiplier;
+	const char *tx_clk_name;
 };
 
 struct sun4i_spdif_dev {
@@ -572,6 +573,14 @@ static const struct sun4i_spdif_quirks sun50i_h6_spdif_quirks = {
 	.mclk_multiplier = 1,
 };
 
+static const struct sun4i_spdif_quirks sun55i_a523_spdif_quirks = {
+	.reg_dac_txdata = SUN8I_SPDIF_TXFIFO,
+	.val_fctl_ftx   = SUN50I_H6_SPDIF_FCTL_FTX,
+	.has_reset      = true,
+	.mclk_multiplier = 1,
+	.tx_clk_name	= "tx",
+};
+
 static const struct of_device_id sun4i_spdif_of_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-spdif",
@@ -594,6 +603,15 @@ static const struct of_device_id sun4i_spdif_of_match[] = {
 		/* Essentially the same as the H6, but without RX */
 		.data = &sun50i_h6_spdif_quirks,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-spdif",
+		/*
+		 * Almost the same as H6, but has split the TX and RX clocks,
+		 * has a separate reset bit for the RX side, and has some
+		 * expanded features for the RX side.
+		 */
+		.data = &sun55i_a523_spdif_quirks,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
@@ -635,6 +653,7 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 	const struct sun4i_spdif_quirks *quirks;
 	int ret;
 	void __iomem *base;
+	const char *tx_clk_name = "spdif";
 
 	dev_dbg(&pdev->dev, "Entered %s\n", __func__);
 
@@ -671,9 +690,12 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 		return PTR_ERR(host->apb_clk);
 	}
 
-	host->spdif_clk = devm_clk_get(&pdev->dev, "spdif");
+	if (quirks->tx_clk_name)
+		tx_clk_name = quirks->tx_clk_name;
+	host->spdif_clk = devm_clk_get(&pdev->dev, tx_clk_name);
 	if (IS_ERR(host->spdif_clk)) {
-		dev_err(&pdev->dev, "failed to get a spdif clock.\n");
+		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
+			tx_clk_name);
 		return PTR_ERR(host->spdif_clk);
 	}
 
-- 
2.47.3


