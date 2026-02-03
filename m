Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82414E8784B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeJQd2Zwsu6rTUzVeCo/Aa9tstJpB33YcC45CUcNTmQ=; b=phxwqP80/hLt0n1NPJZLhF13Rh
	N8mtMUL1EoyU0mfLi6g9ftZ3nD9/Exsxyat6uCXebn042MKW/qw43UAuiRZPu/ugCDyvo4eU4zAhy
	6SgTqcRcPY00zlPIm7hgoBAp3vewlHIkJ5AYMzb/AkfzdVrA+Vi0d2vlwj/H4qTcGdz5W0i8FryJu
	D8K/fqOGdAfw4WYNbUxukxG+/D+eVLIulVj58eOfwzOZVApMMFa6+Bj4nXRZRJP39Mhxhj8I/CdCn
	qRrMKuS+bM5HxTzYwETGsRSqWchqCgQWyUiX3FYFUj/cbqhqK5jk/3gd4afSir72nQ7GhGoz5tupL
	JsWyJnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY4-00000006xyJ-2RRY;
	Tue, 03 Feb 2026 16:46:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJXx-00000006xsF-3vKj;
	Tue, 03 Feb 2026 16:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pmprN5w75oipFVj1vkHikL5kpHDlp/8IozSFgEQJeYT2887bxNE+ILnV1iZruTVc4
	 1j+UlKFM+zQBh511Kquv3iUui5aagoaQMmiHm8Yeu6pBoqwdPA7NF8Pt+XwkSm1xPI
	 B43F4jhZ3mNUeDKm0fEBhBKtNahzvv05N0CZnSAZaiuNzjznFi+FL+MKpO/zwcxypA
	 koOOf3YWGu3M24c6Kp6qqgN+e2mDz2+D7VFhC4p8SCmeeklRMBHlhs0qK062YvTsdk
	 YNkHvCZ87v144IYJEotFAgE2gwUrxb2CPPCrPkq6FVQpnaU3stZRPEIkFvrtUxePVD
	 G8FfJOub4PSew==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B32F17E14F5;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 14224480028; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:25 +0100
Subject: [PATCH v2 03/10] ASoC: rockchip: spdif: Fully convert to device
 managed resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-3-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmmX8PJRFPV3YzuO97jWFDcsxO+D17Qqh
 UJ8i6FhXBD0bYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaS/QP/RtK2mrjYHXnWUAAJnBza2Oji43ti8QpEtuUhtxnoQSukxvugAj/1lgXgzvGmUeAdwo
 7/5WKSKaM/uTyF8DdR5MFl7BYezLUuLcUdMZrjBGdXyxleL3lsFi4msT6rrpdDgeeA4rHtx1iYY
 kcNSu3kXt0CDkne8+30hDKUuQP/y245XgW03b4imjn9H+/eGAlcxf3mSZgDbtAgFYCPTybIx+ML
 uUbcGyAZARHZWnMokHGzzxB7r9sha7pMRpT62PSQH5GLea+Yi2/dD9zybFCMuVRN1Fu1SOq7tl9
 XV9yTo9mtVVu5OkijkdRetKSZniWJyp46nXmVMtQnLrxNYQ+KnrCXxDpRP3K9/3McuhnbaHjleD
 iejOWvYemVb6jegTwKLab8baS1hIAHYM1Q8p6LbtGYCjTcGrmshmAsIO6DmdQA+umZofsuQsGuG
 3DfUSNMVzSuRsLZ+X4wUJ0lKLaq2PNquivFTv9pf1EUjLDor3dxDu8N2h/616ypfESc7Dq8GeXL
 efxC0vDaxcGf9Ln3K59SWkvSgyEaLn3fc+3/zGrgmVhKAsCNU0nf1mPbVz9FQYHe76zycfQTS3f
 T69/49/hXxOXmT+Gk8Ab33s0UJtBhrZFGsnT6VdX9pXNtaY0ggC4KysH3ZULJQm9KKYg3Yqagbx
 RELGYMtwpqEAwQ42CnCUv0w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084638_785902_5A74BAD1 
X-CRM114-Status: GOOD (  17.20  )
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

This driver mixes device managed resources with unmanaged ones
and (as a lot of them do) gets the order wrong resulting in
potential race condition problems at module removal time. Let's
go to full device managed resources to cleanup the code and get
rid of the potential race condition.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 331a23d5173f..841ef499ed7f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -257,6 +257,14 @@ static const struct regmap_config rk_spdif_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void rk_spdif_suspend(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		rk_spdif_runtime_suspend(dev);
+}
+
 static int rk_spdif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -311,11 +319,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	spdif->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, rk_spdif_suspend, &pdev->dev);
+	if (ret)
+		return ret;
+
+	devm_pm_runtime_enable(&pdev->dev);
+
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = rk_spdif_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_runtime;
+			return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -323,31 +336,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 					      &rk_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
-err_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static void rk_spdif_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
 }
 
 static const struct dev_pm_ops rk_spdif_pm_ops = {
@@ -379,7 +377,6 @@ MODULE_DEVICE_TABLE(of, rk_spdif_match);
 
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
-	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = rk_spdif_match,

-- 
2.51.0


