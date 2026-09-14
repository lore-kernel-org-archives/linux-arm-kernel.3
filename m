Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1241EC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSAGX47Hy8b0egmNyWcSXVJm5ulCSGW/EmuhPogSmCo=; b=oWvk/OX2xx8nlsEHI2rzKqMTOV
	j6Ni6/0Mjxqe4Pc5zsL7gpOSusZEc5/uzp4IZvDjqoQrUc5YadJaAFJSC7IuBZ/KD3TSX057Fb0ov
	bjicDZPTykQXjxw/MWurvqFHXfIO+nDUJKoDD1yIRWLj2p12yoc81WW7y9r5ga5bSDg4MS0zMEhea
	yExjHipTsEQtNdv7cGtKGIf5xSJPvI7mJtIyvXAbQRpDhDF2Gs8lPU4JJzeKxZRq0DtYlM6VXnHQX
	r+zXvyZN04tBdgLBJK534875JG5+46NWCcWiQeRVPYc+F9N4+j5K8YI5WSoGo6UYO1u2BYFusxAVp
	dC5TrAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65KN-00000003QdI-1s4O;
	Mon, 14 Sep 2026 11:58:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65KE-00000003QV1-2pEo;
	Mon, 14 Sep 2026 11:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387096;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iB+cKsAuEE942tibzXuLxQEw1CuUh4KiU739eN0gmcDP7/WLt1AbHkf1XEFYRjbri
	 MbVdfVZVKaXE4gXvCDVYd9xHwmz5b0CfpQNTkh6IKGzMUuliD7Awuip+Xx9X34+SRi
	 kqCe/Gb8p8eNO7KU5tBpcecQ/1Cu/FM180KeLrENRiHYVDLWY7QMP6TFRju585SR7q
	 OldCYRAfpaivVOBs6Ss58pLJY2PV2urwmMupir+2GFMHD8FzDXopf2+DvKm364/6fQ
	 YpgZ5hH2g7aPGiQe7yEAJz7hije4O85gjbTf+8Lmsv6/Ahn1GxMspEbXomzShJGkfr
	 4zH7h9e7s9O4g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C93C817E091A;
	Mon, 14 Sep 2026 13:58:15 +0200 (CEST)
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
Subject: [PATCH v7 01/13] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Mon, 14 Sep 2026 13:58:00 +0200
Message-ID: <20260914115812.22751-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_045819_080867_24CD237D 
X-CRM114-Status: UNSURE (   9.47  )
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.55.0


