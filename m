Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3BDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDiD6i5z74Svk8ayjFfG3byf2okiGeHcsi0aPvSYhp4=; b=eqHmuQtrhL+ZN35eoiY0cDkZcO
	idgbkNqY639x6qkhX52RrHokaGqzfs+qHsWd+sjIOrDwIO0WOGpmYnGddA1gd+hWi3fVodcPBJCjC
	WkTu7y1QotPtC8XPTSVCidh3S+TasvRKJDPiQxykGZD8p2eZplO5BMWSw4xtP5Pdml0UGiM/hCv0n
	8+aca7OtAHcNtgy9lQGPP6bf3IKd3FbobzxJWVKFsbKBG26KzV+HiMUfrU3gyWJktlzaOti8lbCaX
	G+pDCcqm9jwdat53CDHB1hg4Dyu+04UeKN4DanZNuJMyzWTx24GoOQAqomdabK1UTuP3ta8o6tuFs
	IfBalqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6slI-00000004YLw-0Axl;
	Mon, 21 Apr 2025 15:08:44 +0000
Received: from smtp-20.smtpout.orange.fr ([80.12.242.20] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sdp-00000004WS6-3k7J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:01:03 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdouVInx; Mon, 21 Apr 2025 17:01:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247660;
	bh=lDiD6i5z74Svk8ayjFfG3byf2okiGeHcsi0aPvSYhp4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TMDdinCevHrGlNSotraIExhYUUGQae64ddIrEp6bd0XSCA1+Jk0m7bu3F9FznLspd
	 y22+b3pTuyNWNdACISmjM9k3ZUa3BF0OP1kK5PQJ9Bcq8EKricbp/p1aM6WMKiAAtg
	 XTfdIlF+Vz7/Zj48lwAl4z1ZjfH6Y8wbpGGBQFQhmSiXMaR9f9bSPjyoDmMC4Ow7Cf
	 CGxOamH4eLNFL84D/KzE+HXEqAhDgMBh9RW9DPnEkzcuQgMja6tk68ORJc8iX7qoer
	 ozv6aqr3iIBSAcibvCrDYp0/C8TYO+8d/HShNSpC2xz/+fAhKotH/kNBQG1xWHYD+O
	 PECPhzQemEurQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:01:00 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lee@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	m.szyprowski@samsung.com,
	ideal.song@samsung.com,
	beomho.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
Date: Mon, 21 Apr 2025 17:00:35 +0200
Message-ID: <69471e839efc0249a504492a8de3497fcdb6a009.1745247209.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
References: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_080102_066635_26ABBF64 
X-CRM114-Status: GOOD (  16.58  )
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

If devm_of_platform_populate() fails, some clean-up needs to be done, as
already done in the remove function.

Add a new devm_add_action_or_reset() to fix the leak in the probe and
remove the need of a remove function.

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - Use a new devm_add_action_or_reset() to fix the leak in the probe
    and remove the need of a remove function.
  - Update the commit description accordingly

v1: https://lore.kernel.org/all/d224865a16b50498279b044a819e1e187d01bb28.1743231856.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/exynos-lpass.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index a2785ceea8bf..44797001a432 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -104,11 +104,22 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.fast_io	= true,
 };
 
+static void exynos_lpass_disable_lpass(void *data)
+{
+	struct platform_device *pdev = data;
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
 	struct exynos_lpass *lpass;
 	void __iomem *base_top;
+	int ret;
 
 	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
 	if (!lpass)
@@ -134,16 +145,11 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	exynos_lpass_enable(lpass);
 
-	return devm_of_platform_populate(dev);
-}
-
-static void exynos_lpass_remove(struct platform_device *pdev)
-{
-	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+	ret = devm_add_action_or_reset(dev, exynos_lpass_disable_lpass, pdev);
+	if (ret)
+		return ret;
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		exynos_lpass_disable(lpass);
+	return devm_of_platform_populate(dev);
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
@@ -183,7 +189,6 @@ static struct platform_driver exynos_lpass_driver = {
 		.of_match_table	= exynos_lpass_of_match,
 	},
 	.probe	= exynos_lpass_probe,
-	.remove	= exynos_lpass_remove,
 };
 module_platform_driver(exynos_lpass_driver);
 
-- 
2.49.0


