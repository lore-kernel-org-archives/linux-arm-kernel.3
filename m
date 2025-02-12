Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE24C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pc0F/lVzkzvL4J3GzIJyy7MBw6sqmJhjXpSaIwLTkG0=; b=rRh8kZtzDPyD8KGf8DGyMKcqQl
	ZyS6FG+DcW83IX+4sDDjc6WmVcoXCqobtRcAi5tEy3dU+oCfd0xmaaktyTASwgRC0U4XYsgz0lSHs
	Srp5coHwO9tuuYStSmtthvi9vHLQjHmpDt8KqVy4OV5vOb0NvGdn/nsZXByfnHH+oyvMiLUy2X1FT
	L6zncKRu5oBL/o23OokuRIR0ave1LNpE/ErlFXWKIBmk8ba00+nFblGt3u4+6s70hIOGNCgwPBFfa
	Q320DNEdnUfbJvEHrcFjUQeoppSGQw6rHwzA42pl5Pxr1V2Qo8w8/bqi7RWq0bxNxcb93ojKeSpKt
	XBaSAvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKPb-00000008v9M-3ZXN;
	Wed, 12 Feb 2025 21:36:51 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKOA-00000008uom-3ObT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:35:23 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b858357124so2284185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 13:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739396121; x=1740000921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc0F/lVzkzvL4J3GzIJyy7MBw6sqmJhjXpSaIwLTkG0=;
        b=mWmoimJIaRDMWww9U+SVx/oBUY1+7SIyXb4YG0tWsVYfTYDR5qF2O/G5m5fnfMsvG/
         RRCWokH75Oefyv0ys8YRQ/eUsgw1n5khvaLOcCwFEYLeK4ez5hXriwNQIL+0ylte6y+n
         uTbpeJSP3GWSvj2mTUNOUvFX2wVzsOZrIng8mx5DlxzWYlTfFXrG65S4PabaRcz/qrX2
         D9L9yB5QQCnHXaPL/Bq4yQzFWqhprhF5QMqPeN+YzsyTvOCdDiujiFVjPbS8BRdIyQ3M
         2srYKy2RGxPsjzcrnSmDvktc6qRihaGriF4jKmJAOe7Tew8zd72ljQynrETsu5r1AqAe
         L5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739396121; x=1740000921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pc0F/lVzkzvL4J3GzIJyy7MBw6sqmJhjXpSaIwLTkG0=;
        b=bP7LPpEpulgLjG/pH8+0XjeaQ6uCkrGR/R4gWPsXXel6LRuK2NfFlwFTArqtbWLUHV
         Wyg8QEpVvCItPpA3DVvfrbvODaQKxRdbzaeMFgU81t/BNz53vUAGs6Batv2HbS7DIJCx
         kNQl71TKDEA2Ln2+IpIogjuPuB9ZeuGE0uVAMaVdb5EsXqnX2VfamLAPY9KobbWBbyUk
         F2CV/+gLSM4q2irtyOeLAdlIu3yVc84QV3g6JXA2ASvNEBh9uOl+N8V2DX3bmPgHUMm6
         0L9RXymQxlU1vY5gPfLSJeKy6VcMG6m9tyVYPaK+ClYnB1FJpcvJWLqSvfWxZEppu9yL
         l4ng==
X-Gm-Message-State: AOJu0Yx1J38jbVNy8jbQssQHp02qWKA1ahQSH8INwVi5WYav1BmsNBxT
	/jQbgoY0C7wNDUvehkAryCxmsCfXNpKwq1Iyj5BwSkZMzCP5f1Q=
X-Gm-Gg: ASbGncuU6yU9NEMTnzMCW4YYqBo9cFwnpYwXSHyzwBxgQmrK2SUmThV8K2NnxAvOWWG
	4fmVx/KRMRkT9Tc1d6WyEfEF6JGE1IAoZ8vckSeKSl8FY/QlM3BUwO3hFK+aM4+oQq4aROtJxht
	d4gZsjojBkJKMI5NYu516zxzScWcaaEjQGKmn98SmTFW6e0AiqbRhVYIgJZA2BvQtqvG+734hf0
	Ie39dUcJvkXI/jgsAIk4uRv+haX/6SH7Ir30Tpp4I8Bpr4xJw619VU3ZZHqwEVXQ+z6mZ2A795z
	+m0DW30WXbK0
X-Google-Smtp-Source: AGHT+IHMYVT7cXF1vDiX/RjUDK6KvUjj0T8L9QgUzk2mdCPDRHq6yQlf9pMqq1wIwsyxD4WnU7kb2Q==
X-Received: by 2002:a05:622a:1aa2:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-471afc434f9mr26501551cf.0.1739396121510;
        Wed, 12 Feb 2025 13:35:21 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4718911f3e6sm52249671cf.37.2025.02.12.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 13:35:21 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com,
	richardcochran@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
Date: Wed, 12 Feb 2025 15:35:18 -0600
Message-Id: <20250212213518.69432-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_133522_848170_F69F7E43 
X-CRM114-Status: GOOD (  11.55  )
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

soc_dev_attr->revision could be NULL, thus,
a pointer check is added to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02
("ice: Fix some null pointer dereference issues in ice_ptp.c").

This issue is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e37dde1fb588..95294462ff21 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -134,6 +134,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						"%x", soc_info.revision);
+	if (!soc_dev_attr->revision)
+		return -ENOMEM;
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
-- 
2.34.1


