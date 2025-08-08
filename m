Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B476C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yOU6/My8Pn77X9Plux77FM1FRMKNcMAdMniGoAC1YU=; b=Sy7YPqCW++Bt3H7fVPkeGjHAq4
	mjrJ9b2PBAVlQls2ONexGLOdAh2NhuwgJ6NV92ODI2BwxffjmhDYxMhzdvPsLyov89oGYo7xeXcSQ
	L13QegIctETCiY8wYpRKlLWL3syv00Xvnod7iztJHSVrRFJzzPK0XmiSyPqExnS7e6py9ia768zMl
	ddZ8LWBYNzqVajSsbwG4N687gTgkjeBrJ4wHQQBc/kmuQmxsbjVA1zq4l9gGc6FnlPJ1WjqgkLAeR
	Y+JevMTgznF80hUKxAVRIU/RcxDYruI7o7uFjSQb6/1OJ3eFFY5YIYXHrRFWsN+jpUizvT3rKvLzr
	u0nSQCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKQF-00000002Zg6-0WfB;
	Fri, 08 Aug 2025 10:34:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK6L-00000002XB5-0Xgr;
	Fri, 08 Aug 2025 10:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754648007;
	bh=s3BM36TPLO4he8p//ofFrkXqrEKAP/WY1uhVOEof9OM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LUVjSOe5WOjsSbFrFKFnfNFzZzJYwOZxe4kZA9Gr03h1ZD3ZtlnQiSA5OMYHqapam
	 Agis8MsjqiRfpGSquVJ4xbkr36qxfCEZPnVZe3flxpRZM7VjAbkK3qXqiDMqWs5M3q
	 FiyHAKQn3SCSBYDOwN5b+7gm8Xrs5rh8wCT1cxNPpIf8DYMYJRmlGHRRJvGFrfJ4B/
	 QbqXFx3cAdRh7gWr/Xl9IpoWi7nf3x8AfTt0obscUx9lp7En0rZSwrS3M5QYCGrzfL
	 KqiI49Dkpe+pMNlTcWScVgKnAi1eMbYa4+JZD8iM1oYS1iwN5ZvMUADoA4QBy1Kms5
	 izWFT0LsphyBQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 069E117E1322;
	Fri,  8 Aug 2025 12:13:26 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:16 +0200
Subject: [PATCH v10 06/10] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-6-21ea82eec1f6@collabora.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=1180;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=WCs5up/nLCv/PFqKtFYLxciy/pVVBfJhFHTlCQDh0VE=;
 b=JR03wGNtxVt1b7sWoZEQaCW/HE0g3poxLjeRNlW+WL0MbQWm9qli/Bn7bxtdQZDFlGsydIex/
 tPy4IIwCnk1Aao60Kr4Rvts2+8drxYXg9jDGSyK5YW3mjzw4mM2Dg5T
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031329_339696_259EC28A 
X-CRM114-Status: UNSURE (   9.92  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 989479fdfe40952762a1b63797bf602b520dcac5..3b589706d61b1e0e4aa66d0c81253b8aeb70c0d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -412,7 +412,9 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
 

-- 
2.50.1


