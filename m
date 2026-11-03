Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHA/6wOv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FMWVqxa1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3/oOsHewxoaJAaDJ/rO1u+yX1SuMv/P/AudEIBEMG7w=; b=OHA/6wOvcQ+FwP
	L41gLUJDNiYdCXojVpgwEzTtSwFnW9kfQB28YAHXwcGxjaydPTzhB9d2N+w3vF46p5TYYJ1a6u7hN
	9znteCThLU6le7Wx2+YUbQvt0M0r+rU6e9zFvdM8RihrGBpBS2W5WOY/q5NcHwl+fX3DnrsGxPZqd
	Eyiy7CW7rzjQsEATwzMtvipPu5SyNvMjJdggFU1pRyNTuEC6qUDHN1cnZMJSlIVnw3Wop8lY/bNiQ
	u4MmLT0EqC/1E19FZn2hBknLM3irUgAClmV9134cv3F+H90UZXp2x6hJFsIURdgQP1znPO3FfIhYj
	z7X6//F6exK3af0A8Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM60-00000003hrH-3LkU;
	Tue, 03 Nov 2026 21:31:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5z-00000003hpn-0QwE;
	Tue, 03 Nov 2026 21:31:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EAFD60609;
	Tue,  3 Nov 2026 21:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5025F1F0093A;
	Tue,  3 Nov 2026 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741466;
	bh=3/oOsHewxoaJAaDJ/rO1u+yX1SuMv/P/AudEIBEMG7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FMWVqxa1FNxP1228G32bTLVARYQ3QmprHch71ewzUY/3cokfxHRbiLY8bJdd7QIY6
	 9b/IJJINomPPHFXkkbRjzQzlMnWaXqmIX+D0uM2IC+ik7B1EtxY/6c1gwP2PLupO2w
	 WRcQ2O0Lir3/wtmX7pB8ql3mia8EWlLhDi0UU0U0jUGC69f7a9Kmpx7tvNdDykFhd1
	 zg2VtXHVIuY9Aql8rftE6fdeCdhIyA28K6ntxQOvOcCI9pRn5/aTK7I8YRNkIRcLGN
	 mXIoqqqbzvuyYRXz3W5+3ANaY/QYRVxDF1ODKuPaEq+0KsSOk5xU9YWMikFRVHt0B3
	 KgWBzfYAUBKUA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 08/10] pinctrl: mediatek: Clean up partially initialised hw->eint on error
Date: Tue,  3 Nov 2026 21:29:13 +0000
Message-ID: <20261103213002.1673560-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mtk_build_eint(), if of_property_count_strings() fails or
hw->eint->nbase is non-positive, the function returns -EINVAL directly
after allocating hw->eint without jumping to err_free_base.  Because
callers such as mtk_paris_pinctrl_probe() and mtk_moore_pinctrl_probe()
log a warning and continue probing when mtk_build_eint() fails, leaving
hw->eint non-NULL with hw->eint->hw unset causes subsequent GPIO or
suspend/resume callbacks to dereference a NULL pointer inside
mtk_eint_do_suspend() or mtk_gpio_to_irq().

Jump to err_free_base on both error paths so hw->eint is freed and
reset to NULL.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Closes: https://sashiko.dev/#/bug/linux-0689c07e-ef74-4bc2-b5de-bd2f361124bd
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index faa6dbf0f635..aa15c9e047d8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -382,12 +382,16 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < 0)
-		return -EINVAL;
+	if (count_reg_names < 0) {
+		ret = -EINVAL;
+		goto err_free_base;
+	}
 
 	hw->eint->nbase = count_reg_names - (int)hw->soc->nbase_names;
-	if (hw->eint->nbase <= 0)
-		return -EINVAL;
+	if (hw->eint->nbase <= 0) {
+		ret = -EINVAL;
+		goto err_free_base;
+	}
 
 	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
-- 
2.56.0.385.gac671c819a-goog


