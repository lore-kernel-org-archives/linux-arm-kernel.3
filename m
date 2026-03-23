Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4637BF483D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sHP+Gzf71jjnGaGqTSHeqCrBJS3y254vjovFLGZNq64=; b=AiziQLLi5nD77PAhLkzUIFwojY
	W4y6ZfcYZpvCknare9BGFgb/pNGYnooFKgJcRo+rD+hgVy6RK43ySjfw1uEWcmJUov7riJIAdPBL2
	UTnwFgAYkjtr5rX3dGnjW7714g2ECVSBhP9QEnEUuG7giU1oxofLlvcMD20lCTEomcktLmI65zKTg
	raGzVMRRNFSBQ8WchbY0vhOxmfat4Vs7qBnkuheafOSzDXlm483pOGaLbpqACydH+6XFqZG4TajWP
	T3DD+YHvQJnOY+AW6Upoa5Q8yzf4bviJbhMXAnfyeSrsk7tNS3miqsBUmPGP6o8KPencwKEgs+eit
	PDjHRQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j1T-0000000HDvi-1IGc;
	Mon, 23 Mar 2026 17:25:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4j1R-0000000HDvH-2N4m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBD72600AC;
	Mon, 23 Mar 2026 17:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D06C4CEF7;
	Mon, 23 Mar 2026 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774286700;
	bh=8x3XhKTRhj8fiC5KBOLOsXbRYGBoZP9/5mMJZOSNv0c=;
	h=From:To:Cc:Subject:Date:From;
	b=mEkhw5uzX8sIiPj3SFwm2P8eG5Ssi5hiPcfCnuLQB7S8lqbqi9BIFzBP+4nra7+OJ
	 pfYBNM1doj7m8NjEIDuh+mcXAuf4C7YBvED9uKKAExYdxa4L8+zaoEjR1KY37p88xT
	 Ni2lcBTFjwd8g7bVLdelcxjqGf9BLUCCpz94wBDeyG1yvKKZTm863mTqlzsL6iiir+
	 98LOh7eu+ySwXmZUn6WvhNcz8Xn1H71sEbBe6tUNKMy4uaEaIi+h/JCYLn3upSYDk3
	 RETxZMdvOHYxnuw2s70GwvhtRgn755gYV0foTN8sfO+GSOHniaU2K/7bJZ1g8HC7IM
	 Zgro5kx1tXubQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 771605FBE4; Tue, 24 Mar 2026 01:24:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and check for all errors
Date: Tue, 24 Mar 2026 01:24:48 +0800
Message-ID: <20260323172450.1259111-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

The logic around the reset control is weird. The driver already has
quirks describing which compatible strings require a reset control, but
the reset control is acquired using the "optional" API. Then any errors
other than deferred probe are ignored.

Instead, switch to the non-optional variant. Also use the deassered
variant to simplify the code. This also fixes a missing reset assert
upon removal.

Last, clean up the error message printing with dev_err_probe().

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 65de03ca3ad2..c2ec19437cd7 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -712,15 +712,10 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	if (quirks->has_reset) {
-		host->rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								      NULL);
-		if (PTR_ERR(host->rst) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
-			dev_err(&pdev->dev, "Failed to get reset: %d\n", ret);
-			return ret;
-		}
-		if (!IS_ERR(host->rst))
-			reset_control_deassert(host->rst);
+		host->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+		if (IS_ERR(host->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
+					     "Failed to get reset\n");
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
-- 
2.47.3


