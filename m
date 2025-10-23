Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418ECCF9E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTCBQSw3rdgr+t+gcsQRgkQCCF6EEQzuYuMHh2ULnB8=; b=udbfG6niGVCCVH71evjopgQjTm
	ChtV2lRqOyGTdl/ftbor2tfqH7ouMLGYhevytSOyYZkFRRCUrGODtzjhUhKad260ZJn1FSRbU5kz4
	WrBJtJECZQPEe3EaHGklsiS4ajsB30ZO7uR2SvXSl8ljM9mK6gXdFUSu7x9AU90UXbU4Itd4A+eWw
	WrR5Cr7hK5M3LwyQG2WegNj5FR+TgFyAqExlo3VEGfH3VcefNUi8SH43z2aUmrOSRngSMUqQBOgaC
	ey+gD9jCWwbRee9ALPOwjZRqePm+JMtfhtJks4/8+fLGW+lGhiBowoRO4JNsuieGEF5bIe/TQKPjZ
	2M4VL3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscj-00000005tnA-3Ila;
	Thu, 23 Oct 2025 10:32:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscc-00000005tfI-2lL5;
	Thu, 23 Oct 2025 10:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761215559;
	bh=Nm8W7cpMeOafms4KMKvssQ+rEiEsG+k/uHcRPolGSvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X8QryNv6qgKMRhud8znNKkw2n2Pv+08G2q6QyGKpBI6CcOIxQ1/XqpPLpFb2MnIH8
	 RR/BRBy0Pdk6Mi546kqkSG1slV6RcCqB21P0rt6jEW3dKBPHmfJDAUSM+97rUfTi4H
	 nIgYOTRYFcJH58Ruowt+7CRxIB3L8QCdLSSjVfflZzCvRtyetpIFITElRNzKlGHvX5
	 xyg+/kWvpg+yhNCpG/UMvPA49rPwDFeYh8J/ur4KTiH8qJZM5rjAMav0SzvIjJM2Yc
	 qtW5EPZdnY4BBfLO6e2bYpOTzFagTZyiJI5CXPgqPIfbm7+rXHx+DUwm2ZKt3/ajcn
	 bbBVTQxBMOcjA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05C9B17E108C;
	Thu, 23 Oct 2025 12:32:38 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 23 Oct 2025 12:32:27 +0200
Subject: [PATCH v11 01/11] drm/mediatek: mtk_hdmi: Drop redundant clock
 retrieval in mtk_hdmi_get_cec_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mediatek-drm-hdmi-v2-v11-1-7873ec4a1edf@collabora.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215558; l=1441;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Nm8W7cpMeOafms4KMKvssQ+rEiEsG+k/uHcRPolGSvs=;
 b=LVF5OOiJXiruSKNxVaopiTypS6rAfNxxeL2tRuoNJ+qCgnQYMlnHlPyjvqgr2PDtpUHVE02c0
 eBL+k1IVDS0BlKO0Y2hJ9+fITNsf5KTQ2DxnEVIJ8PVr9sA5AQzrb0C
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_033242_891094_F10EF20D 
X-CRM114-Status: UNSURE (   9.90  )
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

In mtk_hdmi driver, when the CEC device parsing logic was moved from
mtk_hdmi_dt_parse_pdata function to the new mtk_hdmi_get_cec_dev sub
function, the call to mtk_hdmi_get_all_clk was kept in both functions,
whereas it was only called once in the original mtk_hdmi_dt_parse_pdata
code and does not need to be called a second time.
So, remove this call from mtk_hdmi_get_cec_dev to keep the same sequence
as previously.

Fixes: 7485be967f7f ("drm/mediatek: mtk_hdmi: Move CEC device parsing in new function")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index b766dd5e6c8de6d16bff50972b45c3c1a083b985..9a2d4a904ff12b5abfbbd47a803fc568c0a09147 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1349,11 +1349,6 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 {
 	struct platform_device *cec_pdev;
 	struct device_node *cec_np;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");

-- 
2.51.0


