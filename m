Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88746C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQGxct6K/kcQfnhWWRbqYBef9aZOoyPtucqW7qysfzE=; b=O4NXLhOsbA6BZpKz0+Gfv1gC1G
	2WM2+ZCctXePnqtGqhK2D3XpGWmzcSjzyX/1DWipqJTX//KRlbe7H2d/Y8zIxiFbrZOQpuqglHeeR
	9AlEspXfQsCeeUNXvdOrHK80QgLkL+hoA/E6pp/lgihT42B3kU44JVuSKNftcnohct7/e18a1M7gs
	4o56PynLGOpFqNXOyhKTheLPo8MBG8m9xNGsM35vzfpjjIJcjyPKk6x3SOGOw+HVBBSRt/KRf2qW9
	qL/3xc8QbqZnCUeqIop61/bAiLYC1uvm932dwv6Vwp3ZNHZUS9ILojXW5FvRP/AMwVPlg7if6wUsj
	DmBHnW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sjR-00000004XsT-18zI;
	Mon, 21 Apr 2025 15:06:49 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sdo-00000004WRi-3GhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 15:01:02 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6sdZuvbDkiSFB6sdnuVIhr; Mon, 21 Apr 2025 17:00:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745247659;
	bh=eQGxct6K/kcQfnhWWRbqYBef9aZOoyPtucqW7qysfzE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lanKLMiBzIxfxJmc7t6l6/EY6wAoIPabSGxj0Rr9WYgZ1DtW4LG5/yX6ZzxSPoewd
	 S09Fb58NLEVqgY4HC8Bm2g1mgyf3hdRdwBVtBp5WwwattuEnmc577xr0XWlmhqKsZE
	 OkDE5UxyqqDJh/3D6CMmlhntgaa3A0tWS6biYVZVU9wYbT5kwwdr1QaYHim7jFYdXQ
	 DWI799IXkcymu4XLSVM8x38bXP/WgPivZtP7Ii+jeXM6+KANHyyIcF0Nu8rY7q8amR
	 qWZBjOUnsI+2ideqHM/qbFkNeZTD2LMZo/eC1gtvgDSaAqPEv5RVdzsmqYrn64d8+V
	 evUxhwiBt7ptQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Apr 2025 17:00:59 +0200
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
Date: Mon, 21 Apr 2025 17:00:34 +0200
Message-ID: <74d69e8de10308c9855db6d54155a3de4b11abfd.1745247209.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
References: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_080100_949893_D4A6BF66 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

exynos_lpass_disable() is called twice in the remove function. Remove
one of these calls.

Fixes: 90f447170c6f ("mfd: exynos-lpass: Add runtime PM support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Compile tested only.

Changes in v2:
  - Add R-b tag

v1: https://lore.kernel.org/all/ee6241d024c4cb68622dde9d65d8712016f4205e.1743231856.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/exynos-lpass.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 6b95927e99be..a2785ceea8bf 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -141,7 +141,6 @@ static void exynos_lpass_remove(struct platform_device *pdev)
 {
 	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
 
-	exynos_lpass_disable(lpass);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		exynos_lpass_disable(lpass);
-- 
2.49.0


