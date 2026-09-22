Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E7EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWi2Axh0FHWZnYR9ulxCow+anQdMaqgalXbk9rXUqks=; b=EO+7PcmBIETPOlooNCPvun63oc
	RcBdZe1NvCt423+lQuaQR1uaTBwDU1PkgYpEjgxAGZKZT+PcB5e9BL/nZtUbzCiNQ1uoJQAKIZYvv
	GsN/WGyB7ogLvDHYiM6HqTLA/B/G3A8XEed9bRj8b0+/Qf++2/mRi2U8pA6ZFJkWOzAUPYZ1kpGir
	mZ8kOlHlP56PiPhyhpHC62du0V3EVlk+Dm+/rLJy2ipdmzEbUUMgyaXA9ZrpBXss8fC/OcW0+tNMt
	MydLoefij7D3/ICOFjyH6tqwnv/9KlPOPjyvGBQmBQmxA5y9H1dN00GUQJ7cmVw8yggRWeKJdSTHR
	f13y7bfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98uy-00000006fnI-3xUO;
	Tue, 22 Sep 2026 22:24:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98uy-00000006fn9-0NpI;
	Tue, 22 Sep 2026 22:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3227440C42;
	Tue, 22 Sep 2026 22:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EEB1F000FF;
	Tue, 22 Sep 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790115891;
	bh=vWi2Axh0FHWZnYR9ulxCow+anQdMaqgalXbk9rXUqks=;
	h=From:To:Cc:Subject:Date;
	b=cjCKBqcKEru9zM97pqeXmgjpuIsJTYOlXU65lbCzviwU1uTCQc7/jP5GAGwVB8bC3
	 bAIdF0wadiIt0JD/TxosSvXCWr9Whe6gR35sjbdMUGcXYb5w48YTA1eC9WXRva11H/
	 cqrhIh6itFZQlEK/IePJv8OzC1ogosWKzq0KXyXGdcAFPwNgDB3B3mP4DHYUQk52eb
	 56ZMiCgnM3aN1iAVCpEznT0im7FSJv1scneOxejhud4uCnr/3PEpA5l1d9caLkTxgp
	 TC113L05PJvZN8TUmOE1ja4cEkgoSNn97JzZLn8IuKqKPH5qSA2ojJ93x92ZILsL9K
	 CUM0Xnq6unQRA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: Fix MT6797 pin nodes
Date: Tue, 22 Sep 2026 17:24:39 -0500
Message-ID: <20260922222439.1682749-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Allow MT6797 pinctrl state nodes named *-pins directly under the
pinctrl controller. The existing mt6797.dtsi uses nodes such as
i2c0-pins and uart0-pins, each with pins-* child nodes, while the
conversion only allowed numbered state nodes such as foo-0.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f4bab7a132d3..dba2dec15477 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '(-pins|-[0-9]+)$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '.*pins.*':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
-- 
2.53.0


