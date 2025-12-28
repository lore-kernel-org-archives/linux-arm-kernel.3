Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D28EE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXjIvzU1gbf8TI2izoZUqVMwlk1JSJtF8HkNxMEyl3I=; b=bGmHSLHTtP484i44s9O6aPN+cN
	GWPfuBV/MUBo8MbZK+Cdv1vgcGDeY/q6yLZ/27AYNYiZVATL22tUucvJkDAvu5+Lx+VFdUHxtFSpT
	vgojBQAiz1X3Z9vg3Cv1uaNQWWuhh3Dr8jV8+fu7KjhsIE5am5DtxZRLCkHtEJPkNPXTzHMcH2jXv
	lomnqiw7TJiBh/kJvjOOE0zEI4kz01se5HinWwxT0neGVMyBZr/THwBWblR9wlTU4BlTADHfFG8YO
	hsg7IUckWtny80adx6De2JFPpeWHMQa8HwItkD2zGZBBS67xuMJTiAbygJHBYOF7ziq8/HPEdX8wQ
	6x2abdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqGJ-00000002l7b-0AOv;
	Sun, 28 Dec 2025 12:52:43 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqGD-00000002l6R-1btH;
	Sun, 28 Dec 2025 12:52:40 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2eca68e63;
	Sun, 28 Dec 2025 20:52:29 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] soc: mediatek: SVS: Fix memory leak in svs_enable_debug_write()
Date: Sun, 28 Dec 2025 12:52:26 +0000
Message-Id: <20251228125226.3684517-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6504738503a1kunm2087d54ba59a2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTR8YVkNMSUgaShkaGk4dGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OAnEa3Esg5F/RuDPMWXgpWTgHSbt651V78flXM57uULzuZ7dmeIP+CqB6Do3B4n99tEQU98nBYY9BVQN+cnhAfm9pMtspYgTaX664IU9ZA2lW6oPKcLLDzDt1W5xaNpWlK9hljyoh3UklcPazEuFkfwW35eV7F1x4QFE41klpek=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=RXjIvzU1gbf8TI2izoZUqVMwlk1JSJtF8HkNxMEyl3I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_045237_587737_2A792447 
X-CRM114-Status: UNSURE (   8.10  )
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

In svs_enable_debug_write(), the buf is allocated via memdup_user_nul().
If kstrtoint() fails, the function returns directly without freeing the
allocated memory, leading to a memory leak.

Fix this by freeing buf before returning the error code.

Fixes: 13f1bbcfb582 ("soc: mediatek: SVS: add debug commands")
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/soc/mediatek/mtk-svs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f45537546553..691e7e6be654 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -799,8 +799,10 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 		return PTR_ERR(buf);
 
 	ret = kstrtoint(buf, 10, &enabled);
-	if (ret)
+	if (ret) {
+		kfree(buf);
 		return ret;
+	}
 
 	if (!enabled) {
 		svs_bank_disable_and_restore_default_volts(svsp, svsb);
-- 
2.34.1


