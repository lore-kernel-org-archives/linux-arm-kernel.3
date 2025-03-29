Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04E5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 07:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=388xrznfvx3yUimg5kNws/DNZuCQE1j80sB1rbo3xPc=; b=Ljs4ecrHRsCJh95HIdgOMnFXpJ
	d+sDlHaPbQ/hPXmBgYLiYs1/G+besrNqClt200lyuJ3Mm6Nr3qOABKnrzcSx/mXjsbb8FDsrzbbk0
	Dbw2QO/ukEJKJmsjQuVyc5VQZUnAcG1DzJ3+CCHNWYZmgLTXZhNR3PY3qenXUogxQYGlPu9g4u4BI
	HXVjcV8F6awkxcBHaGy8w7g2G19So6Qo7UcRBQPeSbdumei7jzqlGMILOHLhk5ruc6gJ8gHhIu9Aj
	9eH7WvPFd8u3rAcK8D3McFJd4TqSJ2v7shp1aFLC6O2FchpFryQnGthd3H/X1Q6WoMrJBoZKB1JW4
	Rmr/oDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyR1z-0000000EsaK-1Kt4;
	Sat, 29 Mar 2025 07:55:03 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyQtc-0000000Es0e-0efg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 07:46:25 +0000
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yQtAtsN3Ol9slyQtbteVkC; Sat, 29 Mar 2025 08:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743234384;
	bh=388xrznfvx3yUimg5kNws/DNZuCQE1j80sB1rbo3xPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gMqSk2Sb96QmihcEfm2HH+vPYGVUcku53uvdvYXABZH++CMEHLYHCGS41nAOtVnnx
	 hdyCnNSeMgSTKbDo0nmbONgBqUrLnruKolB7Coxuy+XgG4J0Csg1vAd7+ll5rte7hI
	 DIXcQva1JvEQL8EjYqZiP80ZnqjZa/sf3rFqMCZZ0IxAYheyrfpOTNXxe81LbG/LE7
	 Te4kQ0JvtSWczjdjEoFS3qzrlVba4EXxKUgoj53l71j3b5KwrSpCi2AhIjqczF7C2H
	 YF9yRqYzzb5RaMTSgWtnZ+l0N0vZFBVGc0uNLf/91tG0HuMbKEZMSnG/Dr44kf5Mti
	 YujWgPBiN4FMw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 08:46:24 +0100
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
Subject: [PATCH 4/4] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
Date: Sat, 29 Mar 2025 08:45:48 +0100
Message-ID: <d224865a16b50498279b044a819e1e187d01bb28.1743231856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1743231856.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_004624_329559_A58D18F3 
X-CRM114-Status: GOOD (  11.77  )
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

Add the needed error handling path.

Fixes: c695abab2429 ("mfd: Add Samsung Exynos Low Power Audio Subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/mfd/exynos-lpass.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 7fd8585ba35a..9f2601e4e583 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -118,6 +118,7 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct exynos_lpass *lpass;
 	void __iomem *base_top;
+	int ret;
 
 	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
 	if (!lpass)
@@ -143,7 +144,15 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	exynos_lpass_enable(lpass);
 
-	return devm_of_platform_populate(dev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto err_remove_exynos_lpass;
+
+	return 0;
+
+err_remove_exynos_lpass:
+	exynos_lpass_remove(pdev);
+	return ret;
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
-- 
2.49.0


