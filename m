Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2210C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Z10WwCpu58ZKAg/glGOy9Nx8vvczMrUQ/Ln0eULoZI=; b=qk87gWHu1HLl9D09jsUNo+lbL+
	U6Q4BHv7fojLqMx9NjuTzbrpp1bVpLJMgPd4Mm4wbsR2drEkTwLirCgvM0U7dZS6gPZ0QWn6a4y+c
	ggAXL9xRNV5g9s3nGrhyihbUXZCOOWuGcQaw6OJxjRxs3ww+VqtnQMBTHd27f0xWIojEwJ2VvUZrN
	ihctGZ5kLpvi3ZpV8FnF8fsl0yoIVRojqGKnXUSUZmZe+/nGG2e3nCJ98Ki7nM/CsUJt+CBt9atzC
	aOxzTZue5jiPRYnGQnDrvdKTBcPibuImYn97/sFzR5Zd+FnKH4tX52C/jLzSUa9OtZY2uCuwW6qey
	04qZzivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6bx-0000000AKq4-0rqR;
	Mon, 19 May 2025 19:57:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6KJ-0000000AFnX-0MRo;
	Mon, 19 May 2025 19:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747683542;
	bh=RDFDL2i0kJEyKl2DZibODtURBIL+Rqiwg37OKOw/+0w=;
	h=From:Date:Subject:To:Cc:From;
	b=i3ze4j3agZ1xjBgnSk6c7ECM4RhhtfqzdH3/fPyVCVYjxD4eaj/kaR16wTemAZApA
	 XB46m3/FnQy/h++UhZBi2sK/dVaq76RlkP4kZEiw9MkuIzr7xSpozmKdoj4cjtBHCV
	 4HbZsJ2a9Do/x5PsOlLQDcfq6ljQsiv1p/48jFsMuTtULrZlqXLl9kdME3SpnAFdl8
	 PrWArGfcPJjY/Czx3/dyU78lHTf5+HFZR9oIxOEuKXNbGAgJxnl2lwC1DdYyM4bCp2
	 MWB4iEMqSZcYuRA5W76XG4f6F14yGoCEal01ZeWmu75v+W4yJqTer+erB4qP+QeQ/L
	 4rxRHgIRZr7XQ==
Received: from [192.168.222.61] (unknown [IPv6:2607:fb91:213a:cf4c:3184:eb31:ee5b:b501])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B5C917E0FC4;
	Mon, 19 May 2025 21:38:58 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 19 May 2025 15:38:42 -0400
Subject: [PATCH] pinctrl: mediatek: eint: Fix invalid pointer dereference
 for v1 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMGIK2gC/x2NwQqDMBAFf0X23AeJNkX9leJhaVa7IKskKoL47
 w09DgMzF2VJKpn66qIkh2ZdrIB/VPT5sk0CjYWpdnVwwXeYxHRBExxEbYPt84x1S4iSZMSoJzz
 7V8PccWyfVDprEXr+H+/hvn+MPAFlcwAAAA==
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
X-CRM114-CacheID: sfid-20250519_123907_300612_2D6EA22A 
X-CRM114-Status: GOOD (  13.72  )
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

In order to fix this, given that this if code block is only relevant for
platforms with multiple EINT bases, and the previous if block already
handles the single base case, add an else statement so this if condition
will never even be evaluated on platforms with a single EINT base, which
covers all v1 platforms following commit fe412e3a6c97 ("pinctrl:
mediatek: common-v1: Fix EINT breakage on older controllers").

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..9114e0cd9def1bc65558c67317abe67ba63ef1f6 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -531,9 +531,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 			eint->pins[i].index = i;
 			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
 		}
-	}
-
-	if (hw && hw->soc && hw->soc->eint_pin) {
+	} else if (hw && hw->soc && hw->soc->eint_pin) {
 		eint->pins = hw->soc->eint_pin;
 		for (i = 0; i < eint->hw->ap_num; i++) {
 			inst = eint->pins[i].instance;

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


