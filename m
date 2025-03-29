Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNdM5ts0wg1oqDwj15hlgi9Z0FrXnMRdaahatqUkprE=; b=aMBRt9k7LiSWoYtoJ1dqajiXlm
	YyUTzE7Yo5iMryLbXCts2pAnEEy+L7kdXpXQmZXhJJFo5V3Q3SKa7lsXFuBe5jCtQFs0xhM5+b+nT
	QN4aIDbGHAhIC7qcYXs+oEtkftdTXhASXrwt/3lrCGBT/3gegbfHrtIBKHdNWZnG6GOR27G3rw+Lf
	tuUuGHnJDgcQlqVS6mSuUjS/N/vYOUuEdIcCNqIrxjC/FxA/c+XmTsEKBjApKwT9pkZ+LqThO13Bt
	kyFXLjTnKXfMOZYx1lEkd+O/eLZYsRV6msBtDu+gWfSNRgMTQdPN6QXve+5RWhZwjGnSvR6GuW/wr
	Osg60dPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyR0H-0000000EsTY-2bRI;
	Sat, 29 Mar 2025 07:53:17 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQta-0000000Es10-2ztW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 07:46:23 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtateVht; Sat, 29 Mar 2025 08:46:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234382;
	bh=KNdM5ts0wg1oqDwj15hlgi9Z0FrXnMRdaahatqUkprE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=toNjNc9z8A13w9pHBhyEt10kmMSCVLOwaRh8sQqF0KYujLm1+4+ltUK4HTV9XFkrj
	 UN4Li0VoUiMJ/noc5zosYfrUn6njUPMRx7/d57sQ3WY57/tPnN8LfvYv0v/5W2OHJH
	 MUAIhS6t8WH6wQmD3FAs12yYUtIMx1RqJ4b1yzVseCkZ04ymljsucsUyZo9gHY2WQZ
	 aLk+9hoAuv/JmNQqTddLhoNqrI5bnraOaoT5I72SkRVlFpp99pb2ACnpjYJcjcNXl4
	 jc8siBqdnbwKPXdEB5PHr4j76eOE81PZOoNv5vUR+dx0bzcgtbOtx16rk+lgKJ87sP
	 oOnJcRteUfvhw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:22 +0100
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
Subject: [PATCH 3/4] mfd: exynos-lpass: Move exynos_lpass_remove()
Date: Sat, 29 Mar 2025 08:45:47 +0100
Message-ID: <1de670e6b9fa33cb81a34e5f882e79b80e479490.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_004622_886918_4631580F 
X-CRM114-Status: GOOD (  12.33  )
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

In order be able to call exynos_lpass_remove() from the error handling
path of the probe, it first needs to be moved before the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/exynos-lpass.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index a2785ceea8bf..7fd8585ba35a 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -104,6 +104,15 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.fast_io	= true,
 };
 
+static void exynos_lpass_remove(struct platform_device *pdev)
+{
+	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		exynos_lpass_disable(lpass);
+}
+
 static int exynos_lpass_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -137,15 +146,6 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(dev);
 }
 
-static void exynos_lpass_remove(struct platform_device *pdev)
-{
-	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		exynos_lpass_disable(lpass);
-}
-
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
 {
 	struct exynos_lpass *lpass = dev_get_drvdata(dev);
-- 
2.49.0


