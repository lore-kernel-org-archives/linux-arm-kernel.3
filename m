Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C154C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHykHU7ZktkDGrunlHbRMFoc/P98DxI8CLqC90mI5aA=; b=CFssYPKXjnXwh/jQ4Oe/vlVcu/
	caj86R3IEeYng4XSs0XftWPxzPJVk+dFrX0XUg0WpoEy+Of12fIo7LfeiTo2q4R9TIgu7rLbbvL1q
	fhc8RSlq9dWDCLBUmCzQxCYU3b48qOKFN5noprZvoyJorBTd5Mi90ofto59BwqadYXAZVtF03fsj7
	6SpWSbPqontfwLegfeAHnCdbSZsJRK8WUn+B1MmQRKBLDwUhEV4WwV8UyTQVrMDEjGf+Vji3IHgQa
	UjLfdjngqSmJPGmbPnjqpT3zIysN/ET7ZJMpi/rZlCbbtGPSJ0M8ZcHdh0UUm4vOYOL/q3j3ZHGuU
	kQUfyhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKXa-00000002aMH-1Uas;
	Fri, 08 Aug 2025 10:41:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK6M-00000002XBo-198D;
	Fri, 08 Aug 2025 10:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754648008;
	bh=EGx3yE8rfdW+AiowBjEmyHsbvFWWmYRTHvFW44bdB6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYSgl12YrPQWvkntXNq/enVIK8f5Ogoig3DPvtuOTwwp6RafopzJJz4c3hr2yVeKE
	 EenCETbyhW3flpLC+eKI4o9wu+LMBa/AjRg8vM3231Zp5egTfnbmIjPeWMi0AQ+I0x
	 xJVJxuHPcsbvzGJrMDeafX1oiPRXpZzg8mdbvi/TSdEctSYIJnUDMzZJahn/xXROu7
	 y8mR+8SJYlwA1sZYrAJ+cEK7KFcu5ttbu/EBdyLC3pp81ooYX2G/DGhXxQFHDFkqHc
	 sFyieTzBszZw1+mdGNCiLjqZeeDpi0pdJsVsjBTG8OYv/hMcw7LAeKwsH9byPsafMz
	 r2oRg58RbkStA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B084217E132A;
	Fri,  8 Aug 2025 12:13:27 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:17 +0200
Subject: [PATCH v10 07/10] drm/mediatek: mtk_hdmi_common: Add OP_HDMI if
 helper funcs assigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-7-21ea82eec1f6@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=1902;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VFgIkvVzJkA3pH1XUiXTo9X/HXrtyxZhRMF4j8V/Alg=;
 b=sqyNimNTio89XgmkCZ4TDb3/csaRfDrYegf5ikdYGugP1m5WGZZS4gkK5UlR4Ux+skPTuwIqw
 HEZr9kQyaavDWlRWFB+5OG0YiOt2gozRAz0A4ds1Nq7Bkeah2au5Jhb
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031330_488168_A37A50FC 
X-CRM114-Status: GOOD (  11.76  )
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

In preparation for adding the HDMI TX v2 driver, and to allow
a future modernization of the HDMI v1 one, perform changes
that enable the usage of the HDMI Helpers provided by DRM.

Check if the HDMI driver provides the function pointers to
hdmi_{clear,write}_infoframe used by the HDMI Helper API and,
if present, add DRM_BRIDGE_OP_HDMI to the drm_bridge ops,
enabling the drm API to register the bridge as HDMI and to use
the HDMI Helper functions.

If the hdmi_{write,clear}_infoframe pointers are not assigned,
vendor and product strings and HDMI helpers will not be used,
hence this commit brings no functional changes to drivers that
have not been refactored to use the new helpers.

This also means that, in the current state, there is effectively
no functional change to mtk_hdmi and its other components.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 3b589706d61b1e0e4aa66d0c81253b8aeb70c0d3..be63f33d39bfd4625a5f1edd83c873cc20ac0018 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -413,6 +413,10 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 
+	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";

-- 
2.50.1


