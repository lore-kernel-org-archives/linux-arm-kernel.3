Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4A3E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDJHn13oguvNY4hFfLnIJ/qXHTZIoyp6PophlUZUA4c=; b=MlZnecMRNch/oSckckGiAelTEJ
	3qEVRPIGUDrw7NjkMBqeHw+JzePN8nfMNeiFab7FawnQYYWxeyUXGQjAZoLXVPXo0i2eb58qbhIDQ
	PTeWqy7m4MU6BjlVbqIArY/45be+sZwYsQEFD7+tbZxONk5/mK4N/TTDyL1va0KP/lYJknRJkumhr
	mPgtGj59EazsvMmL/yi6YrwnsuLhFGa2uaVbUzGlQQdeCr1gNwd4WAHxp+kOBl+J8G6j+ekstHPJ7
	FVJdJZGevSsjhm/2TN62IHuJ/+e6a74Az28uG6euuV1JhxUc9SgwSPOON+rLQ+nKeH7JOY/QAP3m1
	OnwIdo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtbU-00000002srT-3BxB;
	Sun, 28 Dec 2025 16:26:48 +0000
Received: from mail-m128106.netease.com ([103.209.128.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtbQ-00000002sqm-1VEF;
	Sun, 28 Dec 2025 16:26:46 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ecc43598;
	Mon, 29 Dec 2025 00:26:39 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v2] soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
Date: Sun, 28 Dec 2025 16:26:36 +0000
Message-Id: <20251228162636.3829733-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b65c8882a03a1kunm85e1b38dade86
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBhCVhoYQ00eQk4ZHUxNSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=nlpwis8umtH6crvMFupAyLUqMOSBZ+AIWqxOCqcJbAJcHTX92PC7vN2w0mjWwU2Ditin9qr5zNCPTw4kdlLHxl3niwPoZch+K3etI2J9dGg5/13+SIXvEMXWKO6+O39ouBuGoTtRzCgJ2ffuKkJ47HTcwTRD/RPiDULBbiBRtE8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=jDJHn13oguvNY4hFfLnIJ/qXHTZIoyp6PophlUZUA4c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_082645_542618_C2732DE6 
X-CRM114-Status: UNSURE (   7.88  )
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

In svs_enable_debug_write(), the buf allocated by memdup_user_nul()
is leaked if kstrtoint() fails.

Fix this by using __free(kfree) to automatically free buf, eliminating
the need for explicit kfree() calls and preventing leaks.

Fixes: 13f1bbcfb582 ("soc: mediatek: SVS: add debug commands")
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v2:
- Use __free(kfree) to simplify memory management.
---
 drivers/soc/mediatek/mtk-svs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f45537546553..5ede59299613 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -789,7 +789,7 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 	struct svs_bank *svsb = file_inode(filp)->i_private;
 	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
 	int enabled, ret;
-	char *buf = NULL;
+	char *buf __free(kfree) = NULL;
 
 	if (count >= PAGE_SIZE)
 		return -EINVAL;
@@ -807,8 +807,6 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
 	}
 
-	kfree(buf);
-
 	return count;
 }
 
-- 
2.34.1


