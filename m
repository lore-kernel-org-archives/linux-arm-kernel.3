Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5664FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGyG1xBrnbtl27Jc2+9ofen3qKDirECTBevHFHFWqig=; b=R9VoNPtLcE6oQSn9G6Pax9SJYj
	8ZIBFONS9Y1SAupK0hkU59MLD3C4X5a7l7CHxA2kgoemb/UrU7GSmGxF8UhTkm1BejA5Wl3YsJyF0
	jlTO6MQW1LFZ83Tbu6/x82L/tz78en3sLEybjfQjS1mpNN93jTjNMxfu6P0UUkfsRSyr4D2sHHq2q
	KBFYSAIn6yzbhKSEgnQ/qX0rWyOh5Ioqb7EYb1Rz3Xwcm2rTkCBrg2DawlAXKk47R9qnHltbl1sXp
	WlzqjzTEyOLQyBjSsy+y11gQ6gIG3wz/Yvt5XdM/f0yU4Z9v1g388UFkpqYltFc9zqVIRMUrehWOf
	y683E3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ok2-00000005eFr-24hH;
	Tue, 15 Sep 2026 08:42:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Oju-00000005e8O-2LL7;
	Tue, 15 Sep 2026 08:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461724;
	bh=qyYNtF6Szv6pA6AN5mfvaTW4lHJbi9aApiqokgMWKXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+ukPA2w+O/JtIcUTUZ5KiiWlpnmHXb5do22l6ZTC0C2NGJXYKj9RzAn359prDzdF
	 f5YsnfXuEuZNPoHQQN5rpRXbIAB09ZaXeVdkOMCxd0KKWR4USiOB0CzAI0PZir/ewn
	 x5VANATbcIb4cIMdoelSqRYy9r4hopLVRQSr7iRCYcHOMLrkRAFjXpa3xG/Usgi8gK
	 6GGPd3hlq/u4UDOKINxV6FsjzeNHk19UA9xbqREs28l8Z3TlxPHwr/seAeQ5QiZ6JT
	 ATGnjLgdZDIS7CLBPiiOAVA15WGAxveK5BvL0q+cXoyamb+oteWIDLkmSxiC2AhqIe
	 3CroR9g7hrMVg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2394517E1168;
	Tue, 15 Sep 2026 10:42:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 04/13] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Tue, 15 Sep 2026 10:41:39 +0200
Message-ID: <20260915084148.11385-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_014206_735843_3A848432 
X-CRM114-Status: GOOD (  12.25  )
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

When binding the dsi component, the .bind() callback initializes
the encoder, and then will optionally trigger resets.

Should that last operation fail, binding will as well fail but
the encoder is never removed from the DRM encoder list and if
the driver gets removed afterwards, this may crash the kernel
because of an use-after-free condition.

In order to avoid that, cleanup the encoder upon reset failure.

Fixes: 605c83753d97 ("drm/mediatek: mtk_dsi: Reset the dsi0 hardware")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 97b8a91874f5..0b167b4411e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1095,7 +1095,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret) {
+		drm_encoder_cleanup(&dsi->encoder);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.55.0


