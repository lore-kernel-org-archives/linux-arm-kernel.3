Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EA6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxG5GpmIEqwoUGwr9bKBwNL+mtU3l6sCszbqj7Kxf5k=; b=eDBpUMK5S/pYKqcthKocZ+ki8C
	lnSRENQ1KVk0Q7DLPPi0cT5dWaDNVxKnuc+ufBv5Zpz9Hl1HO2DGFWNK1H3ci2bnn5B9OsFzow20L
	JtVU0sbhxCtwwXlnV9vmxbvs0anR9Kbt3EIm5vcNGEYdfe044hfpnDPnbWNHPLozQQAXLIbFJ9hk+
	0s7jSVF6Bsxk/oIAc3QWOVmc/p2DxW1F0VdvtsXKpcTWumMoAiLW+bxrVPq6JcdA+sB74KQbw7q5I
	KSdrAsmj7Zuaux1sKnbIt2DBZOBNgOz6ahmL4IeGddfgEDMoW1P0I/7B2YerxrnpR0jdr7aruTddI
	eaByDWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQwr-0000000EsEG-0n0s;
	Sat, 29 Mar 2025 07:49:45 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQtR-0000000Es10-2FSj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 07:46:14 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtPteVWL; Sat, 29 Mar 2025 08:46:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234371;
	bh=lxG5GpmIEqwoUGwr9bKBwNL+mtU3l6sCszbqj7Kxf5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a7IGOrxC3ED9Gj0NKMZBuUpb3nmtMAW5WTnV5xDlQida/pNILs6MYQAfcCUYl8jQM
	 HfhLvVpPiVOa65RHj8V97d82otML7mK/Agj6jM1g/GbYix2BhHCk06AmNZ8ZS35N5E
	 i0Dab7gM3eqHYuAHh0pQqEMy1EACDJ5TR0cGvsM2laAi16LGag3xSdGI5o8VZHs0ie
	 dblxMUNIl8nkxDiCiftaPx+yCk1iz3XGYyl+xaym2Xr0XQxjy7grz0hFjFLpxsgIs2
	 LvU6T4Yfs1eeXMX1tRVZeX1eq849X2xJbjUH8TVGamh+KvvSL4s/mHXcYiD4Duknyr
	 ALJWB3QkNN4OA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:11 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	beomho.seo@samsung.com,
	ideal.song@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/4] mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
Date: Sat, 29 Mar 2025 08:45:45 +0100
Message-ID: <d125cbc479f1fa838ed0ff25f0e11d25f382e9d4.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_004613_709516_3F6346B9 
X-CRM114-Status: GOOD (  10.83  )
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

If an error occurs after a successful regmap_init_mmio(), regmap_exit()
should be called as already done in the .remove() function.

Switch to devm_regmap_init_mmio() to avoid the leak and simplify the
.remove() function.

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The .remove function was added in commit c414df12bdf7 ("mfd: exynos-lpass:
Add missing remove() function")

Compile tested only.
---
 drivers/mfd/exynos-lpass.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 6a585173230b..6b95927e99be 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -122,8 +122,8 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	if (IS_ERR(lpass->sfr0_clk))
 		return PTR_ERR(lpass->sfr0_clk);
 
-	lpass->top = regmap_init_mmio(dev, base_top,
-					&exynos_lpass_reg_conf);
+	lpass->top = devm_regmap_init_mmio(dev, base_top,
+					   &exynos_lpass_reg_conf);
 	if (IS_ERR(lpass->top)) {
 		dev_err(dev, "LPASS top regmap initialization failed\n");
 		return PTR_ERR(lpass->top);
@@ -145,7 +145,6 @@ static void exynos_lpass_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		exynos_lpass_disable(lpass);
-	regmap_exit(lpass->top);
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
-- 
2.49.0


