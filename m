Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CE7CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YniVLMoxNvetNUZ5shOgV+tA+PXuf7bdtLiHo3VjbEA=; b=uf4hl6NsDVNL/S9ZddXa+dyWKx
	7wKTKZu4hNNNIaPjb8PvXsM485ilXmre3Oo9GgI/5c85rn1WdUu7lTstAiF4V1YlWHmmJsfVHa7IE
	oRKzgvFBjcNiDo/tkKJawq675HrSY9PW/0Eo+8Qc7LyX0X/hnexnE7FigLljQX/sf53jZNxbaoJPQ
	NANyBwrIP/rIl9WFO2HeZpIeqk3yn2JcO28CwY8DxlqO7Br8RZ8U0BeDrFBAuN1TUiJeXb8n2hVO0
	MYvByRbEzovA0wfLMOdT8CBBUg6n8OjFE/LB9PO2B8BeEqmHO77cRuIJcbn8UZLDyUISqROj73vLX
	1Ody631A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwAS-00000005I49-4AsI;
	Fri, 29 Aug 2025 10:17:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv38-000000054pZ-0PqH;
	Fri, 29 Aug 2025 09:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B977B43735;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9460DC4CEF4;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458333;
	bh=ivKqM50M4iw0RSehXQduIKjOJqOijpdsoVz0fl/OOBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bF7FcMOzYYva//9gz2v556cx+Y++Ep1b+HAJ3LmAnQnhupdAwtkKiCvzYKg5h8zi/
	 nK2N74IQ8/Zoa3mo6w5uv1/cWVL3ZvZ+AgLmrek0If3qdKoo1NLwjdZondqkJ+8hlv
	 UFs4GmorG4DL/ZaXJqG1DBw7zi6XqjiRhOuYb7cjB9C236SAPo8AJRzzBH+YWmYYfL
	 H3m3Gs7UogVIo+FGAx/sr4+4whBDug5BVQvTam8xtuiCg3CRXS+Rtg8ecRqvltaldJ
	 HoUNmwpQta+TupsaN8Bm6jRuJkOhbRTxswIkcZhHjlMrWGkpf7Pg/ZFnY3i9hEJovB
	 itacSAnYKBdbg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urv2x-000000005WF-0cxW;
	Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ma Ke <make24@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/mediatek: fix potential OF node use-after-free
Date: Fri, 29 Aug 2025 11:03:44 +0200
Message-ID: <20250829090345.21075-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250829090345.21075-1-johan@kernel.org>
References: <20250829090345.21075-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_020534_157828_5CCC62A1 
X-CRM114-Status: GOOD (  10.92  )
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

The for_each_child_of_node() helper drops the reference it takes to each
node as it iterates over children and an explicit of_node_put() is only
needed when exiting the loop early.

Drop the recently introduced bogus additional reference count decrement
at each iteration that could potentially lead to a use-after-free.

Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 34131ae2c207..3b02ed0a16da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -388,11 +388,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
 		if (!of_id)
-			goto next_put_node;
+			continue;
 
 		pdev = of_find_device_by_node(node);
 		if (!pdev)
-			goto next_put_node;
+			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
 		if (!drm_dev)
@@ -418,11 +418,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 next_put_device_pdev_dev:
 		put_device(&pdev->dev);
 
-next_put_node:
-		of_node_put(node);
-
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.49.1


