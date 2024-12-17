Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E4E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msvJJ4wRx8H5IeuqyEGZkDnbdyoTil943JpxDyL/uzw=; b=CPyTIroJ7H/WMe6wEzIiChPr+H
	B1t/06B968GlyWrCmQXQbp4dyIFyWhsV3vcHKe72d169DW30hl2vrzZe0jJ0RwX3ABzdpVjrzEAwf
	LpnK8GVtWlGZyi2Le1XsY6/Np0Y1QEO5Wk9NdgcMkW4VxZOPaHIDbstmjSnRxN2QzqP+nmGHO+CgY
	mDvYTsJOlmI2CWzhiOVtX5nKvtYnbLLXWBcQDiBMcQIjVaZ3FlETAlc1ykz5Ihk/wQTnrb5oGvzjC
	XVHETqzPTXvgQ73kRBEeL/Ju7Ilxs0x7Jn0JaRNgYNJWibGwvr/d44IDJx6v70ejho2jO7WBPikwq
	auo/43aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZku-0000000E0VE-2DqP;
	Tue, 17 Dec 2024 15:45:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZjm-0000000DzmN-1Cw2;
	Tue, 17 Dec 2024 15:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450232;
	bh=nqNrX/533sU5V6zHe8xW3RLPoA1ipAtEcOiVjJO1rGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVVx5gTgUIpE/fWwd3x13UKsvPPwUW/u3awgNHQUe8UcLnHbfxchipSA2TFt49vtG
	 HbB8Lqii85yJ+uTKOxxH0z2Tto4aAeuT1i3cs7yur238z+vavt4T6ro6+zvezvJLXV
	 jczdEG/Z2ln7IIpo4E7hot0GXRMKQuicldDb6zmQVF8AijsY5smlf/8pyuVBMOgWI5
	 OyKrFYDQaxewjhrBHssCGnxXcs7GMRdNavZ6abkEB5tJh4Bo1crfkjve+dA4AAYN7b
	 RSpxL18mf9TjyLNYsgS5CJ5AOZ/GExGlQRoE+LgSaQx62yNFjg5H4Ygh5i2WtCljOC
	 S4rOMjUQXq/uw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D74C417E3788;
	Tue, 17 Dec 2024 16:43:50 +0100 (CET)
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
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/33] dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
Date: Tue, 17 Dec 2024 16:43:13 +0100
Message-ID: <20241217154345.276919-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074355_291486_3BD2F130 
X-CRM114-Status: UNSURE (   8.41  )
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

Add compatibles for the Digital Parallel Interface (DPI) block
found in the MT8195 and MT8188 SoCs: inside of the chip, this one
is directly connected to the HDMI block.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..5670715efa5c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8195-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi
@@ -35,6 +36,10 @@ properties:
           - enum:
               - mediatek,mt8365-dpi
           - const: mediatek,mt8192-dpi
+      - items:
+          - enum:
+              - mediatek,mt8188-dpi
+          - const: mediatek,mt8195-dpi
 
   reg:
     maxItems: 1
-- 
2.47.0


