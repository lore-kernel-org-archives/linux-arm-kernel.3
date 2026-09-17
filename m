Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4004C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cAYHB91mBe/nX9GCFhnVlPHTeBX8SwymcKLkPAPtfA0=; b=x6R8UtxBXtctWGTf/XsIsYnhml
	vI9ZpcMbAmBsVemhHeyeOILZKAfoI6zjaN/m7CH1J71IbcpE8cCaKlaFkwBXl66NkPTGERFLWWAvu
	SeXexf3epC9m7edDCV9EAdhrbjmZK8CnxnhOLYopxo2Bwk6BIgXBX46XVRVfpA1Yx3g0Oy/8gZGac
	1SJLlCNPb0joUAcQb+9yAzykLL0Sz5MLyyeguZSq7iOwBxHARW9mONaGGT926z9EPaCZziHmMPXHW
	J2iwkH3CzgLYQXKjm073NkIt9E5ywa9jNCWn4skTZbOG0ZiVjBlDMHMy8piqA4zMbnp9dE5GCJ7L0
	2hsO65+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JQ9-0000000CXYU-0EYX;
	Thu, 17 Sep 2026 21:13:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JQ7-0000000CXY9-19fK;
	Thu, 17 Sep 2026 21:13:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95BA8600AA;
	Thu, 17 Sep 2026 21:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0211F000FF;
	Thu, 17 Sep 2026 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789679606;
	bh=cAYHB91mBe/nX9GCFhnVlPHTeBX8SwymcKLkPAPtfA0=;
	h=From:To:Cc:Subject:Date;
	b=h59j228Gw9TPAONxrGOjGq3evcR70tMHJkQJpxI7gQ5Ckg330CrOwl4gUroSCPtYZ
	 rZhOO3pFWGNWGJcGehsZxeS/psrqRMpsz/DjTmj70n/UUxjb5A4b1//cx/56M+MDpD
	 iGYgN3ZEUsliz6cbt+aDXJSC8HEYqE+fS0a+PjASx3kSv3imFU25Pbka/2xKgRVUIx
	 miMPYlgq84NprmJliCErWPaNEHDqlLpS5aeLcT8J/5xb0igU5eTpgD6eLWQjO+85X0
	 8e8GPSSMNK8wgcwiZ+BJHkZuW7+fLeGxChk5uz5/2iWVWk0HgH4sLwPSG5Ye1FJFpN
	 EIrwIc8yCltOA==
From: Kees Cook <kees@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Fix eint->base allocation type
Date: Thu, 17 Sep 2026 14:13:24 -0700
Message-Id: <20260917211323.i.101-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=kees@kernel.org; h=from:subject:message-id; bh=/FZNV9o1ewTwlu5GAymRgTjU768+QMlUG/XB6uW9yEM=; b=owGbwMvMwCVmps19z/KJym7G02pJDFlrwj9fmqEtGX7sgKPW54DouNsL7FbdWWmd4L1XfI7VJ Iko10SdjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInEbWX4Zzk1r0Cx5kLjg9y3 8zO5z8gsOWw91/bCj5QXAepb1jWIZDL8034SmmCpnvZq6ZnSO1YJ1zqkH55Snj4n4+xhYYGlS+8 l8gMA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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

From: Kees Cook <kees+treewide@kernel.org>

In preparation for making the devm_kmalloc family of allocators type
aware, we need to make sure that the returned type from the allocation
matches the type of the variable being assigned. (Before, the allocator
would always return "void *", which can be implicitly cast to any
pointer type.)

This allocates the single-entry array that mtk-eint expects (nbase is
set to 1). The assigned type is "void __iomem **", but the converted
allocation type would be "void __iomem ***", as the size was taken from
"pctl->eint->base" itself rather than from what it points at. Luckily
"void __iomem **" and "void __iomem *" are the same size. Take the size
from the pointed-at type to match the assignment.

Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
drivers/pinctrl/mediatek/pinctrl-mtk-common.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
---
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>
Cc: <linux-gpio@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 1a977acd6883..857d39f3438d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1032,7 +1032,8 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
-	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(*pctl->eint->base),
+					GFP_KERNEL);
 	if (!pctl->eint->base)
 		return -ENOMEM;
 
-- 
2.34.1


