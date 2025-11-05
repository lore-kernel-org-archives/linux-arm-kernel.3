Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F878CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGHvmclXM9H1P2h0/NKYUnu6Tdto8R0Fejc6gXiCl9U=; b=f/zu3D9+A9eZYqis7Bhvf+sYH0
	9vi9WfvSbmTjMbTdkM6huAzq41KxGQx2853L7SpiZzCZjB5VqlDh1CUV3Mq+FqtZqJrTJHkGIsjey
	ouYvIwHIgKz6qWPFdnvzI2/4z0mAONaX+WcpAle52BOmIjN+ta1cO0h4NvVIwIOlZVCMaJf2agDlq
	Ou6hIhYyxkZLeYgSZgRlKC1efLVhtg8DiX1gS0Jxlk2a8uAaL0FJr/vrr8J3SFxU59iGwo207EK17
	2BNR8xiTU8fWsiD/EWwrxP6XOb1YDebsqWyxd9bnkj8Hu5s25+bbF9yFwyUCRChM3CV7G0yqmEFmo
	dlX0AFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWu-0000000EKDs-1GgF;
	Wed, 05 Nov 2025 19:50:52 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWr-0000000EKBY-1ebd;
	Wed, 05 Nov 2025 19:50:50 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 0F7CF3FE64;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGHvmclXM9H1P2h0/NKYUnu6Tdto8R0Fejc6gXiCl9U=;
	b=PvthaO8xcw9IhbK8S4BV8rxbncbqKRxoLxJdRfXb9z3+wIUopkR+ur8DFq+DsYWbBH6qRz
	NtvSjzoCdXwmf+EPLsWhjUJdYleg/9xrBlBbJnB+7tr16OvZh1G42I7Rve6M/BqtAjjtUm
	FBxCLbqJSI82mBA94c/lOC0fhWvghjg=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C9147122700;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
Date: Wed,  5 Nov 2025 20:50:01 +0100
Message-ID: <20251105195007.199229-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_115049_807156_67878376 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
index 26dfe7e7735a..1f31b520cb43 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
@@ -61,6 +61,11 @@ required:
   - "#gpio-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins$':
     type: object
     additionalProperties: false
-- 
2.43.0


