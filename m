Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FE0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlTh9MH3lS96OAjKE4ZUfV8CX9TzV9MjSsC9UeBBPjM=; b=TqPdFuQi+xC/oaOdATlU9gkIve
	XvhOCe3h+ha+0T6V+s3Yd3Q1HAndhJuTBnoJGOgdyDikKYtJDbb6sMVaF/4y8Mk6TDY8iNETU3QSw
	/P7GOa6/u4Ov9d0FYU61LVdlUT+x86pVZLW34JJzb4SJhr6ccP+lSDI5vr2yCr6EosOPueUU24PKQ
	2+i2vSIGbnf+3t94gW3o9wpNOjQKuz+p2xuCDxLkC0slDXgIkY2ePulLrknS1GZ5Xo/g4N5pPDF+V
	oahwqgzFZt8yBjvSsOOnyxndUHGjoI9pKyhCUMYVoZKTdGC4+o+fCFTRr+4u+/gVHpmD7WUkQIgUU
	cZTF+2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwR3-00000003jc0-3GoY;
	Fri, 16 May 2025 14:53:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvnh-00000003d7g-0HGU;
	Fri, 16 May 2025 14:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404754;
	bh=tASrtAWlxRnbRRu8X1Omf+YcuIOtQV8Chp1OjDdP3Jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YX+H/h0Cz/cb7Pt6kxO0uyXrguWbs+zzB//6WAmD4pu1M1IAYm0PoJxdFtVtpOH6x
	 enXQrGiwzQr24VizDpfOWszxxw81D6H+meYmI+8OdSKW+F9Ay74//2tyq27ztR6enz
	 EY+vPzTD6f4bWu7fU6fLD/9z0xofJu2iwx8htiww66BxyqfqYCzYQjLg0Fd5apqW+4
	 0JluDARpO3YWsR2sc+hPAZ5hY35dtg/ZaM2vHP8m/RFIABqbZjvi2espQCnb4OQhH8
	 myLuYeJzLwEaefb8ufJ2CJHgmsap9GcKdZnQHhpGjsQtANWzOMvtViKz9rFOQf0z8E
	 9YxdNn0WrvwLg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600C8F85Cf092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF38417E049F;
	Fri, 16 May 2025 16:12:33 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 16 May 2025 16:12:13 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
In-Reply-To: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
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
X-CRM114-CacheID: sfid-20250516_071237_278430_ED98C35B 
X-CRM114-Status: UNSURE (   9.17  )
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

The '#reset-cells' property is permitted for some of the MT8188
clock controllers, but not listed as a valid property.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


