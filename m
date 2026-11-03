Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D379606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JL9oxY0J;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fr4Psa/B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f0ma+jHzcciETFu2F4xi1pN1CPcSp4hOEtFv0IsiDV4=; b=JL9oxY0J/U4QbO
	EwsNFWFrRJOwVGKp/n9HHZWqoveP3TbIwxTjCqikBdLie1+iyRYN5KDDdC7C9TshtMFP+8TC2Z3BW
	Chc3vxVrlBMTGO+ZysfVaV37YTcRB1uLwTEHv0vG5DX8YlflQtFaCa2Ve83zgYvhPhAZZBiZbRCkc
	gnIOVcu7tth325wSa+rV9xS+T7n0Zc/L0odm6agtKgaXlYgWQoj5/voIkAF9rufIswCC+yCeQSNe+
	tIcOdhMak65jyFkpoTaBJXIIluGhhacIZ1DpIgQm57ibag0kRFTsDOJXGV0eTHIPoch0WG8Tf8DjM
	/Tcj4gxOHTtIdpB0Fytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM66-00000003hwI-46Kr;
	Tue, 03 Nov 2026 21:31:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM65-00000003hvM-35RS;
	Tue, 03 Nov 2026 21:31:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CFFB42A14;
	Tue,  3 Nov 2026 21:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDC21F0093A;
	Tue,  3 Nov 2026 21:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741473;
	bh=f0ma+jHzcciETFu2F4xi1pN1CPcSp4hOEtFv0IsiDV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fr4Psa/B2JpwdpKsWn4kacWBVEmwIR9mGxLeXDKCcfoVujwzps+XBrF7qnJ6LEgK0
	 MUlkzd2LzQQ4VFcrTG6mkfOzNG7xuXexVUuwVuy5u8BjhjrfmfSX9VHLla+lI0LzOX
	 7Nq38h4yFwiT81Dsn5HqCqCHTEKV4bp9spFUQs7cX6led9HyS2W+JOkMYsE7Zzhbfr
	 Sa9Hz++1mamyR38F1EZhg1J1ec1D5YZKWEkQ3pPFoCy4zwSoEIE5aUxnKUHwF/o8Gy
	 /2MsmpHL4PntxfTSP2F0TeFLF+JwKGaewegHhohmNespDtKihaIHqoktlGwdRgm0z8
	 rF6+O3CnKG/dA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 09/10] pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive strength
Date: Tue,  3 Nov 2026 21:29:14 +0000
Message-ID: <20261103213002.1673560-10-lee@kernel.org>
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

mtk_drive[] only defines entries for DRV_GRP0 (1) through DRV_GRP4 (5),
leaving mtk_drive[DRV_FIXED] (0) zero-initialised with min = 0, max = 0,
step = 0, and scal = 0.  If mtk_pinconf_drive_set() or
mtk_pinconf_drive_set_rev1() is called with arg = 0 on a pin with
drv_n == DRV_FIXED, the range check (0 >= 0 && 0 <= 0) succeeds and
!(arg % tb->step) divides by zero.  Similarly, mtk_pinconf_drive_get()
and mtk_pinconf_drive_get_rev1() divide by tb->scal (0) if the pin has
drive register fields defined.

Return -ENOTSUPP immediately when desc->drv_n == DRV_FIXED.

Fixes: c28321979ba8 ("pinctrl: mediatek: add driving strength related support to pinctrl-mtk-common-v2.c")
Closes: https://sashiko.dev/#/bug/linux-d3852d37-6806-4c41-a493-f249dd59d0c6
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index aa15c9e047d8..1243862983b9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1040,6 +1040,9 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err = -ENOTSUPP;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 	/* 4mA when (e8, e4) = (0, 0)
 	 * 8mA when (e8, e4) = (0, 1)
@@ -1069,6 +1072,9 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err, val1, val2;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_E4, &val1);
@@ -1095,6 +1101,9 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err = -ENOTSUPP;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	if ((arg >= tb->min && arg <= tb->max) && !(arg % tb->step)) {
@@ -1116,6 +1125,9 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 	const struct mtk_drive_desc *tb;
 	int err, val1;
 
+	if (desc->drv_n == DRV_FIXED)
+		return -ENOTSUPP;
+
 	tb = &mtk_drive[desc->drv_n];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, &val1);
-- 
2.56.0.385.gac671c819a-goog


