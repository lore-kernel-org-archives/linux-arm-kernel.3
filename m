Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF996C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QgwqQZ3QROyBRFNTAFsbt6yfU+pRmwzGNmxgruULT4=; b=1lOLObKtyHl49AAQ8YTIbOjD0P
	XpFUej9FI+U7zqMr1Kk05uO4XNqCeRUcN20zAuprRo9PpZ4pfHoqupFk5CdW0IK2yVnDZRrbZEFxg
	hDlwQtk59wUKT5WEQDGcPTlUSnqLGzGYvEwB0BSArErJrHpOQ8Z1yTAO3JaXEbRqRTFeLjTaaEMGb
	jmfw6ImfB16Es8cEz7lVL9LtYOnBZWCFxIsyB+0iDSeubhyYIzRI43WR4sh9sJOiIuKwOpX34rsuG
	HfIrcrmXDPuSCQbioDwBafe7+vYee0yFOc8NHsS3Exc9qfxeRW+EIywdzmJdNCg5AyVIeqwP+LZ7e
	vVOaDHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3sX-00000005F8L-09NO;
	Mon, 17 Feb 2025 16:21:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3N1-000000057wt-1xaQ;
	Mon, 17 Feb 2025 15:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807358;
	bh=YnISh4jCKj5RvCRPO4FOY64fZFaH/88c95wVwwI/RPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LyHPu8UpBvUa4S921UrcsdHfhh8rtVgaACU3H1TE81dR2UuDYXCOZtr8q+7r0Wbdk
	 urP5n6IfYUz3lPMGpmH4s/krvm4N4KmIcJLvm0cYVS89Xzj/njscMkAYUNAipbW0xH
	 nA1DwBK/Xgw/AN9eTPYF9PiTerHa03Ma+mzM6wLzZB6TEPJSNeXM1lAPGXVrZb9i9h
	 m4TsNRXp0cpwnyaPK78VpYKz/Hf2ogK5iHMyPUbPs76ZMp1bp6xzcaF1TwaqwDyxh2
	 JYctiOT2FyB+pfCT6LccCGWLW22AqfnAODMj3aKETxTwUUyUiCiRxYIqaT54pVr12T
	 QBDemsG/bEO7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B36B817E0F86;
	Mon, 17 Feb 2025 16:49:16 +0100 (CET)
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
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 01/43] dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
Date: Mon, 17 Feb 2025 16:47:54 +0100
Message-ID: <20250217154836.108895-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074919_653589_8FA8C91F 
X-CRM114-Status: UNSURE (   8.19  )
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
2.48.1


