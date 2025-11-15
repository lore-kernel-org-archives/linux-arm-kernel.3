Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A924CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3HM3I4bUTzbpRfnY8RX/TvT9nFvadSb24TbnTM1pPA=; b=32+1T3Clw8/VdOXt+/bT22Rdhe
	yyTkNCEsR2pgfM/bIMvIIsmexR5w0ECe9HJcn59aiCwzDop+OtBf6wwy8z9Y4bPlutYVpl6w2L6P7
	xw59BuuChcapSNRzY3gjqpwTc/2bOsEMOZIuMRxUDwzKUtWk6KE+EQubTTyoRLd9H9dkrB3ltUgUT
	Q199oSOCtYfWnD34oYSwRNLJSSUiJts0V9dfOUQrKyngiKYnoBAaKdTSyPgsLzuuYEHcJefhNTEHS
	pGcxM3T+IFmQ+byyYEPLjkpP/N62lvo7DgS4qmWb6Q3JWbcu1fHtDC53Wc1xiLKNjqTmgOfmzsmdF
	WRj2oW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD4y-0000000DgIX-10QM;
	Sat, 15 Nov 2025 10:00:24 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKD4q-0000000DgHF-0d9M;
	Sat, 15 Nov 2025 10:00:17 +0000
Received: from localhost.localdomain (unknown [116.25.95.231])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29af02016;
	Sat, 15 Nov 2025 18:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
Date: Sat, 15 Nov 2025 18:00:00 +0800
Message-Id: <20251115100000.177791-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a86f52ec703a2kunm89bce897230e75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0tLVh5LQ0lKQx1IHkNCHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUhKWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_020016_356654_838D3C1A 
X-CRM114-Status: UNSURE (   9.48  )
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

The blamed commit made the following changes:

-#define PINCTRL_FUNC_DESC(id)...
-		.desc = PINCTRL_PINFUNCTION(#id, ...
+#define PINCTRL_FUNC_DESC(id, table)...
+		.desc = PINCTRL_PINFUNCTION(#id, ...

-	PINCTRL_FUNC_DESC(pon)...
+	PINCTRL_FUNC_DESC("pon", pon)...

It's clear that the id of funcs doesn't match the definition.
Remove redundant #string from the definition to fix this issue:
pinctrl-airoha ...: invalid function mdio in map table

Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/confs handling")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index bfcedc7f920b..18c952e44229 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,7 +35,7 @@
 
 #define PINCTRL_FUNC_DESC(id, table)					\
 	{								\
-		.desc = PINCTRL_PINFUNCTION(#id, table##_groups,	\
+		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
 					    ARRAY_SIZE(table##_groups)),\
 		.groups = table##_func_group,				\
 		.group_size = ARRAY_SIZE(table##_func_group),		\
-- 
2.25.1


