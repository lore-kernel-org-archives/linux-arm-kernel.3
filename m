Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqqbkSKoaMCuEKTP1rjiw3CAvuLOaY9tTvIMgKUSf3A=; b=2oarw74K+Q+ru2DGqm/buvLfOj
	gOM6ud7X9FlLhi4VdNPS3PB+q0TFLLf8k+SE5JmgWrYnkyAHC23M6+c+CFSqWlcwKjJNVZH0ebOP8
	yTIbajOS0XI+m6o4nP3kLWNJPookk6pVhxNSTbhSLiMuzM6Bltp/EaeP3YyxvEQOwfuO2M39ygAfP
	KpumSykEiookzSZ9yRBUGt5Q4ny7y+717wravCbmucnOyoGi12DaYNgIYOLoptm2JuVti7DfMD1yo
	KCV3oJ5ixf9PiBeHXXoBDMKC26kx6MR+uV4H4dGj4HnHLRP52OcZGQx4RhT5ScsjChsaq8BOU7MX5
	+bxVrUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whleK-00000001s1j-3sGY;
	Thu, 09 Jul 2026 10:06:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whleF-00000001rxR-1eMO;
	Thu, 09 Jul 2026 10:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783591584;
	bh=kHVv2nCdsp0f/QR38D6tcCGOazDnOTOs2KSvBo2SWnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZMgz7gSQL13MyjadStvm3AWiozi59NfL+LA23wPfe0XW8t0cI6BBW19ioiZYjAkh
	 JVo6zdT+Eif1fpW0uzLJGhY6ZUHQhDYxx5LdhOTxaIE5nqg9WTEANY90/7WERYCXL1
	 dnvjN2AwM4N1FnZ3m7AU+iPc3juO8ebwnFw6M9Efxpl1qIjA9fpH0UxchnoTIT5RZL
	 XTjYTQqY8iZfPipraP00x/FWLQViALOzyQIZS09Ooi26Ml7A06OSwaC7q70ecRTHV6
	 fF//IjIhnBvKLBsFOA2f6S0KCwiSPbvfqF9Hm7hXRGAcinIEetyfmxz2bYR4oFpobM
	 ycB4x4KbL1W0w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1072617E0CDE;
	Thu, 09 Jul 2026 12:06:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 02/11] dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
Date: Thu,  9 Jul 2026 12:06:08 +0200
Message-ID: <20260709100617.42583-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_030627_657326_F6B4B27F 
X-CRM114-Status: UNSURE (   8.99  )
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

Add a new compatible for the Embedded DisplayPort IP found in the
MT8196 SoC.

This IP is compatible with the previous ones, but not fully.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 980f76667ada..3a752a99949a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -25,6 +25,7 @@ properties:
       - mediatek,mt8188-edp-tx
       - mediatek,mt8195-dp-tx
       - mediatek,mt8195-edp-tx
+      - mediatek,mt8196-edp-tx
 
   reg:
     maxItems: 1
-- 
2.54.0


