Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B902C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3O1aQbyTnXSONGpU75C32COBQ2ziBt8HJunj0KbXERk=; b=fv6T31RInddZHHmM66kmSPBlzX
	jp66G0MCQnMl4HcJ3/VHZilpaFF8l3FxjUvo/Ezq/s88UZ4Uz5sGHNAFp1zv+dOVbuJHGkX7RMYl1
	eWnZinyHogT2LLKD8Roej3ShEqFxb6GBXUmRGoG02BcfYNl8+M6u7nTuUzuA9PQgj9nMIjGIiHCKT
	daTLjG7nuzvn58NQzS9HVVRvTlfpPRYVJ8zf6IdMWfYGkxBaKyYI4BImIi4u1T1t3RhPJrFG38luB
	DS7HEs03Hd4qiH8ymXF24t2xtgCa/ni87QI6nDZ7jpMvXB+M8nC54ADfvNAgcKSJXlD5Hk5LxZ9Ej
	W/jDevmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOsL-00000003Bv4-3R79;
	Thu, 31 Jul 2025 08:42:57 +0000
Received: from mail-m6099.netease.com ([210.79.60.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOjo-00000003Ae8-0cGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:34:09 +0000
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id decea274;
	Thu, 31 Jul 2025 16:34:00 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
Date: Thu, 31 Jul 2025 16:33:40 +0800
Message-Id: <20250731083340.1057564-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985f9de4ea0229kunm049fa475e108a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9KVh5MTEMeSBlIQktJSFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013408_388926_18ED9016 
X-CRM114-Status: GOOD (  12.78  )
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

The current error handling in exynos_srom_probe() has a resource leak
in the of_platform_populate() failure path. When this function fails
after successful resource allocation, srom->reg_base is not released.

To fix this issue, replace of_iomap() with
devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
is a specialized function for platform devices.
It allows 'srom->reg_base' to be automatically released whether the
probe function succeeds or fails.

Besides, use IS_ERR() instead of !srom->reg_base
as the return value of devm_platform_ioremap_resource()
can either be a pointer to the remapped memory or
an ERR_PTR() encoded error code if the operation fails.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/memory/samsung/exynos-srom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
index e73dd330af47..d913fb901973 100644
--- a/drivers/memory/samsung/exynos-srom.c
+++ b/drivers/memory/samsung/exynos-srom.c
@@ -121,20 +121,18 @@ static int exynos_srom_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	srom->dev = dev;
-	srom->reg_base = of_iomap(np, 0);
-	if (!srom->reg_base) {
+	srom->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(srom->reg_base)) {
 		dev_err(&pdev->dev, "iomap of exynos srom controller failed\n");
-		return -ENOMEM;
+		return PTR_ERR(srom->reg_base);
 	}
 
 	platform_set_drvdata(pdev, srom);
 
 	srom->reg_offset = exynos_srom_alloc_reg_dump(exynos_srom_offsets,
 						      ARRAY_SIZE(exynos_srom_offsets));
-	if (!srom->reg_offset) {
-		iounmap(srom->reg_base);
+	if (!srom->reg_offset)
 		return -ENOMEM;
-	}
 
 	for_each_child_of_node(np, child) {
 		if (exynos_srom_configure_bank(srom, child)) {
-- 
2.20.1


