Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5120AD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jAEBrcKEP2Dkgcler2NsQJFg8gU3aJUCTBDJKE8d+Pc=; b=vlr+gbvZT7+35Noi+oz6y6RvSL
	5i+7MeGN/z5ua5V8QIpIBUEOR9iapiBmLT71cb/kSROYAWLSP34AvulXR8SbRqYoKq+ZIM4wfsFE6
	gWi0Flf3DUPwmfPSkj9QT4p86FVgGT8FEuDz5iiOy2anxVKbXB7Wyz6xC22PkgxCrSB20edcpjcc1
	BxIoscadhMxyTcdJvw/wvdMiirfNgF0nLCdMzTZ6AP0qaTHndSlt77C4ef86wIrEOfY1VabhC/1Td
	maT+nSxTqIc/+Bv0YIFeJrnT9Iwo8fUk6OOkcdxTSdXVNBcCo1ncFWkFatsxucngbAXC+P3IHxMQj
	zabokiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDFg-00000003kGT-2qu8;
	Mon, 29 Dec 2025 13:25:36 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDFe-00000003kFZ-25km;
	Mon, 29 Dec 2025 13:25:35 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ee89fb04;
	Mon, 29 Dec 2025 21:25:29 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zilin Guan <zilin@seu.edu.cn>,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v3] soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
Date: Mon, 29 Dec 2025 13:25:26 +0000
Message-Id: <20251229132526.394235-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6a4906f403a1kunm8cb5e653122881
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR8dVh1JQ0NMTElDGUxOS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=ifBOWKPoF0mrhMpkCAiPvhD7cHmFG1D6shyEtW+2hPVjfpca/q7xr7+y3jiSWlApgUCz6bVgd4rA+Se5405mW+6xrVUkp4ITwBVYrOzUoFB45Ul45UOWSwGYOIBf1BclHgW8tv27fsjSKZNg2z/UY+gOnlYKM3TuROSe8bnpsJk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=jAEBrcKEP2Dkgcler2NsQJFg8gU3aJUCTBDJKE8d+Pc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_052534_745678_71DC8AF4 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: stable@vger.kernel.org
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v3:
- Reduce the scope of the involved local variable.
- Add Cc to stable.

Changes in v2:
- Use __free(kfree) to simplify memory management.

 drivers/soc/mediatek/mtk-svs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f45537546553..475926a606fd 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -789,12 +789,11 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 	struct svs_bank *svsb = file_inode(filp)->i_private;
 	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
 	int enabled, ret;
-	char *buf = NULL;
 
 	if (count >= PAGE_SIZE)
 		return -EINVAL;
 
-	buf = (char *)memdup_user_nul(buffer, count);
+	char *buf __free(kfree) = (char *)memdup_user_nul(buffer, count);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
@@ -807,8 +806,6 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
 	}
 
-	kfree(buf);
-
 	return count;
 }
 
-- 
2.34.1


