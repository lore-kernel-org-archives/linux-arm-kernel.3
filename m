Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B505CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYfojg12w5muo1Y1nJcT6Yfje9fAPhcae6+0t2EB+gE=; b=bMzSr0y9PsbayJd1am/JC4nSC5
	ZW5YaPxBoPqCPENWovkW7O2Klre97ejvFYDRN8A1NBTTXrOb1BZKUIuOaD8pPCIAXA7HltaTPpOzU
	uPBBcQW0ms5dLw8Pab04Nx9CfGnzGFTTScjgeV78QAYFfFX8gXBsmQiSHDwlOx53gz6stVqO++OgV
	hlVoCnTYzsyT4JwJr7zL0bGat3RYq35SGV1/vgP8yrW9TRwLdEHqX/N1G/Zm7SORbgckLrOewsBKB
	0W4BL26a6j/a4p5vmGYfctVb+O/FobyPD/rS5ZLpJurJRbT1goSpCg8Kho2REt9kq2GvsuN1Pcca2
	SZ7vDYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnuy-0000000Dxri-1gT5;
	Mon, 18 May 2026 02:41:20 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnuu-0000000Dxpw-3ABu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:41:18 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2f68f3b075fso7593623eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 19:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779072075; x=1779676875; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYfojg12w5muo1Y1nJcT6Yfje9fAPhcae6+0t2EB+gE=;
        b=Vs1o7RSx2P5WZO9eIAjFF/Eglk9nnsXd6D5hjvbvVWEl/BAO0+liXAqfiaE89zW18A
         SubmwYqzcwK4wgZUd/TlxFhDfjeW4Evm1NZoDMSQgK/xbIMKKXLqaQth25TdWyRiSrHS
         g/6763F63kxjqIcyL1Giuosm2t/HpeI1vbhmA5vfKRcD8eAHyuDEqO4tCmsLDCgJNVEL
         kqSYvYgiyu34NYrcA6+MBcKZ4JAe8Y7Q6JoM5czvHiTJzg+eb5heENiAgrxzPw9tXQyO
         t7rLjf/4Y7j7C17Rg1zcAtDzgPfAOoa5AQZIvIXDyYjY6llXmL8ruNDUuxmiv9A6yaY+
         28Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779072075; x=1779676875;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYfojg12w5muo1Y1nJcT6Yfje9fAPhcae6+0t2EB+gE=;
        b=erHTPr/mBSzFvKqR3wv0sfl0g6D7hjwg1in5R9eC1SsdKkQH/BHvrW9Dm9NL8JEzLc
         a74Miet2ro/0/SrfidH2M5Obm0H6DdpPjVrbjOCfbxmyacSl4ThYlpwjrsR5Iaq/Uo3x
         0+ghurZ6gx3CfTHIcppmkhz25doYAwfEagXwMaon8y9oEtPtH9Pkop5/OMQOjONFhBk7
         PvqQNTbfjXjPy2dPc1u4hRSl4TbV8QyW4UhzHThoM4jsUMzrVXaFJbohdHiGix9Ub+WQ
         QgZompLhVyiIQpgAqUU7g23VuHKbU/0tDfQSHzNgsHhOUWHhtNy/S0ThIS60s73fov/U
         KR4g==
X-Forwarded-Encrypted: i=1; AFNElJ/MU2w2eqjBXo4+wZLDArQAJu1iObqbhXF0ddnXSn/2VydBPcttcns3TrEF60smaQYwDUYCYmFlHrJN0s94xUgR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz8zhippoMpPcnCPs9S9sAOnIV06/zTxbaY0wqu6QNQXXjb46W
	bA+ic3DBdtkhEmndQyLhAfKgD5Kh1Sp8IKfyj/j1IDCId7HoeVcyGRsz
X-Gm-Gg: Acq92OGXUGWywO3mPBpPUIrbLk6tixeHLRYtIob7rIycc9xq3ri7BeEs3swtlnCJhIC
	cqQ4EQOS6c3SJFa0gDMAw1DqXb0x5iEcLLmCITRHOg+VyQcP2RtpTQn65dPLcIcCJX3HeDruw8b
	vH3ixtrDeCoaQoRW5R1xYn5r0TFpBirpW7U2FbkyjATXXAJoFdEntv8JAYdId4sNETm8FyNsE92
	jGNX/3kXsHwzAo7aDJ5B1OAPNnSYHBE2I0GUyD/TIg2rEVHKBok31thRQKH02kcXN34mGNS0KGo
	v8v8Cv6XmNdU3zRc9UQp9O1wfp04WeGQBmaA/ywHG1JYH1NXn/FkE59LObl+ZQBd3wewnlvkq/O
	BMETJ5wrutPzIP/2CROeS3gAQD/p6rpizg/IkDQ00eD3Zit+mnQVdrRwTiisbYGJVmRRB20gbP2
	fjJM1u+TG5GSNjZlG1TSLBILS0D4+6TkINSjOWU4liOzXtj+JkhFUixe11bxK6O7xZjBTuUkmIt
	w==
X-Received: by 2002:a05:7301:6447:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-3039816bacemr6250335eec.8.1779072075393;
        Sun, 17 May 2026 19:41:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm13394794eec.8.2026.05.17.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 19:41:15 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 17 May 2026 23:41:07 -0300
Subject: [PATCH] ASoC: mediatek: mt8196: Fix probe resource cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw7CMAwA0atUXmPJsaB8roK6SF0DQZBEcYuQq
 t69KSzfYmYG0xLU4NLMUPQTLKRY4XYNyMPHu2IYqoGJWzrQEb0lwfd4cucWc0m9orzUxykjM7s
 9D46IBGqfi97C9/e+dn/b1D9Vxm0Iy7ICxn/9m30AAAA=
X-Change-ID: 20260507-asoc-mt8196-probe-cleanup-222142d1000c
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4462;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NQY0kyeCTdDm7O2l5wtg6rcyOWbfpOIoGV+6BXsEjug=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlcNe6JtUFtfgbVXazaLt8rss0LjIzi50y7e38R660Ds
 6zfftPoKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgImUH2JkuHxgTuuh4hOduRML
 b2ex+S46dcbM8f7Mmh3TmJccS/pRaMjwV3xax8suw2mTDQ/z2dZN8OC8M8+I/7dhosam3E97g/c
 mMwEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_194116_801466_F796699C 
X-CRM114-Status: GOOD (  16.65  )
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

The MT8196 AFE probe assigns reserved memory with
of_reserved_mem_device_init(), but never releases it.
This leaks the reserved memory assignment on driver
removal and on later probe failures.

The same probe path also uses unchecked pm_runtime_get_sync() calls.
A failure while resuming the device can leave the runtime PM usage
count in an unexpected state.

The regmap error path returns directly while the device is still
runtime active, and the remove path drops a runtime PM reference even
though successful probe has already released its temporary reference.

Register a devm cleanup action for the reserved memory assignment,
use pm_runtime_resume_and_get(), and only drop runtime PM references
on paths where they are actually held.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 511e888567be..a1ae8322d8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2242,13 +2242,16 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 static int mt8196_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* enable clock for regcache get default value from hw */
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "failed to resume device\n");
+
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
 	return 0;
 }
 
@@ -2306,6 +2309,11 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
+static void mt8196_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2320,8 +2328,13 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = of_reserved_mem_device_init(dev);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
+		if (ret)
+			return ret;
+	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
@@ -2422,18 +2435,22 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	dev_pm_syscore_device(dev, true);
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
 					    &mt8196_afe_regmap_config);
-	if (IS_ERR(afe->regmap))
-		return PTR_ERR(afe->regmap);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_put;
+	}
 
 	ret = regmap_register_patch(afe->regmap, mt8196_cg_patch,
 				    ARRAY_SIZE(mt8196_cg_patch));
 	if (ret < 0) {
 		dev_err(dev, "Failed to apply cg patch\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2452,12 +2469,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "afe component err\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	return 0;
 
-err_pm_disable:
+err_pm_put:
 	pm_runtime_put_sync(dev);
 	return ret;
 }
@@ -2467,7 +2484,6 @@ static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_sync(dev);
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 

---
base-commit: 2be19ed9535043fe6abd7ccfc9aac6b7ecaac842
change-id: 20260507-asoc-mt8196-probe-cleanup-222142d1000c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


