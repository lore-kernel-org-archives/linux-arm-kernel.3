Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A91CD4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lqk0qjxtF+D8UlnS4c7pFGqetkwdoGFt8LgY3js1r6w=; b=xnPLwXv84yCYSDT+0auR/BK6KH
	slp+UTzBQruNLMiLRHN0muUDDGY/l9MBMIUJsnQqgRK7vPSQbae15tJaO2dBGQa5gUFcuSWySW9Fi
	b3ZmN5yxARFIUKuGbO1RySVJxFC5yeOKhjZstxEIsgH1HBzOEls4MeeKoV1gVbqb4abriUHX31NI+
	iDf5+GjQm/mTzPoZ3736IS6P9qws2DwcWYrIPguMq/M3thkUUs+Afx+YCmFMH8/Xfa+qUL/ewWlzb
	IY+O0tJQMwwnhX5q3IF2ZXcLea8cPD2SMkZxgUoUphn0xEZIbdN0SQPOoHH+Ah3+WI/TYNCwlzT0A
	Eoc5zRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t940w-00000007NGF-2Pgq;
	Thu, 07 Nov 2024 15:01:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93x6-00000007MDu-34Xq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:57:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so9203115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 06:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730991458; x=1731596258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqk0qjxtF+D8UlnS4c7pFGqetkwdoGFt8LgY3js1r6w=;
        b=S+ssYnb0Byl/8qJzOaiIdpqL3ugU6oVrqThcgdc/J6UQ+jXVQvTxN6ZSA6Dt9w+cWW
         Nd/AwFRT0DUUnqAmKltZAmwxJCDoRkb8dWIli1uczV9OqR5nvmzCBpYyDrKz6GLbvkiH
         d7wMtce91K+Q3tIA66QlUY7jD6xPFO9kxvJecC44Fv3yBQ1sqMsS7YrY97nXR1GkE1nJ
         3uPwNja3Q62luJMqL2a0C05R+AU+/xiLNxgpbUp2eHIQtUN49MisQBDVoGy0N0dy9IPc
         v7TGBXGBg78jE4FM8/C08Js0Yr9sXeYizgyJxcDi+Q/gQphc7ZCUZrC31RXRPorlAzbv
         SOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991458; x=1731596258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqk0qjxtF+D8UlnS4c7pFGqetkwdoGFt8LgY3js1r6w=;
        b=RIOoVF2fY/QWiRnmIVUNufkGfMVCm0NvxWU7Qnf9rso5vl5E45qLy5VLMRP77kzU1m
         jVEqiwlh1dYDaoqe3keX8NxkU9XWeugfYGKMqZXWmgl+zPKzzITKd73ggfgqEOzXCwZH
         m7syZES785XoVbsDfzK0+eDqbYDN56LJGypLX6/BbHmzWHjK67N2P4Ef/u+h92WT4+U3
         SJ2V2LDhFposxTCOx74pb+ZPKpVys3Vwiv/O94DbQ+tWUvvryyeN8wTKKTW4Kclemzc6
         FDHgVQ3vPaTboq9g5T5SPuaTSOectDawMJbypBg2FKBTA8bs9B9Liq0grFs6iUB4PdHv
         DJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWXh5oUbc6PBh8jGI5Mg0bQ9p7xv0L/8MOJSJOWM9IYhTe8/PF58PoB5CUEm1uXUt7Yqt2wxEHXZEC1w4H+/wsv@lists.infradead.org
X-Gm-Message-State: AOJu0YxqpEh1U5DrvYWd6JJ4tTR+AKxBgSuegf0vLI461/JwYtFV8ykj
	G/S4TCvS4Job8UOkP2GTr7Loxj3DNFZ346/vkCZ3x3bkPkZXxCGCCo5BDOGPuvo=
X-Google-Smtp-Source: AGHT+IFutcR0bwD8WGqeYpA0PxXHK8DXeXLoWqc0ukDAw+4BGJ+GPCxRmhBmc2u0+oKs2PA+/pN2iw==
X-Received: by 2002:a05:600c:3c9d:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-4328327e6ddmr198325885e9.27.1730991458265;
        Thu, 07 Nov 2024 06:57:38 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e56sm66186115e9.2.2024.11.07.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:57:37 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH] memory: Switch back to struct platform_driver::remove()
Date: Thu,  7 Nov 2024 15:57:16 +0100
Message-ID: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9746; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BLY94gMzJV8bl1rs8ITlqHgcrX3WJaZb1Ugt48De6Y8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnLNVM5QHSsQ7HgmkC6FzXKigeL1KUUWrXvsJ6O VJasoc4Mn+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyzVTAAKCRCPgPtYfRL+ TigRB/0bxEq95zaC2k3YuORkpdyWmyAoPbkwl6e0yDuizDWC8tUPgkPxjP6tjGCeLnO0fqtTk3M y5yD+Jo9qpEaO8Q4tCyiWZ/2EMw2eXve2+L6l/hFHq1HwUcDe3uru2yXBaXpbrOgNAuMKRlpApR 4KoXUXbQETaAPe5MhVphrGW+dxWzf5I0XHMXefWcg2fHXsoz2EI5hKEk0c25S3dI4tM4RZFqnfK 08Pp2+RlDKgDMTRbstCJeYXCYZxKahvwrIhg6AK9FP6yPsTpc8rlMvQsdBx6zilVYUex/dBgxeO pXTfPBqNmRn6mTjrN6Qu5lwEUnReoNrvyOCiooTUjAvWL240
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_065741_157619_882CF8F7 
X-CRM114-Status: GOOD (  21.55  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/memory to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

A few white space changes are included to make indention consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/memory. While I usually prefer
to do one logical change per patch, this seems to be overengineering
here as the individual changes are really trivial and shouldn't be much
in the way for stable backports. But I'll happily split the patch if you
prefer it split. Also if you object the indentation stuff, I can rework
that.

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/memory/brcmstb_dpfe.c            | 2 +-
 drivers/memory/brcmstb_memc.c            | 2 +-
 drivers/memory/emif.c                    | 2 +-
 drivers/memory/fsl-corenet-cf.c          | 2 +-
 drivers/memory/fsl_ifc.c                 | 2 +-
 drivers/memory/jz4780-nemc.c             | 2 +-
 drivers/memory/mtk-smi.c                 | 4 ++--
 drivers/memory/omap-gpmc.c               | 2 +-
 drivers/memory/renesas-rpc-if.c          | 6 +++---
 drivers/memory/samsung/exynos5422-dmc.c  | 6 +++---
 drivers/memory/stm32-fmc2-ebi.c          | 6 +++---
 drivers/memory/tegra/tegra186-emc.c      | 2 +-
 drivers/memory/tegra/tegra210-emc-core.c | 2 +-
 drivers/memory/ti-emif-pm.c              | 2 +-
 14 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 5028467b2dc9..08d9e05b1b33 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -934,7 +934,7 @@ static struct platform_driver brcmstb_dpfe_driver = {
 		.of_match_table = brcmstb_dpfe_of_match,
 	},
 	.probe = brcmstb_dpfe_probe,
-	.remove_new = brcmstb_dpfe_remove,
+	.remove = brcmstb_dpfe_remove,
 	.resume = brcmstb_dpfe_resume,
 };
 
diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index 4f17a93aa028..c87b37e2c1f0 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -283,7 +283,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(brcmstb_memc_pm_ops, brcmstb_memc_suspend,
 
 static struct platform_driver brcmstb_memc_driver = {
 	.probe = brcmstb_memc_probe,
-	.remove_new = brcmstb_memc_remove,
+	.remove = brcmstb_memc_remove,
 	.driver = {
 		.name		= "brcmstb_memc",
 		.of_match_table	= brcmstb_memc_of_match,
diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 99eb7d1baa5f..2e1ecae9e959 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -1159,7 +1159,7 @@ MODULE_DEVICE_TABLE(of, emif_of_match);
 
 static struct platform_driver emif_driver = {
 	.probe		= emif_probe,
-	.remove_new	= emif_remove,
+	.remove		= emif_remove,
 	.shutdown	= emif_shutdown,
 	.driver = {
 		.name = "emif",
diff --git a/drivers/memory/fsl-corenet-cf.c b/drivers/memory/fsl-corenet-cf.c
index f47d05f7c5c5..ecd6c1955153 100644
--- a/drivers/memory/fsl-corenet-cf.c
+++ b/drivers/memory/fsl-corenet-cf.c
@@ -249,7 +249,7 @@ static struct platform_driver ccf_driver = {
 		.of_match_table = ccf_matches,
 	},
 	.probe = ccf_probe,
-	.remove_new = ccf_remove,
+	.remove = ccf_remove,
 };
 
 module_platform_driver(ccf_driver);
diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 15e919c24f81..27e041178c09 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -316,7 +316,7 @@ static struct platform_driver fsl_ifc_ctrl_driver = {
 		.of_match_table = fsl_ifc_match,
 	},
 	.probe       = fsl_ifc_ctrl_probe,
-	.remove_new  = fsl_ifc_ctrl_remove,
+	.remove      = fsl_ifc_ctrl_remove,
 };
 
 static int __init fsl_ifc_init(void)
diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index fb6db2ffe71b..1a8161514d03 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -407,7 +407,7 @@ static const struct of_device_id jz4780_nemc_dt_match[] = {
 
 static struct platform_driver jz4780_nemc_driver = {
 	.probe		= jz4780_nemc_probe,
-	.remove_new	= jz4780_nemc_remove,
+	.remove		= jz4780_nemc_remove,
 	.driver	= {
 		.name	= "jz4780-nemc",
 		.of_match_table = of_match_ptr(jz4780_nemc_dt_match),
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 2bc034dff691..5710348f72f6 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -616,7 +616,7 @@ static const struct dev_pm_ops smi_larb_pm_ops = {
 
 static struct platform_driver mtk_smi_larb_driver = {
 	.probe	= mtk_smi_larb_probe,
-	.remove_new = mtk_smi_larb_remove,
+	.remove = mtk_smi_larb_remove,
 	.driver	= {
 		.name = "mtk-smi-larb",
 		.of_match_table = mtk_smi_larb_of_ids,
@@ -838,7 +838,7 @@ static const struct dev_pm_ops smi_common_pm_ops = {
 
 static struct platform_driver mtk_smi_common_driver = {
 	.probe	= mtk_smi_common_probe,
-	.remove_new = mtk_smi_common_remove,
+	.remove = mtk_smi_common_remove,
 	.driver	= {
 		.name = "mtk-smi-common",
 		.of_match_table = mtk_smi_common_of_ids,
diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index c8a0d82f9c27..50eb9f49512b 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2743,7 +2743,7 @@ MODULE_DEVICE_TABLE(of, gpmc_dt_ids);
 
 static struct platform_driver gpmc_driver = {
 	.probe		= gpmc_probe,
-	.remove_new	= gpmc_remove,
+	.remove		= gpmc_remove,
 	.driver		= {
 		.name	= DEVICE_NAME,
 		.of_match_table = of_match_ptr(gpmc_dt_ids),
diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 7fbd36fa1a1b..55209ca43a96 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -794,10 +794,10 @@ static const struct of_device_id rpcif_of_match[] = {
 MODULE_DEVICE_TABLE(of, rpcif_of_match);
 
 static struct platform_driver rpcif_driver = {
-	.probe	= rpcif_probe,
-	.remove_new = rpcif_remove,
+	.probe = rpcif_probe,
+	.remove = rpcif_remove,
 	.driver = {
-		.name =	"rpc-if",
+		.name = "rpc-if",
 		.of_match_table = rpcif_of_match,
 	},
 };
diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 7d80322754fa..dfc5ee54a9b7 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1570,10 +1570,10 @@ static const struct of_device_id exynos5_dmc_of_match[] = {
 MODULE_DEVICE_TABLE(of, exynos5_dmc_of_match);
 
 static struct platform_driver exynos5_dmc_platdrv = {
-	.probe	= exynos5_dmc_probe,
-	.remove_new = exynos5_dmc_remove,
+	.probe = exynos5_dmc_probe,
+	.remove = exynos5_dmc_remove,
 	.driver = {
-		.name	= "exynos5-dmc",
+		.name = "exynos5-dmc",
 		.of_match_table = exynos5_dmc_of_match,
 	},
 };
diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 566c225f71c0..2f1e2d7d54b5 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1814,9 +1814,9 @@ static const struct of_device_id stm32_fmc2_ebi_match[] = {
 MODULE_DEVICE_TABLE(of, stm32_fmc2_ebi_match);
 
 static struct platform_driver stm32_fmc2_ebi_driver = {
-	.probe	= stm32_fmc2_ebi_probe,
-	.remove_new = stm32_fmc2_ebi_remove,
-	.driver	= {
+	.probe = stm32_fmc2_ebi_probe,
+	.remove = stm32_fmc2_ebi_remove,
+	.driver = {
 		.name = "stm32_fmc2_ebi",
 		.of_match_table = stm32_fmc2_ebi_match,
 		.pm = &stm32_fmc2_ebi_pm_ops,
diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 33d67d251719..bc807d7fcd4e 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -406,7 +406,7 @@ static struct platform_driver tegra186_emc_driver = {
 		.sync_state = icc_sync_state,
 	},
 	.probe = tegra186_emc_probe,
-	.remove_new = tegra186_emc_remove,
+	.remove = tegra186_emc_remove,
 };
 module_platform_driver(tegra186_emc_driver);
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 78ca1d6c0977..2d5d8245a1d3 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -2051,7 +2051,7 @@ static struct platform_driver tegra210_emc_driver = {
 		.pm = &tegra210_emc_pm_ops,
 	},
 	.probe = tegra210_emc_probe,
-	.remove_new = tegra210_emc_remove,
+	.remove = tegra210_emc_remove,
 };
 
 module_platform_driver(tegra210_emc_driver);
diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
index 592f70e9c8e5..df362ecc59e9 100644
--- a/drivers/memory/ti-emif-pm.c
+++ b/drivers/memory/ti-emif-pm.c
@@ -330,7 +330,7 @@ static const struct dev_pm_ops ti_emif_pm_ops = {
 
 static struct platform_driver ti_emif_driver = {
 	.probe = ti_emif_probe,
-	.remove_new = ti_emif_remove,
+	.remove = ti_emif_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = ti_emif_of_match,

base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
-- 
2.45.2


