Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CB5C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lpPF2VJXReCnKdOWPpgvy9Sy//1InagrNF8aQhhlE4M=; b=bx+sxbKNWT69QvyThh6bN8dGv5
	IT4P3nLmWvyPV1BiB8S7v4Y+ly6hRpKWPBnlKcWeBLsFU5nHJbtP5PDcQ+9DjHaF/g6Kog8c7CmZ/
	gea1iUVoDV2oaiEaVLa5QJN7jls/+qDzubIWu8jSoTR63c+14MeLItQ7E7PcdYkMSsZ2dCV2+lmhq
	1QLsyA0D+b2znRVlZZNoccdiYNcCV28p2CZT05iGLKFw++7K5srg4m/y+BFGyBJq08n+SUFFZzLTL
	eBcyS26HRG6OpRDgDrXerFHBJ/Nqs1Na7WQKaIGjxPw//XWTa+25ycm7TNXEJBKAOMzaTdTr47Tkh
	jT6rNRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHULx-0000000EASL-1NiZ;
	Tue, 20 May 2025 21:18:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUJm-0000000EAEa-1TAf;
	Tue, 20 May 2025 21:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747775767;
	bh=8CteB6p8zUb1LKQ6PaOVnAOUgbNw2GtdCnfzZooLa/I=;
	h=From:Date:Subject:To:Cc:From;
	b=QV65h/1FtwxUZuwlMTUNurcfKob+MktS0xOomWwHNFl0RFWjnK8hpu5iC0245zjt/
	 l8NKnwotzs/tlSLdl7OsesMPYEFVrkpoehJGLUbC+C3ULIYISZ8Qx6aQrWayeoS/1r
	 Ne+98lSueF+4LjtEPdQDHq6oYV4OJQ32figLR+z5PPVqgXp30BKhDoIXAb6RdGF0zX
	 Nf/07Hi58xML+D50+kO/oBMj1aJy+4EPRTidvBTVdmua9hO8UmbIPKELv5uik3P+uZ
	 3uRPB3A7/vubjP9BVX5q/FKkj6S1qBmbT/IauivCJ/+rlc618BxUicfAgrn5kPJnAL
	 MdC2EGcvsVzFA==
Received: from [192.168.1.63] (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F226017E0FD3;
	Tue, 20 May 2025 23:16:04 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 20 May 2025 17:15:58 -0400
Subject: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
X-B4-Tracking: v=1; b=H4sIAA3xLGgC/5WNQQ6DIBBFr2JYdxpAsbWr3qNxQWHUSSgYsMbGc
 PdSb9Dl+z95b2cJI2Fit2pnEVdKFHwBeaqYmbQfEcgWZpJLxZXoYERPAWrFAckv4N/OwbxEsBh
 xgIE2EFq0tdadtteGFc9cDtqOxqMvPFFaQvwcyVX81n/sqwAB/NI0yrZWSlPfTXBOP0PUZxNer
 M85fwHWIO4H1gAAAA==
X-Change-ID: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hao Chang <ot_chhao.chang@mediatek.com>, 
 Qingliang Li <qingliang.li@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_141610_548620_730C092A 
X-CRM114-Status: GOOD (  20.44  )
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

Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
addresses") introduced an access to the 'soc' field of struct
mtk_pinctrl in mtk_eint_do_init() and for that an include of
pinctrl-mtk-common-v2.h.

However, pinctrl drivers relying on the v1 common driver include
pinctrl-mtk-common.h instead, which provides another definition of
struct mtk_pinctrl that does not contain an 'soc' field.

Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
will now try to dereference an invalid pointer when called on v1
platforms. This has been observed on Genio 350 EVK (MT8365), which
crashes very early in boot (the kernel trace can only be seen with
earlycon).

In order to fix this, since 'struct mtk_pinctrl' was only needed to get
a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
of mtk_eint_do_init() so that callers need to supply it, removing
mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Completely changed approach to make mtk_eint_pin a parameter of
  mtk_eint_do_init() as suggested by Angelo
- Link to v1: https://lore.kernel.org/r/20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com
---
 drivers/pinctrl/mediatek/mtk-eint.c              | 26 ++++++++++--------------
 drivers/pinctrl/mediatek/mtk-eint.h              |  5 +++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c    |  2 +-
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..d906a5e4101fb10968035fc48e9cf4a444d063a9 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -22,7 +22,6 @@
 #include <linux/platform_device.h>
 
 #include "mtk-eint.h"
-#include "pinctrl-mtk-common-v2.h"
 
 #define MTK_EINT_EDGE_SENSITIVE           0
 #define MTK_EINT_LEVEL_SENSITIVE          1
@@ -505,10 +504,9 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 }
 EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
-int mtk_eint_do_init(struct mtk_eint *eint)
+int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 {
 	unsigned int size, i, port, virq, inst = 0;
-	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
 	if (!eint->regs)
@@ -519,7 +517,15 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 	if (!eint->base_pin_num)
 		return -ENOMEM;
 
-	if (eint->nbase == 1) {
+	if (eint_pin) {
+		eint->pins = eint_pin;
+		for (i = 0; i < eint->hw->ap_num; i++) {
+			inst = eint->pins[i].instance;
+			if (inst >= eint->nbase)
+				continue;
+			eint->base_pin_num[inst]++;
+		}
+	} else {
 		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
 		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
 		if (!eint->pins)
@@ -533,16 +539,6 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 		}
 	}
 
-	if (hw && hw->soc && hw->soc->eint_pin) {
-		eint->pins = hw->soc->eint_pin;
-		for (i = 0; i < eint->hw->ap_num; i++) {
-			inst = eint->pins[i].instance;
-			if (inst >= eint->nbase)
-				continue;
-			eint->base_pin_num[inst]++;
-		}
-	}
-
 	eint->pin_list = devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *), GFP_KERNEL);
 	if (!eint->pin_list)
 		goto err_pin_list;
@@ -609,7 +605,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 err_wake_mask:
 	devm_kfree(eint->dev, eint->pin_list);
 err_pin_list:
-	if (eint->nbase == 1)
+	if (!eint_pin)
 		devm_kfree(eint->dev, eint->pins);
 err_pins:
 	devm_kfree(eint->dev, eint->base_pin_num);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 0c6bf7cbdc3a4f16e35d576535c6cef102962356..fc31a4c0c77bf28b106943e9292d0dcc425c4922 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -88,7 +88,7 @@ struct mtk_eint {
 };
 
 #if IS_ENABLED(CONFIG_EINT_MTK)
-int mtk_eint_do_init(struct mtk_eint *eint);
+int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin);
 int mtk_eint_do_suspend(struct mtk_eint *eint);
 int mtk_eint_do_resume(struct mtk_eint *eint);
 int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
@@ -96,7 +96,8 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
 int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n);
 
 #else
-static inline int mtk_eint_do_init(struct mtk_eint *eint)
+static inline int mtk_eint_do_init(struct mtk_eint *eint,
+				   struct mtk_eint_pin *eint_pin)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 0884c0700b3ee463c4571f2ac5b0254b5583b54a..4918d38abfc29de1f27ee75bc6a51c32b3ca1ac5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -419,7 +419,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->pctl = hw;
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
-	ret = mtk_eint_do_init(hw->eint);
+	ret = mtk_eint_do_init(hw->eint, hw->soc->eint_pin);
 	if (ret)
 		goto err_free_eint;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index de7bebb9a6cd98cbe7d77982698073f9c8974e3b..a4cb6d511fcdb36f67f30548636a0d64c5278840 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1044,7 +1044,7 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	pctl->eint->pctl = pctl;
 	pctl->eint->gpio_xlate = &mtk_eint_xt;
 
-	return mtk_eint_do_init(pctl->eint);
+	return mtk_eint_do_init(pctl->eint, NULL);
 }
 
 /* This is used as a common probe function */

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


