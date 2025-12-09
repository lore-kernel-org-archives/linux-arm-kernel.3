Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E55D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QFCet6Y9n5L2eUpwhiFCan/BncIVl9TNPp0Dh5H0OCU=; b=05nNOMB6LhaBtk1A3QftbaxLRo
	Pp6hPJh3HWD1/BtVHGuXIGeOtVUPc3d6/cDiLSMpXij0RZ9lq2rqAwrj5C/uqBtkHYKVtKJxCzvMc
	Gk6YNx7iX6TQExfIdBiDlTjfMpz7QtY+N+uVdwguyRN4+omUAO7c/jKoYBH3de6AGOkS6h+3bJpRn
	uWs0EugDHTUt7tLX5VsAHbLXLdiOA81jsMHTpGYAfgnWNwMFECZHWv5q2sAW9Iov/m3abuGznRK5y
	Ljj61vHdzYT8puAuG5oQMdPiNEIaB2rF8uvJXalQ1DRIItLEedwD+U+wNHJmNDwYAcKet0nMpKsAM
	G41p6bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSuYU-0000000E50R-2mBb;
	Tue, 09 Dec 2025 10:02:50 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSuYR-0000000E4zY-1Yi8;
	Tue, 09 Dec 2025 10:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QF
	Cet6Y9n5L2eUpwhiFCan/BncIVl9TNPp0Dh5H0OCU=; b=Q6nBxCI6cZc6zCUb8P
	ZRW9glWW8YFiKFnX/w9UUUJRrhIzz5w5ZYqkrK8JiKgEaJs30EorlbAhSEJyE8jF
	VVxkjhBP/ZI6I8LIfX1n3yCV/qfp1FPjtaiBAhtuadwSTODG/b1HvnNeiKpEb8vr
	mUheoxgwKQhk3Y6lAbMXNweJI=
Received: from hello.company.local (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAn+J+r8zdpGmM3Gw--.34S2;
	Tue, 09 Dec 2025 18:02:23 +0800 (CST)
From: Liang Jie <buaajxlj@163.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org (moderated list:PIN CONTROLLER - MEDIATEK),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: liangjie@lixiang.com,
	fanggeng <fanggeng@lixiang.com>
Subject: [PATCH] pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()
Date: Tue,  9 Dec 2025 18:02:17 +0800
Message-Id: <20251209100217.167581-1-buaajxlj@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAn+J+r8zdpGmM3Gw--.34S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWkAF15ur1DuFykXF43KFg_yoWrWw48pF
	4SgFnxKF48Jr4DKr13Zw1UXa4rtws7Xr4UWr4Y93yxArZxtryvgFWYya4UX3y0kryqyrWU
	Jr1rt347Z3yYyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2WlkUUUUU=
X-Originating-IP: [111.205.82.7]
X-CM-SenderInfo: pexdtyx0omqiywtou0bp/1tbioBofIGk36B2dkwAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_020247_788021_19D04527 
X-CRM114-Status: GOOD (  12.88  )
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

From: Liang Jie <liangjie@lixiang.com>

mtk_eint_do_init() allocates several pointer arrays which are then
populated in a per-instance loop and freed on error. The arrays are
currently allocated with devm_kmalloc(), so their entries are left
uninitialised until the per-instance allocations succeed.

On a failure in the middle of the loop, the error path iterates over
the full nbase range and calls devm_kfree() on each element. For
indices which were never initialised, the corresponding array entries
contain stack garbage. If any of those happen to be non-zero,
devm_kfree() will pass them to devres_destroy(), which will WARN
because there is no matching devm_kmalloc() resource for such bogus
pointers.

Improve the robustness and readability by:

  - Using devm_kcalloc() for the pointer arrays so that all entries
    start as NULL, ensuring that only genuinely initialised elements
    may be freed and preventing spurious WARN_ON()s in the error path.
  - Switching the allocations to sizeof(*ptr) / sizeof(**ptr) forms,
    avoiding hard-coded element types and making the code more resilient
    to future type changes.
  - Dropping the redundant NULL checks before devm_kfree(), as
    devm_kfree() safely handles NULL pointers.

The functional behaviour in the successful initialisation path remains
unchanged, while the error handling becomes simpler and less
error-prone.

Reviewed-by: fanggeng <fanggeng@lixiang.com>
Signed-off-by: Liang Jie <liangjie@lixiang.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 9f175c73613f..2ea0902b4f66 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -539,24 +539,32 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 		}
 	}
 
-	eint->pin_list = devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *), GFP_KERNEL);
+	eint->pin_list = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->pin_list), GFP_KERNEL);
 	if (!eint->pin_list)
 		goto err_pin_list;
 
-	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->wake_mask = devm_kcalloc(eint->dev, eint->nbase,
+				       sizeof(*eint->wake_mask), GFP_KERNEL);
 	if (!eint->wake_mask)
 		goto err_wake_mask;
 
-	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	eint->cur_mask = devm_kcalloc(eint->dev, eint->nbase,
+				      sizeof(*eint->cur_mask), GFP_KERNEL);
 	if (!eint->cur_mask)
 		goto err_cur_mask;
 
 	for (i = 0; i < eint->nbase; i++) {
-		eint->pin_list[i] = devm_kzalloc(eint->dev, eint->base_pin_num[i] * sizeof(u16),
+		eint->pin_list[i] = devm_kzalloc(eint->dev,
+						 eint->base_pin_num[i] * sizeof(**eint->pin_list),
 						 GFP_KERNEL);
 		port = DIV_ROUND_UP(eint->base_pin_num[i], 32);
-		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		eint->wake_mask[i] = devm_kzalloc(eint->dev,
+						  port * sizeof(**eint->wake_mask),
+						  GFP_KERNEL);
+		eint->cur_mask[i] = devm_kzalloc(eint->dev,
+						 port * sizeof(**eint->cur_mask),
+						 GFP_KERNEL);
 		if (!eint->pin_list[i] || !eint->wake_mask[i] || !eint->cur_mask[i])
 			goto err_eint;
 	}
@@ -592,12 +600,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 
 err_eint:
 	for (i = 0; i < eint->nbase; i++) {
-		if (eint->cur_mask[i])
-			devm_kfree(eint->dev, eint->cur_mask[i]);
-		if (eint->wake_mask[i])
-			devm_kfree(eint->dev, eint->wake_mask[i]);
-		if (eint->pin_list[i])
-			devm_kfree(eint->dev, eint->pin_list[i]);
+		devm_kfree(eint->dev, eint->cur_mask[i]);
+		devm_kfree(eint->dev, eint->wake_mask[i]);
+		devm_kfree(eint->dev, eint->pin_list[i]);
 	}
 	devm_kfree(eint->dev, eint->cur_mask);
 err_cur_mask:
-- 
2.25.1


