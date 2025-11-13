Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910D3CD6E48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTo4NiLOqxrlkui47pxmWMqp2NYL5bevodQO1aurAOM=; b=Yp5nihsMqj+BtCIz0MQ3waw8QP
	YxNDyAXKTyfoz2wVCkJUJlVKS1rkTnRs4f6n8w94R/tJLlktsSSzIPOrrmVA8QzWbYN8LnCi+Wu+y
	xu1mhWH2ZjwPXX9pdk1FRmPYsFackcnu5K2G3z+7Y58pqpMi7xZ2qTueEzZ3PZTI2kA/p1yYWkA+x
	tOqpE9AlzDyf38WBvTArG2hwnNUcXKko28hvZkE1sbdB/ZCVTBlNB7PyNzFjIhdW4iIjDSV88NlG5
	3GVt/UOThKTzHBgs2qwBAOf1tSRd/TV6eeTQuA0KUrpqM/6N57uikDqRlei532+Ev0b1mpfc88pj6
	23pMn1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLe-0000000ARbl-11Fx;
	Thu, 13 Nov 2025 12:22:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLb-0000000ARZK-1UDN;
	Thu, 13 Nov 2025 12:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036559;
	bh=TbcA0pAYmyWmxfp86PUKSTB7vNHLm5tB2SOEjyV+PpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pif3DHdGQ2W2wihUPxEsLj0clgNC5bMmqwVN6bV/BWjSkzfFpXIMCAzAycDerydIn
	 K7DZAjROsCtR4afAGOi3gcx5EFcj81FTlqr5ZLYI5T/qoMlif6oLWaim+c8aIvpy2h
	 tNmMwOHW6CQHyoYgOnpGI/I5NyXDjGVP3Kq720X1ufyduFU1YEkUuJj4MloAuOQbfA
	 IXwcKwQBer8la4vAA2Uvt6y6oZ1g3sTI7nuJILIN+DSkPTH94thF4MVH/muUmyf+vG
	 rR1Vbn5G98qhqxKtAcH1ym1NUNrGVKByw/efVgA7NxV+amFQg1GS7blFtTCOXzKz3E
	 295yLHyRc4/2Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AB1A17E127F;
	Thu, 13 Nov 2025 13:22:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/8] dt-bindings: dma: mediatek,uart-dma: Allow MT6795 single compatible
Date: Thu, 13 Nov 2025 13:22:22 +0100
Message-ID: <20251113122229.23998-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042243_540949_4FBBCE64 
X-CRM114-Status: GOOD (  11.31  )
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

While it is true that this SoC is compatible with the MT6577 APDMA
IP, that is valid only when the IP is used in 32-bits addressing
mode, and, by the way there is no good reason to do so.

Since the APDMA IP in MT6795 supports 33 bits addressing, this
means that it is a newer revision compared to the one found in
MT6577, hence only partially compatible with it.

Allow nodes to specify "mediatek,mt6795-uart-dma" as their only
compatible in the case of MT6795; this is done in lieu of the fact
that there are other SoCs integrating the same version of this IP
as MT6795, and those will eventually get their own compatible that
expresses full compatibility with this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index dab468a88942..10fc92b60de5 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt6577-uart-dma
       - enum:
           - mediatek,mt6577-uart-dma
+          - mediatek,mt6795-uart-dma
 
   reg:
     minItems: 1
-- 
2.51.1


