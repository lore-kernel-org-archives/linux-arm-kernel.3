Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044AFC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3WGzJ2zaL66SOjEsX+QXPJDpsQHzP9m3zoz5Wl8nC4=; b=ieQUla72jil9EcFOlfZWSXeXAC
	Kf2ozSMoaY8oRM0RtGGQ1pcSvPHs6Qu4ucec3rntiDCHYLhdzIFMVw04k8gLi8D18kRpjvzYQdJkz
	n04U7iwy0D8pa4kNsvKsr9zsPtm3/2Qsc5UHPYsFOU5Aul1tSpQg5yAuj1asvSw/0z5/nhwia3sdG
	IPtdQfxcZrt0WH8leBPH7A52HQgI/N81jgso/h4hzc0IHmM2ED7GA5KkTI8YURvk7nIb8d6LS4l8u
	f2l/8nsNFMDNgKlHmAQ/IDahT3xfXXimMtE8FzrGRC3e1QudwNoUQB7Nk36+r8wC1l6H1L5X9LE5B
	oInfrpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi53-000000032DJ-3aVR;
	Mon, 23 Jun 2025 14:23:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrZ-00000002atx-0eZj;
	Mon, 23 Jun 2025 12:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680083;
	bh=vL7vsZnHZXjhrnXm1+pOHRiqQJaLYZAMfyW8Ay4L6Ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+nrE6pTnZW3Qec8oxp/sYkd8N6AQksyP99/7xe66jIVWPB6+vD3CPyw5zJ+LCMWC
	 2DpRHq+OVAJs1OdyJBDq+d1HjXTPTR8mOaFslfe3q4W8JbFdVoU1SVUhZIRV3hlAYt
	 XnFF/Cm30MTtDQeeQpIKAEs9HmT3jr8bjy2SqLIaXCdBwSQlhaW8sT+LSBgiCtQTh6
	 ogDiGa0qt3mP4A+urCPeVammDnVLwCHbuXxhdjcGHuai9yv+HDLSH9LVLQoWk0Th2d
	 TUjDOFFDxn3B9iy7blvaNEEuD3GDwarTsn6qTb1Yi5Cswb32+N86J4069+GAqzTzjv
	 He0XDdaljhutA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 374A017E10D5;
	Mon, 23 Jun 2025 14:01:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ukleinek@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	john@phrozen.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] dt-bindings: pwm: mediatek,mt2712-pwm: Add support for MT6991/MT8196
Date: Mon, 23 Jun 2025 14:01:16 +0200
Message-ID: <20250623120118.109170-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
References: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050125_343548_AE6EB135 
X-CRM114-Status: UNSURE (   8.48  )
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

Add compatible strings for the MediaTek Dimensity 9400 MT6991 and
for the MT8196 Chromebook SoC, having the same PWM IP v3.0.2.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
index d515c09e1021..fc31758a40b0 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - mediatek,mt2712-pwm
           - mediatek,mt6795-pwm
+          - mediatek,mt6991-pwm
           - mediatek,mt7622-pwm
           - mediatek,mt7623-pwm
           - mediatek,mt7628-pwm
@@ -32,6 +33,10 @@ properties:
           - enum:
               - mediatek,mt8195-pwm
           - const: mediatek,mt8183-pwm
+      - items:
+          - enum:
+              - mediatek,mt8196-pwm
+          - const: mediatek,mt6991-pwm
 
   reg:
     maxItems: 1
-- 
2.49.0


