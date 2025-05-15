Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EACC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrIQKKHgeQgSczkW1c1eDj0k0JZEWEO5zfaWRxOz31I=; b=4RhM93l2C1Zhr9JPOPpbOiav3P
	ODdCvwF6A8nrPOCJ7DzSQ4FWXomrHS09JysegUbJaPAo/1lkMMc0tgseVSIfyzE0Cvd1blyfgTafW
	85naaaKuq2F58dwLgJBlQFvIVH2MAUDTRtA4VpHcyxyBWo98z0gtTu3e/Mje+LM6yFU0NO1SUS9E9
	oCanvT+pJ/eHnPgELbp5BOSu/tdgRQG6oAd8iP3zHEMlBNd3ozneJiwR82HBVzXhJE/Ska8u+fpH0
	NrTM8lqyKQ8LvsaT043Kc3XUmeI0Zn/atYgHHd3Fh6BA6XXBvsTZyJNMtNaY5tOQjviQfU9MKKEs2
	DNEuX3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYlS-00000000kvR-3wtL;
	Thu, 15 May 2025 13:36:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYge-00000000ju8-3o8k;
	Thu, 15 May 2025 13:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315907;
	bh=hOoucmqjAQsX1VnPMKLKkiL8fmtNljrRShY1zXOVkLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CjjPGbwSPRkPNMHQCaBbdgwRMVp2yOdmNZ8QAKHNGy/oybxy0TPhezCT+KHc2LtfB
	 gKbfjOL/ck6YNdiE9TGz9A+xf3LYQDH66V3A920xr0S67Zyed3tGZb5KmNp6Hs4fNY
	 CpvmWYIXS1ZdD7JcOsVqKQA7JHza8aaTUDwSSDMTn5wL4qNQq10znjH/6E9fNPb/og
	 Aie75sZVt2VUKtNVy7Amqzk9CyrzKCJYUyX8t1iXs7YxZNpL1hNORKtaABaYZOZ8pU
	 MisLiCzrtD32tVnnJpIetln6PpPFWIDy9Ea7WzpgmtT8KHz6mAtU/5VpN1s4m2XVWQ
	 oGVXcydqUFnSg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C1A717E05F0;
	Thu, 15 May 2025 15:31:46 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:43 +0200
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
In-Reply-To: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_063149_104191_150097F5 
X-CRM114-Status: UNSURE (   9.02  )
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

The '#reset-cells' property is required for some of the MT8188
clock controllers, but not listed as a valid property.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -52,6 +52,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg

-- 
2.49.0


